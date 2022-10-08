Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985F5F8549
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 15:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418516.663335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh9Qh-0000HB-4c; Sat, 08 Oct 2022 12:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418516.663335; Sat, 08 Oct 2022 12:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oh9Qh-0000Ep-1i; Sat, 08 Oct 2022 12:59:47 +0000
Received: by outflank-mailman (input) for mailman id 418516;
 Sat, 08 Oct 2022 12:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XqZC=2J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oh9Qf-0000Ej-LM
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 12:59:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1493b0c2-4709-11ed-9377-c1cf23e5d27e;
 Sat, 08 Oct 2022 14:59:44 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id nb11so16466986ejc.5
 for <xen-devel@lists.xenproject.org>; Sat, 08 Oct 2022 05:59:44 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 bx10-20020a0564020b4a00b00456cbd8c65bsm3458103edb.6.2022.10.08.05.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 05:59:43 -0700 (PDT)
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
X-Inumbo-ID: 1493b0c2-4709-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfjlFhbPvAiZaDtCTy2aYvhAArjEPm1WFxaHbT8nyHI=;
        b=cSRqO2nAuD4hdK6rSHRMxiXIlZRmuejx2sU72K+cUUQ7e/Ity03/COx2Z1qjYGRr+7
         5ZBvfphK2rxoxH1V+AHKvVGZYWivc4x6oa/DKTZ5RboqAd5Bn71/D9SE/EcuHqIjKn91
         OhBAWL4hS4AHYSYzCb4ZEiCWnfxDyhm/AgSatPGnu3Tb14g08odyUU+elq1/ErUpGaaE
         4uKZCESNwtyWWnqoOFrYOygojUVr3a6/qHquBeNmrC8rHlW5vFuPnxyq//ZJvggewhcZ
         HIMtdMYlvIiTSpqiMiQ5ItFJQ7kzkIpEs+s5jAvtGsp821Tu49wHdhRS3zw2IHDq8Dnb
         XOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfjlFhbPvAiZaDtCTy2aYvhAArjEPm1WFxaHbT8nyHI=;
        b=K/1Ny87SZwmGOOHGxxkkfwkz9aNZlWPo0BZeL3ybxg2vqo2WTh8naH6E1BrdEBPBTg
         55gjo+3uUAPzGaOPppFeYvOnkrhjScyhESSl6UxvFLA615EscG35ROuXtHroD2r9W60q
         5PefDGXHf+6xpsDJvajO3g9ttWsQkl2dyIVJkxm70Tx0v0eYZIPRuQGVB4L43fHNN99L
         s7niUe9iJXVeU1HEMRCcaU0dz7yh1rvc8IHkaszAchXHfjB6YhSnBQflAsRm5JfiaQGr
         w6GP0OsXQLJZS264AK61t0Nykn/B54a63z/MSfJfWz6kjd5lqgcKPtyng0tOgge+lHHR
         CKvA==
X-Gm-Message-State: ACrzQf0biiy7TnHku1x0A066BwilYhxb6BwkOP8z80HoxDwlyN7gTeVd
	mjuWxxO8LVYHGDJKZzn3Umk=
X-Google-Smtp-Source: AMsMyM7oiakATrF7MhnyVQEC0+Xhi6onoKuUCwkbFQlI+p1wkIG2VNiKLh4wCbA0UAEsWU0CM7UjhQ==
X-Received: by 2002:a17:907:760f:b0:78c:336b:d8bd with SMTP id jx15-20020a170907760f00b0078c336bd8bdmr7340909ejc.685.1665233984014;
        Sat, 08 Oct 2022 05:59:44 -0700 (PDT)
Message-ID: <cb6e650f-d8ad-037d-8c35-8a786650b02f@gmail.com>
Date: Sat, 8 Oct 2022 15:59:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/virtio: Handle cases when page offset > PAGE_SIZE
 properly
Content-Language: en-US
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20221007132736.2275574-1-olekstysh@gmail.com>
 <6e33b687-8862-d208-a707-77a95c61525e@gmail.com>
 <d6ec5092-8d93-22c2-7b6e-944ad88ad582@epam.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <d6ec5092-8d93-22c2-7b6e-944ad88ad582@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/8/22 15:52, Oleksandr Tyshchenko wrote:
