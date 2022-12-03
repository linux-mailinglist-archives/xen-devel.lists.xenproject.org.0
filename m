Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD12641947
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 22:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452845.710647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1aKH-0008B8-EZ; Sat, 03 Dec 2022 21:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452845.710647; Sat, 03 Dec 2022 21:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1aKH-00088b-B3; Sat, 03 Dec 2022 21:45:37 +0000
Received: by outflank-mailman (input) for mailman id 452845;
 Sat, 03 Dec 2022 21:45:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1aKF-00088V-RF
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 21:45:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1aKF-0004du-Ir; Sat, 03 Dec 2022 21:45:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1aKF-0005ef-DK; Sat, 03 Dec 2022 21:45:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=X+zmNxaL2BgHSi+LqQl5ikDV6Pwa2nLSP19YJkEfuME=; b=qs2+nV7bNiu9TCFVc2XO50x5TH
	yQSgY1XqBYF2V0iXVp9c6Jx4sBYr7BFOmwL9hXDLLXNfIKH17YlGBLeZ9ufn/CNTLizGqZx/2MfHT
	gYaYTyawizzDzvnsq9iiMsSxFEzwoMWd1JgpCC2ljF5KxyTVh8qAYUEg05ykxd41gtTE=;
Message-ID: <f95d762e-b3da-a931-8cf7-9633fa805607@xen.org>
Date: Sat, 3 Dec 2022 21:45:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <6976a8484515fe02e9c2bd65cfb6a93632a228eb.1669888522.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 09/21] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
In-Reply-To: <6976a8484515fe02e9c2bd65cfb6a93632a228eb.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/12/2022 16:02, Rahul Singh wrote:
> Add support for virtual cmdqueue handling for guests

This commit message is a bit light given the security implication of 
this approach. See some of the questions below.

[...]

> +static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
> +{
> +    struct arm_vsmmu_queue *q = &smmu->cmdq;
> +    struct domain *d = smmu->d;
> +    uint64_t command[CMDQ_ENT_DWORDS];
> +    paddr_t addr;
> +
> +    if ( !smmu_get_cmdq_enabled(smmu->cr[0]) )
> +        return 0;
> +
> +    while ( !queue_empty(q) )
What is the size of the queue and what would happen if the guest fill up 
the queue before triggering a call to arm_vsmmu_handle_cmds()?

> +    {
> +        int ret;
> +
> +        addr = Q_CONS_ENT(q);
> +        ret = access_guest_memory_by_ipa(d, addr, command,
> +                                         sizeof(command), false);
> +        if ( ret )
> +            return ret;
> +
> +        switch ( smmu_cmd_get_command(command[0]) )
> +        {
> +        case CMDQ_OP_CFGI_STE:
> +            break;

It is not clear to me why there is a break here when...

> +        case CMDQ_OP_PREFETCH_CFG:
> +        case CMDQ_OP_CFGI_CD:
> +        case CMDQ_OP_CFGI_CD_ALL:
> +        case CMDQ_OP_CFGI_ALL:
> +        case CMDQ_OP_CMD_SYNC:
> +            break;

... the implementation for those is also empty.

> +        case CMDQ_OP_TLBI_NH_ASID:
> +        case CMDQ_OP_TLBI_NSNH_ALL:
> +        case CMDQ_OP_TLBI_NH_VA:
> +            if ( !iommu_iotlb_flush_all(smmu->d, 1) )
> +                break;

It is not clear to me why you are implementing TLB flush right now but 
not the other.

This call is also a massive hammer (the more if there are multiple 
IOMMUs involved) and I can see this been a way for a guest to abuse the 
vSMMUv3.

What is your end goal with the vSMMUv3, are you going to expose it to 
untrusted environment?

> +        default:
> +            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
> +            dump_smmu_command(command);

This would only be printed in a debug build. However, it is not clear to 
me how a guest would notice that Xen didn't handle the command.

So I think this should be a gprintk() to enable the user to figure out 
in production that something went wrong.

That said, isn't there a way to report error to the guest?

> +            break;
> +        }
> +
> +        if ( ret )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "vSMMUv3: command error %d while handling command\n",
> +                     ret);

Same here. However, ret is so far always 0 until here. It would be 
preferable if this is introduced on the first user.

> +            dump_smmu_command(command);
> +        }
> +        queue_inc_cons(q);
> +    }
> +    return 0;
> +}
> +
>   static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>                                 register_t r, void *priv)
>   {
> @@ -103,9 +196,15 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>           break;
>   
>       case VREG32(ARM_SMMU_CMDQ_PROD):
> +        spin_lock(&smmu->cmd_queue_lock);
The amount of work done with the spin_lock() taken looks quite large. 
This means a guest with N vCPUs could easily block N pCPUs for several 
seconds.

How do you plan to address this?

Cheers,

-- 
Julien Grall

