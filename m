Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7A523C24
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 20:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327140.549876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noqdP-0004tt-R5; Wed, 11 May 2022 18:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327140.549876; Wed, 11 May 2022 18:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noqdP-0004qn-O5; Wed, 11 May 2022 18:00:27 +0000
Received: by outflank-mailman (input) for mailman id 327140;
 Wed, 11 May 2022 18:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mbwJ=VT=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1noqdO-0004qh-G7
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 18:00:26 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b4078dc-d154-11ec-a406-831a346695d4;
 Wed, 11 May 2022 20:00:24 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id 4so3582107ljw.11
 for <xen-devel@lists.xenproject.org>; Wed, 11 May 2022 11:00:24 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a19ad49000000b0047255d21131sm382089lfd.96.2022.05.11.11.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 11:00:23 -0700 (PDT)
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
X-Inumbo-ID: 3b4078dc-d154-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E8mjJ6/ikRW6L571DVojfVrb9ZxPwMSvTMao2Z2WwQs=;
        b=CxXImu2j0+p3LHhyN50CJeB53M+2Hb3IcMtcPocNwHtOPLHymInaRXaqIkerIMFi7H
         3AAk7OAUSRSMVl2kweGmfn7v1SUHYCFVml14xpbzHUO+LI0KCa8TC32claH6Tki5FmF9
         PzVDHN5YibHIpuwYghdy4NwMdrtdetm177DeXhXLmsteu0ZBOJmPAlovXFCUdjJLUfX6
         L2+5D8Ort7kY8A7FVQywUetv79hWfG9Vqc+nAhyefHOmAfaqZcxDdxNOreZExbSD7xgA
         OEG8Bp97wkINldw+lYKZ9J6zvn4Y7SQq8AtGS0ZZ3FBCHpJt5QfnhSruyWa1RMmeGNbL
         yRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E8mjJ6/ikRW6L571DVojfVrb9ZxPwMSvTMao2Z2WwQs=;
        b=d6avRsegd5cIiuNoa0z9hotyz++4gzR54e3C4Y+7sWfS4oZnTyaPG3EKbbg/p70Tpa
         Vx0WbRd9SOerYNdbBRpHUuMbfaM+L7TTn4zmcCA5U7tiL1Sty3/7yaevwLtFw7LhcfmK
         8ZNIU7vJbHf/r19V4UULsZ100CU06lrf61NKT9mZ7pOh89rRA255FMYB0ytOdgSKOBy2
         J+NKQdWKMF7tu4GuHRost4//Te4JYZBokg2PMHev+2tXXdGNmmBGwKTjWZ2Cvm7apkv4
         FCaMDQu+K61sGzkOZMzqLTVxJCawsqvkZ5SuYNR7r+hGzPhXMAo+FbwwhX08n5JXbOFk
         MBgg==
X-Gm-Message-State: AOAM533QHSfGYwS6isd2xeqzntAyEE8B1FZZM4xedpV+d17AJIMeDVR4
	+W5hKbJGrzOrnhGUnO9XfG0=
X-Google-Smtp-Source: ABdhPJwEES/rkW+laUoE12K+xOg2R39+JFoCFELxlp3+devgkaiCx/4uXvllW3Tr1XtvaKaEyM0+YA==
X-Received: by 2002:a05:651c:50a:b0:24f:50a2:beda with SMTP id o10-20020a05651c050a00b0024f50a2bedamr18420964ljp.189.1652292023783;
        Wed, 11 May 2022 11:00:23 -0700 (PDT)
Subject: Re: [PATCH V2 2/7] xen/grants: support allocating consecutive grants
From: Oleksandr <olekstysh@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-3-git-send-email-olekstysh@gmail.com>
Message-ID: <8409e636-94e3-e231-f181-c76a849534a1@gmail.com>
Date: Wed, 11 May 2022 21:00:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1651947548-4055-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.05.22 21:19, Oleksandr Tyshchenko wrote:

