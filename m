Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE27526028
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 12:43:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328407.551414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSlL-0004m9-VV; Fri, 13 May 2022 10:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328407.551414; Fri, 13 May 2022 10:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSlL-0004jp-SR; Fri, 13 May 2022 10:43:11 +0000
Received: by outflank-mailman (input) for mailman id 328407;
 Fri, 13 May 2022 10:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAeu=VV=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1npSlK-0004jj-GG
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 10:43:10 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ac4db84-d2a9-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 12:43:09 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id t25so13772137lfg.7
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 03:43:09 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a2e9c84000000b0024f3d1dae8esm388198lji.22.2022.05.13.03.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 03:43:07 -0700 (PDT)
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
X-Inumbo-ID: 7ac4db84-d2a9-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6sXboJ1IWrFfaZL2CwvKWBto1jYzvNRlolwzbKkJnzI=;
        b=O7IrsLiI6m+XnVXL609wbEZd46wLeUQTt11dOyDyb0m3qmultIKmwLTgLEc8uZKPkz
         oRVFNrS9W09pQ4KsFgRpm6cOj+dvHzUx2y4L1n+jNSjeWv11Q73apCVW76PkYSzRKcks
         82OTQqbzDdxYA1kDqW6s6/pgZLzyPA2pMKtsiLflLcsS26esBBbgzAebIQRHoB8q/XDa
         J8u+Y+xqBuigPblfPvo3H2DENlKFeofiTc2i+0wgT+8ntV0CsQaAthZlBnlIxWaDD4FU
         DdMIoAF7qJz3f6jtwmNN53zpMjgR/H5//deFyfs0IJU1yqMnax3Il/kEYWyNCMiTPnq4
         0fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6sXboJ1IWrFfaZL2CwvKWBto1jYzvNRlolwzbKkJnzI=;
        b=TC+ECCr+VzuLub/g4AYvt3wDmfgoS6EGskvUPE4YXG5UHSOXb85uCqB6ZHVtoU4a7j
         PGWizoasQk+k4PiaQx8DZliVtz8R3mg24QrgsjLlMsT6o3/Vuq5ejRQSJ+pRm429WQUh
         SMZ0IQQoRGKPDDucSsxo0CaIRGSWMk24Sw+mvpb3lWIJNHfvssZbGdqOZaThoO1jgEu3
         e14Pw+t9L6oTXiNQWFedo06bAg0qOTGPIPKbcRhZu8Bd29wootEa/VxLNixRHqxH+Kgt
         mnjIIZ7B6WYLMHbTfteJ+g4b+QchJo+gFlxN9YZ1JaQKCiMUn08Z2J6J2ArmlSv/x914
         mK4Q==
X-Gm-Message-State: AOAM531Fo5FRXnsB0om9F4mPszw/Le6uircDc4LmyVgUz5M4t7TzotPh
	l2hfUZQbj1VR83LgKA+0g5U=
X-Google-Smtp-Source: ABdhPJxvCY8n6V16nGeI843LAEA5SzPc7sIbEPwvo4gLBMAfPQogJJiWevnffE3lSSwYRwuInpsqWQ==
X-Received: by 2002:a05:6512:3157:b0:474:2ac5:63d with SMTP id s23-20020a056512315700b004742ac5063dmr2934962lfi.367.1652438588735;
        Fri, 13 May 2022 03:43:08 -0700 (PDT)
Subject: Re: [PATCH V2 2/7] xen/grants: support allocating consecutive grants
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-3-git-send-email-olekstysh@gmail.com>
 <597125fd-4c85-fde0-9d5b-a9cc13a81ccc@oracle.com>
 <d1d61bcf-86f9-68cd-9bd4-a13bf8149b88@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <263070e7-0043-1c5f-ba14-8ca7bb4ca6a0@gmail.com>
Date: Fri, 13 May 2022 13:43:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d1d61bcf-86f9-68cd-9bd4-a13bf8149b88@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 13.05.22 08:33, Juergen Gross wrote:
> On 12.05.22 22:01, Boris Ostrovsky wrote:


Hello Juergen, Boris


[Juergen, thank you for your explanation]


