Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248863164AF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83529.155662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nNt-0007f1-I2; Wed, 10 Feb 2021 11:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83529.155662; Wed, 10 Feb 2021 11:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nNt-0007ef-EL; Wed, 10 Feb 2021 11:10:13 +0000
Received: by outflank-mailman (input) for mailman id 83529;
 Wed, 10 Feb 2021 11:10:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9nNr-0007ea-Jr
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:10:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98b6c9af-70ac-424f-a88a-77bfae8f2b48;
 Wed, 10 Feb 2021 11:10:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73992AD29;
 Wed, 10 Feb 2021 11:10:09 +0000 (UTC)
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
X-Inumbo-ID: 98b6c9af-70ac-424f-a88a-77bfae8f2b48
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612955409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1bwpkiqh+t+17POKpfLzTJ7Yag0BfQIMUO9uVdEKxw=;
	b=SR8bt3OOgKFtw4WF4/auYc40Ht+x0xiko6naSptwthGMXN47J8CD4f5UWN0mGaaygzdDJS
	eyi1xsNB7ruY5rwPGwP/B6Bpwk9WkwCP/cPhpVRosM4aDCR0sSYO0U01sp/JVItgRlhuNN
	w8/Ifr5KPZs6gJ6ufWTvZe2RrLBg1cQ=
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 iwj@xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
Date: Wed, 10 Feb 2021 12:10:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCOZbNly7YCSNtHY@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.02.2021 09:29, Roger Pau Monné wrote:
> On Tue, Feb 09, 2021 at 03:28:12PM +0000, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, the IOMMU page-tables will be populated early in the domain
>> creation if the hardware is able to virtualize the local APIC. However,
>> the IOMMU page tables will not be freed during early failure and will
>> result to a leak.
>>
>> An assigned device should not need to DMA into the vLAPIC page, so we
>> can avoid to map the page in the IOMMU page-tables.
>>
>> This statement is also true for any special pages (the vLAPIC page is
>> one of them). So to take the opportunity to prevent the mapping for all
>> of them.
> 
> Hm, OK, while I assume it's likely for special pages to not be target
> of DMA operations, it's not easy to spot what are special pages.
> 
>> Note that:
>>     - This is matching the existing behavior with PV guest
> 
> You might make HVM guests not sharing page-tables 'match' PV
> behavior, but you are making behavior between HVM guests themselves
> diverge.
> 
> 
>>     - This doesn't change the behavior when the P2M is shared with the
>>     IOMMU. IOW, the special pages will still be accessibled by the
>>     device.
> 
> I have to admit I don't like this part at all. Having diverging device
> mappings depending on whether the page tables are shared or not is
> bad IMO, as there might be subtle bugs affecting one of the two
> modes.

This is one way to look at things, yes. But if you take the
other perspective that special pages shouldn't be
IOMMU-mapped, then the divergence is the price to pay for
being able to share pages (and it's not Julien introducing
bad behavior here).

Additionally it may be possible to utilize the divergence to
our advantage: If one way of setting up things works and the
other doesn't, we have a reasonable clue where to look. In
fact the aspect above may, together with possible future
findings, end up being a reason to not default to or even
disallow (like for AMD) page table sharing.

> I get the feeling this is just papering over an existing issue instead
> of actually fixing it: IOMMU page tables need to be properly freed
> during early failure.

I take a different perspective: IOMMU page tables shouldn't
get created (yet) at all in the course of
XEN_DOMCTL_createdomain - this op is supposed to produce an
empty container for a VM.

Jan

