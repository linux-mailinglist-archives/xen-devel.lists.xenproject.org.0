Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FC51714E
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 16:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318916.538910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWmm-0007SL-Gp; Mon, 02 May 2022 14:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318916.538910; Mon, 02 May 2022 14:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWmm-0007Pn-DM; Mon, 02 May 2022 14:12:24 +0000
Received: by outflank-mailman (input) for mailman id 318916;
 Mon, 02 May 2022 14:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HimL=VK=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nlWml-0007Pg-55
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 14:12:23 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1fa1109-ca21-11ec-a405-831a346695d4;
 Mon, 02 May 2022 16:12:21 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id q185so18515538ljb.5
 for <xen-devel@lists.xenproject.org>; Mon, 02 May 2022 07:12:21 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 bf10-20020a2eaa0a000000b0024f3d1dae8bsm1074171ljb.19.2022.05.02.07.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 07:12:20 -0700 (PDT)
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
X-Inumbo-ID: e1fa1109-ca21-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SWU6aLH9edvsAPiYZzsg3YZpGJqJmDtADV4YivTa3fc=;
        b=f2GkEAq7tbE93SNbjvDPYMlOFQ58Y+ElOYaqZnJD4c83pm7kgbsu24P55eBrONDrbi
         75i/xrj3xo0AaLEs4lRM4tgZgnj79ALseI+iOfODcR6Juf5m0Qk36UONR03WXbfdjELj
         3pr+R05iPT7iWhlpOOmhl9Zi5RLBkiIYwZcbQK1OvHFnD4HJj1RBTWzEIcpKRZQZJqwB
         Qwy/T9MAwk0W+u1S8/G0la9G3DfemELFLiujJ6nunWaxGBK7RodwaZc30/IW1LctuflQ
         6fQuC43kFdHFUKM5nQKgDJICuMv3k7iDqi/Tsc+ByAyNwU2HlVonl1Hp5vUYZhxZHx5g
         P9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SWU6aLH9edvsAPiYZzsg3YZpGJqJmDtADV4YivTa3fc=;
        b=4TU1yCqZplwMTuaF0NP7TKtDoB3LTifLWk1obfDirKqYDlyij5joK49TSSRjL5IgVC
         QbCadFjWs6KOi2NWn9BtHIwDODtkUqCkiOwzB7FfUXMT/1cRjboHEC+x86Lv5jZK/LsD
         edvvKvSrAEl5ixSBPhxHaStF4gVwuCB+N+H/NdWTs0Dv9ewkOSp3a+24pomDd5jBfQpz
         83rQaS1uQPHRqCr10sjJyYw2F3RrtvHek5xVhXzMaMqbIHAOsHKD4Gc9Gnatxwe7YdMa
         zj86BHHqOKRzdDzhPcmb8LDQwgB5vf1CUgVeVx4/jFUpirmZNfX9q4TOX5K8npX5f9in
         5vWw==
X-Gm-Message-State: AOAM531mJ5Qx5eGVryrqOgwhJoWvrPQIcyWNQxLrPbDjpsEaK+TmdhCX
	IFfIKa75TKZ/J2gFR8Hb5Kk=
X-Google-Smtp-Source: ABdhPJwJVFKBA2YxjJ+Wxyv20p1DVv/+TL02PG0KRMZrpfXHMJvtrhM0yW5BAY+E44Ci7QRynV5CXg==
X-Received: by 2002:a2e:7f0b:0:b0:24f:e04:d0c with SMTP id a11-20020a2e7f0b000000b0024f0e040d0cmr7876359ljd.441.1651500741329;
        Mon, 02 May 2022 07:12:21 -0700 (PDT)
Subject: Re: [PATCH v2 19/19] xen/xenbus: eliminate xenbus_grant_ring()
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220428082743.16593-1-jgross@suse.com>
 <20220428082743.16593-20-jgross@suse.com>
 <bf14e3e1-fc4d-1eee-1dfb-1ba3423f0b6f@gmail.com>
 <b31f2358-625e-68ff-8182-8b91820ad25e@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <44c08aed-8426-4d79-3fe7-2c854c711526@gmail.com>
Date: Mon, 2 May 2022 17:12:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b31f2358-625e-68ff-8182-8b91820ad25e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 02.05.22 16:30, Juergen Gross wrote:

Hello Juergen


