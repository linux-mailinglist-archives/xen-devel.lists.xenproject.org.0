Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67368BAC03B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133889.1471959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vew-0003D9-8N; Tue, 30 Sep 2025 08:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133889.1471959; Tue, 30 Sep 2025 08:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vew-0003AS-5E; Tue, 30 Sep 2025 08:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1133889;
 Tue, 30 Sep 2025 08:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVVz=4J=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1v3Veu-0003AM-Pi
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:24:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0d490e7-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:24:27 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-oZVi3mpgOxWe_Q2VeIHfEQ-1; Tue, 30 Sep 2025 04:24:25 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e35baddc1so35011305e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:24:24 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f536a3sm53104865e9.8.2025.09.30.01.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 01:24:22 -0700 (PDT)
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
X-Inumbo-ID: e0d490e7-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759220666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UBV7yT9H1ZhgWn+VIgi65bhiZQpS7FeEIVePaxqLk1w=;
	b=P7FC1/va0pG2/jxqw+/tsB83YiVafUQa4usUlz8KwjAWNdlZIHWz9+TSsPmlfxPstS5f/j
	ZOXTwCZCfM1KHYadAF2nlMNf3zcAaGymgxjJb570iAaQza6GJiJdea1loF0VIBTPKosGFB
	UAP7QE0v0NbmsOAJF1ws2/rJ7ImU1dU=
X-MC-Unique: oZVi3mpgOxWe_Q2VeIHfEQ-1
X-Mimecast-MFC-AGG-ID: oZVi3mpgOxWe_Q2VeIHfEQ_1759220663
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220663; x=1759825463;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBV7yT9H1ZhgWn+VIgi65bhiZQpS7FeEIVePaxqLk1w=;
        b=cVgpg1Qxb8NlKgfzqRfHKtmP9LQHmBsR1VPWAKg9aW97RHjVYloCMdNSm02zYbQt5r
         GUBuIRgqna+rhSKk8+ZVB+15+4ChjsqVxYLk6L2PNEaYZtPOHeiNOl7bObgVJdmktjoR
         Xrws2VArXRMlAKMBiel1hwFpm5f/8alnBYODeqGHmSrjLF++n/wVk7x2TQfbHixooRps
         iCg+LIDXiFnDQIfpW57507e3/ift06TPhs+G9P83MA93JCcfTEnaggbAanwXpuMKdfYv
         ZpPhxThdnU8Yzk0EjmhGXHQ55prOq5Jg+KKBlxZGZ3KBH4JGQI4NqxhSxIxwUk3UN12Z
         1Ung==
X-Forwarded-Encrypted: i=1; AJvYcCX9qo8gw1HwjC5yVS+odsJ0pj9zp79fJKHrmSgCKKylTRoqKHPGgMpOZ3rRgzKFlqlj7UQS5t654Xs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKMd/Tizh1bubKsUwdMFHmbUt8D+yYk+ASo/kSH30qJrU+b94d
	WHuOB5wPLPE4fVxyz99VrCIUPiHRboKuYCb8Yk/edTLafF8ac/zBdUXYP21yzoQGqlW2fDinQ3a
	LT4bQ6y1VX5yqZo+Ozw9gNgLliACpdHQf1itNcuKHBOVZUYpr+e74nEdTca7l0/lCKN53
X-Gm-Gg: ASbGnctHK9ntt9Kh527E8Y59DuNUdZfEFiP3YxVHZSLt4MfAKTep7VHyRySQ/mNI+7J
	aNnIDzIdqGZJXNTBs+oCm9LLt5JWlUCa5LeVXv981h26/OiuK59gAzdGrbfKh0HkxQR311pH0iS
	aliciKEPNLwNOW2xWqikIkhE1/w7HwmYRDGmgDd9Vs/tyXPTBHJWGrWrTpKI7Vmd0vr5mxEJHtd
	vwU0HRUwxMmoGE9kDJ4dQY2SNkbSkjWuaiYYAsLBx4AqtIFhBKHbkBFZDWPu+JTTOHAzWdp9U70
	qiLCyWkN4zl2evBqfA7qA48d7RJjHVB4cyt4ogx/n8X+nHdUgy0FshyKxuOBgcFltdtNTxnCawQ
	eJbPt3g7H+g==
