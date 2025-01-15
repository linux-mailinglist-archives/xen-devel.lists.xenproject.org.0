Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC5A12626
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 15:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872617.1283615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4WE-0004dv-Hw; Wed, 15 Jan 2025 14:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872617.1283615; Wed, 15 Jan 2025 14:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4WE-0004cF-EM; Wed, 15 Jan 2025 14:37:18 +0000
Received: by outflank-mailman (input) for mailman id 872617;
 Wed, 15 Jan 2025 14:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zshn=UH=fooishbar.org=daniel@srs-se1.protection.inumbo.net>)
 id 1tY4Tg-0003GN-NP
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 14:34:40 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9574c04-d34d-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 15:34:39 +0100 (CET)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6d89a727a19so9128686d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 06:34:39 -0800 (PST)
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
X-Inumbo-ID: d9574c04-d34d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1736951678; x=1737556478; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
        b=UEMMsoOdwnHr2n3YDjjvNiiZ+vvOAjWjL8RrL+194tlXk1RX69aXuyF0bGYP21X8HY
         g04PKV2ktGIdFZR9BzivX2KAY88ylfq4Ha43mOxhEJ0Z9juSqP4gM5ybL+RwdeTqpWXu
         sfoRZuWK0pIUHBfeH0KJm47+8zmREQ3FpmH7DmUCAqxTDRY+mZ9cJ7g9g1RJkCTWAE8f
         1OQF+1WhdHZnFv9Gzx8AJrDTMFczux+QhboaxUA2YUdBqEI2i1G2C3+GWWSOPNxRDHEh
         z8o3tnQ7MQ1UFZ6CafEoVd/x0Vv7E/m2zR4NeWhLn5wTX3gpFjcM8M92UTiNOVanmpLy
         lmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951678; x=1737556478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgpCbUXuk0fjx7PlpFBa3YSbnvvXmj+DNx/eEdB8F5M=;
        b=I11Q55wIOPDHHNDO/eafvjC6UMromxBfWHJEzgCeJfL58bhPmLGlQVL0CJvdySq6nr
         MJz+YBLm1UCiy6HxL2FEHtEON9dj4J1SjXEDYRsj5F8wPSrIdm2/zWK7d/UBz6X0FT+p
         r5TLx+WD9h2OT9Z4yKhDgvJgp2jRQsjye6wt1lWKR4A59mEtMqgaUopOqDpqtiMWr2fj
         y2V/TdwnpwrqeQTXVvh9gQ7ti/+zvgAfZ+Hws74ypqJf1VYEJSMY5uA1rlXJ0bzVfvAS
         ie4MjhlOZhZNNGEBvQQDDgLW3639myANzzhtHKHTK7tQqg7wwONSTykk/Rec1zqByxeV
         Xpjw==
X-Forwarded-Encrypted: i=1; AJvYcCWNSoZ4IcE7Mv+oQzu3ADaoH1CNq0vQquzHZ9kqXNTajXLpG5/cydGmZ8kn9OzKB/fSoZn0E0SG9YE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQufZk1LAMc3T6rOWw0fjYRH2h+MHKE5BRZcAu+FntTsia33bS
	r476MpMAx/mUXUAHlBUgE//Edha0MODTPT9zNwHYgP9TXOTH8FBCQ3AX/TKvOIAOT22PTO51a9t
	U3REHU7oLYYrlOK5zIvSHI9ZVoztIcvJf9JA/9w==
X-Gm-Gg: ASbGncvRHcsPUNWjAWv3tUlOUn15A9pyzk8Mgn3ovYqAyLAaFMI7BkwuOgTQ7DUorN6
	rGgYACq86dJjC5nvuW6aGKHNWuTWhytCHJ80=
X-Google-Smtp-Source: AGHT+IFPz9fbMcvhhyZZGYYuWLUwXCRTy8s+kBCbi69J2hIRU1+TB7begqOpM0+xy1s6GqB+nx1X6ZJAR0totDSXOwo=
X-Received: by 2002:a05:6214:486:b0:6d8:e7c9:ffa0 with SMTP id
 6a1803df08f44-6e192c73ef5mr43851476d6.19.1736951677902; Wed, 15 Jan 2025
 06:34:37 -0800 (PST)
MIME-Version: 1.0
References: <20250109150310.219442-1-tzimmermann@suse.de> <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com> <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com> <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com> <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com> <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
In-Reply-To: <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Jan 2025 14:34:26 +0000
X-Gm-Features: AbW1kvZOqZIfsgr5MQqIuf1jKNJtcUmkb-2ddanRpBEhDxEw_Wl931RGN2rzkA8
Message-ID: <CAPj87rOn=RQ615zyaEdFT2ADfPztU7+heVi0G34Rdg-=QO1cCw@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 14:20, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> No disagreement there, we need CREATE_DUMB2.
>
> My point is that we have the current UAPI, and we have userspace using
> it, but we don't have clear rules what the ioctl does with specific
> parameters, and we don't document how it has to be used.
>
> Perhaps the situation is bad, and all we can really say is that
> CREATE_DUMB only works for use with simple RGB formats, and the behavior
> for all other formats is platform specific. But I think even that would
> be valuable in the UAPI docs.

Yeah, CREATE_DUMB only works for use with simple RGB formats in a
linear layout. Not monochrome or YUV or tiled or displayed rotated or
whatever.

If it happens to accidentally work for other uses, that's fine, but
it's not generically reliable for anything other than simple linear
RGB. It's intended to let you do splash screens, consoles, recovery
password entries, and software-rendered compositors if you really
want. Anything more than that isn't 'dumb'.

Cheers,
Daniel

