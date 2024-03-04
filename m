Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E6A8709B9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 19:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688497.1072689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhDCq-0005a2-9k; Mon, 04 Mar 2024 18:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688497.1072689; Mon, 04 Mar 2024 18:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhDCq-0005Xq-6n; Mon, 04 Mar 2024 18:38:32 +0000
Received: by outflank-mailman (input) for mailman id 688497;
 Mon, 04 Mar 2024 18:38:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rhDCp-0005Xk-Do
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 18:38:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhDCo-0005kS-R4; Mon, 04 Mar 2024 18:38:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhDCo-0004RF-Ku; Mon, 04 Mar 2024 18:38:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=jcEZnOMVBu9kIpHYszVV8cdL1paqlzXqczhG5PEfTDw=; b=QGyKQbnFTRf+KZA0vVn+84XT0n
	MeoqEQQBdOr14vGaopSgo/ymUk7VHJGj29prh61Jn4AaeZXKo4RvWBBn9qc3zp0QMQ80V6CuXw/xm
	I6ErGS2jEstJ3qSmoqm39mQpAEB7aNJGPVNeEYRSUW5QxW7ziuxsgKNQcwudE1FbfxYY=;
Message-ID: <8768d244-c52c-40da-8a99-0296cb9a8ca5@xen.org>
Date: Mon, 4 Mar 2024 18:38:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <d1518124-483c-4409-9b36-6a3392378911@xen.org>
 <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
 <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
 <8e56b75d-10a2-4764-8244-3e596f9fc695@amd.com>
 <98739f8d-dc00-4db8-a0b2-07f054107acf@xen.org>
 <a8499d69-0300-490d-98a7-dcceb83781a3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a8499d69-0300-490d-98a7-dcceb83781a3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/03/2024 03:03, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> On 2/28/2024 8:27 PM, Julien Grall wrote:
>> Hi Henry,
>>> ...here basically means we want to do the finding of the unused 
>>> region in toolstack. Since currently what we care about is only a 
>>> couple of pages instead of the whole memory map, could it be possible 
>>> that we do the opposite: in alloc_xs_page(), we issue a domctl 
>>> hypercall to Xen and do the finding work in Xen and return with the 
>>> found gfn? Then the page can be mapped by populate_physmap() from 
>>> alloc_xs_page() and used for XenStore.
>>
>> I know that DOMCTL hypercalls are not stable. But I am not overly 
>> happy with creating an hypercall which is just "fetch the magic 
>> regions". I think it need to be a more general one that would expose 
>> all the regions.
>>
>> Also, you can't really find the magic regions when the hypercall is 
>> done as we don't have the guest memory layout. This will need to be 
>> done in advance.
>>
>> Overall, I think it would be better if we provide an hypercall listing 
>> the regions currently occupied (similar to e820). One will have the 
>> type "magic pages".
> 
> Would below design make sense to you:

This looks good in principle. Some comments below.

> 
> (1) Similarly as the e820, we can firstly introduce some data structures 
> in struct arch_domain:
> 
> #define MEM_REGIONS_MAX 4
> 
> // For now we only care the magic regions, but in the future this can be 
> easily extended with other types such as RAM, MMIO etc.
> enum mem_region_type {
>      MEM_REGION_MAGIC,
> };
> 
> struct mem_region {
>      paddr_t start;
>      paddr_t size;
>      enum mem_region_type type;
> };
> 
> struct domain_mem_map {
>      unsigned int nr_mem_regions;
>      struct mem_region region[MEM_REGIONS_MAX];
> };

If you plan to expose the same interface externally, then you will need 
to replace paddr_t with uint64_t and avoid using an enum in the structure.

You will also want to expose a dynamic array (even if this is fixed in 
the hypervisor).

> 
> struct arch_domain {
> ...
>      struct domain_mem_map mem_map;
> };
> 
> (2) Then in domain creation time, for normal and static non-directmapped 
> Dom0less DomU, set d->arch.mem_map.region[0].start = GUEST_MAGIC_BASE 
> and the size to 4 pages. For static and directmapped Dom0less DomU, find 
> a free region of 4 pages for magic pages. The finding of a free region 
> can reuse the approach for extended region and be called before 
> make_hypervisor_node(), and when make_hypervisor_node() is called. We 
> carve the magic pages out from the actual extended region.
> 
> (3) Add a new hypercall XENMEM_memory_map_domid (or a domctl). Input 
> will be domid and output will be the memory map of the domain recorded 
> in struct arch_domain.

XENMEM_* are supposed to be stable interface. I am not aware of any use 
in the guest yet, so I think it would be best to use a DOMCTL.

> 
> (4) In alloc_xs_page() and alloc_magic_pages, replace the hardcoded base 
> address with the new address found by the hypercall.

Cheers,

-- 
Julien Grall