> 
> On 08.10.22 14:08, Xenia Ragiadakou wrote:
> 
> Hello Xenia
> 
>>
>> On 10/7/22 16:27, Oleksandr Tyshchenko wrote:
>>
>> Hi Oleksandr
>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Passed to xen_grant_dma_map_page() offset in the page
>>> can be > PAGE_SIZE even if the guest uses the same page granularity
>>> as Xen (4KB).
>>>
>>> Before current patch, if such case happened we ended up providing
>>> grants for the whole region in xen_grant_dma_map_page() which
>>> was really unnecessary. The more, we ended up not releasing all
>>> grants which represented that region in xen_grant_dma_unmap_page().
>>>
>>> Current patch updates the code to be able to deal with such cases.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>
>>> Depens on:
>>> https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/20221005174823.1800761-1-olekstysh@gmail.com/__;!!GF_29dbcQIUBPA!xnkNaKpfZ4LssQJcJs_J91KERZKMP2Rd-xEdBqXNXJ8GyCXJ0gkRer1elVYfxOWtwN_FOl9tVieDWlfN-UZaHQsyLMhA$
>>> [lore[.]kernel[.]org]
>>>
>>> Should go in only after that series.
>>> ---
>>>    drivers/xen/grant-dma-ops.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>>> index c66f56d24013..1385f0e686fe 100644
>>> --- a/drivers/xen/grant-dma-ops.c
>>> +++ b/drivers/xen/grant-dma-ops.c
>>> @@ -168,7 +168,9 @@ static dma_addr_t xen_grant_dma_map_page(struct
>>> device *dev, struct page *page,
>>>                         unsigned long attrs)
>>>    {
>>>        struct xen_grant_dma_data *data;
>>> -    unsigned int i, n_pages = PFN_UP(offset + size);
>>> +    unsigned long dma_offset = offset_in_page(offset),
>>> +            gfn_offset = PFN_DOWN(offset);
>>> +    unsigned int i, n_pages = PFN_UP(dma_offset + size);
>>
>> IIUC, the above with a later patch will become:
>>
>> dma_offset = xen_offset_in_page(offset)
>> gfn_offset = XEN_PFN_DOWN(offset)
>> n_pages = XEN_PFN_UP(dma_offset + size)
> 
> 
> If saying "later" patch you meant "xen/virtio: Convert
> PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen counterparts" then yes, exactly.

Ah ok, I see.

>>
>>
>>>        grant_ref_t grant;
>>>        dma_addr_t dma_handle;
>>>    @@ -187,10 +189,10 @@ static dma_addr_t
>>> xen_grant_dma_map_page(struct device *dev, struct page *page,
>>>          for (i = 0; i < n_pages; i++) {
>>>            gnttab_grant_foreign_access_ref(grant + i,
>>> data->backend_domid,
>>> -                xen_page_to_gfn(page) + i, dir == DMA_TO_DEVICE);
>>> +                xen_page_to_gfn(page) + i + gfn_offset, dir ==
>>> DMA_TO_DEVICE);
>>
>> Here, why the pfn is not calculated before passing it to pfn_to_gfn()?
>> I mean sth like pfn_to_gfn(page_to_xen_pfn(page) + gfn_offset + i)
> 
> The gfn_offset is just a const value here, which just means how many
> gfns we should skip. But ...
> 
> ... I think, I get your point. So, if the region which is contiguous in
> pfn might be non-contiguous in gfn (which seems to be the case for x86's
> PV, but I may mistake) we should indeed use open-coded
> 
> construction "pfn_to_gfn(page_to_xen_pfn(page) + gfn_offset + i)".  And
> the gfn_offset should be renamed to pfn_offset then.
> 
> 
> Correct?

Yes, that 's what I had in mind unless I 'm missing sth.

>>
>>>        }
>>>    -    dma_handle = grant_to_dma(grant) + offset;
>>> +    dma_handle = grant_to_dma(grant) + dma_offset;
>>>          return dma_handle;
>>>    }
>>

-- 
Xenia

