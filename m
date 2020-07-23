Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7D22AED5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 14:18:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyaAF-0001DT-2z; Thu, 23 Jul 2020 12:17:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyaAD-0001DO-Vi
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 12:17:30 +0000
X-Inumbo-ID: 795b688b-ccde-11ea-86ff-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 795b688b-ccde-11ea-86ff-bc764e2007e4;
 Thu, 23 Jul 2020 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595506648;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=P5669HyCFd48b48gsBzCgBvTK9seeGKXQRhXcpz/vVQ=;
 b=BsZ97IvorHQ1PTg/GLjU81P5eFZY70lXQfdtXeDnbwgO87LTWegVelk7
 c/RZBCnLLU6xFLmLPOoxLvqn8g/PrRFDcTgwS8TQm9Is9lyD2sFPrCQ9G
 e2VCp3uCFgsvM9UwhTvgldIAtbIb34l2pLWhpTH84ZtFv3Toiw4kFyW+o Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Jm5aV3RJiMdNLdR3BaTuRlDZxYoECC0CKx4201Q+yidhKwdtXRx/hL46lPo7mTckxAqCnyIcWV
 5D9s0XvfvtQbarZTVYpl7xQsmRa4zbdT/boBSW5m7hpk037LoJyTpHm0EhQAPKNOYKq69dQ6sm
 V+N1ypeNZwCqMM1myOU2fdHsKf8yC+lQNqaX9CIiBsvHnU7EfQZGqWcpUQrOFIdr3l6M0qzyJ8
 SgaM3pKphSbmeEBWWmA5ykZwM1Wg1Pz5Px0cFijxVK4ctXMj3zNfUu89P9YWm5U3VY92DxaBbM
 VcY=
X-SBRS: 2.7
X-MesageID: 23892952
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23892952"
Subject: Re: [PATCH] x86/msr: Unify the real {rd,wr}msr() paths in
 guest_{rd,wr}msr()
To: Jan Beulich <jbeulich@suse.com>
References: <20200722105529.12177-1-andrew.cooper3@citrix.com>
 <4e5f1d63-5f22-a43d-e025-21aa34345092@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4b6f6dad-a831-60f1-313c-d80ed442eed9@citrix.com>
Date: Thu, 23 Jul 2020 13:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4e5f1d63-5f22-a43d-e025-21aa34345092@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 12:15, Jan Beulich wrote:
> On 22.07.2020 12:55, Andrew Cooper wrote:
>> Both the read and write side have commonalities which can be abstracted away.
>> This also allows for additional safety in release builds, and slightly more
>> helpful diagnostics in debug builds.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I'm not a massive fan of the global scope want_rdmsr_safe boolean, but I can't
>> think of a reasonable way to fix it without starting to use other
>> flexibiltiies offered to us by C99.
> I can't seem to be able to guess what C99 feature(s) you mean.
> If there are any that would help, why not use them?

This hunk:

@@ -154,7 +154,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr,
uint64_t *val)
     const struct cpuid_policy *cp = d->arch.cpuid;
     const struct msr_policy *mp = d->arch.msr;
     const struct vcpu_msrs *msrs = v->arch.msrs;
-    bool want_rdmsr_safe = false;
     int ret = X86EMUL_OKAY;
 
     switch ( msr )
@@ -303,6 +302,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr,
uint64_t *val)
 
     return ret;
 
+    bool want_rdmsr_safe = false;
+
  read_from_hw_safe:
     want_rdmsr_safe = true;
  read_from_hw:


Except that in our root Config.mk, we pass $(call
cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)  (and then
various bits of tools/ override to -Wno-declaration-after-statement).

Perhaps this is something we want to generally permit across our
codebase, seeing as some pieces already depend on it.

>> @@ -204,10 +205,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>           */
>>          if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>>               !(boot_cpu_data.x86_vendor &
>> -               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>> -             rdmsr_safe(MSR_AMD_PATCHLEVEL, *val) )
>> +               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) )
>>              goto gp_fault;
>> -        break;
>> +        goto read_from_hw_safe;
> Above from here is a read from MSR_IA32_PLATFORM_ID - any reason
> it doesn't also get folded?

