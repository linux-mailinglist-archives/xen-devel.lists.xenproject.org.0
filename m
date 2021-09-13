Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE0409D8E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 21:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185894.334644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPs4i-0001gc-Pv; Mon, 13 Sep 2021 19:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185894.334644; Mon, 13 Sep 2021 19:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPs4i-0001dO-MB; Mon, 13 Sep 2021 19:57:08 +0000
Received: by outflank-mailman (input) for mailman id 185894;
 Mon, 13 Sep 2021 19:57:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cPWG=OD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mPs4g-0001dI-Sr
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 19:57:06 +0000
Received: from mail-ej1-x62f.google.com (unknown [2a00:1450:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae909225-fe3a-4fed-bd4e-d1fb5c7621fa;
 Mon, 13 Sep 2021 19:57:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qq21so17671391ejb.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Sep 2021 12:57:05 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y8sm1700016ejm.104.2021.09.13.12.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 12:57:04 -0700 (PDT)
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
X-Inumbo-ID: ae909225-fe3a-4fed-bd4e-d1fb5c7621fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nrq7NFlO2EfcXfM/mHT2LWBk1VgcUh3w7vl0T8rQAKY=;
        b=HmM69VptWPMRUpvskAeXYRy5difWYuf6Y8dpFISsSFY2otng3YqkQmqrwfvdzgUgYr
         bmw32cO5V5RdNKXo6VFzawqXx3lCKnupvsvZQtApjLA6INZRoOq1nNdlB3e6HynSfa22
         FDcZ5HzbRZcnUhz/Iuzpo24MdZX2yhsCMX/ocmWsaX7BVhDTSO2nTMRoVHCoe/p2ATiM
         PHA6MU4EaTuvN5MFzH4Iy+U96XqnHqj8dp9wg3l59U0G8l4vV5/NM0v7MI+OprXgLGr/
         RengbaeacvCtIyCuQYI2oCZkcPyaq8vy/xgoPcunJoUBAwpgzxEoSQR4X1wvJ4QyGNga
         1fGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nrq7NFlO2EfcXfM/mHT2LWBk1VgcUh3w7vl0T8rQAKY=;
        b=Bwqxk7jUa2tpJapzfKpZJCeButYK1sWoY3MXrzH3SEKzg0Q09NWgSpHXmBoaLtsj2c
         EpNFle8M7hhz6u0KAWeHJ3JFu38x4Ww55pUjieAjSWWOJu1bxuulVa4mMz4D6gPrW8Q/
         7SPE4uLJmajpE0zgOa/B6G0CKq4wOyrawgaXfvb9CtqVhIldOF22l1NCRcaE2Xv/u6bT
         KU6Wq4BvvewpiADR8dtFDmZYxMIkHt5M6ROYemxpfBnHCmqjvrI4gECp0pdpwtc6wlXI
         BHdDdIUXYfqdgFi+5ZlqRBreVvs/sfGC+gLWsNz2uSigJqS48V8ybtICcWNzUY3jEs1K
         0Q2w==
X-Gm-Message-State: AOAM531ZmRpdGS2Oe8UfMxHgxb0sjpMb5GazuiMCbmUqa0wHTxb60s31
	oZxwt1dalIku9eldpOUMqfINchj0NyA=
X-Google-Smtp-Source: ABdhPJzKpfqz6MeVA8O1m1q131Cx+FM5i5zD32WSVEK9xg2YSMPhaMsiuEghPzMk5meCU0ccZy2+RQ==
X-Received: by 2002:a17:906:85d8:: with SMTP id i24mr4404518ejy.451.1631563024565;
        Mon, 13 Sep 2021 12:57:04 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
 <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
 <c006550f-4fe7-29c5-f370-dc67bfac2b95@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f9e95fd9-d63e-675b-0236-653afee617b1@gmail.com>
Date: Mon, 13 Sep 2021 22:57:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c006550f-4fe7-29c5-f370-dc67bfac2b95@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 13.09.21 09:17, Jan Beulich wrote:

Hi Jan

> On 10.09.2021 09:52, Jan Beulich wrote:
>> On 10.09.2021 01:04, Oleksandr Tyshchenko wrote:
>>> @@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
>>>        */
>>>       if ( p2m_is_foreign(pte.p2m.type) )
>>>       {
>>> -        mfn_t mfn = lpae_get_mfn(pte);
>>> -
>>>           ASSERT(mfn_valid(mfn));
>>>           put_page(mfn_to_page(mfn));
>>>       }
>>> +
>>> +#ifdef CONFIG_GRANT_TABLE
>>> +    /*
>>> +     * Check whether we deal with grant table page. As the grant table page
>>> +     * is xen_heap page and its entry has known p2m type, detect it and mark
>>> +     * the stored GFN as invalid.
>>> +     */
>>> +    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
>>> +        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
>>> +#endif
>> I take it the write done is benign for other Xen heap pages? I suppose
>> this would want making very explicit, as such an assumption is easy to
>> go stale by entirely unrelated changes.
>>
>> I also wonder whether you really mean to include p2m_ram_ro pages here
>> as well.
> Actually I've meanwhile realized I should put my question here quite
> differently: Aren't you effectively introducing an M2P here for Arm,
> except that you artificially limit it to the Xen heap pages needed for
> the grant table?

Difficult to say, it might indeed look a bit close to M2P, so the answer 
to your question is more yes than no. But, I didn't have a plan to 
introduce M2P on Arm. It turned out that stashing GFN into page_info (as 
was suggested) avoided huge lookups, so we have got MFN->GFN in the end. 
The purpose of this patch was just to fix a potential issue with 
remapping grant-table frame on architecture without the M2P (Arm).


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


