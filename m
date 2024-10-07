Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FF5993831
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812416.1225163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuHi-0002k6-Sn; Mon, 07 Oct 2024 20:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812416.1225163; Mon, 07 Oct 2024 20:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuHi-0002ia-PW; Mon, 07 Oct 2024 20:24:50 +0000
Received: by outflank-mailman (input) for mailman id 812416;
 Mon, 07 Oct 2024 20:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sxuHh-0002i3-7S
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:24:49 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 319cec4b-84ea-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 22:24:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7BCAA4083D;
 Mon,  7 Oct 2024 20:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F119C4CEC6;
 Mon,  7 Oct 2024 20:24:44 +0000 (UTC)
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
X-Inumbo-ID: 319cec4b-84ea-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728332685;
	bh=kGlF+GBbot2nWjfiSmrO4L3Xw0iTyJHFFwtaScNZIX8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ftlc5BCBFCb4rsA8h41q7jdiaMOjTAsonDSZWqv7NFgdzrVxMxqKfljg/SSRqQfbY
	 ZZnIAWTUecKBgeHt2lQ2VrKiSyKbqgG61tOXzUOlvkt4YHMSzGqGjwabIsxjC6DQP1
	 UpZkCa4gBG80Bw7+QkvUxU9e4Um/0ywLwBFclDRIb7kAdJBJyoZsoKPOjJsvrlxLnB
	 MlSeNBgWu87xO8UB6y3rYE8QtTS8ccdJyly9lHn0FxnU4D65R/9k62AjNA0YcL6my/
	 RzyqI1UPCN3GWJjoEpF5hvpDpy4IpFwNwlcZrHSJYYnYxlWvG78vB+MjO4Sloex6bV
	 Abf3RlOw025sQ==
Date: Mon, 7 Oct 2024 13:24:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v1 2/3] x86/hvm: introduce config option for stdvga
 emulation
In-Reply-To: <ZwO0mH0X96pbx8z_@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2410071311380.1138574@ubuntu-linux-20-04-desktop>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com> <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com> <Zv_pszkRrPXstXFW@macbook.local> <alpine.DEB.2.22.394.2410041407370.1138574@ubuntu-linux-20-04-desktop>
 <ZwO0mH0X96pbx8z_@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1408700942-1728331926=:1138574"
Content-ID: <alpine.DEB.2.22.394.2410071312110.1138574@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1408700942-1728331926=:1138574
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410071312111.1138574@ubuntu-linux-20-04-desktop>

On Mon, 7 Oct 2024, Roger Pau Monné wrote:
> On Fri, Oct 04, 2024 at 02:08:10PM -0700, Stefano Stabellini wrote:
> > On Fri, 4 Oct 2024, Roger Pau Monné wrote:
> > > On Fri, Oct 04, 2024 at 12:33:53PM +0300, Sergiy Kibrik wrote:
> > > > Introduce config option X86_STDVGA so that stdvga emulation driver can later be
> > > > made configurable and be disabled on systems that don't need it.
> > > > 
> > > > As a first step the option is hidden from user. No functional changes intended.
> > > > 
> > > > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > > > CC: Jan Beulich <jbeulich@suse.com>
> > > > ---
> > > >  xen/arch/x86/Kconfig              | 3 +++
> > > >  xen/arch/x86/hvm/Makefile         | 2 +-
> > > >  xen/arch/x86/include/asm/domain.h | 3 ++-
> > > >  xen/arch/x86/include/asm/hvm/io.h | 4 ++++
> > > >  4 files changed, 10 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> > > > index 95275dc17e..89c42ff6da 100644
> > > > --- a/xen/arch/x86/Kconfig
> > > > +++ b/xen/arch/x86/Kconfig
> > > > @@ -147,6 +147,9 @@ config INTEL_VMX
> > > >  config X86_PMTIMER
> > > >  	def_bool HVM
> > > >  
> > > > +config X86_STDVGA
> > > > +	def_bool HVM
> > > 
> > > Same as previous patch, the content of patch 3 needs to be moved here.
> > > 
> > > > +
> > > >  config XEN_SHSTK
> > > >  	bool "Supervisor Shadow Stacks"
> > > >  	depends on HAS_AS_CET_SS
> > > > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > > > index 321241f0bf..b7741b0f60 100644
> > > > --- a/xen/arch/x86/hvm/Makefile
> > > > +++ b/xen/arch/x86/hvm/Makefile
> > > > @@ -22,7 +22,7 @@ obj-$(CONFIG_X86_PMTIMER) += pmtimer.o
> > > >  obj-y += quirks.o
> > > >  obj-y += rtc.o
> > > >  obj-y += save.o
> > > > -obj-y += stdvga.o
> > > > +obj-$(CONFIG_X86_STDVGA) += stdvga.o
> > > >  obj-y += vioapic.o
> > > >  obj-y += vlapic.o
> > > >  obj-y += vm_event.o
> > > > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> > > > index 3f65bfd190..675a13d917 100644
> > > > --- a/xen/arch/x86/include/asm/domain.h
> > > > +++ b/xen/arch/x86/include/asm/domain.h
> > > > @@ -501,7 +501,8 @@ struct arch_domain
> > > >  #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
> > > >  #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
> > > >  #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
> > > > -#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
> > > > +#define has_vvga(d)        (IS_ENABLED(CONFIG_X86_STDVGA) && \
> > > 
> > > You don't need the IS_ENABLED() if emulation_flags_ok() is adjusted
> > > accordingly.
> > 
> > Same as patch #1 regarding compiler DCE, we could either do this or
> > define X86_EMU_VGA to zero
> 
> Yup, seen that.  Defining iX86_EMU_VGA to 0 would be my preference,
> like it's done for the !CONFIG_HVM case.

OK, in that case I suggest we go with defining X86_EMU_VGA and
X86_EMU_PM to 0


> Note however, that like has_vpm(), has_vvga() is only used in the file
> that this patch makes optional from the build.

Yeah but it seems more robust not to rely on that
--8323329-1408700942-1728331926=:1138574--

