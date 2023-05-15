Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BF704148
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 01:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534881.832337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyhCe-0004Pj-3g; Mon, 15 May 2023 23:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534881.832337; Mon, 15 May 2023 23:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyhCe-0004MS-0s; Mon, 15 May 2023 23:02:04 +0000
Received: by outflank-mailman (input) for mailman id 534881;
 Mon, 15 May 2023 23:02:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l5iH=BE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyhCc-00046V-U4
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 23:02:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fe5b8f8-f374-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 01:02:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B83263368;
 Mon, 15 May 2023 23:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167E6C433EF;
 Mon, 15 May 2023 23:01:58 +0000 (UTC)
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
X-Inumbo-ID: 7fe5b8f8-f374-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684191719;
	bh=T5QCOnaGDS0SaaGM4Z8iGOwpIhTOi0ryqfRQZhqoHR0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iI8NUGyr/Rax+yKdjGstU/eznhYdPQv9tQTjQwD/V7BUz6F9nEdBKJEBCkByVP517
	 tYz+EubAegPngk0AHDQiph8iXYcUkGjRONE2sqaWEJsig9mkEn+njdBmTrmib4SHlc
	 kbbiRqE2WSInBtacfZ7ij1kM2bbQbsXtEGCrcER7lIFjY2jBCUvnHaOHxUI3jM+jZl
	 dBDCBLvHQABA5SIwbZUn2RKt+jZw1vu3ZQdBgmNRqu8q2StXgJ8LKYVs5IgOGi0fVu
	 drUMT+0p44cwR49TWqZxdJosLmJIZmrq6mMGIdxf4GAw+bygr6kbDHPF4SkwO7vJVw
	 hUY3fKrjH2btw==
Date: Mon, 15 May 2023 16:01:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] automation: remove python2 from opensuse images
In-Reply-To: <20230502200527.5365-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305151533230.4125828@ubuntu-linux-20-04-desktop>
References: <20230502200527.5365-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 May 2023, Olaf Hering wrote:
> The upcoming Leap 15.5 will come without a binary named 'python'.
> Prepare the suse images for that change.
> 
> Starting with Xen 4.14 python3 can be used for build.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/build/suse/opensuse-leap.dockerfile       | 2 --
>  automation/build/suse/opensuse-tumbleweed.dockerfile | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
> index c7973dd6ab..79de83ac20 100644
> --- a/automation/build/suse/opensuse-leap.dockerfile
> +++ b/automation/build/suse/opensuse-leap.dockerfile
> @@ -58,8 +58,6 @@ RUN zypper install -y --no-recommends \
>          'pkgconfig(libpci)' \
>          'pkgconfig(sdl)' \
>          'pkgconfig(sdl2)' \
> -        python \
> -        python-devel \
>          python3-devel \
>          systemd-devel \
>          tar \
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index 7e5f22acef..abb25c8c84 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -61,7 +61,6 @@ RUN zypper install -y --no-recommends \
>          'pkgconfig(libpci)' \
>          'pkgconfig(sdl)' \
>          'pkgconfig(sdl2)' \
> -        python-devel \
>          python3-devel \
>          systemd-devel \
>          tar \
> 

