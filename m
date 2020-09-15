Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C346026A190
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 11:06:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI6us-0001Ud-JZ; Tue, 15 Sep 2020 09:06:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B5vB=CY=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kI6ur-0001UY-F7
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 09:06:21 +0000
X-Inumbo-ID: 98aafd26-ceda-4e84-9fec-d31af4f72cd6
Received: from out30-42.freemail.mail.aliyun.com (unknown [115.124.30.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98aafd26-ceda-4e84-9fec-d31af4f72cd6;
 Tue, 15 Sep 2020 09:06:19 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R971e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0U90pcMF_1600160772; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U90pcMF_1600160772) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 15 Sep 2020 17:06:12 +0800
Date: Tue, 15 Sep 2020 17:06:12 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Dan Williams <dan.j.williams@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 1/7] kernel/resource: make
 release_mem_region_adjustable() never fail
Message-ID: <20200915090612.GA6936@L-31X9LVDL-1304.local>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-2-david@redhat.com>
 <20200915021012.GC2007@L-31X9LVDL-1304.local>
 <927904b1-1909-f11f-483e-8012bda8ad0c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <927904b1-1909-f11f-483e-8012bda8ad0c@redhat.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 15, 2020 at 09:35:30AM +0200, David Hildenbrand wrote:
>
>>> static int __ref try_remove_memory(int nid, u64 start, u64 size)
>>> {
>>> 	int rc = 0;
>>> @@ -1777,7 +1757,7 @@ static int __ref try_remove_memory(int nid, u64 start, u64 size)
>>> 		memblock_remove(start, size);
>>> 	}
>>>
>>> -	__release_memory_resource(start, size);
>>> +	release_mem_region_adjustable(&iomem_resource, start, size);
>>>
>> 
>> Seems the only user of release_mem_region_adjustable() is here, can we move
>> iomem_resource into the function body? Actually, we don't iterate the resource
>> tree from any level. We always start from the root.
>
>You mean, making iomem_resource implicit? I can spot that something
>similar was done for
>
>#define devm_release_mem_region(dev, start, n) \
>	__devm_release_region(dev, &iomem_resource, (start), (n))
>

What I prefer is remove iomem_resource from the parameter list. Just use is in
the function body.

For the example you listed, __release_region() would have varies of *parent*,
which looks reasonable to keep it here.

>I'll send an addon patch for that, ok? - thanks.
>
>-- 
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

