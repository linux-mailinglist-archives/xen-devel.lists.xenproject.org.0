Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB187DC135
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 21:29:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625397.974612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxYs8-0006m6-AE; Mon, 30 Oct 2023 20:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625397.974612; Mon, 30 Oct 2023 20:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxYs8-0006kR-7I; Mon, 30 Oct 2023 20:28:28 +0000
Received: by outflank-mailman (input) for mailman id 625397;
 Mon, 30 Oct 2023 20:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxYs7-0006kL-3r
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 20:28:27 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcd8754c-7762-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 21:28:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 29542CE021A;
 Mon, 30 Oct 2023 20:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1E0C433C7;
 Mon, 30 Oct 2023 20:28:12 +0000 (UTC)
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
X-Inumbo-ID: dcd8754c-7762-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698697693;
	bh=gOjjGJWV4rfGJ5PJd96TpHyh/9uG37MqNq0xqFUqPq8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WU0Z98s3cawv8nPEd/TeP8l+JRjhUfnh8W1RGIiSPrtdhJ0d5qD+VfsXyqPcZLfnn
	 UC90D4EHRbG2pLj5RWtdkTJmXeuvgMw7T6L1RXoaJTCNLS46rut0o0vaqteSDYEFAJ
	 DV1s2bv7NInw6Gj9LUDdkR7CTDA4FQxiuoLeid0X/ilrmFklwG4OB2t1VbA6SzHS8a
	 jfLpbGSp1F0lcuDPd2xrmAt+Mb3NboyUBL+4CSN0uhQuFr+JgAVSUYWKkNLWMWgOZX
	 cRR0xp6fxCIXg/xqzlMJEQfjDQwGwXOO0awF53/6uelnbBUaRTmqgl/jIBrkjHFG7N
	 Pf/SEbZ/rXe3A==
Date: Mon, 30 Oct 2023 13:28:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] console: conditionalize console_input_domain()
In-Reply-To: <59c59b19-40e0-aa1e-d775-31963e03144a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310301328030.271731@ubuntu-linux-20-04-desktop>
References: <59c59b19-40e0-aa1e-d775-31963e03144a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Jan Beulich wrote:
> The function was introduced for just one piece of code to use; it is
> dead code in cases where the respective Kconfig option is disabled, thus
> violating Misra C:2012 rule 2.1 there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -475,6 +475,7 @@ static unsigned int __read_mostly consol
>  
>  #define max_console_rx (max_init_domid + 1)
>  
> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>  /* Make sure to rcu_unlock_domain after use */
>  struct domain *console_input_domain(void)
>  {
> @@ -482,6 +483,7 @@ struct domain *console_input_domain(void
>              return NULL;
>      return rcu_lock_domain_by_id(console_rx - 1);
>  }
> +#endif
>  
>  static void switch_serial_input(void)
>  {
> 

