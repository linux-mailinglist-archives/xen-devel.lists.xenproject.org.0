Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD248896D5A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700472.1093687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rryGm-0003Bi-F3; Wed, 03 Apr 2024 10:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700472.1093687; Wed, 03 Apr 2024 10:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rryGm-00039Q-CV; Wed, 03 Apr 2024 10:55:04 +0000
Received: by outflank-mailman (input) for mailman id 700472;
 Wed, 03 Apr 2024 10:55:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rryGk-00039K-VU
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:55:02 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e3e0dce-f1a8-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 12:55:00 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d8129797fcso43526461fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:55:00 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a2e8401000000b002d4979caef8sm1905735ljg.42.2024.04.03.03.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:54:59 -0700 (PDT)
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
X-Inumbo-ID: 9e3e0dce-f1a8-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712141700; x=1712746500; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6mK0JgUHzIjopiCE/QjOIIuyWRbSpDJYSH7YSGmTtMk=;
        b=eFyMZj/9EDp7RJJ/v9ljaMee9a66Yf5mIEYfTLpI1j44WMog22kdaOh4Ra4ubvbBZk
         yygW1fbRVSXelDG0GF/QGapluvq6ZIDMVZO4sZ6oTj3xRqeVBoMO3f+R1wa0sMOn2vDO
         QyMCbesQxndSNm9mE2gZap49wc1q2VKjAmLW+26jqF810oj4selA2Gi6u64+80ZLYoz2
         y9TW4+xb55Q0/hIThEohnda59DPxfq2aWcvPMqXTfKbuYe0t4ocwGKfUNW0VurUQBanX
         74SeZSBiON+I1evoT1CzogDMqGuOiYzCJvvdqeDAxXfVlIbu+Wsxk13IOlGZBWQPoSPG
         N+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712141700; x=1712746500;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6mK0JgUHzIjopiCE/QjOIIuyWRbSpDJYSH7YSGmTtMk=;
        b=fo4Y0Wsj9HG4o5wuLBpS+4wcvjMZEtAMdhRFP+r86ArfWscIAo88tX/Lw6DUcgZI/1
         ZRGkfNZBzwSsO/cb/OXeGbkx9yaAAp25wSvlUfnGocfqsk+vz92UMe2EOZh+7Y3+8T+e
         fSJN//Ks9KpMLVJ++qzkPjHWzlUHxUlvY7B5F7BuOo07xJPFos6LU2P++jIQK/our62T
         dAMDLEBarowy76lH0rFDhYrtjVvuRnKdvJWnOfzQsl9h1GW7kFI1QODUsZM7l4kli1Vy
         E80dPjib4KsUKjiuyYAyHM3dfd0nJ+B/DgsWc50iui0bbVUTBWsiHur7OHBwffcCv15U
         C0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSv4ZoPGN7bbX5wUuIAmH6TcqBGc4Bq9hYg+x/qP8ILXMPpPGYVFA0YgsUBwRrZNmajATU4s2J/6guAaDrTuGJUitMSg5ucDVMzBj0J6A=
X-Gm-Message-State: AOJu0Ywa14BsLvVRO7fpboXZXnm2K8d4Gkrz+IaTTxymk3JnnNBFD5Mk
	b7N/iPZ6czm7IE1F95ivGrvBi0vEaVckPXVMDVsjgj+4rabzebig
X-Google-Smtp-Source: AGHT+IFH5WNVk8eYCbbXlY1l/e5xEuN0EfUxlxvnm1Oq5PZDf3S7zybNtGI5Ijti4m/ZdVHmnMRiCg==
X-Received: by 2002:a2e:9e87:0:b0:2d5:122a:4b1f with SMTP id f7-20020a2e9e87000000b002d5122a4b1fmr9732099ljk.43.1712141700124;
        Wed, 03 Apr 2024 03:55:00 -0700 (PDT)
Message-ID: <77d63eccd4906ebbb3a5add624490cc25b2cba0c.camel@gmail.com>
Subject: Re: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
	Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	xen-devel@lists.xenproject.org
Date: Wed, 03 Apr 2024 12:54:59 +0200
In-Reply-To: <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
	 <e3da3546-f2a7-4eab-b157-51b6570dcbf9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-04-03 at 12:28 +0200, Jan Beulich wrote:
> On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > This patch disables unnecessary configs for two cases:
> > 1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds
> > (GitLab CI jobs).
> > 2. By using tiny64_defconfig for non-randconfig builds.
> >=20
> > Only configs which lead to compilation issues were disabled.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V7:
> > =C2=A0- Disable only configs which cause compilation issues.
>=20
> Since the description doesn't go into details: While I can see that
> PERF_COUNTERS and LIVEPATCH may require (a little / some more) extra
> work, are HYPFS, ARGO, and XSM really causing issues?
For Argo, I recieved the following compilation errors:
   common/argo.c:1416:5: error: unknown type name 'p2m_type_t'; did you
   mean 'hvmmem_type_t'?
    1416 |     p2m_type_t p2mt;
         |     ^~~~~~~~~~
         |     hvmmem_type_t
   common/argo.c:1419:11: error: implicit declaration of function
   'check_get_page_from_gfn' [-Werror=3Dimplicit-function-declaration]
    1419 |     ret =3D check_get_page_from_gfn(d, gfn, false, &p2mt, &page)=
;
         |           ^~~~~~~~~~~~~~~~~~~~~~~
   common/argo.c:1427:10: error: 'p2m_ram_rw' undeclared (first use in
   this function)
    1427 |     case p2m_ram_rw:
  =20
It seems it should be included xen/p2m-common.h and asm/p2m.h in
common/argo.c.

For CONFIG_HYPFS_CONFIG ( there is no issue with CONFIG_HYPFS,
overlooked that ):
   common/config_data.S:1:10: fatal error: asm/asm_defns.h: No such file
   or directory
       1 | #include <asm/asm_defns.h>
  =20

For XSM, I recieved the following error:

   xsm/xsm_core.c:79:19: error: 'xsm_core_init' defined but not used [-
   Werror=3Dunused-function]
      79 | static int __init xsm_core_init(const void *policy_buffer,
   size_t policy_size)

I'll add an information with compilation errors to the commit message.

~ Oleksii

>=20
> > --- a/xen/arch/riscv/configs/tiny64_defconfig
> > +++ b/xen/arch/riscv/configs/tiny64_defconfig
> > @@ -1,12 +1,11 @@
> > -# CONFIG_SCHED_CREDIT is not set
> > -# CONFIG_SCHED_RTDS is not set
> > -# CONFIG_SCHED_NULL is not set
> > -# CONFIG_SCHED_ARINC653 is not set
> > -# CONFIG_TRACEBUFFER is not set
> > =C2=A0# CONFIG_HYPFS is not set
> > =C2=A0# CONFIG_GRANT_TABLE is not set
> > -# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
> > =C2=A0# CONFIG_MEM_ACCESS is not set
> > +# CONFIG_ARGO is not set
> > +# CONFIG_PERF_COUNTERS is not set
> > +# CONFIG_COVERAGE is not set
> > +# CONFIG_LIVEPATCH is not set
> > +# CONFIG_XSM is not set
> > =C2=A0
> > =C2=A0CONFIG_RISCV_64=3Dy
> > =C2=A0CONFIG_DEBUG=3Dy
>=20
> The description also says nothing about the items being removed.
>=20
> Jan


