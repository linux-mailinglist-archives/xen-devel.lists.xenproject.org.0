Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF02E2E1CDA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 14:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58375.102575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4Ux-0007ao-87; Wed, 23 Dec 2020 13:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58375.102575; Wed, 23 Dec 2020 13:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks4Ux-0007aR-4v; Wed, 23 Dec 2020 13:48:15 +0000
Received: by outflank-mailman (input) for mailman id 58375;
 Wed, 23 Dec 2020 13:48:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks4Uv-0007aM-9X
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 13:48:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54dcbf10-41f2-4e60-a6bc-665da71067af;
 Wed, 23 Dec 2020 13:48:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80B40ACF1;
 Wed, 23 Dec 2020 13:48:11 +0000 (UTC)
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
X-Inumbo-ID: 54dcbf10-41f2-4e60-a6bc-665da71067af
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608731291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F48pFlYLzVYDwP2hSzOyTZwKTk1U25C/OR+Scc23UpQ=;
	b=Mh6PiI7zR6XM7xtex46qb9ABN8yaTGL9cJJQ7AzvsTWvH+0/TcP3mnvnAyNkSzgU+x1OiJ
	FJGCHJ1e4+Px23CGQ+Q0QxLsWFIp4JsvuSTm355DilADM0lwmda2BfAI2nrjPiZXjI6mmn
	gobmS8lukvUlQkYVlFtjERtCpgM6Bv4=
Subject: Re: [PATCH for-4.15 2/4] xen/iommu: x86: Free the IOMMU page-tables
 with the pgtables.lock held
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20201222154338.9459-1-julien@xen.org>
 <20201222154338.9459-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3148db2a-ff3f-5993-dd57-7f4376f2f0ad@suse.com>
Date: Wed, 23 Dec 2020 14:48:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222154338.9459-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.12.2020 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The pgtables.lock is protecting access to the page list pgtables.list.
> However, iommu_free_pgtables() will not held it. I guess it was assumed
> that page-tables cannot be allocated while the domain is dying.
> 
> Unfortunately, there is no guarantee that iommu_map() will not be
> called while a domain is dying (it looks like to be possible from
> XEN_DOMCTL_memory_mapping).

I'd rather disallow any new allocations for a dying domain, not
the least because ...

> So it would be possible to be concurrently
> allocate memory and free the page-tables.
> 
> Therefore, we need to held the lock when freeing the page tables.

... we should try to avoid holding locks across allocation /
freeing functions wherever possible.

As to where to place a respective check - I wonder if we wouldn't
be better off disallowing a majority of domctl-s (and perhaps
other operations) on dying domains. Thoughts?

Jan

