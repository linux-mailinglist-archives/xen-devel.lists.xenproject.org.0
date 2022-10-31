Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700E6138AA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432791.685686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQb-0000Jh-Sg; Mon, 31 Oct 2022 14:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432791.685686; Mon, 31 Oct 2022 14:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQb-0008Rf-CH; Mon, 31 Oct 2022 14:06:13 +0000
Received: by outflank-mailman (input) for mailman id 432791;
 Mon, 31 Oct 2022 12:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9QX=3A=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1opTke-0007RU-0b
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 12:18:48 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2acb9ca5-5916-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 13:18:47 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-ruFN1sSuO0mNS6TCSSQbHw-1; Mon, 31 Oct 2022 08:18:44 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso5229392wmb.4
 for <xen-devel@lists.xenproject.org>; Mon, 31 Oct 2022 05:18:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003b505d26776sm1928473wms.5.2022.10.31.05.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:18:42 -0700 (PDT)
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
X-Inumbo-ID: 2acb9ca5-5916-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667218725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
	b=gDJmJCaUqJ7Fm6o9o5aunIA5xfKid9ZLcI2R1r8DajuGUsufutJXLsks1ABDt97IrmjQXr
	rFHPAXjVvH2zt4OLa6y1XAHhEZomEUALKaONYArkpyjqGt47uZ3902Kpa/xZESRuV7066X
	8VkTIYOU1i6VKauEjV1TQZqcTnqptow=
X-MC-Unique: ruFN1sSuO0mNS6TCSSQbHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
        b=iV3KFnER0anT3ncX1m7JX44owIYmTBt20fw9lnuDpXA+qalRSMJUHNkwKmSs/Q9oFS
         8pPfEAmzSqOkUokrJxG0PmcGGIqth7A+yfnUFDX/8ZCVyR5rf9K6NkrM35uRa1PJXl4Y
         x6/u5IzsYvvqK1i75Byh7XOpVeu5L002hCSoyMVd0SjTW7RyXXA1evk+jeYVnzZYVtfz
         qNLUt7gxqAFIkLiIQkmOR43L+ad+KLNM6Or2Qqgz6fwR9+wGoiiC2aeQDhRbRkAXJoQ0
         8vwZJRxwM8HgtfuzS2MXk7G/3Mt12Nkul5RUEU8GbM9hBJJnc/DR0UjuIHOXOyER0IGp
         ulfg==
X-Gm-Message-State: ACrzQf1nrp2U2RXfI72S0EL1qENkWtN/55/6rbmZAm4jO7cY7qf2+trq
	ij5QkzGiePy/u0olzo8Fnl285PTYrMBkexAAvE6ajBAIqHyOIvdTXseAkrxN3mRizNfrsdPnXAy
	xOwZvHHmulwpRWkw25LHNI59PIW0=
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id j19-20020a05600c191300b003c732c820f1mr18174570wmq.81.1667218723533;
        Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7l/GcAhTFdfukiyp7nV9yfjX7i/zfBGid5JfBMyP3xXFRWK8fegD9382/Cb8rQ8SeG7Fkrtw==
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id j19-20020a05600c191300b003c732c820f1mr18174541wmq.81.1667218723353;
        Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
Message-ID: <05a2ad4a-b053-ba98-2547-520ab51d3e77@redhat.com>
Date: Mon, 31 Oct 2022 13:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 07/21] drm/logicvc: Don't set struct
 drm_driver.output_poll_changed
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
 <20221024111953.24307-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as logicvc uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


