Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C542168DE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 11:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsjiJ-0005Kv-5y; Tue, 07 Jul 2020 09:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9WyG=AS=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jsjiH-0005Kq-GV
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 09:16:29 +0000
X-Inumbo-ID: 89ef5c1e-c032-11ea-8496-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89ef5c1e-c032-11ea-8496-bc764e2007e4;
 Tue, 07 Jul 2020 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qSabd6FXwgWNjWONeiNBfL6eI+4HbpsI+k1Q3590rBg=; b=STEvShSs5p5Vv6hOszNa5HcwWo
 RMb5A925cnUOgaCJQTwqybMR2YiGxznwPRC4eGnn2QknX1QW0vYA+LmCb/z5iOenP1zVxMFJFIror
 5rLy2+mNSGrPJnPSr/3FdVewyRLIb4tJFgmfApNF6wSosvNNFq/o0MR7WiwSYOHy8NVE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsjiC-0007kA-0I; Tue, 07 Jul 2020 09:16:24 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsjiB-00083V-Iw; Tue, 07 Jul 2020 09:16:23 +0000
Subject: Re: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
 <20200702090047.GX735@Air-de-Roger>
 <1505813895.18300396.1593707008144.JavaMail.zimbra@cert.pl>
 <20200703094438.GY735@Air-de-Roger>
 <b5335c2e-da13-28de-002b-e93dd68a0a11@suse.com>
 <20200703101120.GZ735@Air-de-Roger>
 <51ecaf40-8fb5-8454-7055-5af33a47152e@xen.org>
 <d9e604e9-acb7-17df-f0d1-7552dab526c7@suse.com>
 <88892784-0ed6-2594-bef8-fd0ae46c2b17@xen.org>
 <a13451d6-d6b5-6d86-aeb0-8985db730866@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ab992813-4584-f8e0-b90a-7a587c396bae@xen.org>
Date: Tue, 7 Jul 2020 10:16:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a13451d6-d6b5-6d86-aeb0-8985db730866@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 tamas lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 07/07/2020 10:10, Jan Beulich wrote:
> On 07.07.2020 10:44, Julien Grall wrote:
>> Hi,
>>
>> On 06/07/2020 09:46, Jan Beulich wrote:
>>> On 04.07.2020 19:23, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 03/07/2020 11:11, Roger Pau Monné wrote:
>>>>> On Fri, Jul 03, 2020 at 11:56:38AM +0200, Jan Beulich wrote:
>>>>>> On 03.07.2020 11:44, Roger Pau Monné wrote:
>>>>>>> On Thu, Jul 02, 2020 at 06:23:28PM +0200, Michał Leszczyński wrote:
>>>>>>>> ----- 2 lip 2020 o 11:00, Roger Pau Monné roger.pau@citrix.com napisał(a):
>>>>>>>>
>>>>>>>>> On Tue, Jun 30, 2020 at 02:33:46PM +0200, Michał Leszczyński wrote:
>>>>>>>>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>>>>>>>>> index 59bdc28c89..7b8289d436 100644
>>>>>>>>>> --- a/xen/include/public/domctl.h
>>>>>>>>>> +++ b/xen/include/public/domctl.h
>>>>>>>>>> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>>>>>>>>>>         uint32_t max_evtchn_port;
>>>>>>>>>>         int32_t max_grant_frames;
>>>>>>>>>>         int32_t max_maptrack_frames;
>>>>>>>>>> +    uint8_t vmtrace_pt_order;
>>>>>>>>>
>>>>>>>>> I've been thinking about this, and even though this is a domctl (so
>>>>>>>>> not a stable interface) we might want to consider using a size (or a
>>>>>>>>> number of pages) here rather than an order. IPT also supports
>>>>>>>>> TOPA mode (kind of a linked list of buffers) that would allow for
>>>>>>>>> sizes not rounded to order boundaries to be used, since then only each
>>>>>>>>> item in the linked list needs to be rounded to an order boundary, so
>>>>>>>>> you could for example use three 4K pages in TOPA mode AFAICT.
>>>>>>>>>
>>>>>>>>> Roger.
>>>>>>>>
>>>>>>>> In previous versions it was "size" but it was requested to change it
>>>>>>>> to "order" in order to shrink the variable size from uint64_t to
>>>>>>>> uint8_t, because there is limited space for xen_domctl_createdomain
>>>>>>>> structure.
>>>>>>>
>>>>>>> It's likely I'm missing something here, but I wasn't aware
>>>>>>> xen_domctl_createdomain had any constrains regarding it's size. It's
>>>>>>> currently 48bytes which seems fairly small.
>>>>>>
>>>>>> Additionally I would guess a uint32_t could do here, if the value
>>>>>> passed was "number of pages" rather than "number of bytes"?
>>>> Looking at the rest of the code, the toolstack accepts a 64-bit value.
>>>> So this would lead to truncation of the buffer if it is bigger than 2^44
>>>> bytes.
>>>>
>>>> I agree such buffer is unlikely, yet I still think we want to harden the
>>>> code whenever we can. So the solution is to either prevent check
>>>> truncation in libxl or directly use 64-bit in the domctl.
>>>>
>>>> My preference is the latter.
>>>>
>>>>>
>>>>> That could work, not sure if it needs to state however that those will
>>>>> be 4K pages, since Arm can have a different minimum page size IIRC?
>>>>> (or that's already the assumption for all number of frames fields)
>>>>> vmtrace_nr_frames seems fine to me.
>>>>
>>>> The hypercalls interface is using the same page granularity as the
>>>> hypervisor (i.e 4KB).
>>>>
>>>> While we already support guest using 64KB page granularity, it is
>>>> impossible to have a 64KB Arm hypervisor in the current state. You are
>>>> going to either break existing guest (if you switch to 64KB page
>>>> granularity for the hypercall ABI) or render them insecure (the mimimum
>>>> mapping in the P2M would be 64KB).
>>>>
>>>> DOMCTLs are not stable yet, so using a number of pages is OK. However, I
>>>> would strongly suggest to use a number of bytes for any xl/libxl/stable
>>>> libraries interfaces as this avoids confusion and also make more
>>>> futureproof.
>>>
>>> If we can't settle on what "page size" means in the public interface
>>> (which imo is embarrassing), then how about going with number of kb,
>>> like other memory libxl controls do? (I guess using Mb, in line with
>>> other config file controls, may end up being too coarse here.) This
>>> would likely still allow for a 32-bit field to be wide enough.
>>
>> A 32-bit field would definitely not be able to cover a full address
>> space. So do you mind to explain what is the upper bound you expect here?
> 
> Do you foresee a need for buffer sizes of 4Tb and up?

Not I am aware of... However, I think the question was worth it given 
that "wide enough" can mean anything.

Cheers,

-- 
Julien Grall