Hello Boris, Stefano


> From: Juergen Gross <jgross@suse.com>
>
> For support of virtio via grant mappings in rare cases larger mappings
> using consecutive grants are needed. Support those by adding a bitmap
> of free grants.
>
> As consecutive grants will be needed only in very rare cases (e.g. when
> configuring a virtio device with a multi-page ring), optimize for the
> normal case of non-consecutive allocations.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Changes RFC -> V1:
>     - no changes
>     
> Changes V1 -> V2:
>     - no changes


May I please ask for the review here?


This patch has been tested in various scenarios:

1. Guest with Xen PV drivers only (gnttab_alloc(free)_grant_reference() 
usage only)

2. Guest with Virtio drivers only 
(gnttab_alloc(free)_grant_reference_seq() usage only)

3. Guest with Virtio and Xen PV drivers (combined 
gnttab_alloc(free)_grant_reference() and 
gnttab_alloc(free)_grant_reference_seq() usage)


> ---
>   drivers/xen/grant-table.c | 238 +++++++++++++++++++++++++++++++++++++++-------
>   include/xen/grant_table.h |   4 +
>   2 files changed, 210 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
> index 8ccccac..1b458c0 100644
> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -33,6 +33,7 @@
>   
>   #define pr_fmt(fmt) "xen:" KBUILD_MODNAME ": " fmt
>   
> +#include <linux/bitmap.h>
>   #include <linux/memblock.h>
>   #include <linux/sched.h>
>   #include <linux/mm.h>
> @@ -72,9 +73,32 @@
>   
>   static grant_ref_t **gnttab_list;
>   static unsigned int nr_grant_frames;
> +
> +/*
> + * Handling of free grants:
> + *
> + * Free grants are in a simple list anchored in gnttab_free_head. They are
> + * linked by grant ref, the last element contains GNTTAB_LIST_END. The number
> + * of free entries is stored in gnttab_free_count.
> + * Additionally there is a bitmap of free entries anchored in
> + * gnttab_free_bitmap. This is being used for simplifying allocation of
> + * multiple consecutive grants, which is needed e.g. for support of virtio.
> + * gnttab_last_free is used to add free entries of new frames at the end of
> + * the free list.
> + * gnttab_free_tail_ptr specifies the variable which references the start
> + * of consecutive free grants ending with gnttab_last_free. This pointer is
> + * updated in a rather defensive way, in order to avoid performance hits in
> + * hot paths.
> + * All those variables are protected by gnttab_list_lock.
> + */
>   static int gnttab_free_count;
> -static grant_ref_t gnttab_free_head;
> +static unsigned int gnttab_size;
> +static grant_ref_t gnttab_free_head = GNTTAB_LIST_END;
> +static grant_ref_t gnttab_last_free = GNTTAB_LIST_END;
> +static grant_ref_t *gnttab_free_tail_ptr;
> +static unsigned long *gnttab_free_bitmap;
>   static DEFINE_SPINLOCK(gnttab_list_lock);
> +
>   struct grant_frames xen_auto_xlat_grant_frames;
>   static unsigned int xen_gnttab_version;
>   module_param_named(version, xen_gnttab_version, uint, 0);
> @@ -170,16 +194,111 @@ static int get_free_entries(unsigned count)
>   
>   	ref = head = gnttab_free_head;
>   	gnttab_free_count -= count;
> -	while (count-- > 1)
> -		head = gnttab_entry(head);
> +	while (count--) {
> +		bitmap_clear(gnttab_free_bitmap, head, 1);
> +		if (gnttab_free_tail_ptr == __gnttab_entry(head))
> +			gnttab_free_tail_ptr = &gnttab_free_head;
> +		if (count)
> +			head = gnttab_entry(head);
> +	}
>   	gnttab_free_head = gnttab_entry(head);
>   	gnttab_entry(head) = GNTTAB_LIST_END;
>   
> +	if (!gnttab_free_count) {
> +		gnttab_last_free = GNTTAB_LIST_END;
> +		gnttab_free_tail_ptr = NULL;
> +	}
> +
>   	spin_unlock_irqrestore(&gnttab_list_lock, flags);
>   
>   	return ref;
>   }
>   
> +static int get_seq_entry_count(void)
> +{
> +	if (gnttab_last_free == GNTTAB_LIST_END || !gnttab_free_tail_ptr ||
> +	    *gnttab_free_tail_ptr == GNTTAB_LIST_END)
> +		return 0;
> +
> +	return gnttab_last_free - *gnttab_free_tail_ptr + 1;
> +}
> +
> +/* Rebuilds the free grant list and tries to find count consecutive entries. */
> +static int get_free_seq(unsigned int count)
> +{
> +	int ret = -ENOSPC;
> +	unsigned int from, to;
> +	grant_ref_t *last;
> +
> +	gnttab_free_tail_ptr = &gnttab_free_head;
> +	last = &gnttab_free_head;
> +
> +	for (from = find_first_bit(gnttab_free_bitmap, gnttab_size);
> +	     from < gnttab_size;
> +	     from = find_next_bit(gnttab_free_bitmap, gnttab_size, to + 1)) {
> +		to = find_next_zero_bit(gnttab_free_bitmap, gnttab_size,
> +					from + 1);
> +		if (ret < 0 && to - from >= count) {
> +			ret = from;
> +			bitmap_clear(gnttab_free_bitmap, ret, count);
> +			from += count;
> +			gnttab_free_count -= count;
> +			if (from == to)
> +				continue;
> +		}
> +
> +		while (from < to) {
> +			*last = from;
> +			last = __gnttab_entry(from);
> +			gnttab_last_free = from;
> +			from++;
> +		}
> +		if (to < gnttab_size)
> +			gnttab_free_tail_ptr = __gnttab_entry(to - 1);
> +	}
> +
> +	*last = GNTTAB_LIST_END;
> +	if (gnttab_last_free != gnttab_size - 1)
> +		gnttab_free_tail_ptr = NULL;
> +
> +	return ret;
> +}
> +
> +static int get_free_entries_seq(unsigned int count)
> +{
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&gnttab_list_lock, flags);
> +
> +	if (gnttab_free_count < count) {
> +		ret = gnttab_expand(count - gnttab_free_count);
> +		if (ret < 0)
> +			goto out;
> +	}
> +
> +	if (get_seq_entry_count() < count) {
> +		ret = get_free_seq(count);
> +		if (ret >= 0)
> +			goto out;
> +		ret = gnttab_expand(count - get_seq_entry_count());
> +		if (ret < 0)
> +			goto out;
> +	}
> +
> +	ret = *gnttab_free_tail_ptr;
> +	*gnttab_free_tail_ptr = gnttab_entry(ret + count - 1);
> +	gnttab_free_count -= count;
> +	if (!gnttab_free_count)
> +		gnttab_free_tail_ptr = NULL;
> +	bitmap_clear(gnttab_free_bitmap, ret, count);
> +
> + out:
> +	spin_unlock_irqrestore(&gnttab_list_lock, flags);
> +
> +	return ret;
> +}
> +
>   static void do_free_callbacks(void)
>   {
>   	struct gnttab_free_callback *callback, *next;
> @@ -206,17 +325,48 @@ static inline void check_free_callbacks(void)
>   		do_free_callbacks();
>   }
>   
> -static void put_free_entry(grant_ref_t ref)
> +static void put_free_entry_locked(grant_ref_t ref)
>   {
> -	unsigned long flags;
> -	spin_lock_irqsave(&gnttab_list_lock, flags);
>   	gnttab_entry(ref) = gnttab_free_head;
>   	gnttab_free_head = ref;
> +	if (!gnttab_free_count)
> +		gnttab_last_free = ref;
> +	if (gnttab_free_tail_ptr == &gnttab_free_head)
> +		gnttab_free_tail_ptr = __gnttab_entry(ref);
>   	gnttab_free_count++;
> +	bitmap_set(gnttab_free_bitmap, ref, 1);
> +}
> +
> +static void put_free_entry(grant_ref_t ref)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gnttab_list_lock, flags);
> +	put_free_entry_locked(ref);
>   	check_free_callbacks();
>   	spin_unlock_irqrestore(&gnttab_list_lock, flags);
>   }
>   
> +static void gnttab_set_free(unsigned int start, unsigned int n)
> +{
> +	unsigned int i;
> +
> +	for (i = start; i < start + n - 1; i++)
> +		gnttab_entry(i) = i + 1;
> +
> +	gnttab_entry(i) = GNTTAB_LIST_END;
> +	if (!gnttab_free_count) {
> +		gnttab_free_head = start;
> +		gnttab_free_tail_ptr = &gnttab_free_head;
> +	} else {
> +		gnttab_entry(gnttab_last_free) = start;
> +	}
> +	gnttab_free_count += n;
> +	gnttab_last_free = i;
> +
> +	bitmap_set(gnttab_free_bitmap, start, n);
> +}
> +
>   /*
>    * Following applies to gnttab_update_entry_v1 and gnttab_update_entry_v2.
>    * Introducing a valid entry into the grant table:
> @@ -448,23 +598,31 @@ void gnttab_free_grant_references(grant_ref_t head)
>   {
>   	grant_ref_t ref;
>   	unsigned long flags;
> -	int count = 1;
> -	if (head == GNTTAB_LIST_END)
> -		return;
> +
>   	spin_lock_irqsave(&gnttab_list_lock, flags);
> -	ref = head;
> -	while (gnttab_entry(ref) != GNTTAB_LIST_END) {
> -		ref = gnttab_entry(ref);
> -		count++;
> +	while (head != GNTTAB_LIST_END) {
> +		ref = gnttab_entry(head);
> +		put_free_entry_locked(head);
> +		head = ref;
>   	}
> -	gnttab_entry(ref) = gnttab_free_head;
> -	gnttab_free_head = head;
> -	gnttab_free_count += count;
>   	check_free_callbacks();
>   	spin_unlock_irqrestore(&gnttab_list_lock, flags);
>   }
>   EXPORT_SYMBOL_GPL(gnttab_free_grant_references);
>   
> +void gnttab_free_grant_reference_seq(grant_ref_t head, unsigned int count)
> +{
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	spin_lock_irqsave(&gnttab_list_lock, flags);
> +	for (i = count; i > 0; i--)
> +		put_free_entry_locked(head + i - 1);
> +	check_free_callbacks();
> +	spin_unlock_irqrestore(&gnttab_list_lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(gnttab_free_grant_reference_seq);
> +
>   int gnttab_alloc_grant_references(u16 count, grant_ref_t *head)
>   {
>   	int h = get_free_entries(count);
> @@ -478,6 +636,24 @@ int gnttab_alloc_grant_references(u16 count, grant_ref_t *head)
>   }
>   EXPORT_SYMBOL_GPL(gnttab_alloc_grant_references);
>   
> +int gnttab_alloc_grant_reference_seq(unsigned int count, grant_ref_t *first)
> +{
> +	int h;
> +
> +	if (count == 1)
> +		h = get_free_entries(1);
> +	else
> +		h = get_free_entries_seq(count);
> +
> +	if (h < 0)
> +		return -ENOSPC;
> +
> +	*first = h;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gnttab_alloc_grant_reference_seq);
> +
>   int gnttab_empty_grant_references(const grant_ref_t *private_head)
>   {
>   	return (*private_head == GNTTAB_LIST_END);
> @@ -570,16 +746,13 @@ static int grow_gnttab_list(unsigned int more_frames)
>   			goto grow_nomem;
>   	}
>   
> +	gnttab_set_free(gnttab_size, extra_entries);
>   
> -	for (i = grefs_per_frame * nr_grant_frames;
> -	     i < grefs_per_frame * new_nr_grant_frames - 1; i++)
> -		gnttab_entry(i) = i + 1;
> -
> -	gnttab_entry(i) = gnttab_free_head;
> -	gnttab_free_head = grefs_per_frame * nr_grant_frames;
> -	gnttab_free_count += extra_entries;
> +	if (!gnttab_free_tail_ptr)
> +		gnttab_free_tail_ptr = __gnttab_entry(gnttab_size);
>   
>   	nr_grant_frames = new_nr_grant_frames;
> +	gnttab_size += extra_entries;
>   
>   	check_free_callbacks();
>   
> @@ -1424,7 +1597,6 @@ int gnttab_init(void)
>   	int i;
>   	unsigned long max_nr_grant_frames;
>   	unsigned int max_nr_glist_frames, nr_glist_frames;
> -	unsigned int nr_init_grefs;
>   	int ret;
>   
>   	gnttab_request_version();
> @@ -1452,6 +1624,13 @@ int gnttab_init(void)
>   		}
>   	}
>   
> +	i = gnttab_interface->grefs_per_grant_frame * max_nr_grant_frames;
> +	gnttab_free_bitmap = bitmap_zalloc(i, GFP_KERNEL);
> +	if (!gnttab_free_bitmap) {
> +		ret = -ENOMEM;
> +		goto ini_nomem;
> +	}
> +
>   	ret = arch_gnttab_init(max_nr_grant_frames,
>   			       nr_status_frames(max_nr_grant_frames));
>   	if (ret < 0)
> @@ -1462,15 +1641,9 @@ int gnttab_init(void)
>   		goto ini_nomem;
>   	}
>   
> -	nr_init_grefs = nr_grant_frames *
> -			gnttab_interface->grefs_per_grant_frame;
> -
> -	for (i = NR_RESERVED_ENTRIES; i < nr_init_grefs - 1; i++)
> -		gnttab_entry(i) = i + 1;
> +	gnttab_size = nr_grant_frames * gnttab_interface->grefs_per_grant_frame;
>   
> -	gnttab_entry(nr_init_grefs - 1) = GNTTAB_LIST_END;
> -	gnttab_free_count = nr_init_grefs - NR_RESERVED_ENTRIES;
> -	gnttab_free_head  = NR_RESERVED_ENTRIES;
> +	gnttab_set_free(NR_RESERVED_ENTRIES, gnttab_size - NR_RESERVED_ENTRIES);
>   
>   	printk("Grant table initialized\n");
>   	return 0;
> @@ -1479,6 +1652,7 @@ int gnttab_init(void)
>   	for (i--; i >= 0; i--)
>   		free_page((unsigned long)gnttab_list[i]);
>   	kfree(gnttab_list);
> +	bitmap_free(gnttab_free_bitmap);
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(gnttab_init);
> diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
> index dfd5bf3..d815e1d 100644
> --- a/include/xen/grant_table.h
> +++ b/include/xen/grant_table.h
> @@ -129,10 +129,14 @@ int gnttab_try_end_foreign_access(grant_ref_t ref);
>    */
>   int gnttab_alloc_grant_references(u16 count, grant_ref_t *pprivate_head);
>   
> +int gnttab_alloc_grant_reference_seq(unsigned int count, grant_ref_t *first);
> +
>   void gnttab_free_grant_reference(grant_ref_t ref);
>   
>   void gnttab_free_grant_references(grant_ref_t head);
>   
> +void gnttab_free_grant_reference_seq(grant_ref_t head, unsigned int count);
> +
>   int gnttab_empty_grant_references(const grant_ref_t *pprivate_head);
>   
>   int gnttab_claim_grant_reference(grant_ref_t *pprivate_head);

-- 
Regards,

Oleksandr Tyshchenko