>
>>
>> On 5/7/22 2:19 PM, Oleksandr Tyshchenko wrote:
>>> +
>>> +/*
>>> + * Handling of free grants:
>>> + *
>>> + * Free grants are in a simple list anchored in gnttab_free_head. 
>>> They are
>>> + * linked by grant ref, the last element contains GNTTAB_LIST_END. 
>>> The number
>>> + * of free entries is stored in gnttab_free_count.
>>> + * Additionally there is a bitmap of free entries anchored in
>>> + * gnttab_free_bitmap. This is being used for simplifying 
>>> allocation of
>>> + * multiple consecutive grants, which is needed e.g. for support of 
>>> virtio.
>>> + * gnttab_last_free is used to add free entries of new frames at 
>>> the end of
>>> + * the free list.
>>> + * gnttab_free_tail_ptr specifies the variable which references the 
>>> start
>>
>>
>> If this references the start of the free interval, why is it called 
>> gnttab_free_*tail*_ptr?
>
> Because this is the tail of the whole area which is free.
>
> It could be renamed to gnttab_free_tail_start_ptr. :-)
>
>>
>>
>>> + * of consecutive free grants ending with gnttab_last_free. This 
>>> pointer is
>>> + * updated in a rather defensive way, in order to avoid performance 
>>> hits in
>>> + * hot paths.
>>> + * All those variables are protected by gnttab_list_lock.
>>> + */
>>>   static int gnttab_free_count;
>>> -static grant_ref_t gnttab_free_head;
>>> +static unsigned int gnttab_size;
>>> +static grant_ref_t gnttab_free_head = GNTTAB_LIST_END;
>>> +static grant_ref_t gnttab_last_free = GNTTAB_LIST_END;
>>> +static grant_ref_t *gnttab_free_tail_ptr;
>>> +static unsigned long *gnttab_free_bitmap;
>>>   static DEFINE_SPINLOCK(gnttab_list_lock);
>>> +
>>>   struct grant_frames xen_auto_xlat_grant_frames;
>>>   static unsigned int xen_gnttab_version;
>>>   module_param_named(version, xen_gnttab_version, uint, 0);
>>> @@ -170,16 +194,111 @@ static int get_free_entries(unsigned count)
>>>       ref = head = gnttab_free_head;
>>>       gnttab_free_count -= count;
>>> -    while (count-- > 1)
>>> -        head = gnttab_entry(head);
>>> +    while (count--) {
>>> +        bitmap_clear(gnttab_free_bitmap, head, 1);
>>> +        if (gnttab_free_tail_ptr == __gnttab_entry(head))
>>> +            gnttab_free_tail_ptr = &gnttab_free_head;
>>> +        if (count)
>>> +            head = gnttab_entry(head);
>>> +    }
>>>       gnttab_free_head = gnttab_entry(head);
>>>       gnttab_entry(head) = GNTTAB_LIST_END;
>>> +    if (!gnttab_free_count) {
>>> +        gnttab_last_free = GNTTAB_LIST_END;
>>> +        gnttab_free_tail_ptr = NULL;
>>> +    }
>>> +
>>>       spin_unlock_irqrestore(&gnttab_list_lock, flags);
>>>       return ref;
>>>   }
>>> +static int get_seq_entry_count(void)
>>> +{
>>> +    if (gnttab_last_free == GNTTAB_LIST_END || 
>>> !gnttab_free_tail_ptr ||
>>> +        *gnttab_free_tail_ptr == GNTTAB_LIST_END)
>>> +        return 0;
>>> +
>>> +    return gnttab_last_free - *gnttab_free_tail_ptr + 1;
>>> +}
>>> +
>>> +/* Rebuilds the free grant list and tries to find count consecutive 
>>> entries. */
>>> +static int get_free_seq(unsigned int count)
>>> +{
>>> +    int ret = -ENOSPC;
>>> +    unsigned int from, to;
>>> +    grant_ref_t *last;
>>> +
>>> +    gnttab_free_tail_ptr = &gnttab_free_head;
>>> +    last = &gnttab_free_head;
>>> +
>>> +    for (from = find_first_bit(gnttab_free_bitmap, gnttab_size);
>>> +         from < gnttab_size;
>>> +         from = find_next_bit(gnttab_free_bitmap, gnttab_size, to + 
>>> 1)) {
>>> +        to = find_next_zero_bit(gnttab_free_bitmap, gnttab_size,
>>> +                    from + 1);
>>> +        if (ret < 0 && to - from >= count) {
>>> +            ret = from;
>>> +            bitmap_clear(gnttab_free_bitmap, ret, count);
>>> +            from += count;
>>> +            gnttab_free_count -= count;
>>
>>
>> IIUIC we can have multiple passes over this, meaning that the 
>> gnttab_free_count may be decremented more than once. Is that 
>> intentional?
>
> After the first pass decrementing gnttab_free_cnt, ret will no
> longer be less than zero, so this can be hit only once.
>
>>
>>
>>> +            if (from == to)
>>> +                continue;
>>> +        }
>>> +
>>> +        while (from < to) {
>>> +            *last = from;
>>> +            last = __gnttab_entry(from);
>>> +            gnttab_last_free = from;
>>> +            from++;
>>> +        }
>>
>>
>> I have been looking at this loop and I can't understand what it is 
>> doing ;-( Can you enlighten me?
>
> It is recreating the free list in order to have it properly sorted.
> This is needed to make sure that the free tail has the maximum
> possible size (you can take the tail off the list without having
> to worry about breaking the linked list because of references into
> the tail).

I think the loop deserves a comment on top, I will add it.



>
>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


