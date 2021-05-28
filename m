Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514AF393A5C
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 02:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133717.249132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmQWb-0007iG-L3; Fri, 28 May 2021 00:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133717.249132; Fri, 28 May 2021 00:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmQWb-0007gJ-Hf; Fri, 28 May 2021 00:38:53 +0000
Received: by outflank-mailman (input) for mailman id 133717;
 Fri, 28 May 2021 00:38:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbG1=KX=linaro.org=linus.walleij@srs-us1.protection.inumbo.net>)
 id 1lmQWZ-0007fv-7Q
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 00:38:51 +0000
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b0d2d0d-937c-4ecb-970c-107aa2c8a533;
 Fri, 28 May 2021 00:38:50 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 131so3154344ljj.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 17:38:50 -0700 (PDT)
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
X-Inumbo-ID: 0b0d2d0d-937c-4ecb-970c-107aa2c8a533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3tZvKVXXK1CrsVCEdwk4kRijURbW1gkRo3MklbEt43g=;
        b=dzDstQmFnkHnT2yUIYKLBRRBS9fEvHqlCfVDyb072nsd2XLJcbMC9YytfAlVCe02vE
         w9imrgViRD9UmJFiNPktvwlhL+FSug8rzH1rndJtVlz3QQe+LaHVPjU6VmarHmQVjLz9
         xf8j7GTU197/jPwSsOeFHBpLr83hJSyRTW1TXntHZd/bB1uAuI+WQ+bhSHrv/SWtMmVd
         kyaH7en3LnMLvCu2BrfR+25SZJ37jTDiSZTB3f4yqmQeYCEoZnJSe4DbXuwQ/ieUoyZH
         Yg2q/hN5vESri9Wyb+J0nlja9X++NyijNUy+ePQmji3JkVQ2yCofSythjNO8OPePTRya
         28LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3tZvKVXXK1CrsVCEdwk4kRijURbW1gkRo3MklbEt43g=;
        b=Gyc4xsBZ+UrI3QjwjwRFyTsqxsBBckomYzuTda0zZGqKCciiEuZfV/HZ8Xf54R8fbL
         clvOvACJ5zy86EuxqzSsPQkevlc+scXBSM+kGSvsipWHY+/HUo6vtWdaioeqKnT0Pa0H
         hFIRp+lvcWRIzv+DcgpwlZLiJQ/WbYMAc3XI89La7Q4rZquMo5ySWI4Jn64rsJ5Df96p
         L+7o6AkD6BfUGs15PKcAM9YpyEptl8OKISDxmPbb8b/I66FHVJRXHwpvlelt8o2tfY0Q
         6WAX4FKzm2Fqywfe9KP246oqw0Gq8EwXPJnaJht6+H7Q0aK2wSYxM7p4HrPFBpGl9DKG
         INBw==
X-Gm-Message-State: AOAM532ruzWV3RCxF3zo/5J6XkJIen9nAiX9VeKi5D1lpiDdGpMqczdB
	S3/TOA1Cz6Ox2nP6LEmLPEjHyCeyV5N4Srx4OTc4KA==
X-Google-Smtp-Source: ABdhPJz7njZd2vaMPN20MaL5HfLauAdefifx8indoEE9qbs7jFDoqG1iIPLF/BJ6sjZMAVRNssGVEUTUE+E+NW+cvHo=
X-Received: by 2002:a05:651c:4c6:: with SMTP id e6mr4571492lji.326.1622162328960;
 Thu, 27 May 2021 17:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch> <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 02:38:38 +0200
Message-ID: <CACRpkdbZf_cTMppxfC4mM6XZ2YySH7dQ0NCY6v_pfwsdRzLPKA@mail.gmail.com>
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Emma Anholt <emma@anholt.net>, David Lechner <david@lechnology.com>, 
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:

> Goes through all the drivers and deletes the default hook since it's
> the default now.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: David Lechner <david@lechnology.com>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: xen-devel@lists.xenproject.org

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

