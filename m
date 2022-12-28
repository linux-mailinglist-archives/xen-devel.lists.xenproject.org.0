Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3D6572E1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 05:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469447.728820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAOTZ-0000RE-OK; Wed, 28 Dec 2022 04:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469447.728820; Wed, 28 Dec 2022 04:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAOTZ-0000Or-LZ; Wed, 28 Dec 2022 04:55:37 +0000
Received: by outflank-mailman (input) for mailman id 469447;
 Wed, 28 Dec 2022 04:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lbo=42=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pAOTY-0000Ol-0C
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 04:55:36 +0000
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [2607:f8b0:4864:20::a32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcd01e16-866b-11ed-8fd4-01056ac49cbb;
 Wed, 28 Dec 2022 05:55:35 +0100 (CET)
Received: by mail-vk1-xa32.google.com with SMTP id i84so120508vke.7
 for <xen-devel@lists.xenproject.org>; Tue, 27 Dec 2022 20:55:34 -0800 (PST)
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
X-Inumbo-ID: dcd01e16-866b-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xyaZqgnWEWqsnaCpRBxvnVywkzHqhPIlI8PTDj6813g=;
        b=j7xeOOMvgyTtIyjH5sqOW389Q5kpJ1a+j7HyEWd9sOJzusc+f7kskdlLdIeZAc8T7r
         btQqTKMYl7ztZ0A0hq3JStpkqi2GKjGcP0bWgNPPBGie5jFn3JuiJ9TPDjd8nzOWqntc
         V0KHnBW8AsgJLhGOCuED+LWqesFOpWEhfLuyrHWMx5/kwEBNYe5UsakbUhhtjAfZ+zj0
         183Jo2uncR7hcSTcBxO+tJOdAa5DyWoADYW/l2DUsdGxvJyJyxGGF+lRwrNrnMY2poAC
         T5NIqS6hDk9K3m5fzWRAt1FjyVlee9Ii37xmP53emyWcSZYsIWeQZs+LpWXc6aT7Pvj9
         Emjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyaZqgnWEWqsnaCpRBxvnVywkzHqhPIlI8PTDj6813g=;
        b=Ej0ArRZBmvWr1mc2RjA1xRdXzrmxlVYRm4bWRQEIQGm+75sR5eLwjIf5e/Ye0d6pcp
         UM9BdmOo077oaL1w3KTXpejPLddhfV4kglaj+T6Tq6465iJ67KUFn+sc1yAM6NEDYdmL
         IQ9PeE0IAmT9metcFxNt4fTkxGhZrV1nx32lEzikCPqcDT/YWueoYopmHWGpX3dXgyDa
         yjVCtd7nbLrtaf3X92ZzbssSya0x0LbeR0jCVWpYbkf22cZH6U7TNXR+HXY8JxuuVc8s
         dSiuZVBZMjNxUb80mtvmvEF7ceUNJXpuJyHZq2/T7xCkllyu0od7BWlbLMXSyeXWEI+g
         C2CA==
X-Gm-Message-State: AFqh2kpqFX/E/yfEZkjXfWBR3JmluH28Zws/Ql4BM+zIB7hHUwR+rODc
	A2lSiRWgkPBFQotddYRWHL+w3/3qkJsZu3atMDM=
X-Google-Smtp-Source: AMrXdXuKbF6Mtrvj6Q6Uk/TyUzH0HKLL1Fobur6v2W+w/pStaOm0JjS+E6RuaWTk3xaoLzKCUbi75QwMt0dP5TTTW7E=
X-Received: by 2002:a1f:ab86:0:b0:3d5:5f93:53f with SMTP id
 u128-20020a1fab86000000b003d55f93053fmr887543vke.7.1672203333783; Tue, 27 Dec
 2022 20:55:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671789736.git.oleksii.kurochko@gmail.com> <c16097445ce25700b3464d3813c7cbc69d998dd7.1671789736.git.oleksii.kurochko@gmail.com>
In-Reply-To: <c16097445ce25700b3464d3813c7cbc69d998dd7.1671789736.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:55:07 +1000
Message-ID: <CAKmqyKP4=-m2+PK2v+tTsSRPFkV8z=aQSJQqAZsOSw2WELNR5A@mail.gmail.com>
Subject: Re: [XEN PATCH v1 4/4] automation: add RISC-V 64 cross-build tests
 for Xen
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 23, 2022 at 9:17 PM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Add build jobs to cross-compile Xen-only for RISC-V 64.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  automation/gitlab-ci/build.yaml | 43 +++++++++++++++++++++++++++++++++
>  automation/scripts/build        |  4 +--
>  2 files changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index 93d9ff69a9..d97b2aa788 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -172,6 +172,33 @@
>    variables:
>      <<: *gcc
>
> +.riscv64-cross-build-tmpl:
> +  <<: *build
> +  variables:
> +    XEN_TARGET_ARCH: riscv64
> +  tags:
> +    - x86_64
> +
> +.riscv64-cross-build:
> +  extends: .riscv64-cross-build-tmpl
> +  variables:
> +    debug: n
> +
> +.riscv64-cross-build-debug:
> +  extends: .riscv64-cross-build-tmpl
> +  variables:
> +    debug: y
> +
> +.gcc-riscv64-cross-build:
> +  extends: .riscv64-cross-build
> +  variables:
> +    <<: *gcc
> +
> +.gcc-riscv64-cross-build-debug:
> +  extends: .riscv64-cross-build-debug
> +  variables:
> +    <<: *gcc
> +
>  # Jobs below this line
>
>  archlinux-gcc:
> @@ -615,6 +642,19 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
>      EXTRA_XEN_CONFIG: |
>        CONFIG_BOOT_TIME_CPUPOOLS=y
>
> +# RISC-V 64 cross-build
> +riscv64-cross-gcc:
> +  extends: .gcc-riscv64-cross-build
> +  variables:
> +    CONTAINER: archlinux:riscv64
> +    KBUILD_DEFCONFIG: tiny64_defconfig
> +
> +riscv64-cross-gcc-debug:
> +  extends: .gcc-riscv64-cross-build-debug
> +  variables:
> +    CONTAINER: archlinux:riscv64
> +    KBUILD_DEFCONFIG: tiny64_defconfig
> +
>  ## Test artifacts common
>
>  .test-jobs-artifact-common:
> @@ -690,3 +730,6 @@ kernel-5.10.74-export:
>        - binaries/bzImage
>    tags:
>      - x86_64
> +
> +# # RISC-V 64 test artificats
> +# # TODO: add RISC-V 64 test artitifacts
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 026f480e76..d0632a2bd5 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -34,8 +34,8 @@ fi
>  # to exit early -- bash is invoked with -e.
>  cp xen/.config xen-config
>
> -# arm32 only cross-compiles the hypervisor
> -if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
> +# arm32 & riscv64 only cross-compiles the hypervisor
> +if [[ "${XEN_TARGET_ARCH}" = "arm32" ]] || [[ "${XEN_TARGET_ARCH}" = "riscv64" ]]; then
>      hypervisor_only="y"
>  fi
>
> --
> 2.38.1
>
>

