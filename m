Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B554C33BCD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 01:16:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXw8O-00023D-1R; Mon, 03 Jun 2019 23:12:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXw8M-000238-9b
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 23:12:54 +0000
X-Inumbo-ID: 1c38c976-8655-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1c38c976-8655-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 23:12:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0942326401;
 Mon,  3 Jun 2019 23:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559603571;
 bh=nSxAXwEFQf/N7IYSzkZiXocwb/3ws5L6oNtaxmKekks=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jE24QZvgZiVienVGz0TqIKYbU1HklwVSIG0jZsSDc5Jt6GjESWpSQDW0ni2G5YKrc
 ZgbOk1mu10+MwlNQ+bdOjE5eUbdqsiMydHYK4/OHV6bhoyX6t85RRPDrifkYX34lOn
 qSsFGCK8iddaCA0umpjX9FjpErRglUZMhQ+om82o=
Date: Mon, 3 Jun 2019 16:12:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <4cbc0130-6892-19c2-9678-1a6513ac58ec@arm.com>
Message-ID: <alpine.DEB.2.21.1906031552300.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201451570.16404@sstabellini-ThinkPad-T480s>
 <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
 <4cbc0130-6892-19c2-9678-1a6513ac58ec@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-613387354-1559602385=:14041"
Content-ID: <alpine.DEB.2.21.1906031553230.14041@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 04/19] xen/arm: Rework
 HSCTLR_BASE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-613387354-1559602385=:14041
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1906031553231.14041@sstabellini-ThinkPad-T480s>

On Wed, 29 May 2019, Julien Grall wrote:
> Ping, it would be good to know which bits I dropped...
> 
> On 21/05/2019 11:09, Julien Grall wrote:
> > Hi,
> > 
> > On 5/20/19 11:56 PM, Stefano Stabellini wrote:
> > > On Tue, 14 May 2019, Julien Grall wrote:
> > > > The current value of HSCTLR_BASE for Arm64 is pretty wrong. It would
> > > > actually turn on SCTLR_EL2.nAA (bit 6) on hardware implementing
> > > > ARMv8.4-LSE.
> > > > 
> > > > Furthermore, the documentation of what is cleared/set in SCTLR_EL2 is
> > > > also not correct and looks like to be a verbatim copy from Arm32.
> > > > 
> > > > HSCTLR_BASE is replaced with a bunch of per-architecture new defines
> > > > helping to understand better what is the initialie value for
> > 
> > s/initialie/initial/
> > 
> > > > SCTLR_EL2/HSCTLR.
> > > > 
> > > > Note the defines *_CLEAR are only used to check the state of each bits
> > > > are known.
> > > 
> > > So basically the only purpose of HSCTLR_CLEAR is to execute:
> > > 
> > >    #if (HSCTLR_SET ^ HSCTLR_CLEAR) != 0xffffffffU
> > > 
> > > Right? It is good to have the check.
> > > 
> > > Please add a one-line comment on top of HSCTLR_CLEAR -- "only used to
> > > check that the state of each bits are known".
> > 
> > We don't commonly add a comment every time a define is used only one time.
> > So what's the benefits here?
> >
> > In all honesty, such wording in the commit message was probably over the
> > top. I am thinking to replace the sentence with:
> > 
> > "Lastly, all the bits are now described as either set or cleared. This
> > allows us to check at pre-processing time the consistency of the initial
> > value."

This is even clearer, but I understood that part of the commit message
well enough even before. I have no complaints there. My suggestion for
an in-code comment is because the purpose of HSCTLR_CLEAR is not
immediately obvious looking at the code only.  The commit message is
fine. I think that a one-liner in the code to say that HSCTLR_CLEAR is
"only used at pre-processing time" would be good to have and beneficial
for code readability.


