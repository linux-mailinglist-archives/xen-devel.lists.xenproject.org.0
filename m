Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65307781EF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 22:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582200.911826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUBrn-0002ND-Fs; Thu, 10 Aug 2023 20:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582200.911826; Thu, 10 Aug 2023 20:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUBrn-0002KM-Cf; Thu, 10 Aug 2023 20:02:43 +0000
Received: by outflank-mailman (input) for mailman id 582200;
 Thu, 10 Aug 2023 20:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGPc=D3=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qUBrl-0002KG-6C
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 20:02:41 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db350e38-37b8-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 22:02:38 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5231410ab27so1615439a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Aug 2023 13:02:38 -0700 (PDT)
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
X-Inumbo-ID: db350e38-37b8-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691697758; x=1692302558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rf/JiRgTxAKa0argPmibUk4LC5slrYRdDGlyKPWfyM=;
        b=RfcJMnLGNXCgeuU/RIOYkruNpkC9cCf7Ggs74g0LI/34ffLGGNw0TfIeCkodzY5KRt
         il0NHS7wiqt7dINLgpdPycj9hHNd1poEBKtbLAnzBPefO5S6xr+lhTvu2QHOmZtDPsrY
         LhTI8HO8ahHKZPxbfHWJgscwBGK2ZUNgU3ujkbhTh9s2aoGYlltqSPlhY3xcX1IAu/ke
         lgu5ZilAlSIKqtmJ4u0IwiEzU8+LF6m6mvvecgMoFZG3MdzC9Vizh+Cl/gbE+InShdIa
         PBZ80Wm/gMlZxakEc/1xxq6D+av8i1ZS4q+P2DDJp///HZFn109elqua5vLyDYeJQfDC
         jv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691697758; x=1692302558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rf/JiRgTxAKa0argPmibUk4LC5slrYRdDGlyKPWfyM=;
        b=degovSdjlZ+JshbA4DB7ciktvY6TQYeUApyACfYMhNwFkToEDWcrOQB35OCOi7GDkQ
         mQf04JTzib3+dKLRENpLUqYdxPII6skGeU6b32Nds5htnlfrwk8qMFGt9/81xbwZTPsg
         OF0YBGAndz9ZWlKQnrB4OvLNPORqZy1fGnqJRP+7l56MzpOvp/FUZkM68FuPz/FudfVi
         XGzfdkLj3Fpbmmok0xw+zgtnhuneAYabpEdJT92WXNQHzZwNbydwPLV0RlS3lARyjeCm
         XeLVW/RNPStR6nTWdt7SK2QyOuI7unrLcbLJVPIU6rjrRcbfHMStuO63i6tsxkZPeYG4
         1axg==
X-Gm-Message-State: AOJu0YxqZlk+9qIN8cUXpKTcVsjVYH3MtVvRduK136yaRqYTCLpfQq1C
	C/o/Wv/LEEaztHchKI3LB1YymrsYtFQB/Do48Ao=
X-Google-Smtp-Source: AGHT+IGxDAgS9ADpWY5Il8UlXPbJEJjVg9k5fap6/vNBtIeu1wqFr0BE5YNviKjm6yQVQsSk0HTZeXRol17NgbYtheQ=
X-Received: by 2002:aa7:d7d5:0:b0:522:bca7:2a20 with SMTP id
 e21-20020aa7d7d5000000b00522bca72a20mr16309eds.17.1691697757906; Thu, 10 Aug
 2023 13:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230809103305.30561-1-julien@xen.org> <20230809103305.30561-3-julien@xen.org>
In-Reply-To: <20230809103305.30561-3-julien@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 10 Aug 2023 16:02:26 -0400
Message-ID: <CAKf6xpvLtOTH-WVz8B6df=WF5M=Cng8BBWTvOOJ3C1N8QbqWWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach for
 HVM domain
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 6:34=E2=80=AFAM Julien Grall <julien@xen.org> wrote:
>
> From: Julien Grall <jgrall@amazon.com>
>
> Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
> a PCI is attached (see pci_add_dm_done()) for all domain types. However,
> the permissions are only revoked for non-HVM domain (see do_pci_remove())=
.
>
> This means that HVM domains will be left with extra permissions. While
> this look bad on the paper, the IRQ permissions should be revoked
> when the Device Model call xc_physdev_unmap_pirq() and such domain
> cannot directly mapped I/O port and IOMEM regions. Instead, this has to
> be done by a Device Model.
>
> The Device Model can only run in dom0 or PV stubdomain (upstream libxl
> doesn't have support for HVM/PVH stubdomain).
>
> For PV/PVH stubdomain, the permission are properly revoked, so there is
> no security concern.
>
> This leaves dom0. There are two cases:
>   1) Privileged: Anyone gaining access to the Device Model would already
>      have large control on the host.
>   2) Deprivileged: PCI passthrough require PHYSDEV operations which
>      are not accessible when the Device Model is restricted.
>
> So overall, it is believed that the extra permissions cannot be exploited=
.
>
> Rework the code so the permissions are all removed for HVM domains.
> This needs to happen after the QEMU has detached the device. So
> the revocation is now moved in a separate function which is called
> from pci_remove_detached().
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

With one suggestion below

> ---
>
> TODO: I am getting a bit confused with the async work in libxl. I am
> not entirely sure whether pci_remove_detached() is the correct place
> to revoke.

I think the location is fine.

> TODO: For HVM, we are now getting the following error on detach:
> libxl: error: libxl_pci.c:2009:pci_revoke_permissions: Domain 3:xc_physde=
v_unmap_pirq irq=3D23: Invalid argument
>
> This is because the IRQ was unmapped by QEMU. It doesn't feel
> right to skip the call. So maybe we can ignore the error?

Sounds reasonable.  Would be better if we could clearly differentiate
between QEMU already unmapped and some other EINVAL error.

> ---
>  tools/libs/light/libxl_pci.c | 142 ++++++++++++++++++++---------------
>  1 file changed, 80 insertions(+), 62 deletions(-)
>
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 7f5f170e6eb0..f5a4b88eb2c0 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1943,6 +1943,79 @@ static void pci_remove_stubdom_done(libxl__egc *eg=
c,
>  static void pci_remove_done(libxl__egc *egc,
>      pci_remove_state *prs, int rc);
>
> +static void pci_revoke_permissions(libxl__egc *egc, pci_remove_state *pr=
s)
> +{
> +    STATE_AO_GC(prs->aodev->ao);
> +    libxl_ctx *ctx =3D libxl__gc_owner(gc);
> +    const libxl_device_pci *pci =3D &prs->pci;
> +    const char *sysfs_path;
> +    uint32_t domid =3D prs->domid;
> +    FILE *f;
> +    unsigned int start =3D 0, end =3D 0, flags =3D 0, size =3D 0;

These variables ...

> +    int irq =3D 0;
> +    int i, rc;
> +
> +    sysfs_path =3D GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource",
> +                           pci->domain, pci->bus, pci->dev, pci->func);
> +
> +    f =3D fopen(sysfs_path, "r");
> +    if (f =3D=3D NULL) {
> +        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
> +        goto skip_bar;
> +    }
> +
> +    for (i =3D 0; i < PROC_PCI_NUM_RESOURCES; i++) {

... could move into the loop here.

> +        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) !=3D 3)
> +            continue;
> +        size =3D end - start + 1;

Regards,
Jason

