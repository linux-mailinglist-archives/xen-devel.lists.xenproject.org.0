Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8E09A3F52
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821899.1235871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mrc-0002vw-Th; Fri, 18 Oct 2024 13:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821899.1235871; Fri, 18 Oct 2024 13:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mrc-0002uV-QZ; Fri, 18 Oct 2024 13:17:56 +0000
Received: by outflank-mailman (input) for mailman id 821899;
 Fri, 18 Oct 2024 13:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazm=RO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t1mrb-0002uL-5s
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:17:55 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 619dd84c-8d53-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 15:17:53 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539e8586b53so2665067e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 06:17:53 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b0106sm217563e87.7.2024.10.18.06.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 06:17:52 -0700 (PDT)
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
X-Inumbo-ID: 619dd84c-8d53-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729257473; x=1729862273; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qVrC5Zf+loZB7jHvPASHXU9Fwz1bNf35TTJrOZgmlTI=;
        b=KCtv/Gv5gwY8ZYQskx7WBZFSnVTkQBKQnydIMveEGYu+QX9N03jqc2ZfsNMegT6toV
         t4ITDew0iMI/HoeN1Tv5LQZQjFJ2hN1qVlYR143GGJNWrmKBr+MRxmiBQ0shz7KJ2HcZ
         heGKRarJwdNn6Ak7QNMLu4agZSBHEW/1oQt4PJGwcCJ87aKc0tGqLKfMjBtO0NRn92b2
         TyJxWKgiGnewX2N3My71lJ0kUDYTadj3+2kY3BjQ7ZPLxcgSEzjs+S7FQ/9qbyg+T53g
         8LKuw4wSgAXdy7D/g9YQ2yIdSe1+ygdvGDEjA/IEMEyRSUcaoUm1qOXMOdtajb2fwBnC
         ldYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257473; x=1729862273;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVrC5Zf+loZB7jHvPASHXU9Fwz1bNf35TTJrOZgmlTI=;
        b=XeXi5EPWkaz/NB+m3lEy42jLVQw13k6iOmr27tesjgdtsMuDLL20N3Va48U40Ja9Bh
         o03GbAZg6s5l97Ioof5zUaFvXN3OTnVjtaWq8Sy9+fuGKRVHkxfiJ2dFQXojjD2GXOBA
         A06joxYVIdM2E0dqRwLOV7a3euiWevFxDA3qAp2F+74RZC5CKM//xl576gT32TfGJk7k
         1r+Jmhg7U7joy45zpe0HIB60Haz6I8XsZk9rO/Vs9RBiHDPC+Xqk5T+HOAQHCqLjYdXH
         ZRYln/nBxXPvlfhGk4026FamX7cUN6prY4IyFDRHXplCSH5tzPe+uqm4WubO25gXfzFx
         MLKw==
X-Forwarded-Encrypted: i=1; AJvYcCV4gqnaMDuKp7DQxAurgsYZvW5BP8XoG7TW5qkpD2l5XkSRaE8SbciurcQJcM2jFeHu5DZYd+es1Vs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN3jwk8Ml3SaSIscafluCxdPqLVDV/bmx7q2kNEogJ7FFARAkY
	PdqGtni8zZFvNuRGxIJvb30vqWvAYKpyygnyml7uLacgC1/BGCOP
X-Google-Smtp-Source: AGHT+IHqsHC9wlouSsou/Nto15ct4JzFej4ozgpy9gBTfCUnT3JrYsgduiDDL0aZj3NClG4FkSc/zw==
X-Received: by 2002:a05:6512:3184:b0:539:fcf0:268e with SMTP id 2adb3069b0e04-53a0c6dae70mr2344119e87.14.1729257472430;
        Fri, 18 Oct 2024 06:17:52 -0700 (PDT)
Message-ID: <aebdb0df0ad9fb13db9929f131737bf5479cdf29.camel@gmail.com>
Subject: Re: [PATCH v1 2/5] xen/riscv: implement maddr_to_virt()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 18 Oct 2024 15:17:51 +0200
In-Reply-To: <2565f369-96e3-4c28-b752-53b1b6a0d968@suse.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
	 <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com>
	 <2565f369-96e3-4c28-b752-53b1b6a0d968@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-10-17 at 16:55 +0200, Jan Beulich wrote:
> On 16.10.2024 11:15, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -25,8 +25,12 @@
> > =C2=A0
> > =C2=A0static inline void *maddr_to_virt(paddr_t ma)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -=C2=A0=C2=A0=C2=A0 return NULL;
> > +=C2=A0=C2=A0=C2=A0 /* Offset in the direct map, accounting for pdx com=
pression */
> > +=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directmapoff(m=
a);
>=20
> Why the mentioning of PDX compression?
It was mentioned because if PDX will be enabled maddr_to_directmapoff()
will take into account PDX stuff.

>  At least right now it's unavailable
> for RISC-V afaics. Are there plans to change that any time soon?
At the moment, I don't have such plans, looking at available platform
there are no a lot of benefits of having PDX compression now.

Perhaps it would be good to add
BUILD_BUG_ON(IS_ENABLED(PDX_COMPRESSION)) for the places which should
be updated when CONFIG_PDX will be enabled.

~ Oleksii

