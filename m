Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6EC1D4A7D
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 12:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZXGN-0002wZ-Ff; Fri, 15 May 2020 10:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7E4v=65=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZXGM-0002wR-LV
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 10:08:18 +0000
X-Inumbo-ID: ff76a154-9693-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff76a154-9693-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MAS93v0kB//VDfbcV7aM2qFCuJXCxfgKAuDOwSI7H6k=; b=U/B2zZ4O0bwY7uSbSJEwRUKUmd
 INAYZJFNR3EK/wIXKjgeZA2FuVdQ79Cyc1Rl/f2MYZCAgjeb5kYcvSIbcdZvtiohm6AsJiBSVGsPX
 abwZoBua4+HJL2JlX6/CMWpvxwvbyEmWfbgNAlDKfdfrjMKPsZzNm5YqhhVa+kz8fSGk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZXGL-00047r-HS; Fri, 15 May 2020 10:08:17 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZXGL-0002BU-8v; Fri, 15 May 2020 10:08:17 +0000
Subject: Re: Error during update_runstate_area with KPTI activated
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
 <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
 <20200515091018.GO54375@Air-de-Roger>
 <3813cfa2-c881-3fa5-bdf8-a2e874584a9f@xen.org>
 <20200515095751.GQ54375@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <108a179b-d8ea-01b9-6c6b-9f5cc57f6dc0@xen.org>
Date: Fri, 15 May 2020 11:08:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515095751.GQ54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 15/05/2020 10:57, Roger Pau Monné wrote:
> On Fri, May 15, 2020 at 10:23:16AM +0100, Julien Grall wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>>
>> On 15/05/2020 10:10, Roger Pau Monné wrote:
>>> On Fri, May 15, 2020 at 09:53:54AM +0100, Julien Grall wrote:
>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>>>
>>>> Hi,
>>>>
>>>> On 15/05/2020 09:38, Roger Pau Monné wrote:
>>>>> On Fri, May 15, 2020 at 07:39:16AM +0000, Bertrand Marquis wrote:
>>>>>>
>>>>>>
>>>>>> On 14 May 2020, at 20:13, Julien Grall <julien.grall.oss@gmail.com<mailto:julien.grall.oss@gmail.com>> wrote:
>>>>>> "I'd love to do this, but we cant.  Older Linux used to have a virtual
>>>>>> buffer spanning a page boundary.  Changing the behaviour under that will
>>>>>> cause older setups to explode."
>>>>>
>>>>> Sorry this was long time ago, and details have faded. IIRC there was
>>>>> even a proposal (or patch set) that took that into account and allowed
>>>>> buffers to span across a page boundary by taking a reference to two
>>>>> different pages in that case.
>>>>
>>>> I am not aware of a patch set. Juergen suggested a per-domain mapping but
>>>> there was no details how this could be done (my e-mail was left unanswered
>>>> [1]).
>>>>
>>>> If we were using the vmap() then we would need up 1MB per domain (assuming
>>>> 128 vCPUs). This sounds quite a bit and I think we need to agree whether it
>>>> would be an acceptable solution (this was also left unanswered [1]).
>>>
>>> Could we map/unmap the runtime area on domain switch at a per-cpu
>>> based linear space area? There's no reason to have all the runtime
>>> areas mapped all the time, you just care about the one from the
>>> running vcpu.
>>
>> AFAICT, this is only used during context switching. This is a bit surprising
>> because I would expect it to be updated when the vCPU is running.
>>
>> So maybe we could just use map_domain_page() and take care manually about
>> cross-page boundary.
>>
>>>
>>> Maybe the overhead of that mapping and unmapping would be
>>> too high? But seeing that we are aiming at a secret-free Xen we would
>>> have to eventually go that route anyway.
>>
>> The overhead is likely to be higher with the existing code as you have to
>> walk the guest page-tables and the p2m everytime in order to translate the
>> guest virtual address to a host physical address.
> 
> Maybe I'm getting confused, but you actually want to avoid the guest
> page table walk, as the guest might be running with user-space page
> tables that don't have the linear address of the runtime area mapped,
> and hence you would like to do the walk only once (at hypercall
> registration time) and keep a reference to the page(s)?

That's right.

> 
> I assumed the whole point of this was to avoid doing the page table
> walk when you need to update the runstate info area.

Sorry I wasn't clear. I was trying to answer to your question about the 
overhead.

The overhead with SH and the existing runstate implementation is going 
to be quite high because you would need to map/unmap each table during 
your walk. By removing the walk, you would now have only one map/unmap 
for the update which I think is acceptable.

So the change discussed in this thread is also going to be beneficial 
for SH even if we keep a map/unmap in the process.

Cheers,

-- 
Julien Grall

