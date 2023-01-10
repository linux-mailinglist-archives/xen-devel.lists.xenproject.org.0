Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994B9663739
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 03:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474210.735239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF4GL-00025I-Tl; Tue, 10 Jan 2023 02:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474210.735239; Tue, 10 Jan 2023 02:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF4GL-00022Z-Ql; Tue, 10 Jan 2023 02:21:17 +0000
Received: by outflank-mailman (input) for mailman id 474210;
 Tue, 10 Jan 2023 02:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHhn=5H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pF4GK-00022A-5b
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 02:21:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73fe561a-908d-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 03:21:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 842C4B810A8;
 Tue, 10 Jan 2023 02:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EB7C433D2;
 Tue, 10 Jan 2023 02:21:09 +0000 (UTC)
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
X-Inumbo-ID: 73fe561a-908d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673317271;
	bh=g98YC6afw2raunyf2JttUHkwKLNQSW/goayP6h1YPKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I1+3tbcPXAch+Pit8m90QWM0vPTyjHqH/XbzasS06NVatE1ntE1H1uCr69rjcC69Q
	 HL2TInNRiMHt48M0O8wMa6udz/CKxEzf32pQWs3BnZj6ug9fDPyMDFthSfCrYkDDx7
	 n2WgNfNI0mgs6TjnB9rEV/S/vkpTEJYzPQ6a4tRvlzxa7EvTbhc21X1z31jSoTFuYt
	 TAAH99giAKAPRMY55xYb8eJHi1euKvtv9Wq1Rhhj3ePIOcxCCi6wyJFf4QxXCVw8Mg
	 p7kg1C5+e8UmiWIgIiiD2P+0Jobgq3+VqBNB8UZ2naf0qKSTafNR1iq/8ohCFLpaWL
	 snN6mdgeSksCg==
Date: Mon, 9 Jan 2023 18:21:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Gianluca Guida <gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 8/8] automation: add RISC-V smoke test
In-Reply-To: <494c2fd1e046de20c2fa24be3989cc6adde8fdbe.1673278109.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2301091820580.1342743@ubuntu-linux-20-04-desktop>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com> <494c2fd1e046de20c2fa24be3989cc6adde8fdbe.1673278109.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Jan 2023, Oleksii Kurochko wrote:
> Add check if there is a message 'Hello from C env' presents
> in log file to be sure that stack is set and C part of early printk
> is working.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>     - Move changes in the dockerfile to separate patch and  send it to
>       mailing list separately:
>         [PATCH] automation: add qemu-system-riscv to riscv64.dockerfile
>     - Update test.yaml to wire up smoke test
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

I realize that it is committed now, but following the arm32 convention
the name of the arch container (currently archlinux:riscv64) would be:

CONTAINER: archlinux:current-riscv64

I know this is not related to this patch, but I am taking the
opportunity to mention it now in case we get an opportunity to fix it in
the future for consistency.


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

Similarly here the "needs" dependency should be called
arch-current-gcc-riscv for consistency with arm32.

Basically we already have a crossbuild and crosstest environment up and
running in gitlab-ci and it is the one for arm32. You can just base all
the naming convention on that.

I realize that riscv64-cross-gcc is also already exported by build.yaml,
but I am mentioning it in case we get an opportunity to fix it in the
future.

Nonetheless this patch on its own is OK so

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



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
> 2.38.1
> 

