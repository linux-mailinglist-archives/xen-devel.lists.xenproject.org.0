Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409B37040E0
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 00:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534859.832280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygZe-0006Hd-2P; Mon, 15 May 2023 22:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534859.832280; Mon, 15 May 2023 22:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygZd-0006Fp-Vl; Mon, 15 May 2023 22:21:45 +0000
Received: by outflank-mailman (input) for mailman id 534859;
 Mon, 15 May 2023 22:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pygZc-0005gJ-Jm
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 22:21:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de45e670-f36e-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 00:21:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A617A60EA2;
 Mon, 15 May 2023 22:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7593DC433D2;
 Mon, 15 May 2023 22:21:40 +0000 (UTC)
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
X-Inumbo-ID: de45e670-f36e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684189301;
	bh=YQ37CjVnde7PRWWVSFrs4uX2zVngO5Ysg5rVND4UD7g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BaiGGzHhDq5LBXFv8qFs1nqKCsPSwvt7nEWk/+eYdQcp2JLVmhRr1x43YLR6yBoLJ
	 WwXho5BntOB8P65V0cqYMPvsMnrhWUfmVEOzvj/Sg3LFvds9LvGO5V+uXSAKuqQrEe
	 76XD5+L2RdUbBadG8vQHpbxR7hkjtMh1025VJLsZJboPCujQdO76tnBSrVF2wiMZ8J
	 G1zmqhe/wFyF3kIiS/FPZzNmronX358lVdsMfvVTVIl9d3GhkguUB5EZyg892zX+c2
	 j99csCzkW9wXCagDEHj5gaMHd5r+ht33ioU+PPuMpCjO/qNkSYvtDWHG77zQ2NhAp+
	 ocCPfj9T/vzEQ==
Date: Mon, 15 May 2023 15:21:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/4] automation: add x86_64 tests on a AMD Zen3+ runner
In-Reply-To: <741648760682e3097a0d984342e5cad9387172cf.1683943670.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2305151444310.4125828@ubuntu-linux-20-04-desktop>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com> <741648760682e3097a0d984342e5cad9387172cf.1683943670.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-679932068-1684187077=:4125828"
Content-ID: <alpine.DEB.2.22.394.2305151506450.4125828@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-679932068-1684187077=:4125828
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305151506451.4125828@ubuntu-linux-20-04-desktop>

On Sat, 13 May 2023, Marek Marczykowski-Górecki wrote:
> This adds another physical runner to Gitlab-CI, running similar set of
> jobs that the Adler Lake one.
> 
> The machine specifically is
> MinisForum UM773 Lite with AMD Ryzen 7 7735HS
> 
> The PV passthrough test is skipped as currently it fails on this system
> with:
> (d1) Can't find new memory area for initrd needed due to E820 map conflict
> 
> The S3 test is skipped as it currently fails - the system seems to
> suspend properly (power LED blinks), but when woken up the power LED
> gets back to solid on and the fan spins at top speed and but otherwise there is no
> signs of if life from the system (no output on the console, HDMI or
> anything else).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index cb7fd5c272e9..81d027532cca 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -108,6 +108,16 @@
>    tags:
>      - qubes-hw2
>  
> +.zen3p-x86-64:
> +  # it's really similar to the above
> +  extends: .adl-x86-64
> +  variables:
> +    PCIDEV: "01:00.0"
> +    PCIDEV_INTR: "MSI-X"
> +    CONSOLE_OPTS: "console=com1 com1=115200,8n1,pci,msi"
> +  tags:
> +    - qubes-hw11
> +
>  # Test jobs
>  build-each-commit-gcc:
>    extends: .test-jobs-common
> @@ -176,6 +186,22 @@ adl-pci-hvm-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.12-gcc-debug
>  
> +zen3p-smoke-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc-debug
> +
> +zen3p-pci-hvm-x86-64-gcc-debug:
> +  extends: .zen3p-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc-debug
> +
>  qemu-smoke-dom0-arm64-gcc:
>    extends: .qemu-arm64
>    script:
> -- 
> git-series 0.9.1
> 
--8323329-679932068-1684187077=:4125828--

