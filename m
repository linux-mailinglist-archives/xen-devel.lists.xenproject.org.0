Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A283F36E803
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119836.226566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc30v-0005Iv-Qq; Thu, 29 Apr 2021 09:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119836.226566; Thu, 29 Apr 2021 09:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc30v-0005IY-Ne; Thu, 29 Apr 2021 09:31:17 +0000
Received: by outflank-mailman (input) for mailman id 119836;
 Thu, 29 Apr 2021 09:31:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc30t-0005IA-TP
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:31:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daf7eead-c94e-4af9-aea9-f483e61b1c38;
 Thu, 29 Apr 2021 09:31:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3BA10B004;
 Thu, 29 Apr 2021 09:31:09 +0000 (UTC)
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
X-Inumbo-ID: daf7eead-c94e-4af9-aea9-f483e61b1c38
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619688669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAekxrxornC8EWfdiuAI1iWCTS4Ircvg83KybkTn3k8=;
	b=dO2PY+4Hj1nUgvHnzWwBU6IXA2Mr4eekbaQ9tRQdJ9HIJq/ZngLak+DmhOWgDxb/HoLO0r
	GYAesu49/40OE0lNVOEM9rDlqSobD8nEf3IkXWpUo0QfYIsa12lYCP28LcLhASAZfbDblU
	JyzHTJwBJEPBR0rWZcb6PhsIQyQxSeY=
Subject: Ping: [PATCH v3] gnttab: defer allocation of status frame tracking
 array
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
Message-ID: <bea459c9-32ed-a800-40ea-456b465cd38a@suse.com>
Date: Thu, 29 Apr 2021 11:31:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 11:41, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway, by doing this only
> in gnttab_populate_status_frames().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I know there has been controversy here. Julien - you seemed to agree,
and iirc you partly drove how the patch is looking now. May I ask for
an ack? Andrew - you disagreed for reasons that neither Julien nor I
could really understand. Would you firmly nack the change and suggest
a way out, or would you allow this to go in with someone else's ack?

Thanks, Jan

> ---
> v3: Drop smp_wmb(). Re-base.
> v2: Defer allocation to when a domain actually switches to the v2 grant
>     API.
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1747,6 +1747,17 @@ gnttab_populate_status_frames(struct dom
>      /* Make sure, prior version checks are architectural visible */
>      block_speculation();
>  
> +    if ( gt->status == ZERO_BLOCK_PTR )
> +    {
> +        gt->status = xzalloc_array(grant_status_t *,
> +                                   grant_to_status_frames(gt->max_grant_frames));
> +        if ( !gt->status )
> +        {
> +            gt->status = ZERO_BLOCK_PTR;
> +            return -ENOMEM;
> +        }
> +    }
> +
>      for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
>      {
>          if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
> @@ -1767,18 +1778,23 @@ status_alloc_failed:
>          free_xenheap_page(gt->status[i]);
>          gt->status[i] = NULL;
>      }
> +    if ( !nr_status_frames(gt) )
> +    {
> +        xfree(gt->status);
> +        gt->status = ZERO_BLOCK_PTR;
> +    }
>      return -ENOMEM;
>  }
>  
>  static int
>  gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
>  {
> -    unsigned int i;
> +    unsigned int i, n = nr_status_frames(gt);
>  
>      /* Make sure, prior version checks are architectural visible */
>      block_speculation();
>  
> -    for ( i = 0; i < nr_status_frames(gt); i++ )
> +    for ( i = 0; i < n; i++ )
>      {
>          struct page_info *pg = virt_to_page(gt->status[i]);
>          gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
> @@ -1833,12 +1849,11 @@ gnttab_unpopulate_status_frames(struct d
>          page_set_owner(pg, NULL);
>      }
>  
> -    for ( i = 0; i < nr_status_frames(gt); i++ )
> -    {
> -        free_xenheap_page(gt->status[i]);
> -        gt->status[i] = NULL;
> -    }
>      gt->nr_status_frames = 0;
> +    for ( i = 0; i < n; i++ )
> +        free_xenheap_page(gt->status[i]);
> +    xfree(gt->status);
> +    gt->status = ZERO_BLOCK_PTR;
>  
>      return 0;
>  }
> @@ -1969,11 +1984,11 @@ int grant_table_init(struct domain *d, i
>      if ( gt->shared_raw == NULL )
>          goto out;
>  
> -    /* Status pages for grant table - for version 2 */
> -    gt->status = xzalloc_array(grant_status_t *,
> -                               grant_to_status_frames(gt->max_grant_frames));
> -    if ( gt->status == NULL )
> -        goto out;
> +    /*
> +     * Status page tracking array for v2 gets allocated on demand. But don't
> +     * leave a NULL pointer there.
> +     */
> +    gt->status = ZERO_BLOCK_PTR;
>  
>      grant_write_lock(gt);
>  
> @@ -4047,11 +4062,12 @@ int gnttab_acquire_resource(
>          if ( gt->gt_version != 2 )
>              break;
>  
> +        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
> +
>          /* Check that void ** is a suitable representation for gt->status. */
>          BUILD_BUG_ON(!__builtin_types_compatible_p(
>                           typeof(gt->status), grant_status_t **));
>          vaddrs = (void **)gt->status;
> -        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
>          break;
>      }
>  
> 


