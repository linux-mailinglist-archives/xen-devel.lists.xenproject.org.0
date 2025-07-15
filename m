Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A0B05FED
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 16:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044445.1414535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubgMl-0003Ey-RI; Tue, 15 Jul 2025 14:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044445.1414535; Tue, 15 Jul 2025 14:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubgMl-0003D7-O1; Tue, 15 Jul 2025 14:10:43 +0000
Received: by outflank-mailman (input) for mailman id 1044445;
 Tue, 15 Jul 2025 14:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Wk=Z4=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1ubgMj-0003Bk-9I
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 14:10:42 +0000
Received: from 4.mo576.mail-out.ovh.net (4.mo576.mail-out.ovh.net
 [46.105.42.102]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c95c4b1-6185-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 16:10:39 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.37.5])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4bhLgg2fSmz62nG
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 14:10:39 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-xvwnd (unknown [10.111.182.85])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 89424C2B5F;
 Tue, 15 Jul 2025 14:10:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
 by ghost-submission-5b5ff79f4f-xvwnd with ESMTPSA
 id L+K6Kl1hdmg7/AAAl6HHwQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 15 Jul 2025 14:10:37 +0000
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
X-Inumbo-ID: 7c95c4b1-6185-11f0-a319-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-114S0082b141004-ea41-4cf9-8b1b-4d050372dd4f,
                    4D64B2F9D48E8FFD7EE7F05048F53BAD5B642D85) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 15 Jul 2025 17:10:25 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
Message-ID: <aHZhUZfjrjML1c8D@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
 <180e1641-9968-479a-8ca0-7573d688c854@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <180e1641-9968-479a-8ca0-7573d688c854@suse.com>
X-Ovh-Tracer-Id: 7016045272446776409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehhedtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=BCMYKiaJ21FUi9jFzqucYD8hlB87TayzMWhu2Vp/LCY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1752588639; v=1;
 b=S4qWxFdhgkYqpbZ88jluAmx7V8MXpV6YgbQ29gUucOv39plCw3/wR1WaCY3m/5mQP4oK7CIY
 ZpKNvDWxGxatA5w08EhsbLZXeV/8HiBCDJQVLObDySrEWG+Q0gdXfZpRZWLf+msJBidhET1i/2E
 IwSXMKo24JHWXq3MT226+4ZQy5Y7qqyhqIucEt5TM8Ez6eRIu/cGT5Xs7QxapjZ87mKUhCgZT+T
 850lCIwTksmZwm+UBgjx7loQdaJUNVHOdqx0vcE8ZIGTuEKxzwa+c07Igra2ncnDDaZdwTnQ4MU
 y/IWoXQrzWDzQVnSox7G0Tf3BRlJv7RSMHrSrZLeD+uZA==

On Thu, Jul 03, 2025 at 12:50:39PM +0200, Jan Beulich wrote:
> As indicated in reply to patch 3 - imo all code additions here want to be
> under some CONFIG_xyz. I repeat this here, but I don't think I'll repeat it
> any further.

I'll add one.  In case this is problematic for some reason I want to
mention that in the new version I don't add #ifdef where there are
if-statements because I did:

    #ifdef CONFIG_SLAUNCH
    ...
    #else
    static const bool slaunch_active = false;
    #endif

and that's enough for the compiler to discard
`if (slaunch_active ...) { ... }`.

> > +        /*
> > +         * Prepare space for output parameter of slaunch_early_init(), which is
> > +         * a structure of two uint32_t fields.
> > +         */
> > +        sub     $8, %esp
>
> At the very least a textual reference to the struct type is needed here,
> to be able to find it. Better would be to have the size calculated into
> asm-offsets.h, to use a proper symbolic name here.

Will do both of those things so it's easier to understand behaviour of
POPs.

> > +        push    %esp                             /* pointer to output structure */
> > +        lea     sym_offs(__2M_rwdata_end), %ecx  /* end of target image */
> > +        lea     sym_offs(_start), %edx           /* target base address */
>
> Why LEA when this can be expressed with (shorter) MOV?

I'll change to MOVs for consistency.  The reason is probably that these
are addresses and that's what LEA is for.

