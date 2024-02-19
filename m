Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2870D85A5FD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682922.1062172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4hN-0007YV-AR; Mon, 19 Feb 2024 14:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682922.1062172; Mon, 19 Feb 2024 14:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4hN-0007WL-7n; Mon, 19 Feb 2024 14:32:49 +0000
Received: by outflank-mailman (input) for mailman id 682922;
 Mon, 19 Feb 2024 14:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKiv=J4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rc4hM-0007WE-4k
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:32:48 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04d873a-cf33-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 15:32:47 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-511ac32fe38so6606220e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:32:47 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 tb5-20020a1709078b8500b00a3d599f47c2sm3030460ejc.18.2024.02.19.06.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 06:32:46 -0800 (PST)
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
X-Inumbo-ID: c04d873a-cf33-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708353167; x=1708957967; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IywGlil8rOYVi4LTzlz6gKPp2TTUAfS+ZJIbM80gP9k=;
        b=FV/6svAC1ACqH+g2woiDKE/ilpxzOpab45/tZhV9biwUfvCSt8kbH0iJa30vEvSZUz
         D7g6lrt1svPhVUyUShOPqpTBbU4FJsPIcVxxq7Nd3RCCodt4IA9Cs0Sg/BAZacQSOH/k
         aG+rIzs0g1sTqXp2IvVSEvZRHn8yrE/FFhkIsCYJ38TrI3ypMEg009Fx/p5LBbWkoHpp
         UpW2PlitLstxU0voaF0SuP7w1fJwsdXBln37X03zFHhuKd9VcTWky9ZnpVPGSTgzi5Da
         nAP56EYKK92YsHWXJdPoFs864PCoqPcd0DRuXua88ag9gJ1WFTilFEqUyIQwqEZWxCJB
         SJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353167; x=1708957967;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IywGlil8rOYVi4LTzlz6gKPp2TTUAfS+ZJIbM80gP9k=;
        b=K48OJ5CrQyBUeiYQ+hX8PMW8i9Qnp2LCQhIkAw9YPkZ6AaScMJxxi9v8ChSTWcwX10
         x2pGFGqiVZBCBCJGiHnrIsVFi/BNVOaNajVhBg8GflXWK8uftIOZHoLukcaIbQY2pCDz
         iQqHQwMRm1P1OeddvRhypSILLHhHDzI8vCVJ7gSyfDJiBkDbcT+X9A+AnDxS0Qdxwp2s
         Z2PQLLs6OMC8Vt2HVnjCdafDkOVhKPLUr7riPJ5hyROfL1fg/QxoryvHdHN/JJsRIIfd
         GvwLqC89q+xgT0HBd3rswsFIAqklmaG31J+iqC8TvuatM78zNFk68t6LmypI+bx/a7HX
         PawA==
X-Forwarded-Encrypted: i=1; AJvYcCUbVBPvgR2N+tES7Z3fwkG930A4g7G59MWAGwBJnR3vJyjonUr6nuPIENX4Elt4lNl7LlQNh803lq6XdzStIToHDiSkmYDfXVRdN0O/vx8=
X-Gm-Message-State: AOJu0YxMP4eehwb/5r8QuKjB7/g24tMZuYQaSgNUmtf4FeXj07GM7zm8
	xwuT7fl5GQxnnFyB5yqnIcKEy7cPhu3gIq86/mruhsRUMYUrs4lW
X-Google-Smtp-Source: AGHT+IGa/GO+HHyk1hac0FuhM+9zOCL41IdFHdJnmtKiOdQ27398WRkH3I4d6A1nrplJGt+l/t/eqg==
X-Received: by 2002:ac2:5a5c:0:b0:512:a584:e999 with SMTP id r28-20020ac25a5c000000b00512a584e999mr4777400lfn.22.1708353166621;
        Mon, 19 Feb 2024 06:32:46 -0800 (PST)
Message-ID: <876ba6feab2c22011b027af6211f1f2019228bd9.camel@gmail.com>
Subject: Re: [PATCH v4 13/30] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Mon, 19 Feb 2024 15:32:45 +0100
In-Reply-To: <afa59d63-2310-4081-9fc8-1d8a66ae24fc@xen.org>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <64afc021f680e55d486f8429c02513bc9bf4b9ea.1707146506.git.oleksii.kurochko@gmail.com>
	 <afa59d63-2310-4081-9fc8-1d8a66ae24fc@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Sun, 2024-02-18 at 19:07 +0000, Julien Grall wrote:
>=20
> > +/*
> > + * Unordered I/O memory access primitives.=C2=A0 These are even more
> > relaxed than
> > + * the relaxed versions, as they don't even order accesses between
> > successive
> > + * operations to the I/O regions.
> > + */
> > +#define readb_cpu(c)		({ uint8_t=C2=A0 __r =3D __raw_readb(c);
> > __r; })
> > +#define readw_cpu(c)		({ uint16_t __r =3D
> > le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
> > +#define readl_cpu(c)		({ uint32_t __r =3D
> > le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
> > +
> > +#define writeb_cpu(v,c)		((void)__raw_writeb(v,c))
> > +#define
> > writew_cpu(v,c)		((void)__raw_writew((__force uint16_t)cpu_to_le16(v),c=
))
> > +#define
> > writel_cpu(v,c)		((void)__raw_writel((__force uint32_t)cpu_to_le32(v),c=
))
>=20
> NIT: __raw_write*() are already returning void. So I am not sure to=20
> understand the pointer of the cast. IIUC, this is coming from Linux,
> are=20
> you intend to keep the code as-is (including style)? If not, then I=20
> woudl consider to drop the cast on the three lines above and ...
Changes have already been made in this header, so it makes sense to
remove these casts. Thanks.


~ Oleksii

