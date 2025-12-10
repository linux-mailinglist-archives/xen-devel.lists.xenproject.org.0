Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD108CB1804
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182401.1505276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8Br-0007u2-90; Wed, 10 Dec 2025 00:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182401.1505276; Wed, 10 Dec 2025 00:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8Br-0007ry-67; Wed, 10 Dec 2025 00:36:23 +0000
Received: by outflank-mailman (input) for mailman id 1182401;
 Wed, 10 Dec 2025 00:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT8Bp-0007rq-Td
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:36:21 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e70b5e3-d560-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:36:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C49E4601B5;
 Wed, 10 Dec 2025 00:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8DEC4CEF5;
 Wed, 10 Dec 2025 00:36:16 +0000 (UTC)
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
X-Inumbo-ID: 3e70b5e3-d560-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326977;
	bh=clGeXfHgG5rIUDtE39mcMz8Kmg4o35P7lslX3yFy800=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c2yNYScCzByXhriIbsBRPrWfjh6vbVsN51cz59b7Y+9mF2H1aHMPHtDyU9fPyOB1D
	 0i+kIDYXA/8h8fInmPRP4bijGVfQ8iqsuJtwoSRx1rXuQh9/FU6pUbWR7r4ROvor2H
	 n1i9uSo3VCqIo1tNocbJeH5rMYLBsKRqM8AaDi7/QUc2X8FM2QJsz0lznDGxcrqm+w
	 iQ5ZEHBvPpnbyH5J/1ZB+y1XN0HMi93OGkLf2zZPjxe0ajhUVdzjpQAgud4Sa+gUpt
	 bPcFiDrapfqDO93hyPoLJh/422BKCX30+HGSzLfapzg6RDpdBFppk+IgSw47sUVR6O
	 wLRFtb105vzlA==
Date: Tue, 9 Dec 2025 16:36:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 12/12] Setup ssh access to test systems
In-Reply-To: <ce8df51117f8f3696059e83444be57bb20aba80e.1764866136.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091635410.19429@ubuntu-linux-20-04-desktop>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com> <ce8df51117f8f3696059e83444be57bb20aba80e.1764866136.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1446938081-1765326977=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1446938081-1765326977=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Dec 2025, Marek Marczykowski-Górecki wrote:
> For this add also bridge package, so xenbr0 can be configured with
> /etc/network/interfaces.
> This allows extracting more logs out of the test system.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - do not allow passwordless login
> ---
>  scripts/alpine-rootfs.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index 5945657..82cc416 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -10,6 +10,8 @@ apk --no-cache upgrade
>  
>  PKGS=(
>      # System
> +    bridge
> +    dropbear
>      libgcc
>      openrc
>      udev
> @@ -70,6 +72,7 @@ rc-update add loopback sysinit
>  rc-update add bootmisc boot
>  rc-update add devfs sysinit
>  rc-update add dmesg sysinit
> +rc-update add dropbear boot
>  rc-update add hostname boot
>  rc-update add hwclock boot
>  rc-update add hwdrivers sysinit
> @@ -82,6 +85,7 @@ echo "ttyS0" >> /etc/securetty
>  echo "hvc0" >> /etc/securetty
>  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
>  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
> +echo "DROPBEAR_OPTS=\"-R\"" >> /etc/conf.d/dropbear
>  echo "rc_verbose=yes" >> /etc/rc.conf
>  echo > /etc/modules
>  passwd -d "root" root
> -- 
> git-series 0.9.1
> 
--8323329-1446938081-1765326977=:19429--

