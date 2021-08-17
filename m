Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C567E3EEF3C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 17:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167971.306669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG18r-0001Dn-RW; Tue, 17 Aug 2021 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167971.306669; Tue, 17 Aug 2021 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG18r-0001AK-NT; Tue, 17 Aug 2021 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 167971;
 Tue, 17 Aug 2021 15:36:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qw5p=NI=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mG18p-0001AE-VH
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 15:36:40 +0000
Received: from mail-pj1-x1034.google.com (unknown [2607:f8b0:4864:20::1034])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76308dd9-c3fe-4f68-9769-0bef96ebe5f5;
 Tue, 17 Aug 2021 15:36:38 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so6966452pjb.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Aug 2021 08:36:38 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 q68sm3828407pgq.5.2021.08.17.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:36:37 -0700 (PDT)
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
X-Inumbo-ID: 76308dd9-c3fe-4f68-9769-0bef96ebe5f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jBb72hVOoT632QaKCIWdx6/CC01Jwh36ZqbBo7qR29w=;
        b=MZ87ScQaeTXUx2zc3QJX8paFfZdkSVdSMUYc0v0LY2+hc8AhlF3aqwldmB/BXXfh/z
         xVUkX3EuT93f+Ekid/9wOV8vd4VGMuUzHWRKeiBzsSym+hW8V3hELzVo+u+KhQB9PaFI
         yKaN6w7ws4iHi95okxDvcvyCJdiEqWiExOJPn7Rtxomj/p9ErurP79QsKnpF40UWedHY
         wXhiv+BXDH0p6Ybpa+matnVITHtpuG4LstcJLEA+MFTvG9pqsO1LvATqA0RHijA20GDK
         RCmlz/5mC+apSlI/jvD+4R9BoBCU6SvqrbqxGY696R6zje19Bg6nqx+tPpa86481eswl
         CE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jBb72hVOoT632QaKCIWdx6/CC01Jwh36ZqbBo7qR29w=;
        b=ngv2pMGj5pmQcHrvxNkYsAcM2CXNjbsN2QbOom1uNgTGFh/shZaZFx8+UXLSN7ADgq
         oFqvPVo0OkeZseHmbHC/6BXG0MITMD6jNa9bJY33N0Rn3kKs0Pjn2T/LIiFIpWXPZFoY
         /VNBPYeasIMeVQyfOriCQ10qRxeS9q81+ITL2tQZvAkra8NnRYV/qa1iME0zC+xA75a2
         nB/MjBIDEw7iIIG0FI/V57/CTzY2ydcdAxN21iwyphI6qOttFW6a4NXxPvUhsO1sKXca
         f31ZTXfbn3GFCfgK5od/qAp7DwHVomPECdf7lfzbOPJoi8ttGzRbHabLQYgkxYQaNPFc
         iG9w==
X-Gm-Message-State: AOAM531zbHepApqWmvS8bkiOZAyyFSfN6ruKNSV3lKj9FgdV1aEyKVRF
	WqdvLiTvNbqjm65H37fw4ms=
X-Google-Smtp-Source: ABdhPJyI43P3qYYJRg0q+cd32Cif7a9Xl5o4vVONB3bqiCMyd2bKoq7nZrIha1ZM+VxRpd1t2YLiqw==
X-Received: by 2002:a17:903:31c3:b029:ed:6f74:49c7 with SMTP id v3-20020a17090331c3b02900ed6f7449c7mr3321877ple.12.1629214598127;
        Tue, 17 Aug 2021 08:36:38 -0700 (PDT)
Subject: Re: [PATCH V3 08/13] HV/Vmbus: Initialize VMbus ring buffer for
 Isolation VM
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
 <20210809175620.720923-9-ltykernel@gmail.com>
 <MWHPR21MB1593FFD7F3402753751F433CD7FD9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <9de7c3ae-8f3f-3fc4-0491-b9df24f03cb6@gmail.com>
Date: Tue, 17 Aug 2021 23:36:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB1593FFD7F3402753751F433CD7FD9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/17/2021 1:28 AM, Michael Kelley wrote:
> This patch does the following:
> 
> 1) The existing ring buffer wrap-around mapping functionality is still
> executed in hv_ringbuffer_init() when not doing SNP isolation.
> This mapping is based on an array of struct page's that describe the
> contiguous physical memory.
> 
> 2) New ring buffer wrap-around mapping functionality is added in
> hv_ringbuffer_post_init() for the SNP isolation case.  The case is
> handled in hv_ringbuffer_post_init() because it must be done after
> the GPADL is established, since that's where the host visibility
> is set.  What's interesting is that this case is exactly the same
> as #1 above, except that the mapping is based on physical
> memory addresses instead of struct page's.  We have to use physical
> addresses because of applying the GPA boundary, and there are no
> struct page's for those physical addresses.
> 
> Unfortunately, this duplicates a lot of logic in #1 and #2, except
> for the struct page vs. physical address difference.
> 
> Proposal:  Couldn't we always do #2, even for the normal case
> where SNP isolation is not being used?   The difference would
> only be in whether the GPA boundary is added.  And it looks like
> the normal case could be done after the GPADL is established,
> as setting up the GPADL doesn't have any dependencies on
> having the ring buffer mapped.  This approach would remove
> a lot of duplication.  Just move the calls to hv_ringbuffer_init()
> to after the GPADL is established, and do all the work there for
> both cases.
> 

Hi Michael:
     Thanks for suggestion. I just keep the original logic in current
code. I will try combining these two functions and report back.

Thanks.

