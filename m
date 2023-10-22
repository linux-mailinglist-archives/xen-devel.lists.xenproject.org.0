Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE83A7D24A9
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 18:53:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620812.966697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qubgR-0006Jy-EA; Sun, 22 Oct 2023 16:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620812.966697; Sun, 22 Oct 2023 16:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qubgR-0006Ha-Ah; Sun, 22 Oct 2023 16:52:11 +0000
Received: by outflank-mailman (input) for mailman id 620812;
 Sun, 22 Oct 2023 16:52:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qubgP-0006HU-IB
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 16:52:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qubgP-0003lP-8o; Sun, 22 Oct 2023 16:52:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qubgO-0005IL-SM; Sun, 22 Oct 2023 16:52:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=4/8BzTvAHH1Kqb9LSb+VGvUpqifptTUQl4x8uOXx/yY=; b=yMImo9GRWGeqKSBlBM8qi99f0e
	TSNUoSiGui/lggt27k1ki/IURrLxvMe1m/t3jv77ciMDbydBiGNEHNDt3FmtFFmowWYlvMgH+D8jy
	YrPyIYg+96mgCM+CV67XdKOq/B/t+Hm0tZ0dfCFPj32AndhxcbXDA5WG5sd2d2slXSlI=;
Message-ID: <2f3180d3-883d-466e-a454-762aa16c9e7a@xen.org>
Date: Sun, 22 Oct 2023 17:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/xmalloc: XMEM_POOL_POISON improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 20/10/2023 21:26, Andrew Cooper wrote:
> When in use, the spew:
> 
>    (XEN) Assertion '!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE, (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE)' failed at common/xmalloc_tlsf.c:246
> 
> is unweidly and meaningless to non-Xen developers.  Therefore:
> 
>   * Switch to IS_ENABLED().  There's no need for full #ifdef-ary.
>   * Pull memchr_inv() out into the if(), and provide a better error message.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Observations from the debugging of:
>    https://github.com/Dasharo/dasharo-issues/issues/488
> 
> There's a further bug.  XMEM_POOL_POISON can be enabled in release builds,
> where the ASSERT() gets dropped.
> 
> However, upping to a BUG() can't provide any helpful message out to the user.
> 
> I tried modifying BUG() to take an optional message, but xen/bug.h needs
> untangling substantially before that will work, and I don't have time right now.

Do we actually care about the registers values? If not, we can either use:

printk(...);
BUG();

Or

panic(...);

This would allow us to use XMEM_POOL_POISON in prod build before BUG() 
can accept string.

> ---
>   xen/common/xmalloc_tlsf.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
> index 349b31cb4cc1..13305cd87c2f 100644
> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -249,11 +249,11 @@ static inline void EXTRACT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl,
>       }
>       b->ptr.free_ptr = (struct free_ptr) {NULL, NULL};
>   
> -#ifdef CONFIG_XMEM_POOL_POISON
> -    if ( (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE )
> -        ASSERT(!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE,
> -                           (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE));
> -#endif /* CONFIG_XMEM_POOL_POISON */
> +    if ( IS_ENABLED(CONFIG_XMEM_POOL_POISON) &&
> +         (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE &&
> +         memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE,
> +                    (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE) )
> +        ASSERT(!"XMEM Pool corruption found");
>   }
>   
>   /**
> @@ -261,11 +261,10 @@ static inline void EXTRACT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl,
>    */
>   static inline void INSERT_BLOCK(struct bhdr *b, struct xmem_pool *p, int fl, int sl)
>   {
> -#ifdef CONFIG_XMEM_POOL_POISON
> -    if ( (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE )
> +    if ( IS_ENABLED(CONFIG_XMEM_POOL_POISON) &&
> +         (b->size & BLOCK_SIZE_MASK) > MIN_BLOCK_SIZE )
>           memset(b->ptr.buffer + MIN_BLOCK_SIZE, POISON_BYTE,
>                  (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE);
> -#endif /* CONFIG_XMEM_POOL_POISON */
>   
>       b->ptr.free_ptr = (struct free_ptr) {NULL, p->matrix[fl][sl]};
>       if ( p->matrix[fl][sl] )


Cheers,

-- 
Julien Grall

