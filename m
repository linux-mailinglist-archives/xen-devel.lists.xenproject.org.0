Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80992F9A2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 13:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757960.1167140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEdt-0003Jv-Sz; Fri, 12 Jul 2024 11:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757960.1167140; Fri, 12 Jul 2024 11:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSEdt-0003Hz-PP; Fri, 12 Jul 2024 11:40:49 +0000
Received: by outflank-mailman (input) for mailman id 757960;
 Fri, 12 Jul 2024 11:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSEds-0003Hr-EG
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 11:40:48 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9407ba4b-4043-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 13:40:46 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38027so2142312a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 04:40:46 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a855f14sm335638666b.183.2024.07.12.04.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 04:40:45 -0700 (PDT)
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
X-Inumbo-ID: 9407ba4b-4043-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720784446; x=1721389246; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v2XotvZdUN628CPl5sSZ5o/if5R+EpGGsAzMWyjPvdg=;
        b=i6v/4ZXERpgIxWhKIDZeVTTfqsvicyqXzZIVRr8U/8uKB5tBSQ/440Y4TE/JWI35zX
         Dx0cWQx/ETy8hgT2c+bz77+8Z3tUYoXK/hY6MExsAb6BY3m1QZOc0PMUqxPwc3/v5sP+
         9oCx5O0MaSA+Lp3bMmPjw89LdSpZ/A1HP0xZcOAQac1P88cgwC5LWg1xQvvLMEHeK3rs
         iNNiTdMg2GzVBp32xq59TnOEOsPCNTi9c6yQZkUttqRs+Uqz3VBEkNpqpjqY2EO/vdJ5
         Jb5grYwzGWOseVz9WujuFt86QXS14e/YSrgGWVUQX/IMpOxLfS8cnkv8fMLeJUcwxgaE
         8hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720784446; x=1721389246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2XotvZdUN628CPl5sSZ5o/if5R+EpGGsAzMWyjPvdg=;
        b=MxLIt0Eq0ccs2rKOP3iRhp8EGwVv0lqC1ZvNKZ5uGlpAIbZw3+h5v6fSJaGscI7Vfr
         fAmQyp487IABs/PGcWxCES6VJX53JsiHx59fMsRJ9M2eR7kBZsrVxed4n+PMM5WfEGCO
         KySpx2DofNHB106RnXl8jXtpduKCtqan+ONB1C64hKqs7+r2l1sLiX9bIBaOxgGytqmk
         zPtAIWkI+i0Fclmdp9EmRUCb864cB6h4WhkZ93QofPcwk7XM+3DILCpG0iH1CrGMCepD
         gfGONZuHApTjAdRPvgtXoBPbBQaxi0GHXVwN1LMIcJikpB7SISFJjpQUoFloIw52fA50
         7Q6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBJkvi4M4AbDlpBqBJQnnpsnf0mYpDz5AFEBwU89bwbLYHkN51/NXCQSRy6f/T4Kg2/JQA4dfgcwSs/0IA3fwhoG5D1lOP8KP2BhB9URA=
X-Gm-Message-State: AOJu0YyUFbe9LPX/n9eGTZAUeYiBngZ4usnVIouQeGRaS7HzBDTBcAje
	mposDx7B9LR68fvtoDoncI2nVVRxeJNA5T+2g73JYX9OzjKrZvlC
X-Google-Smtp-Source: AGHT+IEc2taQ3cIpmJtV91Z07HOFaQv9tRY2+JVoKrgzRf4HV0KVExwHZjYDpiibxgxIqe4AG+AvHA==
X-Received: by 2002:a17:906:7086:b0:a77:eb34:3b46 with SMTP id a640c23a62f3a-a780b6b1a18mr818319566b.19.1720784445699;
        Fri, 12 Jul 2024 04:40:45 -0700 (PDT)
Message-ID: <789031f58a3f74a0bef8353d16ca24b202d20389.camel@gmail.com>
Subject: Re: [PATCH 11/12] CI: Swap to debian for riscv64 build and test
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
 <jgross@suse.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Fri, 12 Jul 2024 13:40:44 +0200
In-Reply-To: <20240711111517.3064810-12-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
	 <20240711111517.3064810-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 12:15 +0100, Andrew Cooper wrote:
