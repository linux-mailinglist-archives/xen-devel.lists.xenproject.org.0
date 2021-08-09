Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D373E47EF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 16:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165032.301583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6cm-0008FU-BM; Mon, 09 Aug 2021 14:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165032.301583; Mon, 09 Aug 2021 14:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6cm-0008Cx-7j; Mon, 09 Aug 2021 14:51:32 +0000
Received: by outflank-mailman (input) for mailman id 165032;
 Mon, 09 Aug 2021 14:51:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mD6cl-0008Cr-BB
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 14:51:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mD6cb-0007FL-HN; Mon, 09 Aug 2021 14:51:21 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mD6cb-0002Dc-AD; Mon, 09 Aug 2021 14:51:21 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=GFAaERkNSLRf9gXuYvHal0YmoyRiygrWJ2kQbO7Q2cU=; b=di5QjT4NI5Nyx5p+7TM7yMinsv
	RY7VguQgokY67LJeV9koB4l/X9nBP+9xTU97vo7Qs03IL2hxCwNNIBC6MCfFqHL5JVypceovkRJA2
	lXckKnxO9QVGo7oKYUI5Hbxj9faKd0ji2M7YyXOaOxnH/S6z6fUSGtPj1vEHn0YLHj8s=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
From: Julien Grall <julien@xen.org>
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
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
Message-ID: <93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org>
Date: Mon, 9 Aug 2021 15:51:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

I am writing down here what we discussed on another thread and on IRC. 
This will be easier to track in a single thread.

On 04/08/2021 23:00, Julien Grall wrote:
> On 04/08/2021 21:56, Oleksandr wrote:
>> Now, I am wondering, would it be possible to update/clarify the 
>> current "reg" purpose and use it to pass a safe unallocated space for 
>> any Xen specific mappings (grant, foreign, whatever) instead of just 
>> for the grant table region. In case, it is not allowed for any reason 
>> (compatibility PoV, etc), would it be possible to extend a property by 
>> passing an extra range separately, something similar to how I 
>> described above?
> 
> I think it should be fine to re-use the same region so long the size of 
> the first bank is at least the size of the original region.

While answering to the DT binding question on the DT ML, I realized that 
this is probably not going to be fine because there is a bug in Xen when 
mapping grant-table frame.

The function gnttab_map_frame() is used to map the grant table frame. If 
there is an old mapping, it will first remove it.

The function is using the helper gnttab_map_frame() to find the 
corresponding GFN or return INVALID_GFN if not mapped.

On Arm, gnttab_map_frame() is implementing using an array index by the 
grant table frame number. The trouble is we don't update the array when 
the page is unmapped. So if the GFN is re-used before the grant-table is 
remapped, then we will end up to remove whatever was mapped there (this 
could be a foreign page...).

This behavior already happens today as the toolstack will use the first 
GFN of the region if Linux doesn't support the acquire resource 
interface. We are getting away in the Linux because the toolstack only 
map the first grant table frame and:
  - Newer Linux will not used the region provided by the DT and nothing 
will be mapped there.
  - Older Linux will use the region but still map the grant table frame 
0 to the same GFN.

I am not sure about U-boot and other OSes here.

This is not new but it is going to be become a bigger source of problem 
(read more chance to hit it) as we try to re-use the first region.

This means the first region should exclusively used for the grant-table 
(in a specific order) until the issue is properly fixed.

A potential fix is to update the array in p2m_put_l3_page(). The default 
max size of the array is 1024, so it might be fine to just walk it (it 
would be simply a comparison).

Note that this is not a problem on x86 because the is using the M2P. So 
when a mapping is removed, the mapping MFN -> GFN will also be removed.

Cheers,

-- 
Julien Grall

