Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBFA3FE94A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176958.322044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgJw-0001X7-Ak; Thu, 02 Sep 2021 06:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176958.322044; Thu, 02 Sep 2021 06:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgJw-0001Ua-7c; Thu, 02 Sep 2021 06:35:32 +0000
Received: by outflank-mailman (input) for mailman id 176958;
 Thu, 02 Sep 2021 06:35:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEJZ=NY=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mLgJu-0001UU-9E
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:35:30 +0000
Received: from mail-pl1-x636.google.com (unknown [2607:f8b0:4864:20::636])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80600cbb-2ca5-4052-96ee-071c6917b238;
 Thu, 02 Sep 2021 06:35:29 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id u1so553660plq.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Sep 2021 23:35:29 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 g4sm1018401pjt.56.2021.09.01.23.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 23:35:28 -0700 (PDT)
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
X-Inumbo-ID: 80600cbb-2ca5-4052-96ee-071c6917b238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p4zDh7Zmvhg146z4qnwrQjuDGyGfYeNoi9EXmtV3vCk=;
        b=D1rnGa8kIjiZ7syMAy++5cDhLy8JHAOLoRVSufAq+d7fBo+t78Ke3s5Yz1uPgVHodR
         U6y3CPKzBmSzyPUZn2Il5d6T3nJ0NLYayesHqiQlQ4AEq/1OrsdnVq5iF5qtETbh4p6f
         YgZRdRXpDzg75R4rrFTDxF1Zz1nXCMjG9r/QcQXP8xK1ZctdFRxf6VSwgwv/ubG846BU
         K739MDCHAYaN+1tdvPFg/QEZ+f5A+dgNahgxMiNjqV+fKo13+NpkXyburB09UGN30GsF
         XrTtEDpmj/CBGDgU+QPL5YGf1gME4ItHnSLzoIa1FCF+YWcVe+sOEyV7VJxulilpk/4U
         stQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p4zDh7Zmvhg146z4qnwrQjuDGyGfYeNoi9EXmtV3vCk=;
        b=HnOntxY7PPHffI/brxhFU1A2oI6rtw7Vt76QCfjql/e17KC2vdpkAePsfH8Y4JCLy2
         +TF5UyZYJg1S0VV8BLvT+NgGRKrPf+EoVOTb91KB06tZrCgqymI2cGK5xFYrHSJ50leE
         o8jjAWEfUK5KaSVpX5NHwUGh4Jx8OB4hQa3QK7RmusXKr4c4UEcLr4K6Jmi/eVjtwgng
         FSG5mI9tUMN4pz2P3FVzlUawsDxDIOLCmcPMW/M8SWZKABTbfs/ghPa9wPxIYwQkaRSh
         S/9qubGj/fmVdgi3ebS3uMLNxHJCb/ROPyDqpqX/Bt9I/Ub4dEudTszqdCDKrfOyYBJw
         7cxg==
X-Gm-Message-State: AOAM532g7TG6KUCBbbvi/w+iZTF0eWoAm2vMemgzbK4fykFHlWOucCOV
	BG4S+polr96PH9gmB1311xc=
X-Google-Smtp-Source: ABdhPJz4pUoRMJIRNU1Ww7Cq95vazM9v9pAhLPt1toZi1VH9XpEJzie9uEpEa09aj/QIF3t5VvMn8Q==
X-Received: by 2002:a17:90a:509:: with SMTP id h9mr2194087pjh.71.1630564528531;
        Wed, 01 Sep 2021 23:35:28 -0700 (PDT)
Subject: Re: [PATCH V4 02/13] x86/hyperv: Initialize shared memory boundary in
 the Isolation VM.
To: Michael Kelley <mikelley@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, "pgonda@google.com"
 <pgonda@google.com>, "martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "hannes@cmpxchg.org"
 <hannes@cmpxchg.org>, "aneesh.kumar@linux.ibm.com"
 <aneesh.kumar@linux.ibm.com>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "rientjes@google.com" <rientjes@google.com>,
 "ardb@kernel.org" <ardb@kernel.org>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
 <20210827172114.414281-3-ltykernel@gmail.com>
 <MWHPR21MB1593EF63423A2422DA839793D7CE9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <3162bb35-f047-ddbb-3836-6b048b7358e7@gmail.com>
Date: Thu, 2 Sep 2021 14:35:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB1593EF63423A2422DA839793D7CE9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Michael:
       Thanks for your review.

On 9/2/2021 8:15 AM, Michael Kelley wrote:
> From: Tianyu Lan <ltykernel@gmail.com> Sent: Friday, August 27, 2021 10:21 AM
>>
>> Hyper-V exposes shared memory boundary via cpuid
>> HYPERV_CPUID_ISOLATION_CONFIG and store it in the
>> shared_gpa_boundary of ms_hyperv struct. This prepares
>> to share memory with host for SNP guest.
>>
>> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
>> ---
>> Change since v3:
>> 	* user BIT_ULL to get shared_gpa_boundary
>> 	* Rename field Reserved* to reserved
>> ---
>>   arch/x86/kernel/cpu/mshyperv.c |  2 ++
>>   include/asm-generic/mshyperv.h | 12 +++++++++++-
>>   2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
>> index 20557a9d6e25..8bb001198316 100644
>> --- a/arch/x86/kernel/cpu/mshyperv.c
>> +++ b/arch/x86/kernel/cpu/mshyperv.c
>> @@ -313,6 +313,8 @@ static void __init ms_hyperv_init_platform(void)
>>   	if (ms_hyperv.priv_high & HV_ISOLATION) {
>>   		ms_hyperv.isolation_config_a = cpuid_eax(HYPERV_CPUID_ISOLATION_CONFIG);
>>   		ms_hyperv.isolation_config_b = cpuid_ebx(HYPERV_CPUID_ISOLATION_CONFIG);
>> +		ms_hyperv.shared_gpa_boundary =
>> +			BIT_ULL(ms_hyperv.shared_gpa_boundary_bits);
>>
>>   		pr_info("Hyper-V: Isolation Config: Group A 0x%x, Group B 0x%x\n",
>>   			ms_hyperv.isolation_config_a, ms_hyperv.isolation_config_b);
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index 0924bbd8458e..7537ae1db828 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -35,7 +35,17 @@ struct ms_hyperv_info {
>>   	u32 max_vp_index;
>>   	u32 max_lp_index;
>>   	u32 isolation_config_a;
>> -	u32 isolation_config_b;
>> +	union {
>> +		u32 isolation_config_b;
>> +		struct {
>> +			u32 cvm_type : 4;
>> +			u32 reserved11 : 1;
>> +			u32 shared_gpa_boundary_active : 1;
>> +			u32 shared_gpa_boundary_bits : 6;
>> +			u32 reserved12 : 20;
> 
> I'm still curious about the "11" and "12" in the reserved
> field names.  Why not just "reserved1" and "reserved2"?
> Having the "11" and "12" isn't wrong, but it makes one
> wonder why since it's not usual. :-)
> 

Yes, will update. Thanks.

