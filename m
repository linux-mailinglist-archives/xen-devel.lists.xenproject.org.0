Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 787433E7D7F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 18:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165436.302310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDUcw-0002Jd-Ai; Tue, 10 Aug 2021 16:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165436.302310; Tue, 10 Aug 2021 16:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDUcw-0002Gh-7h; Tue, 10 Aug 2021 16:29:18 +0000
Received: by outflank-mailman (input) for mailman id 165436;
 Tue, 10 Aug 2021 16:29:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDUcv-0002Gb-4D
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 16:29:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDUcd-0001XZ-Fr; Tue, 10 Aug 2021 16:28:59 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDUcd-0003pj-8A; Tue, 10 Aug 2021 16:28:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ufEN2YPI7vQWWPQFNTZWby3Jz+fRhfxgoGnLI5FMfxQ=; b=WWJ1wi4cH8yN1S3sFv9ahIDmYa
	JnrKutxqcT4gtwAi9XknHnDQihZ6SZ2xrJjFB2l4acNUaaFGPE49uE7tVETwzqoyEw8XuDW6m3jVm
	+Waz5JhxwDQ2US86HNhZCLQfyQScobZorK97PpYBXZmTaQ5/wDwWx7xWOd4P1YsTU2+A=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Oleksandr <olekstysh@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
 <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
 <bc576a23-d107-c67d-8dca-62691e5eea1a@xen.org>
 <1d0ea55d-2e5a-daa7-9c60-c7a1c4b48fa1@gmail.com>
 <6947db7a-44d3-eb5f-c93e-1c1b88c62f29@xen.org>
 <736c38b3-0dfa-ccbf-6a6a-6da871f8aca0@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4f5be55d-062b-06d2-1e41-bac3ade0cc3a@xen.org>
Date: Tue, 10 Aug 2021 17:28:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <736c38b3-0dfa-ccbf-6a6a-6da871f8aca0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/08/2021 22:18, Oleksandr wrote:
> 
> On 09.08.21 23:45, Julien Grall wrote:
> 
> 
> Hi Julien


Hi Oleksandr,

>> On 09/08/2021 19:24, Oleksandr wrote:
>>>
>>> On 09.08.21 18:42, Julien Grall wrote:
>>> 1. If IOMMU is enabled for Dom0 -> provide holes found in Host DT as 
>>> safe ranges
>>>
>>> I would take into the account holes >= 1MB.
>>
>> May I ask why 1MB?
> 
> Nothing special, just thinking to not bother with small regions which 
> would not be too useful overall, but could bloat resulting reg property.
> 
> Anyway, I would be ok with any sizes.

I was more interesting with the reasoning behind your choice rather than 
saying we want more.

I agree that we may want to skip smaller region. I am guess that an high 
number of small regions will also increase the bookeeping in Linux.

But I would probably suggest to align the safe region to a 2MB 
(superpage for 4KB page granularity) just because the backend (or even 
Xen) may be able to do some optimization there.

Cheers,

-- 
Julien Grall

