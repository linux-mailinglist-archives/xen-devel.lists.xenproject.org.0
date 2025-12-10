Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6217BCB187C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 01:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182411.1505287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8Gt-0001UA-Qs; Wed, 10 Dec 2025 00:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182411.1505287; Wed, 10 Dec 2025 00:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8Gt-0001RF-Nk; Wed, 10 Dec 2025 00:41:35 +0000
Received: by outflank-mailman (input) for mailman id 1182411;
 Wed, 10 Dec 2025 00:41:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT8Gs-0001R9-At
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 00:41:34 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f88fb23f-d560-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 01:41:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9389540B5C;
 Wed, 10 Dec 2025 00:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCDEC4CEF5;
 Wed, 10 Dec 2025 00:41:29 +0000 (UTC)
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
X-Inumbo-ID: f88fb23f-d560-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765327290;
	bh=eKD6RJz/QwcbXSED/VfKYyIN46U7omHo3gBPg5aLi2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tx9UYUyHCY53gK83OVEQpSN8EwpKo0Xg/agxXKCjbJb/bbbZ6aOpydzotaeqYJXAu
	 j9JIW3ayu3G3+Xhg0khvj9H95nw02B5p46a/GCR2BDA2TZl9rw4+pUJcWCK2tKFQRG
	 2qhNBQknQPyazuPe7hmY2YmstgA8CvBtWzPu0tfCfVuDQUjH2fFkEPC3lg4mX3NVHy
	 zzQnwFECo7ioZ/1g9dAGmO4Aptk8nStLK/nDipiO3PTf4SyPYeZx1oyom/tzQ12Ei2
	 whewAUrqbyNve32SIICqj5jxK40e/KJD8Yoe8a6Xy3mvznu6dz0tOv/8OMLMXhloVm
	 kwZTkloDd/+qQ==
Date: Tue, 9 Dec 2025 16:41:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 10/12] Prepare grub for booting x86_64 HVM domU from
 a disk
In-Reply-To: <18bbbbcc6cc0642c02b90a43d8a318a6f6193079.1764866136.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2512091637490.19429@ubuntu-linux-20-04-desktop>
References: <cover.fb9bd2be49ef9017f3552508f8c59849b8c0086f.1764866136.git-series.marmarek@invisiblethingslab.com> <18bbbbcc6cc0642c02b90a43d8a318a6f6193079.1764866136.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1781162057-1765327290=:19429"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1781162057-1765327290=:19429
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 4 Dec 2025, Marek Marczykowski-Górecki wrote:
> The stubdomain test will use it
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  scripts/alpine-rootfs.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index e06e72b..7d0e70d 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -94,5 +94,12 @@ cd /
>      echo -ne "dev\0proc\0run\0sys\0"
>  } | cpio -0 -R 0:0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
>  
> +if [ "$UNAME" = "x86_64" ]; then
> +    # Prepare boot sector for HVM disk
> +    grub-mkimage -o ${COPYDIR}/grub-core.img \
> +        -O i386-pc -p '(hd0,msdos1)/boot/grub2' \
> +        boot part_msdos ext2 linux biosdisk configfile normal
> +fi

I am not opposed to this but I'll wait until I review the stubdom test
:-)


>  # Print the contents for the build log
>  zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
> -- 
> git-series 0.9.1
> 
--8323329-1781162057-1765327290=:19429--

