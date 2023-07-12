Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9717505D8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 13:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562412.879079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXrT-0001NE-0q; Wed, 12 Jul 2023 11:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562412.879079; Wed, 12 Jul 2023 11:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXrS-0001Kx-Ti; Wed, 12 Jul 2023 11:18:22 +0000
Received: by outflank-mailman (input) for mailman id 562412;
 Wed, 12 Jul 2023 11:18:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YOEi=C6=redhat.com=fmartine@srs-se1.protection.inumbo.net>)
 id 1qJXrR-0001Kr-Up
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 11:18:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce17b3a8-20a5-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 13:18:20 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-9b314-DBOQqlmOm2ht99wA-1; Wed, 12 Jul 2023 07:18:17 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fc08d6a40cso26216265e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 04:18:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm14151776wmr.46.2023.07.12.04.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
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
X-Inumbo-ID: ce17b3a8-20a5-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689160699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqF46ZIeTTxnF0x2v0q2HtXa3ZhclBx145UBtd0H60M=;
	b=GFCzQKsxsPbK0pRnq2TrZdz46CESVuRV7IYHZyYpB2n5GQRqFTQbKmgYJG9lgnP2PK5Uu0
	l0BYo0/TB7+Q7+KZKR9s2X/OdfSjebkPXFd97HwLE6PQ0N8L9ME8l1NzDraKRYQW9bDMyd
	fHoZoT+kGZzIuMVp21a7CAIMYhLKw3g=
X-MC-Unique: 9b314-DBOQqlmOm2ht99wA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689160696; x=1691752696;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGmoSdcAtbAnvFmDIfmKNE01xrI5yfsr2LA1G6eD+Js=;
        b=eZBf4gG5awqonZMS/Rxstq2HIllfZdmERi1msatR94nL+jcfG6EUB6TJbxSooc9GXn
         jVR1yYmxdE7LDIQr60HYfLbAr2ouBIPYBgCjVuMZM3mkWkiCTz+PVxd21z1VmVgt8AXW
         zfmQyXnMGy7khQyR00qXwJfkBoG4Jmq93Leup1twYgrVWUbvEe2YVq3yTp+RF1Q25/eO
         CfckTiARPghpXnJnRLJTwzxgdSFQJE6QO358VAOazOv7AnKbhdGXbRoVwhcC550QP2Wn
         9yi0zav+M59wXojOYhidOVvrpyts7U5fTmcuIoiBOlrJnRqBCw4/KY1kJPsGvmCgFZ79
         a35g==
X-Gm-Message-State: ABy/qLaiKgWTNLcO5N0LDd3J9J6GsCGwIrPjefLesDlh5Y6XPGLqdJJu
	iP+gvonL2tkjeyqPRF/zMiQ95i/3l5Z0mnAjDZrs6vyH1lxz1vtcK2NWG5hUdAD1n2k69ncjw03
	sr36N0A9/9BYMdyqU6K6uMExzaLw=
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id y4-20020a05600c364400b003fc0627ea31mr12056769wmq.38.1689160695901;
        Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHe6rz0BytbzD5//h/wnxrk0jp/oOEOt3AbTKSXStRClYkvIUVNGHa0orOjttguAlZUCgSKTg==
X-Received: by 2002:a05:600c:3644:b0:3fc:627:ea31 with SMTP id y4-20020a05600c364400b003fc0627ea31mr12056740wmq.38.1689160695625;
        Wed, 12 Jul 2023 04:18:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Zimmermann
 <tzimmermann@suse.de>
Cc: linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, VMware Graphics Reviewers
 <linux-graphics-maintainer@vmware.com>, NXP Linux Team
 <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Gurchetan Singh
 <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andrew Jeffery
 <andrew@aj.id.au>, linux-mips@vger.kernel.org, Chia-I Wu
 <olvaffe@gmail.com>, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, John Stultz <jstultz@google.com>,
 freedreno@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
In-Reply-To: <20230712105432.urgwb4zzwgsyfbwq@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <abf26a82-4f17-51f2-5753-785f8516a81a@suse.de>
 <20230712105432.urgwb4zzwgsyfbwq@pengutronix.de>
Date: Wed, 12 Jul 2023 13:18:14 +0200
Message-ID: <87r0pdgyyx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

[dropping some recipients since my SMTP server was complaining about the si=
ze]

> Hello Thomas,
>
> On Wed, Jul 12, 2023 at 12:19:37PM +0200, Thomas Zimmermann wrote:
>> Am 12.07.23 um 11:46 schrieb Uwe Kleine-K=C3=B6nig:
>> > Hello,
>> >=20
>> > while I debugged an issue in the imx-lcdc driver I was constantly
>> > irritated about struct drm_device pointer variables being named "dev"
>> > because with that name I usually expect a struct device pointer.
>> >=20
>> > I think there is a big benefit when these are all renamed to "drm_dev"=
.
>>=20
>> If you rename drm_crtc.dev, you should also address *all* other data
>> structures.
>
> Yes. Changing drm_crtc::dev was some effort, so I thought to send that
> one out before doing the same to
>
> =09drm_dp_mst_topology_mgr
> =09drm_atomic_state
> =09drm_master
> =09drm_bridge
> =09drm_client_dev
> =09drm_connector
> =09drm_debugfs_entry
> =09drm_encoder
> =09drm_fb_helper
> =09drm_minor
> =09drm_framebuffer
> =09drm_gem_object
> =09drm_plane
> =09drm_property
> =09drm_property_blob
> =09drm_vblank_crtc
>
> when in the end the intention isn't welcome.
>
>> > I have no strong preference here though, so "drmdev" or "drm" are fine
>> > for me, too. Let the bikesheding begin!
>>=20
>> We've discussed this to death. IIRC 'drm' would be the prefered choice.
>
> "drm" at least has the advantage to be the 2nd most common name. With
> Paul Kocialkowski prefering "drm_dev" there is no clear favourite yet.

I think that either "drm" or "drm_dev" would be more clear than "dev",
which I also found it confusing and thinking about a "struct device".

Probably leaning to "drm", since as you said is the second most used name
in drivers that assign crtc->dev to a local variable.

> Maybe all the other people with strong opinions are dead if this was
> "discussed to death" before? :-)
>
> Best regards
> Uwe
>
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


