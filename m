Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17529EE314
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 10:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855601.1268465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLfXR-00077b-Lm; Thu, 12 Dec 2024 09:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855601.1268465; Thu, 12 Dec 2024 09:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLfXR-00075f-Hv; Thu, 12 Dec 2024 09:31:17 +0000
Received: by outflank-mailman (input) for mailman id 855601;
 Thu, 12 Dec 2024 09:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLfXP-0006Kx-If
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 09:31:15 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4f04391-b86b-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 10:31:14 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f804233so492301a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 01:31:14 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6701b08c2sm712832266b.124.2024.12.12.01.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 01:31:13 -0800 (PST)
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
X-Inumbo-ID: d4f04391-b86b-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733995874; x=1734600674; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qgudi9dn3mJ13z1xTj/cewsTNQ/AtX31LoBxoz18FyY=;
        b=vFZLOXDf+JxR3qqPkp5RGPZdBJKMJPy6xzQak5WHWUgtDhdFLl7Y1HfCRaNvqtQ7fv
         XCdY8dnms9zHs+c0DlTz6J9pzSWtYCU0cAJZr3yT1vvrVAeTQpH62PZDyDM0PxvIsuSi
         OMoAaKIrIA3ISPQnMVFxg2mr9y88hpi0YUhWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733995874; x=1734600674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgudi9dn3mJ13z1xTj/cewsTNQ/AtX31LoBxoz18FyY=;
        b=vgK0J96Ki8iceC8tZjRh7V20Gw5PqaGVIqhEm9ea21GNxaqzgmkhsQ6SDC1N5nJvcf
         vnz4BCwU7biKH3rBJAd0BVomWYo85qjgE421jyD9IZqs1lenNjl0OMRsCcPPuY0QgxY4
         HtTHqGrPCshorXiPEuD3VNYj8Hxa5q9DZHv+yhFefVXN/e8DR+7m5NCmnD3xY35TX6o+
         qqGSA5qbr3fSAgIbfA/LJs12t2rrboW+5+mQRtPr3YiK44EwX6Ebiofqc9yqOCH88c2q
         BTTkwTvUQbO42nr1PKbe0DaUGxDwpOx9jB/XbEhPzfJRUis/LIVfhf9uQq91H2EcQ9La
         20GA==
X-Gm-Message-State: AOJu0YxXZtataChIogyjB2xYwlx9thUotuILyG6ZG9o8mRD2yvstjcWY
	S3sA/awhO03dRE0qYgd5yfyfTV/JwS+VM12EjXrqzRZbmCFsqwUEfDmtN0skk0Q=
X-Gm-Gg: ASbGncs5wtRm2i8dTNPxg9Y2BCQSluv8U4oSuCqP3oXocOH57CNSsjlWbVtDZP0hxz4
	a7ntc4k2VxPKQ3BOMGrS736YzKvLoYtGK2z8b31oyJADsNG2qCQhdXu8tUiY78dGd3tnFzR7Sg+
	VXUAruJiU0n3yz21zQHhETfvboCF9psN8k4oV2GM0uoZApXuXqCUUR/8EtKmMYFaAAt/X2Yh1Lx
	qynu6r/aQ8E776PqVEkIxiN3ZBpyufbRh/8ilPjeRVHCluHPEBZUOC4keMYZel9mA==
X-Google-Smtp-Source: AGHT+IF6rP1hm1fVeWkQl6kVHqGGGmFa5/aiK6pMSYZ7K4HUk0zNVqnlIY8yYjyPF6ORoaOJ8S+PHA==
X-Received: by 2002:a17:906:311a:b0:aa5:2575:e75d with SMTP id a640c23a62f3a-aa6b1141c72mr600474266b.2.1733995874036;
        Thu, 12 Dec 2024 01:31:14 -0800 (PST)
