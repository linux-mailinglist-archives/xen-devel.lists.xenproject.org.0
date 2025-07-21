Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC931B0C450
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 14:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051497.1419834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udps4-0000ll-Ji; Mon, 21 Jul 2025 12:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051497.1419834; Mon, 21 Jul 2025 12:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udps4-0000jd-GD; Mon, 21 Jul 2025 12:43:56 +0000
Received: by outflank-mailman (input) for mailman id 1051497;
 Mon, 21 Jul 2025 12:43:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j1p=2C=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1udps2-0000jX-Jr
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 12:43:54 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59eb9738-6630-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 14:43:51 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-41eaf6805ebso1773702b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 05:43:50 -0700 (PDT)
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
X-Inumbo-ID: 59eb9738-6630-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753101829; x=1753706629; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mavMri4ux35uKRjyi22GoDCosdnvugr6dqfVNA9ZXk=;
        b=TVQDSLThx1Vxa87cmKjrVZYDdOrY5WYrDmXHrL00Vvkq8+ggGfWqCdGsp054tywPa6
         juvXkdcIDWG7/Zvso/j98QvoIdyG//TgJbexW8c5Ww6j+syBSo0o5VPupbWCGd+5IROB
         Iu5atOqS2NGWJLBm+8c/DM2JdrARDPTle8tSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753101829; x=1753706629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mavMri4ux35uKRjyi22GoDCosdnvugr6dqfVNA9ZXk=;
        b=QLBecF5Y5KuV3e/87s0UyMBYllazfwEwAgrReoZcIoRgLZqXU9GdEU47Snn+CGK+ry
         jcotr6MiUaujQBoaUEFs5WwMFg4vEccHnIqFunSh0hrAmW+7zYOT9v95Uvcp1/238kwA
         UkxpiL0CY49V309amNYvvWhUygywmyRCwtGdT8V9WtXBxDtm4ntEShx4fFqqJ3O+rnX7
         mrgammSlWErPdvwh6edrG87FngIDTdxWlfCnTgyoWCm7G8nTjJ6fCmvTf775/tTC9PAv
         4vUbBkP93sthi2s4xjxQagIvkGStjynwokpy1wNLJt6sl9mUmQgjOHHk0Qhm/7UMW8L/
         VCig==
X-Gm-Message-State: AOJu0YyeaYRMSz09aaEFdyU3uWcGBit1c5XJ2b3ZxvrMwgPFOsSr4AZZ
	r0G1srYfMgVnF5dl3/GQDfA5fd2S6Wai0pUOw4lMTvy2tqQ+89fFOn18ZqUlyZUfBUmW+RYGcu6
	Sk1scqexHVdlmKq/WbINPKKZ19GcpODEhk4Ii/RVU4pu6L2fXWJN6er8=
X-Gm-Gg: ASbGncthDfEIWf08wLkOvlNRgeQBri8vAAHSc1XfIvgl3t6wLKsSyNHqeJcHJEdMiRO
	n5FVEbYncBHE5URi9PKdCR0gd/mdVGnlxmmfGUjyu8+hD5h3u0GmH10Z/fkD9D2+lE0N0x0Vpxt
	Bm1T3xSjeD3nWnhHrK2uZ1RGIUthGvjg6BGfbU2p0N9A3crGWUEXMXYmm5bhj8nnE44X054HI+a
	q9iuW6C
X-Google-Smtp-Source: AGHT+IH0mYLzJc+MIMYC3nKcYeDHjVHAKYAosu2NJlZNp8X93yZe4IjjzxkYF33cASIw1wSiRJ3jnlmK6a6UspMCo3c=
X-Received: by 2002:a05:6808:1316:b0:41c:45e4:6c4c with SMTP id
 5614622812f47-41cf0da8ec3mr15658587b6e.39.1753101829485; Mon, 21 Jul 2025
 05:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250721090713.414324-1-frediano.ziglio@cloud.com>
 <20250721090713.414324-2-frediano.ziglio@cloud.com> <60505d70-7dae-4260-8a2d-960115e6ba5a@amd.com>
In-Reply-To: <60505d70-7dae-4260-8a2d-960115e6ba5a@amd.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 21 Jul 2025 13:43:37 +0100
X-Gm-Features: Ac12FXwDEvZruuJiZqGRkSGTQE0UetLnBXb8aoNDA4EmFMvgREKb66M9wJCqlrI
Message-ID: <CACHz=ZiqRUR6=GKoGTWipHH2sdfkcwtiNG3__wGWytQuGAQjgw@mail.gmail.com>
Subject: Re: [PATCH 1/3] xen/efi: Reuse fdt_setprop_u32 and fdt_setprop_u64
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 1:13=E2=80=AFPM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 21/07/2025 11:07, Frediano Ziglio wrote:
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/arch/arm/efi/efi-boot.h | 33 ++++++++++++---------------------
> >  1 file changed, 12 insertions(+), 21 deletions(-)
> >
> > diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> > index 3dbeed3f89..a2aede21d5 100644
> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -79,8 +79,7 @@ static int __init setup_chosen_node(void *fdt, int *a=
ddr_cells, int *size_cells)
> >      prop =3D fdt_get_property(fdt, node, "#address-cells", &len);
> >      if ( !prop )
> >      {
> > -        val =3D cpu_to_fdt32(2);
> > -        if ( fdt_setprop(fdt, node, "#address-cells", &val, sizeof(val=
)) )
> > +        if ( fdt_setprop_u32(fdt, node, "#address-cells", 2) )
> >              return -1;
> >          *addr_cells =3D 2;
> >      }
> > @@ -90,8 +89,7 @@ static int __init setup_chosen_node(void *fdt, int *a=
ddr_cells, int *size_cells)
> >      prop =3D fdt_get_property(fdt, node, "#size-cells", &len);
> >      if ( !prop )
> >      {
> > -        val =3D cpu_to_fdt32(2);
> > -        if ( fdt_setprop(fdt, node, "#size-cells", &val, sizeof(val)) =
)
> > +        if ( fdt_setprop_u32(fdt, node, "#size-cells", 2) )
> >              return -1;
> >          *size_cells =3D 2;
> >      }
> > @@ -251,8 +249,6 @@ static EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYS=
TEM_TABLE *sys_table,
> >  {
> >      int node;
> >      int status;
> > -    u32 fdt_val32;
> > -    u64 fdt_val64;
> >      int num_rsv;
> >
> >     /*
> > @@ -275,33 +271,28 @@ static EFI_STATUS __init fdt_add_uefi_nodes(EFI_S=
YSTEM_TABLE *sys_table,
> >          }
> >      }
> >
> > -    fdt_val64 =3D cpu_to_fdt64((u64)(uintptr_t)sys_table);
> > -    status =3D fdt_setprop(fdt, node, "linux,uefi-system-table",
> > -                         &fdt_val64, sizeof(fdt_val64));
> > +    status =3D fdt_setprop_u64(fdt, node, "linux,uefi-system-table",
> > +                             (uintptr_t)sys_table);
> Don't we need explicit cast here? In other words, why did you drop them?
>

It's not needed, if the compiler is not truncating it will do the
conversion correctly, in case of truncation it will trigger a warning
which we can deal with in the possible future.

> Other than that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal
>

Frediano

