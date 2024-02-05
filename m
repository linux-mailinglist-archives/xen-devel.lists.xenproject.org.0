Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F56984A61D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 21:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676501.1052652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX5md-0002v5-EW; Mon, 05 Feb 2024 20:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676501.1052652; Mon, 05 Feb 2024 20:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX5md-0002t6-BY; Mon, 05 Feb 2024 20:41:39 +0000
Received: by outflank-mailman (input) for mailman id 676501;
 Mon, 05 Feb 2024 20:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4S5=JO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rX5mb-0002t0-HF
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 20:41:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32911c7-c466-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 21:41:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7B35611B9;
 Mon,  5 Feb 2024 20:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BFCC433F1;
 Mon,  5 Feb 2024 20:41:32 +0000 (UTC)
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
X-Inumbo-ID: f32911c7-c466-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707165693;
	bh=B71qTvwZU7PEXKS13VOXgNZIWUDc+/QogFY8w2OUaME=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JdAT40cq3KyKBDIllMCyGskml8HaHhgV/rbbMqnl/Y0e/rtIGsrzd6pDHgtHOh/U9
	 AZ84dDVJDab+lVZFaEZgKlE7qA4fD1GJXaS1/BeoPV9XpkgWOn6zj20KB9nz9epS5E
	 d71aqd4WJBzxJs2MOM5AwyrJByKF9AgnLfHkemLG9ydd0T/a+tK4zspO1fPkEBqTbm
	 sLShot1cfvVPh5dzhsj1ihAf21xwqZRXn5iR4BKB0e5pfHRyqxG5ODB0DpQ9DGiOXa
	 Y/bPdPiZnpoiH2lqOlKp8bbH+4mjvDBXNiLhIgDt62zidQ3wUQzdcb+SyZ2P/TOU4m
	 /2+I0eUKqtPJg==
Date: Mon, 5 Feb 2024 12:41:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Frediano Ziglio <frediano.ziglio@cloud.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] Remove useless assignment
In-Reply-To: <20240205104637.14868-1-frediano.ziglio@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2402051241240.1925432@ubuntu-linux-20-04-desktop>
References: <20240205104637.14868-1-frediano.ziglio@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Feb 2024, Frediano Ziglio wrote:
> The variable is assigned later, that value is never used.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/common/event_channel.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index a7a004a084..15aec5dcbb 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -324,8 +324,6 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
>          goto out;
>      }
>  
> -    rc = 0;
> -
>      chn = evtchn_from_port(d, port);
>  
>      rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> -- 
> 2.34.1
> 