Date: Thu, 12 Dec 2024 10:31:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 17/35] xen/console: introduce consoled_is_enabled()
Message-ID: <Z1qtYO9Kr-9bzwEh@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-17-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:47PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> There are few places which check pv_shim console under CONFIG_PV_SHIM in xen
> console driver. Instead of #ifdef-ing, use new consoled_is_enabled() to
> customize the logic.
> 
> Header file now can be included w/o CONFIG_X86.
> 
> Signature of consoled_guest_{rx,tx} has changed to account for follow-on
> console switch logic cleanup.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c  | 10 +++-------
>  xen/drivers/char/consoled.c | 18 ++++++++++++++----
>  xen/include/xen/consoled.h  | 35 +++++++++++++++++++++++++++++++++--
>  3 files changed, 50 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index f034ce5aab3f3bf59b0df9fa583ee9ce32dbf665..60c055396b697869b04b9132b0dcfa832fabe932 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,9 +33,9 @@
>  #include <xen/pv_console.h>
>  #include <asm/setup.h>
>  #include <xen/sections.h>
> +#include <xen/consoled.h>
>  
>  #ifdef CONFIG_X86
> -#include <xen/consoled.h>
>  #include <asm/guest.h>
>  #endif
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
> @@ -505,11 +505,9 @@ static void console_find_owner(void)
>              break;
>          }
>  
> -#ifdef CONFIG_PV_SHIM
> -        if ( next_rx == 1 )
> +        if ( consoled_is_enabled() && next_rx == 1 )
>              domid = get_initial_domain_id();
>          else
> -#endif
>              domid = next_rx - 1;
>          d = rcu_lock_domain_by_id(domid);
>          if ( d )
> @@ -573,10 +571,8 @@ static void __serial_rx(char c)
>  #endif
>      }
>  
> -#ifdef CONFIG_X86
> -    if ( pv_shim && pv_console )
> +    if ( consoled_is_enabled() )
>          consoled_guest_tx(c);
> -#endif
>  }
>  
>  static void cf_check serial_rx(char c)
> diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
> index b415b632cecc0a80e161b701d7b70ba4f3cc5fb8..d6624e7697f56e1a1959b0efa5dca104f34af002 100644
> --- a/xen/drivers/char/consoled.c
> +++ b/xen/drivers/char/consoled.c
> @@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
>  static char buf[BUF_SZ + 1];
>  
>  /* Receives characters from a domain's PV console */
> -void consoled_guest_rx(void)
> +int consoled_guest_rx(void)
>  {
>      size_t idx = 0;
>      XENCONS_RING_IDX cons, prod;
>  
>      if ( !cons_ring )
> -        return;
> +        return 0;
>  
>      spin_lock(&rx_lock);
>  
> @@ -91,15 +91,17 @@ void consoled_guest_rx(void)
>  
>   out:
>      spin_unlock(&rx_lock);
> +
> +    return 0;
>  }
>  
>  /* Sends a character into a domain's PV console */
> -void consoled_guest_tx(char c)
> +int consoled_guest_tx(char c)
>  {
>      XENCONS_RING_IDX cons, prod;
>  
>      if ( !cons_ring )
> -        return;
> +        return 0;
>  
>      cons = ACCESS_ONCE(cons_ring->in_cons);
>      prod = cons_ring->in_prod;
> @@ -118,6 +120,7 @@ void consoled_guest_tx(char c)
>  
>      cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] = c;
>  
> +
>      /* Write to the ring before updating the pointer */
>      smp_wmb();
>      ACCESS_ONCE(cons_ring->in_prod) = prod;
> @@ -125,6 +128,13 @@ void consoled_guest_tx(char c)
>   notify:
>      /* Always notify the guest: prevents receive path from getting stuck. */
>      pv_shim_inject_evtchn(pv_console_evtchn());
> +
> +    return 0;
> +}
> +
> +bool consoled_is_enabled(void)
> +{
> +    return pv_shim && pv_console;
>  }
>  
>  /*
> diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
> index bd7ab6329ee8a7c466484021247241ded8ed03c7..696677fa5a3be458a0ec93360e08376c3471f95b 100644
> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -3,10 +3,41 @@
>  
>  #include <public/io/console.h>
>  
> +#if defined(CONFIG_PV_SHIM)
> +
>  void consoled_set_ring_addr(struct xencons_interface *ring);
>  struct xencons_interface *consoled_get_ring_addr(void);
> -void consoled_guest_rx(void);
> -void consoled_guest_tx(char c);
> +int consoled_guest_rx(void);
> +int consoled_guest_tx(char c);
> +bool consoled_is_enabled(void);
> +
> +#else
> +
> +static inline void consoled_set_ring_addr(struct xencons_interface *ring)
> +{
> +}
> +
> +static inline struct xencons_interface *consoled_get_ring_addr(void)
> +{
> +    return NULL;
> +}
> +
> +static inline int consoled_guest_rx(void)
> +{
> +    return 0;
> +}

You don't need to provide dummy implementations of
consoled_{set,get}_ring_addr() and consoled_guest_rx(), they are only
called from code that's build when CONFIG_PV_SHIM is selected.

> +static inline int consoled_guest_tx(char c)
> +{
> +    return 0;

For consoled_guest_tx() you want to add an ASSERT_UNREACHABLE(), as
it should never be called if !CONFIG_PV_SHIM?

Thanks, Roger.

