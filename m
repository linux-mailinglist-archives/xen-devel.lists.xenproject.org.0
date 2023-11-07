Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2927E4916
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 20:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628978.980970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0RbL-0003JW-TY; Tue, 07 Nov 2023 19:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628978.980970; Tue, 07 Nov 2023 19:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0RbL-0003H7-QC; Tue, 07 Nov 2023 19:19:03 +0000
Received: by outflank-mailman (input) for mailman id 628978;
 Tue, 07 Nov 2023 19:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQVP=GU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0RbK-0003H1-LK
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 19:19:02 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 815fe951-7da2-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 20:19:00 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so10435273a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 11:19:00 -0800 (PST)
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
X-Inumbo-ID: 815fe951-7da2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699384740; x=1699989540; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH+Z8GE0ox0XEjyJcui2h4jyACm/g0m2uaxOlWYGrfg=;
        b=OZmq/oFrjP2Lkkllmko4PfZJIls4GuTTDB9tfF0cabS/J2GKNxR/an6gKHnD3Kz4YF
         C+5GqTCQpmTZOlgAVwtRYXp2zUee1aOYqzLv2dDq0IA304xBlWIIkYdjuhes8rTves31
         fvhX60N4ikjvJMxj0/+Jk7c0UW2l4b/i8AkyLvynR3OC3EcHAy5OhWyhZV/cDmjZGTZW
         1Ct681AbCTWMf6FnRbidZt9HkTpqwLPBVnV3LM7V5NnL4AeplaV8pv2NmKYTsr1rHjMA
         Wl1oZB5EQju4AtGAO+COmRMEckMPlcl7WmqeE/2Y2RQBI1vVPyj8QMblPEPKhZgWRQNl
         o/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699384740; x=1699989540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH+Z8GE0ox0XEjyJcui2h4jyACm/g0m2uaxOlWYGrfg=;
        b=rwqlLrYI9PsWOY1x4oVcenz5QRQv7+KuAqs3rGQJ3DIZik8p6fy96i+YnAmVtgfzIX
         9Y9vSVE/B3BuMzv2rPepHAALlFCxE/wspgN5W/LRbunPRclKsDNj70vMVhb33bZDmowF
         aW/4EZfs/25y+UGEWypzgRnY9Ntv9Fej5iRATcNRDgenMKQqwEBheLzD5nyydE6ecNIx
         /vUOfqnk0xEJwl5SnZ3+JXAFXAkV1AgfsEFZGqnL+ZfhHxBy7dYmXOTTm6HwWmHcDS0s
         asOGQxISvwjcMLjWioihoZuYCoUy8D9H7miQXrlM7W+Dzw4RaJ/LCb+eJ6BmI6pZNpzP
         Hqfw==
X-Gm-Message-State: AOJu0Yxy7Ip1H/NotjiRQP/4OcdkRonJ763iYDqK+P2Pkiz5k0V7HiSr
	hEBhd3lzQRnIa2N3Unz/BnZk5vh3Q4GA4QQ/9tE=
X-Google-Smtp-Source: AGHT+IGg2xNAh0OFnnDZ9t5QxxnY50vQsqmzdrSiwCnIPAOn4SLxnd1PlopDFkGYUYHdtDvO1m1JsnUNmG2RZIRsvvE=
X-Received: by 2002:aa7:cc8c:0:b0:53f:738c:3eeb with SMTP id
 p12-20020aa7cc8c000000b0053f738c3eebmr25421280edt.28.1699384739757; Tue, 07
 Nov 2023 11:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-21-jgross@suse.com>
In-Reply-To: <20231101093325.30302-21-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 7 Nov 2023 14:18:46 -0500
Message-ID: <CAKf6xps6DOJpVqsVv_OzQbuG2fQniYtbDyu=WSqrC+FXC=K5dw@mail.gmail.com>
Subject: Re: [PATCH 20/29] tools: add 9pfs device to xenstore-stubdom
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 8:23=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add a 9pfs device to Xenstore stubdom in order to allow it to do e.g.
> logging into a dom0 file.
>
> Use the following parameters for the new device:
>
> - tag =3D "xen"
> - type =3D "xenlogd"
> - path =3D "/var/lib/xen/xenstore"
>
> For now don't limit allowed file space or number of files.
>
> Add a new libxl function for adding it similar to the function for
> adding the console device.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.=
c
> index 0b9d84dce9..3297389493 100644
> --- a/tools/libs/light/libxl_9pfs.c
> +++ b/tools/libs/light/libxl_9pfs.c
> @@ -174,6 +174,35 @@ static void libxl__device_p9_add(libxl__egc *egc, ui=
nt32_t domid,
>          aodev->callback(egc, aodev);
>  }
>
> +int libxl_p9_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backe=
nd,
> +                          libxl_p9_type type, char *tag, char *path,
> +                          unsigned int max_space, unsigned int max_files=
,
> +                          unsigned int max_open_files, bool auto_delete,
> +                          const libxl_asyncop_how *ao_how)
> +{
> +    AO_CREATE(ctx, domid, ao_how);
> +    libxl__ao_device *aodev;
> +    libxl_device_p9 p9 =3D { .backend_domid =3D backend,
> +                           .tag =3D tag,
> +                           .path =3D path,
> +                           .security_model =3D "none",

While the xl.cfg man page states that only security_model=3D"none" is
supported, it is possible to use other ones.    The value isn't
inspected and it is just passed through Xenstore to QEMU.  QEMU can
then operate however it operates.  I just tested mapped-xattr and it's
working from some quick testing.  So maybe libxl_p9_add_xenstore()
should take security_model as an argument, and then
init-xenstore-domain can pass in "none"?

Everything else looks good, so either way:
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