> The containers are both much smaller, with stable toolchains over
> time, and
> this at least means we're not doing all testing with a single
> compiler.
>=20
> Rename the jobs to follow to sort coherently ($DISTRO-$VERSION-$ARCH-
> *) and
> reposition the jobs to optimise starting the smoke test.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
LGTM: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> =C2=A0.../archlinux/current-riscv64.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 22 -----
> =C2=A0automation/gitlab-ci/build.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 83 +++++++++++------
> --
> =C2=A0automation/gitlab-ci/test.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0automation/scripts/containerize=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A04 files changed, 52 insertions(+), 60 deletions(-)
> =C2=A0delete mode 100644 automation/build/archlinux/current-
> riscv64.dockerfile
>=20
> diff --git a/automation/build/archlinux/current-riscv64.dockerfile
> b/automation/build/archlinux/current-riscv64.dockerfile
> deleted file mode 100644
> index f7770bf82a78..000000000000
> --- a/automation/build/archlinux/current-riscv64.dockerfile
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -# syntax=3Ddocker/dockerfile:1
> -FROM --platform=3Dlinux/amd64 archlinux
> -LABEL maintainer.name=3D"The Xen Project" \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maintainer.email=3D"xen-devel@lists.xenpr=
oject.org"
> -
> -# Packages needed for the build
> -RUN pacman --noconfirm --needed -Syu \
> -=C2=A0=C2=A0=C2=A0 base-devel \
> -=C2=A0=C2=A0=C2=A0 git \
> -=C2=A0=C2=A0=C2=A0 inetutils \
> -=C2=A0=C2=A0=C2=A0 riscv64-linux-gnu-binutils \
> -=C2=A0=C2=A0=C2=A0 riscv64-linux-gnu-gcc \
> -=C2=A0=C2=A0=C2=A0 riscv64-linux-gnu-glibc \
> -=C2=A0=C2=A0=C2=A0 # For test phase
> -=C2=A0=C2=A0=C2=A0 qemu-system-riscv
> -
> -# Add compiler path
> -ENV CROSS_COMPILE=3Driscv64-linux-gnu-
> -
> -RUN useradd --create-home user
> -USER user
> -WORKDIR /build
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-
> ci/build.yaml
> index e081664c4e95..4b9d80cc5632 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -357,6 +357,13 @@ debian-12-ppc64le-gcc-debug:
> =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> =C2=A0=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> =C2=A0
> +debian-12-riscv64-gcc-debug:
> +=C2=A0 extends: .gcc-riscv64-cross-build-debug
> +=C2=A0 variables:
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:12-riscv64
> +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> +
> =C2=A0# Arm32 cross-build
> =C2=A0
> =C2=A0debian-bookworm-gcc-arm32:
> @@ -458,41 +465,6 @@ alpine-3.18-gcc-debug-arm64-earlyprintk:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_EARLY_UART_CHOICE_PL011=3Dy
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_EARLY_UART_BASE_ADDRESS=3D0x9=
000000
> =C2=A0
> -# RISC-V 64 cross-build
> -.riscv-fixed-randconfig:
> -=C2=A0 variables: &riscv-fixed-randconfig
> -=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG: |
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_BOOT_TIME_CPUPOOLS=3Dn
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_EXPERT=3Dy
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_PERF_COUNTERS=3Dn
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_LIVEPATCH=3Dn
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_XSM=3Dn
> -
> -archlinux-current-gcc-riscv64:
> -=C2=A0 extends: .gcc-riscv64-cross-build
> -=C2=A0 variables:
> -=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> -=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> -=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> -
> -archlinux-current-gcc-riscv64-debug:
> -=C2=A0 extends: .gcc-riscv64-cross-build-debug
> -=C2=A0 variables:
> -=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> -=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> -=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> -
> -archlinux-current-gcc-riscv64-randconfig:
> -=C2=A0 extends: .gcc-riscv64-cross-build
> -=C2=A0 variables:
> -=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> -=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> -=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> -=C2=A0=C2=A0=C2=A0 <<: *riscv-fixed-randconfig
> -
> =C2=A0# Yocto test jobs
> =C2=A0yocto-qemuarm64:
> =C2=A0=C2=A0 extends: .yocto-test-arm64
> @@ -739,3 +711,44 @@ debian-12-ppc64le-gcc:
> =C2=A0=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: ppc64_defconfig
> =C2=A0=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> =C2=A0
> +# RISC-V 64 cross-build
> +debian-11-riscv64-gcc:
> +=C2=A0 extends: .gcc-riscv64-cross-build
> +=C2=A0 variables:
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:11-riscv64
> +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> +
> +debian-11-riscv64-gcc-debug:
> +=C2=A0 extends: .gcc-riscv64-cross-build-debug
> +=C2=A0 variables:
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:11-riscv64
> +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> +
> +debian-12-riscv64-gcc:
> +=C2=A0 extends: .gcc-riscv64-cross-build
> +=C2=A0 variables:
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:12-riscv64
> +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> +=C2=A0=C2=A0=C2=A0 HYPERVISOR_ONLY: y
> +
> +.riscv-fixed-randconfig:
> +=C2=A0 variables: &riscv-fixed-randconfig
> +=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_BOOT_TIME_CPUPOOLS=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_EXPERT=3Dy
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_PERF_COUNTERS=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_LIVEPATCH=3Dn
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_XSM=3Dn
> +
> +debian-12-riscv64-gcc-randconfig:
> +=C2=A0 extends: .gcc-riscv64-cross-build
> +=C2=A0 variables:
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:12-riscv64
> +=C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> +=C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> +=C2=A0=C2=A0=C2=A0 <<: *riscv-fixed-randconfig
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-
> ci/test.yaml
> index 70c946f87799..f7e1753ead34 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -56,7 +56,7 @@
> =C2=A0.qemu-riscv64:
> =C2=A0=C2=A0 extends: .test-jobs-common
> =C2=A0=C2=A0 variables:
> -=C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> +=C2=A0=C2=A0=C2=A0 CONTAINER: debian:12
> =C2=A0=C2=A0=C2=A0=C2=A0 LOGFILE: qemu-smoke-riscv64.log
> =C2=A0=C2=A0 artifacts:
> =C2=A0=C2=A0=C2=A0=C2=A0 paths:
> @@ -440,7 +440,7 @@ qemu-smoke-riscv64-gcc:
> =C2=A0=C2=A0 script:
> =C2=A0=C2=A0=C2=A0=C2=A0 - ./automation/scripts/qemu-smoke-riscv64.sh 2>&=
1 | tee
> ${LOGFILE}
> =C2=A0=C2=A0 needs:
> -=C2=A0=C2=A0=C2=A0 - archlinux-current-gcc-riscv64-debug
> +=C2=A0=C2=A0=C2=A0 - debian-12-riscv64-gcc-debug
> =C2=A0
> =C2=A0qemu-smoke-ppc64le-powernv9-gcc:
> =C2=A0=C2=A0 extends: .qemu-ppc64le
> diff --git a/automation/scripts/containerize
> b/automation/scripts/containerize
> index 5c3f6782d9cd..6dbf55c8f89a 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -27,12 +27,13 @@ case "_${CONTAINER}" in
> =C2=A0=C2=A0=C2=A0=C2=A0 _alpine) CONTAINER=3D"${BASE}/alpine:3.18" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _alpine-arm64v8) CONTAINER=3D"${BASE}/alpine:3.1=
8-arm64v8" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _archlinux|_arch) CONTAINER=3D"${BASE}/archlinux=
:current" ;;
> -=C2=A0=C2=A0=C2=A0 _riscv64) CONTAINER=3D"${BASE}/archlinux:current-risc=
v64" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _centos7) CONTAINER=3D"${BASE}/centos:7" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _fedora) CONTAINER=3D"${BASE}/fedora:29";;
> =C2=A0=C2=A0=C2=A0=C2=A0 _focal) CONTAINER=3D"${BASE}/ubuntu:focal" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _bullseye-ppc64le) CONTAINER=3D"${BASE}/debian:1=
1-ppc64le" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _bookworm-ppc64le) CONTAINER=3D"${BASE}/debian:1=
2-ppc64le" ;;
> +=C2=A0=C2=A0=C2=A0 _bullseye-riscv64) CONTAINER=3D"${BASE}/debian:11-ris=
cv64" ;;
> +=C2=A0=C2=A0=C2=A0 _bookworm-riscv64) CONTAINER=3D"${BASE}/debian:12-ris=
cv64" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _buster-gcc-ibt) CONTAINER=3D"${BASE}/debian:bus=
ter-gcc-ibt" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _bookworm|_) CONTAINER=3D"${BASE}/debian:bookwor=
m" ;;
> =C2=A0=C2=A0=C2=A0=C2=A0 _bookworm-i386) CONTAINER=3D"${BASE}/debian:book=
worm-i386" ;;


