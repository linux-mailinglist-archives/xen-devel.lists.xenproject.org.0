Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECEF511BE7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315171.533584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjeO-00035t-Uv; Wed, 27 Apr 2022 15:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315171.533584; Wed, 27 Apr 2022 15:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjeO-000344-RV; Wed, 27 Apr 2022 15:32:20 +0000
Received: by outflank-mailman (input) for mailman id 315171;
 Wed, 27 Apr 2022 15:32:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njjeO-00033y-7f
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:32:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njjeN-0000LV-Sd; Wed, 27 Apr 2022 15:32:19 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njjeN-0005sk-M0; Wed, 27 Apr 2022 15:32:19 +0000
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
	bh=037fCIaP1ub+eMYyOgxD8HkSmOOPv0L7+e7AyyzdqXQ=; b=ze9phzY/3fhJiDyqUBOQQKumP1
	PIQZ8j8BySNFWCtfDUJJUnUpmQmEGm69hbYCfKxfHSdXkIdXSrfl04azPgYEjt+vCkOmrPjwjnIuT
	nZGcHA1p1J5134+tPtbptQwwb/wKe04n9GKtDDRgPagHGzMLGMbJCXRDpPB/VzG30e/o=;
Message-ID: <572aee32-a533-6124-4a0b-546085da3cff@xen.org>
Date: Wed, 27 Apr 2022 16:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v12] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org, stefanos@xilinx.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220324133705.37882-1-ayankuma@xilinx.com>
 <2a287b59-9ff2-6bd0-fa42-d95333fc1554@xen.org>
 <alpine.DEB.2.22.394.2204181402070.915916@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204181402070.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/04/2022 22:02, Stefano Stabellini wrote:
> On Fri, 1 Apr 2022, Julien Grall wrote:
>> On 24/03/2022 13:37, Ayan Kumar Halder wrote:
>>>        /*
>>>         * At this point, we know that the instruction is either valid or has
>>> been
>>>         * decoded successfully. Thus, Xen should be allowed to execute the
>>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>>> index 54167aebcb..87a6240f2a 100644
>>> --- a/xen/arch/arm/ioreq.c
>>> +++ b/xen/arch/arm/ioreq.c
>>> @@ -47,7 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>>                                 struct vcpu *v, mmio_info_t *info)
>>>    {
>>>        struct vcpu_io *vio = &v->io;
>>> -    struct instr_details instr = info->dabt_instr;
>>> +    const struct instr_details instr = info->dabt_instr;
>>>        struct hsr_dabt dabt = info->dabt;
>>>        ioreq_t p = {
>>>            .type = IOREQ_TYPE_COPY,
>>> @@ -62,7 +62,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>>             * memory access. So for now, we can safely always set to 0.
>>>             */
>>>            .df = 0,
>>> -        .data = get_user_reg(regs, info->dabt.reg),
>>>            .state = STATE_IOREQ_READY,
>>>        };
>>>        struct ioreq_server *s = NULL;
>>> @@ -74,12 +73,23 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>>            return IO_ABORT;
>>>        }
>>>    +    if ( instr.state == INSTR_CACHE )
>>> +        p.size = dcache_line_bytes;
>> I think it would be best to only set the p.size when instr.state !=
>> INSTR_CACHE in the else here.
>>
>> I can do that on commit. I will also give a chance to Stefano to reply.
> 
> The patch looks OK to me, please go ahead and make the change on
> commit.

I have commited with my reviewed-by tag after folding the following diff:

For the record, I folded this diff:

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 87a6240f2aa9..bdd536e873e5 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -52,7 +52,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
      ioreq_t p = {
          .type = IOREQ_TYPE_COPY,
          .addr = info->gpa,
-        .size = 1 << info->dabt.size,
          .count = 1,
          .dir = !info->dabt.write,
          /*
@@ -75,6 +74,8 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,

      if ( instr.state == INSTR_CACHE )
          p.size = dcache_line_bytes;
+    else
+        p.size = 1U << info->dabt.size;

      s = ioreq_server_select(v->domain, &p);
      if ( !s )

Cheers,

-- 
Julien Grall

