Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFDF7040E2
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 00:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534857.832260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygZP-0005ih-KM; Mon, 15 May 2023 22:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534857.832260; Mon, 15 May 2023 22:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pygZP-0005gR-He; Mon, 15 May 2023 22:21:31 +0000
Received: by outflank-mailman (input) for mailman id 534857;
 Mon, 15 May 2023 22:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pygZO-0005gJ-46
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 22:21:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3cbc712-f36e-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 00:21:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6D9B623F6;
 Mon, 15 May 2023 22:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB68EC433EF;
 Mon, 15 May 2023 22:21:22 +0000 (UTC)
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
X-Inumbo-ID: d3cbc712-f36e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684189283;
	bh=l2rGpzaxcY3qDYucSpAYy4CV3h6TeMhP0McvT7p5qj8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jHiCXCx3GSBItjIPKcAjV2WHKL0ffGR5TY6SNu1lJWYXTmUAxJJD4I+CIIwBq+Ey7
	 nWrmQRAQrFljWHuUsV7ymFwDfFGKt2pUDoQ90APMVCV4yK0w6I1NgIp5OrZnJYE9VR
	 lTaf5OSkBHJ1g26s5b5oXOkaKKKwfPhBDeAY0DOSwBbICaufinEc9L4zXSQ0zr8czD
	 F1vfjgQaQ6szthyuoEJe0ggMQpdFSvyktRJBFnjYjlECPn97Xijc1Hnr3FRcvSOkTI
	 Jk+GhzAb8wT6C31Nu2IkoByG791eLG9Cqg0MwccYZ9dVI4psa/ANiu4SGv7b0MF/0m
	 hegE738pf2pFg==
Date: Mon, 15 May 2023 15:21:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/4] automation: make console options configurable via
 variables
In-Reply-To: <e0504797d1b3758c035cd82b2dc3b00d747ddcc8.1683943670.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2305151441550.4125828@ubuntu-linux-20-04-desktop>
References: <cover.83768735557180cd65fb5f932c285271063e04ac.1683943670.git-series.marmarek@invisiblethingslab.com> <e0504797d1b3758c035cd82b2dc3b00d747ddcc8.1683943670.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-7102064-1684186921=:4125828"
Content-ID: <alpine.DEB.2.22.394.2305151521180.4125828@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-7102064-1684186921=:4125828
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305151521181.4125828@ubuntu-linux-20-04-desktop>

On Sat, 13 May 2023, Marek Marczykowski-Górecki wrote:
> This makes the test script easier reusable for different runners, where
> console may be connected differently. Include both console= option and
> configuration for specific chosen console too (like com1= here) in the
> 'CONSOLE_OPTS' variable.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This will conflict with Stefano's patch, as both modify multiboot2 line,
> but it shouldn't be too hard to resolve the conflict manually (both
> replace console opts with a variable, and add extra opts at the end).
> ---
>  automation/gitlab-ci/test.yaml     | 1 +
>  automation/scripts/qubes-x86-64.sh | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 55ca0c27dc49..cb7fd5c272e9 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -96,6 +96,7 @@
>      LOGFILE: smoke-test.log
>      PCIDEV: "03:00.0"
>      PCIDEV_INTR: "MSI-X"
> +    CONSOLE_OPTS: "console=com1 com1=115200,8n1"
>    artifacts:
>      paths:
>        - smoke.serial
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 056faf9e6de8..ae766395d184 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -184,11 +184,11 @@ cd ..
>  TFTP=/scratch/gitlab-runner/tftp
>  CONTROLLER=control@thor.testnet
>  
> -echo '
> -multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G
> +echo "
> +multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G
>  module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
>  module2 (http)/gitlab-ci/initrd-dom0
> -' > $TFTP/grub.cfg
> +" > $TFTP/grub.cfg
>  
>  cp -f binaries/xen $TFTP/xen
>  cp -f binaries/bzImage $TFTP/vmlinuz
> -- 
> git-series 0.9.1
> 
--8323329-7102064-1684186921=:4125828--

