Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763DF292CF7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 19:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8794.23635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUZ6M-0003nD-Fd; Mon, 19 Oct 2020 17:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8794.23635; Mon, 19 Oct 2020 17:37:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUZ6M-0003mo-CX; Mon, 19 Oct 2020 17:37:42 +0000
Received: by outflank-mailman (input) for mailman id 8794;
 Mon, 19 Oct 2020 17:37:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kUZ6K-0003mj-Pw
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 17:37:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66bd54fb-aef6-4dd0-ab0d-58ed2ba280d7;
 Mon, 19 Oct 2020 17:37:40 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB8B12224D;
 Mon, 19 Oct 2020 17:37:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JRC9=D2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kUZ6K-0003mj-Pw
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 17:37:40 +0000
X-Inumbo-ID: 66bd54fb-aef6-4dd0-ab0d-58ed2ba280d7
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 66bd54fb-aef6-4dd0-ab0d-58ed2ba280d7;
	Mon, 19 Oct 2020 17:37:40 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EB8B12224D;
	Mon, 19 Oct 2020 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603129058;
	bh=3dO9Yv7AAoBgYo09ik4pB/TLqrtmdeRFwgz65VwvxAs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ecsEtqeMgoPSv46Hw/EbT3fZh9AsCwHoHRVSn+O2Ltlfv1+a/01a8GEEe3PtK1OSy
	 gfm4RCxGLWVG7/7NThxzAHv0SV5K4HUSXfTvy0a8utiZY10D2mhQBsTRJNcsHExH8r
	 1+Wn4QNv1SeREs3wVqwRWbftTsBwB59nUkIvvEuU=
Date: Mon, 19 Oct 2020 10:37:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Print message if reset did not work
In-Reply-To: <74a7359983a9d25ca62a6edd41805ab92918e2a1.1602856636.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2010191036230.12247@sstabellini-ThinkPad-T480s>
References: <74a7359983a9d25ca62a6edd41805ab92918e2a1.1602856636.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Oct 2020, Bertrand Marquis wrote:
> If for some reason the hardware reset is not working, print a message to
> the user every 5 seconds to warn him that the system did not reset
> properly and Xen is still looping.
> 
> The message is printed infinitely so that someone connecting to a serial
> console with no history would see the message coming after 5 seconds.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/shutdown.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
> index b32f07ec0e..600088ec48 100644
> --- a/xen/arch/arm/shutdown.c
> +++ b/xen/arch/arm/shutdown.c
> @@ -36,6 +36,7 @@ void machine_halt(void)
>  void machine_restart(unsigned int delay_millisecs)
>  {
>      int timeout = 10;
> +    unsigned long count = 0;
>  
>      watchdog_disable();
>      console_start_sync();
> @@ -59,6 +60,9 @@ void machine_restart(unsigned int delay_millisecs)
>      {
>          platform_reset();
>          mdelay(100);
> +        if ( (count % 50) == 0 )
> +            printk(XENLOG_ERR "Xen: Platform reset did not work properly!!\n");
> +        count++;

I'd think that one "!" is enough :-) but anyway

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

