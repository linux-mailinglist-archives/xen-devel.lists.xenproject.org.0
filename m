Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A3CB17E4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182381.1505266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT85J-0005y5-JZ; Wed, 10 Dec 2025 00:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182381.1505266; Wed, 10 Dec 2025 00:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT85J-0005vX-H1; Wed, 10 Dec 2025 00:29:37 +0000
Received: by outflank-mailman (input) for mailman id 1182381;
 Wed, 10 Dec 2025 00:29:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT85I-0005kp-17
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:29:36 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bffb5cd-d55f-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 01:29:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7209F43E52;
 Wed, 10 Dec 2025 00:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B08C4CEF5;
 Wed, 10 Dec 2025 00:29:30 +0000 (UTC)
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
X-Inumbo-ID: 4bffb5cd-d55f-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326571;
	bh=1mmUDbCAoNFoL5RBY/1GzIGyRbKZZbVL5YZQY3bBrKo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kBD66QNeFC5bb6Gr++YrtfGNkryuSTHhOVey2hQwqPzm5LpMI9XAvqW/viRt+OKBf
	 8S0cvwCpif8U8pphamkoPxbwHWyjb41PSMuxQqml33bFe+OyLa8zOtMhxElgL+5H3Y
	 h8j9o1PDnkBCzYiZNK0yOxAf2Hc4RvjlJtGOqQAkByIXXME7hFWt8slVbhZE8qchIV
	 xrt8WkL5uz+jeokCqR7VxaHksmzsu9q9BFNSuKGEkiptWNcQE6GEa66OfRkJKMRwRP
	 0r37GqcDglNdyabxU4+rCsTGIl1qM3m5cltA1hqDom1nL47McNkKt2GN9TmwApy1Oi
	 MH4eddUxcrNHA==
Date: Tue, 9 Dec 2025 16:29:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 08/12] Save Linux config to artifacts too
In-Reply-To: <7c4a97691fb1c2fb88e169205ee768773bbf0603.1764866136.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091629220.19429@ubuntu-linux-20-04-desktop>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com> <7c4a97691fb1c2fb88e169205ee768773bbf0603.1764866136.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-436179441-1765326571=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-436179441-1765326571=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Dec 2025, Marek Marczykowski-Górecki wrote:
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  scripts/build-linux.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
> index 1fc96d1..80cc8a5 100755
> --- a/scripts/build-linux.sh
> +++ b/scripts/build-linux.sh
> @@ -50,6 +50,8 @@ esac
>  
>  make olddefconfig
>  
> +cp .config "${COPYDIR}/linux.config"
> +
>  case $UNAME in
>      x86_64)
>          make -j$(nproc) bzImage
> -- 
> git-series 0.9.1
> 
--8323329-436179441-1765326571=:19429--

