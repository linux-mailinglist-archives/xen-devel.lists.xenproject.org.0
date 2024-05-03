Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE658BAEF8
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716506.1118666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2trE-0006V4-1A; Fri, 03 May 2024 14:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716506.1118666; Fri, 03 May 2024 14:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2trD-0006S7-Sx; Fri, 03 May 2024 14:25:51 +0000
Received: by outflank-mailman (input) for mailman id 716506;
 Fri, 03 May 2024 14:25:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s2trD-0006S1-Eg
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:25:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2trD-0006Hh-2A; Fri, 03 May 2024 14:25:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2trC-0004Vl-QT; Fri, 03 May 2024 14:25:50 +0000
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
	bh=bPVlUAKs7UW93A0XEt85U0EiIRHfPEAdaURMKVqObvo=; b=Hius+Pc+V5D6Q93SoatW4VAE+u
	fUimwVxaNXHqfX/kkbzR4MVYdAk5dH2fJtBR97ptmPWkxq1T9V1Ofl7kNmcfB0lHlijcMNRDoiXI0
	t8SCY+kVQiJmo2Kb6IqyEKRkicBO2X47lIzQoLhcc7LERcCsjfzleosZg33AZMQzAKY0=;
Message-ID: <447340c3-d57a-411b-8d4d-29e8683b27d9@xen.org>
Date: Fri, 3 May 2024 15:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
 <20240502145645.1201613-6-jens.wiklander@linaro.org>
 <935e3947-53ee-48c5-a10c-5fa7f572ae65@xen.org>
 <CAHUa44HdA_cdZcjbVL+xYXnLVkdK1hK5hfU_k+fZkS8=VAOy1A@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAHUa44HdA_cdZcjbVL+xYXnLVkdK1hK5hfU_k+fZkS8=VAOy1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 03/05/2024 14:54, Jens Wiklander wrote:
>>> +static int ffa_setup_irq_callback(struct notifier_block *nfb,
>>> +                                  unsigned long action, void *hcpu)
>>> +{
>>> +    unsigned int cpu = (unsigned long)hcpu;
>>> +    struct notif_irq_info irq_info = { };
>>> +
>>> +    switch ( action )
>>> +    {
>>> +    case CPU_ONLINE:
>>
>> Can't you execute the notifier in CPU_STARTING? This will be called on
>> the CPU directly, so you should be able to use request_irq(...).
> 
> I tried that first but it failed with the ASSERT_ALLOC_CONTEXT() in _xmalloc().
> 
> I've also tested a three-step solution with CPU_UP_PREPARE,
> CPU_STARTING, and CPU_UP_CANCELED.
> My approach here is more direct, but it still suffers from a weakness
> in error handling even if it seems quite unlikely to run out of heap
> or for setup_irq() to fail at this stage.

Ah I didn't notice that notify_cpu_starting() is called with IRQ 
disabled. I assumed they would be enabled.

Then I would consider to do:

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 6efed876782e..db322672e508 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -389,6 +389,7 @@ void asmlinkage start_secondary(void)
       */
      init_maintenance_interrupt();
      init_timer_interrupt();
+    init_tee_interrupt();

      local_abort_enable();

And plumb through the TEE subsystem.

Cheers,

-- 
Julien Grall

