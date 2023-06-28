Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C05741BE6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 00:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556613.869279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEduO-0000lO-L0; Wed, 28 Jun 2023 22:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556613.869279; Wed, 28 Jun 2023 22:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEduO-0000id-IL; Wed, 28 Jun 2023 22:45:08 +0000
Received: by outflank-mailman (input) for mailman id 556613;
 Wed, 28 Jun 2023 22:45:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzH+=CQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qEduN-0000h0-6U
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 22:45:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b814295-1605-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 00:45:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AA8361489;
 Wed, 28 Jun 2023 22:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02690C433CA;
 Wed, 28 Jun 2023 22:45:00 +0000 (UTC)
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
X-Inumbo-ID: 6b814295-1605-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687992302;
	bh=6whENEwABsMRkExAukDa7ytNyweNg9fMwkbBSEHMAuM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fMelqwfNHbxTlb2I4Ii1sRzj6OZhpkhb+9U+XXgE8/kqhK4fWHr8VeEHVfautvm1y
	 jPjtLEA/DEiKxk4IMSWY7ExinF41R3AU/RROgVLOwh1sTGkE619Pz2ZDepV6hLvmrb
	 eLrSmuA+w+55kJtPAh/HXHYCuOL6yy4f8hvHJxOUc+5W7urHp0qVLpRxzwOKgnKTzF
	 MXdcNlydoBJgHHL6+fDzloAnNCbQffl6U+BJSCHTTSqsZREQuob5Bl+V6K+E/aNArt
	 ySeuoC6lk8jZY26MQbcgScA5/A7WFW0+0kbHd33dG56qFJaUNUgho3V3iv3+aRwCw4
	 74rik8Mn+ZEig==
Date: Wed, 28 Jun 2023 15:44:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Shawn Anastasio <sanastasio@raptorengineering.com>
cc: xen-devel@lists.xenproject.org, 
    Timothy Pearson <tpearson@raptorengineering.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/3] automation: Add smoke test for ppc64le
In-Reply-To: <f53737937af74dd9844bff07b5886121070a9d28.1687466822.git.sanastasio@raptorengineering.com>
Message-ID: <alpine.DEB.2.22.394.2306281544380.3936094@ubuntu-linux-20-04-desktop>
References: <cover.1687466822.git.sanastasio@raptorengineering.com> <f53737937af74dd9844bff07b5886121070a9d28.1687466822.git.sanastasio@raptorengineering.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Jun 2023, Shawn Anastasio wrote:
> Add an initial smoke test that boots xen on a ppc64/pseries machine and
> checks for a magic string. Based on the riscv smoke test.
> 
> Eventually the powernv9 (POWER9 bare metal) machine type will want to be
> tested as well, but for now we only boot on pseries.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml           | 20 ++++++++++++++++++
>  automation/scripts/qemu-smoke-ppc64le.sh | 27 ++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100755 automation/scripts/qemu-smoke-ppc64le.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index d5cb238b0a..45e8ddb7a3 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -71,6 +71,19 @@
>    tags:
>      - x86_64
>  
> +.qemu-ppc64le:
> +  extends: .test-jobs-common
> +  variables:
> +    CONTAINER: debian:bullseye-ppc64le
> +    LOGFILE: qemu-smoke-ppc64le.log
> +  artifacts:
> +    paths:
> +      - smoke.serial
> +      - '*.log'
> +    when: always
> +  tags:
> +    - x86_64
> +
>  .xilinx-arm64:
>    extends: .test-jobs-common
>    variables:
> @@ -444,3 +457,10 @@ qemu-smoke-riscv64-gcc:
>      - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
>    needs:
>      - archlinux-current-gcc-riscv64-debug
> +
> +qemu-smoke-ppc64le-pseries-gcc:
> +  extends: .qemu-ppc64le
> +  script:
> +    - ./automation/scripts/qemu-smoke-ppc64le.sh pseries-5.2 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - debian-bullseye-gcc-ppc64le-debug
> diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
> new file mode 100755
> index 0000000000..eb55221221
> --- /dev/null
> +++ b/automation/scripts/qemu-smoke-ppc64le.sh
> @@ -0,0 +1,27 @@
> +#!/bin/bash
> +
> +set -ex
> +
> +# machine type from first arg passed directly to qemu -M
> +machine=$1
> +
> +# Run the test
> +rm -f smoke.serial
> +set +e
> +
> +touch smoke.serial
> +
> +timeout -k 1 20 \
> +qemu-system-ppc64 \
> +    -M $machine \
> +    -m 2g \
> +    -smp 1 \
> +    -vga none \
> +    -monitor none \
> +    -nographic \
> +    -serial file:smoke.serial \
> +    -kernel binaries/xen
> +
> +set -e
> +(grep -q "Hello, ppc64le!" smoke.serial) || exit 1
> +exit 0
> -- 
> 2.30.2
> 

