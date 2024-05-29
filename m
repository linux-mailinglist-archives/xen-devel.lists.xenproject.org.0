Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9B8D385E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 15:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731933.1137709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJhp-0007DK-9C; Wed, 29 May 2024 13:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731933.1137709; Wed, 29 May 2024 13:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJhp-0007Bp-6U; Wed, 29 May 2024 13:51:05 +0000
Received: by outflank-mailman (input) for mailman id 731933;
 Wed, 29 May 2024 13:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCJho-0007Bi-Cf
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 13:51:04 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c9671b0-1dc2-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 15:51:02 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so227910666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 06:51:02 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a631e324816sm257782466b.15.2024.05.29.06.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 06:51:01 -0700 (PDT)
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
X-Inumbo-ID: 7c9671b0-1dc2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716990662; x=1717595462; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lcxfRb9l0SxIIEy8fUc/kJZbB2DUYx1Jm1uQRc2lLas=;
        b=BJE3rrTnEo+nOpWA32UVg/ujZaxiZi8isota30F07bXV47VXm3MY0s05Y7Q5DabCCF
         9bw3fiL8PJELO5L7kxdcmly4TeD41qlyGoXVr3KT3urXg+GD2STN9vo4bhbk0dPnao4Z
         U14mbXZzDUUMt62gJF7mWC0j+M9r9Ifp6jBIy2SUtVIpXaUi9tSeeBs1dKBMlwHc8kMz
         tMdLiLGu4qoXM1LHq/KB+e+9s04ngGisP+W7xZF9HsiDVSeG6BSJ+S0jEpDRhWbfVQ1U
         LcREwCmx2q91sXrd9VfBZJ/xcW0+wwUD1z7xYtf36SiKiBe5+obb4GrR1/QutH6h7E0E
         7Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716990662; x=1717595462;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcxfRb9l0SxIIEy8fUc/kJZbB2DUYx1Jm1uQRc2lLas=;
        b=js6I+ctlPJh5cR5gvQq+sU1ppxjuYnEmvxV54BXkq2Ggq276d3TKCrkwly0w0794FP
         ZCKaRLUhEaPo7amrxSrR/HsS6KxeAzU788BNgbKLjlaewio6mWIwNJe8Xt2br/uE+GA5
         5psYjcpJKQRI1y1opmAqNexqRbpqX83hAw8H2k8Dhy51au0xWEYhGzbzVBU7Lwgytlob
         EjC2O5uhXH/j5y+CrNzy4qn4ZFnsbSZO0wM54YZTa8UsTSmO6din7tgKEdN+r31sc7jj
         gYKnQXMTk7IaekwmP7CP/9bPON2y3OIf7UwIJbNXEwkCOpcxqkVQBjNuz8fOU0TrTrn6
         j0wA==
X-Forwarded-Encrypted: i=1; AJvYcCWqLYGVS5txCUc1RP+9XJEC4CQ0k+V64vVwbtxxWOvp7/W17YI86N+U/s5fPAF9MYvHykMpWIgcwRKqxExPRfAIawyJrHOsTEg4r/ikKw8=
X-Gm-Message-State: AOJu0YzZ7gnZBi/8rfYriVaamwNX8akvViA8mA0Zez5oIS8RzHxQ6khr
	UrvRmROXM+MhtEc22RRPadPFYHm/bczNW4WvW2NAMucJfKOw0PLI0HJ49ou5
X-Google-Smtp-Source: AGHT+IF76O2EbZ/e4NtRXa4J1Q+hGUtBLuQcf+wZpEN/SoLT5PkQGaiBBmEk9R2Y02jVybSnvH8XbA==
X-Received: by 2002:a17:907:82a5:b0:a59:d39a:8d65 with SMTP id a640c23a62f3a-a62641b9de4mr886178466b.21.1716990661645;
        Wed, 29 May 2024 06:51:01 -0700 (PDT)
Message-ID: <2129c69d4d53c666218e1d3fe3ca2cd5af7edf42.camel@gmail.com>
Subject: Re: [PATCH] Partial revert of "x86/MCE: optional build of AMD/Intel
 MCE code"
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Wed, 29 May 2024 15:51:00 +0200
In-Reply-To: <20240529103752.1431366-1-andrew.cooper3@citrix.com>
References: <20240529103752.1431366-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-29 at 11:37 +0100, Andrew Cooper wrote:
> {cmci,lmce}_support are written during S3 resume, so cannot live in
> __ro_after_init.=C2=A0 Move them back to being __read_mostly, as they wer=
e
> originally.
>=20
> Link: https://gitlab.com/xen-project/xen/-/jobs/6966698361
> Fixes: 19b6e9f9149f ("x86/MCE: optional build of AMD/Intel MCE code")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> We're past feature freeze and this was a silent change in a patch,
> which was
> also untested.=C2=A0 A 30s look at mcheck_init() shows clearly that it's
> not a 30s
> job to fix.
> ---
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
> =C2=A0xen/arch/x86/cpu/mcheck/mce.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c
> b/xen/arch/x86/cpu/mcheck/mce.c
> index 1664ca6412ac..32c1b2756b90 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -38,10 +38,10 @@ DEFINE_PER_CPU_READ_MOSTLY(unsigned int,
> nr_mce_banks);
> =C2=A0unsigned int __read_mostly firstbank;
> =C2=A0unsigned int __read_mostly ppin_msr;
> =C2=A0uint8_t __read_mostly cmci_apic_vector;
> -bool __ro_after_init cmci_support;
> +bool __read_mostly cmci_support;
> =C2=A0
> =C2=A0/* If mce_force_broadcast =3D=3D 1, lmce_support will be disabled
> forcibly. */
> -bool __ro_after_init lmce_support;
> +bool __read_mostly lmce_support;
> =C2=A0
> =C2=A0DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, poll_bankmask);
> =C2=A0DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, no_cmci_banks);
>=20
> base-commit: 0840bc5ea114f536a4bdfb2ca095b79f2069aae6


