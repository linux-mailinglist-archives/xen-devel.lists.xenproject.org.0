Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333DE615ED9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:05:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435688.689372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9gO-0004vW-RV; Wed, 02 Nov 2022 09:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435688.689372; Wed, 02 Nov 2022 09:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9gO-0004tb-OA; Wed, 02 Nov 2022 09:05:12 +0000
Received: by outflank-mailman (input) for mailman id 435688;
 Wed, 02 Nov 2022 09:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+Qw=3C=redhat.com=javierm@srs-se1.protection.inumbo.net>)
 id 1oq9gN-0004rG-Fj
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:05:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 738569fe-5a8d-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 10:05:10 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-dzD8mTWzPTil1YyUkyZUcA-1; Wed, 02 Nov 2022 05:05:05 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so245518wmb.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Nov 2022 02:05:05 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b00228d52b935asm12402687wrq.71.2022.11.02.02.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
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
X-Inumbo-ID: 738569fe-5a8d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667379909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
	b=QABVmfZToklNdvumxrtSd259Jj+oeLI5xV1YLK//PW4EDNnyJVGOuH8Kcta6DRkCdxiWYG
	c7MV5QnmzSanxQBGKfqjkQS0ihPymcrU7b61Fv+rZPi7usBLTFoqRnfUgIkFOVYwZkN6jY
	ly5+ihqZcTGjHX2Isj3K7FAWWznwcfU=
X-MC-Unique: dzD8mTWzPTil1YyUkyZUcA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
        b=Y8EdZwwVsNLo07wow+R5reoEDeF2wgS1+Sa6p61b/77YWmeQs5BGeDWU9kuR89Z4si
         mdPJ7elYC3O4jSj/sF08BZ1IXlFn8+8XB3blxVGSdNvWwhwgQW0pjt2Eu15tja4y/1HZ
         0oaECoBhUxMiObVmYkneVi4mYb4mc8cdY19I9dd7hwfrU858D2fRjx+xRI/w3cBiERpf
         13WYop2QGAKHk4/InCufOY+jE/dkqlT6tGqs4aMkvbOpoN/vd5vaqlysbMG1ORpK5lBj
         LWta26pQ+BnRAt5YGtonIgN66AkkDJWbWRl06tX2S5ae5aN95dZUdrxKw2VYicAdRPHJ
         0PAA==
X-Gm-Message-State: ACrzQf2zczZ560bD6mZhgBt7Ou/0QlH982ocEMNyz3gLXgRxoEyxA/RS
	icQwY5x4hQHgev4wIExtRmJsDkxzdvKkto81gYyFng5BdPo8EQDitkDe2Pi9CSjqT/lIbH5zdNM
	rWYdaCJFXZE8Qo8Uq1Z/2WNshWIY=
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id o8-20020a5d6488000000b0022b3b0b5e72mr14464172wri.138.1667379904745;
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ug/7BR+PMLuqwC0wiYVRKEgerXkzKho5yFNKIDT0bC26SnYKpkqpAn1quqQ9FNF9E1JGkLg==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id o8-20020a5d6488000000b0022b3b0b5e72mr14464139wri.138.1667379904487;
        Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Message-ID: <a96d57d8-486d-5a48-a00a-39df6275cbb5@redhat.com>
Date: Wed, 2 Nov 2022 10:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 16/21] drm/fb-helper: Call fb_sync in I/O functions
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
 <20221024111953.24307-17-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-17-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Call struct fb_ops.fb_sync in drm_fbdev_{read,write}() to mimic the
> behavior of fbdev. Fbdev implementations of fb_read and fb_write in
> struct fb_ops invoke fb_sync to synchronize with outstanding operations
> before I/O. Doing the same in DRM implementations will allow us to use
> them throughout DRM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


