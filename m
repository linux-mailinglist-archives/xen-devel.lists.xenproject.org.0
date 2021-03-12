Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6F03388BD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 10:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96931.183882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKe9r-0001tg-Kk; Fri, 12 Mar 2021 09:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96931.183882; Fri, 12 Mar 2021 09:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKe9r-0001tH-Gp; Fri, 12 Mar 2021 09:32:35 +0000
Received: by outflank-mailman (input) for mailman id 96931;
 Fri, 12 Mar 2021 09:32:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKe9p-0001tC-Uh
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 09:32:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0956fa21-c2e0-44f1-b198-9333870e0ef9;
 Fri, 12 Mar 2021 09:32:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D04F6AF4D;
 Fri, 12 Mar 2021 09:32:31 +0000 (UTC)
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
X-Inumbo-ID: 0956fa21-c2e0-44f1-b198-9333870e0ef9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615541551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSzZ2e6C8lTfHbvkZr9jmUnRx9YHtfWraI8yj8ENVWA=;
	b=XKb7IbfkDY68QDySK6bwfTxgZHVo/se+daM16tQfA9G1iXSqx2lDcuTQEyzhf6cVi4KYs4
	7HPRwEBKxBD1b+082zrj7AlA2/q3Rqnez0w9nGabVmqCHinmsddiR13dRJOwp92M4Ut/5i
	mI1/3o3mqqozDlX4y3FoV+LjFxGSAgs=
Subject: Re: [PATCH v3 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
 <90f87aa8-09da-1453-bd82-c722465c2881@suse.com>
 <YEsvpK8WJQNqSQGe@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <815584e1-2d0f-4119-e27d-cf897d1b8901@suse.com>
Date: Fri, 12 Mar 2021 10:32:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEsvpK8WJQNqSQGe@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.03.2021 10:08, Roger Pau Monné wrote:
> On Fri, Mar 12, 2021 at 08:54:46AM +0100, Jan Beulich wrote:
>> Prior to 4.15 Linux, when running in PV mode, did not install a #GP
>> handler early enough to cover for example the rdmsrl_safe() of
>> MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
>> of MSR_K7_HWCR later in the same function). The respective change
>> (42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
>> backported to 4.14, but no further - presumably since it wasn't really
>> easy because of other dependencies.
>>
>> Therefore, to prevent our change in the handling of guest MSR accesses
>> to render PV Linux 4.13 and older unusable on at least AMD systems, make
>> the raising of #GP on this paths conditional upon the guest having
>> installed a handler, provided of course the MSR can be read in the first
>> place (we would have raised #GP in that case even before). Producing
>> zero for reads isn't necessarily correct and may trip code trying to
>> detect presence of MSRs early, but since such detection logic won't work
>> without a #GP handler anyway, this ought to be a fair workaround.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> I think the approach is fine:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -874,7 +874,8 @@ static int read_msr(unsigned int reg, ui
>>      struct vcpu *curr = current;
>>      const struct domain *currd = curr->domain;
>>      const struct cpuid_policy *cp = currd->arch.cpuid;
>> -    bool vpmu_msr = false;
>> +    bool vpmu_msr = false, warn = false;
>> +    uint64_t tmp;
>>      int ret;
>>  
>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
>> @@ -882,7 +883,7 @@ static int read_msr(unsigned int reg, ui
>>          if ( ret == X86EMUL_EXCEPTION )
>>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
> 
> You might want to move the injection of the exception to the done
> label?
> 
> So that we can avoid the call to x86_emul_reset_event.

At the expense of slightly more code churn, yes, perhaps. I have
to admit though that it feels less prone to future issues to me
to have an unconditional x86_emul_reset_event() on that path.

>> --- a/xen/include/public/arch-x86/xen.h
>> +++ b/xen/include/public/arch-x86/xen.h
>> @@ -143,6 +143,12 @@ typedef unsigned long xen_ulong_t;
>>   *  Level == 1: Kernel may enter
>>   *  Level == 2: Kernel may enter
>>   *  Level == 3: Everyone may enter
>> + *
>> + * Note: For compatibility with kernels not setting up exception handlers
>> + *       early enough, Xen will avoid trying to inject #GP (and hence crash
>> + *       the domain) when an RDMSR would require this, but no handler was
>> + *       set yet. The precise conditions are implementation specific, and
> 
> You can drop the 'yet' here I think? As even if a handler has been set
> and then removed we would still prevent injecting a #GP AFAICT. Not a
> native speaker anyway, so I might be wrong on that one.

Well, I've put it there intentionally to leave room (effectively
trying to further emphasize "implementation specific") for us to
indeed only behave this way if no handler was ever set (as
opposed to a handler having got set and then zapped again).

>> + *       new code shouldn't rely on such behavior anyway.
> 
> I would use a stronger mustn't here instead of shouldn't.

Fine with me. I've been using "mustn't" in a number of cases in
the past and was told I'm using it too often, sounding sort of
impolite. I guess I'll switch to "may not", which was suggested
to me as the better replacement.

Jan