X-Received: by 2002:a05:600c:a4c:b0:46e:2861:9eb2 with SMTP id 5b1f17b1804b1-46e329a4931mr225420405e9.8.1759220663287;
        Tue, 30 Sep 2025 01:24:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP1j7w6YQfPOaARZMgzdiehUJ10arFfO1DEIi9uwI/uwm5ShlL/vhcbx6Iz07lCciB2GZFhg==
X-Received: by 2002:a05:600c:a4c:b0:46e:2861:9eb2 with SMTP id 5b1f17b1804b1-46e329a4931mr225419995e9.8.1759220662830;
        Tue, 30 Sep 2025 01:24:22 -0700 (PDT)
Message-ID: <525dd07f-ae64-4ba7-b3ec-b9fcd86aa8a5@redhat.com>
Date: Tue, 30 Sep 2025 10:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] system/memory: Better describe @plen argument of
 flatview_translate()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Stefano Garzarella <sgarzare@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Jason Herne
 <jjherne@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20250930082126.28618-1-philmd@linaro.org>
 <20250930082126.28618-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250930082126.28618-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dxCpSZa0Uh_2EY4pzUpLhhbHcm4e58BNE-W78GiwhoY_1759220663
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 10.21, Philippe Mathieu-Daudé wrote:
> flatview_translate()'s @plen argument is output-only and can be NULL.
> 
> When Xen is enabled, only update @plen_out when non-NULL.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/memory.h | 5 +++--
>   system/physmem.c        | 9 +++++----
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/system/memory.h b/include/system/memory.h
> index aa85fc27a10..3e5bf3ef05e 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -2992,13 +2992,14 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
>    * @addr: address within that address space
>    * @xlat: pointer to address within the returned memory region section's
>    * #MemoryRegion.
> - * @len: pointer to length
> + * @plen_out: pointer to valid read/write length of the translated address.
> + *            It can be @NULL when we don't care about it.
>    * @is_write: indicates the transfer direction
>    * @attrs: memory attributes
>    */
>   MemoryRegion *flatview_translate(FlatView *fv,
>                                    hwaddr addr, hwaddr *xlat,
> -                                 hwaddr *len, bool is_write,
> +                                 hwaddr *plen_out, bool is_write,
>                                    MemTxAttrs attrs);
>   
>   static inline MemoryRegion *address_space_translate(AddressSpace *as,
> diff --git a/system/physmem.c b/system/physmem.c
> index 8a8be3a80e2..86422f294e2 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -566,7 +566,7 @@ iotlb_fail:
>   
>   /* Called from RCU critical section */
>   MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
> -                                 hwaddr *plen, bool is_write,
> +                                 hwaddr *plen_out, bool is_write,
>                                    MemTxAttrs attrs)
>   {
>       MemoryRegion *mr;
> @@ -574,13 +574,14 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
>       AddressSpace *as = NULL;
>   
>       /* This can be MMIO, so setup MMIO bit. */
> -    section = flatview_do_translate(fv, addr, xlat, plen, NULL,
> +    section = flatview_do_translate(fv, addr, xlat, plen_out, NULL,
>                                       is_write, true, &as, attrs);
>       mr = section.mr;
>   
> -    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
> +    if (xen_enabled() && plen_out && memory_access_is_direct(mr, is_write,
> +                                                             attrs)) {
>           hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
> -        *plen = MIN(page, *plen);
> +        *plen_out = MIN(page, *plen_out);
>       }

My question from the previous version is still unanswered:

https://lore.kernel.org/qemu-devel/22ff756a-51a2-43f4-8fe1-05f17ff4a371@redhat.com/

  Thomas


