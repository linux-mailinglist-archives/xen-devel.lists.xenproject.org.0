Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28278615FCC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435714.689427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqA6h-0003C8-97; Wed, 02 Nov 2022 09:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435714.689427; Wed, 02 Nov 2022 09:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqA6h-00038j-5S; Wed, 02 Nov 2022 09:32:23 +0000
Received: by outflank-mailman (input) for mailman id 435714;
 Wed, 02 Nov 2022 09:32:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+Qw=3C=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1oqA6f-0002rb-C6
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:32:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ed6d257-5a91-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 10:32:20 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-Afke9pNBP16lQmfvJhX3Cg-1; Wed, 02 Nov 2022 05:32:15 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 h8-20020a1c2108000000b003cf550bfc8dso838507wmh.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 02:32:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x21-20020a1c7c15000000b003b492753826sm1361990wmc.43.2022.11.02.02.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
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
X-Inumbo-ID: 3ed6d257-5a91-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667381538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
	b=gOVvVa96O5EjRk1UGNXS6akGr9XDQjQiqdmQBHCQa+tMXWjo4EGQzsrYKTW8LkCTjt8VaT
	mOIldExhNaLbRlo5rI+VMLayI2ICD5dw1M0bM9yV2WHUb7xS2SyWZO6UVluK7IToeQE+dh
	Q7CC5UGJ7LzJwPOaa/lrTnivgU+iW1I=
X-MC-Unique: Afke9pNBP16lQmfvJhX3Cg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
        b=N7VdQy8PwyFGfqMDXnjGXTpYa+s33m7kTeLszSZxcy3m1JrYzeMG/TKjrDCdJMFA4Z
         mnodZeHnIVH9d8d0lsjtuRZ/rmD+8WN4D8Yee9DpN4bYqbQdQIa+AdF57ItqVgZiGtpI
         r8enc4Qvx2sS+KdOsLFVsxp6Gv/F5PWXb+0WkbJe1Z5hPVEH1eU45+ID21+leegvQSNp
         a7LSFZzFKOSPlZ/fjgGPSOOkqK7SH7BFndfLsBWvoVO9E1Gw0ouIV4mMeq8v67seSTyJ
         btkpRpYKRdZn1zy6A/XGo11xB+r3+lRxGdVJEz8bumWApllLbT6idGzogTqMtlDFq2S4
         VezQ==
X-Gm-Message-State: ACrzQf387en3d7ulZCwrJ6d3a3hPlje7jkfiZ/e9VAfNvz2NhXYZha5w
	ACGlUxyvTX/B9I8dOeYiBccamjHdLLy0Y5GQ8U5uGsw+UTr3PDB/9QcvC6nTA2FsltBj7Z37Pvt
	OTEmASQM2VBVEvJHnEG0UsJY4F1Q=
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443619wmb.154.1667381534285;
        Wed, 02 Nov 2022 02:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iks5yFnak5X2iZPcs6wSoPN4c8RmVdgyjVaQzUQOEwDY0j8GZM7MD/vLKrS0XyFefd22bEw==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443583wmb.154.1667381533975;
        Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Message-ID: <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
Date: Wed, 2 Nov 2022 10:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the
 same implementation
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
 <20221024111953.24307-18-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-18-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Implement the fbdev's read/write helpers with the same functions. Use
> the generic fbdev's code as template. Convert all drivers.
> 
> DRM's fb helpers must implement regular I/O functionality in struct
> fb_ops and possibly perform a damage update. Handle all this in the
> same functions and convert drivers. The functionality has been used
> as part of the generic fbdev code for some time. The drivers don't
> set struct drm_fb_helper.fb_dirty, so they will not be affected by
> damage handling.
> 
> For I/O memory, fb helpers now provide drm_fb_helper_cfb_read() and
> drm_fb_helper_cfb_write(). Several drivers require these. Until now
> tegra used I/O read and write, although the memory buffer appears to
> be in system memory. So use _sys_ helpers now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
> +				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
> +{

[...]

> +	/*
> +	 * Copy to framebuffer even if we already logged an error. Emulates
> +	 * the behavior of the original fbdev implementation.
> +	 */
> +	ret = write_screen(info, buf, count, pos);
> +	if (ret < 0)
> +		return ret; /* return last error, if any */
> +	else if (!ret)
> +		return err; /* return previous error, if any */
> +
> +	*ppos += ret;
> +

Should *ppos be incremented even if the previous error is returned?

The write_screen() succeeded anyways, even when the count written was
smaller than what the caller asked for.

>  /**
> - * drm_fb_helper_sys_read - wrapper around fb_sys_read
> + * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
>   * @info: fb_info struct pointer
>   * @buf: userspace buffer to read from framebuffer memory
>   * @count: number of bytes to read from framebuffer memory
>   * @ppos: read offset within framebuffer memory
>   *
> - * A wrapper around fb_sys_read implemented by fbdev core
> + * Returns:
> + * The number of read bytes on success, or an error code otherwise.
>   */

This sentence sounds a little bit off to me. Shouldn't be "number of bytes read"
instead? I'm not a native English speaker though, so feel free to just ignore me.

[...]

>  
> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
> +				   loff_t pos)
> +{
> +	const char __iomem *src = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Do you really need these two? AFAIK ssize_t is a signed type
so you can just use the ret variable to store and return the
errno value.

[...]

> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> +				    loff_t pos)
> +{
> +	char __iomem *dst = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Same here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


