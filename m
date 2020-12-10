Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35122D50DF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 03:30:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48930.86601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBj2-000412-DK; Thu, 10 Dec 2020 02:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48930.86601; Thu, 10 Dec 2020 02:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBj2-00040Q-8w; Thu, 10 Dec 2020 02:30:36 +0000
Received: by outflank-mailman (input) for mailman id 48930;
 Thu, 10 Dec 2020 02:30:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knBiz-0003zi-VS
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 02:30:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb6081bc-808e-4fd8-8c7d-c98fee9d76d8;
 Thu, 10 Dec 2020 02:30:33 +0000 (UTC)
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
X-Inumbo-ID: bb6081bc-808e-4fd8-8c7d-c98fee9d76d8
Date: Wed, 9 Dec 2020 18:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607567432;
	bh=FwxnLnNrqy7aesfgd3t6U5ag5+jjfPIjoAfG2bTFR0g=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=hUKELPFGRtXB/8gLLBYUjauc7GPZ/1qkFmhvg1AwoP8ZrmrsncPABZYfoquPsBjN7
	 FrnkULURuPdUMpXh604izG4ElC8zAhac3sYHAUDGbxPHzswi+1XWfAz4VupOWwrbj4
	 WD2i3aGwDnjVHRNHpVIsGOEWVqtBAyCbgdctDu9a5D9PjS/P3SjDhw3NMm1dDp2IyZ
	 eE2KZHNrYmGyG72tb0qGIVxT4oNqbFqKP/kwz7wRkTM25m4PRJW1UbBsvRpbqLbk5j
	 zV6sUXhracbYf5kXS7HlHODPEu7DBwAMTfAhnZPIhU1nfrwRTc0r8Sp67i0ioifm8O
	 CFxgRx0uyGLPQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/7] xen/arm: Add arm64 ID registers definitions
