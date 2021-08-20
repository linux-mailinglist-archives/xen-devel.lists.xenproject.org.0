Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51903F2CE5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 15:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169536.309699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH4J4-0005A1-25; Fri, 20 Aug 2021 13:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169536.309699; Fri, 20 Aug 2021 13:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH4J3-00057O-U7; Fri, 20 Aug 2021 13:11:33 +0000
Received: by outflank-mailman (input) for mailman id 169536;
 Fri, 20 Aug 2021 13:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+YXI=NL=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mH4J2-00057I-Kr
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 13:11:32 +0000
Received: from mail-pf1-x42a.google.com (unknown [2607:f8b0:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7f30fdc-386a-43f1-a446-c89ba651feed;
 Fri, 20 Aug 2021 13:11:31 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id w68so8553471pfd.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Aug 2021 06:11:31 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 z2sm8304603pgb.33.2021.08.20.06.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 06:11:30 -0700 (PDT)
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
X-Inumbo-ID: d7f30fdc-386a-43f1-a446-c89ba651feed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DumM/jSCQ5pQ9eZgFpU+0KewnSiWRI7kODNq3MVNO9E=;
        b=Lxpe8djYypSrG+rDhdI8Zj8XoAi8qqQia8zhwT4UV3xhiowgSs10jy3AgDNzKEDEyF
         2GuLbi9GVVFcjh9UlMDL9KUW8QrzZktPvIUcY7JQUGRvDt+fa7vHuxhyvZAdvey3t4ob
         hD12I6HXHDrZkRjMhWqSXBvFA8t0l/nORUqxhobI5jL9kGkFeKuaLFh4hExMg94Nn/+Y
         ZX0iJa6zVUQl4P3W+vN6fOmLG2tonMXiCheuMNI43YhxqI96dxD+FKqPHJQaTLtG54GP
         oe6y5RcUvG1ZNewnn9OX4H8s3Nmh0Ni6Kg3bG+ljwBTTlaL4sNTRBPgI879siMp4TQte
         F+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DumM/jSCQ5pQ9eZgFpU+0KewnSiWRI7kODNq3MVNO9E=;
        b=MjOa239vAYQYv4Ofu+GzIJSuQQLeCEX/MgRZ1/bF6tEw/+2ZIfJQnVsmiWaM8Wkadg
         wd37djqwlFqo5D4U7sxAWYfYdO3N/XPwZ7KsQG+DdKNiAI1GzHMnA0K08Jub+c24IhfD
         ftCY+fxcGnpOIrOv3euaMKBNW+G99v+dCAG/dNeWU7IYOtubzFEjiVVYujgLz++wrX+x
         nwnn/q0+211b0+Bu3ixc1pK0sP92EDK4Bj5fxR2W2zUYtcY1FEazhQLo/iL1j7C5H/d6
         kF1xaRf/cpd6y6VwM7c01gVvrUudmltdm9oBZs4EkUfJhVQUW3kmsLfdR2Q1PuzyJt1e
         VG3A==
X-Gm-Message-State: AOAM533yjtwpz38pDkBG6wum/8p7rkboaC97+gKRNS7MTPwS/9ESGWTU
	HSvTtEQJErZc40Wi5kebROc=
X-Google-Smtp-Source: ABdhPJxylFQdwesAZv+5jXWctSOyZLpktCQebAX+HYEeyV7Dv3stIO/u8x8uQwcYBOXvuYmq81vLhg==
X-Received: by 2002:aa7:95a6:0:b0:3e0:efe2:83ee with SMTP id a6-20020aa795a6000000b003e0efe283eemr19334679pfk.36.1629465090875;
        Fri, 20 Aug 2021 06:11:30 -0700 (PDT)
Subject: Re: [PATCH V3 12/13] HV/Netvsc: Add Isolation VM support for netvsc
 driver
To: "hch@lst.de" <hch@lst.de>, Michael Kelley <mikelley@microsoft.com>
Cc: KY Srinivasan <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
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
 "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "tj@kernel.org" <tj@kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-13-ltykernel@gmail.com>
 <MWHPR21MB15936FE72E65A62FBA3EF4F2D7C09@MWHPR21MB1593.namprd21.prod.outlook.com>
 <20210820042151.GB26450@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <9e4d5de1-37b3-550d-9bca-4eb158e45b33@gmail.com>
Date: Fri, 20 Aug 2021 21:11:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210820042151.GB26450@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/20/2021 12:21 PM, hch@lst.de wrote:
> On Thu, Aug 19, 2021 at 06:14:51PM +0000, Michael Kelley wrote:
>>> +	if (!pfns)
>>> +		return NULL;
>>> +
>>> +	for (i = 0; i < size / HV_HYP_PAGE_SIZE; i++)
>>> +		pfns[i] = virt_to_hvpfn(buf + i * HV_HYP_PAGE_SIZE)
>>> +			+ (ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
>>> +
>>> +	vaddr = vmap_pfn(pfns, size / HV_HYP_PAGE_SIZE, PAGE_KERNEL_IO);
>>> +	kfree(pfns);
>>> +
>>> +	return vaddr;
>>> +}
>>
>> This function appears to be a duplicate of hv_map_memory() in Patch 11 of this
>> series.  Is it possible to structure things so there is only one implementation?  In
> 
> So right now it it identical, but there is an important difference:
> the swiotlb memory is physically contiguous to start with, so we can
> do the simple remap using vmap_range as suggested in the last mail.
> The cases here are pretty weird in that netvsc_remap_buf is called right
> after vzalloc.  That is we create _two_ mappings in vmalloc space right
> after another, where the original one is just used for establishing the
> "GPADL handle" and freeing the memory.  In other words, the obvious thing
> to do here would be to use a vmalloc variant that allows to take the
> shared_gpa_boundary into account when setting up the PTEs.

The buffer is allocated via vmalloc(). It needs to be marked as host
visible via hyperv hvcall before being accessed via address space above
shared_gpa_boundary. The hvcall is called in the vmbus_establish_gpadl().

> 
> And here is somthing I need help from the x86 experts:  does the CPU
> actually care about this shared_gpa_boundary?  Or does it just matter
> for the generated DMA address?  Does somehow have a good pointer to
> how this mechanism works?
> 

The shared_gpa_boundary is vTOM feature of AMD SEV-SNP. Tom Lendacky
introduced the feature in previous mail. I copy it here and please have
a look.

 From Tom Lendacky:
IIUC, this is using the vTOM feature of SEV-SNP. When this feature is
enabled for a VMPL level, any physical memory addresses below vTOM are
considered private/encrypted and any physical memory addresses above vTOM
are considered shared/unencrypted. With this option, you don't need a
fully enlightened guest that sets and clears page table encryption bits.
You just need the DMA buffers to be allocated in the proper range above 
vTOM.

See the section on "Virtual Machine Privilege Levels" in
https://www.amd.com/system/files/TechDocs/SEV-SNP-strengthening-vm-isolation-with-integrity-protection-and-more.pdf.

