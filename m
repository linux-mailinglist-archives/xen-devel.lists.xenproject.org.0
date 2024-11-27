Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3514B9DA82F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 14:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844820.1260324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHh2-0001VV-VI; Wed, 27 Nov 2024 13:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844820.1260324; Wed, 27 Nov 2024 13:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHh2-0001TZ-QX; Wed, 27 Nov 2024 13:02:56 +0000
Received: by outflank-mailman (input) for mailman id 844820;
 Wed, 27 Nov 2024 13:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHh0-0001TM-Oo
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 13:02:54 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e87c9210-acbf-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 14:02:51 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso2145675e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 05:02:51 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24459f1sm2287393e87.24.2024.11.27.05.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:02:49 -0800 (PST)
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
X-Inumbo-ID: e87c9210-acbf-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU4N2M5MjEwLWFjYmYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzEyNTcxLjE4MzEyMiwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732712570; x=1733317370; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sv/P2ja8M29CeLuOtPNdZOQ0kZ3jbzmBwT468MbRvik=;
        b=PyeEwLT7cU1kbj1agEq4piXw+WvSmi5t1FWG+hkCVbZId22UfeDxpn5ux9FJvAsRDX
         vWCaQfLtFDVvv2I4kHxznXcUuQB+QORIddYsep3pR7r6cWT0S3zoXCD/o9P0e0PyOlPg
         THZtMx1gcuMnlu78HeDNEbVy7tFdAa6MKdjiCAAF/NJyvW5Y87Hu4qa4H03yJhV2/ZrX
         RVktl9C+ldBv59FrzjeC67aNDd3C4OvigQSj7KHenr+rHFqP3Pwggx31oix6bQi91BvP
         xYs6Szg12f6nnvp3YKepaGmpedP5/SaoyGbwHkeFDczmH2NUz4K1zK0tqcL1QHleAwuC
         PGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712570; x=1733317370;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sv/P2ja8M29CeLuOtPNdZOQ0kZ3jbzmBwT468MbRvik=;
        b=QZMXzBuvE9qBjbnlh97DCSCDBP+kpqvNDyMhzkTt25Iw4u+Yc2/vO8WygQecpS1M9Z
         lcyptDBXbg9PXSIkvGsYkBZl/EbDVqvXGjgk8R8MKzI/jBgOoEVBZFCrydDk9FnD2/fI
         TI46VLzajgRljsRV3LoD/RJodWfszyBg2M89k9a54KAoyPNFV9gPXXTNUUWEYOIuZ9x1
         rbAchHllrco4HZvYwCuZ1ShgMHba3lEBQnAbAWr1bpt6ia7/RfMTD/XOLSsiMCLy5eXj
         eweYxW9JKzkSKCET97GITxiE5wGrATPfd8VmmoV9iGfzOuAedmh+Gu2RWaGefSca9sUu
         dyCQ==
X-Gm-Message-State: AOJu0YxZEOEBq3q9IA3a8R7G/UMP6baM8q9ZmV+FjF7JIxqRQrug8aiI
	0A1UD56rM+wmioSzFHqcEitRm4EcgtbYTAAVQNKg3TP2bJ8Gjcdk
X-Gm-Gg: ASbGnctRuNQrvsbZT6OrIXNvdUE0uWPufdgpsUGMX4TBn2fVAjUG7urz3rfX0ADc1GG
	nYtYQ2sYmI1Ksi0B6b8RBB6UJeWRcnGwjF9L1zPJzlG0DPpR/zzCh+gPsNO+bzymUvWsBZBaSw7
	AlUcwmOTNWx/OQXqW0kad9hfJQaI0VHFq02KazaSslxE72d/TGStg/8ebS0W1XZhH5hmlV9qf+H
	94t+NNnmEIOSA6ZzhsZKPvEqW4+jpXQzzrJcf0cyIuyjmNW47YyXBFcA+NLMB0=
X-Google-Smtp-Source: AGHT+IGshyedBFh2L+cUzV2uL39uQ2yJLbDsjuQ3FbNQL9WWH1jp/peiMT5oLW2bncNN/QPcMqhcsA==
X-Received: by 2002:a05:6512:3e1f:b0:53d:d65e:772a with SMTP id 2adb3069b0e04-53df0111ec3mr1417345e87.47.1732712570025;
        Wed, 27 Nov 2024 05:02:50 -0800 (PST)
Message-ID: <bc3136303d0e88017a5e3da21f97f9da28213acf.camel@gmail.com>
Subject: Re: [PATCH 09/36] riscv/domain: introduce domain_has_vuart()
From: oleksii.kurochko@gmail.com
To: dmukhin@ford.com, Jan Beulich <jbeulich@suse.com>, Andrew Cooper	
 <andrew.cooper3@citrix.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=	
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,  Michal Orzel
 <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, Volodymyr
 Babchuk	 <Volodymyr_Babchuk@epam.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Shawn Anastasio	
 <sanastasio@raptorengineering.com>, Anthony PERARD
 <anthony.perard@vates.tech>,  Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,  Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?=	 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
Date: Wed, 27 Nov 2024 14:02:48 +0100
In-Reply-To: <20241126-vuart-ns8250-v1-v1-9-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
	 <20241126-vuart-ns8250-v1-v1-9-87b9a8375b7a@ford.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Tue, 2024-11-26 at 15:21 -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>=20
> Introduce domain_has_vuart() for RISC-V port to be used in the
> console driver.
>=20
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> =C2=A0xen/arch/riscv/include/asm/domain.h | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/xen/arch/riscv/include/asm/domain.h
> b/xen/arch/riscv/include/asm/domain.h
> index
> c3d965a559b6ce3661bf17166d0c51853ff295a2..efbc4f1ea2619a187fe30ede17d
> 96de01e599220 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -10,6 +10,8 @@ struct hvm_domain
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 params[HVM_NR_PARAMS];
> =C2=A0};
> =C2=A0
> +#define domain_has_vuart(d)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 false
> +
> =C2=A0struct arch_vcpu_io {
> =C2=A0};

LGTM: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Probably it would be nice instead of having stub ( #define
domain_has_vuart(d) false ) in arch specific code, just ifdef-ing it
and put somewhere in
<xen/domain.h> to not introduce this definition for each architecture
which doesn't support vuart now.

Thanks.

~ Oleksii

