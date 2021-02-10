Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BE4316A81
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 16:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83655.156233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rnz-0003rx-CP; Wed, 10 Feb 2021 15:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83655.156233; Wed, 10 Feb 2021 15:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9rnz-0003rY-9J; Wed, 10 Feb 2021 15:53:27 +0000
Received: by outflank-mailman (input) for mailman id 83655;
 Wed, 10 Feb 2021 15:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9rny-0003rT-Nr
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:53:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6fb4d56-6a7d-4e5a-b8c6-5b9bb183efac;
 Wed, 10 Feb 2021 15:53:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E890DAB98;
 Wed, 10 Feb 2021 15:53:24 +0000 (UTC)
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
X-Inumbo-ID: a6fb4d56-6a7d-4e5a-b8c6-5b9bb183efac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612972405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uzm/DX6yvAf4dtEdrcBQOAQnj44/gh/KVu3tROWKUc=;
	b=LAmJjPDRcNDBskP2AC0ZgtotRZ0oZplBdBfscy0/1aqYUPj3TVq03TqIjD5lj9Tx11g9Ew
	Hsq81N7ECFi/aEwRlDyX36Tdpd4IiZpZzdQC9eNIJ3veLS9q/vU12egqZgBKXirfLa3fp8
	w5bsY2cZsgjk9IWqNXbZ/YhyKU166sI=
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 iwj@xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20210209152816.15792-2-julien@xen.org>
 <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
 <YCPE0byWKlf/uOFT@Air-de-Roger>
 <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
 <e1c7c616-0941-b577-5842-a51374030798@xen.org>
 <71c4150a-0b81-cdc3-b752-814f58cb5ca4@suse.com>
 <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
 <YCPJXe1L1SCXoL7a@Air-de-Roger>
 <bb242b17-01f3-6312-b563-f82abc5d300a@suse.com>
 <YCP6x9ApfJQuhALl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <14ed7349-4af7-9882-af1f-08c1739cbf5f@suse.com>
Date: Wed, 10 Feb 2021 16:53:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCP6x9ApfJQuhALl@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.02.2021 16:24, Roger Pau Monné wrote:
> On Wed, Feb 10, 2021 at 02:12:38PM +0100, Jan Beulich wrote:
>> On 10.02.2021 12:54, Roger Pau Monné wrote:
>>> On Wed, Feb 10, 2021 at 11:48:40AM +0000, Julien Grall wrote:
>>>> It feels wrong to me to setup a per-domain mapping when initializing the
>>>> first vCPU.
>>>>
>>>> But, I was under the impression that there is plan to remove
>>>> XEN_DOMCTL_max_vcpus. So it would only buy just a bit of time...
>>>
>>> I was also under that impression. We could setup the lapic access page
>>> at vlapic_init for the BSP (which is part of XEN_DOMCTL_max_vcpus
>>> ATM).
>>>
>>> But then I think there should be some kind of check to prevent
>>> populating either the CPU or the IOMMU page tables at domain creation
>>> hypercall, and so the logic to free CPU table tables on failure could
>>> be removed.
>>
>> I can spot paging_final_teardown() on an error path there, but I
>> don't suppose that's what you mean? I guess I'm not looking in
>> the right place (there are quite a few after all) ...
> 
> Well, I assume some freeing of the EPT page tables must happen on
> error paths, or else we would be leaking them like IOMMU tables are
> leaked currently?

Well, you can't eliminate paging_final_teardown() from that
error path because it frees internal structures. It _also_
sets HAP's / shadow's allocation to zero, so has the side
effect of freeing why may have been CPU page tables.

Jan

