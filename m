Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FDC830492
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 12:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668420.1040633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ48E-0001wb-RX; Wed, 17 Jan 2024 11:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668420.1040633; Wed, 17 Jan 2024 11:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ48E-0001tc-Ol; Wed, 17 Jan 2024 11:30:54 +0000
Received: by outflank-mailman (input) for mailman id 668420;
 Wed, 17 Jan 2024 11:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sm03=I3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQ48D-0001tV-H7
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 11:30:53 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df1a5373-b52b-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 12:30:52 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a2c67be31edso713487066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 03:30:52 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a17090619ca00b00a2ed233c313sm627742ejd.168.2024.01.17.03.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 03:30:51 -0800 (PST)
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
X-Inumbo-ID: df1a5373-b52b-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705491052; x=1706095852; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OtsF0IeGh4Hk0BZaPZxvwYKxwK3DtyrzBr/YC5XexRA=;
        b=bHXxuTN5xohHkJ+Ty1UlPyNQ9fhpWe/o4NmFClOQVyZzFViV3LJac2N1vTkVTJK57r
         jHIJ/WTeFjjAJThdq4sb8oe1LmMkt1Z+3wZ8rxb8SFBQ3b+Pk4pAfeRTWxSrzv40hlKg
         18TfOrFNGkB7qKUGIZuoFfP7MPZmqb9lMxPXJV5MXAZNlSH96YEl+GOKq6xGgdLa+tnO
         WxLu35fMC84xbd5jvOJc7OjJuGoqjSnRh4gXse9Ds2EXqV7dLGlf04fxeGF1ME4aUpBY
         OOsDwazG58Cs6u4izYeJQzdiFHNeVaFlF7cIoiuuMg1jhEiLBl+UjLonKkQdIZfgto/v
         MeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705491052; x=1706095852;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtsF0IeGh4Hk0BZaPZxvwYKxwK3DtyrzBr/YC5XexRA=;
        b=Kj+/9gW0ErhDBwzEiqKMYxxJMn0FGMMFYplFp8VFI6DXlDpUmQlEwnofjwejyX4+Rz
         m7vVNknPi58ngnq04IMhQLiwpj1t5eTddeM/EdxtJEPsbJXKNH/U5BPKi8kCpMzqO4OJ
         aiIPYLkT1UiSBvxYJ6cTeD31JQHXAxiNxSxsx+8jIqfYFWACtIaC4hLHvrQq0EdWcJTX
         OpzKGl+hXQW7orm1fmjrlh/aYw1l4vPF36zwoVvP9/Wj2BlOyD2AvIMow04XGJopCP5m
         gVeQu2ufBx60hmtPWBezvhPHTFx6nA2OLjghR2T0pcMnxjuF6uNFAdwg5sQ2Xl7f21Gf
         46XA==
X-Gm-Message-State: AOJu0YwehijmfBY6/t/oxo92OA6u4G3IdqJp0cs8CyncOs4m3Oabn1zZ
	vXm9w6yIHiVoanUbjSydI5Y=
X-Google-Smtp-Source: AGHT+IFFyH89UhC5S46Ir4c8ifZFnhuE01fGVy2fyk/m/ANY7pIMvnM81TnhWbqe1eXxJjavbI7swA==
X-Received: by 2002:a17:907:20d2:b0:a1c:9f65:a414 with SMTP id qq18-20020a17090720d200b00a1c9f65a414mr1914980ejb.152.1705491051874;
        Wed, 17 Jan 2024 03:30:51 -0800 (PST)
Message-ID: <a1efdd682dade974df414c15844160429ed6cd2a.camel@gmail.com>
Subject: Re: [PATCH v6 1/9] automation: ensure values in
 EXTRA_FIXED_RANDCONFIG are separated by new line
From: Oleksii <oleksii.kurochko@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
Date: Wed, 17 Jan 2024 13:30:51 +0200
In-Reply-To: <9f75416adb77d03b639741e4548d041c78fd4227.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <9f75416adb77d03b639741e4548d041c78fd4227.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0


Hello Doug abd Stefano,

Could you please take a look at this patch and the next one [1] of this
patch series?

Thanks in advance.

[1]https://lore.kernel.org/xen-devel/db2c3d36b25b686bf07ac23f8ee8c879e0e9e8=
1d.1703072575.git.oleksii.kurochko@gmail.com/

Best regards,
 Oleksii


On Wed, 2023-12-20 at 16:08 +0200, Oleksii Kurochko wrote:
> Kconfig tool expects each configuration to be on a new line.
>=20
> The current version of the build script puts all of
> ${EXTRA_FIXED_RANDCONFIG}
> in a single line and configs are seperated by spaces.
>=20
> As a result, only the first configuration in
> ${EXTRA_FIXED_RANDCONFIG} will
> be used.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V6:
> =C2=A0- The patch was introduced in this version of patch series.
> ---
> =C2=A0automation/scripts/build | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b3c71fb6fb..13b043923d 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -14,7 +14,7 @@ if [[ "${RANDCONFIG}" =3D=3D "y" ]]; then
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Append job-specific fixed configuration
> =C2=A0=C2=A0=C2=A0=C2=A0 if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "${EXTRA_FIXED_RANDCONFI=
G}" >>
> xen/tools/kconfig/allrandom.config
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed "s/ /\n/g" <<< "${EXTRA_F=
IXED_RANDCONFIG}" >
> xen/tools/kconfig/allrandom.config
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 make -j$(nproc) -C xen
> KCONFIG_ALLCONFIG=3Dtools/kconfig/allrandom.config randconfig
> @@ -28,9 +28,11 @@ else
> =C2=A0=C2=A0=C2=A0=C2=A0 echo "CONFIG_DEBUG=3D${debug}" >> xen/.config
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "${EXTRA_XEN_CONFIG}" >>=
 xen/.config
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed "s/ /\n/g" <<< "${EXTRA_X=
EN_CONFIG}" >> xen/.config
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 cat xen/.config
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 make -j$(nproc) -C xen olddefconfig
> =C2=A0fi
> =C2=A0


