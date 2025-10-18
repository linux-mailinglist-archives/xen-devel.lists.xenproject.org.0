Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A99BEC7DA
	for <lists+xen-devel@lfdr.de>; Sat, 18 Oct 2025 06:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145485.1478406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9yth-0000Iu-Mq; Sat, 18 Oct 2025 04:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145485.1478406; Sat, 18 Oct 2025 04:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9yth-0000H7-K3; Sat, 18 Oct 2025 04:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1145485;
 Sat, 18 Oct 2025 04:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxYo=43=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1v9ytf-0000H1-HI
 for xen-devel@lists.xenproject.org; Sat, 18 Oct 2025 04:50:27 +0000
Received: from mail-yx1-xb12c.google.com (mail-yx1-xb12c.google.com
 [2607:f8b0:4864:20::b12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f548d22e-abdd-11f0-9d15-b5c5bf9af7f9;
 Sat, 18 Oct 2025 06:50:24 +0200 (CEST)
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-63e1c0fd7ddso1276108d50.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 21:50:24 -0700 (PDT)
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
X-Inumbo-ID: f548d22e-abdd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760763023; x=1761367823; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIcKoM0w5d+FWz+9+3EWxNCBqPh+IYEG3nR6drWx/WA=;
        b=KQMM3Zh1XthsVhE8W4inCoNaJG5PbWDUj6Dj6lNX9Moj4SdsVLnWo/OEuVGB/P6Ts0
         SMi0vb+tfrW2Zs/KRsQKfkKfdn3JD1NIu5RfjzoUmCun53lc4TLurYuUVtY2M8E0s581
         A77JddGkwOAJVsWEd5blk7Hm7foDoU5e7FKNM/Xl5gzlgoyD7t6T8CmX6ERodZBR5XkW
         XrGi3wJ5fhc+slaqUPehc+heLcZU0ddRnX0whmAvtuG3od0ht2Yx12ZeYZspc9pVKBM/
         EROwNeRrsLddTP2oG7Se/Ps8Rkkv363s1ExGQFmgbdsQMAg+meB6jSS822+biDdjg7QQ
         qeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760763023; x=1761367823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIcKoM0w5d+FWz+9+3EWxNCBqPh+IYEG3nR6drWx/WA=;
        b=w2CgW8NlrS7/buD+hK7wYxvGFImC6jtGAFUWEC1ryO96kU1d4HJkW/H9to/h+9AV/E
         c1MGUb2h/O5YiEVL/ptLt4tYQOo6UULQJ4Uv0hqGkRdDvbJBqnpT+Rm7qNgZRCxbRXex
         VP/9NJJsxXxKiNvpHWpAzWkOFFUWX61sC3LlOwIIx3f4Z+9buWSBD8b38X/Ee/PFSLzd
         tBmReSS1Iu/ATAJHj0EY5j0MfI4F+50CU2zrfmzEk/f75YBZ+28kyPWe8lMQglwhqsRw
         wU2fdE6EIczo5VrW2blXbueudmS1lgJsmIDhhJCjGCS3wpq/BnpHN5gf6QdRmae0wNpy
         Hx9g==
X-Forwarded-Encrypted: i=1; AJvYcCWb1gwxk43WgiQHRT85xvGwDlnGhS0LTfGUUV42B0WQ2/41tvayvjCuMCE2FCZDA2JzLkWYLPPpPWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvLRtPDBxnU6TYfkFjLcO+w1G1uGZeQNV1U7g87ih8vjxQwGyu
	JkFC9zgS6lEMJ9mE9dv8eHGdvQT128Oe9XfrcZW6WLWqBXVxA10nfqnBxYXrCko4181lYGp2IFp
	sKOMENOjLZ08WtUUWeIsbXBM28pU7XHQ5PK9c
X-Gm-Gg: ASbGncvmEzmGwZe/+AtLSGkm5xk3fhDikjwMOOI+otxpjn7jXnaD0L01xxeuad4feWg
	6UMCco9tE292xw/YNI/pR0JTYpPOoRwtyDbI63Vn2n95FxZC87v0tCdEsDXyGKF7+gY41z2N18d
	uYrhmynZnq0zAothDvJLGSW2ZFLq2g4cymBiF14yduF/ya9Q+qroZat4ERbTCo6sheLuOJDrAjK
	VlP7RI6GCSpKrb+/tbKJrUbiurDul8yPrkQVtr05AV/t6XeDDSGIkZT6N5JKWFfOdhYtnQ=
X-Google-Smtp-Source: AGHT+IEilvWbtCW5uBzm7QpX6iKYSCadhAVZKn4tREbb4azBJtfoTD7u65ot1ZeFv6sGpoaqvlRwGvnbmi4Mxk986C4=
X-Received: by 2002:a05:690e:2505:10b0:63c:efd6:c607 with SMTP id
 956f58d0204a3-63e160d904emr4363604d50.3.1760763023085; Fri, 17 Oct 2025
 21:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251017155136.16540-1-roger.pau@citrix.com>
In-Reply-To: <20251017155136.16540-1-roger.pau@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 18 Oct 2025 05:50:11 +0100
X-Gm-Features: AS18NWAhPCgMVZ6RyFOMVIDyG8JZlvyB7tbnYI4D_8IsK9EL7c2IPK05IjJcI0c
Message-ID: <CAHt6W4cpBv3JhzFJg1pMw+z04uo41po2+GwJW1NZG8PD816U9Q@mail.gmail.com>
Subject: Re: [PATCH] hw/xen: pass PCI domain to xc_physdev_map_pirq_msi()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 4:52=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> It's currently impossible for passthrough devices on segment different th=
an
> 0 to work correctly, as the PCI domain is not provided to
> xc_physdev_map_pirq_msi(), and hence it's unconditionally assumed that al=
l
> devices are on segment 0.
>
> Adjust the call to xc_physdev_map_pirq_msi() to pass the PCI domain in th=
e
> high 16bits of the bus parameter.  On versions of Xen where this is not
> supported the passed segment will be ignored and assume to be 0, no worse

typo: assumed

> than the current state.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony PERARD <anthony@xenproject.org>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  hw/xen/xen_pt_msi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
> index e9ba17317aba..df15ccf0d030 100644
> --- a/hw/xen/xen_pt_msi.c
> +++ b/hw/xen/xen_pt_msi.c
> @@ -138,6 +138,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
>          rc =3D xc_physdev_map_pirq_msi(xen_xc, xen_domid, XEN_PT_AUTO_AS=
SIGN,
>                                       ppirq, PCI_DEVFN(s->real_device.dev=
,
>                                                        s->real_device.fun=
c),
> +                                     ((uint32_t)s->real_device.domain <<=
 16) |
>                                       s->real_device.bus,
>                                       msix_entry, table_base);
>          if (rc) {

Reviewed-by: Frediano Ziglio <freddy77@gmail.com>

This was tested on a real machine.

Frediano

