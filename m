Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDE382DFF
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 15:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128280.240877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidfM-0000jm-LD; Mon, 17 May 2021 13:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128280.240877; Mon, 17 May 2021 13:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidfM-0000g2-Gs; Mon, 17 May 2021 13:52:16 +0000
Received: by outflank-mailman (input) for mailman id 128280;
 Mon, 17 May 2021 13:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6rY=KM=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lidfL-0000fT-1s
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:52:15 +0000
Received: from mail-oi1-x22d.google.com (unknown [2607:f8b0:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a18b85a-8d6e-444e-8f7e-c5918ac3cdc6;
 Mon, 17 May 2021 13:52:14 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u144so6525402oie.6
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 06:52:14 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id e26sm2728345oig.9.2021.05.17.06.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:52:13 -0700 (PDT)
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
X-Inumbo-ID: 3a18b85a-8d6e-444e-8f7e-c5918ac3cdc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3Q5/aVh8S/Ya8SZ9Z+yZMN/mZ8v1AGIbYyuRPr9kbSg=;
        b=BGFqnrx52Lg5Kk/yz/K8ABPMSsMSfdxvlAUaAv6w4A02S9Bfhd7kvDIYlZgpbStmgp
         siBGgjqIBk5nFgdx4A5lQsoDQ6xnW78GJyTmP/5ZXu9NPCFEU24+S3t/0fJ20N4z6hPq
         /gNtIIGa2hh2rJFjk6LVn6W2CU8pk2R1w8NhOzFNxVISK/+BxuA8l/52Yc2kko9ioqHG
         rMneXAIqteO4mi8rMIPjhQTiDIl8iMHs3OUxL/I0PlBTArrpvhyx4WaK6f3lzOo+o4P0
         4zK/M6b58Za3pJMFzAPFmKg5SD4LcAWg8Rqssm9Mogd6L10ROaAxF4lQZZrOmHFwjtAh
         7+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3Q5/aVh8S/Ya8SZ9Z+yZMN/mZ8v1AGIbYyuRPr9kbSg=;
        b=oCckxWXF8HMs9CrNLkZ1q3Izn24UZ5pIRHLjEFz2mB22nNxS6oVg7ekiLr54Bu4Ex9
         AFQAOlC72FaRd8JroT8Ts5X1ibDnzuZCW4mZLGeOK87G17vdjR/cd/GVBuWH5mv/qEXD
         oLEJTMrXiQdNWKtW+YKvWvuP9eanv11IL7IeD6UL9o99S2hc5jE3o8dg4BhpBLJXYsja
         +N5gInSVnND84Nb3QxtI6gXOiEWDskhJUXGwDY58LmHi39KblAvDUTz3kKWzSXLru5dq
         3ZT9TyjF1+CV8csQJM+VNR62bL26H03qiCS9b6IrfJTH4oL2E57jm8p4DbWV5WRj7L4w
         TGEw==
X-Gm-Message-State: AOAM530WFM/0sSbCd7FoGeuPr6Ls/J8JGbXZ1ZjO9DL9iy0oJkkFcYXg
	S2/nbLqgqWa2xOXwe1zNN2v/VREL6CVNww==
X-Google-Smtp-Source: ABdhPJxZ3fH4rgHtyBtCqxBzKM2g4sRlW39TC70MWTYVwn2+mZttUu/uUYAdw3JTBzyh7OKvpjRoaA==
X-Received: by 2002:aca:280a:: with SMTP id 10mr16184090oix.13.1621259533652;
        Mon, 17 May 2021 06:52:13 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] xen/common: Guard iommu symbols with
 CONFIG_HAS_PASSTHROUGH
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <1156cb116da19ef64323e472bb6b6e87c6c73d77.1621017334.git.connojdavis@gmail.com>
 <556d1933-3b11-0780-edec-b6dc1729bc56@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <beed18a6-02e7-d3a5-0a86-e2872d8927ac@gmail.com>
Date: Mon, 17 May 2021 07:52:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <556d1933-3b11-0780-edec-b6dc1729bc56@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/17/21 5:16 AM, Jan Beulich wrote:
> On 14.05.2021 20:53, Connor Davis wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -294,7 +294,9 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
>>       p2m_type_t p2mt;
>>   #endif
>>       mfn_t mfn;
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       bool *dont_flush_p, dont_flush;
>> +#endif
>>       int rc;
>>   
>>   #ifdef CONFIG_X86
>> @@ -385,13 +387,17 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
>>        * Since we're likely to free the page below, we need to suspend
>>        * xenmem_add_to_physmap()'s suppressing of IOMMU TLB flushes.
>>        */
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       dont_flush_p = &this_cpu(iommu_dont_flush_iotlb);
>>       dont_flush = *dont_flush_p;
>>       *dont_flush_p = false;
>> +#endif
>>   
>>       rc = guest_physmap_remove_page(d, _gfn(gmfn), mfn, 0);
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       *dont_flush_p = dont_flush;
>> +#endif
>>   
>>       /*
>>        * With the lack of an IOMMU on some platforms, domains with DMA-capable
>> @@ -839,11 +845,13 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>>       xatp->gpfn += start;
>>       xatp->size -= start;
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       if ( is_iommu_enabled(d) )
>>       {
>>          this_cpu(iommu_dont_flush_iotlb) = 1;
>>          extra.ppage = &pages[0];
>>       }
>> +#endif
>>   
>>       while ( xatp->size > done )
>>       {
>> @@ -868,6 +876,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>>           }
>>       }
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>       if ( is_iommu_enabled(d) )
>>       {
>>           int ret;
>> @@ -894,6 +903,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>>           if ( unlikely(ret) && rc >= 0 )
>>               rc = ret;
>>       }
>> +#endif
>>   
>>       return rc;
>>   }
> I wonder whether all of these wouldn't better become CONFIG_X86:
> ISTR Julien indicating that he doesn't see the override getting used
> on Arm. (Julien, please correct me if I'm misremembering.)
>
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -51,9 +51,15 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
>>       return dfn_x(x) == dfn_x(y);
>>   }
>>   
>> -extern bool_t iommu_enable, iommu_enabled;
>> +extern bool_t iommu_enable;
>>   extern bool force_iommu, iommu_quarantine, iommu_verbose;
>>   
>> +#ifdef CONFIG_HAS_PASSTHROUGH
>> +extern bool_t iommu_enabled;
> Just bool please, like is already the case for the line in context
> above. We're in the process of phasing out bool_t.
Got it, thanks.
>
> Jan


Thanks,

Connor


