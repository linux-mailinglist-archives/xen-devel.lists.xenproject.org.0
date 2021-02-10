Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D97316942
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 15:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83629.156103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qeC-0004Iq-EB; Wed, 10 Feb 2021 14:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83629.156103; Wed, 10 Feb 2021 14:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9qeC-0004IR-B8; Wed, 10 Feb 2021 14:39:16 +0000
Received: by outflank-mailman (input) for mailman id 83629;
 Wed, 10 Feb 2021 14:39:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9qeA-0004IM-P7
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 14:39:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29ed9c5b-93ab-4330-b0aa-9f7113b1c89f;
 Wed, 10 Feb 2021 14:39:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 126B8AB98;
 Wed, 10 Feb 2021 14:39:13 +0000 (UTC)
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
X-Inumbo-ID: 29ed9c5b-93ab-4330-b0aa-9f7113b1c89f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612967953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Da4xgW9Q9Zfd2gkw+zmTbLAnFFuelJcmAhpeJLNjJY=;
	b=ZktZhZCC2qzdwtV/gejwCxda1q6ia5A7Lg1xiW6SmZa4MJchTjOsrUlbsyUhBjEVRCGQdD
	v2pS5NWxIyNe3SzpTj/gb7yrK4S9FCIKOJr/r8NW4uOsbPvoBlP3oxhh6skPt3r6u0Lxdc
	gJIfPoIfm+zLnbohqRR/6rLxMbBCsOI=
Subject: Re: [for-4.15][PATCH v2 5/5] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-6-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1ee8244-2d4a-64b8-daa5-c74516adae2f@suse.com>
Date: Wed, 10 Feb 2021 15:39:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209152816.15792-6-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 16:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The new per-domain IOMMU page-table allocator will now free the
> page-tables when domain's resources are relinquished. However, the root
> page-table (i.e. hd->arch.pg_maddr) will not be cleared.
> 
> Xen may access the IOMMU page-tables afterwards at least in the case of
> PV domain:
> 
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04025b4b2>] R iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
> (XEN)    [<ffff82d04025b695>] F iommu.c#intel_iommu_unmap_page+0x5d/0xf8
> (XEN)    [<ffff82d0402695f3>] F iommu_unmap+0x9c/0x129
> (XEN)    [<ffff82d0402696a6>] F iommu_legacy_unmap+0x26/0x63

So if unmap was (also) short-circuited for dying domains, this
path wouldn't be taken and all would be well even without this
change?

Jan

