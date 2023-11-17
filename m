Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FC7EF7BA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 20:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635361.991241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r44Jr-0005er-G6; Fri, 17 Nov 2023 19:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635361.991241; Fri, 17 Nov 2023 19:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r44Jr-0005cx-DF; Fri, 17 Nov 2023 19:15:59 +0000
Received: by outflank-mailman (input) for mailman id 635361;
 Fri, 17 Nov 2023 19:15:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r44Jq-0005cr-Pb
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 19:15:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r44Jq-0006yl-0R; Fri, 17 Nov 2023 19:15:58 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r44Jp-0003xY-NY; Fri, 17 Nov 2023 19:15:57 +0000
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
	bh=ytkRD/PHoScSCragUN67/e3oTlxBIrr42n7Sb4Jzzfo=; b=obUsutDl5Gds1or78LbHD1s3Di
	kxfyeXCsox82Bl1dCym5bLYaFgUTu+8Q3ZaaK34wHhS1yjmH2iwQKDemumwRSRcsO+1UqbKMpYhJq
	+Y8CCVpTKrAv/gxuM1waFHebWMyVf9lnj/oIKnP296rmqy3T95TKFZlM9c0CX8ibOYgU=;
Message-ID: <40a3918e-730f-48b9-924f-d8707b197e14@xen.org>
Date: Fri, 17 Nov 2023 19:15:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <991883873b73e644ccaf8114a80331c0@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <991883873b73e644ccaf8114a80331c0@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicola,

On 16/11/2023 09:15, Nicola Vetrini wrote:
> On 2023-11-16 10:08, Nicola Vetrini wrote:
>> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>
>> Add missing 'xen/compiler.h' #include-s where needed.
>>
>> The text in docs/misra/deviations.rst and docs/misra/safe.json
>> is modified to reflect this change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This patch should be applied after patch 2 of this series.
>> The request made by Julien to update the wording is
>> contained in the present patch.
>> https://lore.kernel.org/all/9ad7f6210c15f520297aac00e8af0e64@bugseng.com/
>>
>> Concerns about efi_multiboot2 will be dealt with separately.
>>
>> Changes in v2:
>> - Edit safe.json.
>> - Remove mention of SAF-1-safe in deviations.rst.
>> Changes in v3:
>> - Sorted #include-s and rebased against
>> 7ad0c774e474 ("x86/boot: tidy #include-s")
>> ---
>>  docs/misra/deviations.rst   |  5 ++---
>>  docs/misra/safe.json        |  2 +-
>>  xen/arch/arm/cpuerrata.c    |  7 +++----
>>  xen/arch/arm/setup.c        |  5 ++---
>>  xen/arch/arm/smpboot.c      |  3 +--
>>  xen/arch/arm/traps.c        | 21 +++++++--------------
>>  xen/arch/x86/boot/cmdline.c |  5 +++--
>>  xen/arch/x86/boot/reloc.c   |  6 +++---
>>  xen/arch/x86/extable.c      |  3 +--
>>  xen/arch/x86/setup.c        |  3 +--
>>  xen/arch/x86/traps.c        | 27 +++++++++------------------
>>  xen/common/efi/boot.c       |  5 ++---
>>  12 files changed, 35 insertions(+), 57 deletions(-)
>>
> 
> In hindsight I should have added an
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> given that the comment has been addressed in my opinion.

I am a bit confused how you considered it was addressed. I see no update 
in safe.json when I clearly asked for some (I wouldn't have bothered to 
comment in v2 otherwise and just gave an ack).

To be explicit, I requested to:
   1. update the description in [1] to clarify that SAF-1 is deprecated.
   2. This patch is rebased on top and therefore remove completely the 
mention of SAF-1.

I am well-aware that the end result is technically the same. But patches 
are meant to be self-contained so if we revert the latest, then the 
meaning is still the same.

This patch is unlikely to be removed and this is now the nth time I 
asked it the same (maybe it was not clear enough?). So I am going to 
content with the current proposal because this is not worth to go 
further. But I will at least express my discontent how this is handled.

TBH, there are far too many MISRA patches on the ML spread across 
multiple threads. Some are based on top of the others. This makes 
extremely difficult to follow and know what is addressed or not. Can we 
at least try to condense some of work in similar area in the same 
series? For instance, this patch could have been included in the other 
series [1].

Lastly, right now, I have 300 emails (31 threads) with MISRA in the 
title in my inbox. It is a little unclear what has been committed/review 
or require input. I am concerned to miss key series (the patch to 
compile in docs/ was nearly missed).

Do we track anywhere which series are still inflights? Can we consider 
to pause or at least slow down the rate of new MISRA patches until the 
backlog is cleared? (Adding more patches is not really helping).

Cheers,

[1] 
https://lore.kernel.org/all/a1b5c3b273145c35535fed3647bf850d9ae5db7f.1698829473.git.nicola.vetrini@bugseng.com/ 


I pointed out that the patch in

> 

-- 
Julien Grall

