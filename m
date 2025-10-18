Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB442BEC7CE
	for <lists+xen-devel@lfdr.de>; Sat, 18 Oct 2025 06:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145475.1478396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9yqX-0007Gx-Co; Sat, 18 Oct 2025 04:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145475.1478396; Sat, 18 Oct 2025 04:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9yqX-0007Ej-6A; Sat, 18 Oct 2025 04:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1145475;
 Sat, 18 Oct 2025 04:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxYo=43=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1v9yqV-0007Ed-BU
 for xen-devel@lists.xenproject.org; Sat, 18 Oct 2025 04:47:11 +0000
Received: from mail-yx1-xb12e.google.com (mail-yx1-xb12e.google.com
 [2607:f8b0:4864:20::b12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80919746-abdd-11f0-9d15-b5c5bf9af7f9;
 Sat, 18 Oct 2025 06:47:09 +0200 (CEST)
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-63e11347fd9so2398066d50.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 21:47:08 -0700 (PDT)
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
X-Inumbo-ID: 80919746-abdd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760762827; x=1761367627; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yyjkMH7X6A0lq0whywhvCS5pJnGF9bT1XwigrhAglY=;
        b=j236l8MweKkxwu+ow9big0kCRCZuQe/BJSUfEh5Z3vrZDG+1K5GxDLMkePCmYBOeAT
         J1ZAZep0YdqXBL9v0zWrS8rw7sBaPgiVnLjdvMjMDbQhr16X/zrpWTm+GtoWWlx/T04n
         YOpmt15C1aTAOY2CLzy5h6Cz34O7fI/aGBeMYBEgSC+W5O6inYgkAx+9b7LlzwwGOJNv
         vbG2tZCZTYz5+GwhOEWAjtt3X9jACcQ7SiFGwE5zl8kEVM4ikr/GPNYrtgMryykXwxNc
         U7DhEADKFJTpIy1CHoqkR4CwFx8mIuE+EqrSXT14PIqtTQCkpgKslj3e1S9eGernv/yH
         LVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760762827; x=1761367627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yyjkMH7X6A0lq0whywhvCS5pJnGF9bT1XwigrhAglY=;
        b=Md+sAVWNt/c+A9YpADQddGGxrp0HrHza4+i6ODpiz6X8LFgYQvnwphXxSVs+WR6L2k
         BXhNQ28UuGZVzgylTBlMWwh4+r8mRP4b3gkY0c/bNHrnTT4d8AhTd9c2ZwWnrRHGsf9e
         nATWzHWei9ctKDuBSqDtzyuRBr9/9iD6ouNvVBtNYXxDmj95BAzHI7dSUy8ueqvfH6z9
         A7lkGvaGKDiR54nHDHH9s4fchlXmDUA0ha8+b+ypMgsIIFoJ+vBH3TY1WQ+OBVTPPgl3
         Sc0MJyuwSWmj3V+bqzqtHt9AasSKVjVL12p80u7w8hAcJ04Qq6JTMfrIHz+HWdp6LwZO
         jnXQ==
X-Gm-Message-State: AOJu0YxWTVVFCfbImT01/4pZ2I80Znyn178QxZinxEHwH7MWHcMigzWY
	rabeLk+NFbkPlIrwdCHlgf+BADQdWap8xGFC5UxKEshanNjc8Phq/OyVDPfeCeW6QEYkUwhMzYo
	89vGIYYM/9opSn2/MLiWX9GM5Q0CW2iqwjlll
X-Gm-Gg: ASbGncvYBmozZbz83Fv3IT1uquZTU/c47VsaCErXluv8iYbwGnDqwuaj6VJJ069yLzg
	pmzkQVQ37FCxE6caWAMFYM1q1fnYLOObb4eCN4xevwwrOybNeylH2yKqCBfliNDTDSJ5YcT/Ug2
	epZvLV8xtfWVn9PPSFFUoYnBWmKuBaau3vrZO0jeiU04PSVnriNmPPcx+kKP3DioM2haTihz+IK
	0F89Pdu7TtTjWjQEp4KdfQuYuJoo/6sPJ/id6HJmE3sPF/8pDofS8caNfH1
X-Google-Smtp-Source: AGHT+IGAZ8zP02pHPx5o5LmW0sPduIqlZCzpaboeKh32N3wJhU77gcgVQwf2cyexPZwFnPCPgkBRumTKwIzfE2WmTdw=
X-Received: by 2002:a05:690e:1208:b0:63e:112a:39f7 with SMTP id
 956f58d0204a3-63e1622d6b1mr4611867d50.36.1760762827480; Fri, 17 Oct 2025
 21:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251017141434.15205-1-roger.pau@citrix.com>
In-Reply-To: <20251017141434.15205-1-roger.pau@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 18 Oct 2025 05:46:55 +0100
X-Gm-Features: AS18NWAA59KqK8vxSMhvWn37qbfZ_QNC54lDrDA2Ys3KsFGgOXb15BhZlJDKlMc
Message-ID: <CAHt6W4dAEBH_9EF4nXB6_W0ehpawKpz+bMpZ__vN29OdVZxGQw@mail.gmail.com>
Subject: Re: [PATCH for-4.21] tools/libxc: fix xc_physdev_map_pirq_msi() with
 PCI segments != 0
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 3:26=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Otherwise it's not possible for device models to map IRQs of devices on
> segments different than 0.  Keep the same function prototype and pass the
> segment in the high 16bits of the bus parameter, like it's done for the
> hypercall itself.
>
> Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> I think it's 4.21 material, as otherwise it's not possible to passthrough
> PCI devices on segments !=3D 0.
> ---
>  tools/libs/ctrl/xc_physdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
> index 25e686d7b389..1307d6836d72 100644
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -79,7 +79,7 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
>      }
>      memset(&map, 0, sizeof(struct physdev_map_pirq));
>      map.domid =3D domid;
> -    map.type =3D MAP_PIRQ_TYPE_MSI;
> +    map.type =3D MAP_PIRQ_TYPE_MSI_SEG;
>      map.index =3D index;
>      map.pirq =3D *pirq;
>      map.bus =3D bus;

Reviewed-by: Frediano Ziglio <frediano.ziglio@citrx.com>

This was tested on a real machine.

About MAP_PIRQ_TYPE_MSI and MAP_PIRQ_TYPE_MSI_SEG, do we need to keep
ABI compatibility or we should just remove MAP_PIRQ_TYPE_MSI_SEG and
make MAP_PIRQ_TYPE_MSI consider the segment ?

Frediano