> On 29.04.22 17:10, Oleksandr wrote:
>>
>> On 28.04.22 11:27, Juergen Gross wrote:
>>
>>
>> Hello Juergen
>>
>>
>>> There is no external user of xenbus_grant_ring() left, so merge it into
>>> the only caller xenbus_setup_ring().
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V2:
>>> - make error message more precise (Andrew Cooper)
>>> ---
>>>   drivers/xen/xenbus/xenbus_client.c | 65 
>>> +++++++++---------------------
>>>   include/xen/xenbus.h               |  2 -
>>>   2 files changed, 19 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/drivers/xen/xenbus/xenbus_client.c 
>>> b/drivers/xen/xenbus/xenbus_client.c
>>> index 1a2e0d94ccd1..d6fdd2d209d3 100644
>>> --- a/drivers/xen/xenbus/xenbus_client.c
>>> +++ b/drivers/xen/xenbus/xenbus_client.c
>>> @@ -363,50 +363,6 @@ static void xenbus_switch_fatal(struct 
>>> xenbus_device *dev, int depth, int err,
>>>           __xenbus_switch_state(dev, XenbusStateClosing, 1);
>>>   }
>>> -/**
>>> - * xenbus_grant_ring
>>> - * @dev: xenbus device
>>> - * @vaddr: starting virtual address of the ring
>>> - * @nr_pages: number of pages to be granted
>>> - * @grefs: grant reference array to be filled in
>>> - *
>>> - * Grant access to the given @vaddr to the peer of the given device.
>>> - * Then fill in @grefs with grant references.  Return 0 on success, or
>>> - * -errno on error.  On error, the device will switch to
>>> - * XenbusStateClosing, and the error will be saved in the store.
>>> - */
>>> -int xenbus_grant_ring(struct xenbus_device *dev, void *vaddr,
>>> -              unsigned int nr_pages, grant_ref_t *grefs)
>>> -{
>>> -    int err;
>>> -    unsigned int i;
>>> -    grant_ref_t gref_head;
>>> -
>>> -    err = gnttab_alloc_grant_references(nr_pages, &gref_head);
>>> -    if (err) {
>>> -        xenbus_dev_fatal(dev, err, "granting access to ring page");
>>> -        return err;
>>> -    }
>>> -
>>> -    for (i = 0; i < nr_pages; i++) {
>>> -        unsigned long gfn;
>>> -
>>> -        if (is_vmalloc_addr(vaddr))
>>> -            gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr));
>>> -        else
>>> -            gfn = virt_to_gfn(vaddr);
>>> -
>>> -        grefs[i] = gnttab_claim_grant_reference(&gref_head);
>>> -        gnttab_grant_foreign_access_ref(grefs[i], dev->otherend_id,
>>> -                        gfn, 0);
>>> -
>>> -        vaddr = vaddr + XEN_PAGE_SIZE;
>>> -    }
>>> -
>>> -    return 0;
>>> -}
>>> -EXPORT_SYMBOL_GPL(xenbus_grant_ring);
>>> -
>>>   /*
>>>    * xenbus_setup_ring
>>>    * @dev: xenbus device
>>> @@ -424,6 +380,7 @@ int xenbus_setup_ring(struct xenbus_device *dev, 
>>> gfp_t gfp, void **vaddr,
>>>                 unsigned int nr_pages, grant_ref_t *grefs)
>>>   {
>>>       unsigned long ring_size = nr_pages * XEN_PAGE_SIZE;
>>> +    grant_ref_t gref_head;
>>>       unsigned int i;
>>>       int ret;
>>> @@ -433,9 +390,25 @@ int xenbus_setup_ring(struct xenbus_device 
>>> *dev, gfp_t gfp, void **vaddr,
>>>           goto err;
>>>       }
>>> -    ret = xenbus_grant_ring(dev, *vaddr, nr_pages, grefs);
>>> -    if (ret)
>>> +    ret = gnttab_alloc_grant_references(nr_pages, &gref_head);
>>> +    if (ret) {
>>> +        xenbus_dev_fatal(dev, ret, "granting access to %u ring pages",
>>> +                 nr_pages);
>>>           goto err;
>>> +    }
>>> +
>>> +    for (i = 0; i < nr_pages; i++) {
>>> +        unsigned long gfn;
>>> +
>>> +        if (is_vmalloc_addr(*vaddr))
>>> +            gfn = pfn_to_gfn(vmalloc_to_pfn(vaddr[i]));
>>> +        else
>>> +            gfn = virt_to_gfn(vaddr[i]);
>>> +
>>> +        grefs[i] = gnttab_claim_grant_reference(&gref_head);
>>
>> gnttab_claim_grant_reference() can return error if no free grant 
>> reference remains.
>
> This can happen only in case gnttab_alloc_grant_references() didn't
> allocate enough grants but told us it succeeded doing so.
>
>> I understand this patch only moves the code, but probably it would be 
>> better to add a missing check here (and likely rollback already 
>> processed grants if any?).
>
> I don't think this is needed, as this would be a clear bug in the code.

I would put WARN_ON_ONCE if ref is an error value then like xen-netfront 
does. Either way, with or without it you can add my:

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>



>
>
>
> Juergen

-- 
Regards,

Oleksandr Tyshchenko


