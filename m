Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021AA29E252
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 03:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13960.34824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXxPj-00026T-4A; Thu, 29 Oct 2020 02:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13960.34824; Thu, 29 Oct 2020 02:11:43 +0000
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
	id 1kXxPj-000264-0v; Thu, 29 Oct 2020 02:11:43 +0000
Received: by outflank-mailman (input) for mailman id 13960;
 Thu, 29 Oct 2020 02:11:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPBj=EE=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kXxPh-00025z-Qh
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 02:11:41 +0000
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac91b00e-6eff-444d-a3f4-29f1296db876;
 Thu, 29 Oct 2020 02:11:40 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id i186so869623ybc.11
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 19:11:40 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PPBj=EE=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
	id 1kXxPh-00025z-Qh
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 02:11:41 +0000
X-Inumbo-ID: ac91b00e-6eff-444d-a3f4-29f1296db876
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ac91b00e-6eff-444d-a3f4-29f1296db876;
	Thu, 29 Oct 2020 02:11:40 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id i186so869623ybc.11
        for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 19:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lc088nZoBzO5fGaktrxcU2f5uhW2KCUmmkhovFmnDRE=;
        b=p/PHugc93k5KhasO70GRjI+ime6/EhUDb4p+zZUF4bm+4tFbJ4QnzopkeTWJlmYDLS
         QS+DlhJP+2ssbjo4MKmTnhhyXTsr6mcpN+UyHbMZ+8GG39WoRdtQzyCJrV8ti13X4m+H
         iLtjHbkfv3LO6yZVix/+eKeLk7QvuWMjB7mRLnWbDajnmbnkinFWR9SyU79dz3TSxtmI
         3cF4ig9aBrunJF3J0e6zGIKMQ77/4heuw5DD1wN+YZHowY5XUf5bre76wS1nhuyOqLre
         JtRYReN+ctoxgm4WkwUa24llNcHO0AN6OkUFh/9i+qaWpsJW/8t67SVaoKiV+1051qi2
         s8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lc088nZoBzO5fGaktrxcU2f5uhW2KCUmmkhovFmnDRE=;
        b=hOUBIq96EAXD7/CsXtX22ePX1g0X20D78QcsoxszYS8b7/4vPaVv/lOW7Dp+tpeTZ7
         OoiJZ7wOyL1kdVxvuWaFJbslpBkObmMY5i/UKgjQaO/jyH4qy6Xspwn6z1Op+mPcEuNl
         jgszlYcVsIcErBVuQ01EriDl9fCEv0YqMsCOfeXv05tjF5kBXcOMpeVz2Gtczq67V5pD
         aLJTWuYukQAfzFo02wQ8lxtyDFUpeJjeLzNjpz6YZeCPgS9W6svnmVewENo4PdnOyTMS
         LGSkPefKeZ5tNacsjaV12pXG+0JnSpwhWSx1i9tez27M4YU+VyEjum+8NCEIQ371MKVK
         jhyA==
X-Gm-Message-State: AOAM530WwOJ0E9KOP4tlTEvq8Av2dUnD2+2uYdAhe/r0k3dSr/MwsWtr
	gV3kv+MR0JQIuoeKbZRDgFAf2rlrnM2qBi/S3pVu3g==
X-Google-Smtp-Source: ABdhPJyA1ae5C1hgDl3PfWOToRM8A2j6q1B+Kp7Vbvjm/+coKjcmIlEUox3dKA5ObPMxt4zaoGwpxJ4CyeD7uhW7vuo=
X-Received: by 2002:a25:2d6:: with SMTP id 205mr2857987ybc.233.1603937500385;
 Wed, 28 Oct 2020 19:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201028174406.23424-1-alex.bennee@linaro.org>
In-Reply-To: <20201028174406.23424-1-alex.bennee@linaro.org>
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Thu, 29 Oct 2020 11:11:29 +0900
Message-ID: <CAA93ih1z4dr0EMUg0G2WHXuzcK1ghET-8RJ_UuuFeWbToSnz3A@mail.gmail.com>
Subject: Re: [PATCH] meson.build: fix building of Xen support for aarch64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

2020=E5=B9=B410=E6=9C=8829=E6=97=A5(=E6=9C=A8) 2:44 Alex Benn=C3=A9e <alex.=
bennee@linaro.org>:
>
> Xen is supported on aarch64 although weirdly using the i386-softmmu
> model. Checking based on the host CPU meant we never enabled Xen
> support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
> make it not seem weird but that will require further build surgery.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Fixes: 8a19980e3f ("configure: move accelerator logic to meson")

Thanks for the fix, I confirmed that the CONFIG_XEN=3D1 on arm64 build.

Reviewed-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>

Thank you,


> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 835424999d..f1fcbfed4c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
>      'CONFIG_HVF': ['x86_64-softmmu'],
>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>    }
> +elif cpu in [ 'arm', 'aarch64' ]
> +  accelerator_targets +=3D { 'CONFIG_XEN': ['i386-softmmu'] }
>  endif
>
>  ##################
> --
> 2.20.1
>


--
Masami Hiramatsu

