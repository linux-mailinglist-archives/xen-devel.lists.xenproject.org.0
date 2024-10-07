Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58979928EE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811849.1224531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxklR-000523-2L; Mon, 07 Oct 2024 10:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811849.1224531; Mon, 07 Oct 2024 10:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxklQ-000502-W5; Mon, 07 Oct 2024 10:14:52 +0000
Received: by outflank-mailman (input) for mailman id 811849;
 Mon, 07 Oct 2024 10:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68k9=RD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sxklO-0004zv-Pa
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:14:50 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc8ebe5b-8494-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 12:14:49 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53993564cb1so4588268e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 03:14:49 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7e3b54sm358604066b.211.2024.10.07.03.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 03:14:49 -0700 (PDT)
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
X-Inumbo-ID: fc8ebe5b-8494-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728296089; x=1728900889; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9GtaJPDI2oXiodho5q0lJPE2HxeAvEUViQCleTXMbHI=;
        b=G8AruxJ5pFTipfdIbt+fLJ4ZlM4JwlIAPjKGLGSo7NKpX5A7m6+GAJ3c6RLJ3ejnAJ
         k1steYqmVCwU27Zaw+1QclvmLpnvAkrgVBmroAE7ffN0gSfsBvJ1wRMkqhS6WsHPIYWm
         dvfMgNp1MV0SLn4BFnbPnlphHK4+qRaZEtm4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728296089; x=1728900889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GtaJPDI2oXiodho5q0lJPE2HxeAvEUViQCleTXMbHI=;
        b=HmJXZILVaCGF4l/hfwokXK5uzLBYgWu/dtN+EtWlR/BVXZ6hUzEuQ9XMGWeJbplWEJ
         M1DDt9bQcxJPNoJ0gKiMfPzEYvcu2rdrT33BdxZly/pmJm9LfjI1xr3kyatotaWo185q
         wfC0milTpLZDQ4qmkDJ7FDWC/17RnEecWEOzdwtcEo9sFTquDC6QyB7wyegbOL73LZ1O
         PL02qlrOspu06JfnXbNZc9getAKBNP28P+dmEhH7fJUtaBbV8COb5Xei4E7bkK+2UioR
         mwtmj4ACrWb1OowQ5gLXZgiJTnzYs0q1GDoGfyjKr2MpwbMSU+yr74Ex6GUVvfm6B2ek
         Pa/A==
X-Forwarded-Encrypted: i=1; AJvYcCWGHNX6il7BFY153gbnRTwx4QZrkRFCqESkqkZcwC0WXhI+C23tWkNvrq43ZBdof+CmOjoBVGoorVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQHx66y36Z5Gj7P8+YZHmTePIcbvO0pMhm618ZdUy0W7BZGncr
	mGv8cUUXVqVtY8PlrypnX7FfGzB5XlV0lb4aWVAWTpFNo/pQ05rDs8AZVQJGHRs=
X-Google-Smtp-Source: AGHT+IE6Uhjc1HCq1+GB7jQICHiXL98qFxGbK++UQXlXnh6rCQVdH2UVaMb1x+vq+3OtXDKPk/caFQ==
X-Received: by 2002:a05:6512:1091:b0:536:548a:ff89 with SMTP id 2adb3069b0e04-539ab8ae3eamr5143755e87.39.1728296089414;
        Mon, 07 Oct 2024 03:14:49 -0700 (PDT)
Date: Mon, 7 Oct 2024 12:14:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v1 2/3] x86/hvm: introduce config option for stdvga
 emulation
Message-ID: <ZwO0mH0X96pbx8z_@macbook.local>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
 <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com>
 <Zv_pszkRrPXstXFW@macbook.local>
 <alpine.DEB.2.22.394.2410041407370.1138574@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2410041407370.1138574@ubuntu-linux-20-04-desktop>

On Fri, Oct 04, 2024 at 02:08:10PM -0700, Stefano Stabellini wrote:
> On Fri, 4 Oct 2024, Roger Pau Monné wrote:
> > On Fri, Oct 04, 2024 at 12:33:53PM +0300, Sergiy Kibrik wrote:
> > > Introduce config option X86_STDVGA so that stdvga emulation driver can later be
> > > made configurable and be disabled on systems that don't need it.
> > > 
> > > As a first step the option is hidden from user. No functional changes intended.
> > > 
> > > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > > CC: Jan Beulich <jbeulich@suse.com>
> > > ---
> > >  xen/arch/x86/Kconfig              | 3 +++
> > >  xen/arch/x86/hvm/Makefile         | 2 +-
> > >  xen/arch/x86/include/asm/domain.h | 3 ++-
> > >  xen/arch/x86/include/asm/hvm/io.h | 4 ++++
> > >  4 files changed, 10 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> > > index 95275dc17e..89c42ff6da 100644
> > > --- a/xen/arch/x86/Kconfig
> > > +++ b/xen/arch/x86/Kconfig
> > > @@ -147,6 +147,9 @@ config INTEL_VMX
> > >  config X86_PMTIMER
> > >  	def_bool HVM
> > >  
> > > +config X86_STDVGA
> > > +	def_bool HVM
> > 
> > Same as previous patch, the content of patch 3 needs to be moved here.
> > 
> > > +
> > >  config XEN_SHSTK
> > >  	bool "Supervisor Shadow Stacks"
> > >  	depends on HAS_AS_CET_SS
> > > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > > index 321241f0bf..b7741b0f60 100644
> > > --- a/xen/arch/x86/hvm/Makefile
> > > +++ b/xen/arch/x86/hvm/Makefile
> > > @@ -22,7 +22,7 @@ obj-$(CONFIG_X86_PMTIMER) += pmtimer.o
> > >  obj-y += quirks.o
> > >  obj-y += rtc.o
> > >  obj-y += save.o
> > > -obj-y += stdvga.o
> > > +obj-$(CONFIG_X86_STDVGA) += stdvga.o
> > >  obj-y += vioapic.o
> > >  obj-y += vlapic.o
> > >  obj-y += vm_event.o
> > > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> > > index 3f65bfd190..675a13d917 100644
> > > --- a/xen/arch/x86/include/asm/domain.h
> > > +++ b/xen/arch/x86/include/asm/domain.h
> > > @@ -501,7 +501,8 @@ struct arch_domain
> > >  #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
> > >  #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
> > >  #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
> > > -#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
> > > +#define has_vvga(d)        (IS_ENABLED(CONFIG_X86_STDVGA) && \
> > 
> > You don't need the IS_ENABLED() if emulation_flags_ok() is adjusted
> > accordingly.
> 
> Same as patch #1 regarding compiler DCE, we could either do this or
> define X86_EMU_VGA to zero

Yup, seen that.  Defining iX86_EMU_VGA to 0 would be my preference,
like it's done for the !CONFIG_HVM case.

Note however, that like has_vpm(), has_vvga() is only used in the file
that this patch makes optional from the build.

Thanks, Roger.

