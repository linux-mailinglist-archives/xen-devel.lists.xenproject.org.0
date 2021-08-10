Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC33E59E5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 14:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165365.302219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDQp9-00021a-KW; Tue, 10 Aug 2021 12:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165365.302219; Tue, 10 Aug 2021 12:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDQp9-0001zn-HN; Tue, 10 Aug 2021 12:25:39 +0000
Received: by outflank-mailman (input) for mailman id 165365;
 Tue, 10 Aug 2021 12:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKY7=NB=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mDQp8-0001zh-OV
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 12:25:38 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58a54a9f-789c-470d-85e6-aa916f5348a9;
 Tue, 10 Aug 2021 12:25:37 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so5032035pjb.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Aug 2021 05:25:37 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 c14sm27323452pgv.86.2021.08.10.05.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 05:25:35 -0700 (PDT)
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
X-Inumbo-ID: 58a54a9f-789c-470d-85e6-aa916f5348a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KL/EO4tx0TgX51zBlp9/CRNMvpFlpR97J3ss4EOthZ4=;
        b=Ku17ZPCf0pl6UbjbC+OHRNn+ACNBAQsVDchdBbllR6na7JEZVKeCa/0V92DnHTF4iu
         ltIgOtvQG3ChEWFKQGS+ZCmo2X5SwNpdvKDzPZ6w0gyO5dvGz4wCAvWk5byjwwrwUcRC
         5GXqtBHSfAX3q8Kpy97hYWlFUn1WyjEzTjjzbz4eIMRpPJ/3pBUQT0IeP+6w+Os/n12x
         G3057aJUPMJ9DEYkyOBYuaABfzqFcCP+cS+hRvjLg1IN1XmahkLLELPX+1i2xq4zJ7oh
         O3GJi71MYUghn8gllMllI0c3neKMWm0JGzHgfC7goYCwLqZcdx+lapv2oLk7A8os2kge
         ueiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KL/EO4tx0TgX51zBlp9/CRNMvpFlpR97J3ss4EOthZ4=;
        b=CWo7qKwE5O6i5seFhew+nQVb0bFiFEAyyamwAAHcmoZnY7QUz4WRWM1BCCeTP8UVv8
         ed9A0HOVbTRMHeVRwdvTjUP73rhSB6LCyCntJAJ96W0mIdOSUk0WV1LHzSi+oIjWUHfJ
         ozx70XcHV/thoaIEmuWveyY2o/KBVsksNu70CobBFCJUyUz+9bWpBBfcDpLlp7VQ1M6i
         oRqmoPgEtbySPqU0UpqTFTQjxrFFnsKD7dPcxEcB28FEadGnQ0LSdY7xAHqgrSy25u8V
         mwldYZRmfI8kijIWCt1HyEW1nF436f2wxCenpV1+Q5ep9EBkCyh71vvnSwnEv49/cxS8
         MrBw==
X-Gm-Message-State: AOAM5333toC9yszQISvtv9mjN+gqyvGqYBvreQAbP9mwQn+NXqqDRu88
	mRNSaRhVTqQ53OvwAnNYkU0=
X-Google-Smtp-Source: ABdhPJxebFlgnG0NPPgyE6OjM0zu1XGnchtqFN1rLMZ/uNLQlKSp1bY7DCu3pvqaqyd/DJ1LphsUcQ==
X-Received: by 2002:a63:e116:: with SMTP id z22mr254278pgh.361.1628598336671;
        Tue, 10 Aug 2021 05:25:36 -0700 (PDT)
Subject: Re: [PATCH V3 03/13] x86/HV: Add new hvcall guest address host
 visibility support
To: Wei Liu <wei.liu@kernel.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 pgonda@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, sfr@canb.auug.org.au,
 saravanand@fb.com, krish.sadhukhan@oracle.com, aneesh.kumar@linux.ibm.com,
 xen-devel@lists.xenproject.org, rientjes@google.com, hannes@cmpxchg.org,
 tj@kernel.org, michael.h.kelley@microsoft.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-4-ltykernel@gmail.com>
 <20210810110359.i4qodw7h36zrsicp@liuwe-devbox-debian-v2>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <3a888810-69cf-fa4d-b374-2053432e1e56@gmail.com>
Date: Tue, 10 Aug 2021 20:25:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810110359.i4qodw7h36zrsicp@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/10/2021 7:03 PM, Wei Liu wrote:
>> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
>> index 0bb4d9ca7a55..b3683083208a 100644
>> --- a/arch/x86/hyperv/hv_init.c
>> +++ b/arch/x86/hyperv/hv_init.c
>> @@ -607,6 +607,12 @@ EXPORT_SYMBOL_GPL(hv_get_isolation_type);
>>   
>>   bool hv_is_isolation_supported(void)
>>   {
>> +	if (!cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
>> +		return 0;
> Nit: false instead of 0.
> 

OK. Will fix in the next version.

>> +int hv_mark_gpa_visibility(u16 count, const u64 pfn[],
>> +			   enum hv_mem_host_visibility visibility)
>> +{
>> +	struct hv_gpa_range_for_visibility **input_pcpu, *input;
>> +	u16 pages_processed;
>> +	u64 hv_status;
>> +	unsigned long flags;
>> +
>> +	/* no-op if partition isolation is not enabled */
>> +	if (!hv_is_isolation_supported())
>> +		return 0;
>> +
>> +	if (count > HV_MAX_MODIFY_GPA_REP_COUNT) {
>> +		pr_err("Hyper-V: GPA count:%d exceeds supported:%lu\n", count,
>> +			HV_MAX_MODIFY_GPA_REP_COUNT);
>> +		return -EINVAL;
>> +	}
>> +
>> +	local_irq_save(flags);
>> +	input_pcpu = (struct hv_gpa_range_for_visibility **)
>> +			this_cpu_ptr(hyperv_pcpu_input_arg);
>> +	input = *input_pcpu;
>> +	if (unlikely(!input)) {
>> +		local_irq_restore(flags);
>> +		return -EINVAL;
>> +	}
>> +
>> +	input->partition_id = HV_PARTITION_ID_SELF;
>> +	input->host_visibility = visibility;
>> +	input->reserved0 = 0;
>> +	input->reserved1 = 0;
>> +	memcpy((void *)input->gpa_page_list, pfn, count * sizeof(*pfn));
>> +	hv_status = hv_do_rep_hypercall(
>> +			HVCALL_MODIFY_SPARSE_GPA_PAGE_HOST_VISIBILITY, count,
>> +			0, input, &pages_processed);
>> +	local_irq_restore(flags);
>> +
>> +	if (!(hv_status & HV_HYPERCALL_RESULT_MASK))
>> +		return 0;
>> +
>> +	return hv_status & HV_HYPERCALL_RESULT_MASK;
> Joseph introduced a few helper functions in 753ed9c95c37d. They will
> make the code simpler.

OK. Will update in the next version.

Thanks.

