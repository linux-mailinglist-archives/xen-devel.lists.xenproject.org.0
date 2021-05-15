Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826EA381779
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 12:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127720.240054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhrDp-0001NY-1u; Sat, 15 May 2021 10:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127720.240054; Sat, 15 May 2021 10:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhrDo-0001Kd-Un; Sat, 15 May 2021 10:08:36 +0000
Received: by outflank-mailman (input) for mailman id 127720;
 Sat, 15 May 2021 10:08:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhrDm-0001KX-Oa
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 10:08:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhrDk-0004hy-LZ; Sat, 15 May 2021 10:08:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhrDk-0002Fx-Eu; Sat, 15 May 2021 10:08:32 +0000
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
	bh=TKlSwp9ZcMh7TrtmWc5j+Vq3PuYmS2slhfCEEiinvNA=; b=f0ybz9kcEGSQUoI3iS5cEFEmjd
	2h/BuqsrTHea0ESzJ3SvrcQtIQfVq3XfScA0vz/bW4FmpUqr9DVSDbvcwjbZhYyUnPLzXjpi3UnmT
	68zMyLgrM0rd5yGSGVndgn9K4pofvyMmv/ifvgQVZXMDqpLoaGOwPTdigtk0OoiIF2mY=;
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monn?? <royger@freebsd.org>,
 Mitchell Horne <mhorne@freebsd.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <YIptpndhk6MOJFod@Air-de-Roger>
 <YItwHirnih6iUtRS@mattapan.m5p.com> <YIu80FNQHKS3+jVN@Air-de-Roger>
 <YJDcDjjgCsQUdsZ7@mattapan.m5p.com> <YJURGaqAVBSYnMRf@Air-de-Roger>
 <YJYem5CW/97k/e5A@mattapan.m5p.com> <YJs/YAgB8molh7e5@mattapan.m5p.com>
 <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
 <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
 <YJ8hTE/JbJygtVAL@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org>
Date: Sat, 15 May 2021 11:08:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJ8hTE/JbJygtVAL@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Andrew, + Stefano)

On 15/05/2021 02:18, Elliott Mitchell wrote:
> On Fri, May 14, 2021 at 09:32:10AM +0100, Julien Grall wrote:
>> On 14/05/2021 03:42, Elliott Mitchell wrote:
>>>
>>> Issue is what is the intended use of the memory range allocated to
>>> /hypervisor in the device-tree on ARM?  What do the Xen developers plan
>>> for?  What is expected?
>>
>>   From docs/misc/arm/device-tree/guest.txt:
>>
>> "
>> - reg: specifies the base physical address and size of a region in
>>     memory where the grant table should be mapped to, using an
>>     HYPERVISOR_memory_op hypercall. The memory region is large enough to map
>>     the whole grant table (it is larger or equal to
>> gnttab_max_grant_frames()).
>>     This property is unnecessary when booting Dom0 using ACPI.
>> "
>>
>> Effectively, this is a known space in memory that is unallocated. Not
>> all the guests will use it if they have a better way to find unallocated
>> space.
> 
> The use of "should" is generally considered strong encouragement to do
> so.  A warning $something is lurking here and you may regret it if you
> recklessly disobey this without knowning what is going on behind the
> scenes.

I thought a bit more over night. The potential trouble I can think of 
for a domU is the magic pages are not described in the DT.

I think every other regions should be discoverable from the DT (at least 
for a domU).

> 
> Whereas your language here suggests "can" is a better word since it is
> simply a random unused address range.
> 
> 
>>> Was the /hypervisor range intended *strictly* for mapping grant-tables?
>>
>> It was introduced to tell the OS a place where the grant-table could be
>> conveniently mapped.
> 
> Yet this is strange.  If any $random unused address range is acceptable,
> why bother suggesting a particular one?  If this is really purely the
> OS's choice, why is Xen bothering to suggest a range at all?

I have added Stefano who may have more historical context than what I 
wrote in my previous e-mail.

> 
> 
>>> Was it intended for /hypervisor to grow over the
>>> years as hardware got cheaper?
>> I don't understand this question.
> 
> Going to the trouble of suggesting a range points to something going on.
> I'm looking for an explanation since strange choices might hint at
> something unpleasant lurking below and I should watch where I step.
> 
> 
>>> Might it be better to deprecate the /hypervisor range and have domains
>>> allocate any available address space for foreign mappings?
>>
>> It may be easy for FreeBSD to find available address space but so far
>> this has not been the case in Linux (I haven't checked the latest
>> version though).
>>
>> To be clear, an OS is free to not use the range provided in /hypervisor
>> (maybe this is not clear enough in the spec?). This was mostly
>> introduced to overcome some issues we saw in Linux when Xen on Arm was
>> introduced.
> 
> Mind if I paraphrase this?
> 
> "this is a bring-up hack for Linux which hangs around since we haven't
> felt any pressure to fix the underlying Linux issue"
> 
> Is that reasonable?

Yes. I have revisited the problem a few times and every time I got stuck 
because not all the I/O regions where reported to Linux. So Linux would 
not be able to find a safe unallocated space.

> 
> 
>>> Should the FreeBSD implementation be treating grant tables as distinct
>>> from other foreign mappings?
>>
>> Both require unallocated addres space to work. IIRC FreeBSD is able to
>> find unallocated space easily, so I would recommend to use it.
> 
> That is supposed to be, but it appears there is presently a bug which has
> broken the functionality on ARM.  

Do you mind share some details?

> As such, as a proper lazy developer if
> I can abuse the /hypervisor address range for all foreign mappings, I
> will.

Are you aiming to support dom0 now?

> 
> My feeling is one of two things should happen with the /hypervisor
> address range:
> 
> 1>  OSes could be encouraged to use it for all foreign mappings.  The
> range should be dynamic in some fashion.  There could be a handy way to
> allow configuring the amount of address space thus reserved.

In the context of XSA-300 and virtio on Xen on Arm, we discussed about 
providing a revion for foreign mapping. The main trouble here is 
figuring out of the size, if you mess it up then you may break all the 
PV drivers.

If the problem is finding space, then I would like to suggest a 
different approach (I think I may have discussed it with Andrew). Xen is 
in maintaining the P2M for the guest and therefore now where are the 
unallocated space. How about introducing a new hypercall to ask for 
"unallocated space"?

This would not work for older hypervisor but you could use the RAM 
instead (as Linux does). This is has drawbacks (e.g. shattering 
superpage, reducing the amount of memory usuable...), but for 1> you 
would also need a hack for older Xen.

> 
> 2>  The range should be declared deprecated.  Everyone should be put on
> the same page that this was a quick hack for bringing up Xen/ARM/Linux,
> and really it shouldn't have escaped.

How about relaxing the wording instead?

> 
> 
>>> (is treating them the same likely to
>>> induce buggy behavior on x86?)
>>
>> I will leave this answer to Roger.
> 
> This was directed towards *you*.  There is this thing here which looks
> kind of odd in a vaguely unpleasant way.  I'm trying to figure out
> whether I should embrace it, versus running away.

I am not aware of any potential buggy behavior here. In both arm and 
x86, the requirement is to find unallocated address space (unless you 
want to waste RAM as Linux does).

Cheers,

-- 
Julien Grall

