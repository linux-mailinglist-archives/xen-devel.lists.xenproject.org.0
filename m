Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A532635E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 14:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90311.170912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFdCa-0004Ge-2f; Fri, 26 Feb 2021 13:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90311.170912; Fri, 26 Feb 2021 13:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFdCZ-0004GF-Vg; Fri, 26 Feb 2021 13:30:39 +0000
Received: by outflank-mailman (input) for mailman id 90311;
 Fri, 26 Feb 2021 13:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFdCY-0004GA-07
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 13:30:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e12d9243-f8e1-454a-934c-e09427245e9a;
 Fri, 26 Feb 2021 13:30:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 531BBAE03;
 Fri, 26 Feb 2021 13:30:36 +0000 (UTC)
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
X-Inumbo-ID: e12d9243-f8e1-454a-934c-e09427245e9a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614346236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhIVzR9cysCPi4UlThSyprTCyT1rNKm5mSqhjhmOypQ=;
	b=YSJc+8b/+7NT921hE1KZu5/TpLI4sHjkpo6q1D0/G/4tWJzZcuuiutxx/lfjXGcNi8I268
	lwaaAJuzCAEJIiou3OQxflw2FdPwMGYtjzBpr1KJQaciFaSlwOudVLMlxOXwQrP7KGh8cd
	QF43wJK1bFCN+5XOEgHHDRjfMbgjSrw=
Subject: Re: [PATCH for-4.15 v5 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210226105640.12037-1-julien@xen.org>
 <20210226105640.12037-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a386635-9c7d-3880-7e99-d87722fe5075@suse.com>
Date: Fri, 26 Feb 2021 14:30:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226105640.12037-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 11:56, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The new x86 IOMMU page-tables allocator will release the pages when
> relinquishing the domain resources. However, this is not sufficient
> when the domain is dying because nothing prevents page-table to be
> allocated.
> 
> As the domain is dying, it is not necessary to continue to modify the
> IOMMU page-tables as they are going to be destroyed soon.
> 
> At the moment, page-table allocates will only happen when iommu_map().
> So after this change there will be no more page-table allocation
> happening because we don't use superpage mappings yet when not sharing
> page tables.
> 
> In order to observe d->is_dying correctly, we need to rely on per-arch
> locking, so the check to ignore IOMMU mapping is added on the per-driver
> map_page() callback.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Does this also want a Fixes: tag (the same as patch 1)?

Jan

