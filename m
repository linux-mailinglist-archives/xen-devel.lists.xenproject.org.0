Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4806138AE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432795.685707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQd-0000nL-Hq; Mon, 31 Oct 2022 14:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432795.685707; Mon, 31 Oct 2022 14:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQd-0000cY-4j; Mon, 31 Oct 2022 14:06:15 +0000
Received: by outflank-mailman (input) for mailman id 432795;
 Mon, 31 Oct 2022 12:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9QX=3A=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1opTng-0008GI-El
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 12:21:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b46e161-5916-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 13:21:55 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-kJGwxApwNfygiW1zysZOIQ-1; Mon, 31 Oct 2022 08:21:51 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso5232477wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 31 Oct 2022 05:21:51 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003cf4c1e211fsm7421692wmq.38.2022.10.31.05.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:21:49 -0700 (PDT)
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
X-Inumbo-ID: 9b46e161-5916-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667218914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
	b=ZzE8H/e1Rtq/tBnevIYxkAHR3g+VsdKbJ9XOh7IqG07hsVf+2z/hN41aI5SPH//8iwPFLh
	HZjmkzfj/I4VS1ru0c+CdMfv6bqNL+kNIftfkOXDOscOmjgaIVP3u79/sa3JlXanOvLaCJ
	VcRwmm8yg81c5Cg1mXmPWMskWk5qk+o=
X-MC-Unique: kJGwxApwNfygiW1zysZOIQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz8PAZx0cLc5RAaRO0sQR4MZQyCy7VtrjJT7yq4jHuw=;
        b=Vtr0jDu6IVrlYUQGzb4oDICWcN1HIphhvpfMxDxCCdywajAnpcZ3o/wQtx0oHcGJAX
         h7REACeR/JmqlMCJbSLf03qk4hmTzbMVUpa8vcxf9pXOE+1d0enXdJTpxBwlTtn0Ofuy
         yFcSyX5s86Rx1w2fpATw0WSAmTfH9PyGHO9ajkI2sH8rWNMR8i9fiGsFcosQ+/Cj9cUy
         0w06AvsKlaG3c7qq67pw3yWzcw4oK0QI0q3xbVSTMyras1rVI/2D6I5W8zYxzEXT7Fhe
         TnC+d4MpyE3OSw8qbtREoj8DkZLcHDVpReFPF9k2U/4GXW2o8jG24GRCXj2EtPsblFxw
         FAxg==
X-Gm-Message-State: ACrzQf3Ij9xF4/EYjlh0N3DSsqu96Z9aQ3II1Rj+uV7V6XVcgqEfsBGV
	xb2Hm+AVTBzPPCHQ4uCOwv/3cOhumS9IIkArL3r8+TRkBRlRzHhUYVWTXtCwGGsC2i8cW6xjpKD
	teJnhmti2Dqg+8jVudJJC0gy/H1I=
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id bg14-20020a05600c3c8e00b003b4d224ae27mr7936000wmb.187.1667218910346;
        Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kQh5/EvsJvI9K3W2EFLXezwgTMZr8BgFr4Dt+IxgUiTtboeKKAu1FK4Es/7ETyez8XSTV6g==
X-Received: by 2002:a05:600c:3c8e:b0:3b4:d224:ae27 with SMTP id bg14-20020a05600c3c8e00b003b4d224ae27mr7935971wmb.187.1667218910155;
        Mon, 31 Oct 2022 05:21:50 -0700 (PDT)
Message-ID: <e9192382-f04c-4ebd-ca1c-b2fceaa29f86@redhat.com>
Date: Mon, 31 Oct 2022 13:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 09/21] drm/panel-ili9341: Include <linux/backlight.h>
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
 <20221024111953.24307-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Include <linux/backlight.h> for devm_of_find_backlight().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