> > +        /* Move outputs of slaunch_early_init() from stack into registers. */
> > +        pop     %eax  /* physical MBI address */
> > +        pop     %edx  /* physical SLRT address */
> > +
> > +        /* Save physical address of SLRT for C code. */
> > +        mov     %edx, sym_esi(slaunch_slrt)
>
> Why go through %edx?
>
> > +        /* Store MBI address in EBX where MB2 code expects it. */
> > +        mov     %eax, %ebx
>
> Why go through %eax?

I think I just wanted to fully unpack the structure before processing
its fields, but there is real need for that, so I'll combine it.

> > +struct early_init_results
> > +{
> > +    uint32_t mbi_pa;
> > +    uint32_t slrt_pa;
> > +} __packed;
>
> Why __packed?

Just a bullet-proof form of documenting a requirement.

> > +void asmlinkage slaunch_early_init(uint32_t load_base_addr,
>
> __init ?

This is early code to which no such sections apply, as far as I can
tell.

> > +    slrt = (const struct slr_table *)(uintptr_t)os_mle->slrt;
>
> I think the cast to uintptr_t wants omitting here. This is 32-bit code, and
> hence the conversion to a pointer ought to go fine without. Or else you're
> silently discarding bits in the earlier assignment to ->slrt_pa.

`os_mle->slrt` is 64-bit and compiler dislikes implicit narrowing for
pointer casts, so can't just drop the cast.  I'll use `result->slrt_pa`
(32-bit) to get rid of the cast and will add a check that the address is
in fact 32-bit.

The values of pointers are generally below 4 GiB, so no harm is done.
The address fields are 64-bit probably for the extensibility and because
they are mostly consumed by 64-bit code.

> > +    intel_info = (const struct slr_entry_intel_info *)
> > +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
> > +    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
> > +        return;
>
> This size check is best effort only, isn't it? Or else how do you
> know ->hdr.size is actually within bounds?

It's just a sanity check the structure is not of completely wrong format.

> Further in txt_init() you use less-than checks; why more relaxed there
> and more strict here?

Those are different kinds of checks: here the code checks that an entry
in SLRT size matches Xen's structure in size, while txt_init() verifies
that a section of TXT heap is large enough to fit the data we expect to
find there.

> > --- a/xen/arch/x86/include/asm/intel-txt.h
> > +++ b/xen/arch/x86/include/asm/intel-txt.h
> > @@ -292,6 +292,22 @@ static inline void *txt_sinit_mle_data_start(const void *heap)
> >             sizeof(uint64_t);
> >  }
> >
> > +static inline void *txt_init(void)
>
> __init ?

Then it won't work in an early code.

> > +/*
> > + * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
> > + */
> > +struct slr_table *slaunch_get_slrt(void);
>
> There's no definition of this here, nor a use. Why is this living in this
> patch? Misra objects to declarations without definitions, and you want to
> be prepared that such a large series may go in piece by piece. Hence there
> may not be new Misra violations at any patch boundary.

The reason is that a comment mentions this function.  I'll change the
comment to not do that until the function is introduced.

> > +#include <xen/types.h>
>
> Looks like all you need here is xen/stdint.h?

Right, <xen/types.h> will be necessary for NULL in patch #6.

> > +#include <asm/slaunch.h>
>
> We try to move to there being blanks lines between groups of #include-s,
> e.g. all xen/ ones separated from all asm/ ones.

Will add a blank line.

> > +/*
> > + * These variables are assigned to by the code near Xen's entry point.
> > + *
> > + * slaunch_active is not __initdata to allow checking for an active Secure
> > + * Launch boot.
> > + */
> > +bool slaunch_active;
>
> Not using __initdata is quite plausible, but why not __ro_after_init?

I haven't tried it and likely didn't even see it (it's in a separate
header), will try changing.

> > +uint32_t __initdata slaunch_slrt; /* physical address */
> > +
> > +/* Using slaunch_active in head.S assumes it's a single byte in size, so enforce
> > + * this assumption. */
>
> Please follow comment style as per ./CODING_STYLE.
>
> Jan

Will adjust.

Regards

