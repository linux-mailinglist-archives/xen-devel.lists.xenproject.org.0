Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA7A351FB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 00:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888188.1297585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiiGm-0008Uu-NP; Thu, 13 Feb 2025 23:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888188.1297585; Thu, 13 Feb 2025 23:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiiGm-0008Rs-KB; Thu, 13 Feb 2025 23:05:20 +0000
Received: by outflank-mailman (input) for mailman id 888188;
 Thu, 13 Feb 2025 23:05:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ooB=VE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tiiGk-0008Qq-L4
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 23:05:18 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbc16f76-ea5e-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 00:05:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A47648287720;
 Thu, 13 Feb 2025 17:05:13 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DIZw8nu7GwaV; Thu, 13 Feb 2025 17:05:12 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1D50A8288227;
 Thu, 13 Feb 2025 17:05:12 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BGeL7N69RWz0; Thu, 13 Feb 2025 17:05:11 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 895588287720;
 Thu, 13 Feb 2025 17:05:06 -0600 (CST)
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
X-Inumbo-ID: fbc16f76-ea5e-11ef-9aa4-95dc52dad729
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1D50A8288227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1739487912; bh=W0bSl6md3YStSTr8KBrFMkhJwPvAPsHuF+FBOd4jIeI=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=INUOYhfbNi7IlVwSzcUtKexddfLg9SATcXSe9s7FEUYYw8lbirarsxest7cWgk41t
	 k/SL+t9Qd1IzAKnMZpU0dJP8Rvz7nAeUOnHA0gwaH3xn0D5Hq4Uv7Zl7+qA6NYxeWp
	 ea1CYGxRXnS6Lia2ocjLjauSXjNPenVZ8/Pvnwj8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a6abb79a-6d98-4cb5-ba45-4530ea30735e@raptorengineering.com>
Date: Thu, 13 Feb 2025 17:05:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/mm: Introduce per-arch pte_attr_t type for PTE
 flags
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <2b7f3e29fc1790978e2f615ee634f3a84bc340c9.1738789214.git.sanastasio@raptorengineering.com>
 <5a0e26ff-21fa-44c8-a1b2-3775e3ba00d9@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <5a0e26ff-21fa-44c8-a1b2-3775e3ba00d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 2/6/25 6:29 AM, Jan Beulich wrote:
> On 05.02.2025 22:02, Shawn Anastasio wrote:
>> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
>> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
>> represent architecture-dependent page table entry flags. This assumption
>> is not well-suited for PPC/radix where some flags go past 32-bits, so
>> introduce the pte_attr_t type to allow architectures to opt in to larger
>> types to store PTE flags.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>> Changes in v2:
>>   - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
>>   opt-in to defining the type.
>>   - Move default pte_attr_definition to xen/types.h
> 
> I'm unconvinced of types.h being an appropriate place for something mm-
> related. mm-types.h maybe?
> 

This sounds reasonable (and re your follow-up -- for now the file should
only need to be included in xen/vmap.h, xen/mm.h and so on. Definitely
no need to include it in types.h).

>>   - Update commit message to reflect that this change isn't strictly
>>   necessary for arches w/ >32bit pte flags
> 
> I can't seem to be able to associate this with anything in the commit
> message. The comment here to me reads as if this was optional (but then
> for arches with <=32-bit PTE flags), yet in the description I can't spot
> anything to the same effect. Recall that it was said before that on x86
> we also have flags extending beyond bit 31, just that we pass them
> around in a compacted manner (which, as Andrew has been suggesting, may
> be undue extra overhead).
>

Admittedly the change was subtle, but I changed the wording in the
commit message as follows:

- This assumption does not work on PPC/radix where some flags go past
  32-bits, so [...]
+ This assumption is not well-suited for PPC/radix where some flags go
  past 32-bits, so [...]


The softening of "does not work" to "is not well-suited" was meant to
address your earlier comment and clarify that the change is not strictly
necessary. Though as you and Andrew pointed out x86_64 is able to make
do with the 32 bits, I would still argue that the hardcoded `unsigned
int` flags type is still not well-suited to that application.

> Jan

Thanks,
Shawn

