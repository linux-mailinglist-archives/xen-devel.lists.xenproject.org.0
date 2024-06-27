Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61CD91A92F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 16:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750135.1158378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMq4z-0004Sl-Rw; Thu, 27 Jun 2024 14:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750135.1158378; Thu, 27 Jun 2024 14:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMq4z-0004Pr-PH; Thu, 27 Jun 2024 14:26:29 +0000
Received: by outflank-mailman (input) for mailman id 750135;
 Thu, 27 Jun 2024 14:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1631=N5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sMq4y-0004Pd-CB
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 14:26:28 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d62cf4a-3491-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 16:26:27 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7241b2fe79so686087566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 07:26:27 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d6fdd5bsm66060266b.15.2024.06.27.07.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 07:26:26 -0700 (PDT)
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
X-Inumbo-ID: 3d62cf4a-3491-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719498387; x=1720103187; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JymcApNACeekwYC5ujv6uQ3hfIJUzcP4064saO773EQ=;
        b=g8F/979RC+bglUJINMZyMocQgToQLLL12hnay6jfnVF6uaHL3gbf3nhIL+Z6UO5PTq
         bcBjdPTNdsTRHQDy0O4TLu18jIVtWHDwbkTTyeQYZhWFloh+ocg0HHpOC36rhmkJqL3v
         8MHqvk4odlk+1/5I3kOVgyNrT90tMD0/JV36IpkhKkiEUbu8E58dRt7RwcL2rF71Y405
         XUZ7elI8VzP1kY23oWPKmsxGxCxb2M0zrXN3YUrIir9L7wHkIdLDVHcC0U0RGlE2U6kE
         UYli69tAzv28izpqGfJPO9TDS87PQB6+WJaGsRXzDZoYyKnmdR2hpyBKkKPtb31QGjyZ
         l9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498387; x=1720103187;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JymcApNACeekwYC5ujv6uQ3hfIJUzcP4064saO773EQ=;
        b=smAKI5nK1WoXUgg/7Zv/TLAnsRf4fs2YZ0CCN5Z1y5cXThNWWYGpi2KzjmCFfataX+
         q6V/Osn43b2ajS0QoEKX5GPYhKtwgRwRRg95gDzN4aKeCkS+axT/KTegRsRhB6f4/ioT
         6UqqYZLLZKewvzqhvD1oR6TQIDl92vQw2TfLJ99NV5jpTz0r8DuXPVV7PAmVuFAWuxHw
         hMvZG+cgL3Nyq5TARw82sYitbvWQwOQ23r9z8pbFObDlcDPJsXf1rJuPBug9MujqpWdS
         UnVdl8hjxvucEXOthyY3KF5abG4555b7FC4F9NoJa4+RzarmndIfCDYrB20jqjGtRlhN
         rzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYjGH7EjtZf4aqutK7McM/NzLuHL8DkuSk3Wpm5cKEaeYFaEPtTc34dmsHszfJgMF++H9FoXOQNN+cMA6DQrCCG+WqkRGXzGohUVrFMaU=
X-Gm-Message-State: AOJu0Yxn0L8BB9zx9Bd+QsRPRn2wmSvCp/wMTjGLbNTAg2+iLGqmtwj0
	QmEocL02M4pOS+UYLeUfsayc5CR1l51Njd+yklJywYaEU6HZWmVq
X-Google-Smtp-Source: AGHT+IFVbpJtPkLeWPxiVyceL0IEXsmM75462yphRJ0z48A1CGTyR4eiy7jgO5F20H52Tj4/MQxWtA==
X-Received: by 2002:a17:907:cb20:b0:a6f:489a:3a28 with SMTP id a640c23a62f3a-a7242cdb40amr916085266b.61.1719498387019;
        Thu, 27 Jun 2024 07:26:27 -0700 (PDT)
Message-ID: <503b6bdd648d74c294301bd396665a7bb1a40814.camel@gmail.com>
Subject: Re: [PATCH for-4.19] tools/dombuilder: Correct the length
 calculation in xc_dom_alloc_segment()
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>
Date: Thu, 27 Jun 2024 16:26:26 +0200
In-Reply-To: <20240627130134.1006059-1-andrew.cooper3@citrix.com>
References: <20240627130134.1006059-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-06-27 at 14:01 +0100, Andrew Cooper wrote:
> xc_dom_alloc_segment() is passed a size in bytes, calculates a size
> in pages
> from it, then fills in the new segment information with a bytes value
> re-calculated from the number of pages.
>=20
> This causes the module information given to the guest (MB, or PVH) to
> have
> incorrect sizes; specifically, sizes rounded up to the next page.
>=20
> This in turn is problematic for Xen.=C2=A0 When Xen finds a gzipped
> module, it
> peeks at the end metadata to judge the decompressed size, which is a
> -4
> backreference from the reported end of the module.
>=20
> Fill in seg->vend using the correct number of bytes.
>=20
> Fixes: ea7c8a3d0e82 ("libxc: reorganize domain builder guest memory
> allocator")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> For 4.19: This was discovered when trying to test Daniel's gzip
> cleanup for
> Hyperlaunch.=C2=A0 It's a subtle bug, hidden inside a second bug which
> isn't
> appropriate content for 4.20.
> ---
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> =C2=A0tools/libs/guest/xg_dom_core.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/libs/guest/xg_dom_core.c
> b/tools/libs/guest/xg_dom_core.c
> index c4f4e7f3e27a..f5521d528be1 100644
> --- a/tools/libs/guest/xg_dom_core.c
> +++ b/tools/libs/guest/xg_dom_core.c
> @@ -601,7 +601,7 @@ int xc_dom_alloc_segment(struct xc_dom_image
> *dom,
> =C2=A0=C2=A0=C2=A0=C2=A0 memset(ptr, 0, pages * page_size);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 seg->vstart =3D start;
> -=C2=A0=C2=A0=C2=A0 seg->vend =3D dom->virt_alloc_end;
> +=C2=A0=C2=A0=C2=A0 seg->vend =3D start + size;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 DOMPRINTF("%-20s:=C2=A0=C2=A0 %-12s : 0x%" PRIx6=
4 " -> 0x%" PRIx64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "=C2=A0 (pfn 0x%" PRIpfn " + 0x%" PRIpfn " pages)",


