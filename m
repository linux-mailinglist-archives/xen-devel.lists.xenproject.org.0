Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559BD939595
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762414.1172589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0hC-0003JQ-NB; Mon, 22 Jul 2024 21:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762414.1172589; Mon, 22 Jul 2024 21:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0hC-0003HO-JA; Mon, 22 Jul 2024 21:35:50 +0000
Received: by outflank-mailman (input) for mailman id 762414;
 Mon, 22 Jul 2024 21:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0hB-0003Gj-Eu
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:35:49 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa2eaa5-4872-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 23:35:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7FBE3A02D3;
 Mon, 22 Jul 2024 23:35:45 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJFKTno6uo6F; Mon, 22 Jul 2024 23:35:45 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 60FCFA02CA;
 Mon, 22 Jul 2024 23:35:45 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0h6-0000000Ankn-4A6Z; Mon, 22 Jul 2024 23:35:44 +0200
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
X-Inumbo-ID: 5aa2eaa5-4872-11ef-8776-851b0ebba9a2
Date: Mon, 22 Jul 2024 23:35:44 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 4/4] mini-os: remove sanity_check()
Message-ID: <20240722213544.hjyohnoz4mtcfltr@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722150141.31391-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 17:01:41 +0200, a ecrit:
> Remove the sanity_check() function, as it is used nowhere.
> 
> Since any application linked with Mini-OS can't call sanity_check()
> either (there is no EXPORT_SYMBOL for it), there is zero chance of
> breaking any use case.

Don't we still want to keep it around, at least as formal documentation
of the expected status of the list?

Samuel

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  include/lib.h |  3 ---
>  mm.c          | 16 ----------------
>  2 files changed, 19 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index abd4e9ab..acd4acc6 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -152,9 +152,6 @@ do {                                                           \
>  
>  #define BUG_ON(x) ASSERT(!(x))
>  
> -/* Consistency check as much as possible. */
> -void sanity_check(void);
> -
>  /* Get own domid. */
>  domid_t get_domid(void);
>  
> diff --git a/mm.c b/mm.c
> index 96686a5c..1fa7e7bf 100644
> --- a/mm.c
> +++ b/mm.c
> @@ -394,19 +394,3 @@ void init_mm(void)
>  void fini_mm(void)
>  {
>  }
> -
> -void sanity_check(void)
> -{
> -    int x;
> -    chunk_head_t *head;
> -
> -    for ( x = 0; x < FREELIST_SIZE; x++ )
> -    {
> -        for ( head = free_list[x].next; !FREELIST_EMPTY(head);
> -              head = head->next )
> -        {
> -            ASSERT(!allocated_in_map(virt_to_pfn(head)));
> -            ASSERT(head->next->prev == head);
> -        }
> -    }
> -}
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

