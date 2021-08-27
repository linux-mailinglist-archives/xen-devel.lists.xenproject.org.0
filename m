Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C73F9E48
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173917.317304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfwW-0006wF-Gy; Fri, 27 Aug 2021 17:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173917.317304; Fri, 27 Aug 2021 17:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfwW-0006ty-Dt; Fri, 27 Aug 2021 17:47:04 +0000
Received: by outflank-mailman (input) for mailman id 173917;
 Fri, 27 Aug 2021 17:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfwU-0006ts-LW
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:47:02 +0000
Received: from mail-pl1-x62d.google.com (unknown [2607:f8b0:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7110da47-723f-4290-9e4a-9fe0e285124b;
 Fri, 27 Aug 2021 17:47:01 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id q3so4395334plx.4
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:47:01 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 h13sm6970553pgh.93.2021.08.27.10.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 10:47:00 -0700 (PDT)
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
X-Inumbo-ID: 7110da47-723f-4290-9e4a-9fe0e285124b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i9TmDZ+esw/3ZLUDMU0ftSn23gEkgnQwCRuas4CrT3U=;
        b=IHtobvTQGY1nPT3/rK9A1D4px0mz9BbFo22Zema5+9nth1Iz8xRjEgbud3ecsrTACs
         Vi0LRfmP6pC0DYOfU30m5IkT0RTdx1CV7IJxATteIxw8CIRTVVgLMm1G9RvSeC8txy3w
         3vkVe4JLgdQHuErnQrEWdxOE6rP0ErL9md4E0hh+apLDdJ7WZ48WHolfWdjVexGKS4Fg
         64VkrIaGeWHwfHBR7pDlwiNy9s7exrN3vRd0AJl72z/zDyU7wj7/6rHEM1CVLs3fMsSi
         383OW19VKOeS1sl5t8aORjPeFCc0nn+WtBx09yLwfzvn3x+xousu5jOLlDzZAsqMezkN
         xg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i9TmDZ+esw/3ZLUDMU0ftSn23gEkgnQwCRuas4CrT3U=;
        b=YuD4QIVpc1bxjYWqSqnnhfzxrhEQirJNz2M1XvXuVMM5awT9ZcmKSEy2JssgPl1Nh1
         A2hgSgL4XbJwABae1QUSD7IjIDCR4+hwhA7kgpKk6CMbr+pHzTwtZ9dkivhCqnA0sf1I
         yB2slkFk2b+fBwoCE4IV8EggS3/tuQ34MchBKt8FYD9i7OHJPUik9762wu+Wpi/tPmjw
         CmYh3lfumpOGrKYRbg8IMazVQR1AmPFjq2mNYh53iieruBm98UqVcPguDyVvxQOj2Aty
         jY8QaxBb98U5K+kdX6H7Aygo65CFWblkWw0ZH6JMH3e6VYB++Tw78FWJLYY7gUg3ReNd
         RCWg==
X-Gm-Message-State: AOAM531MWEpVyMMULC6XGgvJEDkviz31MXg5aX+fQIGNjawjU2zpW+pt
	OFrUcUoj+C7fbSNtEQLbsqY=
X-Google-Smtp-Source: ABdhPJwCpp1CTTpUQk7qWKnIh/yFBudGLOgzTmHXJL1o6YBu8x2FX5yDDzUTnumdUgFfk3BNuYTWSw==
X-Received: by 2002:a17:902:8d8a:b029:12d:3774:3630 with SMTP id v10-20020a1709028d8ab029012d37743630mr9735558plo.65.1630086421011;
        Fri, 27 Aug 2021 10:47:01 -0700 (PDT)
Subject: Re: [PATCH V4 05/13] hyperv: Add Write/Read MSR registers via ghcb
 page
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, brijesh.singh@amd.com,
 thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com, pgonda@google.com,
 martin.b.radev@gmail.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 rientjes@google.com, ardb@kernel.org, michael.h.kelley@microsoft.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20210827172114.414281-1-ltykernel@gmail.com>
 <20210827172114.414281-6-ltykernel@gmail.com> <YSkj2kvYoYW8kDiF@kroah.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <aed9409f-8708-2599-e441-c6a0c92b737b@gmail.com>
Date: Sat, 28 Aug 2021 01:46:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSkj2kvYoYW8kDiF@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/28/2021 1:41 AM, Greg KH wrote:
> On Fri, Aug 27, 2021 at 01:21:03PM -0400, Tianyu Lan wrote:
>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>
>> Hyperv provides GHCB protocol to write Synthetic Interrupt
>> Controller MSR registers in Isolation VM with AMD SEV SNP
>> and these registers are emulated by hypervisor directly.
>> Hyperv requires to write SINTx MSR registers twice. First
>> writes MSR via GHCB page to communicate with hypervisor
>> and then writes wrmsr instruction to talk with paravisor
>> which runs in VMPL0. Guest OS ID MSR also needs to be set
>> via GHCB page.
>>
>> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
>> ---
>> Change since v1:
>>           * Introduce sev_es_ghcb_hv_call_simple() and share code
>>             between SEV and Hyper-V code.
>> Change since v3:
>>           * Pass old_msg_type to hv_signal_eom() as parameter.
>> 	 * Use HV_REGISTER_* marcro instead of HV_X64_MSR_*
>> 	 * Add hv_isolation_type_snp() weak function.
>> 	 * Add maros to set syinc register in ARM code.
>> ---
>>   arch/arm64/include/asm/mshyperv.h |  23 ++++++
>>   arch/x86/hyperv/hv_init.c         |  36 ++--------
>>   arch/x86/hyperv/ivm.c             | 112 ++++++++++++++++++++++++++++++
>>   arch/x86/include/asm/mshyperv.h   |  80 ++++++++++++++++++++-
>>   arch/x86/include/asm/sev.h        |   3 +
>>   arch/x86/kernel/sev-shared.c      |  63 ++++++++++-------
>>   drivers/hv/hv.c                   | 112 ++++++++++++++++++++----------
>>   drivers/hv/hv_common.c            |   6 ++
>>   include/asm-generic/mshyperv.h    |   4 +-
>>   9 files changed, 345 insertions(+), 94 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
>> index 20070a847304..ced83297e009 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -41,6 +41,29 @@ static inline u64 hv_get_register(unsigned int reg)
>>   	return hv_get_vpreg(reg);
>>   }
>>   
>> +#define hv_get_simp(val)	{ val = hv_get_register(HV_REGISTER_SIMP); }
>> +#define hv_set_simp(val)	hv_set_register(HV_REGISTER_SIMP, val)
>> +
>> +#define hv_get_siefp(val)	{ val = hv_get_register(HV_REGISTER_SIEFP); }
>> +#define hv_set_siefp(val)	hv_set_register(HV_REGISTER_SIEFP, val)
>> +
>> +#define hv_get_synint_state(int_num, val) {			\
>> +	val = hv_get_register(HV_REGISTER_SINT0 + int_num);	\
>> +	}
>> +
>> +#define hv_set_synint_state(int_num, val)			\
>> +	hv_set_register(HV_REGISTER_SINT0 + int_num, val)
>> +
>> +#define hv_get_synic_state(val) {			\
>> +	val = hv_get_register(HV_REGISTER_SCONTROL);	\
>> +	}
>> +
>> +#define hv_set_synic_state(val)			\
>> +	hv_set_register(HV_REGISTER_SCONTROL, val)
>> +
>> +#define hv_signal_eom(old_msg_type)		 \
>> +	hv_set_register(HV_REGISTER_EOM, 0)
> 
> Please just use real inline functions and not #defines if you really
> need it.
> 

OK. Will update. Thanks.

