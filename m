Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE893958E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762402.1172576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0gN-0002ls-CU; Mon, 22 Jul 2024 21:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762402.1172576; Mon, 22 Jul 2024 21:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0gN-0002jr-9L; Mon, 22 Jul 2024 21:34:59 +0000
Received: by outflank-mailman (input) for mailman id 762402;
 Mon, 22 Jul 2024 21:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0gL-0002hm-Te
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:34:57 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bd1147b-4872-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 23:34:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id BC607A02D3;
 Mon, 22 Jul 2024 23:34:53 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iNF4bzqf-Db; Mon, 22 Jul 2024 23:34:53 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9CB80A02CA;
 Mon, 22 Jul 2024 23:34:53 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0gH-0000000AlLE-0xiA; Mon, 22 Jul 2024 23:34:53 +0200
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
X-Inumbo-ID: 3bd1147b-4872-11ef-8776-851b0ebba9a2
Date: Mon, 22 Jul 2024 23:34:53 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 3/4] mini-os: mm: reduce buddy allocator list
 administration data
Message-ID: <20240722213453.2seamcvsig5zkff3@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722150141.31391-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 17:01:40 +0200, a ecrit:
> Today the administration data for the buddy allocator's lists consists
> of 2 arrays: one pointer array and one list element array for easier
> handling of the lists' tails.
> 
> Those arrays can be combined into one by dropping the pointer array and
> using a different list end indicator.
> 
> Add enqueue and dequeue helpers for better readability.
> 
> Change the level member type to unsigned int.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  mm.c | 73 ++++++++++++++++++++++++++++--------------------------------
>  1 file changed, 34 insertions(+), 39 deletions(-)
> 
> diff --git a/mm.c b/mm.c
> index 2cc49e94..96686a5c 100644
> --- a/mm.c
> +++ b/mm.c
> @@ -125,16 +125,30 @@ static void map_free(unsigned long first_page, unsigned long nr_pages)
>  typedef struct chunk_head_st chunk_head_t;
>  
>  struct chunk_head_st {
> -    chunk_head_t  *next;
> -    chunk_head_t **pprev;
> -    int            level;
> +    chunk_head_t *next;
> +    chunk_head_t *prev;
> +    unsigned int  level;
>  };
>  
>  /* Linked lists of free chunks of different powers-of-two in size. */
>  #define FREELIST_SIZE ((sizeof(void *) << 3) - PAGE_SHIFT)
> -static chunk_head_t *free_head[FREELIST_SIZE];
> -static chunk_head_t  free_tail[FREELIST_SIZE];
> -#define FREELIST_EMPTY(_l) ((_l)->next == NULL)
> +static chunk_head_t  free_list[FREELIST_SIZE];
> +#define FREELIST_EMPTY(_l) ((_l)->level == FREELIST_SIZE)
> +
> +static void enqueue_elem(chunk_head_t *elem, unsigned int level)
> +{
> +    elem->level = level;
> +    elem->next = free_list[level].next;
> +    elem->prev = &free_list[level];
> +    elem->next->prev = elem;
> +    free_list[level].next = elem;
> +}
> +
> +static void dequeue_elem(chunk_head_t *elem)
> +{
> +    elem->prev->next = elem->next;
> +    elem->next->prev = elem->prev;
> +}
>  
>  /*
>   * Initialise allocator, placing addresses [@min,@max] in free pool.
> @@ -151,9 +165,9 @@ static void init_page_allocator(unsigned long min, unsigned long max)
>             (u_long)to_virt(min), min, (u_long)to_virt(max), max);
>      for ( i = 0; i < FREELIST_SIZE; i++ )
>      {
> -        free_head[i]       = &free_tail[i];
> -        free_tail[i].pprev = &free_head[i];
> -        free_tail[i].next  = NULL;
> +        free_list[i].next  = &free_list[i];
> +        free_list[i].prev  = &free_list[i];
> +        free_list[i].level = FREELIST_SIZE;
>      }
>  
>      min = round_pgup(min);
> @@ -209,12 +223,7 @@ static void init_page_allocator(unsigned long min, unsigned long max)
>              ch = (chunk_head_t *)r_min;
>              r_min += 1UL << i;
>              range -= 1UL << i;
> -            i -= PAGE_SHIFT;
> -            ch->level       = i;
> -            ch->next        = free_head[i];
> -            ch->pprev       = &free_head[i];
> -            ch->next->pprev = &ch->next;
> -            free_head[i]    = ch;
> +            enqueue_elem(ch, i - PAGE_SHIFT);
>          }
>      }
>  
> @@ -233,17 +242,16 @@ unsigned long alloc_pages(int order)
>      /* Find smallest order which can satisfy the request. */
>      for ( i = order; i < FREELIST_SIZE; i++ )
>      {
> -        if ( !FREELIST_EMPTY(free_head[i]) )
> +        if ( !FREELIST_EMPTY(free_list[i].next) )
>              break;
>      }
>  
> -    if ( i == FREELIST_SIZE )
> +    if ( i >= FREELIST_SIZE )
>          goto no_memory;
>  
>      /* Unlink a chunk. */
> -    alloc_ch = free_head[i];
> -    free_head[i] = alloc_ch->next;
> -    alloc_ch->next->pprev = alloc_ch->pprev;
> +    alloc_ch = free_list[i].next;
> +    dequeue_elem(alloc_ch);
>  
>      /* We may have to break the chunk a number of times. */
>      while ( i != order )
> @@ -254,13 +262,7 @@ unsigned long alloc_pages(int order)
>                                      (1UL << (i + PAGE_SHIFT)));
>  
>          /* Create new header for spare chunk. */
> -        spare_ch->level = i;
> -        spare_ch->next  = free_head[i];
> -        spare_ch->pprev = &free_head[i];
> -
> -        /* Link in the spare chunk. */
> -        spare_ch->next->pprev = &spare_ch->next;
> -        free_head[i] = spare_ch;
> +        enqueue_elem(spare_ch, i);
>      }
>  
>      map_alloc(PHYS_PFN(to_phys(alloc_ch)), 1UL << order);
> @@ -308,18 +310,13 @@ void free_pages(void *pointer, int order)
>          }
>  
>          /* We are committed to merging, unlink the chunk */
> -        *(to_merge_ch->pprev) = to_merge_ch->next;
> -        to_merge_ch->next->pprev = to_merge_ch->pprev;
> +        dequeue_elem(to_merge_ch);
>  
>          order++;
>      }
>  
>      /* Link the new chunk */
> -    freed_ch->level = order;
> -    freed_ch->next  = free_head[order];
> -    freed_ch->pprev = &free_head[order];
> -    freed_ch->next->pprev = &freed_ch->next;
> -    free_head[order] = freed_ch;
> +    enqueue_elem(freed_ch, order);
>  
>  }
>  EXPORT_SYMBOL(free_pages);
> @@ -405,13 +402,11 @@ void sanity_check(void)
>  
>      for ( x = 0; x < FREELIST_SIZE; x++ )
>      {
> -        for ( head = free_head[x]; !FREELIST_EMPTY(head); head = head->next )
> +        for ( head = free_list[x].next; !FREELIST_EMPTY(head);
> +              head = head->next )
>          {
>              ASSERT(!allocated_in_map(virt_to_pfn(head)));
> -            if ( head->next )
> -                ASSERT(head->next->pprev == &head->next);
> +            ASSERT(head->next->prev == head);
>          }
> -        if ( free_head[x] )
> -            ASSERT(free_head[x]->pprev == &free_head[x]);
>      }
>  }
> -- 
> 2.43.0
> 

-- 
Samuel
/*
 * [...] Note that 120 sec is defined in the protocol as the maximum
 * possible RTT.  I guess we'll have to use something other than TCP
 * to talk to the University of Mars.
 * PAWS allows us longer timeouts and large windows, so once implemented
 * ftp to mars will work nicely.
 */
(from /usr/src/linux/net/inet/tcp.c, concerning RTT [retransmission timeout])

