Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD493DD6CE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 15:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163066.298812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXq2-0002Xh-Cn; Mon, 02 Aug 2021 13:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163066.298812; Mon, 02 Aug 2021 13:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAXq2-0002UO-8q; Mon, 02 Aug 2021 13:18:38 +0000
Received: by outflank-mailman (input) for mailman id 163066;
 Mon, 02 Aug 2021 13:18:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SgE8=MZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mAXq0-0002UI-7e
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 13:18:36 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 872e56a1-2109-4bbf-9636-a5150033c2fc;
 Mon, 02 Aug 2021 13:18:35 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so5876797pjs.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 06:18:35 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 e13sm12540053pfd.11.2021.08.02.06.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:18:32 -0700 (PDT)
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
X-Inumbo-ID: 872e56a1-2109-4bbf-9636-a5150033c2fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NCI3lHDyDwNRa9nHRAWUMeIv6E94OBk/ArQgKFFM5dk=;
        b=PML2k1Dht8uODKlH3PjAFdc6s/CTDMJQb0vSXp+tWKBkOZKDTm+GB/eR8aVXQ70FAX
         jEcnBX+WXP5rLcq4W5X5HFrW9hJ51Vmvgvy8hGNIdNIWJPbXr/Z0woDD3x3PwhBautYj
         f/s264QOiroQXi9rnewmDedviFD+3T3gC4ei7Z5FsKr/y65Ls/dYfdoaKAM+Ec2wHvVd
         aA36ny4fOTLJxiB1mC/JAk1BfVfacZyAbJGrI98dEdqVsjhB5uZtuVM6yydcCZZA8s9D
         eyWMrETGzJOpt/w2FVnHDuzrREi+J5sEiaxqqYpsUx4zqF5/iQRjwnI3UJJpHaysMi13
         lAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NCI3lHDyDwNRa9nHRAWUMeIv6E94OBk/ArQgKFFM5dk=;
        b=o3KSRQJ9yc1rzg7Z/rGmcIeLJh2MSybYsHE7qNBWlF9+4b2lL/Zj6xMFrmA0n/H7zK
         x+GIASD/WY012WN8t0d+eEpjonM3E7l95+8yPuem3FQeb6P/khjlQxTI0THcj/Zm8q/F
         T8FTBwTxdZvpAbjl/a/ni1qykqtUi3C3dsKtCNHcn1UGHlOtqwJU5z0dJhRyf+nEDphp
         gT5Vz5XyzPhpt0MvWlPYET8C2N6OQxDfPDXomTMKvE/kNSI7QUBZGsM6P1dO7kKFoEI3
         pOzip61ae8acUUBFCJNtGLgT2Bl2x7qFpDQ8gOSCOCjAs/u9ehMphI2p9zCIHRLhm+86
         2jmg==
X-Gm-Message-State: AOAM533jjzuY+n6JfKTWBx7Xsm3/ds7tBVDqxFV3N9xZu1yFcegD/eVM
	EgXgzM3Ct4MBGS7Jdui7kNU=
X-Google-Smtp-Source: ABdhPJzFSB7pHIeqEWjNLoxbHlaMRkkWu5nfzAixwCVuwFPeXy4oAXbwBpyGfDBS8UB6XOVjOVOqpg==
X-Received: by 2002:a62:5587:0:b029:3af:776c:2d02 with SMTP id j129-20020a6255870000b02903af776c2d02mr16019093pfb.11.1627910314492;
        Mon, 02 Aug 2021 06:18:34 -0700 (PDT)
Subject: Re: [PATCH 05/13] HV: Add Write/Read MSR registers via ghcb page
To: Joerg Roedel <joro@8bytes.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, will@kernel.org, davem@davemloft.net,
 kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 arnd@arndb.de, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, ardb@kernel.org,
 Tianyu.Lan@microsoft.com, rientjes@google.com, martin.b.radev@gmail.com,
 akpm@linux-foundation.org, rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-6-ltykernel@gmail.com> <YQfk9G+k0Tj8ihyu@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <988f20e4-821f-b493-c25d-ca9107a6e891@gmail.com>
Date: Mon, 2 Aug 2021 21:18:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfk9G+k0Tj8ihyu@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/2/2021 8:28 PM, Joerg Roedel wrote:
> On Wed, Jul 28, 2021 at 10:52:20AM -0400, Tianyu Lan wrote:
>> +void hv_ghcb_msr_write(u64 msr, u64 value)
>> +{
>> +	union hv_ghcb *hv_ghcb;
>> +	void **ghcb_base;
>> +	unsigned long flags;
>> +
>> +	if (!ms_hyperv.ghcb_base)
>> +		return;
>> +
>> +	WARN_ON(in_nmi());
>> +
>> +	local_irq_save(flags);
>> +	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
>> +	hv_ghcb = (union hv_ghcb *)*ghcb_base;
>> +	if (!hv_ghcb) {
>> +		local_irq_restore(flags);
>> +		return;
>> +	}
>> +
>> +	memset(hv_ghcb, 0x00, HV_HYP_PAGE_SIZE);
> 
> Do you really need to zero out the whole 4k? The validation bitmap
> should be enough, there are no secrets on the page anyway.
> Same in hv_ghcb_msr_read().

OK. Thanks for suggestion. I will have a try.

> 
>> +enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
>> +				   struct es_em_ctxt *ctxt,
>> +				   u64 exit_code, u64 exit_info_1,
>> +				   u64 exit_info_2)
>>   {
>>   	enum es_result ret;
>>   
>> @@ -109,7 +109,16 @@ static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
>>   	ghcb_set_sw_exit_info_1(ghcb, exit_info_1);
>>   	ghcb_set_sw_exit_info_2(ghcb, exit_info_2);
>>   
>> -	sev_es_wr_ghcb_msr(__pa(ghcb));
>> +	/*
>> +	 * Hyper-V runs paravisor with SEV. Ghcb page is allocated by
>> +	 * paravisor and not needs to be updated in the Linux guest.
>> +	 * Otherwise, the ghcb page's PA reported by paravisor is above
>> +	 * VTOM. Hyper-V use this function with NULL for ctxt point and
>> +	 * skip setting ghcb page in such case.
>> +	 */
>> +	if (ctxt)
>> +		sev_es_wr_ghcb_msr(__pa(ghcb));
> 
> No, do not make this function work with ctxt==NULL. Instead, factor out
> a helper function which contains what Hyper-V needs and use that in
> sev_es_ghcb_hv_call() and Hyper-V code.
> 

OK. Will update.

>> +union hv_ghcb {
>> +	struct ghcb ghcb;
>> +} __packed __aligned(PAGE_SIZE);
> 
> I am curious what this will end up being good for.
> 

Hyper-V introduces a specific hypercall request in GHCB page and use 
same union in the Linux Hyper-V code to read/write MSR and call the new 
hypercall request.

