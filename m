Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D5B42E0B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 02:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109224.1458974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utxh9-00077c-EN; Thu, 04 Sep 2025 00:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109224.1458974; Thu, 04 Sep 2025 00:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utxh9-00075d-BJ; Thu, 04 Sep 2025 00:19:19 +0000
Received: by outflank-mailman (input) for mailman id 1109224;
 Thu, 04 Sep 2025 00:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=axuo=3P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1utxh8-00075X-9Z
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 00:19:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca318025-8924-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 02:19:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77A7140A41;
 Thu,  4 Sep 2025 00:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141D3C4CEE7;
 Thu,  4 Sep 2025 00:19:12 +0000 (UTC)
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
X-Inumbo-ID: ca318025-8924-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756945154;
	bh=Vwns9sCZhya6D4JDh1TQ0NJdzpUw5R3lAGOsHD395TY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VVMBTVX84FbG3Vl+PwPOMNjct+wDmo8rEC5A0oO1H2iz4IsXby3hX8eBbYVU8qvOi
	 GzMjdjBLk43/0UQTu53XNxkPvGya8+dmSIuuDsPPKoflZEBMDEC+FrFUod9MUcpfVF
	 sbVnfCha8yrx9oRFq23wPhBJo/I/tI1HOd7LU6o+6lpFHvwzOdMfTp15ZmYvsBDtep
	 h+MK6DGUs5FI88qQ2YLNLuGohcE1uVT/EDytJsqlChYalzgazRICC7BxpXUD+RFgr8
	 HcAotorWKwwU3eqxjG4XmDFD4NxOPVlWJBpOWYOpIIltIBRKl5ykIZllfjlmYM+v9d
	 a+RWOFMeMbmDA==
Date: Wed, 3 Sep 2025 17:19:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1 1/2] automation: call expect script with redirected
 standard error
