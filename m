Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C668D56C9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 02:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733157.1139267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCptH-0006J8-C8; Fri, 31 May 2024 00:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733157.1139267; Fri, 31 May 2024 00:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCptH-0006Gz-9X; Fri, 31 May 2024 00:13:03 +0000
Received: by outflank-mailman (input) for mailman id 733157;
 Fri, 31 May 2024 00:13:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCptG-0006GX-7B
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 00:13:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8906db72-1ee2-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 02:13:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97919CE1B92;
 Fri, 31 May 2024 00:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D89DC2BBFC;
 Fri, 31 May 2024 00:12:55 +0000 (UTC)
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
X-Inumbo-ID: 8906db72-1ee2-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717114376;
	bh=DX/ZJW+AbNYC5W7lCQnC5G1JyZNmuQtKiqpllAciZwc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZSt25Whc2XL1HVbF7Add4f1cKME/xXDoK+Qth6Ufc8nOWjHrdj2DI05fm6GjoriKd
	 VQbYy2Awhqy1+a8gkySRWiKUcW4Lsg2gZk9M65AUJkjIWkZkQXB5/g5V5F4ttNhdVN
	 oc1ZD0dP+9IXHxowlQ8aTnQRVtDwC+LoBj2FEI8euWeFRbNIlAuyU+h3rXfmHKPaNg
	 G60Or1hBFyTzHpYQqUZB0VwCPOitvy/IOT3X9dDgxYfCFysCqznFH9kaKsHd/mBYyz
	 eD931aJN3hGO7T1OLOWOyFDa5CxsfjjOUQVBRk9wV1QL3ZQfCVf7uZ3GDxQ37fr8zx
	 sKvioYCVMqSRA==
Date: Thu, 30 May 2024 17:12:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 3/3] CI: Improve serial handling in
 qemu-smoke-ppc64le.sh
In-Reply-To: <20240529141945.41669-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405301712470.2557291@ubuntu-linux-20-04-desktop>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com> <20240529141945.41669-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1971276845-1717114375=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1971276845-1717114375=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 29 May 2024, Andrew Cooper wrote:
> Have PPC put serial to stdout like all other tests, so it shows up in the main
> job log.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  automation/scripts/qemu-smoke-ppc64le.sh | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
> index 2adbdac87ef5..701d81107d18 100755
> --- a/automation/scripts/qemu-smoke-ppc64le.sh
> +++ b/automation/scripts/qemu-smoke-ppc64le.sh
> @@ -2,15 +2,15 @@
>  
>  set -ex
>  
> +serial_log="$(pwd)/smoke.serial"
> +
>  # machine type from first arg passed directly to qemu -M
>  machine=$1
>  
>  # Run the test
> -rm -f smoke.serial
> +rm -f ${serial_log}
>  set +e
>  
> -touch smoke.serial
> -
>  timeout -k 1 20 \
>  binaries/qemu-system-ppc64 \
>      -bios binaries/skiboot.lid \
> @@ -20,9 +20,10 @@ binaries/qemu-system-ppc64 \
>      -vga none \
>      -monitor none \
>      -nographic \
> -    -serial file:smoke.serial \
> -    -kernel binaries/xen
> +    -serial stdio \
> +    -kernel binaries/xen \
> +    |& tee ${serial_log} | sed 's/\r//'
>  
>  set -e
> -(grep -q "Hello, ppc64le!" smoke.serial) || exit 1
> +(grep -q "Hello, ppc64le!" ${serial_log}) || exit 1
>  exit 0
> -- 
> 2.30.2
> 
--8323329-1971276845-1717114375=:2557291--

