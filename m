Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD6192BC87
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 16:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756309.1164875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBY9-0001k7-Db; Tue, 09 Jul 2024 14:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756309.1164875; Tue, 09 Jul 2024 14:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBY9-0001hf-9p; Tue, 09 Jul 2024 14:10:33 +0000
Received: by outflank-mailman (input) for mailman id 756309;
 Tue, 09 Jul 2024 14:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ELTS=OJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRBY8-0001hZ-90
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 14:10:32 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff874be1-3dfc-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 16:10:30 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a77c349bb81so459274066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 07:10:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a73039fsm80822466b.96.2024.07.09.07.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 07:10:29 -0700 (PDT)
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
X-Inumbo-ID: ff874be1-3dfc-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720534229; x=1721139029; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dc50ud25/1CssaRGBd85ngjcalVklR1C8UxKfKGDLt4=;
        b=kqqsxXIz3GGqnv5CXfkAd3avk7F3YufFWnNExBtyTfb+W/hdnC3gvlhRQFz+LJcYoI
         jXf76oLw9sTPdmIBC5phhn2XirooOlBqY/6z9ztuA0pvOm5R+E8ZzpHy4XZRA8cXogM2
         iqYeP4YnKS6BwrYugVwwvgIvUnQlRdBLmYZn6U2P03h1VYxc1mxkczbJabUyFaLEV4U1
         aED/NkQqJxd9NY+93ODjvYa56+lz+3ybsvXg+q3awF+TtHPuZByguSaplLzRpBmXpnws
         NzgZAL/sMG6lLTqhk0mvTjwufxLg6S/0GJJ+lHJH6RsAD0s2ByCYlMXM65licXam6+T5
         1U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720534229; x=1721139029;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dc50ud25/1CssaRGBd85ngjcalVklR1C8UxKfKGDLt4=;
        b=HHOt1iogzmTgBm5LfweYSo6WhSCpNawxxwNvDT/R3elrwFE4xc9WOIoAKDqOykwEPT
         LBUysKKP4pNxvTbqT2tOdyRRHtIUYPx11ziLUqMCXIxNwKm6Za55QASMDofXM2JJBeEF
         g+gLthXrAPGL+iy4E6pmjQhJKMsKfbTMoX97GxGtzyovlPMVEZmDXMBqqcCXnqs1tf3Y
         vqaNwU1jx3C5b3guNEs43Jl2hMoqYMae/cmx5A+ToOIfTtiLV7OQwQg90MwtLxWmaJ3c
         QdBzSQ/CWe0rLT+ZUnzklBqYK5RcoZIloPEmaTiKpmEdPA/ZU5GnRSi7UHZ5zx2/crxS
         n5zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlxVytvtfCDGRWMdOwf9rXqJzc2ZQpphOYYzWZ8bHrY+IpRW0IFu65lSExVXb03M0gaIlKfK8rglRZYfeml2U8UDS5yNIw1p+4IPl0RGk=
X-Gm-Message-State: AOJu0Yz1MjYCrpyPjup66A2OakVgF5SSz8ASnatqemyNFLYhNRXNlpsY
	vAttagEj/ZBj7ewMfK5UtipS0kKsf4Cmt5uZ59GceITf8t8UasjB
X-Google-Smtp-Source: AGHT+IGIoOrr5n3tA1aA/pyAJA8sqocf3OoMYH+99sllXpHD7BSt2DrS3GTz1KET73sujcgrnEAyrg==
X-Received: by 2002:a17:906:c08e:b0:a77:c827:2cb2 with SMTP id a640c23a62f3a-a780b7053a8mr143002066b.44.1720534229366;
        Tue, 09 Jul 2024 07:10:29 -0700 (PDT)
Message-ID: <82b2047ac7d1221eb73f65e55e1771ad21cdf043.camel@gmail.com>
Subject: Re: [PATCH for-4.19?] stubdom: Remove more leftovers of caml-stubdom
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 09 Jul 2024 16:10:28 +0200
In-Reply-To: <20240709123907.2400138-1-andrew.cooper3@citrix.com>
References: <20240709123907.2400138-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-09 at 13:39 +0100, Andrew Cooper wrote:
> Fixes: e536a497545f ("stubdom: Remove caml-stubdom")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Juergen Gross <jgross@suse.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> For 4.19.=C2=A0 This is additional tidying to a removal in 4.19, which
> will
> otherwise need backporting if it misses 4.19.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> ---
> =C2=A0config/Stubdom.mk.in | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/config/Stubdom.mk.in b/config/Stubdom.mk.in
> index 5990fc4e04f9..b399d77740e8 100644
> --- a/config/Stubdom.mk.in
> +++ b/config/Stubdom.mk.in
> @@ -26,9 +26,6 @@ LWIP_URL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 :=3D @LWIP_URL@
> =C2=A0GRUB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D @GRUB_V=
ERSION@
> =C2=A0GRUB_URL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 :=3D @GRUB_URL@
> =C2=A0
> -OCAML_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D @OCAML_VERSION@
> -OCAML_URL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=
=3D @OCAML_URL@
> -
> =C2=A0GMP_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D @G=
MP_VERSION@
> =C2=A0GMP_URL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 :=3D @GMP_URL@
> =C2=A0
>=20
> base-commit: c4ebeb79d10a25e8d48a71cdd381898265267e67


