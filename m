Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C0598AA0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 19:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389733.626845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOjXI-0002dP-6I; Thu, 18 Aug 2022 17:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389733.626845; Thu, 18 Aug 2022 17:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOjXI-0002ap-3f; Thu, 18 Aug 2022 17:42:28 +0000
Received: by outflank-mailman (input) for mailman id 389733;
 Thu, 18 Aug 2022 17:42:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOjXG-0002ai-KV
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 17:42:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOjXC-0004vS-1W; Thu, 18 Aug 2022 17:42:22 +0000
Received: from [54.239.6.188] (helo=[192.168.18.101])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOjXB-0004KR-QU; Thu, 18 Aug 2022 17:42:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=PQRW5+Zn3ECC2LpwqVvSp80TqDSj91qfI2d8lYFxMuY=; b=KBPO3uftGdaXZOPSYx1gRRSiCn
	ZCoe0/oMThxz2xm3RH9cJjyRReVLQN2PQtVulAx0GCTWVOVC8Q8hJAwl4Usz0nSpYMALgcG4m0WiG
	GyCENCbr1dKS/TolxCrIuViOxN/PVExyn6vrkzWuednOs+7+vey7Jo4uW9qolDA8NPCk=;
Message-ID: <5d926715-b6af-234f-9798-622cdb53f181@xen.org>
Date: Thu, 18 Aug 2022 18:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Chen <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <fb2a0fab-3e87-9a2a-a881-31ea7bdeae99@suse.com>
 <Yvu7Dpl5Pq/E8MxA@perard.uk.xensource.com>
 <ff4fbffb-915d-f221-2375-87358b46eee7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ff4fbffb-915d-f221-2375-87358b46eee7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 16/08/2022 17:29, Jan Beulich wrote:
> On 16.08.2022 17:43, Anthony PERARD wrote:
>> On Tue, Aug 16, 2022 at 03:02:10PM +0200, Jan Beulich wrote:
>>> On 16.08.2022 12:30, Anthony PERARD wrote:
>>>> We can't have a source file with the same name that exist in both the
>>>> common code and in the arch specific code for efi/. This can lead to
>>>> comfusion in make and it can pick up the wrong source file. This issue
>>>> lead to a failure to build a pv-shim for x86 out-of-tree, as this is
>>>> one example of an x86 build using the efi/stub.c.
>>>>
>>>> The issue is that in out-of-tree, make might find x86/efi/stub.c via
>>>> VPATH, but as the target needs to be rebuilt due to FORCE, make
>>>> actually avoid changing the source tree and rebuilt the target with
>>>> VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
>>>> exist yet so a link is made to "common/stub.c".
>>>>
>>>> Rework the new common/stub.c file to have a different name than the
>>>> already existing one. And build both *stub.c as two different objects.
>>>> This mean we have to move some efi_compat_* aliases which are probably
>>>> useless for Arm.
>>>
>>> These useless aliases want avoiding there imo. Already when the original
>>> series was discussed, I requested to avoid introduction of a file named
>>> common-stub.c or alike.
>>
>> Yeah, I've notice that. This is why the build is broken under
>> specific condition.
>>
>>> If names need to be different, can't we follow
>>> boot.c's model and introduce a per-arch efi/stub.h which stub.c would
>>> include at a suitable position (and which right now would be empty for
>>> Arm)?
>>
>> That seems to be possible. But how is it better than having two
>> different source file? The only thing is to avoid exporting the
>> efi_compat_* symbol aliases.
> 
> As said - I think they're wrong to have in Arm. But if Arm maintainers
> don't care about them being there, so be it. As long as they don't
> voice a view, I guess as the EFI maintainer I can sensibly ask for
> them to be avoided in a reasonably clean way.

AFAIU, the two aliases are using by the compat code. So how about 
protecting it with CONFIG_COMPAT (like we do for other compat code in 
common code)?

> 
>> The downside is we would have another weird
>> looking not really header which is actually just part of a source file.
>> At least, "stub.c" and "stub.h" would be two different names, we just
>> change the extension rather than the basename.
> 
> Whether that's "weird" is certainly a matter of taste ... To me,
> common-stub.c also comes close  to "weird", fwiw. But as I've tried
> to express, if I'm the only one disliking common-stub.c, then please
> ignore my view and I'll nevertheless ack the resulting patch. (That
> said, I view the vpath issue causing the problem as really the one
> that would want tackling. There shouldn't be a requirement for
> files to have different names as long as they live in different
> directories.)

So I agree with Anthony here. I think the approach we use for 
boot.c/efi-boot.h should not be promoted.

I also agree that "common-stub.c" sounds weird. But it would require 
some change in the build system (I always find a bit string we are using 
linking) which is likely too late for 4.17.

So I would be fine with stub-common.c and then protect the alias with 
#ifdef CONFIG_COMPAT.

Cheers,

-- 
Julien Grall

