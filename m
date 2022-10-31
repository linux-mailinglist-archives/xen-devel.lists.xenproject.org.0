Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F203C6138AF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432770.685643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQY-0007jq-Hv; Mon, 31 Oct 2022 14:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432770.685643; Mon, 31 Oct 2022 14:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQY-0007fG-8t; Mon, 31 Oct 2022 14:06:10 +0000
Received: by outflank-mailman (input) for mailman id 432770;
 Mon, 31 Oct 2022 12:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9QX=3A=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1opTSw-0004uN-1z
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 12:00:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b69db35-5913-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 13:00:27 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-j1Bo1sHwO5el3ApQgPJrrg-1; Mon, 31 Oct 2022 08:00:25 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a1c3b07000000b003c5e6b44ebaso3362181wma.9
 for <xen-devel@lists.xenproject.org>; Mon, 31 Oct 2022 05:00:24 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003c6c1686b10sm5388458wmb.7.2022.10.31.05.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
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
X-Inumbo-ID: 9b69db35-5913-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667217626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
	b=A81TQWzRANSt9UBXkN6GWZECwAj2+GPLXn6gdwd5irFl8gEo3FGTWQ0tGgzwhMkxQ2lwHk
	9EJ9dIXq62KH3h5oOwgKZ83yltwQfjYnOnaHOR1ePZXUP1C+hxUKtaADOJgdSnV4tlZcO1
	vZWbNYGFj0c0lpX1hv6hD75EP2wEoSM=
X-MC-Unique: j1Bo1sHwO5el3ApQgPJrrg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRPxwW2zKPepuA8PR9mUAwCAVRj8pp1PiT5CedYG760=;
        b=sb1GQb5L2ioWMZ2Qz1ENCpy7EU6IdxqGoWKRiEi7UELaOD07FzcLDQZLz1owgftgCv
         O6bNUF+gsxPxQMr/L/D/JFaeTWP6kjKTBjRBk0JnpYq1Q+81IGQaaJ6aOV3ueeVhEAjy
         dJGJvzAY6TTnQ20D0M0KXF6iysWJ1XrXlHdszkCVhUm8YunvJA/DRR23qXIwXTEmRO8y
         1t8p8QTzTO/N3UdhG24uswmvXgOTq2T+3FOOyjZHS65r9ToEwacZDxZcCpelQ2ezdL2B
         ahh4yB44RWKAqwJ89UmkuxCTHCQ5DmTaV7QQWnvh2FvIWGmfgPvw6C/Hcplm5dkyka5T
         PoJw==
X-Gm-Message-State: ACrzQf12nXGgWoG8OUu5cx7/5lBTRCr32kJ0PWo6y+m1G/8+KGtT92SU
	wAptUIYFStmxUP3prxmARqNjNtI3k5NuD2NA2WpNsp+Nkui5Bm05CUNICqIxrd4RCptVrkazX9a
	JS68zbYgVu/ORmmVyRMeQZ6ymjTg=
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606545wrv.259.1667217623893;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7SGo+SId6me5X0r4rljOgpSC8TPNcKC+21wfNb2F4dclcZs6G1cIUREq2tk/ot5/dgyLJVEQ==
X-Received: by 2002:a5d:560e:0:b0:236:c325:4858 with SMTP id l14-20020a5d560e000000b00236c3254858mr4606520wrv.259.1667217623655;
        Mon, 31 Oct 2022 05:00:23 -0700 (PDT)
Message-ID: <2e2e3915-a7b2-d030-2ffd-117b12deedb2@redhat.com>
Date: Mon, 31 Oct 2022 13:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 03/21] drm/vboxvideo: Don't set struct
 drm_driver.lastclose
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
 <20221024111953.24307-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as vboxvideo uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