> > > 
> > > 
> > > > Lastly, the documentation is dropped from arm{32,64}/head.S as it would
> > > > be pretty easy to get out-of-sync with the definitions.
> > > > 
> > > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > > 
> > > > ---
> > > >      Changes in v2:
> > > >          - Use BIT(..., UL) instead of _BITUL
> > > > ---
> > > >   xen/arch/arm/arm32/head.S       | 12 +--------
> > > >   xen/arch/arm/arm64/head.S       | 10 +-------
> > > >   xen/include/asm-arm/processor.h | 54
> > > > ++++++++++++++++++++++++++++++++++++++++-
> > > >   3 files changed, 55 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> > > > index 454d24537c..8a98607459 100644
> > > > --- a/xen/arch/arm/arm32/head.S
> > > > +++ b/xen/arch/arm/arm32/head.S
> > > > @@ -234,17 +234,7 @@ cpu_init_done:
> > > >           ldr   r0,
> > > > =(TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
> > > >           mcr   CP32(r0, HTCR)
> > > > -        /*
> > > > -         * Set up the HSCTLR:
> > > > -         * Exceptions in LE ARM,
> > > > -         * Low-latency IRQs disabled,
> > > > -         * Write-implies-XN disabled (for now),
> > > > -         * D-cache disabled (for now),
> > > > -         * I-cache enabled,
> > > > -         * Alignment checking enabled,
> > > > -         * MMU translation disabled (for now).
> > > > -         */
> > > > -        ldr   r0, =(HSCTLR_BASE|SCTLR_Axx_ELx_A)
> > > > +        ldr   r0, =HSCTLR_SET
> > > >           mcr   CP32(r0, HSCTLR)
> > > >           /*
> > > > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > > > index 8a6be3352e..4fe904c51d 100644
> > > > --- a/xen/arch/arm/arm64/head.S
> > > > +++ b/xen/arch/arm/arm64/head.S
> > > > @@ -363,15 +363,7 @@ skip_bss:
> > > >           msr   tcr_el2, x0
> > > > -        /* Set up the SCTLR_EL2:
> > > > -         * Exceptions in LE ARM,
> > > > -         * Low-latency IRQs disabled,
> > > > -         * Write-implies-XN disabled (for now),
> > > > -         * D-cache disabled (for now),
> > > > -         * I-cache enabled,
> > > > -         * Alignment checking disabled,
> > > > -         * MMU translation disabled (for now). */
> > > > -        ldr   x0, =(HSCTLR_BASE)
> > > > +        ldr   x0, =SCTLR_EL2_SET
> > > >           msr   SCTLR_EL2, x0
> > > >           /* Ensure that any exceptions encountered at EL2
> > > > diff --git a/xen/include/asm-arm/processor.h
> > > > b/xen/include/asm-arm/processor.h
> > > > index bbcba061ca..9afc3786c5 100644
> > > > --- a/xen/include/asm-arm/processor.h
> > > > +++ b/xen/include/asm-arm/processor.h
> > > > @@ -127,6 +127,9 @@
> > > >   #define SCTLR_A32_ELx_TE    BIT(30, UL)
> > > >   #define SCTLR_A32_ELx_FI    BIT(21, UL)
> > > > +/* Common bits for SCTLR_ELx for Arm64 */
> > > > +#define SCTLR_A64_ELx_SA    BIT(3, UL)
> > > > +
> > > >   /* Common bits for SCTLR_ELx on all architectures */
> > > >   #define SCTLR_Axx_ELx_EE    BIT(25, UL)
> > > >   #define SCTLR_Axx_ELx_WXN   BIT(19, UL)
> > > > @@ -135,7 +138,56 @@
> > > >   #define SCTLR_Axx_ELx_A     BIT(1, UL)
> > > >   #define SCTLR_Axx_ELx_M     BIT(0, UL)
> > > > -#define HSCTLR_BASE     _AC(0x30c51878,U)
> > > > +#ifdef CONFIG_ARM_32
> > > > +
> > > > +#define HSCTLR_RES1     (BIT( 3, UL) | BIT( 4, UL) | BIT( 5, UL) |\
> > > > +                         BIT( 6, UL) | BIT(11, UL) | BIT(16, UL) |\
> > > > +                         BIT(18, UL) | BIT(22, UL) | BIT(23, UL) |\
> > > > +                         BIT(28, UL) | BIT(29, UL))
> > > > +
> > > > +#define HSCTLR_RES0     (BIT(7, UL)  | BIT(8, UL)  | BIT(9, UL)  |
> > > > BIT(10, UL) |\
> > > > +                         BIT(13, UL) | BIT(14, UL) | BIT(15, UL) |
> > > > BIT(17, UL) |\
> > > > +                         BIT(20, UL) | BIT(24, UL) | BIT(26, UL) |
> > > > BIT(27, UL) |\
> > > > +                         BIT(31, UL))
> > > > +
> > > > +/* Initial value for HSCTLR */
> > > > +#define HSCTLR_SET      (HSCTLR_RES1    | SCTLR_Axx_ELx_A   |
> > > > SCTLR_Axx_ELx_I)
> > > 
> > > As far as my calculations go, it looks like the only difference is
> > > SCTLR_Axx_ELx_A compared to 0x30c51878, right? Which is the alignment
> > > check.
> > 
> > That's correct and match the initial value on Arm32 (see HSCTR_SET |
> > SCTLR_Axx_ELx_A in the head.S).

