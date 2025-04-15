Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C5A8AC4E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 01:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954684.1348673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4q1C-00088w-UB; Tue, 15 Apr 2025 23:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954684.1348673; Tue, 15 Apr 2025 23:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4q1C-00086H-RA; Tue, 15 Apr 2025 23:48:42 +0000
Received: by outflank-mailman (input) for mailman id 954684;
 Tue, 15 Apr 2025 23:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wZ1T=XB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4q1A-00086A-MJ
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 23:48:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2421a381-1a54-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 01:48:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A69295C5654;
 Tue, 15 Apr 2025 23:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA99C4CEE7;
 Tue, 15 Apr 2025 23:48:31 +0000 (UTC)
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
X-Inumbo-ID: 2421a381-1a54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744760912;
	bh=1u0oYoQW3wmsN32G33PGXctmSejMaFkhOsg62oxTZ70=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ah9ZMaE4bDbmfdmdjChQc5ER3qg5O7bt78DYX1+utlebrvvkw4xs2301cU7lZT73I
	 Dd+sJnaxs7loG4l4X/utJyEmujBBK4dWzzOf1GDMpzY5Oo6mFoIix4aq2G4IUEiqnv
	 yY9uKgKeIjYrBO3HKJybHWTd4Yuaqx4aONgqtc93tJimGP5X2R4gtnRXyIWWkWVsvB
	 npLR0ksd+8JrxbHQ6HehQhwJqSiqtDvqWo9kHwKsuNiuONLRB720oDl+VPzfqSqaCz
	 PXvBZ+IU5R7x2+jY6B1OSvE37BprVPDXOIMOnjBFI8QZsDVLZdWDHhdOveC+LWH36q
	 Pmi5PtePE55cw==
Date: Tue, 15 Apr 2025 16:48:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 2/6] CI: avoid repacking initrd as part of the test
 job
In-Reply-To: <20250414110903.2355303-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504151637100.8008@ubuntu-linux-20-04-desktop>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com> <20250414110903.2355303-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1964788768-1744760523=:8008"
Content-ID: <alpine.DEB.2.22.394.2504151646090.8008@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1964788768-1744760523=:8008
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2504151646091.8008@ubuntu-linux-20-04-desktop>

On Mon, 14 Apr 2025, Andrew Cooper wrote:
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Use the new test-artifacts which provide rootfs.cpio.gz rather than
> initrd.tar.gz.  rootfs.cpio.gz also has all the necessary top-level
> directories, and includes the rc_verbose setting, so these modifications can
> be dropped.
> 
> Having that, do not repack the whole initrd, but only pack modified
> files and rely on Linux handling of concatenated archives.
> This allows packing just test-related files (which includes the whole
> toolstack), instead of the whole initrd.
> 
> For xilinx-smoke-dom0-x86_64.sh, this involves instructing grub not to unzip
> the archive, as doing so corrupts it.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

[...]


> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index c4be71464246..e2376cb51cb4 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -164,16 +164,13 @@ ${domU_extra_config}
>  "
>  
>  if [ -n "$domU_check" ]; then
> -    # DomU
> +    # DomU rootfs
> +    cp binaries/rootfs.cpio.gz binaries/domU-rootfs.cpio.gz
> +
> +    # test-local configuration
>      mkdir -p rootfs
>      cd rootfs
> -    # fakeroot is needed to preserve device nodes in rootless podman container
> -    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> -    mkdir proc
> -    mkdir run
> -    mkdir srv
> -    mkdir sys
> -    rm var/run
> +    mkdir -p etc/local.d
>      echo "#!/bin/sh

I am worried about the drop of fakeroot because the newly created dirs
and files we'll have user as owner instead of root.

I suggest we fix this for consistency, and cpio -R 0:0 might suffice.


>  echo 8 > /proc/sys/kernel/printk
> @@ -181,26 +178,22 @@ echo 8 > /proc/sys/kernel/printk
>  ${domU_check}
>  " > etc/local.d/xen.start
>      chmod +x etc/local.d/xen.start
> -    echo "rc_verbose=yes" >> etc/rc.conf
>      echo "domU Welcome to Alpine Linux
>  Kernel \r on an \m (\l)
>  
>  " > etc/issue
> -    find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> +    find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>      cd ..
>      rm -rf rootfs
>  fi
>  
> -# DOM0 rootfs
> +# Dom0 rootfs
> +cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
> +
> +# test-local configuration
>  mkdir -p rootfs
>  cd rootfs
> -fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> -mkdir boot
> -mkdir proc
> -mkdir run
> -mkdir srv
> -mkdir sys
> -rm var/run
> +mkdir -p boot etc/local.d
>  cp -ar ../binaries/dist/install/* .
>  cp -ar ../binaries/tests .
>  cp -a ../automation/scripts/run-tools-tests tests/
> @@ -237,7 +230,6 @@ fi
>  chmod +x etc/local.d/xen.start
>  echo "$domU_config" > etc/xen/domU.cfg
>  
> -echo "rc_verbose=yes" >> etc/rc.conf
>  echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> @@ -245,7 +237,7 @@ cp ../binaries/bzImage boot/vmlinuz
>  if [ -n "$domU_check" ]; then
>      cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
>  fi
> -find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
> +find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
>  cd ..
--8323329-1964788768-1744760523=:8008--

