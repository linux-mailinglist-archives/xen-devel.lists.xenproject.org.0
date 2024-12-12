Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DF9EE3D6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855627.1268478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgBJ-0007sj-IQ; Thu, 12 Dec 2024 10:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855627.1268478; Thu, 12 Dec 2024 10:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgBJ-0007ph-FD; Thu, 12 Dec 2024 10:12:29 +0000
Received: by outflank-mailman (input) for mailman id 855627;
 Thu, 12 Dec 2024 10:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLgBI-0007pb-UI
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:12:28 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9352db56-b871-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 11:12:21 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa67333f7d2so58285366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:12:26 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa687bbe83bsm574528166b.188.2024.12.12.02.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:12:25 -0800 (PST)
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
X-Inumbo-ID: 9352db56-b871-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733998346; x=1734603146; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+6IjAX4mVM3M7acEHQrD01ZAC0Q9A8vGkOVZ5x26frQ=;
        b=vR9OiGs0Qr7s9R2ED4kd+AQCRa4GYcn5QhtO0yjsqPdT7rxWfMvqNcbeStilwe7nzh
         gVRCF8yYsLUr+xN67+tDKCNUBwLGmEkbsPvfdM3YKCzMMRDIDpsXo4SWcQ94WFDuM5SL
         +Grauw0JjKnSj/FD4D64SvfnebL47Pxyi38jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998346; x=1734603146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6IjAX4mVM3M7acEHQrD01ZAC0Q9A8vGkOVZ5x26frQ=;
        b=woEUYwTtH4Iu4B2hkNCNeb7jwKV5ZzOgsYyinK61GP3o62K0nyEzLE3w7xBKQ6kgKw
         xZE99H1bdQdgCGNIgpuBeSjI4QhfhivMnaXfVMEOgCmXfiyUO7M2WoL5p57kD6/Z8Ihw
         iExmOFspIRVKFaoKXDX+s55i+ZZzotnACsJXzNTCwZ11+NOpp6nCWyBtxKs396aH/tA0
         FUve1znY5ynzQyq/SjxWR0rJNkeAI0ztb1IuBb1+PEIB0/bOEu8yuGLCe86p5qNi2Tea
         O/VKoxblcqjYD2cqA8BIOkxzxKKhyZnZc2iKyvBZytDeXtuQwR9WqkYn6eIMRPn/FSwn
         DYTw==
X-Gm-Message-State: AOJu0Yyc6sJ1NMy/PQUIsTqN1ZqgFJLYkoKf1xRS3hPVKYmPH74JKro7
	ndQZa4rvAqK/0U6snWIs6kOgVgH4/bXFbECkLpxSDp+m5pi6Kkfhy/rdNUdt27c=
X-Gm-Gg: ASbGncudWZAOp0Hd/ak1wSc917hjDt5MLpZrcGwuNWWZeS1wmOPATCLJWhLqnQCGpvK
	Z+1+Z1HQ2DjZCG40b+SPyvhNb7Wali/J24AoUS5+2098RL//dbkSe62uPRAJoLh9JeO+taSOW9e
	iZVsNTdCeCQJwvjqYqe4aCuxz8ru44oF3utzlo3sdKkGhgwDvSflr1J6KQfiYudU2N4jjCorsQE
	qt0G/99a29nJGGDVH9KJ3LDsRv77X0fcCgMj2pkRYC51n0Lwz1XSJzzr6orHQDT1Q==
X-Google-Smtp-Source: AGHT+IH1pIYcj0aTsC1/vmkvOZqV0BUtKm1CjpZnwAliOKqHhLU1HjQDukL0VQqGj7tpF2mf56/bCg==
X-Received: by 2002:a17:907:7856:b0:aa6:2b8b:20c6 with SMTP id a640c23a62f3a-aa6b11a0dd4mr547195966b.20.1733998345987;
        Thu, 12 Dec 2024 02:12:25 -0800 (PST)
Date: Thu, 12 Dec 2024 11:12:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
Message-ID: <Z1q3COsFN3J9G60E@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:49PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_set_owner() is introduced for setting the new console owner.
> 
> Switches console owner to domain ID vs range of integer numbers mapped to
> domain IDs.
> 
> This a public API to console driver, will be used in the follow on code change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 122 ++++++++++++++++++++++++++-------------------
>  xen/include/xen/console.h  |   1 +
>  2 files changed, 71 insertions(+), 52 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 8cbac54c66044ae8581e486a782102b75c8bfaa9..52cf64dbf6fd18d599cb88835d03501a23b3e3c4 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -463,82 +463,100 @@ static void cf_check dump_console_ring_key(unsigned char key)
>  
>  /*
>   * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
> - * and the DomUs started from Xen at boot.
> + * and the DomUs.
>   */
>  #define switch_code (opt_conswitch[0]-'a'+1)
> +
>  /*
> - * console_owner=0 => input to xen
> - * console_owner=1 => input to dom0 (or the sole shim domain)
> - * console_owner=N => input to dom(N-1)
> + * Current console owner domain ID: either Xen or domain w/ d->is_console ==
> + * true.
> + *
> + * Initialized in console_endboot().
>   */
> -static unsigned int __read_mostly console_owner = 0;
> +static domid_t __read_mostly console_owner;

Should this be initialized to DOMID_XEN?  I assume it doesn't make
much difference because the variable is not checked before
console_endboot() anyway, but it might be safer to initialize to a
value that assigns the console to Xen.

