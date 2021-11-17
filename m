Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A345471E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 14:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226854.392173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnKth-00084F-LW; Wed, 17 Nov 2021 13:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226854.392173; Wed, 17 Nov 2021 13:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnKth-00081D-Hc; Wed, 17 Nov 2021 13:22:45 +0000
Received: by outflank-mailman (input) for mailman id 226854;
 Wed, 17 Nov 2021 13:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66jA=QE=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mnKtf-000817-6l
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 13:22:43 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70b9fffc-47a9-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 14:22:41 +0100 (CET)
Received: by mail-pg1-x535.google.com with SMTP id 200so2266633pga.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Nov 2021 05:22:41 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 t40sm23310231pfg.107.2021.11.17.05.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 05:22:39 -0800 (PST)
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
X-Inumbo-ID: 70b9fffc-47a9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n7Jf+5/Jh7KOEFSs12H1gnleHX5Ul1EJihf5cWALbbw=;
        b=NMtrHwlhumZZGG7ACQ5UZwJN7rtTqhVOALh7ylXTR9G6Y8zmsKtbGjwSxvzwVD314V
         mFlCILMpoJPcOxUNV38QoEdCs8zz43HlJK1GNiNc4P2QVifmYL23tPn/GqSDrxCGPg16
         bvAIjKJA0lzwI5sAj/KKF7Bc8fhHe/9Wx28bmwIGJrkCjDmdcCDuD5dw7cCpuvtFoqub
         iSkzJKRMidoqCXXQSY0sUPKp3Cs63451CNuN8JlBUt7M7BBJqI/PFOoctzgC3YAkmPjZ
         yOWSQXVn3LZwrWkLZBlx3QxZWWBmdX22onr58Glga9JdD2AAQeBuO5o77eDt6FelUOw8
         iVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n7Jf+5/Jh7KOEFSs12H1gnleHX5Ul1EJihf5cWALbbw=;
        b=ZNKVPj6uUvZ4/CATOKU+JL1fLu7AlhulMRdjyDKnSO/LidPrAhJ+1MRSoPvOsVt5yi
         4h6F3pjG+M5DFOY19pG+pcA8lykZtu4iK7+2uT1X5N4y9DdNG2etyLvw6THyyqNV0eMu
         W1O8kCXYUGVbXWAhXhDrDsyDNGt+VJ80U7yqfGrayHeQa2btsCrNq3hd9IIKq50V+VRb
         P2STPBjPu5I1p1HqYWeCgw81JYJ+UxJvgf/DILahmVaM58BbjF6bxHkqKGrYlsLQuqlX
         oOv4b2POkNdiI4PDIrvl5cDyHqZ+z3X+84UZGY9WuQx5X4A4iMDbPin6N0okdRHCB6tB
         Hqmw==
X-Gm-Message-State: AOAM530sqTO1k9woZ99f1YrZRN3hOFO+WJyaO60n6K3uWhTrDGov8Fb+
	XsB9uMJ3g8ITsUz/9FYe02c=
X-Google-Smtp-Source: ABdhPJwYIet5fq/8KowjGXs7GPhnQ/zbG+7NtQHLznln3NXsAVsDB6ZMleQEQVqBwkPH6jdcXK5meg==
X-Received: by 2002:a05:6a00:2146:b0:44c:2922:8abf with SMTP id o6-20020a056a00214600b0044c29228abfmr48946221pfk.27.1637155360284;
        Wed, 17 Nov 2021 05:22:40 -0800 (PST)
Message-ID: <fb9809f5-a830-733e-745b-aa1b1d2671f5@gmail.com>
Date: Wed, 17 Nov 2021 21:22:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, x86@kernel.org, hpa@zytor.com,
 jgross@suse.com, sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, xen-devel@lists.xenproject.org,
 michael.h.kelley@microsoft.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
 konrad.wilk@oracle.com, parri.andrea@gmail.com, thomas.lendacky@amd.com,
 dave.hansen@intel.com
References: <20211116153923.196763-1-ltykernel@gmail.com>
 <20211116153923.196763-4-ltykernel@gmail.com> <YZQCp6WWKAdOCbh8@zn.tnic>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <YZQCp6WWKAdOCbh8@zn.tnic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/2021 3:12 AM, Borislav Petkov wrote:
> What you should do, instead, is add an isol. VM specific
> hv_cc_platform_has() just like amd_cc_platform_has() and handle
> the cc_attrs there for your platform, like return false for
> CC_ATTR_GUEST_MEM_ENCRYPT and then you won't need to add that hv_* thing
> everywhere.
> 
> And then fix it up in __set_memory_enc_dec() too.
>

Yes, agree. Will add hv cc_attrs and check via cc_platform_has().



