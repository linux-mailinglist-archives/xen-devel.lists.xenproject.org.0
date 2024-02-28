Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B786BB65
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 23:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686814.1069325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfStB-0000dp-4P; Wed, 28 Feb 2024 22:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686814.1069325; Wed, 28 Feb 2024 22:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfStB-0000bE-1L; Wed, 28 Feb 2024 22:59:01 +0000
Received: by outflank-mailman (input) for mailman id 686814;
 Wed, 28 Feb 2024 22:58:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfSt9-0000b8-Cc
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 22:58:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfSt7-0005Gd-G6; Wed, 28 Feb 2024 22:58:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfSt7-0005dJ-AV; Wed, 28 Feb 2024 22:58:57 +0000
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
	bh=53vrm0Ud7rmFbogaJsCW2UgFz1QgmxpZIY5PWAqI8+k=; b=UvoyBCqogSbdWea3gCbFosm03P
	Gz+vPW8bSs3rW3aVUHTj+7hW1rNdZEJtnyt+MJDvOecdwNaHzES0xVigWt3YJwkfPoP6UnEONTVIE
	WFdXce5BWUi1PZJrNrYnP7w/DWwCm5bFWckG/bENPG9T4LFF0qP/31CIXEswFdYs/c+4=;
Message-ID: <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
Date: Wed, 28 Feb 2024 22:58:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/02/2024 07:55, Jan Beulich wrote:
> On 26.02.2024 18:39, Oleksii Kurochko wrote:
>> This patch doesn't represent a strict lower bound for GCC and
>> GNU Binutils; rather, these versions are specifically employed by
>> the Xen RISC-V container and are anticipated to undergo continuous
>> testing.
> 
> Up and until that container would be updated to a newer gcc. I'm
> afraid I view this as too weak a criteria,

I disagree. We have to decide a limit at some point. It is sensible to 
say that we are only supporting what we can tests. AFAIK, this is what 
QEMU has been doing.

> but I'm also not meaning to
> stand in the way if somebody else wants to ack this patch in this form;
> my bare minimum requirement is now met.
> 
>> --- a/README
>> +++ b/README
>> @@ -48,6 +48,15 @@ provided by your OS distributor:
>>         - For ARM 64-bit:
>>           - GCC 5.1 or later
>>           - GNU Binutils 2.24 or later
>> +      - For RISC-V 64-bit:
>> +        - GCC 12.2 or later
>> +        - GNU Binutils 2.39 or later
>> +        This doesn't represent a strict lower bound for GCC and GNU Binutils;
>> +        rather, these versions are specifically employed by the Xen RISC-V
>> +        container and are anticipated to undergo continuous testing.
> 
> As per above, I think here it really needs saying "at the time of writing"
> or recording a concrete date. Furthermore I expect "these versions" relates
> to the specifically named versions and particularly _not_ to "or later":
> With the criteria you apply, using later versions (or in fact any version
> other than the very specific ones used in the container) would be similarly
> untested. Much like x86 and Arm don't have the full range of permitted
> tool chain versions continuously tested. Plus don't forget that distros may
> apply their own selection of patches on top of what they take from upstream
> (and they may also take random snapshots rather than released versions).

TBH, I think this should be dropped from the README. With the wording, 
it implies that older GCC would work, but this is not a guarantee.

The same for Arm, I suspect some revision of GCC below 5.1 that may 
work. But that's just convenience to list a lower limit.

With the sentence dropped, I would be happy to ack this patch.

> 
> IOW it is hard for me to see why RISC-V needs stronger restrictions here
> than other architectures. It ought to be possible to determine a baseline
> version. Even if taking the desire to have "pause" available as a
> requirement, gas (and presumably gld) 2.36.1 would already suffice.

I think we want to bump it on Arm. There are zero reasons to try to keep 
a lower versions if nobody tests/use it in production.

I would suggest to do the same on x86. What's the point of try to 
support Xen with a 15+ years old compiler?

Cheers,

-- 
Julien Grall

