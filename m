Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EEF3A68AC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 16:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141574.261459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnCR-0000vU-W1; Mon, 14 Jun 2021 14:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141574.261459; Mon, 14 Jun 2021 14:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnCR-0000t4-SN; Mon, 14 Jun 2021 14:04:23 +0000
Received: by outflank-mailman (input) for mailman id 141574;
 Mon, 14 Jun 2021 14:04:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ibu=LI=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lsnCQ-0000ss-1r
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 14:04:22 +0000
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d913d133-46db-408e-8b9e-fb6ad569810a;
 Mon, 14 Jun 2021 14:04:21 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id q25so10629058pfh.7
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 07:04:21 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 x206sm12950089pfc.211.2021.06.14.07.04.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 07:04:20 -0700 (PDT)
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
X-Inumbo-ID: d913d133-46db-408e-8b9e-fb6ad569810a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yJB+B/uqyT8Yj8oTe4yW/iwZF1PlGwEGbYmCRyf4VPs=;
        b=WH301YVkd+NT/H+jeV6pcNYHdcjqtaqvIdtbpu0fkkYAmJ7rw0/VnTDAhSvIgbv4c0
         oazbEKmF+c7M1WRPaxGMZU5xoCLTUJgtdxU9APUEzGlzXnchk40ZNp3QFWLwuNrBu83j
         e2ylhCoSYk62pl120eNuhLwuvfMbaggtn+gXAD60VuMlb9RO9aR6yjsww4EENQAJey5G
         2ZzxWZw9pL2yOQEQRAidkW9g0ErNbkj+wegNJA0H7wJ55BH2rzTM1HnAVz1Nh8SFyWFK
         I7BbhU7Q2hwWxihuFlWkGm+R8myZotEgjwBltHJuCwGgHkDJ5/gTI6uquz0y/0l8g0ap
         0ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yJB+B/uqyT8Yj8oTe4yW/iwZF1PlGwEGbYmCRyf4VPs=;
        b=TTqail81I9sqIeQFdHO8F55N0tMnyiBZVJ9AvC9lVm5XVgV6bzcWp5CEKMLk2K9Y5s
         +vi8CsL+0o98U+MiVjv04AcDJG4YWOEIXlbZ68ktGDtaeQK+UlAaUJsITadVMA3z9lTx
         qmNRYIzqa3inHpFk24lfIvWCFEJ4Li7iuYT8XwLjh3MPuLWwuNPoCEdROsiseovOX38L
         N9HRxvr1zFeBkn0+StHtrG0XmbCdYr+SOYmWby5udunYpECOpkUeMB2HmGcTWSLYhmXM
         c0FAhP4+xpx61mS6imHYTjjJrtKKSSuKnkK6ML28+YPSlNeqtFzfAQ0xi0ab8HHIf8w7
         HUEQ==
X-Gm-Message-State: AOAM530+Hxb3+YnxlltIwIg+iTWG/ed6NRJgreNVy3FHSCmCS7KaQzXY
	SjdEilGd2BvP5itdIvGFSl4=
X-Google-Smtp-Source: ABdhPJyxkq2bPSQ3rYusHXFwzEn3le7fAXsaXh5Rh36tAMz0+W6V1tW5a8HSqlbDYgsTNNATX2tI2A==
X-Received: by 2002:a63:5760:: with SMTP id h32mr17200205pgm.367.1623679460361;
        Mon, 14 Jun 2021 07:04:20 -0700 (PDT)
Subject: Re: [RFC PATCH V3 10/11] HV/Netvsc: Add Isolation VM support for
 netvsc driver
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-11-ltykernel@gmail.com>
 <20210607065007.GE24478@lst.de>
 <279cb4bf-c5b6-6db9-0f1e-9238e902c8f2@gmail.com>
 <20210614070903.GA29976@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <e10c2696-23c3-befe-4f4d-25e18918132f@gmail.com>
Date: Mon, 14 Jun 2021 22:04:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614070903.GA29976@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 6/14/2021 3:09 PM, Christoph Hellwig wrote:
> On Mon, Jun 07, 2021 at 11:21:20PM +0800, Tianyu Lan wrote:
>>> dma_map_single can only be used on page baked memory, and if this is
>>> using page backed memory you wouldn't need to do thee phys_to_virt
>>> tricks.  Can someone explain the mess here in more detail?
>>
>> Sorry. Could you elaborate the issue? These pages in the pb array are not
>> allocated by DMA API and using dma_map_single() here is to map these pages'
>> address to bounce buffer physical address.
> 
> dma_map_single just calls dma_map_page using virt_to_page.  So this
> can't work on addresses not in the kernel linear mapping.
> 

The pages in the hv_page_buffer array here are in the kernel linear 
mapping. The packet sent to host will contain an array which contains 
transaction data. In the isolation VM, data in the these pages needs to 
be copied to bounce buffer and so call dma_map_single() here to map 
these data pages with bounce buffer. The vmbus has ring buffer where the 
send/receive packets are copied to/from. The ring buffer has been 
remapped to the extra space above shared gpa boundary/vTom during 
probing Netvsc driver and so not call dma map function for vmbus ring
buffer.





