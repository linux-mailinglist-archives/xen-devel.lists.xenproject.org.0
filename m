Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F9528D10
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 20:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330267.553636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqfUB-0000j6-Qy; Mon, 16 May 2022 18:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330267.553636; Mon, 16 May 2022 18:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqfUB-0000gG-MN; Mon, 16 May 2022 18:30:27 +0000
Received: by outflank-mailman (input) for mailman id 330267;
 Mon, 16 May 2022 18:30:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NSqr=VY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nqfU9-0000g0-CH
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 18:30:25 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 400d48cf-d546-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 20:30:24 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id h14so2007320wrc.6
 for <xen-devel@lists.xenproject.org>; Mon, 16 May 2022 11:30:24 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a1c2b03000000b003942a244ebfsm53364wmr.4.2022.05.16.11.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 11:30:23 -0700 (PDT)
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
X-Inumbo-ID: 400d48cf-d546-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3jGcBrcY/jLsXzsLfKk32I2R7rTzaPyklhz34IxOo3M=;
        b=m5I2ZkMmcbKDY1hCG8XD6CqFcYFPbQD/X48DcL+yaGg2MRUIoHPiYjZyZXvczTg3f0
         O42qyLDg3uH3jpFseje/GdEYwI6XqfzNWRDfbARQ7yAuK2GUv2IIWd0UBCgCKNdOrown
         nupUjuPyB+J3pLa9Qh+2TxolJUJuPEZGMFwb3MdceoelzEnkGSNIU3YWYK7RodEZxc+P
         AY+5ZggJhDjgwbUE+6UqcmH7GIocMLY5jfow5QD80IV4B/2GP0wVRb035u82DltR8qjm
         9Lj5+BAiQRq7Oj8qiMFwb+zr+hMRBHr8E+PL1ysaE7HfZbof+ztIlgYOM8yMqS8yOxj4
         3BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3jGcBrcY/jLsXzsLfKk32I2R7rTzaPyklhz34IxOo3M=;
        b=CRzE1g6J8l8VRtkc+zP2JHE2rWSRcIKOJ1CMKYfmmfZTP7xgXEabdP80U9+RApzz5U
         STsGK/E71p3/js93Yc0EktCn1JVc5hMZPiMuEehxJJWdvy+UcoRdF3qkroTIYtFyQ/F6
         XaAdv28POZVmMWGLlkDyz/L3WwbSBXQj0PDaRY2bD1lMK+5Srl8MpF/AIwDejitIdMUr
         FGzzQpbzMKDxU4u7J7utPrB07nQqZN+3dY4/155MgRQzGM0Z2ER/097xGi7W1jfwi2qo
         521cUwNxzw5IH1dWFsdEjK12wDukcoohGEOPkknDslaqmU9ffDZzgGQHhOY0pKmAJaxm
         1jug==
X-Gm-Message-State: AOAM5309Mo9VZKZT1KYWP7M2vNCFBZv8s+FcmUxouZkcaO1Ht95PMOrL
	iHffmHfUrzor8kdksZIEf6k=
X-Google-Smtp-Source: ABdhPJzIVgHVeOibJu0TIAo+Vy7dy8YkqIjCpy35I/2hFdACnClISv6EqWdfGQx1H6PbR5d19wGJog==
X-Received: by 2002:a05:6000:1e16:b0:20c:d56a:6025 with SMTP id bj22-20020a0560001e1600b0020cd56a6025mr14995584wrb.74.1652725823548;
        Mon, 16 May 2022 11:30:23 -0700 (PDT)
Subject: Re: [PATCH V2 2/7] xen/grants: support allocating consecutive grants
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Christoph Hellwig <hch@infradead.org>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-3-git-send-email-olekstysh@gmail.com>
 <597125fd-4c85-fde0-9d5b-a9cc13a81ccc@oracle.com>
 <d1d61bcf-86f9-68cd-9bd4-a13bf8149b88@suse.com>
 <91f95228-215c-b817-8bb6-8e24c0caf925@oracle.com>
 <e04fd32d-b379-d515-2080-781e555303f1@suse.com>
 <80286144-cca4-ef07-3aca-2c2374881738@oracle.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b2d22549-cdde-1e52-18fd-0ff923b86a5d@gmail.com>
Date: Mon, 16 May 2022 21:30:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <80286144-cca4-ef07-3aca-2c2374881738@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 16.05.22 19:00, Boris Ostrovsky wrote:


Hello Boris


