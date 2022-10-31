Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89796138B4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:06:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432815.685740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQh-0001jo-Bp; Mon, 31 Oct 2022 14:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432815.685740; Mon, 31 Oct 2022 14:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVQg-0001Nr-Gx; Mon, 31 Oct 2022 14:06:18 +0000
Received: by outflank-mailman (input) for mailman id 432815;
 Mon, 31 Oct 2022 12:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a9QX=3A=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1opTrA-00008h-1o
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 12:25:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b8e2598-5917-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 13:25:31 +0100 (CET)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-X4ZRPHrJPomG_BnRghdy8g-1; Mon, 31 Oct 2022 08:25:28 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 o18-20020a05600c4fd200b003c6ceb1339bso5594158wmq.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Oct 2022 05:25:28 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003bfaba19a8fsm7382582wms.35.2022.10.31.05.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:25:26 -0700 (PDT)
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
X-Inumbo-ID: 1b8e2598-5917-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667219129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
	b=FokqE+OawLhTjp7iVH+q3xV5qU+owxbjGYpygfYYbZilLPOWQS+Uk06vGCqWKa5Zg61x7L
	KCsidB+Mn9zm2uZnf0vRptgX9YPuFnLxLSh6Vf32dmbdyEZCSdg2Dup14duyFQymj0gh5B
	wqZkX+UaWVQlOkjtLaQulkamOJmfsPg=
X-MC-Unique: X4ZRPHrJPomG_BnRghdy8g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3lFqSUva8cf7eu6ekgojQtwZeR44+C1N0qDI7SjLRc=;
        b=JDF5k8RVBRmxYJMgmns/Sc0Sqm2vkr7vcZB1tf1jbpy8kRDIsAznyBtWcefNy5vT29
         tUq/bbCMDAH8ySkImNOs/9r3geX3KVwAL4HTH1xT8bAOhmMVFGxkf14q2c+w1BGZr8i7
         g1Aa/NSfCI1mkVOAuYhx4jrrZJcBr/7RHPIUn3uhDh4iH0jwcqXDiHdwda04HjHRl2fE
         rSm3OxPrXifYlesuw9PYD5KVhjnDWiwIrij+a6Wmj66vI1g7ubinIMIrsJWli6K0CThI
         2xmfR3oZl9kYTgR1B5/8mRbtVD0z7X+DOTOe0ii7HtHpBNMRh+0ZOR/QoosMErFlSYdN
         XKLA==
X-Gm-Message-State: ACrzQf0j3jvOoOfebbhdlvmEEc+2Y+4ypGhnK4vskXaHOcjtYeVPgjdU
	rmq/8gzmqkCFDeeglTDQgWTw8H6h3m7Uhq2fPbKnJcnnIY7RRook55IltcLgSK9R4UynVLjb3xL
	zHtyGxoP/074wPCwpUniB58b+M6o=
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id r10-20020a5d498a000000b0023658ef6796mr8133547wrq.399.1667219127469;
        Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OaQ4lCdeJx0P85vXeCC9ohI1f8Am/sl3oDUbbTCyW5S09EQhBnmsKMGoGzObNL20EAzLquw==
X-Received: by 2002:a5d:498a:0:b0:236:58ef:6796 with SMTP id r10-20020a5d498a000000b0023658ef6796mr8133518wrq.399.1667219127226;
        Mon, 31 Oct 2022 05:25:27 -0700 (PDT)
Message-ID: <53f341ad-4b72-5546-f752-ca705d62d63c@redhat.com>
Date: Mon, 31 Oct 2022 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 12/21] drm/fb_helper: Rename field fbdev to info in
 struct drm_fb_helper
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
 <20221024111953.24307-13-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-13-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Rename struct drm_fb_helper.fbdev to info. The current name is
> misleading as it overlaps with generic fbdev naming conventions.
> Adapt to the usual naming in fbdev drivers by calling the field
> 'info'. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed. I got confused by this naming in the past.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


