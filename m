Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC83DA3A7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jul 2021 15:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161940.297145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m95ft-00069k-U0; Thu, 29 Jul 2021 13:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161940.297145; Thu, 29 Jul 2021 13:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m95ft-00067W-Qc; Thu, 29 Jul 2021 13:02:09 +0000
Received: by outflank-mailman (input) for mailman id 161940;
 Thu, 29 Jul 2021 13:02:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Rz1=MV=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m95fr-00067Q-I6
 for xen-devel@lists.xenproject.org; Thu, 29 Jul 2021 13:02:07 +0000
Received: from mail-pl1-x636.google.com (unknown [2607:f8b0:4864:20::636])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d93fdb46-970c-4705-9eb2-5a2780b2ba2e;
 Thu, 29 Jul 2021 13:02:06 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t3so4779991plg.9
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jul 2021 06:02:06 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 w2sm9730504pjt.14.2021.07.29.06.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 06:02:05 -0700 (PDT)
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
X-Inumbo-ID: d93fdb46-970c-4705-9eb2-5a2780b2ba2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xWZDnZQ7Uje44tOvyd+WhPXcE6YbxVNUTkV2DmxlC/I=;
        b=ExonRuvAP6deeZWP4ARMhx8XszTEeQWKqexdxGr8TsuL+Bz8VPrFj6Y730SphdAQDC
         84Fqe2zxnVuAY/b+yUA8Eq195vN/ev0qbH1bKyG9MpEY83Z3AAYzJOmRRNOSb1q264YH
         H1r0MDXkAlN2lmoLmNB9pMzmaE8qMyQJV2yXvzwM4lU7+cUmxyAefZ33Vtx/QsvY0B2Y
         7299cOKI8WViF8nwItNn9KeFY/6ShDYN3GG/09Lm/PkrJetdxTquTYKbp14IyHKNKJri
         w4KULmdKqUg3LoIRw+FRYrv+H/B2Jf9av5u6lx3SllYemnIcK4W70fMX/uAcJnqsyzu9
         1r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xWZDnZQ7Uje44tOvyd+WhPXcE6YbxVNUTkV2DmxlC/I=;
        b=ALqhjWjX3lGFMFIOdxp2ZAjrKkLgTFiROQj0Qn8kYb0CrbuZxlV4/vrkGTOf0JF/U0
         AVNU2ANkQGg1PJF5J/kBe/KPzge4fIXwENDGxTFdOtOOBoiz/aXS10OCheiQY3/3t4az
         je9bspJe8uRptd2Yy+z2C7CweJ4jPIziUARArV8pQGrrkJLRAozRFVF/wvhbpD1FWRk7
         Ie/sI1b4EB6P2lBT7/+FuhS9mpAiXhAemrNOYJrcu2B25ipGM4DRbc4K7pdSz9KS7Lfu
         bqB25p2fPBcTKKr2OFEQkOc+n32m7XsbYd8y+TYaXCjHFXb0h2qlSHWeEPNA+YM3MhMB
         y8nA==
X-Gm-Message-State: AOAM530MNfI5M3MRFOmHRxMo03PBgU5waOfh6i1QLO/5L35RpJOw3YvY
	y5YtPAMEadJ7JkVSyT4xJkU=
X-Google-Smtp-Source: ABdhPJyrI/P/7aQeOr7fGMy78ZxY6RcR1Rwj4jALXoPGmX2VorLJRrRMQ6J111Dxy7HnP0DgW7LcpA==
X-Received: by 2002:a05:6a00:24c6:b029:332:6773:165c with SMTP id d6-20020a056a0024c6b02903326773165cmr4937276pfv.33.1627563725957;
        Thu, 29 Jul 2021 06:02:05 -0700 (PDT)
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
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <0d956a05-7d24-57a0-f4a9-dccc849b52fc@gmail.com>
Date: Thu, 29 Jul 2021 21:01:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a2444c36-0103-8e1c-7005-d97f77f90e85@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/29/2021 1:06 AM, Dave Hansen wrote:
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
> One more thing.  If you're going to be patching generic code, please
> start using feature checks that can get optimized away at runtime.
> hv_is_isolation_supported() doesn't look like the world's cheapest
> check.  It can't be inlined and costs at least a function call.

Yes, you are right. How about adding a static branch key for the check 
of isolation VM? This may reduce the check cost.



