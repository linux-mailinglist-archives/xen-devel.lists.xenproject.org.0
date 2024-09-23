Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C697EB01
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801986.1212080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshYK-0001OA-6W; Mon, 23 Sep 2024 11:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801986.1212080; Mon, 23 Sep 2024 11:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshYK-0001LY-3i; Mon, 23 Sep 2024 11:48:28 +0000
Received: by outflank-mailman (input) for mailman id 801986;
 Mon, 23 Sep 2024 11:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ci=QV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sshYI-0001LR-Us
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:48:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be2cc160-79a1-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 13:48:26 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso140064866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:48:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096735sm1212457066b.44.2024.09.23.04.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 04:48:25 -0700 (PDT)
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
X-Inumbo-ID: be2cc160-79a1-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727092105; x=1727696905; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nOaEOGn9qzoRvocmK5mFS4YijQzJBmRo78PoANKvsnE=;
        b=cArx/oS014bCwfbQYHFRpw8UB4wFSGzkXucx0WQ96/uHoiJLhKHaHpW80MTBI+vbo7
         QDbssQzgBPcPNugnbxFa/m91wTDFPu/Ofpod8UgJcK6VRF8etLtZOFHTTwH7TPHZB2rb
         302qGbz2+IEG2HCGvViGqAEmYs07Wl3mP0/2GEihM9C7XHXaeYr8aOfM+l0JJHnh3bKt
         hi56HaVnqa6yL3QYxkfPl3GGFjaAJIPYKRKz2g9smUI/Rl69Hemvp38rNEOE55ZYknuN
         cU7i/kWhUpEmObtmTINhXuDPISn1acrNQL9Cwuii0u7zxt0ees1i7up93Odc6sppJm/o
         Zz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727092105; x=1727696905;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOaEOGn9qzoRvocmK5mFS4YijQzJBmRo78PoANKvsnE=;
        b=vjJTdks1tvMwlQrPNCYhPZtE2h0smR/I7wFSqM0QIR4zlu6Fn+Chm2qSM2254nj2ww
         7ceypv3itf8M8KepjEb9tIQqbMZX4cs3T+rKcuLcnHX3Kw8yslOwCuEwhanilFL/F0g6
         +zPKDZIuyZ1aNpTU3CbVFFmHHrPTr5kj7eZbWJ3jNHcmXNzSyX3UhupSi6a5ZxeR8AoC
         IeD7uj9RUOL2McKJIujpSSMn58V06j0i3aur62oKKUVEM6u8KVWfmjcedIaAgSziuRDT
         PiV3n66S7D/QhW80bErMAL+6FD5hH4v7lucxjdIu8Kj/GufTudgk5xzhRi+60SLk46ti
         8qpA==
X-Forwarded-Encrypted: i=1; AJvYcCVF42x1mXx69J08Qz7ZJeJwE7yCMddzxby9g8zx5JXJXSeKZaHdDNBgdKak9E1F8929Uuw4K/DDCNk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWwXKX1VvGX1aPSb2sKWWgUCj1pWM3Rtf3vT2xdnhxxrK1PqMI
	hiorLdY5uZk2q+jSovJkcxJ7MK8XAZ4LisaF2Sb2DfaaAPpzrPYp
X-Google-Smtp-Source: AGHT+IEySnSge8fHytaL8qjra8hG4P8+g+0Bp1fazK4m8dbJHFbPDPJvK0Ind0lvBKeccJJJOk8kuQ==
X-Received: by 2002:a17:907:f782:b0:a8a:85af:7ae8 with SMTP id a640c23a62f3a-a90d4fdee61mr1098129166b.11.1727092105222;
        Mon, 23 Sep 2024 04:48:25 -0700 (PDT)
Message-ID: <3caf9e9f66a00b8c85b723a90ef830c3c0feca1f.camel@gmail.com>
Subject: Re: [PATCH v1 1/2] xen: introduce common macros for per-CPU
 sections defintion
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, 
 xen-devel@lists.xenproject.org
Date: Mon, 23 Sep 2024 13:48:24 +0200
In-Reply-To: <a4e3de2c-2316-435e-b22f-e6efb3aa4216@suse.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
	 <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
	 <a4e3de2c-2316-435e-b22f-e6efb3aa4216@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-23 at 12:56 +0200, Jan Beulich wrote:
> On 19.09.2024 17:59, Oleksii Kurochko wrote:
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -321,14 +321,7 @@ SECTIONS
> > =C2=A0=C2=A0 DECL_SECTION(.bss) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_start =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss.page_aligned*)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __per_cpu_start =3D .;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss.percpu.page_aligned)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss.percpu)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(SMP_CACHE_BYTES);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss.percpu.read_mostly)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(SMP_CACHE_BYTES);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __per_cpu_data_end =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PERCPU_SECTION
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss .bss.*)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_end =3D .;
>=20
> Like the _SEC in the other patch I question _SECTION here, albeit for
> a different
> reason: This is no separate output section, and it's more than one
> kind of input
> ones. Perhaps PERCPU_DATA? With that
> Acked-by: Jan Beulich <jbeulich@suse.com>
Sure, I will drop _SECTION here too. Thanks.

~ Oleksii

