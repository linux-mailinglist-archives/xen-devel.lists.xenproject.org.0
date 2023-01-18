Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E6670FBE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 02:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480055.744230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHx30-00061E-DR; Wed, 18 Jan 2023 01:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480055.744230; Wed, 18 Jan 2023 01:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHx30-0005yc-Ai; Wed, 18 Jan 2023 01:15:26 +0000
Received: by outflank-mailman (input) for mailman id 480055;
 Wed, 18 Jan 2023 01:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0ll=5P=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pHx2y-0005yW-8U
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 01:15:24 +0000
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [2607:f8b0:4864:20::a34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9493945c-96cd-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 02:15:23 +0100 (CET)
Received: by mail-vk1-xa34.google.com with SMTP id q141so13093428vkb.13
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 17:15:23 -0800 (PST)
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
X-Inumbo-ID: 9493945c-96cd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PPNOF5NzVVkBSS2fDP/+kOC4Q5RSuajK6z5SUgAz4jA=;
        b=AYSAqvqczE9H2Rc5MS29rCoDC2LrtrSBu/GPIJgh6N2BacPJLe0hX2ZtaesZijOTSu
         Pxra9JfXlBXEqmyG602DpWdT2kOwZ/iOSGyoqGIK4OIaF3rbw2X4Eauym2OBQJoIwdG/
         51BgGsdlcUy3+ynE6U2RXpZemrqw5XMRGHNaDTRUMQu1kcywOQb3dRMIJPvMVWww9duV
         thIvnXw93nYlUySlpwAhSMr5Ui5yYWbvZ30bdrBfzB4GuAtS4iwZa/JyV8clfdaH5Z3H
         HVK/gEJYYA/a7fV4NT2vc2MemOwBSCc+EqFAWvxr4tEi5wjKoaPAYQwsNvPVHbDomfpF
         TuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPNOF5NzVVkBSS2fDP/+kOC4Q5RSuajK6z5SUgAz4jA=;
        b=ZU715gbZ9JFshkT0zq+OLbuRYZIyLDoTaOsa5c0SMjbS180xuhXQ02Zoh3511nVlM0
         Rb1MlL1j+LT2EdbDXCZKY4Ui0Imqq7WTwmV9mKgTB8cRUK9af9uLP0X8A8FAM7k8+kvv
         Ypzvpk2OXUQ3PdN+1gYCSr+8pt49kIuhSt3+itZpaQGwL5f/e7TdybkkQ51iSYt4RrkY
         4UwV7+I17j5UkA39/GyfxeBPaTLWZEZYGLFfaCTjrt5/74iqtNY3qBNSriYMP7cgLf92
         T6/a8SVU/e/en+e2N/W7go2hYjWZmg0OXSxD5LXoe0lSiU8DyVvR0zVavkmz0f/FnWaR
         bjgg==
X-Gm-Message-State: AFqh2korp6wXz02tqmXfXiG/g0YP7YdQkDm58VNdPlACjJFk/uH7NwgV
	yXM/vB/lEEkQB6VZ0lUL2G48Je6zwZ7NPZ6Crz8=
X-Google-Smtp-Source: AMrXdXsD4EoR226TtYLLEYae1B+7q2GjlCKBNTF7Y1+z0nZfhXhm9XXF0X+ZzhEW4Y62VJkz3IMiFt1iajNdfWxtkGU=
X-Received: by 2002:a1f:a7ca:0:b0:3d5:86ff:6638 with SMTP id
 q193-20020a1fa7ca000000b003d586ff6638mr733643vke.30.1674004521937; Tue, 17
 Jan 2023 17:15:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673877778.git.oleksii.kurochko@gmail.com> <216c21039a5552a329178b4376ff53ba16cf6104.1673877778.git.oleksii.kurochko@gmail.com>
In-Reply-To: <216c21039a5552a329178b4376ff53ba16cf6104.1673877778.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Jan 2023 11:14:55 +1000
Message-ID: <CAKmqyKNKsQdFEWsu7RZdv4mWvoK959Uk9ZH71RDE2EYJ76ei5w@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] automation: add RISC-V smoke test
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 17, 2023 at 12:40 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Add check if there is a message 'Hello from C env' presents
> in log file to be sure that stack is set and C part of early printk
> is working.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V4:
>     - Nothing changed
> ---
> Changes in V3:
>     - Nothing changed
>     - All mentioned comments by Stefano in Xen mailing list will be
>       fixed as a separate patch out of this patch series.
> ---
>  automation/gitlab-ci/test.yaml           | 20 ++++++++++++++++++++
>  automation/scripts/qemu-smoke-riscv64.sh | 20 ++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
>
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index afd80adfe1..64f47a0ab9 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -54,6 +54,19 @@
>    tags:
>      - x86_64
>
> +.qemu-riscv64:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: archlinux:riscv64
> +    LOGFILE: qemu-smoke-riscv64.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - x86_64
> +
>  .yocto-test:
>    extends: .test-jobs-common
>    script:
> @@ -234,6 +247,13 @@ qemu-smoke-x86-64-clang-pvh:
>    needs:
>      - debian-unstable-clang-debug
>
> +qemu-smoke-riscv64-gcc:
> +  extends: .qemu-riscv64
> +  script:
> +    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - riscv64-cross-gcc
> +
>  # Yocto test jobs
>  yocto-qemuarm64:
>    extends: .yocto-test-arm64
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> new file mode 100755
> index 0000000000..e0f06360bc
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +# Run the test
> +rm -f smoke.serial
> +set +e
> +
> +timeout -k 1 2 \
> +qemu-system-riscv64 \
> +    -M virt \
> +    -smp 1 \
> +    -nographic \
> +    -m 2g \
> +    -kernel binaries/xen \
> +    |& tee smoke.serial
> +
> +set -e
> +(grep -q "Hello from C env" smoke.serial) || exit 1
> +exit 0
> --
> 2.39.0
>
>

