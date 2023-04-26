Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF46EEBE4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 03:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526422.818159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prTuY-0001IO-F9; Wed, 26 Apr 2023 01:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526422.818159; Wed, 26 Apr 2023 01:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prTuY-0001G0-CT; Wed, 26 Apr 2023 01:25:34 +0000
Received: by outflank-mailman (input) for mailman id 526422;
 Wed, 26 Apr 2023 01:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1prTuX-0001Fu-Fr
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 01:25:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b891c20-e3d1-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 03:25:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2503761776;
 Wed, 26 Apr 2023 01:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E822CC433D2;
 Wed, 26 Apr 2023 01:25:28 +0000 (UTC)
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
X-Inumbo-ID: 3b891c20-e3d1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682472329;
	bh=/VXR3+ubC/WgQkXMc/DNqf78a9huRi+gfho5wyE5DCo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bsNYwWHCE+3I58rI+J1ndqKbw4qHtPDPU/Jb/ZPSjfU+2i0yjdZ9mbmWDrF7nVIUm
	 ckyleNZBoTArAA1vNqO9rAs1jfHinuivlpqK4vwryI3HAyHYCZzikyhr5fK79CDkcn
	 ox8pTwawLXQXdTHwcbzxDTd+kftt9hQTQvIK2PvivD9l9fc+ygf61XJMa9IB5ZZhha
	 uvM8llHp2Z44LGHrGvCQosy3dwMYqkzUv45IOu/1N2N91PB5VwGeYC+qpIe5Gt7Jka
	 3mZ/9amAbJpo+ZVTcIWvb5HrqN1joty5YMNGFOQFw9nx8sXKNpk0sTKwo9nA98SwOb
	 PJvUlWUHWGzlA==
Date: Tue, 25 Apr 2023 18:25:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 4/6] automation: wait for the login prompt as test
 end marker
In-Reply-To: <7a0e3b0f6373ce9ad0bf66ddb1535ca9c4fed0fc.1682468126.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304251825050.3419@ubuntu-linux-20-04-desktop>
References: <cover.ddd9fded43b546af196bcfb4473b62e1fa3864b3.1682468126.git-series.marmarek@invisiblethingslab.com> <7a0e3b0f6373ce9ad0bf66ddb1535ca9c4fed0fc.1682468126.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2132388244-1682472329=:3419"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2132388244-1682472329=:3419
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 26 Apr 2023, Marek Marczykowski-Górecki wrote:
> The login prompt is printed after all the startup (test) scripts, wait
> for that instead of "passed" marker. And only then check if test passed.
> Before this patch there was a race: "passed" marker could be already
> printed, but the final check would fail because login prompt wasn't
> there yet.
> 
> Also, modify etc/issue in domU rootfs to avoid confusing the one from
> domU with the dom0's one. Use the dom0 one as test end marker.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> changes in v2:
>  - differentiate dom0 and domU welcome message
> ---
>  automation/scripts/qubes-x86-64.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 916dbaae59c3..6c0309704661 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -66,6 +66,7 @@ ${domU_check}
>  /bin/sh" > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
>  echo "rc_verbose=yes" >> etc/rc.conf
> +sed -i -e 's/^Welcome/domU \0/' etc/issue
>  find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
>  cd ..
>  rm -rf rootfs
> @@ -159,7 +160,7 @@ if [ -n "$wait_and_wakeup" ]; then
>      ssh $CONTROLLER wake
>  fi
>  
> -until grep "$passed" smoke.serial || [ $timeout -le 0 ]; do
> +until grep "^Welcome to Alpine Linux" smoke.serial || [ $timeout -le 0 ]; do
>      sleep 1;
>      : $((--timeout))
>  done
> -- 
> git-series 0.9.1
> 
--8323329-2132388244-1682472329=:3419--

