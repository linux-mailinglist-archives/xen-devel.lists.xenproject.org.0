Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F018070C1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 14:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649221.1013632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rArmo-0001la-Lr; Wed, 06 Dec 2023 13:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649221.1013632; Wed, 06 Dec 2023 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rArmo-0001ij-IY; Wed, 06 Dec 2023 13:17:58 +0000
Received: by outflank-mailman (input) for mailman id 649221;
 Wed, 06 Dec 2023 13:17:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uigp=HR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rArmn-0001ib-Kh
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 13:17:57 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddfc9920-9439-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 14:17:56 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50bfd8d5c77so3642756e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 05:17:55 -0800 (PST)
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
X-Inumbo-ID: ddfc9920-9439-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701868675; x=1702473475; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4aG7ZnPe2DC2eIKL8gNZpIhUqQzB64868xfzy4hp94=;
        b=HSP6bii479SqfjdShx8x+/UGnIyFm0ABDCaBqENPB8L2gfA9ZSpHOC5OYGpV9dCOz4
         5YvM/ME7rMTtMNIBpEjDrPJ2xKFWARBZRKjBYsKNmWARlyl41n+0+slf0qlHjghV0w1s
         2j0xbL79R05ZqScBsMibUivcdDSqtr0siegYo5T37n7vUOwc+DuZHuOwkPHsKsSXZqOA
         U7CKPZArkhJEFGrIARmqISLrZJnU4jFA/SbaGhYTYSKLa6TIJvNEW6dNLCnJTc6lSDqN
         Bzsi0/p8rntYvMi8/6AFp1D9OPIwC8QuyBY2WV+AVjxJfFASoQ7+BgveynRu9XD+YUtV
         6ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868675; x=1702473475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4aG7ZnPe2DC2eIKL8gNZpIhUqQzB64868xfzy4hp94=;
        b=wcg60KocDp8KV1gpuXY7lkSrnKCbw/aDEgh3ubK1LjtssWpY+KLTD3qnHFwJE4S9+9
         Wxk44iSNdpiNg5juh7WOLq6coTsfeIz5Z1E/G4lGpTgwSEQbsqFo7rO1+fMOMFRSLuPb
         sgXyRwSxJvvL100sKvKQuM5Xc0TWUZJqfzi1Fo4ViIJoENg6BYzgvQqm8xTU2iWJbaq4
         TGAKCv+/ttpQb8N+Vk8wxMDw9kiGpYgNdv3zh0WaWRZZx1mDYvTgmny9xUqUdGQU3V/y
         2hT9R/GkWMxdb1rSnO8RAyeCILopXB7DOvdHcV+YdW+agX1nSx1GA5XglM20aX/jpaO5
         k9pg==
X-Gm-Message-State: AOJu0Yysags30n0pz/eo4qo/aYtpRdGD5RVMG/9h76iK5NJsJJItcHln
	f7uRe6t/r0u5BJipfoKpAbB++H2eqoaaeI0+wZo=
X-Google-Smtp-Source: AGHT+IEss0Rz6REVtivahro/gy3fmjGoIzVebmYRM2dI0dH/81TYm184JUPYNIno79sfW9p2OkkezUsqlXy0FVBYhXU=
X-Received: by 2002:a19:e05c:0:b0:50b:e8b2:a78f with SMTP id
 g28-20020a19e05c000000b0050be8b2a78fmr265111lfj.268.1701868674544; Wed, 06
 Dec 2023 05:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-16-jgross@suse.com>
In-Reply-To: <20231110160804.29021-16-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 6 Dec 2023 08:17:42 -0500
Message-ID: <CAKf6xpty3ENpuPgTf7=Gk1Q-Ekn+FjOx=-ySMQF6v3kx7zntrw@mail.gmail.com>
Subject: Re: [PATCH v2 15/29] tools/libs/light: add backend type for 9pfs PV devices
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 11:09=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:

> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 7d8bd5d216..82565c4c10 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -150,6 +150,12 @@ libxl_nic_type =3D Enumeration("nic_type", [
>      (2, "VIF"),
>      ])
>
> +libxl_p9_type =3D Enumeration("p9_type", [
> +    (0, "unknown"),
> +    (1, "qemu"),
> +    (2, "xen_9pfsd"),
> +    ])
> +

FYI, these IDL changes will require golang binding regeneration.
(Maybe we shouldn't have generated code checked in...)

Regards,
Jason

