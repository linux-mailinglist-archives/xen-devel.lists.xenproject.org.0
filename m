Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4722A7B44D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937624.1338550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0V3D-0004OL-Hf; Fri, 04 Apr 2025 00:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937624.1338550; Fri, 04 Apr 2025 00:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0V3D-0004Mq-F1; Fri, 04 Apr 2025 00:36:51 +0000
Received: by outflank-mailman (input) for mailman id 937624;
 Fri, 04 Apr 2025 00:36:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0V3C-0004Mi-EL
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:36:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43c511c-10ec-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 02:36:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F9BC44EE7;
 Fri,  4 Apr 2025 00:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0946EC4CEE3;
 Fri,  4 Apr 2025 00:36:45 +0000 (UTC)
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
X-Inumbo-ID: e43c511c-10ec-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743727006;
	bh=Bx6sfO8cbMwYsif5iGWvTvtGjsvy41KYctTvvmh068Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bjufjrLvAwrhjiEM99jVX568G2xTy9V9num6L7dCJoZZWxs4gBbzrNDFpwgTeG1ad
	 eCXOqs2ACW30HZk5ndQScRDN77TTZpB2hRHW4cU2/I2Ykg8+iE9pS70FrcepPxrObv
	 MYMy3pgNJj6sqP0yJGgd2Qi/mc4/4g4jrLNHPaPQ2oBgZqOCBWchtOBITWyKC7LUtH
	 5a/AHyi/gtTutPStQsHKfmX1ZpFXLF+mZrXfFwWsDkid8CxwhsgtBD5AppkE3ckJPj
	 IspTd4p8rSrlxxn4zS0+BR97PvRLl80NjQ9KnyST9DXLTiXru3w/emIZkXCwbDX9Jt
	 utvPXDKWyMR4g==
Date: Thu, 3 Apr 2025 17:36:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 07/11] ci: wait for the network interface in PCI
 passthrough tests
In-Reply-To: <726b40daa70f376f928c559b061e002c8cc2005f.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031736140.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <726b40daa70f376f928c559b061e002c8cc2005f.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2133017963-1743727006=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2133017963-1743727006=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> The network driver initializes asynchronously, and it may not be ready
> yet by the time the startup script is called. This is especially the
> case for USB network adapter (where the PCI device is the USB
> controller) in the upcoming runner.
> 
> Don't bother about separate timeout - test timeout will cover this part
> too.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qubes-x86-64.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 822b81d186a7..6d2c170d1ee1 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -104,6 +104,7 @@ on_reboot = "destroy"
>          domU_check="
>  set -x -e
>  interface=eth0
> +while ! [ -e \"/sys/class/net/\$interface\" ]; do sleep 1; done
>  ip link set \"\$interface\" up
>  timeout 30s udhcpc -i \"\$interface\"
>  pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
> -- 
> git-series 0.9.1
> 
--8323329-2133017963-1743727006=:3529306--

