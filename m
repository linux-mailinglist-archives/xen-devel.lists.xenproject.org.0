Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B738707C
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 06:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128593.241393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lir4H-0000kv-Uf; Tue, 18 May 2021 04:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128593.241393; Tue, 18 May 2021 04:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lir4H-0000j1-RJ; Tue, 18 May 2021 04:10:53 +0000
Received: by outflank-mailman (input) for mailman id 128593;
 Tue, 18 May 2021 04:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k696=KN=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lir4G-0000iv-75
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 04:10:52 +0000
Received: from mail-oo1-xc32.google.com (unknown [2607:f8b0:4864:20::c32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe93f687-14d0-4751-a789-8a5d2e3e5a0d;
 Tue, 18 May 2021 04:10:51 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 v13-20020a4aa40d0000b02902052145a469so1949332ool.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 21:10:51 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id b81sm544483oia.19.2021.05.17.21.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 21:10:50 -0700 (PDT)
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
X-Inumbo-ID: fe93f687-14d0-4751-a789-8a5d2e3e5a0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YGxYEzvqZ9sGJNNBQMTkgmj0en+bbvl0F77rkeWFRm0=;
        b=kMjsvvpC+dSknQRpZ7UCV+RC6XMXgke6h/dagJmha1LasGdR/fKSKLmDFIgTQnRC/P
         Xo08hZQRt+W1DKVIvI0VmuWBodkBgASfsvFjBwc0HMgjwwBf4IcNePofvH8Tgse+y9Eo
         QyDc6GY/TdI1Zn+lvVUMz5MmqXiqtmptKP7yFuBP1EHfoxqOmuRVOwCA96eKwS9wJ1Vc
         +Ct8xLQKWapFmZLYA1In9wjP5G7p/PB1+hpJe0PYg97V6riy8SfPzlM5ql5WD+87ERbF
         ynky64DKNczaAHyLyB8muFhTJgZDZ3Am7KuqHhwMaBf0VQhcaq5owuRv5V90V4TvlgMU
         wLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YGxYEzvqZ9sGJNNBQMTkgmj0en+bbvl0F77rkeWFRm0=;
        b=IcWSCeZMm5bvS5UguZaYVVZX2ZnwiSCpEzIdpHlSTYoJsWKEwnbV4Uce3Kmgax7XwN
         eL1E/+U6a2OneKNX4OQgL76W6WJ9dMfT4PtTmJQOnQVHSEtYWygaPOpBVuzjAtSDnK6I
         o1zwiboPY3+LPGoTqXHX2/UZZJXGnwkVBgfTanb/2/gZEzPbGUkwAKH5PgE5QS3PjudU
         Av7ROzXoBvVCW+lJrNLKJhHuSe98JiyMowoWlBRQNqO49g7znRhSbqrept4m8nwlIEte
         XApjdhsyAfh2yrbWPK8KabLxhCT0Wd9XkS/Tak60O6ESt54hfNjboqXJkHvP+/4GF7cu
         CvKw==
X-Gm-Message-State: AOAM531iAKMI2uyu/XSc5Ka5P81DIDv6xyLzRTfpgPer/7yg+nLzrobu
	1D/lNZ+pLlsZnvj/AQwyq09QYDvI+LxkkQ==
X-Google-Smtp-Source: ABdhPJxI7VxEFRTHRIjQhd9VW0RCpQTDmnUr34JwWS0wuFANaDWXprzw1nI0GUUkSLDv8LLUYzGPMw==
X-Received: by 2002:a4a:d004:: with SMTP id h4mr2642934oor.90.1621311050686;
        Mon, 17 May 2021 21:10:50 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <1156cb116da19ef64323e472bb6b6e87c6c73d77.1621017334.git.connojdavis@gmail.com>
 <556d1933-3b11-0780-edec-b6dc1729bc56@suse.com>
 <98b429d0-2673-624e-1690-9c0e8373ed5b@xen.org>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <7cf966f6-7ccf-ba63-2b67-129577a7ca53@gmail.com>
Date: Mon, 17 May 2021 22:11:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <98b429d0-2673-624e-1690-9c0e8373ed5b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/17/21 9:42 AM, Julien Grall wrote:
> Hi Jan,
>
> On 17/05/2021 12:16, Jan Beulich wrote:
>> On 14.05.2021 20:53, Connor Davis wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -294,7 +294,9 @@ int guest_remove_page(struct domain *d, unsigned 
>>> long gmfn)
>>>       p2m_type_t p2mt;
>>>   #endif
>>>       mfn_t mfn;
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>       bool *dont_flush_p, dont_flush;
>>> +#endif
>>>       int rc;
>>>     #ifdef CONFIG_X86
>>> @@ -385,13 +387,17 @@ int guest_remove_page(struct domain *d, 
>>> unsigned long gmfn)
>>>        * Since we're likely to free the page below, we need to suspend
>>>        * xenmem_add_to_physmap()'s suppressing of IOMMU TLB flushes.
>>>        */
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>       dont_flush_p = &this_cpu(iommu_dont_flush_iotlb);
>>>       dont_flush = *dont_flush_p;
>>>       *dont_flush_p = false;
>>> +#endif
>>>         rc = guest_physmap_remove_page(d, _gfn(gmfn), mfn, 0);
>>>   +#ifdef CONFIG_HAS_PASSTHROUGH
>>>       *dont_flush_p = dont_flush;
>>> +#endif
>>>         /*
>>>        * With the lack of an IOMMU on some platforms, domains with 
>>> DMA-capable
>>> @@ -839,11 +845,13 @@ int xenmem_add_to_physmap(struct domain *d, 
>>> struct xen_add_to_physmap *xatp,
>>>       xatp->gpfn += start;
>>>       xatp->size -= start;
>>>   +#ifdef CONFIG_HAS_PASSTHROUGH
>>>       if ( is_iommu_enabled(d) )
>>>       {
>>>          this_cpu(iommu_dont_flush_iotlb) = 1;
>>>          extra.ppage = &pages[0];
>>>       }
>>> +#endif
>>>         while ( xatp->size > done )
>>>       {
>>> @@ -868,6 +876,7 @@ int xenmem_add_to_physmap(struct domain *d, 
>>> struct xen_add_to_physmap *xatp,
>>>           }
>>>       }
>>>   +#ifdef CONFIG_HAS_PASSTHROUGH
>>>       if ( is_iommu_enabled(d) )
>>>       {
>>>           int ret;
>>> @@ -894,6 +903,7 @@ int xenmem_add_to_physmap(struct domain *d, 
>>> struct xen_add_to_physmap *xatp,
>>>           if ( unlikely(ret) && rc >= 0 )
>>>               rc = ret;
>>>       }
>>> +#endif
>>>         return rc;
>>>   }
>>
>> I wonder whether all of these wouldn't better become CONFIG_X86:
>> ISTR Julien indicating that he doesn't see the override getting used
>> on Arm. (Julien, please correct me if I'm misremembering.)
>
> Right, so far, I haven't been in favor to introduce it because:
>    1) The P2M code may free some memory. So you can't always ignore 
> the flush (I think this is wrong for the upper layer to know when this 
> can happen).
>    2) It is unclear what happen if the IOMMU TLBs and the PT contains 
> different mappings (I received conflicted advice).
>
> So it is better to always flush and as early as possible.

So keep it as is or switch to CONFIG_X86?


Thanks,

Connor