OK


> > > 
> > > 
> > > > +#define HSCTLR_CLEAR    (HSCTLR_RES0        | SCTLR_Axx_ELx_M   |\
> > > > +                         SCTLR_Axx_ELx_C    | SCTLR_Axx_ELx_WXN |\
> > > > +                         SCTLR_A32_ELx_FI   | SCTLR_Axx_ELx_EE  |\
> > > > +                         SCTLR_A32_ELx_TE)
> > > > +
> > > > +#if (HSCTLR_SET ^ HSCTLR_CLEAR) != 0xffffffffU
> > > > +#error "Inconsistent HSCTLR set/clear bits"
> > > > +#endif
> > > > +
> > > > +#else
> > > > +
> > > > +#define SCTLR_EL2_RES1  (BIT( 4, UL) | BIT( 5, UL) | BIT(11, UL) |\
> > > > +                         BIT(16, UL) | BIT(18, UL) | BIT(22, UL) |\
> > > > +                         BIT(23, UL) | BIT(28, UL) | BIT(29, UL))
> > > > +
> > > > +#define SCTLR_EL2_RES0  (BIT( 6, UL) | BIT( 7, UL) | BIT( 8, UL) |\
> > > > +                         BIT( 9, UL) | BIT(10, UL) | BIT(13, UL) |\
> > > > +                         BIT(14, UL) | BIT(15, UL) | BIT(17, UL) |\
> > > > +                         BIT(20, UL) | BIT(21, UL) | BIT(24, UL) |\
> > > > +                         BIT(26, UL) | BIT(27, UL) | BIT(30, UL) |\
> > > > +                         BIT(31, UL) | (0xffffffffULL << 32))
> > > > +
> > > > +/* Initial value for SCTLR_EL2 */
> > > > +#define SCTLR_EL2_SET   (SCTLR_EL2_RES1     | SCTLR_A64_ELx_SA  |\
> > > > +                         SCTLR_Axx_ELx_I)
> > > 
> > > Same here, you removed the reserved bits, and added the alignment check,
> > > same as for aarch32. If I got it right, it would be nice to add a
> > > statement like this to the commit message.
> > 
> > I don't see why "reserved bits" I dropped nor which alignment check I added.
> > 
> > It would be extremely useful if you provide more details in your review... 
> > In this case, it would be the exact bits I dropped/added.

I looked at the full value of SCTLR_EL2_SET, it's 0x30c51838. I
copy/paste here the wcalc command for our own convenience:

wcalc -h '(1<<4)|(1<<5)|(1<<11)|(1<<16)|(1<<18)|(1<<22)|(1<<23)|(1<<28)|(1<<29)|(1<<3)|(1<<12)'

HSCTLR_BASE is 0x30c51878. The difference is bit 6 which is RES0. It
looks like I was wrong about the alignment check.


> > > 
> > > 
> > > > +#define SCTLR_EL2_CLEAR (SCTLR_EL2_RES0     | SCTLR_Axx_ELx_M   |\
> > > > +                         SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
> > > > +                         SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
> > > > +
> > > > +#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) != 0xffffffffffffffffUL
> > > > +#error "Inconsistent SCTLR_EL2 set/clear bits"
> > > > +#endif
> > > > +
> > > > +#endif
> > > >   /* HCR Hyp Configuration Register */
> > > >   #define HCR_RW          (_AC(1,UL)<<31) /* Register Width, ARM64 only
> > > > */
--8323329-613387354-1559602385=:14041
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-613387354-1559602385=:14041--

