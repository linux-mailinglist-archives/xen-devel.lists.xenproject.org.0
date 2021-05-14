Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A838054D
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 10:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127256.239125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhTEz-00073s-IG; Fri, 14 May 2021 08:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127256.239125; Fri, 14 May 2021 08:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhTEz-00071G-ES; Fri, 14 May 2021 08:32:13 +0000
Received: by outflank-mailman (input) for mailman id 127256;
 Fri, 14 May 2021 08:32:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhTEy-00071A-H4
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 08:32:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhTEy-0004Uj-3l; Fri, 14 May 2021 08:32:12 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhTEx-0004tW-UT; Fri, 14 May 2021 08:32:12 +0000
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
	bh=0sbUH7G16PopEH/rjYcHFkkcZyBjinXGx914CCtJe/I=; b=FEJe7Wk0st9R/2eEYMXvTOElfs
	27DZs4Cm/qiMODrLEZ5hjoqcS38a3sMN5CenFLoQBoeMhw436FGyqjv9wT7r39FdL/wi0DasPN0ol
	UFWuyr8QGh0XgFf2iWIDv6CdVaMz5uGtqw3o4qBQ1iynj9eqyqO3RTnUuMJoInqX0KnM=;
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
To: Elliott Mitchell <ehem+undef@m5p.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monn?? <royger@freebsd.org>,
 Mitchell Horne <mhorne@freebsd.org>
References: <YIhSbkfShjN/gMCe@Air-de-Roger>
 <YIndyh0sRqcmcMim@mattapan.m5p.com> <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com> <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com> <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com> <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
Date: Fri, 14 May 2021 09:32:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 14/05/2021 03:42, Elliott Mitchell wrote:
> Upon thinking about it, this seems appropriate to bring to the attention
> of the Xen development list since it seems to have wider implications.
> 
> 
> On Wed, May 12, 2021 at 11:08:39AM +0100, Julien Grall wrote:
>> On 12/05/2021 03:37, Elliott Mitchell wrote:
>>>
>>> What about the approach to the grant-table/xenpv memory situation?
>>>
>>> As stated for a 768MB VM, Xen suggested a 16MB range.  I'm unsure whether
>>> that is strictly meant for grant-table use or is meant for any foreign
>>> memory mappings (Julien?).
>>
>> An OS is free to use it as it wants. However, there is no promise that:
>>     1) The region will not shrink
>>     2) The region will stay where it is
> 
> Issue is what is the intended use of the memory range allocated to
> /hypervisor in the device-tree on ARM?  What do the Xen developers plan
> for?  What is expected?

 From docs/misc/arm/device-tree/guest.txt:

"
- reg: specifies the base physical address and size of a region in
   memory where the grant table should be mapped to, using an
   HYPERVISOR_memory_op hypercall. The memory region is large enough to map
   the whole grant table (it is larger or equal to 
gnttab_max_grant_frames()).
   This property is unnecessary when booting Dom0 using ACPI.
"

Effectively, this is a known space in memory that is unallocated. Not 
all the guests will use it if they have a better way to find unallocated 
space.

> 
> 
> With FreeBSD, Julien Grall's attempt 5 years ago at getting Xen/ARM
> support treated the grant table as distinct from other foreign memory
> mappings.  Yet for the current code (which is oriented towards x86) it is
> rather easier to treat all foreign mappings the same.
> 
> Limiting foreign mappings to a total of 16MB for a 768MB domain is tight.

It is not clear to me whether you are referring to frontend or backend 
domain.

However, there is no relation between the size of a domain and how many 
foreign pages it will map. You can have a tiny backend (let say 128MB of 
RAM) that will handle a large domain (e.g. 2GB).

Instead, it depends on the maximum number of pages that will be mapped 
at a given point. If you are running a device emulator, then it is more 
convenient to try to keep as many foreign pages as possible mapped.

For PV backend (e.g. block, net), they tend to use grant mapping. Most 
of the time they are ephemeral (they last for the duration of the 
requests) but in some cases they will be kept mapped for the longer (for 
instance the block backend may support persistent grant).

> Was the /hypervisor range intended *strictly* for mapping grant-tables?

It was introduced to tell the OS a place where the grant-table could be 
conveniently mapped.

> Was it intended for the /hypervisor range to dynamically scale with the
> size of the domain? 
As per above, this doesn't depend on the size of the domain. Instead, 
this depends on what sort of the backend will be present in the domain.

> Was it intended for /hypervisor to grow over the
> years as hardware got cheaper?
I don't understand this question.

> Might it be better to deprecate the /hypervisor range and have domains
> allocate any available address space for foreign mappings?

It may be easy for FreeBSD to find available address space but so far 
this has not been the case in Linux (I haven't checked the latest 
version though).

To be clear, an OS is free to not use the range provided in /hypervisor 
(maybe this is not clear enough in the spec?). This was mostly 
introduced to overcome some issues we saw in Linux when Xen on Arm was 
introduced.

> 
> Should the FreeBSD implementation be treating grant tables as distinct
> from other foreign mappings?

Both require unallocated addres space to work. IIRC FreeBSD is able to 
find unallocated space easily, so I would recommend to use it.

> (is treating them the same likely to
> induce buggy behavior on x86?)

I will leave this answer to Roger.

Cheers,

-- 
Julien Grall

