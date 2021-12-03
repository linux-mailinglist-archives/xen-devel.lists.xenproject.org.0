Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4422467D71
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 19:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237906.412582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtDVW-0002DH-CX; Fri, 03 Dec 2021 18:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237906.412582; Fri, 03 Dec 2021 18:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtDVW-0002BO-8k; Fri, 03 Dec 2021 18:42:06 +0000
Received: by outflank-mailman (input) for mailman id 237906;
 Fri, 03 Dec 2021 18:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mtDVU-0002BI-0i
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 18:42:04 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2abdd5c-5468-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 19:42:00 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35194)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mtDVO-000oBv-9T (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 18:41:58 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id BEB421FC8B;
 Fri,  3 Dec 2021 18:41:58 +0000 (GMT)
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
X-Inumbo-ID: b2abdd5c-5468-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <86264d00-7551-5c38-f806-e35048f73c55@srcf.net>
Date: Fri, 3 Dec 2021 18:41:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-3-andrew.cooper3@citrix.com>
 <3ca82514-2adf-2445-04d1-0020dde16019@suse.com>
 <4ee538d8-5063-1bf6-025a-62474be7ab0c@srcf.net>
 <33d466b3-338b-d2dc-f993-c5fac22072e0@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/4] x86/altcall: Optimise away endbr64 instruction where
 possible
In-Reply-To: <33d466b3-338b-d2dc-f993-c5fac22072e0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2021 08:01, Jan Beulich wrote:
> On 01.12.2021 20:07, Andrew Cooper wrote:
>> On 01/12/2021 08:20, Jan Beulich wrote:
>>> On 26.11.2021 22:22, Andrew Cooper wrote:
>>>> With altcall, we convert indirect branches into direct ones.  With that
>>>> complete, none of the potential targets need an endbr64 instruction.
>>> Assuming that no other hooks remain which re-use the same function. I
>>> think this constraint wants at least mentioning explicitly.
>> Fair point, but I think it is entirely reasonable to expect logic not to
>> mix and match altcall on the same hook.
> Take XSM's silo_xsm_ops and dummy_ops as an example. With what
> xsm_fixup_ops() does it should be entirely benign if silo_xsm_ops
> set any or all of the hooks which are currently unset to what
> dummy_ops has.

We're talking very specifically about ops and ops-like structures, and
we don't just have random code calling dumy_ops->foo() when you've also
got xsm_foo() { altcall(ops->foo); }

In this case specifically, each of {flask,silo,dummy}_ops are static,
and xsm_fixup_ops() gets called exactly once on the root xsm_ops object,
so even code inside silo.c can't call silo->foo() and hit the dummy foo().

>>>> Furthermore, removing the endbr64 instructions is a security defence-in-depth
>>>> improvement, because it limits the options available to an attacker who has
>>>> managed to hijack a function pointer.
>>>>
>>>> Introduce a new .init.data.cf_clobber section.  Have _apply_alternatives()
>>>> walk over the entire section, looking for any pointers into .text, and clobber
>>>> an endbr64 instruction if found.  This is some minor structure (ab)use but it
>>>> works alarmingly well.
>>> Iirc you've said more than once that non-function-pointer data in
>>> those structures is fine; I'm not convinced. What if a sequence of
>>> sub-pointer-size fields has a value looking like a pointer into
>>> .text? This may not be very likely, but would result in corruption
>>> that may be hard to associate with anything. Of course, with the
>>> is_endbr64() check and with a build time check of there not being
>>> any stray ENDBR64 patterns in .text, that issue would disappear.
>>> But we aren't quite there yet.
>> I disagree with "not very likely" and put it firmly in the "not
>> plausible" category.
>>
>> To cause a problem, you need an aligned something which isn't actually a
>> function pointer with a bit pattern forming [0xffff82d040200000,
>> ffff82d04039e1ba) which hits an ENDBR64 pattern.  Removing the stray
>> ENDBR64's doesn't prevent such a bit pattern pointing at a real (wrong)
>> function.
> Why "aligned" in "aligned something"?

The non-function-pointer thing inside the ops struct needs to be 8-byte
aligned to trigger this bad behaviour to begin with, because we
interpret the struct as an array of unsigned longs.

Any 8-byte block containing a bool for example can't cause problems, nor
can a pair of adjacent uint32_t's if they're not on an 8 byte boundary.

>  And I also don't see what you're
> trying to tell me with the last sentence. It's still .text corruption
> that would result if such a pattern (crossing an insn boundary)
> happened to be pointed at.