Oh - looks to be a rebasing error.  This patch is actually more than a
year old at this point.

>> @@ -278,7 +278,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>           */
>>  #ifdef CONFIG_HVM
>>          if ( v == current && is_hvm_domain(d) && v->arch.hvm.flag_dr_dirty )
>> -            rdmsrl(msr, *val);
>> +            goto read_from_hw;
> In the write path you also abstract out the check for v being current.
> Wouldn't this better be abstracted out here, too, as reading an actual
> MSR when not current isn't generally very helpful?

This is rather complicated to answer.

In the example of PLATFORM_ID above, which is consistent across the
entire system, and therefore it doesn't matter if we read it in
non-current context.

More generally however, the read and write paths truly are asymmetric
when it comes to their use in remote context.  Read is "I need this
value now", so always has to be of the form "if current do one thing,
else read from struct vcpu", whereas write is "always update struct
vcpu/etc, and let context switch handle getting it into hardware".


Then again, the more I think about this, the more I'm unsure if either
of the approaches here is ideal.

I think what this is going to need to morph into is a
get_reg()/set_reg() pair of helpers, which are first split between PV
and HVM, and then has further vmx/svm logic.  We're gaining an
increasing number of registers which might be RAM only (things emulated
for PV), or might be in the VMCB/VMCS (some even depending on hardware
generation), or might be in the MSR load lists (Intel Only) or might be
actually in hardware, or stale in hardware (VMLOAD/VMSAVE), and these
positions might vary on a per-VM or per context basis, and when we
finally get on to nested virt, might vary based on the settings of the
L1 hypervisor.

I'm wondering whether I should in fact withdraw this patch, and wait
until we've implemented guest_{rd,wr}msr() for some of the more
interesting MSRs, and see how the logic looks at that point.

>> @@ -493,8 +506,8 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>                                 ? 0 : (msr - MSR_AMD64_DR1_ADDRESS_MASK + 1),
>>                                 ARRAY_SIZE(msrs->dr_mask))] = val;
>>  
>> -        if ( v == curr && (curr->arch.dr7 & DR7_ACTIVE_MASK) )
>> -            wrmsrl(msr, val);
>> +        if ( curr->arch.dr7 & DR7_ACTIVE_MASK )
>> +            goto maybe_write_to_hw;
>>          break;
> I have to admit that I'd find it more logical if v was now used
> here instead of curr.

Hmm true.

>
>> @@ -509,6 +522,23 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>>  
>>      return ret;
>>  
>> + maybe_write_to_hw:
>> +    /*
>> +     * All paths potentially updating a value in hardware need to check
>> +     * whether the call is in current context or not, so the logic is
>> +     * implemented here.  Remote context need do nothing more.
>> +     */
>> +    if ( v != curr || !wrmsr_safe(msr, val) )
>> +        return X86EMUL_OKAY;
>> +
>> +    /*
>> +     * Paths which end up here took a #GP fault in wrmsr_safe().  Something is
>> +     * broken with the logic above, so make it obvious in debug builds, and
>> +     * fail safe by handing #GP back to the guests in release builds.
>> +     */
>> +    gprintk(XENLOG_ERR, "Bad wrmsr %#x val %016"PRIx64"\n", msr, val);
> Didn't you indicate more than once that you dislike mixing 0x-
> prefixed and non-prefixed hex values in a single message?

Yes - my mistake.

> (Personally I'd simple drop the #, but I expect you to prefer it
> the other way around.)

In this case, I'm not overly fussed about the 0x.  It is clear from
context (WRMSR in the message, and the two numbers of exact width) that
we're using only hex.

> Also both here and in the read path I'm unconvinced of the
> "by handing #GP back" wording: When v != curr, no #GP fault can
> typically be handed anywhere. And even when v == curr it's still
> up to the caller to decide what to do. IOW how about "by
> suggesting to hand back #GP" or some such?

The overwhelming majority usecase is in current context, so I suppose it
is mostly true.

For the remote usecase, if this were to go wrong, something on the
context switch path would explode.

~Andrew

