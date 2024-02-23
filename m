Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA486201E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 23:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684966.1065271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeTM-0002XB-7E; Fri, 23 Feb 2024 22:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684966.1065271; Fri, 23 Feb 2024 22:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdeTM-0002Ur-4S; Fri, 23 Feb 2024 22:56:52 +0000
Received: by outflank-mailman (input) for mailman id 684966;
 Fri, 23 Feb 2024 22:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdeTK-0002Ue-M8
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 22:56:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1e5ca62-d29e-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 23:56:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5946DCE286D;
 Fri, 23 Feb 2024 22:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639C9C433F1;
 Fri, 23 Feb 2024 22:56:43 +0000 (UTC)
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
X-Inumbo-ID: d1e5ca62-d29e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708729004;
	bh=8tFUB0YujzU0UFzQ+rQJCSmQzCxHBhbk3AZvnWwBN9c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qK42QPUpJGP9IZWf4210kWO/VboKmV82Esq7856ZDrRoMo3WtWtekUVGVBmvvWwJ9
	 KLB/q7QQZsmKes+nj49fXBbFbNz7TiyVypHI2P9h3/dk6+M48H4h1GMyk58EZg24h7
	 s2U1PxVuTXe3Z0c8FjZr6cnIkEfhloQs2LjvAT6UUpjUvyvYYRGpAbDAfluMEqMn+F
	 RFQNDQkQntSB+fqoZZiejroSYCe3VVz8+ir3uo/0gPQ/vAEWKvgxRnASdMz4RoMwNx
	 7hEAw4wlxOo1/dvFmRCY4am8nrSrJ3mUferJW6XBdFkh3Q/yAa67wGN6DbkZ9+44iT
	 kvKw64zLIvaJQ==
Date: Fri, 23 Feb 2024 14:56:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/2] xen/console: drop return value from
 consoled_guest_rx/tx
In-Reply-To: <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com> <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Feb 2024, Nicola Vetrini wrote:
> These functions never saw a usage of their return value since
> they were introduced, so it can be dropped since their usages
> violate MISRA C Rule 17.7:
> "The value returned by a function having non-void return type shall be used".
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/char/consoled.c | 17 +++++------------
>  xen/include/xen/consoled.h  |  4 ++--
>  2 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
> index 222e01844271..b415b632cecc 100644
> --- a/xen/drivers/char/consoled.c
> +++ b/xen/drivers/char/consoled.c
> @@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
>  static char buf[BUF_SZ + 1];
>  
>  /* Receives characters from a domain's PV console */
> -size_t consoled_guest_rx(void)
> +void consoled_guest_rx(void)
>  {
> -    size_t recv = 0, idx = 0;
> +    size_t idx = 0;
>      XENCONS_RING_IDX cons, prod;
>  
>      if ( !cons_ring )
> -        return 0;
> +        return;
>  
>      spin_lock(&rx_lock);
>  
> @@ -73,7 +73,6 @@ size_t consoled_guest_rx(void)
>          char c = cons_ring->out[MASK_XENCONS_IDX(cons++, cons_ring->out)];
>  
>          buf[idx++] = c;
> -        recv++;
>  
>          if ( idx >= BUF_SZ )
>          {
> @@ -92,18 +91,15 @@ size_t consoled_guest_rx(void)
>  
>   out:
>      spin_unlock(&rx_lock);
> -
> -    return recv;
>  }
>  
>  /* Sends a character into a domain's PV console */
> -size_t consoled_guest_tx(char c)
> +void consoled_guest_tx(char c)
>  {
> -    size_t sent = 0;
>      XENCONS_RING_IDX cons, prod;
>  
>      if ( !cons_ring )
> -        return 0;
> +        return;
>  
>      cons = ACCESS_ONCE(cons_ring->in_cons);
>      prod = cons_ring->in_prod;
> @@ -121,7 +117,6 @@ size_t consoled_guest_tx(char c)
>          goto notify;
>  
>      cons_ring->in[MASK_XENCONS_IDX(prod++, cons_ring->in)] = c;
> -    sent++;
>  
>      /* Write to the ring before updating the pointer */
>      smp_wmb();
> @@ -130,8 +125,6 @@ size_t consoled_guest_tx(char c)
>   notify:
>      /* Always notify the guest: prevents receive path from getting stuck. */
>      pv_shim_inject_evtchn(pv_console_evtchn());
> -
> -    return sent;
>  }
>  
>  /*
> diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
> index 2b30516b3a0a..bd7ab6329ee8 100644
> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -5,8 +5,8 @@
>  
>  void consoled_set_ring_addr(struct xencons_interface *ring);
>  struct xencons_interface *consoled_get_ring_addr(void);
> -size_t consoled_guest_rx(void);
> -size_t consoled_guest_tx(char c);
> +void consoled_guest_rx(void);
> +void consoled_guest_tx(char c);
>  
>  #endif /* __XEN_CONSOLED_H__ */
>  /*
> -- 
> 2.34.1
> 

