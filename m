Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B737CA7B3B1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 02:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937570.1338511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UqF-00083q-Ol; Fri, 04 Apr 2025 00:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937570.1338511; Fri, 04 Apr 2025 00:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UqF-00081z-L6; Fri, 04 Apr 2025 00:23:27 +0000
Received: by outflank-mailman (input) for mailman id 937570;
 Fri, 04 Apr 2025 00:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0UqE-00072Q-KD
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 00:23:26 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052b917c-10eb-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 02:23:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 99CD544E87;
 Fri,  4 Apr 2025 00:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43056C4CEE3;
 Fri,  4 Apr 2025 00:23:22 +0000 (UTC)
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
X-Inumbo-ID: 052b917c-10eb-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743726203;
	bh=qYNCUC3NHYRX5l+9p/SQ+oxNGEpoxSbOC+lW8qY+vaY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l/FzCLSEUP9fDpRA3GillwjJIKrgJ2vfbl438TB763BCU6LgOhg3akQGTUBWwKea6
	 YhecnlmeydKxYlNI9+iOKaAkTO8wYkA6lbtmbAqBugq/GTy9je4YBoWT/vDrClohg8
	 Ilai/LJEayEynfeTe1tuPLe8OpuM2kK5Cn1zkXW87AbzWtyDF2FADCcoLk2Tpm3Vvu
	 DSTo833bi6WVK5n61iu2bMfdhuaM1YWeFlKcHL6PQtOl2mlnYo3xBPMvQr2C2mEBr+
	 M/DOiST5ZO8oPnaE07PK6kxrpF3yCLL8qNKmvMpZJvrPcXisvJs1Gpc99yMwJ1S9ln
	 vll0vJ5yIfk/A==
Date: Thu, 3 Apr 2025 17:23:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 04/11] ci: include domU kernel messages in the console
 output log
In-Reply-To: <8902a1274707600b1fe38d41d11ac28627f386b7.1743678257.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2504031723140.3529306@ubuntu-linux-20-04-desktop>
References: <cover.59b4d1e66776c1e577aa5dd5460605dc6c240613.1743678257.git-series.marmarek@invisiblethingslab.com> <8902a1274707600b1fe38d41d11ac28627f386b7.1743678257.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-752167660-1743726203=:3529306"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-752167660-1743726203=:3529306
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Apr 2025, Marek Marczykowski-Górecki wrote:
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/scripts/qubes-x86-64.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 771c77d6618b..d316c17e0c9f 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -175,6 +175,8 @@ if [ -n "$domU_check" ]; then
>      rm var/run
>      echo "#!/bin/sh
>  
> +echo 8 > /proc/sys/kernel/printk
> +
>  ${domU_check}
>  " > etc/local.d/xen.start
>      chmod +x etc/local.d/xen.start
> -- 
> git-series 0.9.1
> 
--8323329-752167660-1743726203=:3529306--

