Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE6C3F32B8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 20:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169645.309915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH8sY-0003CV-2P; Fri, 20 Aug 2021 18:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169645.309915; Fri, 20 Aug 2021 18:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH8sX-0003Ad-V3; Fri, 20 Aug 2021 18:04:29 +0000
Received: by outflank-mailman (input) for mailman id 169645;
 Fri, 20 Aug 2021 18:04:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YXI=NL=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mH8sX-0003AX-94
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 18:04:29 +0000
Received: from mail-pj1-x102e.google.com (unknown [2607:f8b0:4864:20::102e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a4e79f4-dd12-4720-a13c-ac67c7d54153;
 Fri, 20 Aug 2021 18:04:28 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so9729127pje.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Aug 2021 11:04:27 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 w14sm7846700pfn.91.2021.08.20.11.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 11:04:26 -0700 (PDT)
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
X-Inumbo-ID: 3a4e79f4-dd12-4720-a13c-ac67c7d54153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QqX9IQo8g7WhG7Y3/RlQFVFx2KCstQLv7H4OsFNThv0=;
        b=QGQqGFLjVXsqVhcZsfR9+tjVsH1D3pSrX1tMNmqU0GIyCghQ/ePeqEBsaqliat+lBk
         sWM1blpaQD4n8UpkoQGp3GvRWRD5hog7rntjqP/tLitl0UO8N+cmjlpSE6BuDGlg1mOb
         ftTvn2OIVzMZD9A7EbVTeoquvRVhZ0TurG6rgOA49IykfcmSDWD+7KL1XF1ICKaePoh7
         eovukTIu5///DrcvTy6y4fU2ec67g3e7kh09QvOizKu6BPyJpz+gWDr2a4pZbE6eJ3jC
         tPpnVVUWuDkSNMXnx1AP93T+ZlOwsUj1K/EjlhTs/8P1XObwmDCUhDI36MeSDeyv+Lyx
         4pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QqX9IQo8g7WhG7Y3/RlQFVFx2KCstQLv7H4OsFNThv0=;
        b=j59NmFtLJz5sN+1ZuCwZcJlkhqNC3VChVGHVOVWf4G1VSxfhCTDVp2kC7SV5KB2wdd
         ylp/rOdv1jh04Ve+47M4T/bAAjW/Su75sIT7OBW1Q5YhfT2GHlzvWKaRyczNGI4rM5Rk
         0Ui2lUoLdmsqVY4//fuLVL3FVwB+icqrQc79Ap5gSBOS9cnejz6JFONygVtFv7phIYJ8
         euu5+VFXBHF0T10Z/k6XoQcws/foAX7n6hI8YY14cVLq3M0x1g77LOc+1qQnb2tbOWuk
         d3fI0odXRI2IqzOngbqANCMEQXNPis4VGuPcJTtfoj/d7WZ367SiaE/LaMEdr3mkiy4y
         fXNA==
X-Gm-Message-State: AOAM5310Lf34tSaGKmgLEqABP9NcruhqNVyHuk20R93sOYVC50cPB8Mf
	2qBt8K6JpaaL3sIW93djeIU=
X-Google-Smtp-Source: ABdhPJyVf/JDbkxrxYIOEx8LcPerWBJMz+suKjnjDiwPFUPj971OZDtTnjV4pO5ZrAubU2bKD5IcXw==
X-Received: by 2002:a17:902:be0d:b0:12d:cb3c:3e7f with SMTP id r13-20020a170902be0d00b0012dcb3c3e7fmr17262258pls.0.1629482667216;
        Fri, 20 Aug 2021 11:04:27 -0700 (PDT)
Subject: Re: [PATCH V3 13/13] HV/Storvsc: Add Isolation VM support for storvsc
 driver
To: Michael Kelley <mikelley@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "ardb@kernel.org" <ardb@kernel.org>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "pgonda@google.com" <pgonda@google.com>,
 "martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "rientjes@google.com" <rientjes@google.com>,
 "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "tj@kernel.org" <tj@kernel.org>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-14-ltykernel@gmail.com>
 <MWHPR21MB1593EEF30FFD5C60ED744985D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
 <a96626db-4ac9-3ce4-64e9-92568e4f827a@gmail.com>
 <CY4PR21MB158664748760672446BFA075D7C19@CY4PR21MB1586.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <939aa552-5c24-65ee-518d-1cf72867c15d@gmail.com>
Date: Sat, 21 Aug 2021 02:04:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CY4PR21MB158664748760672446BFA075D7C19@CY4PR21MB1586.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/21/2021 12:08 AM, Michael Kelley wrote:
>>>>    	}
>>> The whole approach here is to do dma remapping on each individual page
>>> of the I/O buffer.  But wouldn't it be possible to use dma_map_sg() to map
>>> each scatterlist entry as a unit?  Each scatterlist entry describes a range of
>>> physically contiguous memory.  After dma_map_sg(), the resulting dma
>>> address must also refer to a physically contiguous range in the swiotlb
>>> bounce buffer memory.   So at the top of the "for" loop over the scatterlist
>>> entries, do dma_map_sg() if we're in an isolated VM.  Then compute the
>>> hvpfn value based on the dma address instead of sg_page().  But everything
>>> else is the same, and the inner loop for populating the pfn_arry is unmodified.
>>> Furthermore, the dma_range array that you've added is not needed, since
>>> scatterlist entries already have a dma_address field for saving the mapped
>>> address, and dma_unmap_sg() uses that field.
>> I don't use dma_map_sg() here in order to avoid introducing one more
>> loop(e,g dma_map_sg()). We already have a loop to populate
>> cmd_request->dma_range[] and so do the dma map in the same loop.
>>
> I'm not seeing where the additional loop comes from.  Storvsc
> already has a loop through the sgl entries.  Retain that loop and call
> dma_map_sg() with nents set to 1.  Then the sequence is
> dma_map_sg() --> dma_map_sg_attrs() --> dma_direct_map_sg() ->
> dma_direct_map_page().  The latter function will call swiotlb_map()
> to map all pages of the sgl entry as a single operation.

After dma_map_sg(), we still need to go through scatter list again to 
populate payload->rrange.pfn_array. We may just go through the scatter 
list just once if dma_map_sg() accepts a callback and run it during go
through scatter list.

