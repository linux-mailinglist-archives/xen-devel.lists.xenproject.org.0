Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D33DA360
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 14:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161932.297133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m95Tz-0003z4-Sz; Thu, 29 Jul 2021 12:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161932.297133; Thu, 29 Jul 2021 12:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m95Tz-0003x5-Q1; Thu, 29 Jul 2021 12:49:51 +0000
Received: by outflank-mailman (input) for mailman id 161932;
 Thu, 29 Jul 2021 12:49:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Rz1=MV=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m95Tx-0003wy-Km
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 12:49:49 +0000
Received: from mail-pl1-x630.google.com (unknown [2607:f8b0:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42102d85-d1ac-40da-ac36-e3fc78d5222f;
 Thu, 29 Jul 2021 12:49:48 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c16so6841707plh.7
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jul 2021 05:49:48 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 k198sm3710340pfd.148.2021.07.29.05.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 05:49:47 -0700 (PDT)
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
X-Inumbo-ID: 42102d85-d1ac-40da-ac36-e3fc78d5222f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q0SGRNEWOSLrhO9/bSDBCi5NITuZ+vRSfRGxTziJabU=;
        b=hzKyL5WmsMRD8k+m34XXrgdj7/1e9J85KeDCiJLjzHeqLjqVNN2QCjPp4LTbl8n7tq
         kiYmXEtjueHlVfkLJ8A0fmKvkAGZq+7s4OPYyA0r0BplF5amF3k3XUoUsQgPz8D0bLYG
         d/uu5na8UGcsGtBUkC2kT3gdJO2GxEqPZL2kiRMtbua3knkxb2jI3qoK7y+jAWGsPcYP
         PEdCF+dn9EI6vMVdi6PlEaCnPYi6emG2vaA6WRsUJGCwTl68cpIhDOIIyYkeJamoSXUa
         bu5X6znaixSj3iryQEAayd0uzQ2zW3G7sNXtamd3fsj3KVhp3gkX0Kdn2h9rosJI0OHl
         wWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q0SGRNEWOSLrhO9/bSDBCi5NITuZ+vRSfRGxTziJabU=;
        b=gUFpyTMoidSEqHijtrMSt0DlDAPAYGk/OPmuYcMLuqB3I2ttPHwDMmtwAeE+C7G5S7
         bFihbGMvOkRVnV1f82Ok13LaWP0fpz2O3+rYSxzixlWGVW1brZ8IP860b0JahUXgCWbM
         jkiQQgs2IuL6MsaNvHiwYY54Gidf9TNXsUPo43S5zKYhwlifa/SA340Pyw/ME9/cye/2
         Ap6fSDmP9rOie/fwPYTjCM4qGVjMIqiutQ8ZjsBCHCRFIPR6sEwmVxDisoJXuoDNs2PB
         JkHwlcenmyBa9iQS002k62EQ5sivTdhLSLy/HORMzSXShYCIBtpodKQAgRF8qNSvB2zD
         SnOw==
X-Gm-Message-State: AOAM53086nUL9XLQ0oxJUZXQZHic+/9xyuQNX0jrfW1EsxK+hspI6AaC
	E+7SPjECa1QuudxzjnVdve0=
X-Google-Smtp-Source: ABdhPJxEQWV2usuKh29jSoH2loa36HykTtuvI7jMK52U0Q907fZvwTlhcl4mO3CPvQocl1ZpGKnVjQ==
X-Received: by 2002:aa7:9086:0:b029:39b:6377:17c1 with SMTP id i6-20020aa790860000b029039b637717c1mr5007664pfa.11.1627562987803;
        Thu, 29 Jul 2021 05:49:47 -0700 (PDT)
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
 <c00e269c-da4c-c703-0182-0221c73a76cc@intel.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <ccbe6f4c-5ffe-4d63-67ab-6384fcb8691d@gmail.com>
Date: Thu, 29 Jul 2021 20:49:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c00e269c-da4c-c703-0182-0221c73a76cc@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Dave:
      Thanks for your review.

On 7/28/2021 11:29 PM, Dave Hansen wrote:
> On 7/28/21 7:52 AM, Tianyu Lan wrote:
>> @@ -1986,7 +1988,9 @@ static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
>>   	int ret;
>>   
>>   	/* Nothing to do if memory encryption is not active */
>> -	if (!mem_encrypt_active())
>> +	if (hv_is_isolation_supported())
>> +		return hv_set_mem_enc(addr, numpages, enc);
>> +	else if (!mem_encrypt_active())
>>   		return 0;
> 
> __set_memory_enc_dec() is turning into a real mess.  SEV, TDX and now
> Hyper-V are messing around in here.
> 
> It doesn't help that these additions are totally uncommented.  Even
> worse is that hv_set_mem_enc() was intentionally named "enc" when it
> presumably has nothing to do with encryption.
> 
> This needs to be refactored.  The current __set_memory_enc_dec() can
> become __set_memory_enc_pgtable().  It gets used for the hypervisors
> that get informed about "encryption" status via page tables: SEV and TDX.
> 
> Then, rename hv_set_mem_enc() to hv_set_visible_hcall().  You'll end up
> with:
> 
> int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
> {
> 	if (hv_is_isolation_supported())
> 		return hv_set_visible_hcall(...);
> 
> 	if (mem_encrypt_active() || ...)
> 		return __set_memory_enc_pgtable();
> 
> 	/* Nothing to do */
> 	return 0;
> }
> 
> That tells the story pretty effectively, in code.

Yes, this is good idea. Thanks for your suggestion.

> 
>> +int hv_set_mem_enc(unsigned long addr, int numpages, bool enc)
>> +{
>> +	return hv_set_mem_host_visibility((void *)addr,
>> +			numpages * HV_HYP_PAGE_SIZE,
>> +			enc ? VMBUS_PAGE_NOT_VISIBLE
>> +			: VMBUS_PAGE_VISIBLE_READ_WRITE);
>> +}
> 
> I know this is off in Hyper-V code, but this just makes my eyes bleed.
> I'd much rather see something which is less compact but readable.

OK. Will update.

> 
>> +/* Hyper-V GPA map flags */
>> +#define	VMBUS_PAGE_NOT_VISIBLE		0
>> +#define	VMBUS_PAGE_VISIBLE_READ_ONLY	1
>> +#define	VMBUS_PAGE_VISIBLE_READ_WRITE	3
> 
> That looks suspiciously like an enum.
>

OK. Will update.


