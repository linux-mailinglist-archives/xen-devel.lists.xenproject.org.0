Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEB58D5049
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 18:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732852.1138885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCj4L-0007GH-Kq; Thu, 30 May 2024 16:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732852.1138885; Thu, 30 May 2024 16:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCj4L-0007Dd-Hq; Thu, 30 May 2024 16:56:01 +0000
Received: by outflank-mailman (input) for mailman id 732852;
 Thu, 30 May 2024 16:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCj4K-0007DX-TO
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 16:56:00 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7db3fbf7-1ea5-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 18:55:59 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52b83225088so400851e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 09:55:59 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d34500sm16955e87.54.2024.05.30.09.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 09:55:58 -0700 (PDT)
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
X-Inumbo-ID: 7db3fbf7-1ea5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717088159; x=1717692959; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YGHVeE5O/iLTCsbWg7npMOS8KTfQhrI/JPwNfdlyenI=;
        b=FSOzoo89/xtcwkSBII3zt+reyu9xKwCT6RrR0m3v4Arpk/ME1/9JJxy9ZoNagUCZDZ
         YFnEuAN79dMphfWKO8qsE+yV7LVpK9qaZItwXFNISeb0D9Z90E3nVdY8UqZt4IL0sjqt
         VzmB3W5BPas0lzJY8MffkSjbczA4DjLKAe3Rm2fJJjinHy0ek8UUAYlmrheJSDuoalVU
         AFvTLWUSxDpYcapharcF+4yOOI5vHcYvD94QS70Cj3kg1Thllu6jCGgy0R2rB6BDaif9
         jAi5cbOYnM7roiLxYGnIjXhWY7t2xyAaFv9WuyY/QIjVHplE0lmgceNfI8x/Hs4xN+ps
         DAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088159; x=1717692959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGHVeE5O/iLTCsbWg7npMOS8KTfQhrI/JPwNfdlyenI=;
        b=hWxIITr+dPpQIqva1tOWcrPKbMsVVsBP+sVWqG1SeJxpBq7t20SdhtymGiTJyAASst
         x9Tw8t3XZsqx8F0jfyiXt2C68QL6yE1n/eER4JmH81dmTqZljG9vjMs7VpcU77MEfZKJ
         8LnZg7a6ynAaxUHxiGbRlicu+YPYWhrTNx5gbbG9AtMtu+SAWd0vjcbjkNTJvekMnBWJ
         STJsAjiVPPfxTtO8uTYPK70EISbFZsEq3AXo1o7FlabvCbWchy2z8Q9HMD2AVmXRWYbl
         +y3cNY0UiSOuf2cYX23MHBA3DHjfzDFQmNqZp5HKoQfoXJXWgo+tnjuF4GvknJthR4M2
         r2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXcgwm2QdmiAYw5XVq9q8Nyy3/gSrQJmBAiZLa3zu7g8sp9+9b59B5img34GFPCPMTInWo8IM7EkPEJ2w5meDev7qxNi7sOkDuziA5K0j0=
X-Gm-Message-State: AOJu0YyeKIAKmYZAxPIgioVQkgQMWce+V5EARrigZ4o3AI5lBufwx7o7
	8jiRgRBPwOHaVTBdFF9WLGLk1w3HXuEqkucambG1Dh2khqfkbH2k
X-Google-Smtp-Source: AGHT+IGfn1AuIvmFx4weRdCBLGL14uKkUhrDaGlkdYpXW/GSKV+9ZefApbmFShGAE+MisgcaRCrVrQ==
X-Received: by 2002:a19:770d:0:b0:51f:4c53:8e4c with SMTP id 2adb3069b0e04-52b7d43aee4mr1725419e87.33.1717088159135;
        Thu, 30 May 2024 09:55:59 -0700 (PDT)
Message-ID: <840dacc2b79260c31761a6fadd95fc5d4bb2b50d.camel@gmail.com>
Subject: Re: [PATCH v12 1/8] xen/riscv: disable unnecessary configs
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Date: Thu, 30 May 2024 18:55:58 +0200
In-Reply-To: <0f12ce69-b139-4d97-8e36-23dd7c6bea41@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <35cf9d52e538aab964a3ecc050260abb3f27c60d.1717008161.git.oleksii.kurochko@gmail.com>
	 <0f12ce69-b139-4d97-8e36-23dd7c6bea41@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 17:44 +0100, Andrew Cooper wrote:
>=20
> The subject should say "update Kconfig", because you're not (only)
> disabling.
>=20
> I'd suggest "xen/riscv: Update Kconfig in preparation for a full Xen
> build".
>=20
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > Disables unnecessary configs for two cases:
> > 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds
> > (GitLab CI jobs).
> > 2. By using tiny64_defconfig for non-randconfig builds.
> >=20
> > Only configs which lead to compilation issues were disabled.
> >=20
> > Remove lines related to disablement of configs which aren't
> > affected
> > compilation:
> > =C2=A0-# CONFIG_SCHED_CREDIT is not set
> > =C2=A0-# CONFIG_SCHED_RTDS is not set
> > =C2=A0-# CONFIG_SCHED_NULL is not set
> > =C2=A0-# CONFIG_SCHED_ARINC653 is not set
> > =C2=A0-# CONFIG_TRACEBUFFER is not set
> > =C2=A0-# CONFIG_HYPFS is not set
> > =C2=A0-# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
> >=20
> > To allow CONFIG_ARGO build happy it was included <asm/p2m.h> to
> > <asm/domain.h>
> > as ARGO requires p2m_type_t ( p2m_ram_rw ) and declaration of
> > check_get_page_from_gfn() from xen/p2m-common.h.
> >=20
> > Also, it was included <xen/errno.h> to asm/p2m.h as after the
> > latter was
> > included to <asm/domain.h> the compilation error that EINVAL,
> > EOPNOTSUPP
> > aren't declared started to occur.
> >=20
> > CONFIG_XSM=3Dn as it requires an introduction of:
> > * boot_module_find_by_kind()
> > * BOOTMOD_XSM
> > * struct bootmodule
> > * copy_from_paddr()
> > The mentioned things aren't introduced now.
> >=20
> > CPU_BOOT_TIME_CPUPOOLS requires an introduction of
> > cpu_physical_id() and
> > acpi_disabled, so it is disabled for now.
>=20
> CONFIG_BOOT_TIME_CPUPOOLS
>=20
> Also the "depends on DT" isn't good enough as a restriction IMO.=C2=A0
> It's
> very ARM-dom0less specific.
>=20
> > PERF_COUNTERS requires asm/perf.h and asm/perfc-defn.h, so it is
> > also disabled for now, as RISC-V hasn't introduced this headers
> > yet.
> > LIVEPATCH isn't ready for RISC-V too and it can be overriden by
> > randconfig,
> > so to avoid compilation errors for randconfig it is disabled for
> > now.
>=20
> PERF_COUNTERS is x86-only, and both LIVEPATCH really should be
> guarded
> by have HAVE_$FOO selected by ARCH.
>=20
> However, that's not work to get stuck into now.
>=20
> It's quite unreasonable how much stuff doesn't work in simple
> builds...
>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> I'm happy to fix up the two minor issues on commit.
Thanks. I Would appreciate that.

~ Oleksii


