Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548761948C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437507.691931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqu4m-0005zS-2t; Fri, 04 Nov 2022 10:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437507.691931; Fri, 04 Nov 2022 10:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqu4m-0005xG-06; Fri, 04 Nov 2022 10:37:28 +0000
Received: by outflank-mailman (input) for mailman id 437507;
 Fri, 04 Nov 2022 10:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59+2=3E=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1oqu4k-0005xA-Qh
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:37:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab63bad3-5c2c-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:37:25 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-Y4JjoI7gMcqJYl9s5CBPfA-1; Fri, 04 Nov 2022 06:37:20 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a05600c420a00b003cf4dbff2e4so4039438wmh.8
 for <xen-devel@lists.xenproject.org>; Fri, 04 Nov 2022 03:37:20 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b0022e36c1113fsm3031008wrt.13.2022.11.04.03.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 03:37:18 -0700 (PDT)
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
X-Inumbo-ID: ab63bad3-5c2c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667558244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
	b=ZiLDy8beWgmn3nTWY1Xx6WMNsig0TDt4n1oB2QrVk7rVKaMxzClhm15yK1iylOkqAksF2u
	k+BheTfuZ3rV7yvrPM6E7Mwz7o0sWHSJiLjzSPDkL8SUS6RcpqxgpVcHwfOnzO9x4VFhOh
	PICOQGA0FTsxBuipgu/2g7qyEZS7Wu8=
X-MC-Unique: Y4JjoI7gMcqJYl9s5CBPfA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
        b=vdvg4oMyAga3uEd23839KyumkrU3RMSObs8J9nG9I1K83BmnAtl7FK8ka+zvNKotOu
         hBwMiV0Uzx+XDpL1k4V590KoSU5c6rwBtXmhYWi2w7mYEDUOsPMit3ICND/DYF0LhabY
         evwuSYeCv/y8+pHl7qumI0Jwx6S0iYbF0lwkDBLJ2UKvXtWrehaP7D5K0zAxyfx0uKgg
         0CC4slTKEKrAd7Uo14/YAOYvkrRwkI6leFs9BrZaR0TD6iq3jaE7P6yXz6/RSlmg2AyE
         9/B+AMjkygXDGfDGuc7/XXl6KbN9Et2zqyLaGOk2AUuQv9eDsfBpMTu6WPM2ntF5sZWh
         GqNQ==
X-Gm-Message-State: ACrzQf1Kn4eGTjkBJnCQm381JoUjv9x7AtUr15X1iwvFYwRnhbgUrqlf
	KCoJpGGSgDfAEiptTlB7lRi6+n//kcDaXoq4Ydc9tTEZHt4XGh0RpKjGXhDAetuT6gJZpgEuJJO
	KzoB5ghS1CYrhqmM8YdXM++CV2ho=
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id ay42-20020a05600c1e2a00b003c3d7701756mr23539585wmb.134.1667558239642;
        Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LKXhwK5qh8ieFEkCSZgi7mblk9sJOfnr0awtpFbS+pIQGNE9IUSRaCOrs9CG3VpGFJY/xjQ==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id ay42-20020a05600c1e2a00b003c3d7701756mr23539569wmb.134.1667558239379;
        Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
Message-ID: <ab8358a9-8450-0d49-627f-26afe7ba4f9d@redhat.com>
Date: Fri, 4 Nov 2022 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 20/23] drm/fb-helper: Set flag in struct drm_fb_helper
 for leaking physical addresses
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-21-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-21-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Uncouple the parameter drm_leak_fbdev_smem from the implementation by
> setting a flag in struct drm_fb_helper. This will help to move the
> generic fbdev emulation into its own source file, while keeping the
> parameter in drm_fb_helper.c. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


