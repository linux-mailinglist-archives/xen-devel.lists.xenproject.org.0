Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7F876EF9
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 04:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690490.1076537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rinUy-0000ze-Nq; Sat, 09 Mar 2024 03:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690490.1076537; Sat, 09 Mar 2024 03:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rinUy-0000x2-K3; Sat, 09 Mar 2024 03:35:48 +0000
Received: by outflank-mailman (input) for mailman id 690490;
 Sat, 09 Mar 2024 03:35:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n0of=KP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rinUw-0000wd-NU
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 03:35:46 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d0c3c95-ddc6-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 04:35:45 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so38906531fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 19:35:45 -0800 (PST)
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
X-Inumbo-ID: 1d0c3c95-ddc6-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709955345; x=1710560145; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytsxnHtpmEBKqqWctGKiw7/Ms2x8N2LrUmUr2AL0+wY=;
        b=S2ZZQaoe7/pTDa9hXV+9xXUzfNuf2VrkISzq0b8Cbu0bgR6y6o17Qa77gU5957NHgJ
         8A3Q/VlR97i7EBbmAHcqjEvofbMatE17fWQdBzOSnABom0Hvtl/6pNMGQ8OOHxak8jh3
         8qcVOUOPA7dpCEd4famih20vHG9fAWPj1vVQ+3QuhAS6Ku7oxxLT/qAKQ+LwgPgeQy7d
         OmXy8vkzjG8OSaPqtSrh7ljma1UyGuyytXydk/4kvkZ8WcSWgf3x+FY7ew2swy1Z+Em2
         jTUxH6FY51S0U7IN5gUYlY60JkkkbtvHMlX3Hvn139yVvuFXErFvJXxXTUXcNts3IJXe
         TMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709955345; x=1710560145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytsxnHtpmEBKqqWctGKiw7/Ms2x8N2LrUmUr2AL0+wY=;
        b=h3lcXO1Vvj+0Kx/Y+ENFrSySo0v6qmxRvhjUNCd5vKzeZMFpAtroBmAPwg0b8a6LOH
         Xr582x0nW0nvq8JbXWRMmpOQv85XcBZ2bjZJgoV89soNtt7z+EyE8puqYvT5VKHjsSR2
         TjDWTslfoxn8YwXlqAbL1liP3LT0T0BclLwPZxizOc2Q+qcLvcq/FQPQn3mqEk5a50J5
         yPzHdOaFaHntI1NQwrJxVYKS5lR1TdzUvuhrWcqX0cxZw7VmF6wK4lzXV/7FIOZXxf0e
         s7BteswPHHbxzCUQwqgaPZkw/AS80mMzIJL8lGyV0ZksGFVotYVedx3IW3rd2IZuvujY
         s3CA==
X-Forwarded-Encrypted: i=1; AJvYcCWoGU2ON44CeMVJ0sQbsjNLAZyHlON2d769RM0mHmZsF/m5OPHso4W3o6Oxe7dCk+zHgsDvCv7P99F8pVqpkVzU+fUQLpZs25ir35yes10=
X-Gm-Message-State: AOJu0Yy7mRPsswSKKKcuu1etfQ6p+1fOF28Ff9pzcOu5tCee2GZaK8tM
	WNeTZ5I/FDXztgCVAx8Oo09tNDVuWe+4eUCzsfRVN6PJJjJOD21FAaxeGz7xw+BgUxhmocoKYmN
	NGk890abMe88zrjQIusHYM2OR/Mu+cJjYziI=
X-Google-Smtp-Source: AGHT+IEyJOtEREPXpZYtaMDNs4rOhx8WJyezwfQ1NA7tbhObr8lAboMBnMFazQ7OWymEHbqP1y5Qx8WpLPp7ieRlQsg=
X-Received: by 2002:a2e:8ec5:0:b0:2d4:21d6:b05e with SMTP id
 e5-20020a2e8ec5000000b002d421d6b05emr513293ljl.52.1709955344857; Fri, 08 Mar
 2024 19:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20240305191312.321127-1-marmarek@invisiblethingslab.com> <20240305191312.321127-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20240305191312.321127-2-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 8 Mar 2024 22:35:33 -0500