>
>
> On 5/16/22 1:59 AM, Juergen Gross wrote:
>> On 14.05.22 04:34, Boris Ostrovsky wrote:
>>>
>>>
>>> On 5/13/22 1:33 AM, Juergen Gross wrote:
>>>> On 12.05.22 22:01, Boris Ostrovsky wrote:
>>>>>
>>>>> On 5/7/22 2:19 PM, Oleksandr Tyshchenko wrote:
>>>
>>>>>> +/* Rebuilds the free grant list and tries to find count 
>>>>>> consecutive entries. */
>>>>>> +static int get_free_seq(unsigned int count)
>>>>>> +{
>>>>>> +    int ret = -ENOSPC;
>>>>>> +    unsigned int from, to;
>>>>>> +    grant_ref_t *last;
>>>>>> +
>>>>>> +    gnttab_free_tail_ptr = &gnttab_free_head;
>>>>>> +    last = &gnttab_free_head;
>>>>>> +
>>>>>> +    for (from = find_first_bit(gnttab_free_bitmap, gnttab_size);
>>>>>> +         from < gnttab_size;
>>>>>> +         from = find_next_bit(gnttab_free_bitmap, gnttab_size, 
>>>>>> to + 1)) {
>>>>>> +        to = find_next_zero_bit(gnttab_free_bitmap, gnttab_size,
>>>>>> +                    from + 1);
>>>>>> +        if (ret < 0 && to - from >= count) {
>>>>>> +            ret = from;
>>>>>> +            bitmap_clear(gnttab_free_bitmap, ret, count);
>>>>>> +            from += count;
>>>>>> +            gnttab_free_count -= count;
>>>>>
>>>>>
>>>>> IIUIC we can have multiple passes over this, meaning that the 
>>>>> gnttab_free_count may be decremented more than once. Is that 
>>>>> intentional?
>>>>
>>>> After the first pass decrementing gnttab_free_cnt, ret will no
>>>> longer be less than zero, so this can be hit only once.
>>>
>>> Oh, yes, of course.
>>>
>>>>
>>>>>
>>>>>
>>>>>> +            if (from == to)
>>>>>> +                continue;
>>>>>> +        }
>>>>>> +
>>>>>> +        while (from < to) {
>>>>>> +            *last = from;
>>>>>> +            last = __gnttab_entry(from);
>>>>>> +            gnttab_last_free = from;
>>>>>> +            from++;
>>>>>> +        }
>>>>>
>>>>>
>>>>> I have been looking at this loop and I can't understand what it is 
>>>>> doing ;-( Can you enlighten me?
>>>>
>>>> It is recreating the free list in order to have it properly sorted.
>>>> This is needed to make sure that the free tail has the maximum
>>>> possible size (you can take the tail off the list without having
>>>> to worry about breaking the linked list because of references into
>>>> the tail).
>>>
>>>
>>> So let's say we have the (one-dimensional) table of length 13
>>>
>>> idx    ..    2    3  ...  10  11  12
>>>
>>> grant       12   11        2  -1   3
>>>
>>>
>>> and gnttab_free_head is 10. I.e. the free list is 2, 12, 3, 11.
>>
>> You meant 10, 2, 12, 3, 11, I guess?
>>
>>>
>>> What will this look like after the 2 iterations of the outer loop?
>>
>> idx    ..    2    3  ...  10  11  12
>>
>> grant        3   10       11  12  -1
>>
>> with gnttab_free_head being 2, i.e the free list is now 2, 3, 10, 11, 
>> 12.
>
>
>
> OK, thanks, that helped. I couldn't link the free chunks in my head
>
>
> With the error handling in gnttab_init() fixed

yes, this is a diff that I am going to apply for the next version:


[snip]

@@ -1596,19 +1601,20 @@ static int gnttab_expand(unsigned int req_entries)
  int gnttab_init(void)
  {
         int i;
-       unsigned long max_nr_grant_frames;
+       unsigned long max_nr_grant_frames, max_nr_grefs;
         unsigned int max_nr_glist_frames, nr_glist_frames;
         int ret;

         gnttab_request_version();
         max_nr_grant_frames = gnttab_max_grant_frames();
+       max_nr_grefs = max_nr_grant_frames *
+ gnttab_interface->grefs_per_grant_frame;
         nr_grant_frames = 1;

         /* Determine the maximum number of frames required for the
          * grant reference free list on the current hypervisor.
          */
-       max_nr_glist_frames = (max_nr_grant_frames *
- gnttab_interface->grefs_per_grant_frame / RPP);
+       max_nr_glist_frames = max_nr_grefs / RPP;

         gnttab_list = kmalloc_array(max_nr_glist_frames,
                                     sizeof(grant_ref_t *),
@@ -1625,8 +1631,7 @@ int gnttab_init(void)
                 }
         }

-       i = gnttab_interface->grefs_per_grant_frame * max_nr_grant_frames;
-       gnttab_free_bitmap = bitmap_zalloc(i, GFP_KERNEL);
+       gnttab_free_bitmap = bitmap_zalloc(max_nr_grefs, GFP_KERNEL);
         if (!gnttab_free_bitmap) {
                 ret = -ENOMEM;
                 goto ini_nomem;


>
>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Thanks!



>
>
>
> -boris

-- 
Regards,

Oleksandr Tyshchenko


