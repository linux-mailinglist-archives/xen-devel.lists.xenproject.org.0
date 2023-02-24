Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA56A1E63
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501180.772809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZrA-0002u6-3Q; Fri, 24 Feb 2023 15:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501180.772809; Fri, 24 Feb 2023 15:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZrA-0002qi-0d; Fri, 24 Feb 2023 15:19:32 +0000
Received: by outflank-mailman (input) for mailman id 501180;
 Fri, 24 Feb 2023 15:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZr8-0002qc-Ms
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:19:30 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a21e9a3b-b456-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:19:29 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id g17so5598386lfv.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 07:19:29 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 p12-20020a19f00c000000b004d37d647637sm1659755lfc.64.2023.02.24.07.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:19:28 -0800 (PST)
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
X-Inumbo-ID: a21e9a3b-b456-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uTp/HMRYAQd1DwVBw1+20SdFpWuT2ZnHUkCVqPOj3B4=;
        b=S8m4uFt0gyNcYBN7JKaAwKnagPYIpKWWi954ckZj2AQJEr3BcFQMYCvdQATKL8oYkc
         dB1/RScK+SaT1afmX3OGkYLERAXGiidUJ5hCezkWFJl3eRx5XR8M25yTj0t7bUf0mWA2
         78KZumpwug3A9oeIXaINTS/ufpCh/mXHKhZzJCG7f+erdtj0WHjGXiDcvhWJVk6jBUPD
         WTj67PT3hEG2+FysoIXnj+R7w9mK98F13VALQfAKVZ14dEWXlc5mHFIC2Z+FEV+PatpD
         5Ewg8roZHNNjYYClkBGDfYg5q5PP+8PDwMfXn+e7xAuJSW+NGCuIUy4/ld18B+2vgdY1
         Wxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTp/HMRYAQd1DwVBw1+20SdFpWuT2ZnHUkCVqPOj3B4=;
        b=2qUNKJ2ejLMgoNKS64kPo0gEbC4WHAGe8+Cg/TOH0JPZmRU1pR1O2Hwaf9Hp0oGIVO
         k40zK8HHh5yRMRglAFXlCTXqtNY07Gj2IpCfDDyitAtUpJe/k+ROHe23GhbqsT+HJJ/K
         bpBxDSD4MT/g1WPVhpD92KxTkTnUUsbSxQ0MwboIJLy/n3572aJ8S8gcj5ujaJXtFSZH
         BHxfgc2esWjBhw7s2eN6srXMZdLfko15Z7Ripk4Zi98MbbL4dCpDxVG6slHELqk+bSOY
         QHPF4FY/alxCuMh+3M1XGaRiaaBmdEFmp1KscAjIm364dbubVC2hi+r6JFLc6BzymQZu
         Nmmg==
X-Gm-Message-State: AO0yUKVowZBpvwsH7OPlgJK4p8bjuCeGdYsgaVExc7fILFdCx0JhY8zz
	OgLiRYXLHO6Y5NpjswoB41xloAjIIgU=
X-Google-Smtp-Source: AK7set+0V2dO8X2K/e39nRGCviU66TuccHz6SxamHU1cvzMTT013sN4coJoUNdlLi5+1cSEtflQRkg==
X-Received: by 2002:a05:6512:3b0d:b0:4da:ffa0:3f21 with SMTP id f13-20020a0565123b0d00b004daffa03f21mr26212lfv.14.1677251969220;
        Fri, 24 Feb 2023 07:19:29 -0800 (PST)
Message-ID: <fab4f1f9702660288d2d489ca836ee5353bb1fd1.camel@gmail.com>
Subject: Re: [PATCH v1 0/3] enable MMU for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, Doug
 Goldstein <cardoe@cardoe.com>
Date: Fri, 24 Feb 2023 17:19:26 +0200
In-Reply-To: <cover.1677250203.git.oleksii.kurochko@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-02-24 at 17:06 +0200, Oleksii Kurochko wrote:
> The patch series introduces the following things:
> 1. Functionality to build the page tables for Xen that map the
> =C2=A0=C2=A0 following:
> =C2=A0=C2=A0=C2=A0=C2=A0 * The physical location of Xen (where the bootlo=
ader loaded it)
> =C2=A0=C2=A0=C2=A0=C2=A0 * The link-time location of Xen (where the linke=
r expected Xen's
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addresses to be.
> 2. Load the built page table into the SATP
> 3. Enables MMU.
> 4. Updates smoke test to grep message which should be printed after
> =C2=A0=C2=A0 MMU is enabled.
>=20
> Oleksii Kurochko (3):
> =C2=A0 xen/riscv: introduce setup_initial_pages
> =C2=A0 xen/riscv: setup initial pagetables
> =C2=A0 automation: update RISC-V smoke test
>=20
> =C2=A0automation/scripts/qemu-smoke-riscv64.sh |=C2=A0=C2=A0 2 +-
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
1 +
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
> =C2=A0xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 90 +++++++++
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 223
> +++++++++++++++++++++++
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 =
++
> =C2=A06 files changed, 335 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/mm.h
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/page.h
> =C2=A0create mode 100644 xen/arch/riscv/mm.c
>=20

I forgot to mention in cover letter that the patch series is based on
top of 'introduce generic implementation of macros from bug.h' and
'RISCV basic exception handling implementation' patch series.

