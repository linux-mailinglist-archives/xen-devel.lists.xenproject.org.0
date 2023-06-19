Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E32735DD8
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 21:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551340.860843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBKUx-0000zx-6s; Mon, 19 Jun 2023 19:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551340.860843; Mon, 19 Jun 2023 19:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBKUx-0000y1-2z; Mon, 19 Jun 2023 19:25:11 +0000
Received: by outflank-mailman (input) for mailman id 551340;
 Mon, 19 Jun 2023 19:25:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P44/=CH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBKUv-0000xv-TF
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 19:25:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe77e6f9-0ed6-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 21:25:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9855F60B9B;
 Mon, 19 Jun 2023 19:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E358C433C8;
 Mon, 19 Jun 2023 19:25:03 +0000 (UTC)
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
X-Inumbo-ID: fe77e6f9-0ed6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687202704;
	bh=pZ/kXopfVD037XS0xrFqyapXOBKgNI8KM7/X6+lR2HQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sjV40sy0A9SLmvvllEMlrd81YHbNMSR6m4a+jaaOSz8dqwHM3o8c1WmSEtKSDL229
	 VHw4JUOpRqmSMtj9+2C/azzsWb7OAavdE3jf55P15v0DhbvWYb4bHge1vIkBhVW7uU
	 GgN513dRfw9nmPsTNkJaD+pcW2Frpx9jD/rfUCyx6gs5eKsWQ6FvlrQiTyxgdbro3H
	 vpRN0mFlv6CaL7ID2E3I+hNgx1Kq083eZloNvexT4oq64DZI2DnlOVNV7V+wlquzgC
	 31fJ0YN/YRoiEVRd7B6mZl//m6AFBsB8OCOGA58q1pDbn9c3TZYLbqEW36QKQQ2Ao/
	 CeKgfuwz+Uylw==
Date: Mon, 19 Jun 2023 12:25:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: Disable QEMU build with Clang older than
 10.0
In-Reply-To: <20230619090932.47957-1-anthony.perard@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2306191224500.897208@ubuntu-linux-20-04-desktop>
References: <20230619090932.47957-1-anthony.perard@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Jun 2023, Anthony PERARD wrote:
> Since QEMU commit 74a1b256d775 ("configure: Bump minimum Clang version
> to 10.0"), or QEMU v8.0, Clang 10.0 is now the minimum to build QEMU.
> 
> QEMU 8.0 fails to build on Ubuntu Bionic.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Notes:
>     I've tested that change here, with QEMU v8.0.2:
>     https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/902576734
> 
>  automation/scripts/build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 38c48ae6d8..b4edcf010e 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -78,7 +78,9 @@ else
>      fi
>  
>      # Qemu requires Python 3.5 or later, and ninja
> +    # and Clang 10 or later
>      if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))" \
> +            || [[ "$cc_is_clang" == y && "$cc_ver" -lt 0x0a0000 ]] \
>              || ! type ninja; then
>          cfgargs+=("--with-system-qemu=/bin/false")
>      fi
> -- 
> Anthony PERARD
> 

