Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11CB7E6C7C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 15:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629656.982007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r165w-0000IX-S7; Thu, 09 Nov 2023 14:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629656.982007; Thu, 09 Nov 2023 14:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r165w-0000FQ-OZ; Thu, 09 Nov 2023 14:33:20 +0000
Received: by outflank-mailman (input) for mailman id 629656;
 Thu, 09 Nov 2023 14:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lPpZ=GW=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1r165u-00008n-KI
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 14:33:18 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec123400-7f0c-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 15:33:17 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so156751666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 06:33:17 -0800 (PST)
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
X-Inumbo-ID: ec123400-7f0c-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699540397; x=1700145197; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/p9yeW43NcSMER0YQpwehxYcbDOe/wAYZ9SJZyRksQ=;
        b=YYTRcXtzhUq5mEFFHTJnkYipzxFASCPYlUZ9mMtb5P0Oe06/lXrw2MLHC4ZsOBrnDb
         JMsq6g7V19QNxNCvZFSWc282D2RtnsMhlH7Dr950SR+tPy9UBm9R8ymWgjj3pJvtryd2
         wt3rt+BV8dLr5hN7I9dbpvKDgGCfF6rsgA3A6VC/0MpGpmG0Nhcvj/OFmw/Mb63mHQ70
         A2ie7ttvnjKM2iC1Y200SSfKJTk54IPibGLEy8+3DVol1Ekz5HXfR/ZpQOgpl5MKq7EN
         NXsDx0LrCKzVv3mu8XNZrOGwWNpYN+RyxjOa0rhHm3/+Gea/mpQcxnsLyjC/I1Wvm37n
         WNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699540397; x=1700145197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/p9yeW43NcSMER0YQpwehxYcbDOe/wAYZ9SJZyRksQ=;
        b=MAWWZgN0zmGdCgElsMNFemvfQD5heiGUhVXTAbMpwUGxxUH0Pu+HsPeYV0A4K0fcK+
         BPfRoy/lgQMe+QjyIkdcBHUPfRpUpcMaRtHhe8Dytn/HMUkPsi/DgTrbBV5MMtbzWgk4
         7BTG6JA2XFIo+jx6IOS6w68hr6jcUnuYd6PKqsexyfhlPbVsgzUcmkcb9FFnmqEQZhXK
         yC6MlIhOfEzBkG+UqFBjUOPM3GGEWwJmkDq8ua+rCpICcq6+YTCvEredC3YTPf2QkGr+
         TRba0gbRVh8qexXhGlURGqCA2h3kNB1cUXtffqz930uF6lQ+0PlMWL7ZrE947kEbbIKY
         zdvg==
X-Gm-Message-State: AOJu0YxR14o2JhSt4Vy7nnlGiqR0kwuNhuhQTXG6hfehx/b0H6JIOjN+
	m6My2TTJu3g96BTUU97BlZFxCdttea2fHKzy95oxhg==
X-Google-Smtp-Source: AGHT+IG357JpQyVxWaJjqbV8YiVbKX+wpl5yjOXXCxYoMHlCTyZk6gVT3AeKgF8otnbJuRZg7j8Xbtz/KkJPUM7pYnw=
X-Received: by 2002:a17:907:a0b:b0:9e2:8206:2ea9 with SMTP id
 bb11-20020a1709070a0b00b009e282062ea9mr3873060ejc.60.1699540396832; Thu, 09
 Nov 2023 06:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20231107092149.404842-1-dwmw2@infradead.org> <20231107092149.404842-7-dwmw2@infradead.org>
In-Reply-To: <20231107092149.404842-7-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Nov 2023 14:33:06 +0000
Message-ID: <CAFEAcA8McSqwXyAg1+9_DOjy5PU==FRja_gjkdXAAqjr7QtLQA@mail.gmail.com>
Subject: Re: [PULL 06/15] hw/xen: automatically assign device index to block devices
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Nov 2023 at 09:24, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> There's no need to force the user to assign a vdev. We can automatically
> assign one, starting at xvda and searching until we find the first disk
> name that's unused.
>
> This means we can now allow '-drive if=3Dxen,file=3Dxxx' to work without =
an
> explicit separate -driver argument, just like if=3Dvirtio.
>
> Rip out the legacy handling from the xenpv machine, which was scribbling
> over any disks configured by the toolstack, and didn't work with anything
> but raw images.

Hi; Coverity points out an issue in this code (CID 1523906):

> +/*
> + * Find a free device name in the xvda =E2=86=92 xvdfan range and set it=
 in
> + * blockdev->props.vdev. Our definition of "free" is that there must
> + * be no other disk or partition with the same disk number.
> + *
> + * You are technically permitted to have all of hda, hda1, sda, sda1,
> + * xvda and xvda1 as *separate* PV block devices with separate backing
> + * stores. That doesn't make it a good idea. This code will skip xvda
> + * if *any* of those "conflicting" devices already exists.
> + *
> + * The limit of xvdfan (disk 4095) is fairly arbitrary just to avoid a
> + * stupidly sized bitmap, but Linux as of v6.6 doesn't support anything
> + * higher than that anyway.
> + */
> +static bool xen_block_find_free_vdev(XenBlockDevice *blockdev, Error **e=
rrp)
> +{
> +    XenBus *xenbus =3D XEN_BUS(qdev_get_parent_bus(DEVICE(blockdev)));
> +    unsigned long used_devs[BITS_TO_LONGS(MAX_AUTO_VDEV)];
> +    XenBlockVdev *vdev =3D &blockdev->props.vdev;
> +    char fe_path[XENSTORE_ABS_PATH_MAX + 1];
> +    char **existing_frontends;
> +    unsigned int nr_existing =3D 0;
> +    unsigned int vdev_nr;
> +    int i, disk =3D 0;
> +
> +    snprintf(fe_path, sizeof(fe_path), "/local/domain/%u/device/vbd",
> +             blockdev->xendev.frontend_id);
> +
> +    existing_frontends =3D qemu_xen_xs_directory(xenbus->xsh, XBT_NULL, =
fe_path,
> +                                               &nr_existing);
> +    if (!existing_frontends && errno !=3D ENOENT) {

Here we check whether existing_frontends is NULL, implying it
might be NULL (and the && in the condition means we might not
take this error-exit path even if it is NULL)...

> +        error_setg_errno(errp, errno, "cannot read %s", fe_path);
> +        return false;
> +    }
> +
> +    memset(used_devs, 0, sizeof(used_devs));
> +    for (i =3D 0; i < nr_existing; i++) {
> +        if (qemu_strtoui(existing_frontends[i], NULL, 10, &vdev_nr)) {

...but here we deref existing_frontends, implying it can't be NULL.

> +            free(existing_frontends[i]);
> +            continue;
> +        }
> +
> +        free(existing_frontends[i]);
> +
> +        disk =3D vdev_to_diskno(vdev_nr);
> +        if (disk < 0 || disk >=3D MAX_AUTO_VDEV) {
> +            continue;
> +        }
> +
> +        set_bit(disk, used_devs);
> +    }
> +    free(existing_frontends);

thanks
-- PMM

