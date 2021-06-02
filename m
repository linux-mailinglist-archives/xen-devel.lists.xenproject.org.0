Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A36398DC9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136069.252470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSNY-00010z-4z; Wed, 02 Jun 2021 15:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136069.252470; Wed, 02 Jun 2021 15:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSNY-0000y5-1x; Wed, 02 Jun 2021 15:01:56 +0000
Received: by outflank-mailman (input) for mailman id 136069;
 Wed, 02 Jun 2021 15:01:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YErV=K4=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1loSNV-0000xu-PQ
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:01:53 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ddd2621-d8e2-4a24-a7e6-b5585cf0f7e6;
 Wed, 02 Jun 2021 15:01:53 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id t28so2382960pfg.10
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 08:01:53 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 y13sm97917pgp.16.2021.06.02.08.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 08:01:51 -0700 (PDT)
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
X-Inumbo-ID: 9ddd2621-d8e2-4a24-a7e6-b5585cf0f7e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+az3hl/4w22b3I/rRlTcQ1/sSF9KD2GATy/NbYn2SjU=;
        b=LFh9HsM5N4yAOGzJ85RpIVWyAjUPznHirCf8/j7G4yx59JLH20/Uh4u7wbdu1FOv1R
         BMS/VcyQyPaNyIBLyV79xaZ6CaUNzIjmBxRj8Fe+1khO8KcH3zpgVSaCPqyrS/mPSxUA
         SxH1O0RaYnJym4R1ouc54zGTJI9ko785LbI0cE/6JrbOl++1vJMUiWvQ+YxS/x02SX1A
         GtQ9eZiWdQ81n3fEqhZUgWSVZqHZymyGyts8taigNA7xByYUg2QhaEC1Sqw034dlDQ+n
         EaQjVI9wbITemQxMjxw+B5xkVM7JxSTIPhVvW43gJtVIEw3fB0lKjLuGjHRyUK5Iy7k4
         pXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+az3hl/4w22b3I/rRlTcQ1/sSF9KD2GATy/NbYn2SjU=;
        b=CANYxXmLwiZDJ3CvK+FL06c+P1fQ38CmAtBU++onn/lGdP2cgz95BeI+zyxXrQBOis
         3ZGnJz7Aby8HmoNDbhDP23znSabB2qh0p4RMGfDp6Z6h8iEtTkCyxDCpxo6EUaYBvfsk
         ZGhqv47doC3EeIdrvh4X1dunluazeZCexdaY8TbkKGb78KpjM2hDfp43f8wHZjmIDGxS
         8TzDeSCcv+uOxY6VRaDhC8yj8Lm8+ga39VlEwXntZ0+RmxXlM9Bne64OMDKzCTNuGipz
         aK0XJPpl3ZgCAXHo9KiUNIxjMnkzopgR0x653luPmXaFgk7GBrJNCH6eqsfoI9iXVP6e
         gM3Q==
X-Gm-Message-State: AOAM531hMKJuwTWw36qdvCmgqam5dKjbOHOqWzwDBRE8e4S0Hr8tz7Cn
	dXBiDrtzsJE5Vuo5r2unNUc=
X-Google-Smtp-Source: ABdhPJztpeXS5x/Q7Ocwttmq+13ab9HvNAwDx8hEcPtnl/lWI6mAldnzn4lX5IPnQcCsuOUMA5JO9w==
X-Received: by 2002:a62:4e96:0:b029:2ea:2244:5e31 with SMTP id c144-20020a624e960000b02902ea22445e31mr3354423pfb.43.1622646112263;
        Wed, 02 Jun 2021 08:01:52 -0700 (PDT)
Subject: Re: [RFC PATCH V3 09/11] HV/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-10-ltykernel@gmail.com>
 <9488c114-81ad-eb67-79c0-5ed319703d3e@oracle.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <a023ee3f-ce85-b54f-79c3-146926bf3279@gmail.com>
Date: Wed, 2 Jun 2021 23:01:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <9488c114-81ad-eb67-79c0-5ed319703d3e@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Boris:
	Thanks for your review.

On 6/2/2021 9:16 AM, Boris Ostrovsky wrote:
> 
> On 5/30/21 11:06 AM, Tianyu Lan wrote:
>> @@ -91,6 +92,6 @@ int pci_xen_swiotlb_init_late(void)
>>   EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
>>   
>>   IOMMU_INIT_FINISH(2,
>> -		  NULL,
>> +		  hyperv_swiotlb_detect,
>>   		  pci_xen_swiotlb_init,
>>   		  NULL);
> 
> 
> Could you explain this change?

Hyper-V allocates its own swiotlb bounce buffer and the default
swiotlb buffer should not be allocated. swiotlb_init() in 
pci_swiotlb_init() is to allocate default swiotlb buffer.
To achieve this, put hyperv_swiotlb_detect() as the first entry in the 
iommu_table_entry list. The detect loop in the pci_iommu_alloc() will 
exit once hyperv_swiotlb_detect() is called in Hyper-V VM and other 
iommu_table_entry callback will not be called.

