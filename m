Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE59991129
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 23:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810652.1223395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpX7-0006Fs-Ph; Fri, 04 Oct 2024 21:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810652.1223395; Fri, 04 Oct 2024 21:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpX7-0006EE-Mk; Fri, 04 Oct 2024 21:08:17 +0000
Received: by outflank-mailman (input) for mailman id 810652;
 Fri, 04 Oct 2024 21:08:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1swpX5-0006Du-QH
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 21:08:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4af3cc0-8294-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 23:08:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D8435C4D6E;
 Fri,  4 Oct 2024 21:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C88BC4CEC6;
 Fri,  4 Oct 2024 21:08:11 +0000 (UTC)
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
X-Inumbo-ID: c4af3cc0-8294-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728076092;
	bh=n9fUKmPk/dzN6ODMSDGxb8MZOrT6zfrqRJlx/CNd1ew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Orp4otbBtWWPrMqV17ytXYTg20BxywjchEMMDKb6526ww+aMej2kMQGTLu5fppLss
	 +Nf/YQyc3f1jfrlKmMa/qm2oM3vGIP34hV2bvzodva9EO+IxfP/QlzUNICRfxnFP5e
	 kxGpmtUbZj+ZP+tsgtLThIC8FKZ4G+nSRVk6m/wZpPzyVUDPnKuUuSm3AK2uq1T7DK
	 Z7qQ2ub05zCmVLQnrZv6EPyMiNc+rDs5gH5o60LXAcodS3EmGtAOkRfmLuMhz1iRBI
	 D1k30KB8bhwrd2dQwSLOI+CDt/krwe77HkOM0H43rPrdsxAKRRjSCneeNDyxwN0C0F
	 Rp9umtz71toKg==
Date: Fri, 4 Oct 2024 14:08:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v1 2/3] x86/hvm: introduce config option for stdvga
 emulation
In-Reply-To: <Zv_pszkRrPXstXFW@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2410041407370.1138574@ubuntu-linux-20-04-desktop>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com> <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com> <Zv_pszkRrPXstXFW@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1775218464-1728076092=:1138574"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1775218464-1728076092=:1138574
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 4 Oct 2024, Roger Pau Monné wrote:
> On Fri, Oct 04, 2024 at 12:33:53PM +0300, Sergiy Kibrik wrote:
> > Introduce config option X86_STDVGA so that stdvga emulation driver can later be
> > made configurable and be disabled on systems that don't need it.
> > 
> > As a first step the option is hidden from user. No functional changes intended.
> > 
> > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > CC: Jan Beulich <jbeulich@suse.com>
> > ---
> >  xen/arch/x86/Kconfig              | 3 +++
> >  xen/arch/x86/hvm/Makefile         | 2 +-
> >  xen/arch/x86/include/asm/domain.h | 3 ++-
> >  xen/arch/x86/include/asm/hvm/io.h | 4 ++++
> >  4 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> > index 95275dc17e..89c42ff6da 100644
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -147,6 +147,9 @@ config INTEL_VMX
> >  config X86_PMTIMER
> >  	def_bool HVM
> >  
> > +config X86_STDVGA
> > +	def_bool HVM
> 
> Same as previous patch, the content of patch 3 needs to be moved here.
> 
> > +
> >  config XEN_SHSTK
> >  	bool "Supervisor Shadow Stacks"
> >  	depends on HAS_AS_CET_SS
> > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > index 321241f0bf..b7741b0f60 100644
> > --- a/xen/arch/x86/hvm/Makefile
> > +++ b/xen/arch/x86/hvm/Makefile
> > @@ -22,7 +22,7 @@ obj-$(CONFIG_X86_PMTIMER) += pmtimer.o
> >  obj-y += quirks.o
> >  obj-y += rtc.o
> >  obj-y += save.o
> > -obj-y += stdvga.o
> > +obj-$(CONFIG_X86_STDVGA) += stdvga.o
> >  obj-y += vioapic.o
> >  obj-y += vlapic.o
> >  obj-y += vm_event.o
> > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> > index 3f65bfd190..675a13d917 100644
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -501,7 +501,8 @@ struct arch_domain
> >  #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
> >  #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
> >  #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
> > -#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
> > +#define has_vvga(d)        (IS_ENABLED(CONFIG_X86_STDVGA) && \
> 
> You don't need the IS_ENABLED() if emulation_flags_ok() is adjusted
> accordingly.

Same as patch #1 regarding compiler DCE, we could either do this or
define X86_EMU_VGA to zero
--8323329-1775218464-1728076092=:1138574--

