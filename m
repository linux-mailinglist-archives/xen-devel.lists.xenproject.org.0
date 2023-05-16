Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655FF7059C3
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 23:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535707.833662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2VK-0003si-49; Tue, 16 May 2023 21:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535707.833662; Tue, 16 May 2023 21:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz2VJ-0003qa-VB; Tue, 16 May 2023 21:46:45 +0000
Received: by outflank-mailman (input) for mailman id 535707;
 Tue, 16 May 2023 21:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pz2VI-0003qU-UK
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 21:46:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25028737-f433-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 23:46:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A090B632DB;
 Tue, 16 May 2023 21:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D25C433D2;
 Tue, 16 May 2023 21:46:40 +0000 (UTC)
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
X-Inumbo-ID: 25028737-f433-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684273601;
	bh=Mey66pC3kiYMdWauehQPzA8cXR4e/XLFRAfhNKI+fj0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UGPyWeKlieXVf+Y50IF1pjts3FEI3bFVbNXggTZ4p2dKCPP2u0G1oa9THQowQ+Jgd
	 vaE6Ql2rktdgIvsHbrmNUD2OqmPNy1WE9rfiDRuTaY03Lz46NU8cF6OPDjqGJBgHRD
	 tojRbMgYhBzZr5SOZOzRqo6AW7wkyNDMT5o80sdOcIO/Vv6WixJC8xT1am68XI9WVK
	 dBn1KQ6dGhyszbljFl5YJgXHOn/gQFUde52HJe2EdbP1yX9KJgNdPfwQAsuA2XDCoV
	 fmfYSVtSnMKbH1QIJgiFJekeTrXo3IiJLAWvEpqE/ltK+/6HPyb9s0TTtvCp1jvyyI
	 bqzDYhisgv5TA==
Date: Tue, 16 May 2023 14:46:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: update documentation about how to build
 a container
In-Reply-To: <20230516154127.11622-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305161445570.128889@ubuntu-linux-20-04-desktop>
References: <20230516154127.11622-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 May 2023, Olaf Hering wrote:
> The command used in the example is different from the command used in
> the Gitlab CI pipelines. Adjust it to simulate what will be used by CI.
> This is essentially the build script, which is invoked with a number of
> expected environment variables such as CC, CXX and debug.
> 
> In addition the input should not be a tty, which disables colors from
> meson and interactive questions from kconfig.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/README.md | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/build/README.md b/automation/build/README.md
> index 2d07cafe0e..1c040533fd 100644
> --- a/automation/build/README.md
> +++ b/automation/build/README.md
> @@ -96,7 +96,8 @@ docker login registry.gitlab.com/xen-project/xen
>  make -C automation/build suse/opensuse-tumbleweed
>  env CONTAINER_NO_PULL=1 \
>    CONTAINER=tumbleweed \
> -  automation/scripts/containerize bash -exc './configure && make'
> +  CONTAINER_ARGS='-e CC=gcc -e CXX=g++ -e debug=y' \
> +  automation/scripts/containerize automation/scripts/build < /dev/null
>  make -C automation/build suse/opensuse-tumbleweed PUSH=1
>  ```
>  
> 

