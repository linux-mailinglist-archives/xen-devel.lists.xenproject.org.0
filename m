Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A527C26C2DB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 14:41:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIWk5-0000fq-Rf; Wed, 16 Sep 2020 12:40:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vwKx=CZ=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kIWk4-0000fl-UV
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 12:40:56 +0000
X-Inumbo-ID: fb4aa344-b4ac-44b9-941e-f01d11a4ab91
Received: from out30-42.freemail.mail.aliyun.com (unknown [115.124.30.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb4aa344-b4ac-44b9-941e-f01d11a4ab91;
 Wed, 16 Sep 2020 12:40:54 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0U97e8cp_1600260047; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U97e8cp_1600260047) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Sep 2020 20:40:48 +0800
Date: Wed, 16 Sep 2020 20:40:47 +0800
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
Subject: Re: [PATCH] kernel/resource: make iomem_resource implicit in
 release_mem_region_adjustable()
Message-ID: <20200916124047.GA47042@L-31X9LVDL-1304.local>
References: <20200911103459.10306-1-david@redhat.com>
 <20200916073041.10355-1-david@redhat.com>
 <20200916100223.GA46154@L-31X9LVDL-1304.local>
 <d11eba75-71c0-4153-944b-56e22044e0eb@redhat.com>
 <20200916121051.GA46809@L-31X9LVDL-1304.local>
 <0ee45d30-daa4-190a-2932-fb710d9496db@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ee45d30-daa4-190a-2932-fb710d9496db@redhat.com>
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

On Wed, Sep 16, 2020 at 02:16:25PM +0200, David Hildenbrand wrote:
>On 16.09.20 14:10, Wei Yang wrote:
>> On Wed, Sep 16, 2020 at 12:03:20PM +0200, David Hildenbrand wrote:
>>> On 16.09.20 12:02, Wei Yang wrote:
>>>> On Wed, Sep 16, 2020 at 09:30:41AM +0200, David Hildenbrand wrote:
>>>>> "mem" in the name already indicates the root, similar to
>>>>> release_mem_region() and devm_request_mem_region(). Make it implicit.
>>>>> The only single caller always passes iomem_resource, other parents are
>>>>> not applicable.
>>>>>
>>>>
>>>> Looks good to me.
>>>>
>>>> Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
>>>>
>>>
>>> Thanks for the review!
>>>
>> 
>> Would you send another version? I didn't take a look into the following
>> patches, since the 4th is missed.
>
>Not planning to send another one as long as there are no further
>comments. Seems to be an issue on your side because all patches arrived
>on linux-mm (see
>https://lore.kernel.org/linux-mm/20200911103459.10306-1-david@redhat.com/)
>
>You can find patch #4 at
>https://lore.kernel.org/linux-mm/20200911103459.10306-5-david@redhat.com/
>
>(which has CC "Wei Yang <richardw.yang@linux.intel.com>")
>

Ok, I managed to apply 4th patch manually...

>-- 
>Thanks,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

