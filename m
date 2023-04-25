Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DD6ED921
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 02:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525672.816991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6Ba-0003cC-7w; Tue, 25 Apr 2023 00:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525672.816991; Tue, 25 Apr 2023 00:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6Ba-0003Zg-54; Tue, 25 Apr 2023 00:05:34 +0000
Received: by outflank-mailman (input) for mailman id 525672;
 Tue, 25 Apr 2023 00:05:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxgq=AQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pr6BY-00039N-NE
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 00:05:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3eb781e-e2fc-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 02:05:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEB3C62A5F;
 Tue, 25 Apr 2023 00:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6AAC433D2;
 Tue, 25 Apr 2023 00:05:28 +0000 (UTC)
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
X-Inumbo-ID: e3eb781e-e2fc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682381129;
	bh=tkCFMyrSnqU8AEP8i6iAq1EIpo3gAx4yz8CUZwj2ZCA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XlWkZVvYtm4lJ+Is46VO/xyh5p+c5mHCjhUjnN4xfSb4vYAildg+VWAAWThAEJjlv
	 Q1wUx5b8Xlb6vpCQt/Wyfn1TxhXPPNtHhx6G30Qmy5yR9uNAGYBE/nF4ZgzK2aXOVX
	 2VzHMjc/fDmAGwc0xeZ7vhtHzTFq9+HtnwViWTr/3u/Gfw0KcAtd+UrI7sxYd2oPuY
	 tvXbtgfafGdDipqbP3D71j3tPEIwIsRMXrZct2tbkkqWrsFnA+/t5mVfwuUz7eLvz1
	 7SGi45uORFD2S/Ug2i51ZHsWPizmb1nMpU79ZInxOc+JQgS79t8VYWo9oB8uWN5PV6
	 FcIz+deO5kafQ==
Date: Mon, 24 Apr 2023 17:05:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/6] automation: add runtime qemu dependencies to test
 container
In-Reply-To: <a2f2c836e7f444d733f8ce4c1c23fc6be1dc7726.1682369736.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304241705150.3419@ubuntu-linux-20-04-desktop>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com> <a2f2c836e7f444d733f8ce4c1c23fc6be1dc7726.1682369736.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-813443502-1682381120=:3419"
Content-ID: <alpine.DEB.2.22.394.2304241705260.3419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-813443502-1682381120=:3419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304241705261.3419@ubuntu-linux-20-04-desktop>

On Mon, 24 Apr 2023, Marek Marczykowski-Górecki wrote:
> This is necessary to start HVM guests in subsequent tests.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/tests-artifacts/alpine/3.12.dockerfile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/tests-artifacts/alpine/3.12.dockerfile b/automation/tests-artifacts/alpine/3.12.dockerfile
> index b3909996b47b..073f16a0d70a 100644
> --- a/automation/tests-artifacts/alpine/3.12.dockerfile
> +++ b/automation/tests-artifacts/alpine/3.12.dockerfile
> @@ -13,6 +13,7 @@ RUN \
>    \
>    # xen runtime deps
>    apk add musl && \
> +  apk add libgcc && \
>    apk add openrc && \
>    apk add busybox && \
>    apk add sudo && \
> -- 
> git-series 0.9.1
> 
--8323329-813443502-1682381120=:3419--

