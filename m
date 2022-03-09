Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201EB4D2DF3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:29:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287761.487939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuUq-0002RH-FB; Wed, 09 Mar 2022 11:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287761.487939; Wed, 09 Mar 2022 11:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuUq-0002Oa-BF; Wed, 09 Mar 2022 11:28:48 +0000
Received: by outflank-mailman (input) for mailman id 287761;
 Wed, 09 Mar 2022 11:28:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRuUo-0002OU-2r
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:28:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuUn-0002tI-9o; Wed, 09 Mar 2022 11:28:45 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.155.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuUn-0005V0-2a; Wed, 09 Mar 2022 11:28:45 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=/hyHObLT4O9gy2Yv+db9HU+L/wJn3ggWRdnCkxPX4iw=; b=sBB/Wl/pfbYMcY8ps2/Ei0/5PC
	zXV5vmpj3+unVLtVw9EmGQ0KmX3jBK7aUvGcmrpmZGbdBqGXGhtrqvBTIh03A6ZUJLQ4vGC2Kz399
	kF54tARBztJWgQEoLdRagas1lpGza4z5Z7vNYvQnh9TnsgTgE20lIWLpLO26XaLKDe8E=;
Message-ID: <18d7c9a9-fec6-f430-dd81-863247ceba7e@xen.org>
Date: Wed, 9 Mar 2022 11:28:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 27/36] xen/arch: add coloring support for Xen
From: Julien Grall <julien@xen.org>
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-28-marco.solieri@minervasys.tech>
 <d6216110-7cf0-b647-8a5d-ec5f8f437941@xen.org>
In-Reply-To: <d6216110-7cf0-b647-8a5d-ec5f8f437941@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/03/2022 19:47, Julien Grall wrote:
> On 04/03/2022 17:46, Marco Solieri wrote:
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> Introduce a new implementation of setup_pagetables that uses coloring
>> logic in order to isolate Xen code using its color selection.
>> Page tables construction is essentially copied, except for the xenmap
>> table, where coloring logic is needed.  Given the absence of a contiguous
>> physical mapping, pointers to next level tables need to be manually
>> calculated.
> 
> The implementation of setup_pagetables() is not compliant to the Arm 
> Arm. And I have plan to completely get rid of it.
> 
> The main part that is not compliant is switch_ttbr() because it keeps 
> the MMU on. We should switch the MMU off, update the TTBR and then 
> switch on the MMU. This implies that we need an identity mapping of the 
> part of Xen that will run with MMU off.
> 
> I understand that rebuilding the page-tables and therefore switching the 
> TTBR will be necessary for cache coloring. So before any new use, I 
> would like the implementation of switch_ttbr() to be fixed.
> 
> What we will need to do is find space in the virtual layout that also 
> match a physical address. With that in place, we could use the mapping 
> to switch between TTBR.

I have posted an early RFC [1] to reshuffle the memory layout on Arm so 
we have space to for the identity mapping. I have also reworked 
switch_ttbr() to turn off/on the MMU before/after updating the TTBR.

The series should work on arm64. The arm32 effort requires a bit more 
effort as we have less virtual space.

I haven't killed setup_pagetables() yet so you have a base to write the 
cache coloring version. There may be also some tweak necessary for cache 
coloring (e.g. flush the instruction cache).

Cheers,

[1] https://lore.kernel.org/xen-devel/20220309112048.17377-1-julien@xen.org/

-- 
Julien Grall