In-Reply-To: <af02eefb-5846-d32b-22e5-65763e6f51e0@xen.org>
Message-ID: <alpine.DEB.2.21.2012091742420.20986@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <96a970e5e5d2f1b1bd0e50327857de6a8c8441f7.1607524536.git.bertrand.marquis@arm.com> <af02eefb-5846-d32b-22e5-65763e6f51e0@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Julien Grall wrote:
> Hi Bertrand,
> 
> On 09/12/2020 16:30, Bertrand Marquis wrote:
> > Add coprocessor registers definitions for all ID registers trapped
> > through the TID3 bit of HSR.
> > Those are the one that will be emulated in Xen to only publish to guests
> > the features that are supported by Xen and that are accessible to
> > guests.
> > Also define a case to catch all reserved registers that should be
> > handled as RAZ.
> > 
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > Changes in V2: Rebase
> > Changes in V3:
> >    Add case definition for reserved registers.
> > 
> > ---
> >   xen/include/asm-arm/arm64/hsr.h | 66 +++++++++++++++++++++++++++++++++
> >   1 file changed, 66 insertions(+)
> > 
> > diff --git a/xen/include/asm-arm/arm64/hsr.h
> > b/xen/include/asm-arm/arm64/hsr.h
> > index ca931dd2fe..ffe0f0007e 100644
> > --- a/xen/include/asm-arm/arm64/hsr.h
> > +++ b/xen/include/asm-arm/arm64/hsr.h
> > @@ -110,6 +110,72 @@
> >   #define HSR_SYSREG_CNTP_CTL_EL0   HSR_SYSREG(3,3,c14,c2,1)
> >   #define HSR_SYSREG_CNTP_CVAL_EL0  HSR_SYSREG(3,3,c14,c2,2)
> >   +/* Those registers are used when HCR_EL2.TID3 is set */
> > +#define HSR_SYSREG_ID_PFR0_EL1    HSR_SYSREG(3,0,c0,c1,0)
> > +#define HSR_SYSREG_ID_PFR1_EL1    HSR_SYSREG(3,0,c0,c1,1)
> > +#define HSR_SYSREG_ID_PFR2_EL1    HSR_SYSREG(3,0,c0,c3,4)
> > +#define HSR_SYSREG_ID_DFR0_EL1    HSR_SYSREG(3,0,c0,c1,2)
> > +#define HSR_SYSREG_ID_DFR1_EL1    HSR_SYSREG(3,0,c0,c3,5)
> > +#define HSR_SYSREG_ID_AFR0_EL1    HSR_SYSREG(3,0,c0,c1,3)
> > +#define HSR_SYSREG_ID_MMFR0_EL1   HSR_SYSREG(3,0,c0,c1,4)
> > +#define HSR_SYSREG_ID_MMFR1_EL1   HSR_SYSREG(3,0,c0,c1,5)
> > +#define HSR_SYSREG_ID_MMFR2_EL1   HSR_SYSREG(3,0,c0,c1,6)
> > +#define HSR_SYSREG_ID_MMFR3_EL1   HSR_SYSREG(3,0,c0,c1,7)
> > +#define HSR_SYSREG_ID_MMFR4_EL1   HSR_SYSREG(3,0,c0,c2,6)
> > +#define HSR_SYSREG_ID_MMFR5_EL1   HSR_SYSREG(3,0,c0,c3,6)
> > +#define HSR_SYSREG_ID_ISAR0_EL1   HSR_SYSREG(3,0,c0,c2,0)
> > +#define HSR_SYSREG_ID_ISAR1_EL1   HSR_SYSREG(3,0,c0,c2,1)
> > +#define HSR_SYSREG_ID_ISAR2_EL1   HSR_SYSREG(3,0,c0,c2,2)
> > +#define HSR_SYSREG_ID_ISAR3_EL1   HSR_SYSREG(3,0,c0,c2,3)
> > +#define HSR_SYSREG_ID_ISAR4_EL1   HSR_SYSREG(3,0,c0,c2,4)
> > +#define HSR_SYSREG_ID_ISAR5_EL1   HSR_SYSREG(3,0,c0,c2,5)
> > +#define HSR_SYSREG_ID_ISAR6_EL1   HSR_SYSREG(3,0,c0,c2,7)
> > +#define HSR_SYSREG_MVFR0_EL1      HSR_SYSREG(3,0,c0,c3,0)
> > +#define HSR_SYSREG_MVFR1_EL1      HSR_SYSREG(3,0,c0,c3,1)
> > +#define HSR_SYSREG_MVFR2_EL1      HSR_SYSREG(3,0,c0,c3,2)
> > +
> > +#define HSR_SYSREG_ID_AA64PFR0_EL1   HSR_SYSREG(3,0,c0,c4,0)
> > +#define HSR_SYSREG_ID_AA64PFR1_EL1   HSR_SYSREG(3,0,c0,c4,1)
> > +#define HSR_SYSREG_ID_AA64DFR0_EL1   HSR_SYSREG(3,0,c0,c5,0)
> > +#define HSR_SYSREG_ID_AA64DFR1_EL1   HSR_SYSREG(3,0,c0,c5,1)
> > +#define HSR_SYSREG_ID_AA64ISAR0_EL1  HSR_SYSREG(3,0,c0,c6,0)
> > +#define HSR_SYSREG_ID_AA64ISAR1_EL1  HSR_SYSREG(3,0,c0,c6,1)
> > +#define HSR_SYSREG_ID_AA64MMFR0_EL1  HSR_SYSREG(3,0,c0,c7,0)
> > +#define HSR_SYSREG_ID_AA64MMFR1_EL1  HSR_SYSREG(3,0,c0,c7,1)
> > +#define HSR_SYSREG_ID_AA64MMFR2_EL1  HSR_SYSREG(3,0,c0,c7,2)
> > +#define HSR_SYSREG_ID_AA64AFR0_EL1   HSR_SYSREG(3,0,c0,c5,4)
> > +#define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
> > +#define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
> > +
> > +/*
> > + * Those cases are catching all Reserved registers trapped by TID3 which
> > + * currently have no assignment.
> > + * HCR.TID3 is trapping all registers in the group 3:
> > + * Op0 == 3, op1 == 0, CRn == c0,CRm == {c1-c7}, op2 == {0-7}.
> > + */
> > +#define HSR_SYSREG_TID3_RESERVED_CASE  case HSR_SYSREG(3,0,c0,c3,3): \
> > +                                       case HSR_SYSREG(3,0,c0,c3,7): \
> > +                                       case HSR_SYSREG(3,0,c0,c4,2): \
> > +                                       case HSR_SYSREG(3,0,c0,c4,3): \
> > +                                       case HSR_SYSREG(3,0,c0,c4,5): \
> > +                                       case HSR_SYSREG(3,0,c0,c4,6): \
> > +                                       case HSR_SYSREG(3,0,c0,c4,7): \
> > +                                       case HSR_SYSREG(3,0,c0,c5,2): \
> > +                                       case HSR_SYSREG(3,0,c0,c5,3): \
> > +                                       case HSR_SYSREG(3,0,c0,c5,6): \
> > +                                       case HSR_SYSREG(3,0,c0,c5,7): \
> > +                                       case HSR_SYSREG(3,0,c0,c6,2): \
> > +                                       case HSR_SYSREG(3,0,c0,c6,3): \
> > +                                       case HSR_SYSREG(3,0,c0,c6,4): \
> > +                                       case HSR_SYSREG(3,0,c0,c6,5): \
> > +                                       case HSR_SYSREG(3,0,c0,c6,6): \
> > +                                       case HSR_SYSREG(3,0,c0,c6,7): \
> > +                                       case HSR_SYSREG(3,0,c0,c7,3): \
> > +                                       case HSR_SYSREG(3,0,c0,c7,4): \
> > +                                       case HSR_SYSREG(3,0,c0,c7,5): \
> > +                                       case HSR_SYSREG(3,0,c0,c7,6): \
> > +                                       case HSR_SYSREG(3,0,c0,c7,7)
> 
> I don't like the idea to define the list of case in a header that is used by
> multiple source. Please define it directly in the source file that use it.

At that point it might be best to open-coding it in do_sysreg? I mean no
#define at all. 

