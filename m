Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D40616066
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 11:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435758.689503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAZz-00036t-0x; Wed, 02 Nov 2022 10:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435758.689503; Wed, 02 Nov 2022 10:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqAZy-00034t-UM; Wed, 02 Nov 2022 10:02:38 +0000
Received: by outflank-mailman (input) for mailman id 435758;
 Wed, 02 Nov 2022 10:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+Qw=3C=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1oqAZx-00034X-4T
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 10:02:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 795c7c37-5a95-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 11:02:36 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-XDoRL1XLMTyIXSWM5Jbipg-1; Wed, 02 Nov 2022 06:02:31 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d3b6644so3572024wma.6
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 03:02:31 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 fn13-20020a05600c688d00b003a3170a7af9sm1564836wmb.4.2022.11.02.03.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
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
X-Inumbo-ID: 795c7c37-5a95-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667383354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
	b=Mwcfz5L0ulLeIm+Y2T2sVMkrbMzYnXrEZSPdikrHgMjcrwcQG3fACvszbCufoJjXQoYs7u
	dZbA2GEOnEn8MNhLyf6j3YAcxL1DV6xPfJ7EefGLtV001lrH/mEnJToVjvJcoQkvJl7sVU
	aucY35Pybi1KoSpJbjjiiolK8+Z7EVw=
X-MC-Unique: XDoRL1XLMTyIXSWM5Jbipg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYDm2f88uo7N+T5CuGh2kGVIDaWbYMjQLaRZ3nU/m+Y=;
        b=aAWgcmUqzRzGLVoLwaoXoajOSSlIJsEt0IOYO/AZLEXtTucLS3HhCkj+/kbg4+i19g
         tPEWBAwew2wrfh9nRsmqOh8RlHCnWl5HAX3Vi/ixaP1XrjOr8G+QDoxo7wH/vP3Aa5BN
         fJqLpfli4RsztPpcyMdUXd5S78xUS7rgkUm2SRH6Gk5xFtF6JZaPoU8N+VC0P+KQtlNc
         KaLvsTYpCsUfpTEKWGI+ohnbZpUsIXTE2D1/qF+tI3EBuAaqaKTjnPl+v7Wc0KSzfDxx
         PoNxTTGi4t9KCHaLWFfT6hMEqAJAgn8qisBVuifjMtEEzS17khBBB4y4Z4GtlJE1FL3m
         hbbw==
X-Gm-Message-State: ACrzQf1yFgFMXBpthyF7pCVi+8+jioW2sUUm6wcpzhg4dO7LpXJaiVXa
	cKWbv9DoC3EqosDgWv9SEajLPsnsxZ8+x3ljMyN4WHqnz7jFpgM+phCCsdGAT0C4nSCdeSwEFQM
	YB41besOSoPV/7NvukUUVBaeVl4E=
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id w15-20020adff9cf000000b002366a26c055mr14584883wrr.195.1667383350616;
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6OHHkFmpcUlQhLx4VZSF/FNGP0hsrmpEExWtKIxFg2Jf6dmbAckk/gQVQTytU8dXpfU2B04w==
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id w15-20020adff9cf000000b002366a26c055mr14584846wrr.195.1667383350420;
        Wed, 02 Nov 2022 03:02:30 -0700 (PDT)
Message-ID: <68309442-ad39-36da-b1ec-680dd4129a7f@redhat.com>
Date: Wed, 2 Nov 2022 11:02:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 21/21] drm/fb-helper: Remove unnecessary include
 statements
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
 <20221024111953.24307-22-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-22-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Remove include statements for <drm/drm_fb_helper.h> where it is not
> required (i.e., most of them). In a few places include other header
> files that are required by the source code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


