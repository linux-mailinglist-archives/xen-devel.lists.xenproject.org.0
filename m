Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6148C8754F7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689976.1075547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHJ9-00029O-PQ; Thu, 07 Mar 2024 17:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689976.1075547; Thu, 07 Mar 2024 17:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHJ9-00026C-ME; Thu, 07 Mar 2024 17:13:27 +0000
Received: by outflank-mailman (input) for mailman id 689976;
 Thu, 07 Mar 2024 17:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riHJ7-00025n-CW
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:13:25 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018dc424-dca6-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 18:13:24 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d2991e8c12so11612801fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 09:13:24 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a2e980e000000b002d0a7ba3215sm3114843ljj.85.2024.03.07.09.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 09:13:23 -0800 (PST)
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
X-Inumbo-ID: 018dc424-dca6-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709831604; x=1710436404; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qrlFTiBd5RZIoLfeqX5Iuykltkt949AokDl3AMi6iY0=;
        b=MCqazaxxrsIpDTQn1OzooM/zBNWMUvSVUOFR+rFygyWN7TEwwe1sjalmiuN7PXrMrt
         4TBfiPKCYrHFSa8waKQZHcA5piXt5CwU2OCudjNgdRyEEcp2DF9Xfz41+SfkM89J+4ce
         X2RJlszQXULyAK0v5Gal2Cst1gg7cVIr1F7MAp2nNv8QhOC1GiyOHCQN4jPXLHrsNUGi
         k7KNCzi4EzPAnfeUlvxfvERYrwTJOzVdG7QbYf6fZuzXjXuQy740Gqbt613EAWdDFzvP
         49XlNNaI8RyUlCapV6H42xakIL/yw0qUpVjTQrrZj3RfHmgF354VUDnlACGwux2Q8qZ6
         XQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709831604; x=1710436404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrlFTiBd5RZIoLfeqX5Iuykltkt949AokDl3AMi6iY0=;
        b=myHrTIKOG7SbCqn/PXLJKugkeR0CHowynb4Xtz8J7i+0yrmUmGPrWr3raOIIBwE25C
         f1SKPvvIhWnusWuan0bnFR3lcQcP21aDVTwKeocruk/+T2xIjrwiIUbhGuvJFaE6Oqn0
         d0Rw07tMYuR5JK4J42qQ7dCQyObh+Rq8sTuJ34R6pc2wqPVKdKg3rOOnu+45lfQrA8sN
         ME55y85D0ts8xQCwrwPt91uWMkrzdTQ6AZIA9cB0h1Oz3ihqxl+uuNWu5RBq/1NlApmx
         T2Q5HRbdxi26pejK1NSuZYUvz5o9z2D6sfdk7BzdiKTiKewr0Y2/cJcH8iLLPQ2Pq1hm
         w6Jw==
X-Gm-Message-State: AOJu0YySHyZq796gSuXLzxiDUIQS9Xpn2qNHQfxccbhAAxnPVvU4Q88G
	Nz3/YhRBmcSaZWG2HNPCgTUkXlOb+aDwoDAPuK2NhM9zgK2cM8XXW+MIkgzPWBo=
X-Google-Smtp-Source: AGHT+IFHhBFaeFrp/MK6nlv6+oceZk2cqA02MKFl85idmcEwZfhVDDj013GrypXmzO8ENodpcbZCOw==
X-Received: by 2002:a2e:978e:0:b0:2d2:6457:4087 with SMTP id y14-20020a2e978e000000b002d264574087mr351650lji.6.1709831603419;
        Thu, 07 Mar 2024 09:13:23 -0800 (PST)
Message-ID: <563cbcbf1bb4b540b858c187618969b75bd37481.camel@gmail.com>
Subject: Re: [PATCH v9 1/7] automation: introduce fixed randconfig for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>
Date: Thu, 07 Mar 2024 18:13:22 +0100
In-Reply-To: <d8e330c26394d9415a0d76b2d951bf57b0b6dd4b.1708086092.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
	 <d8e330c26394d9415a0d76b2d951bf57b0b6dd4b.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hello Doug and Stefano,

While Michal has reviewed this patch, I understand that I still need
your Acked-by.

Could you please take a moment to review the patch?

Thanks in advance.

~ Oleksii

On Fri, 2024-02-16 at 13:39 +0100, Oleksii Kurochko wrote:
> This patch introduces the anchor riscv-fixed-randconfig,
> which includes all configurations that should be disabled for
> randconfig builds.
>=20
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> The patch were introduced after discussion in a topic:
> =C2=A0
> https://lore.kernel.org/xen-devel/cover.1701966261.git.oleksii.kurochko@g=
mail.com
> /
> ---
> Changes in V9:
> =C2=A0- add '|' symbol after EXTRA_FIXED_RANDCONFIG to make variables in
> EXTRA_FIXED_RANDCONFIG
> =C2=A0=C2=A0 be separated by new line.
> =C2=A0- instead of introduction of new file for riscv-fixed-randconfig,
> introduce an anchor
> =C2=A0=C2=A0 inside build.yaml
> ---
> Changes in V8:
> =C2=A0- Nothing changed. Only rebase
> ---
> Changes in V7:
> =C2=A0- Nothing changed. Only rebase
> ---
> Changes in V6:
> =C2=A0- The patch was introduced in this version of patch series.
> ---
> =C2=A0automation/gitlab-ci/build.yaml | 14 ++++++++++----
> =C2=A01 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-
> ci/build.yaml
> index 6d2cb18b88..aac29ee13a 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -512,6 +512,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_BOOT_TIME_CPUPOOLS=3Dy
> =C2=A0
> =C2=A0# RISC-V 64 cross-build
> +.riscv-fixed-randconfig:
> +=C2=A0 variables: &riscv-fixed-randconfig
> +=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_EXPERT=3Dy
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn
> +
> =C2=A0archlinux-current-gcc-riscv64:
> =C2=A0=C2=A0 extends: .gcc-riscv64-cross-build
> =C2=A0=C2=A0 variables:
> @@ -532,8 +540,7 @@ archlinux-current-gcc-riscv64-randconfig:
> =C2=A0=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> =C2=A0=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> -=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0 <<: *riscv-fixed-randconfig
> =C2=A0
> =C2=A0archlinux-current-gcc-riscv64-debug-randconfig:
> =C2=A0=C2=A0 extends: .gcc-riscv64-cross-build-debug
> @@ -541,8 +548,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
> =C2=A0=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> =C2=A0=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> -=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0 <<: *riscv-fixed-randconfig
> =C2=A0
> =C2=A0# Power cross-build
> =C2=A0debian-bullseye-gcc-ppc64le:


