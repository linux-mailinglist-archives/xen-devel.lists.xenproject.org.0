Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCED722208E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 12:26:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw15A-00066P-O2; Thu, 16 Jul 2020 10:25:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jw159-00066K-TF
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 10:25:39 +0000
X-Inumbo-ID: b1869a58-c74e-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1869a58-c74e-11ea-b7bb-bc764e2007e4;
 Thu, 16 Jul 2020 10:25:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 348B2AEF8;
 Thu, 16 Jul 2020 10:25:42 +0000 (UTC)
Subject: Re: [PATCH 1/2] VT-d: install sync_cache hook on demand
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
 <0036b69f-0d56-9ac4-1afa-06640c9007de@suse.com>
 <20200716101409.GK7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a051d3e7-eaf5-6121-823b-db1a737bc085@suse.com>
Date: Thu, 16 Jul 2020 12:25:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716101409.GK7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.07.2020 12:14, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 12:03:57PM +0200, Jan Beulich wrote:
>> Instead of checking inside the hook whether any non-coherent IOMMUs are
>> present, simply install the hook only when this is the case.
>>
>> To prove that there are no other references to the now dynamically
>> updated ops structure (and hence that its updating happens early
>> enough), make it static and rename it at the same time.
>>
>> Note that this change implies that sync_cache() shouldn't be called
>> directly unless there are unusual circumstances, like is the case in
>> alloc_pgtable_maddr(), which gets invoked too early for iommu_ops to
>> be set already (and therefore we also need to be careful there to
>> avoid accessing vtd_ops later on, as it lives in .init).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I think this is slightly better than what we currently have:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I would however prefer if we also added a check to assert that
> alloc_pgtable_maddr is never called before iommu_alloc.

It would be quite odd for this to happen - what point would
there be to allocate a table to hang off of an IOMMU when
no IOMMU was found at all so far? Furthermore, such a
restriction could either be viewed to not suffice afaict (as
a subsequent iommu_alloc() may in principle fine a non-
coherent IOMMU), or to be pointless (until a non-coherent
IOMMU was found and allocated any table for, it doesn't
really matter whether we sync cache). In the end, whether to
sync cache in alloc_pgtable_maddr() doesn't really depend on
any global property, but only on the property / properties
of the IOMMU(s) the table is going to be made visible to.

> We could maybe
> poison the .sync_cache field, and then either set to NULL or to
> sync_cache in iommu_alloc?

Poisoning is at least latently problematic, due to alternative
insn patching we use for indirect calls. There are two passes,
where the 1st pass skips any instances where the target address
is still NULL. Of course that code could be made honor the
poison value as well, but to me this looks like going too far.

Jan

