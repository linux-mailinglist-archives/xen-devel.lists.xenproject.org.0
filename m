Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307863A2DEA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 16:19:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139938.258651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLWR-0006O4-7c; Thu, 10 Jun 2021 14:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139938.258651; Thu, 10 Jun 2021 14:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLWR-0006LT-4K; Thu, 10 Jun 2021 14:19:03 +0000
Received: by outflank-mailman (input) for mailman id 139938;
 Thu, 10 Jun 2021 14:19:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwq8=LE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lrLWP-0006LD-Rj
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 14:19:01 +0000
Received: from mail-pg1-x536.google.com (unknown [2607:f8b0:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c33fb1a-a327-4caf-9934-b2c4a5bf7c47;
 Thu, 10 Jun 2021 14:19:01 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id z1so500953pgj.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jun 2021 07:19:01 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 s22sm2725797pfd.94.2021.06.10.07.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:18:59 -0700 (PDT)
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
X-Inumbo-ID: 7c33fb1a-a327-4caf-9934-b2c4a5bf7c47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S7U7wM1689XPFk0ln7YagGhi2kwC7oBCIYjLHGTATmA=;
        b=j1ssCm/VIao3T0Xc2kwXH6tQqWfrySQ1IoYffbIUZhSffD09z3SFuktT6padpAZaa/
         O6dOSr9MfmJ3BaiaCjc0PA9hj1D56rpnhXvTnUEKbRnxOiqwlkMuTGEQqMho8+laNO3A
         Ps4g2Ewhuj5lqgG3+vb3Pr6h4xORMt0ouVqwcSeoFvA+lTlqRvdEpC++3hJnHyetmZQS
         Y1STui7T1ekgTq6zzEkx3p9dSbyB7UT0DfPgF2o16fgVpJiH+bKr87Q/n9chxbr1Li1Z
         sUz1mgnrmF2Vvd/rNoSeF09YxbBnVBhhC9qN6Rqm62kNLgrUCEgGYVPXMjW1fXotfIvd
         p8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S7U7wM1689XPFk0ln7YagGhi2kwC7oBCIYjLHGTATmA=;
        b=jDvl5refJGckccdKBFeY+r2ikeF442cIUkMqZrJIL8yIRyBuokKB+w5G1ziKHnu8CB
         03+vgpscPz12ZXeA+e/FhdroUkr7aOdGCPN1sKn//OmfUvYnIlbjiyGhMzeFel6OmGTO
         d51lK4i+RpUGhY4O3ouAiDGWuA7ane1TvucUt5W/eDiG2HQknX1/brbGFb0i3eeSfNGe
         wvWp3/EuQhm/mos9jOIkXkymTVj3j5hud3UCFVHRo7FtlxXPKWQoZ98OLOupaPXZubF+
         IPsv/dZ2BqN7xpzywdV3R7snCb7NzjjLfyT8gByiHI1kY+HxUgcbR58FukuBIPjYueNJ
         QLYQ==
X-Gm-Message-State: AOAM5310w1x5B4OqX2JMCa+vDl2xOmKCvPXMQZHVITONtBwZZHbVJ/46
	tTTgxkxQp2UM5PqlQwTJta4=
X-Google-Smtp-Source: ABdhPJykpYU7kOZkoptn+vRUH+LpqhlVAnDQIkp8KIQpRwT8RFYkpZNT1LtsR90ESObN7s+cfunBTA==
X-Received: by 2002:a63:7404:: with SMTP id p4mr5123864pgc.405.1623334740224;
        Thu, 10 Jun 2021 07:19:00 -0700 (PDT)
Subject: Re: [RFC PATCH V3 03/11] x86/Hyper-V: Add new hvcall guest address
 host visibility support
To: Vitaly Kuznetsov <vkuznets@redhat.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-4-ltykernel@gmail.com>
 <878s3iyrtg.fsf@vitty.brq.redhat.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <2a0170a9-e4d5-1c63-7901-416094f6ab64@gmail.com>
Date: Thu, 10 Jun 2021 22:18:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <878s3iyrtg.fsf@vitty.brq.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Vitaly:
	Thanks for your review.

On 6/10/2021 5:47 PM, Vitaly Kuznetsov wrote:
>> diff --git a/arch/x86/include/asm/hyperv-tlfs.h b/arch/x86/include/asm/hyperv-tlfs.h
>> index 606f5cc579b2..632281b91b44 100644
>> --- a/arch/x86/include/asm/hyperv-tlfs.h
>> +++ b/arch/x86/include/asm/hyperv-tlfs.h
>> @@ -262,6 +262,17 @@ enum hv_isolation_type {
>>   #define HV_X64_MSR_TIME_REF_COUNT	HV_REGISTER_TIME_REF_COUNT
>>   #define HV_X64_MSR_REFERENCE_TSC	HV_REGISTER_REFERENCE_TSC
>>   
>> +/* Hyper-V GPA map flags */
>> +#define HV_MAP_GPA_PERMISSIONS_NONE            0x0
>> +#define HV_MAP_GPA_READABLE                    0x1
>> +#define HV_MAP_GPA_WRITABLE                    0x2
>> +
>> +enum vmbus_page_visibility {
>> +	VMBUS_PAGE_NOT_VISIBLE = 0,
>> +	VMBUS_PAGE_VISIBLE_READ_ONLY = 1,
>> +	VMBUS_PAGE_VISIBLE_READ_WRITE = 3
>> +};
>> +
> Why do we need both flags and the enum? I don't see HV_MAP_GPA_* being
> used anywhere and VMBUS_PAGE_VISIBLE_READ_WRITE looks like
> HV_MAP_GPA_READABLE | HV_MAP_GPA_WRITABLE.
> 
> As this is used to communicate with the host, I'd suggest to avoid using
> enum and just use flags everywhere.
> 

Nice catch. Will update in the next version.

Thanks.

