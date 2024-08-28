Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F5962829
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 15:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784797.1194190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIKG-0001FS-F1; Wed, 28 Aug 2024 13:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784797.1194190; Wed, 28 Aug 2024 13:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjIKG-0001Cw-CO; Wed, 28 Aug 2024 13:03:04 +0000
Received: by outflank-mailman (input) for mailman id 784797;
 Wed, 28 Aug 2024 13:03:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecal=P3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjIKF-0001Cq-IH
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 13:03:03 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db1d9ae8-653d-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 15:03:02 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6bf7a2035d9so5365336d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 06:03:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d1d25bsm65315876d6.3.2024.08.28.06.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 06:03:00 -0700 (PDT)
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
X-Inumbo-ID: db1d9ae8-653d-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724850181; x=1725454981; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tRcdpoX5CUpqmqbn355dj5OGtL+pHqOUjSPJWnpeuv0=;
        b=n4pNjXb/EmWiujxKwBS3sIJ3yQCnqyw1KBrXUPoGCWdpb2/jyiMMs03UM2unk7fpi4
         iTug2uBaV+lwLX6tHiv7mR5tESHSK4X+xcI6rEF6Gg1HAiPlYsbYviIUhDW/UjO0cSgZ
         cJsK387kC/i2/fAgVGJsX+qZEDDdoRkmtIEqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724850181; x=1725454981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRcdpoX5CUpqmqbn355dj5OGtL+pHqOUjSPJWnpeuv0=;
        b=Lcs7pLsNq8gCrF6jGLqWGwx036rlxSGAbyQgdklA/DbNeLB9SgIGxXmr7gvoet+mDJ
         agoGOoOCBMzZ6Hkkc6wgsC9GVjzLyNVb64z8AZPV/oRcwp9bVkTbSFbE//k07uJA1t9l
         HkzCm4aPDIojAsiok0wqNS9vMmzhAPKC2O7NHshm6DrXj07/wHzHnIEfD2p3zqXqjAK1
         NIXxoCAgfz18N6qqV1DnCdwXyMCi+Mdr4JDOpywm2H5zUGK1roI1qxWUr6kJIfeMy/ff
         JIz0KhTKR3KD3pG686FmPyAvj4lAj+HPILDOoYlal+Rw6asITm3W5yDxWVdCaPF2Sa2q
         VPSg==
X-Forwarded-Encrypted: i=1; AJvYcCVuuHbM7h7uJVA7yeFgGFuFRS8UwPJ9fMs5XuVrQMn2itd4a4iXmUASl4FmCrf+mhc3kbG3ZGBFvJk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM6hT3cd3Cee/ehBWiswhJewfkk2SaEQkr43JIgUtH82cBdK1Q
	is3zUH1gaAZsCQdAEsHUulLnyEwGXPIJlgG1lo8PcmfFuZIeHk3pQaZN7/uGzE5Rk1eWY0FTjlA
	L
X-Google-Smtp-Source: AGHT+IE++OUJx5ej4DQZImKabBRDSee5543G4gwOjQxw4Eld3DGV4OiP7suzVhXAuA9fZHJIc+6ymA==
X-Received: by 2002:a05:6214:4a8b:b0:6c3:355e:12b3 with SMTP id 6a1803df08f44-6c335d7c352mr40441506d6.23.1724850180671;
        Wed, 28 Aug 2024 06:03:00 -0700 (PDT)
Date: Wed, 28 Aug 2024 15:02:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] x86/dom0: disable SMAP for PV domain building only
Message-ID: <Zs8gAuc5qoVsVkQe@macbook.local>
References: <20240828113044.35541-1-roger.pau@citrix.com>
 <50658093-8463-4ee3-b308-31be2dd1fd42@suse.com>
 <bd206c4d-8e1d-488c-b428-3f6402a9ae4f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd206c4d-8e1d-488c-b428-3f6402a9ae4f@citrix.com>

On Wed, Aug 28, 2024 at 12:51:23PM +0100, Andrew Cooper wrote:
> On 28/08/2024 12:50 pm, Jan Beulich wrote:
> > On 28.08.2024 13:30, Roger Pau Monne wrote:
> >> Move the logic that disables SMAP so it's only performed when building a PV
> >> dom0, PVH dom0 builder doesn't require disabling SMAP.
> >>
> >> The fixes tag is to account for the wrong usage of cpu_has_smap in
> >> create_dom0(), it should instead have used
> >> boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
> >> only.
> >>
> >> While there also make cr4_pv32_mask __ro_after_init.
> >>
> >> Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > preferably with ...
> >
> >> @@ -1051,6 +1051,34 @@ out:
> >>      return rc;
> >>  }
> >>  
> >> +int __init dom0_construct_pv(struct domain *d,
> >> +                             const module_t *image,
> >> +                             unsigned long image_headroom,
> >> +                             module_t *initrd,
> >> +                             const char *cmdline)
> >> +{
> >> +    int rc;
> >> +
> >> +    /*
> >> +     * Temporarily clear SMAP in CR4 to allow user-accesses in
> >> +     * construct_dom0().  This saves a large number of corner cases
> > ... the final 's' dropped here and ...
> >
> >> +     * interactions with copy_from_user().
> >> +     */
> >> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> >> +    {
> >> +        cr4_pv32_mask &= ~X86_CR4_SMAP;
> >> +        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> >> +    }
> >> +    rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
> >> +    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> > ... blank lines added around the function call. Happy to adjust while
> > committing, so long as you agree.
> 
> +1 to both suggestions.

Sure, please adjust at commit.

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks (to both).

