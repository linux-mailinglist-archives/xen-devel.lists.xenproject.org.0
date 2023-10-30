Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4547DBDC3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625287.974443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV4f-0003ri-G3; Mon, 30 Oct 2023 16:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625287.974443; Mon, 30 Oct 2023 16:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxV4f-0003pP-C4; Mon, 30 Oct 2023 16:25:09 +0000
Received: by outflank-mailman (input) for mailman id 625287;
 Mon, 30 Oct 2023 16:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxV4d-0003o6-Kf
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:25:07 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e25f0938-7740-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:25:05 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9d34b2b51a5so220805966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:25:05 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 i19-20020a1709063c5300b0098884f86e41sm6147247ejg.123.2023.10.30.09.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 09:25:04 -0700 (PDT)
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
X-Inumbo-ID: e25f0938-7740-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698683105; x=1699287905; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=99qu0f/IB7zYA48TZXIbF83b7dqXVJSK/aWx+C0Beng=;
        b=e4lAZLhTBhsyt6cVR0zPxJ+fklDKfMSK5m+xCWWTKujnt5w6CQKHEu1u4D9zUIUawc
         8ur4kwFJCwkbTrggUmM0Pz/cuXV23dW2lY84HcH/OnbPiqU2LbrrG7S0FkHzdT21pqNP
         ZNZDbNgOxBCDECPlfOtzblh5e/ldjsAGyAF54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683105; x=1699287905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99qu0f/IB7zYA48TZXIbF83b7dqXVJSK/aWx+C0Beng=;
        b=YXtK4AeKVRfKUBhgci1UVTzS/Vj8P0XAgCl6gF1iM+sS6JeGx1NXV9xTNr9cejKAfl
         239/k29HMbbDGH5Bb2PX/OtNQYUjmXkBKIexEZBTm2mHFGNVwZw6dmNvqCMm9Hp+BRMZ
         2iJeVQ/BPkNEYjzTd79HewfFGxvCF8h5sTuRt8PK7ZXslQpdJwQuA42Wm/+N459PphK6
         prdBEGe7m3tXiHG4l4MI3cDRr0dY51Ird9MSGmvKAudWFk9K3uDox/8e+cCnt40e/hVt
         8CclTM/st05TvlpnmIfHxc3lDfN2mEdKfxW7t873Ey6/opGWf3YZpT2KNndrq0g/WeI6
         qR8g==
X-Gm-Message-State: AOJu0YwYtIS975B5+07Ya34PyJ94BCoUh/d1tBojZwwRqhXhSzz5c/D6
	1KIODEhftDH3JzkAwldoxk+UuA==
X-Google-Smtp-Source: AGHT+IF+ulQiLt/I0+C9yuIca3JQT2irf09AxoI4exEUDd5SJnsL5ZEHKpFZ0Ub2me+qU1O3XmdCig==
X-Received: by 2002:a17:907:74d:b0:9c6:9342:1459 with SMTP id xc13-20020a170907074d00b009c693421459mr7754388ejb.20.1698683105105;
        Mon, 30 Oct 2023 09:25:05 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:25:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Message-ID: <ZT_Y4KmwRld3j1fR@macbook>
References: <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com>
 <ZTponIYDYDWRZhzi@macbook>
 <75026813-03fe-3a46-2274-b93e98f62f89@suse.com>
 <ZTqDjNSBmXeblsud@macbook>
 <d3da9300-781f-9abb-158b-0c82d36228f5@suse.com>
 <ZT_IP_-X4oLhmcFT@macbook>
 <e4929b28-5608-bba8-9953-270f408e32eb@suse.com>
 <ZT_KbM0tzrn5cWR6@macbook>
 <23a229f8-9987-ead4-995f-a917300ac6ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23a229f8-9987-ead4-995f-a917300ac6ae@suse.com>

On Mon, Oct 30, 2023 at 04:35:41PM +0100, Jan Beulich wrote:
> On 30.10.2023 16:23, Roger Pau Monné wrote:
> > On Mon, Oct 30, 2023 at 04:19:22PM +0100, Jan Beulich wrote:
> >> On 30.10.2023 16:14, Roger Pau Monné wrote:
> >>> On Mon, Oct 30, 2023 at 01:24:52PM +0100, Jan Beulich wrote:
> >>>> On 26.10.2023 17:19, Roger Pau Monné wrote:
> >>>>> Maybe the issue is that PV_SHIM_EXCLUSIVE shouldn't have been a
> >>>>> Kconfig option in the first place, and instead a specific Kconfig
> >>>>> config file?
> >>>>>
> >>>>> Maybe it's not possible to achieve the same using just a Kconfig
> >>>>> config file.
> >>>>
> >>>> I'm afraid I don't understand what you mean by "Kconfig config file". It
> >>>> can't really be just another .../Kconfig file somewhere in the tree, as
> >>>> it doesn't really matter where an option like this would be defined.
> >>>
> >>> No, I was thinking of splitting what PV_SHIM_EXCLUSIVE actually
> >>> implies, for example by adding CONFIG_DOMCTL_HYPERCALLL or
> >>> CONFIG_PLATFORM_HYPERCALL and re-work the pvshim_defconfig config file
> >>> based on those, so that we don't end up with negative relations.
> >>>
> >>> Note sure all usages of PV_SHIM_EXCLUSIVE can be split in such a way,
> >>> maybe we would need some compromise.
> >>
> >> Wouldn't such a CONFIG_DOMCTL_HYPERCALL then still want to depend on
> >> !PV_SHIM_EXCLUSIVE, which is the kind of dependency we want to avoid?
> >> Aiui the two (splitting and inverting) are largely orthogonal aspects.
> > 
> > No, CONFIG_DOMCTL_HYPERCALL could be promptless option enabled by
> > default and disabled by the pvshim_defconfig.
> 
> pvshim_defconfig shouldn't play a role here. Anyone configuring a shim
> build from scratch should also get a consistent set of settings.

Then we might have to expose those more fine grained options.

My sauggestion was to still allow enabling shim mode from by the user,
but that building a pv-shim exclusive image would require using the
pvshim_defconfig, to simply avoid exposing a bunch of fine grained
options that only make sense for pv-shim exclusive builds.

If that's not sensible, we might consider exposing those more fine
grained options.

Thanks, Roger.

