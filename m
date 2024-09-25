Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6A985642
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803667.1214371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOEm-0002kc-5V; Wed, 25 Sep 2024 09:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803667.1214371; Wed, 25 Sep 2024 09:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOEm-0002i9-2s; Wed, 25 Sep 2024 09:23:08 +0000
Received: by outflank-mailman (input) for mailman id 803667;
 Wed, 25 Sep 2024 09:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stOEl-0002i0-67
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:23:07 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f010e2-7b1f-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 11:23:05 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406fa5so4590163a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:23:05 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5270sm1730760a12.77.2024.09.25.02.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 02:23:04 -0700 (PDT)
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
X-Inumbo-ID: c4f010e2-7b1f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727256184; x=1727860984; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3NxBJ25s/IuGg+V9QUeJRpNPtRgv8UMn6sT6CKLb3gk=;
        b=dGHt++8NL5Y+xeoiIlj875e1Vni5Xy7+UiiWDHouhoC0bWxVVXLZpw0F0lj09KazNI
         RkOuwXLmSNny+segg0wyB6oxTdtt2PtmFgtn2jguQr6j7JX3u3ihGkFctOQZODNWF1Vh
         pqupKNFce+ClDdWVc+vR4uV88cwLxZZrjrh0fK9IaySa0U6VuKfNeB9kGjvM6yB2ybRr
         C2VL7+YJpyx8oQ3Es9iXOL/D5Tg2Ik05d8epODi4uGBqkJadidoAEBuJGjAbpvfvypue
         ZZcW1gIhCoVDOwBYkipf/EzgkNRp6RcIHUpOxYubE0erNd0n7meGzBmZ6/hJ4ERhOFMe
         GN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727256184; x=1727860984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NxBJ25s/IuGg+V9QUeJRpNPtRgv8UMn6sT6CKLb3gk=;
        b=CZwAIXa+rb8Wa2ZGalUX3tigxpBmz5yHxMxE6a52ou/O34F+SFWKCN+IVr7TBh9e/K
         PmM8T6uUB7zK0+AjpkP70dREP53uDlYAz20WlD/5rZUVRufdY2SoShhmueoTwrl3VrnM
         oWSxWT2FAjCAHgKkPxibDJ4umAe01AztgboM7/AXx8hiGdVdj6wxsLh2aETj7oEOjHs1
         b+iQHTRrQ7pIGCBRBZ/Pk7MZyG9+iMEhMdCx20tWmtYoQ9jWTdrED7bsZXUupt4eqOLP
         TpxarFiDmOk0zZim+YjKNWcrFs+YrZ0LSEft0+EAV6xG1H6Hp+yrqZhsYaHX8Xi9+UxA
         a+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk67xQIzie/j4uKIRx3aEkqNT3PkCR50WvYdPxLrxSbQKTtYoB5Z4XziaMNsU3EPjxQmdyEq38jAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywv1RS1RJ6f29y+TezkPAco7AEkK/CYnuBRwfVIDKFNWYrPNIPc
	QLLX9U5TaOv0a+6x2wZwx58IiB8sxohI2gPX7NjXXqSz+9oRYUP8
X-Google-Smtp-Source: AGHT+IEHvrn6WQ+H0uxWM8uY3zVhqOVtBCKtbAxA2iE/ECB+95fnqmEA8p7Q6lF9ou4XJa0xDvdZdA==
X-Received: by 2002:a05:6402:84b:b0:5c5:c447:e6c9 with SMTP id 4fb4d7f45d1cf-5c72062612cmr2047433a12.15.1727256184321;
        Wed, 25 Sep 2024 02:23:04 -0700 (PDT)
Message-ID: <2b6624d147c0e86bdd3839e113953c282e742d17.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] xen: introduce common macros for per-CPU
 sections defintion
From: oleksii.kurochko@gmail.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Julien Grall
 <jgrall@amazon.com>
Date: Wed, 25 Sep 2024 11:23:03 +0200
In-Reply-To: <7857cbd9-c26d-4d31-97c6-8a1f34dd4559@citrix.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
	 <27aba3aae7f4a5d4694ab141dca325d7231f2f66.1727185495.git.oleksii.kurochko@gmail.com>
	 <7857cbd9-c26d-4d31-97c6-8a1f34dd4559@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-24 at 18:01 +0100, Andrew Cooper wrote:
> On 24/09/2024 5:42 pm, Oleksii Kurochko wrote:
> > Introduce PERCPU_BSS macro which manages:
> > =C2=A0* Alignment of the section start
> > =C2=A0* Insertion of per-CPU data sections
> > =C2=A0* Alignment and start/end markers for per-CPU data
> > This change simplifies the linker script maintenance and ensures a
> > unified
> > approach for per-CPU sections across different architectures.
> >=20
> > Refactor the linker scripts for Arm, PPC, and x86 architectures by
> > using
> > the common macro PERCPU_BSS defined in xen/xen.lds.h to handle per-
> > CPU
> > data sections.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Julien Grall <jgrall@amazon.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V2:
> > =C2=A0- rename PERCPU_SECTION to PERCPU_BSS
> > =C2=A0- update the commit message
> > =C2=A0- add Acked-by: Julien Grall <jgrall@amazon.com>
> > =C2=A0- add Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> >=20
> > =C2=A0xen/arch/arm/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +--------
> > =C2=A0xen/arch/ppc/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +--------
> > =C2=A0xen/arch/x86/xen.lds.S=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +--------
> > =C2=A0xen/include/xen/xen.lds.h | 10 ++++++++++
> > =C2=A04 files changed, 13 insertions(+), 24 deletions(-)
>=20
> Aren't you missing a hunk in riscv/xen.lds.S ?
I thought it would be better to add a hunk in riscv when
percpu_init_areas() will be called in RISC-V's start_xen().

~ Oleksii

