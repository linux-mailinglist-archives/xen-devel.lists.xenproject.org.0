Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F46ED920
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 02:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525670.816981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6BA-0003BF-Uy; Tue, 25 Apr 2023 00:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525670.816981; Tue, 25 Apr 2023 00:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6BA-00039T-SI; Tue, 25 Apr 2023 00:05:08 +0000
Received: by outflank-mailman (input) for mailman id 525670;
 Tue, 25 Apr 2023 00:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxgq=AQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pr6B9-00039N-3D
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 00:05:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d456b208-e2fc-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 02:05:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A73E6204F;
 Tue, 25 Apr 2023 00:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FC7C433D2;
 Tue, 25 Apr 2023 00:05:02 +0000 (UTC)
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
X-Inumbo-ID: d456b208-e2fc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682381102;
	bh=UZdlInztLLntipbzj0YrWRQPOVmFI//JpMrR4I/LIKs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G70KWCHQyPfk+KXPUwY/Xi4WBformaSxQCIqglkk4Bkp05EhJG81PXwVVEaYQO4jr
	 f4HU0HpCiJyzb8b9swAcev7HY0Cxc+lVoS1sGQDNa6rCDAzwtgi0D3zqq8tv2U4/8a
	 u0pUNPwr357fzxXyaA6jGqD4fkbviqOHRcP7ZZ6weUQfcZ6J2AJooj4fAtYl5J5wZN
	 UgeKkUmkUUUcDq/VVSAh7UryQ0MPWGIiF7+Kx67ljJP3kKjn07qfSLRNVTPS//RsBJ
	 hO9EgxM31PZ5QZ5eHuNTKfxR6hUz6Q7meDHGxZCVhuJ8kUOTXEKcVDa6MqeTTDURjH
	 kyr7jcwDQHMxA==
Date: Mon, 24 Apr 2023 17:05:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/6] automation: specify explicit dom0 mem size for ADL
 tests
In-Reply-To: <acf4e8fbb74715335a08bf2a5a1008a117fec65f.1682369736.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304241704540.3419@ubuntu-linux-20-04-desktop>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com> <acf4e8fbb74715335a08bf2a5a1008a117fec65f.1682369736.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-524689961-1682381102=:3419"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-524689961-1682381102=:3419
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 24 Apr 2023, Marek Marczykowski-Górecki wrote:
> Avoid memory fragmentation that leads to:
> (XEN) common/memory.c:277:d0v10 Could not allocate order=9 extent: id=1 memflags=0xc0 (0 of 4)
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qubes-x86-64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 2d4cf2e2268c..916dbaae59c3 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -123,7 +123,7 @@ TFTP=/scratch/gitlab-runner/tftp
>  CONTROLLER=control@thor.testnet
>  
>  echo '
> -multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all
> +multiboot2 (http)/gitlab-ci/xen console=com1 com1=115200,8n1 loglvl=all guest_loglvl=all dom0_mem=4G
>  module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0
>  module2 (http)/gitlab-ci/initrd-dom0
>  ' > $TFTP/grub.cfg
> -- 
> git-series 0.9.1
> 
--8323329-524689961-1682381102=:3419--

