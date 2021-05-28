Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10A394366
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 15:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133917.249415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmcY3-0002L6-Q3; Fri, 28 May 2021 13:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133917.249415; Fri, 28 May 2021 13:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmcY3-0002J3-N0; Fri, 28 May 2021 13:29:11 +0000
Received: by outflank-mailman (input) for mailman id 133917;
 Fri, 28 May 2021 13:29:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmcY2-0002Ix-BR
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 13:29:10 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0abaf67a-2cf1-44e9-b49f-91729776ce0b;
 Fri, 28 May 2021 13:29:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3366B1FD2F;
 Fri, 28 May 2021 13:29:08 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 029EB11A98;
 Fri, 28 May 2021 13:29:07 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id agsiOyPwsGDDSQAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Fri, 28 May 2021 13:29:07 +0000
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
X-Inumbo-ID: 0abaf67a-2cf1-44e9-b49f-91729776ce0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622208548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5G8xbPrE4QwsQXmnQ1TYQWmzvf763gDMqALnJjZGx4c=;
	b=Z8hVysByzc0zdVbbtxs8xxj/X1tx3sWMTnkTh8Uo1dYnKNMf6E9k/DCS4reqKCfRdk32Km
	XArxrjsyjKgfDunz00IVg5EQ/EZmNHZd+U5dF+jf5MmfcJjX/NlaAuhKsy0FLYd8pbSOwv
	DqU/ccQ70DUnfMGLzbAjtn4fTvrjmJ8=
Subject: Re: [PATCH] xen/grant-table: Simplify the update to the per-vCPU
 maptrack freelist
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210526152152.26251-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6748164b-ad38-d7d0-6abe-b5e393f7b9f3@suse.com>
Date: Fri, 28 May 2021 15:29:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210526152152.26251-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.05.2021 17:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since XSA-288 (commit 02cbeeb62075 "gnttab: split maptrack lock to make

XSA-228 I suppose?

> it fulfill its purpose again"), v->maptrack_head and v->maptrack_tail
> are with the lock v->maptrack_freelist_lock held.

Nit: missing "accessed" or alike?

> Therefore it is not necessary to update the fields using cmpxchg()
> and also read them atomically.

Ah yes, very good observation. Should have noticed this back at the
time, for an immediate follow-up change.

> Note that there are two cases where v->maptrack_tail is accessed without
> the lock. They both happen _get_maptrack_handle() when the current vCPU
> list is empty. Therefore there is no possible race.

I think you mean the other function here, without a leading underscore
in its name. And if you want to explain the absence of a race, wouldn't
you then better also mention that the list can get initially filled
only on the local vCPU?

> I am not sure whether we should try to protect the remaining unprotected
> access with the lock or maybe add a comment?

As per above I don't view adding locking as sensible. If you feel like
adding a helpful comment, perhaps. I will admit that it took me more
than just a moment to recall that "local vCPU only" argument.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -543,34 +543,26 @@ double_gt_unlock(struct grant_table *lgt, struct grant_table *rgt)
>  static inline grant_handle_t
>  _get_maptrack_handle(struct grant_table *t, struct vcpu *v)
>  {
> -    unsigned int head, next, prev_head;
> +    unsigned int head, next;
>  
>      spin_lock(&v->maptrack_freelist_lock);
>  
> -    do {
> -        /* No maptrack pages allocated for this VCPU yet? */
> -        head = read_atomic(&v->maptrack_head);
> -        if ( unlikely(head == MAPTRACK_TAIL) )
> -        {
> -            spin_unlock(&v->maptrack_freelist_lock);
> -            return INVALID_MAPTRACK_HANDLE;

Where did this and ...

> -        }
> -
> -        /*
> -         * Always keep one entry in the free list to make it easier to
> -         * add free entries to the tail.
> -         */
> -        next = read_atomic(&maptrack_entry(t, head).ref);
> -        if ( unlikely(next == MAPTRACK_TAIL) )
> -        {
> -            spin_unlock(&v->maptrack_freelist_lock);
> -            return INVALID_MAPTRACK_HANDLE;

... this use of INVALID_MAPTRACK_HANDLE go? It is at present merely
coincidence that INVALID_MAPTRACK_HANDLE == MAPTRACK_TAIL. If you
want to fold them, you will need to do so properly (by eliminating
one of the two constants). But I think they're separate on purpose.

> -        }
> +    /* No maptrack pages allocated for this VCPU yet? */
> +    head = v->maptrack_head;
> +    if ( unlikely(head == MAPTRACK_TAIL) )
> +        goto out;
>  
> -        prev_head = head;
> -        head = cmpxchg(&v->maptrack_head, prev_head, next);
> -    } while ( head != prev_head );
> +    /*
> +     * Always keep one entry in the free list to make it easier to
> +     * add free entries to the tail.
> +     */
> +    next = read_atomic(&maptrack_entry(t, head).ref);

Since the lock protects the entire free list, why do you need to
keep read_atomic() here?

> +    if ( unlikely(next == MAPTRACK_TAIL) )
> +        head = MAPTRACK_TAIL;
> +    else
> +        v->maptrack_head = next;
>  
> +out:

Please indent labels by at least one blank, to avoid issues with
diff's -p option. In fact if you didn't introduce a goto here in
the first place, there'd be less code churn overall, as you'd
need to alter the indentation of fewer lines.

> @@ -623,7 +615,7 @@ put_maptrack_handle(
>  {
>      struct domain *currd = current->domain;
>      struct vcpu *v;
> -    unsigned int prev_tail, cur_tail;
> +    unsigned int prev_tail;
>  
>      /* 1. Set entry to be a tail. */
>      maptrack_entry(t, handle).ref = MAPTRACK_TAIL;
> @@ -633,11 +625,8 @@ put_maptrack_handle(
>  
>      spin_lock(&v->maptrack_freelist_lock);
>  
> -    cur_tail = read_atomic(&v->maptrack_tail);
> -    do {
> -        prev_tail = cur_tail;
> -        cur_tail = cmpxchg(&v->maptrack_tail, prev_tail, handle);
> -    } while ( cur_tail != prev_tail );
> +    prev_tail = v->maptrack_tail;
> +    v->maptrack_tail = handle;
>  
>      /* 3. Update the old tail entry to point to the new entry. */
>      write_atomic(&maptrack_entry(t, prev_tail).ref, handle);

Since the write_atomic() here can then also be converted, may I
ask that you then rename the local variable to just "tail" as
well?

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -255,7 +255,10 @@ struct vcpu
>      /* VCPU paused by system controller. */
>      int              controller_pause_count;
>  
> -    /* Grant table map tracking. */
> +    /*
> +     * Grant table map tracking. The lock maptrack_freelist_lock protect

Nit: protects

> +     * the access to maptrack_head and maptrack_tail.
> +     */

I'm inclined to suggest this doesn't need spelling out, considering ...

>      spinlock_t       maptrack_freelist_lock;
>      unsigned int     maptrack_head;
>      unsigned int     maptrack_tail;

... both the name of the lock and its placement next to the two
fields it protects. Also as per the docs change of the XSA-228 change,
the lock protects more than just these two fields, so the comment may
be misleading the way you have it now.

Jan

