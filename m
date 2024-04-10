Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D159C89FCFE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 18:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703443.1099136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruatu-0005VV-1Y; Wed, 10 Apr 2024 16:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703443.1099136; Wed, 10 Apr 2024 16:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruatt-0005Sw-VC; Wed, 10 Apr 2024 16:34:17 +0000
Received: by outflank-mailman (input) for mailman id 703443;
 Wed, 10 Apr 2024 16:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FY1=LP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruats-0005So-Dr
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 16:34:16 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5032a0-f758-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 18:34:15 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34665dd7610so468081f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 09:34:15 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 dx18-20020a0560000e1200b00343d840b3f8sm14052814wrb.33.2024.04.10.09.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 09:34:14 -0700 (PDT)
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
X-Inumbo-ID: 2b5032a0-f758-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712766855; x=1713371655; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wrg8+/52Qx2VD0ziJFUTnYlaVPI9+ixypph2v1bHypA=;
        b=ooOK8TLrfgpu37hDZIyDFRWWLeBh1nlPeASm8tD60DBZbYKR5+KL8rzGGr8ntlfX/y
         aPe/fwfDx5fweiKA+HQ4CRhPpNtqR2cyRuCj02ycW5WK+nGxvbK909AZWopEB8Ob5TTL
         ROUK6OQ+9Fvwgri9FxJ/fNuRxffjkxvs7d7ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712766855; x=1713371655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrg8+/52Qx2VD0ziJFUTnYlaVPI9+ixypph2v1bHypA=;
        b=eqyfgGWLOrJFbxsNCCgQo6d1oZkJsRI5zy15q84nWdONP1UtpxJ8X8XzAnBEtI8nmA
         IUF3dR8Inay1K672lUCVxqM3Ybx69VrT7nemvIlZSqt1y1b5M/AO2p0xMahWh6FapPkT
         BYFRk4fVKMY+3/VG5jcIllWLgjBtsq+CzTfPydg33J4VptTgFCvWBGvvgSmSUVgdtXsN
         RTxU+fOCFF48GTVawDdXrjmCvwkJmImCcy/j7ozlx/I7Okmbcu0d5/SCszqQEzh94H9O
         nJAbLFwIAOlt2cwv6lJMkKz/jXyTU0VL6drcb3/J8LwEXLPVlQXmOuqWZcE604hNMQLA
         0Sgw==
X-Gm-Message-State: AOJu0YxyiW+7RMXhH8KRRlPfNgFK75XbQma9CY3/mEpG/g206NL8wOYk
	vUTo0ah1AxBx9w3G7yJWt8Zi93iEalyhup8zf6k7PqQA1qxviLxFP/7pLeRNfSg=
X-Google-Smtp-Source: AGHT+IFfTYvtK2w2Ovj2gDQ0na9DutXaEhdjWdgXJpPqoIvfm1Jo6vNXzQ+H7W/GWo0V+idMGoPtWg==
X-Received: by 2002:adf:f146:0:b0:342:40b0:abf5 with SMTP id y6-20020adff146000000b0034240b0abf5mr1873341wro.55.1712766854623;
        Wed, 10 Apr 2024 09:34:14 -0700 (PDT)
Date: Wed, 10 Apr 2024 18:34:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Message-ID: <Zha_hXU3zRwVzFZN@macbook>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
 <Zhas4MQdL3hQ6Uww@macbook>
 <2fd969ef-8326-4ae8-a568-4256f00542f0@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fd969ef-8326-4ae8-a568-4256f00542f0@citrix.com>

On Wed, Apr 10, 2024 at 05:21:37PM +0100, Andrew Cooper wrote:
> On 10/04/2024 4:14 pm, Roger Pau Monné wrote:
> > On Thu, Oct 26, 2023 at 09:55:39PM +0100, Andrew Cooper wrote:
> >> +
> >> +config AMD
> >> +	bool "AMD"
> >> +        default y
> >> +        help
> >> +          Detection, tunings and quirks for AMD platforms.
> >> +
> >> +	  May be turned off in builds targetting other vendors.  Otherwise,
> >> +	  must be enabled for Xen to work suitably on AMD platforms.
> >> +
> >> +config INTEL
> >> +	bool "Intel"
> >> +        default y
> >> +        help
> >> +          Detection, tunings and quirks for Intel platforms.
> >> +
> >> +	  May be turned off in builds targetting other vendors.  Otherwise,
> >> +	  must be enabled for Xen to work suitably on Intel platforms.
> > There seems to be a weird mix between hard tabs and spaces above.
> > Naming is OK for me.
> 
> Yeah.  I already fixed those locally.

With that fixed:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> >> +
> >> +endmenu
> >> diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
> >> index aae235245b06..30d600544f45 100644
> >> --- a/xen/arch/x86/cpu/microcode/Makefile
> >> +++ b/xen/arch/x86/cpu/microcode/Makefile
> >> @@ -1,3 +1,3 @@
> >> -obj-y += amd.o
> >> +obj-$(CONFIG_AMD) += amd.o
> >>  obj-y += core.o
> >> -obj-y += intel.o
> >> +obj-$(CONFIG_INTEL) += intel.o
> >> diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
> >> index b58611e908aa..da556fe5060a 100644
> >> --- a/xen/arch/x86/cpu/microcode/private.h
> >> +++ b/xen/arch/x86/cpu/microcode/private.h
> >> @@ -70,7 +70,16 @@ struct microcode_ops {
> >>   * support available) and (not) ops->apply_microcode (i.e. read only).
> >>   * Otherwise, all hooks must be filled in.
> >>   */
> >> +#ifdef CONFIG_AMD
> >>  void ucode_probe_amd(struct microcode_ops *ops);
> >> +#else
> >> +static inline void ucode_probe_amd(struct microcode_ops *ops) {}
> >> +#endif
> >> +
> >> +#ifdef CONFIG_INTEL
> >>  void ucode_probe_intel(struct microcode_ops *ops);
> >> +#else
> >> +static inline void ucode_probe_intel(struct microcode_ops *ops) {}
> > This is stale now, and will need some updating to match what's in
> > private.h.
> 
> There's nothing state I can see.
> 
> Patch 1 does significantly edit this vs what's currently in staging.

Oh, sorry, I'm missed patch 1 then.

Thanks, Roger.

