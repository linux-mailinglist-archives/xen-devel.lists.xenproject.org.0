Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422A5A046C6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866663.1277997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCeh-00031e-Uo; Tue, 07 Jan 2025 16:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866663.1277997; Tue, 07 Jan 2025 16:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCeh-0002zP-Qh; Tue, 07 Jan 2025 16:42:11 +0000
Received: by outflank-mailman (input) for mailman id 866663;
 Tue, 07 Jan 2025 16:42:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tVCeg-0002zH-EV
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:42:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tVCef-009TPl-1C;
 Tue, 07 Jan 2025 16:42:09 +0000
Received: from [2a02:8012:3a1:0:40aa:4b3a:22f9:bcb7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tVCef-004ajM-0s;
 Tue, 07 Jan 2025 16:42:09 +0000
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
	bh=S57niDSYYUwVQGXv0nYCnmsDD/aO/iUB+pBNjZ3Ts+g=; b=dxWigbXX+k3KkK3trEFHQSNp6T
	U3/0NsKzfyoQPOY8RvUc0GGsNWtna8GtozL/eoH7xGfsEirm8IFK0PSiv7CGFz7Bd/OqpiQ2hB7Cm
	XrK5whjnm4ftbRum1kxn3/LEhk32RAqeiy5w8ZjQJ2eZiNwb4jEX8GTmISwxUIwoWR0w=;
Message-ID: <0062e0cf-0830-4d16-942d-348e6d33a2c4@xen.org>
Date: Tue, 7 Jan 2025 16:42:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [for-4.20] Re: [PATCH v12 12/12] xen/arm: add cache coloring support
 for Xen image
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech,
 marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Oleksii <oleksii.kurochko@gmail.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
 <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 16/12/2024 14:36, Jan Beulich wrote:
> On 16.12.2024 15:28, Carlo Nonato wrote:
>> On Mon, Dec 16, 2024 at 2:56 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>>> @@ -1,6 +1,7 @@
>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>
>>>>   #include <xen/init.h>
>>>> +#include <xen/llc-coloring.h>
>>>>   #include <xen/mm.h>
>>>>   #include <xen/pfn.h>
>>>>
>>>> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
>>>>   }
>>>>
>>>>   extern void switch_ttbr_id(uint64_t ttbr);
>>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>>
>>>>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>>> +
>>>> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
>>> CODING_STYLE: { needs to be on its own line
>>>
>>> Also, this function is only executed in case of LLC coloring, so shouldn't it
>>> be #ifdef protected.
>>
>> Here and in other places (patch #8) I'm relying on DCE to remove functions
>> that are not called. This was a suggestion from Jan in that patch. Can we
>> adopt the same here?
> 
> Yet how would the compiler spot that the function is unused? That would only
> work with LTO / WPO. DCE (as I did suggest elsewhere) requires the functions
> in question to be static (allowing the compiler to see enough of the whole
> picture).

Sorry for the late answer. I was away with limited e-mail access. While 
looking what was committing recently, I noticed that a dummy function 
was introduced:

void __init relocate_and_switch_ttbr(uint64_t ttbr) {}

If a function is not supposed to be called, then it should contain a 
BUG_ON() to catch any misusage. Otherwise, this is a recipe for 
disaster. In this case, it would not be trivial to notice the TTBR was 
not switched...

That said I would have actually considered to remove the empty stub. I 
am a bit surprised that DCE wouldn't work in this case because the call 
is protected with "if ( llc_coloring_enabled )". When cache coloring is 
not enabled, this would turn to an "if ( false )" and therefore all the 
code should be removed. What did I miss?

Note that this is what we already rely on for arm32 because there is no 
stub... So if this is problem then we definitely need to fix it on arm32 
as well...

IOW, we either introduce a stub (including the BUG_ON) for both arm32 
and arm64 in the header or we remove the stub completely.

Marco, Michal, can you have a look? Ideally, this should be fixed for 4.20.

Cheers,

-- 
Julien Grall


