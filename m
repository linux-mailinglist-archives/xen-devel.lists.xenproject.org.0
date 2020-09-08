Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91146261282
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 16:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFeSi-0003Vz-SU; Tue, 08 Sep 2020 14:19:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1o9A=CR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kFeSh-0003Vq-Hc
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 14:19:07 +0000
X-Inumbo-ID: 78ae6911-7781-4a6f-a21b-50aab8a1a643
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78ae6911-7781-4a6f-a21b-50aab8a1a643;
 Tue, 08 Sep 2020 14:19:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c18so19279286wrm.9
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 07:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HmLARCgfbUmx3TuN76C/0dfbls9falHWREd4x46/g+8=;
 b=JgihbqFoPfg5h9fsucpQJv9SC8VJRVfBDl8/bghzPAwQlwc4zc4iL+iJZcbn4ubi+5
 xKML9/J6ylYUxEDGCkfJDokirMNuddhz+/Y6jMLQw7PIzE2nncs3PSrBztAhGkn2saST
 nHZnF+H+t4l5dFuz8i5tecv3CrUGR94btPhlO91MBYAFIGEH+9L8awfhFm6MQ6khK9mI
 DZRv0odVt3p+UheWANlRIFk5IAlOeSR8q3kJqcu0icVYK0xhypVwntz45dMb7PDmw70t
 eQfzehNBU4+lrVQN1bXBWR+LBgidnt3zMCHuRd5WeuSyikVi5LIRDx+vOnFvV1p8mcs7
 96yA==
X-Gm-Message-State: AOAM532rh/CZ3E+rPpoDBUmbSQ6SFS3cV7aQdCYldSeSzx7CiZVb5sfS
 0JMPd9I0B38yPizYU4xBDIQ=
X-Google-Smtp-Source: ABdhPJxETGfyrxsjq29H/ESpEnCrMZSbto1whAW+ydmiS800zaTSKzy6kKwMV/ntO/z9e0HmVlKjVw==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr26902264wrt.196.1599574745766; 
 Tue, 08 Sep 2020 07:19:05 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f1sm26722526wrx.75.2020.09.08.07.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 07:19:05 -0700 (PDT)
Date: Tue, 8 Sep 2020 14:19:03 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
Message-ID: <20200908141903.it25fe672dltw7pm@liuwe-devbox-debian-v2>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-3-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903100537.1337-3-paul@xen.org>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 03, 2020 at 11:05:37AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The manpage for 'xl' documents that guest co-operation is required for a (non-
> forced) block-detach operation and that it may consequently fail. Currently,
> however, the implementation of generic device removal means that a time-out
> of a block-detach is being automatically re-tried with the force flag set
> rather than failing. This patch stops such behaviour.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

I'm two-minded here.

On the one hand, special-casing VBD in libxl to conform to xl's
behaviour seems wrong to me.

On the other hand, if we want to treat all devices the same in libxl,
libxl should drop its force-removal behaviour all together, and the
retry behaviour would need to be implemented in xl for all devices
excepts for VBD. This requires a bit of code churn and, more
importantly, changes how those device removal APIs behave. In the end
this effort may not worth it.

If we go with the patch here, we should document this special case on
libxl level somehow.

Anthony and Ian, do you have any opinion on this?

Wei.

> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/libxl/libxl_device.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
> index 0381c5d509..d17ca78848 100644
> --- a/tools/libxl/libxl_device.c
> +++ b/tools/libxl/libxl_device.c
> @@ -1092,7 +1092,8 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
>  
>      if (rc == ERROR_TIMEDOUT &&
>          aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
> -        !aodev->force) {
> +        !aodev->force &&
> +        aodev->dev->kind != LIBXL__DEVICE_KIND_VBD) {
>          LOGD(DEBUG, aodev->dev->domid, "Timeout reached, initiating forced remove");
>          aodev->force = 1;
>          libxl__initiate_device_generic_remove(egc, aodev);
> @@ -1103,7 +1104,8 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
>          LOGD(ERROR, aodev->dev->domid, "unable to %s device with path %s",
>                      libxl__device_action_to_string(aodev->action),
>                      libxl__device_backend_path(gc, aodev->dev));
> -        goto out;
> +        if (!aodev->force)
> +            goto out;
>      }
>  
>      device_hotplug(egc, aodev);
> @@ -1319,7 +1321,8 @@ static void device_hotplug_done(libxl__egc *egc, libxl__ao_device *aodev)
>      device_hotplug_clean(gc, aodev);
>  
>      /* Clean xenstore if it's a disconnection */
> -    if (aodev->action == LIBXL__DEVICE_ACTION_REMOVE) {
> +    if (aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
> +        (aodev->force || !aodev->rc)) {
>          rc = libxl__device_destroy(gc, aodev->dev);
>          if (!aodev->rc)
>              aodev->rc = rc;
> -- 
> 2.20.1
> 

