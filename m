Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E633F2FA1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 17:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169592.309811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH6b1-0007be-10; Fri, 20 Aug 2021 15:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169592.309811; Fri, 20 Aug 2021 15:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH6b0-0007YR-UF; Fri, 20 Aug 2021 15:38:14 +0000
Received: by outflank-mailman (input) for mailman id 169592;
 Fri, 20 Aug 2021 15:38:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YXI=NL=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mH6az-0007YL-B0
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 15:38:13 +0000
Received: from mail-pg1-x530.google.com (unknown [2607:f8b0:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d4cbf0f-1eca-4e1a-ac62-23f282f47db4;
 Fri, 20 Aug 2021 15:38:12 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id q2so9525476pgt.6
 for <xen-devel@lists.xenproject.org>; Fri, 20 Aug 2021 08:38:12 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 i26sm7738720pfu.6.2021.08.20.08.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 08:38:11 -0700 (PDT)
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
X-Inumbo-ID: 9d4cbf0f-1eca-4e1a-ac62-23f282f47db4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dVOZ4z0XPa7OayGE8ECMnwdJyIdPwvP3nXcnH8MPASM=;
        b=A/zNrhCd3U9O9ero/5NghZBre9EOOjJ3OGobszwgvGoiOz7/5WsjufLewqFNiAvU0v
         UdflMS96g40+NfLrBAqJeCjCdymuciBQ80Yx/AQ8ITRU/L7SATQ2tHnIIaF5k29JMsjP
         WAvdDEXHkH/FVzOYK69bzTjmosbJipBqxfsdB/cAPu2yYaYLLNyru8HIfNH/zhlEl+mU
         b5+PJ4XRQM2BJW9oXzisu/vOdi7dHLX+vQAJHyTA5vk0DQ7OMESbpxAVqABg7O8/+78J
         3nht4WbwZ0TDJVCxNgnUkxAG6lFfKLPK4ZeS+qG0noIJNBwIfI2dl2YXRq8khGR4QbyN
         AtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dVOZ4z0XPa7OayGE8ECMnwdJyIdPwvP3nXcnH8MPASM=;
        b=a0yEnGvpCu1W/1jdp9Jn8OOnusUQHYFJ71BbzUT3NHyuA5n7nZoGvUnc+5HBONeSRJ
         VrQD/r0QhlwWE0MKZbolwvoiw/R67kLNzNrGNxYh1pEOwg4zlkrdAQ2Y+sGuliqlizZk
         q875QS1RurC6BcI0j+thTlQ0KxLs/qVW6jNJN0FU3fIbQtHM/7AZTlp6I+/IvDMZogjF
         pn1Uf3ct3Ov1yY2Amzfic88GZ3zzlvZPaJv6rBFSUjS/zXVYfb28lZSJ4EUrmMXmoowH
         W75yCuRCM5xm/KIwENBa/+UjJxAOoEKqq/y9wfOBn0iS5UjKNq/pAlFJ3xCsXYTOeyiM
         i7iw==
X-Gm-Message-State: AOAM532qmDHy8+nzv4+r1rPMqWHGc076kcKObORULW2BJ8d5mT7Fs610
	TJdLoxM6x5+G8DuHdOKCrkQ=
X-Google-Smtp-Source: ABdhPJyVl6KA/n8a2L0ZyHmpD0HkIjOfmbblHOo22Ydnq/pt3+qZWO40wgWo8CzM7IJsFIvGGIvzGQ==
X-Received: by 2002:a63:1962:: with SMTP id 34mr19583687pgz.14.1629473891609;
        Fri, 20 Aug 2021 08:38:11 -0700 (PDT)
Subject: Re: [PATCH V3 13/13] HV/Storvsc: Add Isolation VM support for storvsc
 driver
From: Tianyu Lan <ltykernel@gmail.com>
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
Message-ID: <9ae704a9-838c-0a54-9c16-f0f10eaaaefe@gmail.com>
Date: Fri, 20 Aug 2021 23:37:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a96626db-4ac9-3ce4-64e9-92568e4f827a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/20/2021 11:20 PM, Tianyu Lan wrote:
>> The whole approach here is to do dma remapping on each individual page
>> of the I/O buffer.  But wouldn't it be possible to use dma_map_sg() to 
>> map
>> each scatterlist entry as a unit?  Each scatterlist entry describes a 
>> range of
>> physically contiguous memory.  After dma_map_sg(), the resulting dma
>> address must also refer to a physically contiguous range in the swiotlb
>> bounce buffer memory.   So at the top of the "for" loop over the 
>> scatterlist
>> entries, do dma_map_sg() if we're in an isolated VM.  Then compute the
>> hvpfn value based on the dma address instead of sg_page().  But 
>> everything
>> else is the same, and the inner loop for populating the pfn_arry is 
>> unmodified.
>> Furthermore, the dma_range array that you've added is not needed, since
>> scatterlist entries already have a dma_address field for saving the 
>> mapped
>> address, and dma_unmap_sg() uses that field.
> 
> I don't use dma_map_sg() here in order to avoid introducing one more 
> loop(e,g dma_map_sg()). We already have a loop to populate 
> cmd_request->dma_range[] and so do the dma map in the same loop.

Sorry for a typo. s/cmd_request->dma_range[]/payload->range.pfn_array[]/