In-Reply-To: <729708b7e6c1815e7ba9b712f6c847e0a0374fd9.1756834803.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509031719040.1405870@ubuntu-linux-20-04-desktop>
References: <729708b7e6c1815e7ba9b712f6c847e0a0374fd9.1756834803.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-437634610-1756945154=:1405870"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-437634610-1756945154=:1405870
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 2 Sep 2025, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> In the console expect script, "send_error" will send a message to standard
> error. Current use of this script redirects only standard output into a
> pipeline. This causes the error messages to sometimes appear hidden in the
> middle of the test logs.
> 
> Redirect also standard error to clearly show when a test has timed out or hit
> EOF.
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> example of the problem:
>  - https://gitlab.com/xen-project/people/luca.miccio/xen/-/jobs/11136585863#L615
>  - timeout message on line 615 shown before end of log
> note:
>  - I couldn't check the change on cirrus-ci as I don't have access
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  .cirrus.yml                                       | 2 +-
>  automation/scripts/include/xtf-runner             | 2 +-
>  automation/scripts/qemu-alpine-x86_64.sh          | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm32.sh       | 2 +-
>  automation/scripts/qemu-smoke-dom0-arm64.sh       | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm32.sh   | 2 +-
>  automation/scripts/qemu-smoke-dom0less-arm64.sh   | 2 +-
>  automation/scripts/qemu-smoke-ppc64le.sh          | 2 +-
>  automation/scripts/qemu-smoke-riscv64.sh          | 2 +-
>  automation/scripts/qubes-x86-64.sh                | 2 +-
>  automation/scripts/xilinx-smoke-dom0-x86_64.sh    | 2 +-
>  automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 3163ab8f11..f295c8cb0a 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -166,7 +166,7 @@ task:
>      export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
>      export PASSED="Test result: SUCCESS"
>      export TEST_TIMEOUT=120
> -    ./automation/scripts/console.exp | sed 's/\r\+$//'
> +    ./automation/scripts/console.exp |& sed 's/\r\+$//'
> 
>    always:
>      serial_artifacts:
> diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
> index b7fea52dad..43ff2d4d88 100644
> --- a/automation/scripts/include/xtf-runner
> +++ b/automation/scripts/include/xtf-runner
> @@ -114,7 +114,7 @@ function xtf_run_test()
>  {
>      rm -f ${TEST_LOG}
>      export BOOT_MSG PASSED TEST_CMD TEST_LOG UBOOT_CMD
> -    ./console.exp | sed 's/\r\+$//'
> +    ./console.exp |& sed 's/\r\+$//'
>  }
> 
>  # Setup environment and run an XTF test.
> diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> index 746e70483d..c4666b9507 100755
> --- a/automation/scripts/qemu-alpine-x86_64.sh
> +++ b/automation/scripts/qemu-alpine-x86_64.sh
> @@ -84,4 +84,4 @@ export BOOT_MSG="Latest ChangeSet: "
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
> 
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index 4f50eabdef..36c47daa42 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -96,4 +96,4 @@ export BOOT_MSG="Latest ChangeSet: "
>  export LOG_MSG="Domain-0"
>  export PASSED="/ #"
> 
> -../automation/scripts/console.exp | sed 's/\r\+$//'
> +../automation/scripts/console.exp |& sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index d6f6b74880..ee682015a0 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -106,4 +106,4 @@ export TEST_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
> 
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> index 0e2c5496db..e27636dc9e 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
> @@ -149,4 +149,4 @@ export TEST_LOG="${serial_log}"
>  export LOG_MSG="${dom0_prompt}"
>  export PASSED="${passed}"
> 
> -../automation/scripts/console.exp | sed 's/\r\+$//'
> +../automation/scripts/console.exp |& sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> index e7a3e670d0..e660485f3a 100755
> --- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
> @@ -218,4 +218,4 @@ export TEST_LOG="smoke.serial"
>  export LOG_MSG="Welcome to Alpine Linux"
>  export PASSED="${passed}"
> 
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
> index 617096ad1f..119c3ed4d5 100755
> --- a/automation/scripts/qemu-smoke-ppc64le.sh
> +++ b/automation/scripts/qemu-smoke-ppc64le.sh
> @@ -24,4 +24,4 @@ export TEST_CMD="qemu-system-ppc64 \
>  export TEST_LOG="${serial_log}"
>  export PASSED="Hello, ppc64le!"
> 
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
> index 25f9e4190e..c0b1082a08 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,4 +16,4 @@ export TEST_CMD="qemu-system-riscv64 \
>  export TEST_LOG="smoke.serial"
>  export PASSED="All set up"
> 
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index b49a44c5b1..bd939dc948 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -292,7 +292,7 @@ export LOG_MSG="\nWelcome to Alpine Linux"
>  export TEST_CMD="ssh $CONTROLLER console"
>  export TEST_LOG="smoke.serial"
>  export TEST_TIMEOUT="$timeout"
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
>  TEST_RESULT=$?
> 
>  if [ -n "$retrieve_xml" ]; then
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 0ad8f658e3..96f534f3aa 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -173,7 +173,7 @@ export BOOT_MSG="Latest ChangeSet: "
>  export TEST_CMD="cat ${SERIAL_DEV}"
>  export TEST_LOG="smoke.serial"
> 
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
>  TEST_RESULT=$?
>  sh "/scratch/gitlab-runner/${TEST_BOARD}.sh" 2
>  exit ${TEST_RESULT}
> diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> index 1d7162f1b3..a6da7a830c 100755
> --- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
> @@ -137,7 +137,7 @@ export LOG_MSG="Welcome to Alpine Linux"
>  export TEST_CMD="cat ${SERIAL_DEV}"
>  export TEST_LOG="smoke.serial"
> 
> -./automation/scripts/console.exp | sed 's/\r\+$//'
> +./automation/scripts/console.exp |& sed 's/\r\+$//'
>  TEST_RESULT=$?
>  sh "/scratch/gitlab-runner/zcu102.sh" 2
>  exit ${TEST_RESULT}
> --
> 2.50.GIT
> 
--8323329-437634610-1756945154=:1405870--