We (will) have tooling to detect and reject ENDBR64 bit patterns which
aren't real ENDBR64 instructions.

But this "integer bit pattern that looks like a function pointer"
problem can target one of ~1600 (fewer in most builds) real ENDBR64
instructions of an unrelated function.

>> These structures are almost exclusively compile time generated.
>>
>> So yes - it's not impossible, but it's also not going to happen
>> accidentally.
> I wonder how you mean to exclude such accidents. It occurs to me that
> checking the linked binary for the pattern isn't going to be enough.
> Such a patter could also form with alternatives patching. (It's all
> quite unlikely, yes, but imo we need to fully exclude the possibility.)

Again, we're taking specifically ops structures, not arbitrary structures.

hvm_funcs is the only thing so far that has non-function pointer
members, and its got a string pointer (fine - not .text), and a couple
of integer fields, none of which will plausibly alias a function pointer.

I will fully admit that there is a risk of things going wrong.  I'm
happy copious health warnings wherever necessary, but I don't see
anything going wrong in practice without a deliberate attempt to tickle
this corner case.

>>>> --- a/xen/arch/x86/alternative.c
>>>> +++ b/xen/arch/x86/alternative.c
>>>> @@ -173,6 +173,9 @@ text_poke(void *addr, const void *opcode, size_t len)
>>>>      return memcpy(addr, opcode, len);
>>>>  }
>>>>  
>>>> +extern unsigned long __initdata_cf_clobber_start[];
>>>> +extern unsigned long __initdata_cf_clobber_end[];
>>> const please. I also would find it quite a bit better if these
>>> were suitably typed such that ...
>>>
>>>> @@ -329,6 +332,41 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>>>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>>>>          text_poke(orig, buf, total_len);
>>>>      }
>>>> +
>>>> +    /*
>>>> +     * Clobber endbr64 instructions now that altcall has finished optimised
>>>> +     * all indirect branches to direct ones.
>>>> +     */
>>>> +    if ( force && cpu_has_xen_ibt )
>>>> +    {
>>>> +        unsigned long *val;
>>>> +        unsigned int clobbered = 0;
>>>> +
>>>> +        /*
>>>> +         * This is some minor structure (ab)use.  We walk the entire contents
>>>> +         * of .init.data.cf_clobber as if it were an array of pointers.
>>>> +         *
>>>> +         * If the pointer points into .text, and has an endbr64 instruction,
>>>> +         * nop out the endbr64.  This causes the pointer to no longer be a
>>>> +         * legal indirect branch target under CET-IBT.  This is a
>>>> +         * defence-in-depth measure, to reduce the options available to an
>>>> +         * adversary who has managed to hijack a function pointer.
>>>> +         */
>>>> +        for ( val = __initdata_cf_clobber_start;
>>>> +              val < __initdata_cf_clobber_end;
>>>> +              val++ )
>>>> +        {
>>>> +            void *ptr = (void *)*val;
>>> ... no cast was needed here.
>> Unless you know what this type is, I already tried and am stuck. 
>> Everything else requires more horrible casts on val.
> It's as simple as I thought is would be; proposed respective patch
> at the end of the mail (the two //temp-marked #define-s were needed so
> I could build-test this without needing to pull in further patches of
> yours). No new casts at all, and the one gone that I wanted to see
> eliminated.

I can't have been very caffeinated while having those problems, clearly...

I have no idea how I didn't manage to come up with that as a working
solution.

>>>> --- a/xen/include/xen/init.h
>>>> +++ b/xen/include/xen/init.h
>>>> @@ -18,6 +18,8 @@
>>>>  #define __init_call(lvl)  __used_section(".initcall" lvl ".init")
>>>>  #define __exit_call       __used_section(".exitcall.exit")
>>>>  
>>>> +#define __initdata_cf_clobber __section(".init.data.cf_clobber")
>>> Just to repeat what I've said elsewhere: I think we want a const
>>> version of this as well.
>> I can, but does it really matter?  initconst is merged into initdata and
>> not actually read-only to begin with.
> My remark wasn't about the actual mapping properties at all. What I'm
> after is the compiler being able to spot modifications. If I see a
> struct instance marked "const" and if I know the thing builds okay, I
> know I don't need to go hunt for possible writes to this struct
> instance. When it's non-const, to be sure there's no possible conflict
> with the patching (yours or just the altcall part), I'd need to find
> and verify all instances where the object gets written to.

I've added __initconst_cf_clobber too.

~Andrew

