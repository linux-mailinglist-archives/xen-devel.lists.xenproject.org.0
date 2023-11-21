Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C907F227F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637434.993234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Exh-0000T8-Sg; Tue, 21 Nov 2023 00:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637434.993234; Tue, 21 Nov 2023 00:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Exh-0000RQ-Pq; Tue, 21 Nov 2023 00:49:57 +0000
Received: by outflank-mailman (input) for mailman id 637434;
 Tue, 21 Nov 2023 00:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5Exg-0000RI-1b
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:49:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e259bcef-8807-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 01:49:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A278CB81C84;
 Tue, 21 Nov 2023 00:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD35EC433C9;
 Tue, 21 Nov 2023 00:49:51 +0000 (UTC)
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
X-Inumbo-ID: e259bcef-8807-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700527792;
	bh=05e9fkep8pIy8QiX75uiBvfa+BpkZO+PGxJIJ9Kgdxg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bOqM7An5PYIqDce8J+8DlFN3fA2Rctcy66oAVk28LAh7+8NxB3BShT075NzYOV2LI
	 +UQKx25FqA0URvccDe3B6vEWeutgh1zT8Cg+HOgGfKn6oTjg3fWC8tDNNzw8ZH/MKC
	 ng+JHd600X0Y2rCC2nc0wXSkWViikS6+w+yop3MzSJteFd9dLANN84A/Y8s0nlGDRS
	 5tDyAiVzugoJbmDqUvF5gXvZeOnBm7qhhWcuo2cwDvv8G6HkvmPXKeI15oZMGHPuGP
	 EE48jMP3+PYf9i2ogAftJn6w6bjLs895H2CZdnYGuT7ssOl/mBUCqUgegC/YUl5VV6
	 4qkJL8X7SxVfQ==
Date: Mon, 20 Nov 2023 16:49:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 4/6] arm/duart: make dt_uart_init() compile with
 -Wwrite-strings
In-Reply-To: <20231120224912.1421916-5-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311201649430.773207@ubuntu-linux-20-04-desktop>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com> <20231120224912.1421916-5-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Nov 2023, Andrew Cooper wrote:
> GCC complains:
> 
>   drivers/char/arm-uart.c: In function 'dt_uart_init':
>   drivers/char/arm-uart.c:81:17: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>      81 |         options = "";
>         |                 ^
> 
> The problem is using the options string for both splitting opt_duart, and to
> hold a token "" for no options.
> 
> Use two variables; one mutable one one const.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/drivers/char/arm-uart.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/char/arm-uart.c b/xen/drivers/char/arm-uart.c
> index 8098a968c285..91f13a41368d 100644
> --- a/xen/drivers/char/arm-uart.c
> +++ b/xen/drivers/char/arm-uart.c
> @@ -42,7 +42,8 @@ static void __init dt_uart_init(void)
>      struct dt_device_node *dev;
>      int ret;
>      const char *devpath = opt_dtuart;
> -    char *options;
> +    const char *options;
> +    char *split;
>  
>      if ( !console_has("dtuart") )
>          return; /* Not for us */
> @@ -74,9 +75,12 @@ static void __init dt_uart_init(void)
>          return;
>      }
>  
> -    options = strchr(opt_dtuart, ':');
> -    if ( options != NULL )
> -        *(options++) = '\0';
> +    split = strchr(opt_dtuart, ':');
> +    if ( split )
> +    {
> +        split[0] = '\0';
> +        options = split + 1;
> +    }
>      else
>          options = "";
>  
> -- 
> 2.30.2
> 
> 

