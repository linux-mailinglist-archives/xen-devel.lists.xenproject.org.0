Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5768C8D7C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 22:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724455.1129720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84e1-0007o6-NF; Fri, 17 May 2024 20:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724455.1129720; Fri, 17 May 2024 20:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s84e1-0007mR-KK; Fri, 17 May 2024 20:57:37 +0000
Received: by outflank-mailman (input) for mailman id 724455;
 Fri, 17 May 2024 20:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s84dz-0007m5-I0
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 20:57:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 152df9e8-1490-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 22:57:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B163461DDA;
 Fri, 17 May 2024 20:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB600C2BD10;
 Fri, 17 May 2024 20:57:31 +0000 (UTC)
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
X-Inumbo-ID: 152df9e8-1490-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715979452;
	bh=sx9LlUQgWX7kme8U3/TEYamKVLPj2vBDROCcWlcAPmc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OK0ehEm2pz0AJJzgSMp9tutPwYYt4VJnbBzkDQLMzP3N5ymENvOMhhR7phUEKQ+OO
	 q6q40p2DMg6DwPk0h8PeTVinOknMtZkeEo3Z4N5izi0kL/cqA78AHxq9rIaQoLlEi1
	 /Wsj+34xLfkPVhMy33FACH8TW8BBfREwww9tdpwPTDbaNfuSId09R5JmhWbadvTK+Z
	 q6lIhjoZIR6zlDxN9CS3ZbdsRbxbt2rbDiELnirDiqwWGQVm3ers4HfvLfPm2A25lZ
	 X40BTKNmz31M4ngTvqcb1Y1uaUQPbYCooZwQx6gYeuz956V50xx/1ZLg/XGUgpwn7t
	 VW+JvzQlEvJZA==
Date: Fri, 17 May 2024 13:57:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 01/12] automation: include domU kernel messages in the
 console output log
In-Reply-To: <eb081e91f8c82d3293d6935c0567df96903d0b6c.1715867907.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2405171357190.1052252@ubuntu-linux-20-04-desktop>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com> <eb081e91f8c82d3293d6935c0567df96903d0b6c.1715867907.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-242755061-1715979452=:1052252"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-242755061-1715979452=:1052252
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 May 2024, Marek Marczykowski-Górecki wrote:
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/scripts/qubes-x86-64.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index d81ed7b931cf..4beeff17d31b 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -131,6 +131,8 @@ mkdir sys
>  rm var/run
>  echo "#!/bin/sh
>  
> +echo 8 > /proc/sys/kernel/printk
> +
>  ${domU_check}
>  " > etc/local.d/xen.start
>  chmod +x etc/local.d/xen.start
> -- 
> git-series 0.9.1
> 
--8323329-242755061-1715979452=:1052252--

