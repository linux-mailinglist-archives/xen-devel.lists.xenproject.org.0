Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB55434F43
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:44:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDRg-0002CN-5e; Tue, 04 Jun 2019 17:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYDRe-0002CH-Bt
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:41:58 +0000
X-Inumbo-ID: 0c902f7c-86f0-11e9-ba65-c3e8b8a2c65b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c902f7c-86f0-11e9-ba65-c3e8b8a2c65b;
 Tue, 04 Jun 2019 17:41:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C33AA20693;
 Tue,  4 Jun 2019 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559670117;
 bh=D6GAVVkLyhd64H8BlAKyR3I8rqqK0RRxh6xyG2v+Z3w=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WKJ6zHy0uYPyQZNNb6WRc01uYklPB9WMx3GelHgjJkeJBDkEjA/R0RGtI0Pue42r+
 x9yWtaaXTbVCrOPCGPjgqn87dS6LoAd0sLF6oM/4r72rCddo+v+fk57vFe0weH36kW
 HQKxG42Nye38nyzaaE2LcB5Cz6CdgFDxYj+iWZwM=
Date: Tue, 4 Jun 2019 10:41:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <10817a87-9a61-ee15-9b82-1596b1f90156@arm.com>
Message-ID: <alpine.DEB.2.21.1906041040140.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201451570.16404@sstabellini-ThinkPad-T480s>
 <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
 <4cbc0130-6892-19c2-9678-1a6513ac58ec@arm.com>
 <alpine.DEB.2.21.1906031552300.14041@sstabellini-ThinkPad-T480s>
 <10817a87-9a61-ee15-9b82-1596b1f90156@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1886826475-1559670116=:14041"
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

--8323329-1886826475-1559670116=:14041
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Jun 2019, Julien Grall wrote:
> Hi Stefano,
> 
> On 6/4/19 12:12 AM, Stefano Stabellini wrote:
> > On Wed, 29 May 2019, Julien Grall wrote:
> > > Ping, it would be good to know which bits I dropped...
> > > 
> > > On 21/05/2019 11:09, Julien Grall wrote:
> > > > Hi,
> > > > 
> > > > On 5/20/19 11:56 PM, Stefano Stabellini wrote:
> > > > > On Tue, 14 May 2019, Julien Grall wrote:
> > > > > > The current value of HSCTLR_BASE for Arm64 is pretty wrong. It would
> > > > > > actually turn on SCTLR_EL2.nAA (bit 6) on hardware implementing
> > > > > > ARMv8.4-LSE.
> > > > > > 
> > > > > > Furthermore, the documentation of what is cleared/set in SCTLR_EL2
> > > > > > is
> > > > > > also not correct and looks like to be a verbatim copy from Arm32.
> > > > > > 
> > > > > > HSCTLR_BASE is replaced with a bunch of per-architecture new defines
> > > > > > helping to understand better what is the initialie value for
> > > > 
> > > > s/initialie/initial/
> > > > 
> > > > > > SCTLR_EL2/HSCTLR.
> > > > > > 
> > > > > > Note the defines *_CLEAR are only used to check the state of each
> > > > > > bits
> > > > > > are known.
> > > > > 
> > > > > So basically the only purpose of HSCTLR_CLEAR is to execute:
> > > > > 
> > > > >     #if (HSCTLR_SET ^ HSCTLR_CLEAR) != 0xffffffffU
> > > > > 
> > > > > Right? It is good to have the check.
> > > > > 
> > > > > Please add a one-line comment on top of HSCTLR_CLEAR -- "only used to
> > > > > check that the state of each bits are known".
> > > > 
> > > > We don't commonly add a comment every time a define is used only one
> > > > time.
> > > > So what's the benefits here?
> > > > 
> > > > In all honesty, such wording in the commit message was probably over the
> > > > top. I am thinking to replace the sentence with:
> > > > 
> > > > "Lastly, all the bits are now described as either set or cleared. This
> > > > allows us to check at pre-processing time the consistency of the initial
> > > > value."
> > 
> > This is even clearer, but I understood that part of the commit message
> > well enough even before. I have no complaints there. My suggestion for
> > an in-code comment is because the purpose of HSCTLR_CLEAR is not
> > immediately obvious looking at the code only.  The commit message is
> > fine. I think that a one-liner in the code to say that HSCTLR_CLEAR is
> > "only used at pre-processing time" would be good to have and beneficial
> > for code readability.
> 
> It is quite an odd comment as a lot of defines are only used for
> pre-processing it (i.e CONFIG_ or even macro generating function)... It is
> going to rot quickly but I can add it if you think it improves the code...

Yes, but this macro in particular is in the middle of other similarly
named macros that are actually used at runtime. This is why I would like
the comment. However, this is code readibility, and as you know it is a
bit subjective.


> > > > > Same here, you removed the reserved bits, and added the alignment
> > > > > check,
> > > > > same as for aarch32. If I got it right, it would be nice to add a
> > > > > statement like this to the commit message.
> > > > 
> > > > I don't see why "reserved bits" I dropped nor which alignment check I
> > > > added.
> > > > 
> > > > It would be extremely useful if you provide more details in your
> > > > review...
> > > > In this case, it would be the exact bits I dropped/added.
> > 
> > I looked at the full value of SCTLR_EL2_SET, it's 0x30c51838. I
> > copy/paste here the wcalc command for our own convenience:
> > 
> > wcalc -h
> > '(1<<4)|(1<<5)|(1<<11)|(1<<16)|(1<<18)|(1<<22)|(1<<23)|(1<<28)|(1<<29)|(1<<3)|(1<<12)'
> > 
> > HSCTLR_BASE is 0x30c51878. The difference is bit 6 which is RES0. It
> > looks like I was wrong about the alignment check.
> 
> This was mentioned in the commit message:
> 
> "The current value of HSCTLR_BASE for Arm64 is pretty wrong. It would
> actually turn on SCTLR_EL2.nAA (bit 6) on hardware implementing
> ARMv8.4-LSE."

Good, it all checks out then.

 
> > > > > 
> > > > > 
> > > > > > +#define SCTLR_EL2_CLEAR (SCTLR_EL2_RES0     | SCTLR_Axx_ELx_M   |\
> > > > > > +                         SCTLR_Axx_ELx_A    | SCTLR_Axx_ELx_C   |\
> > > > > > +                         SCTLR_Axx_ELx_WXN  | SCTLR_Axx_ELx_EE)
> > > > > > +
> > > > > > +#if (SCTLR_EL2_SET ^ SCTLR_EL2_CLEAR) != 0xffffffffffffffffUL
> > > > > > +#error "Inconsistent SCTLR_EL2 set/clear bits"
> > > > > > +#endif
> > > > > > +
> > > > > > +#endif
> > > > > >    /* HCR Hyp Configuration Register */
> > > > > >    #define HCR_RW          (_AC(1,UL)<<31) /* Register Width, ARM64
> > > > > > only
> > > > > > */
> 
> Cheers,
> 
> -- 
> Julien Grall
> 
--8323329-1886826475-1559670116=:14041
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1886826475-1559670116=:14041--

