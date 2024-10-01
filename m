Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182BA98B8C6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807926.1219659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZey-0000rp-Ml; Tue, 01 Oct 2024 09:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807926.1219659; Tue, 01 Oct 2024 09:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZey-0000pi-KF; Tue, 01 Oct 2024 09:59:12 +0000
Received: by outflank-mailman (input) for mailman id 807926;
 Tue, 01 Oct 2024 09:59:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svZew-0000pc-UT
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:59:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZew-0007qd-5E; Tue, 01 Oct 2024 09:59:10 +0000
Received: from [15.248.2.236] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZev-0008KH-TG; Tue, 01 Oct 2024 09:59:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=jDaGoK8BkK7EgKhZMDc++1g0Km/DRcTRj6IPdmGIrks=; b=GKG3pyt1Sh6+STQd74qZyk3rSV
	DnNswx6yLbysyyXa6sdncWMSJvuvSgiqG2wqYRMApH5EhZubUuYjdgeuqXfw3qD+cCLIT0QWMnQKQ
	io7n6ce//CGBxIKqWFvKjKAUnUP2l6E2U07PeERierCPzATg/5vVqjwaAHxmYJkd74jU=;
Message-ID: <b06a2506-92d0-4bd2-b377-c9d140c0d6ce@xen.org>
Date: Tue, 1 Oct 2024 10:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrei,

On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
> +/*
> + * Generic handler for SCMI-SMC requests, currently only forwarding the
> + * request to FW running at EL3 if it came from Dom0. Is called from the vSMC
> + * layer for SiP SMCs, since SCMI calls are usually provided this way.
> + * Can also be called from `platform_smc()` plat-specific callback.
> + *
> + * Returns true if SMC was handled (regardless of response), false otherwise.
> + */
> +bool scmi_handle_smc(struct cpu_user_regs *regs)
> +{
> +    struct arm_smccc_res res;
> +
> +    /* Only the hardware domain should use SCMI calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_ERR, "SCMI: Unprivileged d%d cannot use SCMI.\n",
> +                current->domain->domain_id);
> +        return false;
> +    }
> +
> +    /* For the moment, forward the SCMI Request to FW running at EL3 */
> +    arm_smccc_1_1_smc(scmi_smc_id,

Actually, shouldn't this be get_user_reg(regs, 0) so we don't rely on 
scmi_handle_smc() to be called only when this is equal to scmi_smc_id?

The other option is to move the check for scmi_smc_id in this function.

Cheers,

-- 
Julien Grall