>  
> -#define max_console_rx (max_init_domid + 1)
> +static struct domain *rcu_lock_domain_console_by_id(domid_t domid)
> +{
> +    struct domain *d;
> +
> +    d = rcu_lock_domain_by_id(domid);
> +

Nit: I would remove this newline.

> +    if ( d == NULL )
> +        return NULL;
> +
> +    if ( d->is_console )
> +        return d;
> +
> +    rcu_unlock_domain(d);
> +
> +    return NULL;
> +}
>  
> -#ifdef CONFIG_SBSA_VUART_CONSOLE
>  /* Make sure to rcu_unlock_domain after use */
>  struct domain *rcu_lock_domain_console_owner(void)
>  {
> -    if ( console_owner == 0 )
> -            return NULL;
> -    return rcu_lock_domain_by_id(console_owner - 1);
> +    return rcu_lock_domain_console_by_id(console_owner);
>  }
> -#endif
>  
> -static void console_find_owner(void)
> +static bool console_owner_possible(domid_t domid)
>  {
> -    unsigned int next_rx = console_owner;
> -
> -    /*
> -     * Rotate among Xen, dom0 and boot-time created domUs while skipping
> -     * switching serial input to non existing domains.
> -     */
> -    for ( ; ; )
> -    {
> -        domid_t domid;
> -        struct domain *d;
> -
> -        if ( next_rx++ >= max_console_rx )
> -        {
> -            console_owner = 0;
> -            printk("*** Serial input to Xen");
> -            break;
> -        }
> -
> -        if ( consoled_is_enabled() && next_rx == 1 )
> -            domid = get_initial_domain_id();
> -        else
> -            domid = next_rx - 1;
> -
> -        d = rcu_lock_domain_by_id(domid);
> -        if ( d == NULL )
> -            continue;
> -
> -        if ( d->is_console )
> -        {
> -            rcu_unlock_domain(d);
> -            console_owner = next_rx;
> -            printk("*** Serial input to DOM%u", domid);
> -            break;
> -        }
> +    struct domain *d;
>  
> +    d = rcu_lock_domain_console_by_id(domid);
> +    if ( d != NULL )
>          rcu_unlock_domain(d);
> -    }
> +
> +    return d != NULL;
> +}
> +
> +int console_set_owner(domid_t domid)
> +{
> +    if ( domid == DOMID_XEN )
> +        printk("*** Serial input to Xen");
> +    else if ( console_owner_possible(domid) )
> +        printk("*** Serial input to DOM%u", domid);
> +    else
> +        return -ENOENT;
> +
> +    console_owner = domid;
>  
>      if ( switch_code )
>          printk(" (type 'CTRL-%c' three times to switch input)",
>                 opt_conswitch[0]);
>      printk("\n");
> +
> +    return 0;
> +}
> +
> +/*
> + * Switch console input focus.
> + * Rotates input focus among Xen, dom0 and boot-time created domUs while
> + * skipping switching serial input to non existing domains.
> + */
> +static void console_find_owner(void)
> +{
> +    domid_t i, n = max_init_domid + 1;

n can be made const, I would even rename to nr for clarity, but that's
personal taste.

> +
> +    if ( console_owner == DOMID_XEN )
> +        i = get_initial_domain_id();
> +    else
> +        i = console_owner + 1;
> +
> +    for ( ; i < n; i++ )
> +        if ( !console_set_owner(i) )
> +            break;

Hm, that could be a non-trivial amount of iteration if max_init_domid
is bumped for every domain created as you have it in patch 11/35
(albeit I'm not sure that was intended?)

> +    if ( i == n )
> +        console_set_owner(DOMID_XEN);
>  }
>  
>  static void __serial_rx(char c)
>  {
>      switch ( console_owner )
>      {
> -    case 0:
> +    case DOMID_XEN:
>          return handle_keypress(c, false);
>  
> -    case 1:
> +    case 0:

If console_owner now strictly contains a domid you cannot assume that
domid 0 is the hardware domain, you will need to handle this
differently and check whether the domain pointed by console_owner
passes the is_hardware_domain() check.

>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
> @@ -556,7 +574,7 @@ static void __serial_rx(char c)
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>      default:
>      {
> -        struct domain *d = rcu_lock_domain_by_id(console_owner - 1);
> +        struct domain *d = rcu_lock_domain_by_id(console_owner);
>  
>          /*
>           * If we have a properly initialized vpl011 console for the
> @@ -567,7 +585,7 @@ static void __serial_rx(char c)
>              vpl011_rx_char_xen(d, c);
>          else
>              printk("Cannot send chars to Dom%d: no UART available\n",
> -                   console_owner - 1);
> +                   console_owner);
>  
>          if ( d != NULL )
>              rcu_unlock_domain(d);
> @@ -1126,7 +1144,7 @@ void __init console_endboot(void)
>       * a useful 'how to switch' message.
>       */
>      if ( opt_conswitch[1] == 'x' )
> -        console_owner = max_console_rx;
> +        console_owner = DOMID_XEN;

Hm, are you sure this still works as expected?  Setting console_owner
== DOMID_XEN will cause the call to switch_serial_input() below to
switch the console back to the first domain in the system.  Also
initializing console_owner to 0 by default would also cause the call
to switch_serial_input() to possibly switch it to the first domain
after domid 0 (or back to Xen).

Thanks, Roger.

