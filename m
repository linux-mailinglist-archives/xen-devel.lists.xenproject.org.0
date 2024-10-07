Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E119928DC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811844.1224522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkin-0004Se-MV; Mon, 07 Oct 2024 10:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811844.1224522; Mon, 07 Oct 2024 10:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkin-0004R3-Jk; Mon, 07 Oct 2024 10:12:09 +0000
Received: by outflank-mailman (input) for mailman id 811844;
 Mon, 07 Oct 2024 10:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68k9=RD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sxkil-0004Qx-UG
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:12:07 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac902cf-8494-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 12:12:05 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5399041167cso6353453e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 03:12:05 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5d0a3dsm359961666b.24.2024.10.07.03.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 03:12:05 -0700 (PDT)
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
X-Inumbo-ID: 9ac902cf-8494-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728295925; x=1728900725; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFSHhKbYhEmL6Sr9NK5TSCAEli7Qx8cjTwwlN5tVCHk=;
        b=NhZFt2WLXflo9NDRcc/kZ6ozoHwYURZKFaxZ21gZrBIRL8YcOwJ6cyHFsY91icaJ+6
         jCaVQhXOQR4j+JUuK1Dzobd/KcGOwzcj5L7/DJmTeKh45uLMmc+kwLxx21gPOvinRcBI
         ClSQtfAmPxhvj8vDEv/cimGBxZ3JAP4zafl8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728295925; x=1728900725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFSHhKbYhEmL6Sr9NK5TSCAEli7Qx8cjTwwlN5tVCHk=;
        b=pe4ap7dkXn4FE5gqldF84MJM9C7vHF+qMXB6xjVMEiWIkMbqgELFqCnh5Tgw+3D34s
         j8v7fWD00WNFUXS/pwBfW2yhmAmeXg2xDaOb8eJ0w6ksWYBLYqBOd2aRGppwkQ7wxWKI
         Ak7Ssygn5Ryb+UjuYeIVIubDFnD7AD/hg6zeQm9s8wKtvSVBjB1YmeHKw7q4eiX9TLp7
         K6hBIvbjwCzN2uBO65j5tSzpo3FfO9gGaQS+gPl7JnNmEO6slHmBeSuOBzPmeyCN7kDa
         SSmSVW2v1RRd7Vy0X7kMOEyXgmA2pVthS0su7IO3rtRV0wuBCCOJnf99QEpS17+0R1Ll
         xx7w==
X-Forwarded-Encrypted: i=1; AJvYcCWjjoUw6ULYU35ypJh5hqMWJCiiS69XbEn5H+SWwT+weRO/IwW9vv79iL5+gOsjz17gkFMniJJaWCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+QdoLSK6CPcWlMzl91hNHkiAUPYVkov4Im85C1mymXIJWdov+
	FCtRhzDCn0ARFiaqqYYDKcanT5WmKfAhnwpgVcEUn/A53n3ATnz4JIsSDkiilXY=
X-Google-Smtp-Source: AGHT+IH3RzFjV8RvrlEmMJxpqLllHphwKRxkb3q7KCjAtPBgIIuWQoBEY5KRtR0Mj/2wHDN6Hsqthg==
X-Received: by 2002:a05:6512:1256:b0:536:741a:6bc5 with SMTP id 2adb3069b0e04-539ab84e0ebmr5598135e87.12.1728295925316;
        Mon, 07 Oct 2024 03:12:05 -0700 (PDT)
Date: Mon, 7 Oct 2024 12:12:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: Re: [XEN PATCH v1 1/3] x86/hvm: introduce config option for ACPI PM
 timer
Message-ID: <ZwOz81NgKetWDpVc@macbook.local>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
 <3ef3724e21b196edd277c94598ebe6624813ede4.1728032664.git.Sergiy_Kibrik@epam.com>
 <Zv_pHR8gUrcHQU5I@macbook.local>
 <36069df2-64ec-4f0e-908e-d0128630daea@suse.com>
 <alpine.DEB.2.22.394.2410041404430.1138574@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2410041404430.1138574@ubuntu-linux-20-04-desktop>

On Fri, Oct 04, 2024 at 02:07:09PM -0700, Stefano Stabellini wrote:
> On Fri, 4 Oct 2024, Jan Beulich wrote:
> > On 04.10.2024 15:09, Roger Pau Monné wrote:
> > > On Fri, Oct 04, 2024 at 12:31:50PM +0300, Sergiy Kibrik wrote:
> > >> --- a/xen/arch/x86/include/asm/domain.h
> > >> +++ b/xen/arch/x86/include/asm/domain.h
> > >> @@ -496,7 +496,8 @@ struct arch_domain
> > >>  
> > >>  #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
> > >>  #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
> > >> -#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
> > >> +#define has_vpm(d)         (IS_ENABLED(CONFIG_X86_PMTIMER) && \
> > >> +                            !!((d)->arch.emulation_flags & X86_EMU_PM))
> > > 
> > > Do you really need the IS_ENABLED() here?  If you modify
> > > emulation_flags_ok() to reject the flag if not available it won't be
> > > possible for any domain to have it set.
> > 
> > With the IS_ENABLED() the only other approach to have the compiler DCE any
> > code left unreachable would be to #define X86_EMU_PM to 0 in that case. I
> > guess I'd slightly prefer that alternative, but otherwise the approach used
> > here would still be wanted imo.
> 
> The compiler DCE is important, either the approach in this patch or
> Jan's suggestion would work fine as far as I can tell.

I guess I was too focused on has_vpm() usage: note that has_vpm() is
only used in the file that's being removed from the build, so there
will be nothing to DCE afterwards.  That however might not be the case
for all has_* options, neither for has_vpm() moving forwards.

Thanks, Roger.

