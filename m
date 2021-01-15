Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2E2F7729
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67945.121483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0MwG-0002nP-Pu; Fri, 15 Jan 2021 11:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67945.121483; Fri, 15 Jan 2021 11:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0MwG-0002n0-M7; Fri, 15 Jan 2021 11:06:44 +0000
Received: by outflank-mailman (input) for mailman id 67945;
 Fri, 15 Jan 2021 11:06:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0MwF-0002mv-1k
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:06:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f97f0d3f-5858-4a43-9d61-623d449a62b4;
 Fri, 15 Jan 2021 11:06:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 514E4AA6F;
 Fri, 15 Jan 2021 11:06:41 +0000 (UTC)
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
X-Inumbo-ID: f97f0d3f-5858-4a43-9d61-623d449a62b4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610708801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lv1pqXE0s6MY/c+4p12zJZpxXJw4uO4cr0ZKXOMt85Y=;
	b=ZTR14nJZv/a81fuS+wlSS5Aw42NvTUekne0nb5iv+w+Gfs2Tv6SHPE7m4S54Pp6AgXeofy
	ngb+xzLf+L+om6NWrI4xXysw7WJDvRtRVKhkmcQLMcD+ijY8M5DnbnsY/tapVsC3udwyRR
	9JTXzRDmZOEIUaqkqoNihPx3VVVou+0=
Subject: Re: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU page-tables
 with the pgtables.lock held
To: Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-3-julien@xen.org>
 <3148db2a-ff3f-5993-dd57-7f4376f2f0ad@suse.com>
 <295b32db-ddf7-3926-b4de-b0d3b78af316@xen.org>
 <cb39419b-1e5b-74ee-8566-f548e435b490@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f21f1f61-5213-55a8-320c-43e5fe80100f@suse.com>
Date: Fri, 15 Jan 2021 12:06:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <cb39419b-1e5b-74ee-8566-f548e435b490@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.01.2021 20:19, Julien Grall wrote:
> 
> 
> On 23/12/2020 14:01, Julien Grall wrote:
>> Hi Jan,
>>
>> On 23/12/2020 13:48, Jan Beulich wrote:
>>> On 22.12.2020 16:43, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> The pgtables.lock is protecting access to the page list pgtables.list.
>>>> However, iommu_free_pgtables() will not held it. I guess it was assumed
>>>> that page-tables cannot be allocated while the domain is dying.
>>>>
>>>> Unfortunately, there is no guarantee that iommu_map() will not be
>>>> called while a domain is dying (it looks like to be possible from
>>>> XEN_DOMCTL_memory_mapping).
>>>
>>> I'd rather disallow any new allocations for a dying domain, not
>>> the least because ...
>>
>> Patch #4 will disallow such allocation. However...
> 
> It turns out that I can't disallow it because there is at least one call 
> of iommu_map() while an HVM domain is destroyed:
> 
>      (XEN)    [<ffff82d04026e399>] R iommu_map+0xf2/0x171
>      (XEN)    [<ffff82d04026e43e>] F iommu_legacy_map+0x26/0x63
>      (XEN)    [<ffff82d040302a42>] F 
> arch/x86/mm/p2m-ept.c#ept_set_entry+0x6b2/0x730
>      (XEN)    [<ffff82d0402f761d>] F p2m_set_entry+0x91/0x128
>      (XEN)    [<ffff82d0402f8643>] F guest_physmap_add_entry+0x3d7/0x4e0
>      (XEN)    [<ffff82d0402f87cb>] F guest_physmap_add_page+0x7f/0xfe
>      (XEN)    [<ffff82d0402ba0a2>] F 
> arch/x86/hvm/ioreq.c#hvm_add_ioreq_gfn+0x6f/0x8d
>      (XEN)    [<ffff82d0402ba0f9>] F 
> arch/x86/hvm/ioreq.c#hvm_ioreq_server_disable+0x39/0x4f
>      (XEN)    [<ffff82d0402bb50e>] F hvm_destroy_all_ioreq_servers+0x6f/0x9b
>      (XEN)    [<ffff82d0402afc15>] F 
> hvm_domain_relinquish_resources+0x3e/0x92
>      (XEN)    [<ffff82d04031f278>] F domain_relinquish_resources+0x355/0x372
>      (XEN)    [<ffff82d040205dd4>] F domain_kill+0xc7/0x150
>      (XEN)    [<ffff82d04023baf0>] F do_domctl+0xba7/0x1a09
>      (XEN)    [<ffff82d040312c8f>] F pv_hypercall+0x2f0/0x55f
>      (XEN)    [<ffff82d040391432>] F lstar_enter+0x112/0x120
> 
> This one resulted to a domain crash rather than a clean destruction.

A domain crash despite the domain already getting cleaned up is
something we may at least want to consider doing better: There
already is a !d->is_shutting_down conditional printk() there.
What would people think about avoiding the domain_crash() call
in similar ways? (It could even be considered to make
domain_crash() itself behave like this, but such a step may make
it necessary to first audit all use sites.)

> I would still like to disallow page-table allocation, so I am think to 
> ignore any request in iommu_map() if the domain is dying.

Ignoring requests there seems fragile to me. Paul - what are your
thoughts about bailing early from hvm_add_ioreq_gfn() when the
domain is dying?

Jan

