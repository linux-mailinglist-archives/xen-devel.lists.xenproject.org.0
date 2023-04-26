Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E26EEBE1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 03:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526418.818149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prTs8-0000iy-3S; Wed, 26 Apr 2023 01:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526418.818149; Wed, 26 Apr 2023 01:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prTs8-0000g5-0I; Wed, 26 Apr 2023 01:23:04 +0000
Received: by outflank-mailman (input) for mailman id 526418;
 Wed, 26 Apr 2023 01:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1prTs6-0000fz-Sl
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 01:23:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1e6cc18-e3d0-11ed-b223-6b7b168915f2;
 Wed, 26 Apr 2023 03:23:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79D0861776;
 Wed, 26 Apr 2023 01:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4075AC433D2;
 Wed, 26 Apr 2023 01:22:58 +0000 (UTC)
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
X-Inumbo-ID: e1e6cc18-e3d0-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682472178;
	bh=e1FgjD0RZ3oYOY6urS6d4ljJIy0WoJwgllrFHvHLzsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PY+n0a+VgItot2X7FzNhJ/EVbll4QGTI62hwOdO8yuo+8Rofs1n4BEIIx4RCFVECm
	 V0UscA2pNy8s4mMIVMuLhBXmiFAefPTPMN00PgyD/u5dheSCRV+HBUy5xJzXdzt4wm
	 j+QkZrXmz0ESQNRj+F52ypTLhN7V5TMqH7BOtZq8Xerrxl/I76ZSpZuKizUPcsBQ4y
	 8ZRGuYk93FyMDcAlbDRkqKubbfIpA6pkGctdEWiwslO48C8KFaglLp6USzFG0pnC9G
	 a5qyf9uSGCIWhzlclQ/kinxyMbM1kr4lgMLDZl0KJakEctvDWXPocClwvArTtWZ6Lw
	 YNbb1GV605Vfg==
Date: Tue, 25 Apr 2023 18:22:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 6/6] automation: include tail of serial log in the
 gitlab outout
In-Reply-To: <8e1799a0e50b5a4b693f92ba26b6fef6154aeb79.1682468126.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304251821490.3419@ubuntu-linux-20-04-desktop>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com> <8e1799a0e50b5a4b693f92ba26b6fef6154aeb79.1682468126.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1873717104-1682472179=:3419"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1873717104-1682472179=:3419
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 26 Apr 2023, Marek Marczykowski-Górecki wrote:
> Make it a bit easier to see what has failed.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

I am not too happy about this, I would rather make smoke.serial easier
to access, but if you still want this I wont block it.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes in v2:
>  - print it also in case of a timeout
> ---
>  automation/scripts/qubes-x86-64.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index a01c571860ee..056faf9e6de8 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -225,6 +225,9 @@ until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0 ]; do
>      sleep 1;
>      : $((--timeout))
>  done
> +
> +tail -n 100 smoke.serial
> +
>  if [ $timeout -le 0 ]; then
>      echo "ERROR: test timeout, aborting"
>      exit 1
> -- 
> git-series 0.9.1
> 
--8323329-1873717104-1682472179=:3419--

