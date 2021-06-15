Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2983A83E7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 17:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142239.262517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltAwC-0001y8-Mb; Tue, 15 Jun 2021 15:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142239.262517; Tue, 15 Jun 2021 15:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltAwC-0001up-Ig; Tue, 15 Jun 2021 15:25:12 +0000
Received: by outflank-mailman (input) for mailman id 142239;
 Tue, 15 Jun 2021 15:25:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZqV=LJ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1ltAwA-0001uj-RQ
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 15:25:10 +0000
Received: from mail-pg1-x529.google.com (unknown [2607:f8b0:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 119af839-ed87-4940-a875-137ffc7c5022;
 Tue, 15 Jun 2021 15:25:10 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id t17so11754615pga.5
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 08:25:10 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 u2sm15258266pfg.67.2021.06.15.08.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 08:25:09 -0700 (PDT)
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
X-Inumbo-ID: 119af839-ed87-4940-a875-137ffc7c5022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=phyWWBHzkBpxWNeuQJLinu+go2K8vm0IQjBk4bPOC5o=;
        b=lLzyvAx1eLMBBQ9Nv6UWlyfS7bq09JfNMuTSA72Pidzs3ADzEJh5UZNx1+KXAA3QS7
         9qLwmHEZw5Xk+RHIQHD4WFV677p8Yi8BHKdEaKAbO078PZhHBwsAaiGPsQh7STbxJ28j
         3L9M/FShV9IoCoZ9A/Eh9ROBNoQr5F07JQAgtoeaUjtdIexg1Nk9GrQcrUXxHc9NNgOV
         D2nJiITYw2LCAuwzkpdFMOLcTULHsDylV5FWGHXPlqFv03pjAoTRz+TNqy9uLL90+fK0
         edPtBl2ZDPRtYC3zVnWadcZFdsLes9V2OCmaC/x9ZwogRVqJGjkXmr9UDyWpPbPkMxE8
         xgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=phyWWBHzkBpxWNeuQJLinu+go2K8vm0IQjBk4bPOC5o=;
        b=CP4LdSGnaIf6CQrzx+2wdovcGF7tGJOiLnXTP6gNV5MtM/G9iiD371hqWWD4AQw77e
         6mH8D4deGKSwXhRfcNT5uj52me1huhZ4kh2ES60zDPBVMHfOJOH9wdXHhyZrd8K4zQgZ
         pXlmvxM1jKDd8O0kR9ZX9DxzVwLCeSacDPYP0n/gGQhYOfxk61qSi1Q84G46gcojzqve
         FU3dAnOrlXKCLuzm6sylkHeKvLPYJgL+YxL2Hh+Cwt/JM8W9mHi8pEcymzbhKOy+C3ai
         plFwxf0dWmN7WSqIYGE/pTkKxx7m90OBY2UrDSKWLS1IrtAKumggOeRNrtYIs6GYc+Bw
         K3pg==
X-Gm-Message-State: AOAM532Z8TqrVXXr/XIHHuST2BnvMi7JgKo9dPA6ORgHvJg0GE3jOgDp
	bkzvPA7EcrWP9q38jEMdF6o=
X-Google-Smtp-Source: ABdhPJwV2uWurEEhhhqeCwFEjPg+6PpMse5GS6lAolB+VF7P2QpHJP+RpOWgZ5BBFF0RzwB+7lXyqg==
X-Received: by 2002:a65:6481:: with SMTP id e1mr85503pgv.140.1623770709416;
        Tue, 15 Jun 2021 08:25:09 -0700 (PDT)
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
To: Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, m.szyprowski@samsung.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 joro@8bytes.org, will@kernel.org, xen-devel@lists.xenproject.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-9-ltykernel@gmail.com>
 <20210607064312.GB24478@lst.de>
 <94038087-a33c-93c5-27bf-7ec1f6f5f0e3@arm.com> <20210614153252.GA1741@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <9e347c4c-d4b9-129c-10d2-0d7ff1b917cc@gmail.com>
Date: Tue, 15 Jun 2021 23:24:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614153252.GA1741@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/14/2021 11:32 PM, Christoph Hellwig wrote:
> On Mon, Jun 14, 2021 at 02:49:51PM +0100, Robin Murphy wrote:
>> FWIW, I think a better generalisation for this would be allowing
>> set_memory_decrypted() to return an address rather than implicitly
>> operating in-place, and hide all the various hypervisor hooks behind that.
> 
> Yes, something like that would be a good idea.  As-is
> set_memory_decrypted is a pretty horribly API anyway due to passing
> the address as void, and taking a size parameter while it works in units
> of pages.  So I'd very much welcome a major overhaul of this API.
> 

Hi Christoph and Robin:
	Thanks for your suggestion. I will try this idea in the next version. 
Besides make the address translation into set_memory_
decrypted() and return address, do you want to make other changes to the 
API in order to make it more reasonable(e.g size parameter)?

Thanks

