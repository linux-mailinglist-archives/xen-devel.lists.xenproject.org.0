Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62D316779
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 14:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83593.155925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pE1-0003Ce-9c; Wed, 10 Feb 2021 13:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83593.155925; Wed, 10 Feb 2021 13:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9pE1-0003CH-6e; Wed, 10 Feb 2021 13:08:09 +0000
Received: by outflank-mailman (input) for mailman id 83593;
 Wed, 10 Feb 2021 13:08:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9pDz-0003CB-QR
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 13:08:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a0956b9-1fc4-4d4d-a774-20d2f234662a;
 Wed, 10 Feb 2021 13:08:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 230BAAC43;
 Wed, 10 Feb 2021 13:08:06 +0000 (UTC)
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
X-Inumbo-ID: 2a0956b9-1fc4-4d4d-a774-20d2f234662a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612962486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YeztlX2pKnWgOlCPnKds/8cKAL+q6yPzLeC7/Yvk43c=;
	b=CEefSBcwsDVk1L1ei6PZwLiAvr/kOeGit3WHBPq93UM9k0Sj5cmWEPysCENZgWU+ztdg7q
	06jAjMU91r30Z06ydftGy8wf75YwfYwl0quzvdXrQu58slg2nmWFzmf2hcDqucuxgaj3Rl
	SJ2MqrgRTR9shaIL/QVsEUap1HLZ2/U=
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 iwj@xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
 <YCPE0byWKlf/uOFT@Air-de-Roger>
 <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
 <e1c7c616-0941-b577-5842-a51374030798@xen.org>
 <71c4150a-0b81-cdc3-b752-814f58cb5ca4@suse.com>
 <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40ad4ce9-71c4-b033-fc1f-8b5ed39f90b3@suse.com>
Date: Wed, 10 Feb 2021 14:08:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <df760d78-a439-db0a-4b88-813b002f0a64@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.02.2021 12:48, Julien Grall wrote:
> 
> 
> On 10/02/2021 11:45, Jan Beulich wrote:
>> On 10.02.2021 12:40, Julien Grall wrote:
>>> On 10/02/2021 11:38, Jan Beulich wrote:
>>>> On 10.02.2021 12:34, Roger Pau Monné wrote:
>>>>> On Wed, Feb 10, 2021 at 12:10:09PM +0100, Jan Beulich wrote:
>>>>>> On 10.02.2021 09:29, Roger Pau Monné wrote:
>>>>>>> I get the feeling this is just papering over an existing issue instead
>>>>>>> of actually fixing it: IOMMU page tables need to be properly freed
>>>>>>> during early failure.
>>>>>>
>>>>>> I take a different perspective: IOMMU page tables shouldn't
>>>>>> get created (yet) at all in the course of
>>>>>> XEN_DOMCTL_createdomain - this op is supposed to produce an
>>>>>> empty container for a VM.
>>>>>
>>>>> The same would apply for CPU page-tables then, yet they seem to be
>>>>> created and populating them (ie: adding the lapic access page) doesn't
>>>>> leak such entries, which points at an asymmetry. Either we setup both
>>>>> tables and handle freeing them properly, or we set none of them.
>>>>
>>>> Where would CPU page tables get created from at this early stage?
>>>
>>> When mapping the APIC page in the P2M. I don't think you can get away
>>> with removing it completely.
>>
>> It doesn't need putting in the p2m this early. It would be quite
>> fine to defer this until e.g. the first vCPU gets created.
> 
> It feels wrong to me to setup a per-domain mapping when initializing the 
> first vCPU.

Then we could do it even later. Any time up to when the domain
would first get unpaused would do.

Jan

