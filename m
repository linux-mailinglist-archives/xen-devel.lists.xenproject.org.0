Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90390A334F1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887060.1296630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOKi-0000Pv-3N; Thu, 13 Feb 2025 01:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887060.1296630; Thu, 13 Feb 2025 01:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOKi-0000NN-0a; Thu, 13 Feb 2025 01:48:04 +0000
Received: by outflank-mailman (input) for mailman id 887060;
 Thu, 13 Feb 2025 01:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiOKg-0000NH-LC
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:48:02 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e749363-e9ac-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 02:48:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C4E66A41C01;
 Thu, 13 Feb 2025 01:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2676FC4CEDF;
 Thu, 13 Feb 2025 01:47:59 +0000 (UTC)
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
X-Inumbo-ID: 8e749363-e9ac-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739411279;
	bh=wo9rFuAsilD+LO4an7jiAzoyoIebazK4qeNkFQD1zLs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UekYVeNkXiQnYcPXyaIExm4PhNkox3bJOLsISqOF23SIfl07gMzkmo91fGrR0JFvu
	 6qiTHtKkCBSv4Kf150cKd/Ys268Zf0XqMVaAS41g7cbta5SSyTy9nWHuZqVux9cDwY
	 U0PcZXp4K0+Wglfi7JXiMJSoJMhNOCM4kL+XQKm2KGlN9lYMTeXQPWNxMeAUOrbB3n
	 +7bGlV7n2NiX9A4iqLuRlO5MdA5Dk4/ASHueFDGQK46olBmL/dW7G9IuUtiW+Gpbj7
	 KQBuJ8YJl4Vw3T/XSivx7w8jI2/IzCL+AMxN8sv5BdFNxdsyB8pax6osLY9oxRhc6F
	 H3oZe2yiifpTg==
Date: Wed, 12 Feb 2025 17:47:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/3] automation: skip building domU if there is no
 test defined for it
In-Reply-To: <bcedc3d646e93a43525976fc4548a9c5e307b93a.1739409822.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502121747510.619090@ubuntu-linux-20-04-desktop>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com> <bcedc3d646e93a43525976fc4548a9c5e307b93a.1739409822.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1272728748-1739411279=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1272728748-1739411279=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Feb 2025, Marek Marczykowski-Górecki wrote:
> This will be useful for later tests not using generic domU (unit tests,
> xtf etc).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qubes-x86-64.sh | 50 +++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 19 deletions(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 8a0b7bfbc0d0..7eb3ce1bf703 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -144,26 +144,28 @@ disk = [ ]
>  ${domU_extra_config}
>  "
>  
> -# DomU
> -mkdir -p rootfs
> -cd rootfs
> -# fakeroot is needed to preserve device nodes in rootless podman container
> -fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> -mkdir proc
> -mkdir run
> -mkdir srv
> -mkdir sys
> -rm var/run
> -echo "#!/bin/sh
> +if [ -n "$domU_check" ]; then
> +    # DomU
> +    mkdir -p rootfs
> +    cd rootfs
> +    # fakeroot is needed to preserve device nodes in rootless podman container
> +    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> +    mkdir proc
> +    mkdir run
> +    mkdir srv
> +    mkdir sys
> +    rm var/run
> +    echo "#!/bin/sh
>  
>  ${domU_check}
>  " > etc/local.d/xen.start
> -chmod +x etc/local.d/xen.start
> -echo "rc_verbose=yes" >> etc/rc.conf
> -sed -i -e 's/^Welcome/domU \0/' etc/issue
> -find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> -cd ..
> -rm -rf rootfs
> +    chmod +x etc/local.d/xen.start
> +    echo "rc_verbose=yes" >> etc/rc.conf
> +    sed -i -e 's/^Welcome/domU \0/' etc/issue
> +    find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
> +    cd ..
> +    rm -rf rootfs
> +fi
>  
>  # DOM0 rootfs
>  mkdir -p rootfs
> @@ -188,11 +190,19 @@ ifconfig eth0 up
>  ifconfig xenbr0 up
>  ifconfig xenbr0 192.168.0.1
>  
> +" > etc/local.d/xen.start
> +
> +if [ -n "$domU_check" ]; then
> +    echo "
>  # get domU console content into test log
>  tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
>  xl create /etc/xen/domU.cfg
>  ${dom0_check}
> -" > etc/local.d/xen.start
> +" >> etc/local.d/xen.start
> +else
> +    echo "${dom0_check}" >> etc/local.d/xen.start
> +fi
> +
>  chmod +x etc/local.d/xen.start
>  echo "$domU_config" > etc/xen/domU.cfg
>  
> @@ -201,7 +211,9 @@ echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
>  echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
>  mkdir -p var/log/xen/console
>  cp ../binaries/bzImage boot/vmlinuz
> -cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +if [ -n "$domU_check" ]; then
> +    cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
> +fi
>  find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
>  cd ..
>  
> -- 
> git-series 0.9.1
> 
--8323329-1272728748-1739411279=:619090--

