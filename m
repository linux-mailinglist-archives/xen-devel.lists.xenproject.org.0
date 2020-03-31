Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C344019996F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 17:18:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJIbo-0003BA-MH; Tue, 31 Mar 2020 15:15:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qQpi=5Q=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1jJIbm-0003B5-PH
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 15:15:18 +0000
X-Inumbo-ID: 6dde3ec2-7362-11ea-b58d-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dde3ec2-7362-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 15:15:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a81so3150351wmf.5
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2020 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ipYWlIFq3tHRPQUnqZtBdxsK4/UyR731/H9eH9PnfT4=;
 b=KbvvbCuWTnx3deVUNXfh6ZH7/iir2HKLToXknDwo7In/7NB8wHWU62m7SbNHlQK15w
 NYMV8jhWujQQ7f0S6Ej7AT5Bn2gH8fg/ntDxAxG/2Ml3w1WIM8Eh5GxUxAw2z0TfpFML
 V4jsubaGezs2z+6lJKnB1kN6/No3ukTNiELuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ipYWlIFq3tHRPQUnqZtBdxsK4/UyR731/H9eH9PnfT4=;
 b=uLHhjgZu9kOp26MU6JzkyXj4Mylw+mGSmkppI5/cL9l/L+AJAZVk4sBz3PsLCnmJbT
 nIwGFYPKH1vzPBB6srIsPlD59tRyz2zQt+sK+NDwdMYKeh9Wv+Jvh1wEQDXWl8mKCMjP
 mVIvJ4q9ytOzPkllZ3EFySRcTT9DPiaaQtHpS9lm+QaaO+xJFmsiITBbS6RMrK+Rk1L0
 MdesVWpVZgBwAC9vlvm+PxoRU50SXJu90fJgNLe+dgQeoYb729ARMxb7GUQFVL21Bm6l
 sUMTJwFWDvJj/pfvHOfGIo15TtSm3L2xlWaMWAAfFMoBzniBBCkn1BJveQOlrCOJn0Sy
 tZ0A==
X-Gm-Message-State: ANhLgQ0h/t2oi3UHbEpw/ZNs/C+MjlroDjM5I70ClvuobS/QGVbrVCQw
 2YlL09VwG5JQeObUR6Qsxf923w==
X-Google-Smtp-Source: ADFU+vtAGfwopaPt/m4X2IibkfKMGh7X4KlgcFgCC08sXSkC7SEmBbQwoH17zK8HUyK6RhKgz0hjCQ==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr3935335wmb.124.1585667717161; 
 Tue, 31 Mar 2020 08:15:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v21sm4140105wmj.8.2020.03.31.08.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 08:15:16 -0700 (PDT)
Date: Tue, 31 Mar 2020 17:15:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [Xen-devel] [PATCH] drm/xen: fix passing zero to 'PTR_ERR' warning
Message-ID: <20200331151514.GO2363188@phenom.ffwll.local>
Mail-Followup-To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Ding Xiang <dingxiang@cmss.chinamobile.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <1585562347-30214-1-git-send-email-dingxiang@cmss.chinamobile.com>
 <b4d43b05-8b30-749c-0b60-87b4cdd7b1dd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d43b05-8b30-749c-0b60-87b4cdd7b1dd@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ding Xiang <dingxiang@cmss.chinamobile.com>, daniel@ffwll.ch,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 31, 2020 at 05:50:10PM +0300, Oleksandr Andrushchenko wrote:
> On 3/30/20 12:59, Ding Xiang wrote:
> > Fix a static code checker warning:
> >      drivers/gpu/drm/xen/xen_drm_front.c:404 xen_drm_drv_dumb_create()
> >      warn: passing zero to 'PTR_ERR'
> > 
> > Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

merged to drm-misc-next-fixese.
-Daniel

> > ---
> >   drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> > index 4be49c1..3741420 100644
> > --- a/drivers/gpu/drm/xen/xen_drm_front.c
> > +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> > @@ -401,7 +401,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
> >   	obj = xen_drm_front_gem_create(dev, args->size);
> >   	if (IS_ERR_OR_NULL(obj)) {
> > -		ret = PTR_ERR(obj);
> > +		ret = PTR_ERR_OR_ZERO(obj);
> >   		goto fail;
> >   	}

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

