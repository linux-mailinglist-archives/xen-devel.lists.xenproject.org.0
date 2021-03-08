Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF73330A55
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 10:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94724.178314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCGK-0003Eh-Jt; Mon, 08 Mar 2021 09:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94724.178314; Mon, 08 Mar 2021 09:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCGK-0003EI-GQ; Mon, 08 Mar 2021 09:33:16 +0000
Received: by outflank-mailman (input) for mailman id 94724;
 Mon, 08 Mar 2021 09:33:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJCGI-0003ED-Ar
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 09:33:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab5f8d97-6d98-48e9-a152-3508eec7d4b2;
 Mon, 08 Mar 2021 09:33:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB0FCAC54;
 Mon,  8 Mar 2021 09:33:12 +0000 (UTC)
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
X-Inumbo-ID: ab5f8d97-6d98-48e9-a152-3508eec7d4b2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615195992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXB4itmC2qnNbufxt2cZxq8FU89mYhIiwkRvTXpCZn8=;
	b=sMlodLLa5OmRXlrkb5VIvnvXVmG3fYt5SfQ3XTKd3gt19b1GmPiELyLum5sgJY1LswthzL
	Qt4BbyxGdEGs686k0IG9usf+bH4apT/kFFm+Fq8ys8vED2ZwppikMRFO834cbdNLGwZzqn
	rTlZC+z84hYkTcCgzUbV8zhIEs64644=
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
Date: Mon, 8 Mar 2021 10:33:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEXmvp02UvvY8Fve@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.03.2021 09:56, Roger Pau Monné wrote:
> On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
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
>> ---
>> v2: Probe MSR read. Exclude hypervisor range. Avoid issuing two log
>>     messages (in debug builds). Don't alter WRMSR behavior.
>> ---
>> I'm not convinced we can get away without also making the WRMSR path
>> somewhat more permissive again, e.g. tolerating attempts to set bits
>> which are already set. But of course this would require keeping in sync
>> for which MSRs we "fake" reads, as then a kernel attempt to set a bit
>> may also appear as an attempt to clear others (because of the zero value
>> that we gave it for the read).
> 
> The above approach seems dangerous, as it could allow a guest to
> figure out the value of the underlying MSR by probing whether values
> trigger a #GP?

Perhaps, yes. But what do you do? There's potentially a huge value
range to probe ...

> I think we want to do something similar to what we do on HVM in 4.14
> and previous versions: ignore writes as long as the rdmsr to the
> target MSR succeeds, regardless of the value.

Which, as said elsewhere, has its own downsides - writable MSRs don't
need to also be readable. See e.g. AMD's proposed PARTIAL_{FS,GS}_LOAD
MSRs.

>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
>>      struct vcpu *curr = current;
>>      const struct domain *currd = curr->domain;
>>      const struct cpuid_policy *cp = currd->arch.cpuid;
>> -    bool vpmu_msr = false;
>> +    bool vpmu_msr = false, warn = false;
>>      int ret;
>>  
>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
>> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
>>          if ( ret == X86EMUL_EXCEPTION )
>>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
>>  
>> -        return ret;
>> +        goto done;
>>      }
>>  
>>      switch ( reg )
>> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
>>          }
>>          /* fall through */
>>      default:
>> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
>> +        warn = true;
>>          break;
>>  
>>      normal:
>> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
>>          return X86EMUL_OKAY;
>>      }
>>  
>> -    return X86EMUL_UNHANDLEABLE;
>> + done:
> 
> Won't this handling be better placed in the 'default' switch case
> above?

No - see the "goto done" added near the top of the function.

>> +    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address &&
>> +         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, *val) )
> 
> We didn't used to care about explicitly blocking the reserved MSR
> range, do we really wan to do it now?
> 
> I'm not sure I see an issue with that, but given that we are trying to
> bring back something similar to the previous behavior, I would avoid
> adding new conditions.

What I'm particularly trying to avoid here is to allow
information from an underlying hypervisor to "shine through",
even if it's only information as to whether a certain MSR is
readable. It should be solely our own selection which MSRs in
this range a guest is able to (appear to) read.

Plus of course by avoiding the rdmsr_safe() in this case we
also avoid the unnecessary (debug only) log message associated
with such attempted reads.

Jan

