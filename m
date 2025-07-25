Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60AB11585
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 03:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056760.1424768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6pL-0003pG-P4; Fri, 25 Jul 2025 01:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056760.1424768; Fri, 25 Jul 2025 01:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6pL-0003mU-LL; Fri, 25 Jul 2025 01:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1056760;
 Fri, 25 Jul 2025 01:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uf6pJ-0003mO-Kg
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 01:02:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 035815cd-68f3-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 03:02:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8313B5C650A;
 Fri, 25 Jul 2025 01:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADBFC4CEED;
 Fri, 25 Jul 2025 01:02:16 +0000 (UTC)
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
X-Inumbo-ID: 035815cd-68f3-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753405338;
	bh=gV/hWBRJZ28ODKhSslqJuZAn53Umoi0RfcT7XlxDau0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MkrYE9mVEoy8FXLAynNSvCmj1OGHmG+SMnXdnQ3RoOA+m1OdifVUVJtdyq33oCo3K
	 NlpMvzWQCajidEbM5zWO1qSiyzJo7TX/UgnbSQYd8br3xq8l8YT9FPnV+GDqOEXvfU
	 aVZqFAPrfvxwwua2Eshdcc/jNib25aLkTS496ObQxNj/tk0Wcw4i5OAgHQQfz4excq
	 Ze9dcE9sFF7QvGsWuaQluUnKV6u6tqA8IvyNwvHJL5avZsUTeUIHjNPK/fddHtgO4h
	 KR8062yynahyCHto2xvi+5eNRNaXMz0abErVLRbMLPerj7laM+8zOr0y0PJeeuiQI1
	 UEa+FNbdpGVBg==
Date: Thu, 24 Jul 2025 18:02:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v3 1/2] xen/console: introduce CONSOLE_PREFIX
In-Reply-To: <20250606201102.2414022-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2507241801480.2549622@ubuntu-linux-20-04-desktop>
References: <20250606201102.2414022-1-dmukhin@ford.com> <20250606201102.2414022-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add CONSOLE_PREFIX symbol to keep the prefix of the hypervisor's diagnostic
> messages.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v2:
> - n/a
> ---
>  xen/drivers/char/console.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index e3731bf174..6e77b4af82 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -61,6 +61,9 @@ enum {
>      CONSOLE_ALL             = CONSOLE_DEFAULT | CONSOLE_RING,
>  };
>  
> +/* Prefix for hypervisor's diagnostic console messages. */
> +#define CONSOLE_PREFIX      "(XEN) "
> +
>  static void console_send(const char *str, size_t len, unsigned int flags);
>  
>  /* console: comma-separated list of console outputs. */
> @@ -1017,7 +1020,7 @@ static void vprintk_common(const char *fmt, va_list args, const char *prefix)
>  
>  void vprintk(const char *fmt, va_list args)
>  {
> -    vprintk_common(fmt, args, "(XEN) ");
> +    vprintk_common(fmt, args, CONSOLE_PREFIX);
>  }
>  
>  void printk(const char *fmt, ...)
> @@ -1288,7 +1291,7 @@ int __printk_ratelimit(int ratelimit_ms, int ratelimit_burst)
>              snprintf(lost_str, sizeof(lost_str), "%d", lost);
>              /* console_lock may already be acquired by printk(). */
>              rspin_lock(&console_lock);
> -            printk_start_of_line("(XEN) ");
> +            printk_start_of_line(CONSOLE_PREFIX);
>              __putstr("printk: ");
>              __putstr(lost_str);
>              __putstr(" messages suppressed.\n");
> -- 
> 2.34.1
> 
> 

