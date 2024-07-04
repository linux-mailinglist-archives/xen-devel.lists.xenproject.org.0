Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0592743C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 12:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753683.1161870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJvD-0006AW-LA; Thu, 04 Jul 2024 10:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753683.1161870; Thu, 04 Jul 2024 10:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJvD-00067R-IY; Thu, 04 Jul 2024 10:42:39 +0000
Received: by outflank-mailman (input) for mailman id 753683;
 Thu, 04 Jul 2024 10:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPo+=OE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sPJvC-00067L-Pj
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 10:42:38 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b3ca41-39f2-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 12:42:36 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-58b447c511eso640846a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 03:42:36 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58b5225d687sm3528381a12.23.2024.07.04.03.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 03:42:35 -0700 (PDT)
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
X-Inumbo-ID: 20b3ca41-39f2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720089756; x=1720694556; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9U0I/1jp1To09b4azXL/OFAaEUOGqYcs9CEU9FIzn4k=;
        b=ivvO0I565ZQkCdAdArCQDskcxZfvKtKZsbtGEI5i3g2f3t6POeeVSSIWHcieXT7WQ/
         T/n78ONyc876p3q9WdEWrgM9MPJ6yWNbtroeKqd4zSBWng3aTe4dNl+gxv5P3yfkW8uk
         V4/F/d0KsAWid7BkiSnxwVY60aotDbYK7Rt13+MUJ4Pa/b9T07AonLGvJRvwbbrspJ+q
         NtlxfbCT12iK4Bie28uzKQk2wcnyyvFTI1ayMviv5LqtJdtXwhWZnyGSLRBGoHT6Et8Y
         7/M8Blc8arr1qorEWpgY05SQ9iHsbrxoQ0lq66LHkUChwnJQsFzw0toX+JuV/0za2gJr
         5jFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720089756; x=1720694556;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9U0I/1jp1To09b4azXL/OFAaEUOGqYcs9CEU9FIzn4k=;
        b=asVztjwMHnt7glBhopmHkSD9Q47/lEhRcCvjUYsZqy3u4hoYH+TyawKXyyHqAptUcs
         qBzVCEM0299EtYaO+qNaNV0mj0ZVZsdOSvxtpNVNVgj6u765HPTEQn79Wolc4cnbphcT
         /fq1tSVfqz3UbAQP7+ZPD/lazNqXVAsnGvGMHS5savO3JG1u8ywXUb41ZtM6WE8W+rfM
         LsJqm2ATOxIZG3R9D7uW72ueCIBpFL5eevJwHZhCb5QLxItkcAMtAmzJ8aRiz33Gw6Yu
         TxC7jQmfuTeQ314n6+u4/yjLxhG0YKwtXOhMhA76CdaH+0lY1bh2sOoTsGkLhinuujWv
         Obcw==
X-Forwarded-Encrypted: i=1; AJvYcCXhX0kI9N1rlO6Bf1whxFkgmS+UeFZidZl9ldcibgNrkV42JP7ECmmTqAeHO30LeyiKfOfDbv7rTjQEcwDCRUlF68IwRBLPcSPLN7Is4UY=
X-Gm-Message-State: AOJu0YxUx6IRU+ptcUFZekjE+MTMg28um+jU+mME4PvmzuHfeftaMEda
	QdRrOdMrimM8mmxaUaZh/NO14pLKZk8EacxCqilVHm1gk7Xiq1ESUW3bl0Gz
X-Google-Smtp-Source: AGHT+IEhQDWhl5Rhb1baSUcckYfmf7sGslACFUhkP5CVKA8nQ0IJAdkPnmNkHPb+ck5JXxyQvTN9uw==
X-Received: by 2002:a05:6402:11ca:b0:57c:6d1c:3cee with SMTP id 4fb4d7f45d1cf-58e5aec845fmr903802a12.14.1720089755929;
        Thu, 04 Jul 2024 03:42:35 -0700 (PDT)
Message-ID: <7674f561af40d8ce126f457e0acb9ad40de13ea3.camel@gmail.com>
Subject: Re: [PATCH for-4.19? 0/2] build/mkheader: Fixes
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
 <JBeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>
Date: Thu, 04 Jul 2024 12:42:35 +0200
In-Reply-To: <20240703225525.1759907-1-andrew.cooper3@citrix.com>
References: <20240703225525.1759907-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-03 at 23:55 +0100, Andrew Cooper wrote:
> For 4.19?=C2=A0 Noticed while staring at build logs.=C2=A0 Low risk, as t=
he
> build system
> contains a cross-check that mkheader generates the same layout.
>=20
> Not the end of the world if these fixes delay to 4.20.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> Andrew Cooper (2):
> =C2=A0 build/mkheader: Remove C-isms from the code
> =C2=A0 build/mkheader: Fix Syntax/DeprecationWarnings
>=20
> =C2=A0tools/include/xen-foreign/mkheader.py | 108 +++++++++++++----------=
-
> --
> =C2=A01 file changed, 53 insertions(+), 55 deletions(-)
>=20


