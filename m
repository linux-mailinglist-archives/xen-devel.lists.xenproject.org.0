Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC74E39D6DD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 10:16:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137735.255153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqAPN-0006Gy-LY; Mon, 07 Jun 2021 08:14:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137735.255153; Mon, 07 Jun 2021 08:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqAPN-0006Eh-IB; Mon, 07 Jun 2021 08:14:53 +0000
Received: by outflank-mailman (input) for mailman id 137735;
 Mon, 07 Jun 2021 08:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+N/=LB=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lqAPM-0006EZ-1C
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 08:14:52 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b6dff58-edcb-461c-8dcd-a94c33ce1d6d;
 Mon, 07 Jun 2021 08:14:51 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id x10so8209084plg.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jun 2021 01:14:51 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 r11sm8236573pgl.34.2021.06.07.01.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 01:14:49 -0700 (PDT)
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
X-Inumbo-ID: 9b6dff58-edcb-461c-8dcd-a94c33ce1d6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c5tZw1PE5ja1kIfp0A9CThFtz7RTJJ96vn5JKsdn4zo=;
        b=XoQyLvz24OoCRIOShkQNcu9DiR7bBkokC0zH2y0VsTYjxJfKw7R0siA80dncjT3YUK
         wAQolPJ8LMP2QAHMUANfaqPmSCX0C5CGSEEQPtRRcQTl1EKUo8gRIPdRN/yizwXOvk7a
         MyxLl0xOVUFh4CzE2lkyyns1y8zU/3BfW8wnjMepLuBa14dDIuRlcgHvnJy9KhXaOr8X
         f1b1b3SWDcQzR8oj41QVFoJZ6XqUPNURZphda8kDAwgTk/UUkxjzRis3jA/H1Gt2YM49
         MOGgQu1k2QTfbhGmrfPyoKrM3mYFHKWoquCiDY9UKYa1vj3gMvLKx5aFnrcD/cKhHcp4
         J8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c5tZw1PE5ja1kIfp0A9CThFtz7RTJJ96vn5JKsdn4zo=;
        b=PTNP+e+BEbsZgKCbDdK430ywyYvwSCMR4oAVFA1z/bvOjz4A0CwzVrHYEVUTTWjyLP
         DTfQ6tI87T6cO4x4ExJJxR3SwlTBJuckyfzguFRWJujSsWH4XBFvfAO6RD6PVAxR9re4
         46Yb/Vj5X1EML1MQHUMbt+RbLNzVZxvbU9yY18v4Numaz9D+++czZfnWzx55ehJ/qJSt
         fSW3Xp9kbWpMew4FsGCgOW7NlAFazd5UKznHfFR9nbSh5sCXDsP6a2RCMMK0AWIzdCsS
         W1G3ebF1a0FhS6bSpNP1bCyWjsXuaZErx2HceCh0bike/tlmqeNxC+fEelOtGv0KZsyL
         Lnfw==
X-Gm-Message-State: AOAM530oG9LpEYKAiKawgeu8SIv02+ZbLUEqOV3iV56RP9OP9wGTs/Wf
	mUlXVym6WEt1ktpMy8P3KMo=
X-Google-Smtp-Source: ABdhPJz5DsUF3lCnv8yQA4dIwCqwn7lOEnqmDAyx9VQ48+J+hBL0/9GZGiwWD3mDm4r9zCHOflaTmA==
X-Received: by 2002:a17:902:9a42:b029:f5:1cf7:2e52 with SMTP id x2-20020a1709029a42b02900f51cf72e52mr16701852plv.25.1623053690127;
        Mon, 07 Jun 2021 01:14:50 -0700 (PDT)
Subject: Re: [RFC PATCH V3 01/11] x86/HV: Initialize GHCB page in Isolation VM
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-2-ltykernel@gmail.com>
 <20210607064142.GA24478@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <37260f47-bd32-08f7-b006-f75f4d3c408a@gmail.com>
Date: Mon, 7 Jun 2021 16:14:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607064142.GA24478@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Christoph:
	Thanks for your review.

On 6/7/2021 2:41 PM, Christoph Hellwig wrote:
> On Sun, May 30, 2021 at 11:06:18AM -0400, Tianyu Lan wrote:
>> +	if (ms_hyperv.ghcb_base) {
>> +		rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
>> +
>> +		ghcb_va = ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
>> +		if (!ghcb_va)
>> +			return -ENOMEM;
> 
> Can you explain this a bit more?  We've very much deprecated
> ioremap_cache in favor of memremap.  Why yo you need a __iomem address
> here?  Why do we need the remap here at all? >

GHCB physical address is an address in extra address space which is 
above shared gpa boundary reported by Hyper-V CPUID. The addresses below
shared gpa boundary treated as encrypted and the one above is treated as 
decrypted. System memory is remapped in the extra address space and it 
starts from the boundary. The shared memory with host needs to use 
address in the extra address(pa + shared_gpa_boundary) in Linux guest.

Here is to map ghcb page for the communication operations with 
Hypervisor(e.g, hypercall and read/write MSR) via GHCB page.

memremap() will go through iomem_resource list and the address in extra 
address space will not be in the list. So I used ioremap_cache(). I will
memremap() instead of ioremap() here.

> Does the data structure at this address not have any types that we
> could use a struct for?

The struct will be added in the following patch. I will refresh the 
following patch and use the struct hv_ghcb for the mapped point.
> 
>> +
>> +		rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
>> +		ghcb_va = ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
>> +		if (!ghcb_va) {
> 
> This seems to duplicate the above code.

The above is to map ghcb for BSP and here does the same thing for APs
Will add a new function to avoid the duplication.

> 
>> +bool hv_isolation_type_snp(void)
>> +{
>> +	return static_branch_unlikely(&isolation_type_snp);
>> +}
>> +EXPORT_SYMBOL_GPL(hv_isolation_type_snp);
> 
> This probably wants a kerneldoc explaining when it should be used. >

OK. I will add.


