Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51A2A7B4E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 11:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19679.44935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kacBi-0006ly-6D; Thu, 05 Nov 2020 10:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19679.44935; Thu, 05 Nov 2020 10:08:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kacBi-0006lZ-2o; Thu, 05 Nov 2020 10:08:14 +0000
Received: by outflank-mailman (input) for mailman id 19679;
 Thu, 05 Nov 2020 10:08:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iIoW=EL=linaro.org=linus.walleij@srs-us1.protection.inumbo.net>)
 id 1kacBg-0006lU-9m
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 10:08:12 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc70d049-261d-489f-9eeb-51aa7706f3e9;
 Thu, 05 Nov 2020 10:08:10 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 11so969902ljf.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 02:08:10 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iIoW=EL=linaro.org=linus.walleij@srs-us1.protection.inumbo.net>)
	id 1kacBg-0006lU-9m
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 10:08:12 +0000
X-Inumbo-ID: cc70d049-261d-489f-9eeb-51aa7706f3e9
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cc70d049-261d-489f-9eeb-51aa7706f3e9;
	Thu, 05 Nov 2020 10:08:10 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 11so969902ljf.2
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 02:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eEue8Bau+pupF7CyTGHXC2yqWeY8Sj18qJXhmeK0+qY=;
        b=rvffOctSKYH+6isvUsZ6vjuDGiRiPXrriws2tYpmxIOJoDbVaUBBLJZNLsZfPTViCm
         OB7UJ7kJVc74V/wH1kAJWs50qUWe8BxYk+3Bh0Ntwrn4R80Kw+RHuzDoPIDkFuxVKOMP
         awvWPavfta6vj9AUR/6i26T0t+QGvBOviGEDNRn+gsaMK+rwApX3VuBwIy6OffxGwIGI
         Q9ElrJtiii5nM3Ug/hNAa7sMnYOfnIMkNbbQWWsd9e9E4LqYfoNACefZyIQWVQxYvven
         erCA3D+b6EoRTgIG3bxLlMg5PeozREFm5ydwy7sAu7xfjUKeSkZzmy6N/j40DftaLQPo
         OSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEue8Bau+pupF7CyTGHXC2yqWeY8Sj18qJXhmeK0+qY=;
        b=XmHRlwZC0pXbdpsGhbYa8/73Sgy1YQjrlU6Bdq14F/kyzYMVqD0XkPFW6MQMeFzGJl
         wxZn7gi23LMws+oe5ZxOv48jojxPljEsas2h5Mg+cE1keqWEsyYEswHP1dgxyQ1P193s
         X52JSaNS/KyBmJD9bkvF5FB+Ftl7w8wM2pekYE4fLtq8LY32q2inMYSIMV3GX/hltpcV
         D6ZghUkiV3FjEvLezuQfMs1VaClc5VHRs9HirRwz+iRK/o56PMd65w03Yci9zsHZHy9T
         RXJaGhX7UH6Ke4+Sz0hU9BIIi3BjytCU4iRRvC6AXpci+LefUvK6cSQj5QASa2YzqgbA
         XfJA==
X-Gm-Message-State: AOAM530Agq4euaHA1yF5ilJCMSO1NufsUHC1aQlLKiZ/8yuEn7RIQtPf
	5BbIoLT+y4eypWFi/FFGecLBcN+nQxK0CPJp8a8DQg==
X-Google-Smtp-Source: ABdhPJzTsAT/B7g6yG/tiOPWkhIyiq+coc///CuocOp+hPojlZHj2TddLjwWNxDtJai798d/HI10cYYk95MMhchsZzo=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr658065lja.283.1604570889728;
 Thu, 05 Nov 2020 02:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20201020122046.31167-1-tzimmermann@suse.de> <20201020122046.31167-10-tzimmermann@suse.de>
In-Reply-To: <20201020122046.31167-10-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 11:07:59 +0100
Message-ID: <CACRpkdbvGWKo8y323actUJn9xXmxpgDw1EKLiPH4RqB_kFx=XQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] dma-buf-map: Add memcpy and pointer-increment interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Lucas Stach <l.stach@pengutronix.de>, 
	linux+etnaviv@armlinux.org.uk, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, yuq825@gmail.com, Ben Skeggs <bskeggs@redhat.com>, 
	Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Hans de Goede <hdegoede@redhat.com>, Sean Paul <sean@poorly.run>, Eric Anholt <eric@anholt.net>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, ray.huang@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, Emil Velikov <emil.velikov@collabora.com>, 
	luben.tuikov@amd.com, apaneers@amd.com, melissa.srw@gmail.com, 
	Chris Wilson <chris@chris-wilson.co.uk>, Qinglang Miao <miaoqinglang@huawei.com>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, etnaviv@lists.freedesktop.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, lima@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, xen-devel@lists.xenproject.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

Overall I like this, just an inline question:

On Tue, Oct 20, 2020 at 2:20 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:

> To do framebuffer updates, one needs memcpy from system memory and a
> pointer-increment function. Add both interfaces with documentation.

(...)
> +/**
> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> + * @dst:       The dma-buf mapping structure
> + * @src:       The source buffer
> + * @len:       The number of byte in src
> + *
> + * Copies data into a dma-buf mapping. The source buffer is in system
> + * memory. Depending on the buffer's location, the helper picks the correct
> + * method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> +{
> +       if (dst->is_iomem)
> +               memcpy_toio(dst->vaddr_iomem, src, len);
> +       else
> +               memcpy(dst->vaddr, src, len);
> +}

Are these going to be really big memcpy() operations?

Some platforms have DMA offload engines that can perform memcpy(),
drivers/dma, include/linux/dmaengine.h
especially if the CPU doesn't really need to touch the contents
and flush caches etc.
An example exist in some MTD drivers that move large quantities of
data off flash memory like this:
drivers/mtd/nand/raw/cadence-nand-controller.c

Notice that DMAengine and DMAbuf does not have much in common,
the names can be deceiving.

The value of this varies with the system architecture. It is not just
a question about performance but also about power and the CPU
being able to do other stuff in parallel for large transfers. So *when*
to use this facility to accelerate memcpy() is a delicate question.

What I'm after here is if these can be really big, do we want
(in the long run, not now) open up to the idea to slot in
hardware-accelerated memcpy() here?

Yours,
Linus Walleij

