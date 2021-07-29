Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B353DA709
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 17:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161968.297190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m97YS-00017n-JA; Thu, 29 Jul 2021 15:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161968.297190; Thu, 29 Jul 2021 15:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m97YS-00015R-Fy; Thu, 29 Jul 2021 15:02:36 +0000
Received: by outflank-mailman (input) for mailman id 161968;
 Thu, 29 Jul 2021 15:02:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Rz1=MV=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m97YR-00015L-KS
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 15:02:35 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7523ad27-ab53-48a0-acb5-17f9ee7f8da7;
 Thu, 29 Jul 2021 15:02:34 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id n10so7322060plf.4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jul 2021 08:02:34 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 h30sm4026153pfr.191.2021.07.29.08.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 08:02:33 -0700 (PDT)
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
X-Inumbo-ID: 7523ad27-ab53-48a0-acb5-17f9ee7f8da7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+bK/E9hMSXhFLJuYffyy4lnGRV/WQf1v1wRicssH11c=;
        b=FwB6x7B4iG0F7MUs9/9F6Dg/9PoCSP7gVTcOX0ocOJU41g4H+lOYYpyql4IyYVFcQY
         /jR2vjQ8vXFjFKbHbASRXdJemRdLMW21jXT3DV06qcoHuzHkTjYfMvskkaAemBRPzjTP
         h4JIu0oy0kK8PPRWkGWT9A0ZMN37pPHspf8nHPV3REyaJvIq/2bRvESuNsbdqOhCVZps
         wVNuJN0Wcl6YgLLFJnGARAl2uxPd4PQ0Gk5oTKljpXKFW8Dd8N4UiP1kBqxQ7w9zRhD8
         K8YjAuIKZcJf6XeOYfYrcl4FxeujnfCoH+ST0WDAmJ9l2jF1cG2dsUQ3hNCcIAs2tXUI
         dquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+bK/E9hMSXhFLJuYffyy4lnGRV/WQf1v1wRicssH11c=;
        b=F7G4uWQXg8aXmgivzQw3WTXZ48pmriFGfm8/c9svaaXRiISFGXzjL+yr39iE3NDdWQ
         zTJqsC473DhACKky+Yf08o2+gwned+bv0xFrlrfVwUTxSCtmOkBvycHC2pd+0oXR/wHb
         4Ih5fDXX0RHjPW3O2NOrRfYgzDn7MDwOIf2DRPyTeKZY2kJBdThnKS4mLu7xU0Rrw/3R
         v02Z6xdxUD6LLbWS5bTHmv2u1Y70oEHNimZZ1sYkuzJL4naertGfZzWKvm+paNo5mqtB
         S2Cp4buRYIEjAwmdfVDvRHooJOFB8B1dC6lvBJpa4iJRRdttPeAyP8LpwAdgEz6HQwBV
         sZRg==
X-Gm-Message-State: AOAM532hznvbN1HAgLi4NAcSrnZS6IlstTN1q6Jbv/7m8w/2et2yz4z2
	hS6TlocT8ngt+/sE5s3T4ms=
X-Google-Smtp-Source: ABdhPJzBGI9zTfesOKkMJXLKPI10+fN42IwNJPZiUXGYmFrvx/nDBD1B0BKa0HCMXpw5NCSATnP3lw==
X-Received: by 2002:a17:90a:e651:: with SMTP id ep17mr5748786pjb.85.1627570953940;
        Thu, 29 Jul 2021 08:02:33 -0700 (PDT)
Subject: Re: [PATCH 03/13] x86/HV: Add new hvcall guest address host
 visibility support
To: Dave Hansen <dave.hansen@intel.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 rientjes@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 anparri@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-4-ltykernel@gmail.com>
 <a2444c36-0103-8e1c-7005-d97f77f90e85@intel.com>
 <0d956a05-7d24-57a0-f4a9-dccc849b52fc@gmail.com>
 <ec1d4cfd-bbbc-e27a-7589-e85d9f0438f4@intel.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <8df2845d-ee90-56d0-1228-adebb103ec37@gmail.com>
Date: Thu, 29 Jul 2021 23:02:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ec1d4cfd-bbbc-e27a-7589-e85d9f0438f4@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/29/2021 10:09 PM, Dave Hansen wrote:
> On 7/29/21 6:01 AM, Tianyu Lan wrote:
>> On 7/29/2021 1:06 AM, Dave Hansen wrote:
>>> On 7/28/21 7:52 AM, Tianyu Lan wrote:
>>>> @@ -1986,7 +1988,9 @@ static int __set_memory_enc_dec(unsigned long
>>>> addr, int numpages, bool enc)
>>>>        int ret;
>>>>          /* Nothing to do if memory encryption is not active */
>>>> -    if (!mem_encrypt_active())
>>>> +    if (hv_is_isolation_supported())
>>>> +        return hv_set_mem_enc(addr, numpages, enc);
>>>> +    else if (!mem_encrypt_active())
>>>>            return 0;
>>>
>>> One more thing.  If you're going to be patching generic code, please
>>> start using feature checks that can get optimized away at runtime.
>>> hv_is_isolation_supported() doesn't look like the world's cheapest
>>> check.  It can't be inlined and costs at least a function call.
>>
>> Yes, you are right. How about adding a static branch key for the check
>> of isolation VM? This may reduce the check cost.
> 
> I don't think you need a static key.
> 
> There are basically three choices:
> 1. Use an existing X86_FEATURE bit.  I think there's already one for
>     when you are running under a hypervisor.  It's not super precise,
>     but it's better than what you have.
> 2. Define a new X86_FEATURE bit for when you are running under
>     Hyper-V.
> 3. Define a new X86_FEATURE bit specifically for Hyper-V isolation VM
>     support.  This particular feature might be a little uncommon to
>     deserve its own bit.
> 
> I'd probably just do #2.
> 

There is x86_hyper_type to identify hypervisor type and we may check 
this variable after checking X86_FEATURE_HYPERVISOR.

static inline bool hv_is_isolation_supported(void)
{
	if (!cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
		return 0;

         if (x86_hyper_type != X86_HYPER_MS_HYPERV)
                 return 0;

	// out of line function call:
	return __hv_is_isolation_supported();
}	

