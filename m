Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31976ED958
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 02:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525678.817001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6Zd-000764-4F; Tue, 25 Apr 2023 00:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525678.817001; Tue, 25 Apr 2023 00:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pr6Zd-00073d-0V; Tue, 25 Apr 2023 00:30:25 +0000
Received: by outflank-mailman (input) for mailman id 525678;
 Tue, 25 Apr 2023 00:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxgq=AQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pr6Zc-00073X-9W
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 00:30:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ce28327-e300-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 02:30:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D403A62587;
 Tue, 25 Apr 2023 00:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F62BC433EF;
 Tue, 25 Apr 2023 00:30:19 +0000 (UTC)
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
X-Inumbo-ID: 5ce28327-e300-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682382620;
	bh=X681ZDG2qL6aCN+Sjd3jm0RF4QgyjGLRKVWVzeLLYp8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BYXuncdSzsQPGWPRgWVXdYWU8lGShdQfIAfCmR68Y/bOvNTauzQ6K5IW64j7WCAfP
	 xNn4mUFhR5pmF29J6y+kItgT8wxtggyj+ffszNid9H/joyO0V/T4qY5bU99EH+UT2f
	 OVFepdy9Orvuw8KtMOmsV5GWppqlsugqSzr7FU6yDddgMqKvF8OrVoFoZqjBTsU/ic
	 XGpPh7gRVH26M2GIxsgcIZYH3/LGXCmcgnIyiFNHJmJEHJPHvvb6CxP1yfCA9wAxmr
	 2CEutfye6v0oeVldmgkw1/7bshHk6HcbRmB8qh7M0GhfcOu5uyOWcfqkzfiPMGJRhc
	 JZ5be6QjBzCbQ==
Date: Mon, 24 Apr 2023 17:30:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 4/6] automation: wait for the login prompt as test end
 marker
In-Reply-To: <8bdae473db12295b536680283820eb18a7dbd911.1682369736.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2304241717360.3419@ubuntu-linux-20-04-desktop>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com> <8bdae473db12295b536680283820eb18a7dbd911.1682369736.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1035251367-1682381865=:3419"
Content-ID: <alpine.DEB.2.22.394.2304241730150.3419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1035251367-1682381865=:3419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304241730151.3419@ubuntu-linux-20-04-desktop>

On Mon, 24 Apr 2023, Marek Marczykowski-Górecki wrote:
> The login prompt is printed after all the startup (test) scripts, wait
> for that instead of "passed" marker. And only then check if test passed.
> Before this patch there was a race: "passed" marker could be already
> printed, but the final check would fail because login prompt wasn't
> there yet.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/scripts/qubes-x86-64.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 916dbaae59c3..c0bc71764f73 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -159,7 +159,7 @@ if [ -n "$wait_and_wakeup" ]; then
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
--8323329-1035251367-1682381865=:3419--

