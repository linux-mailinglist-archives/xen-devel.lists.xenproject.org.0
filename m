Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E046A615ECD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435684.689360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9fM-0004ON-Hy; Wed, 02 Nov 2022 09:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435684.689360; Wed, 02 Nov 2022 09:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9fM-0004Lq-FB; Wed, 02 Nov 2022 09:04:08 +0000
Received: by outflank-mailman (input) for mailman id 435684;
 Wed, 02 Nov 2022 09:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+Qw=3C=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1oq9fK-0004LR-S9
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:04:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cccdf14-5a8d-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 10:04:05 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-w8LYwmAUM4eCLwp-YsEBLA-1; Wed, 02 Nov 2022 05:04:01 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso805817wmh.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 02:04:01 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b13-20020a5d550d000000b002366b17ca8bsm14083933wrv.108.2022.11.02.02.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:03:59 -0700 (PDT)
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
X-Inumbo-ID: 4cccdf14-5a8d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667379844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
	b=foE1tqMnN1euVXsjwdlyPW1Y4BTMlfQxIBqnZz2eDUgMOJ3r8Zu+tBZQX0GkNtDL2D+9Aj
	flWcioqcZUsIaIG4L65T3zBd/pzbd1EQRgPn+MZdj0iMkyKMJis4wJ5Qwuj07kEsp7CYEk
	jHcVQV9OGuPi3hRfiynfov54IpOv5aE=
X-MC-Unique: w8LYwmAUM4eCLwp-YsEBLA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
        b=myRmTKNfsYyKoRr4pNN7PPN3YpVJnIXTrJTHgxJefbe46F5xtj7jCIOIfpo6E4oiNX
         m9rXO1/woota/8sMqyPs1nxpNDWdLfHtdFHFh2YBU+woVkJqFRDZO8SudMZNfLVnOu++
         OEeKp2s1/o44Wp/ilqrN4f759GPGqIaVhuSnFb/L1ShR2xW3Ktn3+lPisBAWeVV8bjCy
         NdGnSGU6qis1OcCSD+312Zl36JDM2paRZRz3OOdSeMVov3iZ8ARQHb7kipukXmzVL+70
         hw7Z5+SS9H85Rzzrd71/Fhe48BRqQh8F/rjGSkgdPTnt+HyICFgiMYsV+diVgWo9dFDS
         XYgg==
X-Gm-Message-State: ACrzQf26Q0A1Sbg78MJXRSpufY8mvL98jjl55SoZRDlFmOq6sPoHN7y1
	p2HAZFO4HWgPh/QtemVOE2CPoXdcHqtx1nwgi+vBIlltrKWHNtOXsPwz3NYK6RwNXABHzB4wm9P
	MXEu/ETwMmPP+8OcOfA830Z32HHE=
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380814wmi.38.1667379840253;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72ckpdUoZR+NwXtu1sv2+7NmgS+YMIWWHB7QdeKnWTKduGDRl7tg4bkpenTZv0mX1kFf34kw==
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380784wmi.38.1667379840046;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
Message-ID: <87284e5e-859e-3b1c-7142-28d4fa7a7939@redhat.com>
Date: Wed, 2 Nov 2022 10:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 15/21] drm/fb-helper: Disconnect damage worker from
 update logic
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-16-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-16-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> The fbdev helpers implement a damage worker that forwards fbdev
> updates to the DRM driver. The worker's update logic depends on
> the generic fbdev emulation. Separate the two via function pointer.
> 
> The generic fbdev emulation sets struct drm_fb_helper_funcs.fb_dirty,
> a new callback that hides the update logic from the damage worker.
> It's not possible to use the generic logic with other fbdev emulation,
> because it contains additional code for the shadow buffering that
> the generic emulation employs.
> 
> DRM drivers with internal fbdev emulation can set fb_dirty to their
> own implementation if they require damage handling; although no such
> drivers currently exist.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
> -	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> -						    damage_work);
> -	struct drm_device *dev = helper->dev;
> +	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);

This line is an unrelated code style change. But I guess it's OK.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


