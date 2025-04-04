Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49152A7B504
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937638.1338561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VBl-0007cN-9a; Fri, 04 Apr 2025 00:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937638.1338561; Fri, 04 Apr 2025 00:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0VBl-0007Zw-6s; Fri, 04 Apr 2025 00:45:41 +0000
Received: by outflank-mailman (input) for mailman id 937638;
 Fri, 04 Apr 2025 00:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0VBk-0007Zq-1J
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:45:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dcd7a16-10ee-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 02:45:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0D6F5C57B1;
 Fri,  4 Apr 2025 00:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFD5C4CEE3;
 Fri,  4 Apr 2025 00:45:31 +0000 (UTC)
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
X-Inumbo-ID: 1dcd7a16-10ee-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743727532;
	bh=CzvNuLaMakSNbkeq1+5HHu4L1F3dHXmAw4MfHZ+kYyc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TONTfmSZ0QYfSejq/q4Tb79DTny1cQ/zTGmn7EZ/x87PhA3UnVA4cF19urBZ8XPw3
	 jr+/g2UCKi/x5Em3li2hPaH7dSRPNVHQ2MtABQsMi0e7Kl9zM8y7lHI7OiFgT59sUB
	 TjPz1XSYYTMXCBBrzPox8R6rUdbM5hlvIjrSrwuP2elPnhHYBFG6O0OTeJAPL1mAzy
	 PvagfDBO2SJV+dgN/n67uo2KBJx61FO/Qhn8rLnUFkDFDYh/B2HY6aqyQe5DubTW/K
	 IPAGka8EAM2yRGgIfYtFD7tXeUmNhGoXjPrBYqgvQL3dWUxcSm6jD800DBYW/d+bwC
	 BROTGakIkpwAA==
Date: Thu, 3 Apr 2025 17:45:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 09/11] ci: adjust resolving network interface into
 PCI device
In-Reply-To: <bc4788cfc6217be3b900e4ab4c019eb3b7e34f0a.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031742420.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <bc4788cfc6217be3b900e4ab4c019eb3b7e34f0a.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2010084662-1743727532=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2010084662-1743727532=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> Change how PCI device lookup is done to handle also USB devices, in
> which case get the USB controller. Instead of taking basename of the
> 'device' symlink, resolve the full path (example:
> /sys/devices/pci0000:00/0000:00:09.0/usb4/4-7/4-7:1.0) and take the
> first part after pci0000:00. Theoretically it could be a bridge, but VM
> has flat PCI topology.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/scripts/qubes-x86-64.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 6d2c170d1ee1..dc8013750f5f 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -110,7 +110,8 @@ timeout 30s udhcpc -i \"\$interface\"
>  pingip=\$(ip -o -4 r show default|cut -f 3 -d ' ')
>  ping -c 10 \"\$pingip\"
>  echo domU started
> -pcidevice=\$(basename \$(readlink /sys/class/net/\$interface/device))
> +pcidevice=\$(realpath /sys/class/net/\$interface/device |
> +             sed 's#.*pci0000:00/\\([^/]*\\).*#\\1#')

This is still a bit fragile but better than before

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  lspci -vs \$pcidevice
>  "
>          if [ -n "$PCIDEV_INTR" ]; then
> -- 
> git-series 0.9.1
> 
--8323329-2010084662-1743727532=:3529306--

