Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E6AC5E46
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 02:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998889.1379585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4ge-0007Nt-6Q; Wed, 28 May 2025 00:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998889.1379585; Wed, 28 May 2025 00:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK4ge-0007MR-3c; Wed, 28 May 2025 00:30:28 +0000
Received: by outflank-mailman (input) for mailman id 998889;
 Wed, 28 May 2025 00:30:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8Hg=YM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uK4gd-0007ML-3p
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 00:30:27 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f29b930e-3b5a-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 02:30:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9AB0D61137;
 Wed, 28 May 2025 00:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7606CC4CEE9;
 Wed, 28 May 2025 00:30:23 +0000 (UTC)
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
X-Inumbo-ID: f29b930e-3b5a-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748392224;
	bh=6uq1/wOLluLNtznQ+Tc8w1a6hzuCTCLFk8smqttfnzI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lGZBNrRlqZjW6lWOGX9uXz1um2YamtClV5G2YeXlNX8vnw1SIRDizzQTUVmeU2RFa
	 IC7J65fgicB7wR2GRb3kH4e13R8PwzdWg8Qhcdqnc8WrkHMBSC1yq2mGG3J8V43GYU
	 dUtU5o/v+B9Ie/dz/hk9mByO5VTgjHyu4DMGaWqJ4xUCenMTPkkShx88JzHEn8JIwQ
	 ptNR8Osns5kCTGM/Csh5iJ7Y80UNMQ3JCkLAaSuGPNIwEqSkR9iY7psT6RVrkuZrdW
	 jbfMF8W4Ls4mxL0+SGl9pM5yHUwJGnBbna93bMW4LuQamApYIoFFgcqsNzZFn36uCY
	 x5RyHRy+dcakA==
Date: Tue, 27 May 2025 17:30:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 3/3] CI: Adjust how domU is packaged in dom0
In-Reply-To: <20250522173640.575452-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505271727170.135336@ubuntu-linux-20-04-desktop>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com> <20250522173640.575452-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1921944850-1748392224=:135336"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1921944850-1748392224=:135336
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 22 May 2025, Andrew Cooper wrote:
> Package domU in /root for dom0 and insert into the uncompressed part of dom0's
> rootfs, rather than recompressing it as part of the overlay.
> 
> For Qubes, this avoids putting the domU kernel in dom0's rootfs for tests
> which aren't going to boot a guest.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  automation/scripts/qubes-x86-64.sh            | 20 +++++++++++++------
>  .../scripts/xilinx-smoke-dom0-x86_64.sh       | 16 +++++++++++----
>  2 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 1dd3f48b3d29..17a37134f46a 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -154,8 +154,8 @@ esac
>  domU_config="
>  type = '${domU_type}'
>  name = 'domU'
> -kernel = '/boot/vmlinuz'
> -ramdisk = '/boot/initrd-domU'
> +kernel = '/root/vmlinuz-domU'
> +ramdisk = '/root/initrd-domU'
>  cmdline = 'root=/dev/ram0 console=hvc0'
>  memory = 512
>  vif = [ ${domU_vif} ]
> @@ -185,12 +185,24 @@ Kernel \r on an \m (\l)
>      find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>      cd ..
>      rm -rf rootfs
> +
> +    # Package domU kernel+rootfs in /root for dom0 (uncompressed)
> +    mkdir -p rootfs/root
> +    cd rootfs
> +    cp ../binaries/bzImage root/vmlinuz-domU
> +    cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
> +    find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +    cd ..
> +    rm -rf rootfs
>  fi
>  
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to come
>  # first, and all uncompressed must be ahead of compressed.
>  parts=(
>      binaries/ucode.cpio
> +)
> +[ -n "$domU_check" ] && parts+=(binaries/domU-in-dom0.cpio)

This is a NIT but I have been trying to avoid this format in favor of

if [ -n "$domU_check" ]
then
    parts+=(binaries/domU-in-dom0.cpio)
fi

for readibility.


I can see the patch is correct. It adds a bit of complexity in exchange
for a small improvement. I am not sure if the trade off is worth it, but
I'll ack it anyway.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I can change the style of the check on commit


> +parts+=(
>      binaries/rootfs.cpio.gz
>      binaries/xen-tools.cpio.gz
>  )
> @@ -238,10 +250,6 @@ mkdir -p etc/default
>  echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> -cp ../binaries/bzImage boot/vmlinuz
> -if [ -n "$domU_check" ]; then
> -    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> -fi
>  find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
>  cd ..
>  
> diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> index 0fbabb41054a..29817ff81d0a 100755
> --- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> +++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
> @@ -22,8 +22,8 @@ DOMU_CMD=""
>  DOMU_CFG='
>  type = "pvh"
>  name = "domU"
> -kernel = "/boot/vmlinuz"
> -ramdisk = "/boot/initrd-domU"
> +kernel = "/root/vmlinuz-domU"
> +ramdisk = "/root/initrd-domU"
>  extra = "root=/dev/ram0 console=hvc0"
>  memory = 512
>  '
> @@ -103,10 +103,20 @@ find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
>  
> +# Package domU kernel+rootfs in /root for dom0 (uncompressed)
> +mkdir -p rootfs/root
> +cd rootfs
> +cp ../binaries/bzImage root/vmlinuz-domU
> +cp ../binaries/domU-rootfs.cpio.gz root/initrd-domU
> +find . | cpio -H newc -o > ../binaries/domU-in-dom0.cpio
> +cd ..
> +rm -rf rootfs
> +
>  # Dom0 rootfs.  The order or concatination is important; ucode wants to come
>  # first, and all uncompressed must be ahead of compressed.
>  parts=(
>      binaries/ucode.cpio
> +    binaries/domU-in-dom0.cpio
>      binaries/rootfs.cpio.gz
>      binaries/xen-tools.cpio.gz
>  )
> @@ -127,8 +137,6 @@ echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
>  echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
> -cp ../binaries/bzImage boot/vmlinuz
> -cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
>  find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
>  cd ..
>  
> -- 
> 2.39.5
> 
--8323329-1921944850-1748392224=:135336--