Message-ID: <CAKf6xpuMzuAgjyVsFYgtnKFc4obx9cf4XB132qZVGpkMVDGEgg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] xen: fix stubdom PCI addr
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, 
	=?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0IChmZXBpdHJlKQ==?= <frederic.pierret@qubes-os.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 2:13=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> From: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qubes-os.org=
>

Needs to be changed to Marek.

> When running in a stubdomain, the config space access via sysfs needs to
> use BDF as seen inside stubdomain (connected via xen-pcifront), which is
> different from the real BDF. For other purposes (hypercall parameters
> etc), the real BDF needs to be used.
> Get the in-stubdomain BDF by looking up relevant PV PCI xenstore
> entries.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
> Changes in v2:
> - use xs_node_scanf
> - use %d instead of %u to read values written as %d
> - add a comment from another iteration of this patch by Jason Andryuk
> ---
>  hw/xen/xen-host-pci-device.c | 69 +++++++++++++++++++++++++++++++++++-
>  hw/xen/xen-host-pci-device.h |  6 ++++
>  2 files changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
> index 8c6e9a1716..8ea2a5a4af 100644
> --- a/hw/xen/xen-host-pci-device.c
> +++ b/hw/xen/xen-host-pci-device.c
> @@ -9,6 +9,8 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
> +#include "hw/xen/xen-legacy-backend.h"
> +#include "hw/xen/xen-bus-helper.h"
>  #include "xen-host-pci-device.h"
>
>  #define XEN_HOST_PCI_MAX_EXT_CAP \
> @@ -33,13 +35,67 @@
>  #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
>  #define IORESOURCE_MEM_64       0x00100000
>
> +/*
> + * Non-passthrough (dom0) accesses are local PCI devices and use the giv=
en BDF
> + * Passthough (stubdom) accesses are through PV frontend PCI device.  Th=
ose
> + * either have a BDF identical to the backend's BDF (xen-backend.passthr=
ough=3D1)
> + * or a local virtual BDF (xen-backend.passthrough=3D0)
> + *
> + * We are always given the backend's BDF and need to lookup the appropri=
ate
> + * local BDF for sysfs access.
> + */
> +static void xen_host_pci_fill_local_addr(XenHostPCIDevice *d, Error **er=
rp)
> +{
> +    unsigned int num_devs, len, i;
> +    unsigned int domain, bus, dev, func;
> +    char *be_path =3D NULL;
> +    char path[80];

path is now only used for dev/vdev-%d, so 80 could be reduced.

> +
> +    be_path =3D qemu_xen_xs_read(xenstore, 0, "device/pci/0/backend", &l=
en);
> +    if (!be_path)

error_setg() here?

> +        goto out;
> +
> +    if (xs_node_scanf(xenstore, 0, be_path, "num_devs", NULL, "%d", &num=
_devs) !=3D 1) {
> +        error_setg(errp, "Failed to read or parse %s/num_devs\n", be_pat=
h);
> +        goto out;
> +    }
> +
> +    for (i =3D 0; i < num_devs; i++) {
> +        snprintf(path, sizeof(path), "dev-%d", i);
> +        if (xs_node_scanf(xenstore, 0, be_path, path, NULL,
> +                          "%x:%x:%x.%x", &domain, &bus, &dev, &func) !=
=3D 4) {
> +            error_setg(errp, "Failed to read or parse %s/%s\n", be_path,=
 path);
> +            goto out;
> +        }
> +        if (domain !=3D d->domain ||
> +                bus !=3D d->bus ||
> +                dev !=3D d->dev ||
> +                func!=3D d->func)
> +            continue;
> +        snprintf(path, sizeof(path), "vdev-%d", i);
> +        if (xs_node_scanf(xenstore, 0, be_path, path, NULL,
> +                          "%x:%x:%x.%x", &domain, &bus, &dev, &func) !=
=3D 4) {
> +            error_setg(errp, "Failed to read or parse %s/%s\n", be_path,=
 path);
> +            goto out;
> +        }
> +        d->local_domain =3D domain;
> +        d->local_bus =3D bus;
> +        d->local_dev =3D dev;
> +        d->local_func =3D func;
> +        goto out;
> +    }

error_setg here in case we exited the loop without finding a match?

Thanks,
Jason

> +
> +out:
> +    free(be_path);
> +}
> +

