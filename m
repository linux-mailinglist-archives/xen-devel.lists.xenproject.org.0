Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2F7F0DB1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 09:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636474.991987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zoB-000687-U4; Mon, 20 Nov 2023 08:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636474.991987; Mon, 20 Nov 2023 08:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zoB-00065t-RU; Mon, 20 Nov 2023 08:39:07 +0000
Received: by outflank-mailman (input) for mailman id 636474;
 Mon, 20 Nov 2023 08:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Am9Z=HB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r4zoB-00065n-59
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 08:39:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 437d802b-8780-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 09:39:05 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0BCCC4EE0739;
 Mon, 20 Nov 2023 09:39:05 +0100 (CET)
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
X-Inumbo-ID: 437d802b-8780-11ee-98df-6d05b1d4d9a1
MIME-Version: 1.0
Date: Mon, 20 Nov 2023 09:39:05 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <40a3918e-730f-48b9-924f-d8707b197e14@xen.org>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <991883873b73e644ccaf8114a80331c0@bugseng.com>
 <40a3918e-730f-48b9-924f-d8707b197e14@xen.org>
Message-ID: <c4ff5ecc8f4e11cae4a8e282d87c4e14@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-17 20:15, Julien Grall wrote:
> Hi Nicola,
> 
> On 16/11/2023 09:15, Nicola Vetrini wrote:
>> On 2023-11-16 10:08, Nicola Vetrini wrote:
>>> The comment-based justifications for MISRA C:2012 Rule 8.4 are 
>>> replaced
>>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>> 
>>> Add missing 'xen/compiler.h' #include-s where needed.
>>> 
>>> The text in docs/misra/deviations.rst and docs/misra/safe.json
>>> is modified to reflect this change.
>>> 
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> This patch should be applied after patch 2 of this series.
>>> The request made by Julien to update the wording is
>>> contained in the present patch.
>>> https://lore.kernel.org/all/9ad7f6210c15f520297aac00e8af0e64@bugseng.com/
>>> 
>>> Concerns about efi_multiboot2 will be dealt with separately.
>>> 
>>> Changes in v2:
>>> - Edit safe.json.
>>> - Remove mention of SAF-1-safe in deviations.rst.
>>> Changes in v3:
>>> - Sorted #include-s and rebased against
>>> 7ad0c774e474 ("x86/boot: tidy #include-s")
>>> ---
>>>  docs/misra/deviations.rst   |  5 ++---
>>>  docs/misra/safe.json        |  2 +-
>>>  xen/arch/arm/cpuerrata.c    |  7 +++----
>>>  xen/arch/arm/setup.c        |  5 ++---
>>>  xen/arch/arm/smpboot.c      |  3 +--
>>>  xen/arch/arm/traps.c        | 21 +++++++--------------
>>>  xen/arch/x86/boot/cmdline.c |  5 +++--
>>>  xen/arch/x86/boot/reloc.c   |  6 +++---
>>>  xen/arch/x86/extable.c      |  3 +--
>>>  xen/arch/x86/setup.c        |  3 +--
>>>  xen/arch/x86/traps.c        | 27 +++++++++------------------
>>>  xen/common/efi/boot.c       |  5 ++---
>>>  12 files changed, 35 insertions(+), 57 deletions(-)
>>> 
>> 
>> In hindsight I should have added an
>> 
>> Acked-by: Julien Grall <jgrall@amazon.com>
>> 
>> given that the comment has been addressed in my opinion.
> 
> I am a bit confused how you considered it was addressed. I see no 
> update in safe.json when I clearly asked for some (I wouldn't have 
> bothered to comment in v2 otherwise and just gave an ack).
> 

I did update safe.json like so:

-            "text": "Functions and variables used only by asm modules 
do not need to have a visible declaration prior to their definition."
+            "text": "Not used anymore."

but given what you wrote below, maybe you wanted this in the series [1], 
right?

> To be explicit, I requested to:
>   1. update the description in [2] to clarify that SAF-1 is deprecated.
>   2. This patch is rebased on top and therefore remove completely the 
> mention of SAF-1.
> 
> I am well-aware that the end result is technically the same. But 
> patches are meant to be self-contained so if we revert the latest, then 
> the meaning is still the same.
> 
> This patch is unlikely to be removed and this is now the nth time I 
> asked it the same (maybe it was not clear enough?). So I am going to 
> content with the current proposal because this is not worth to go 
> further. But I will at least express my discontent how this is handled.
> 

I misunderstood your previous comments then. When you commented on v2 I 
surmised that you were ok with this patch condensing all the shuffling. 
Clearly this was not the case, but I also want to point out that. Given 
that [2] hasn't been committed yet either, then I can do what you asked.

[2] 
https://lore.kernel.org/all/cover.1698829473.git.nicola.vetrini@bugseng.com/

> TBH, there are far too many MISRA patches on the ML spread across 
> multiple threads. Some are based on top of the others. This makes 
> extremely difficult to follow and know what is addressed or not. Can we 
> at least try to condense some of work in similar area in the same 
> series? For instance, this patch could have been included in the other 
> series [1].
> 
> Lastly, right now, I have 300 emails (31 threads) with MISRA in the 
> title in my inbox. It is a little unclear what has been 
> committed/review or require input. I am concerned to miss key series 
> (the patch to compile in docs/ was nearly missed).
> 
> Do we track anywhere which series are still inflights? Can we consider 
> to pause or at least slow down the rate of new MISRA patches until the 
> backlog is cleared? (Adding more patches is not really helping).
> 

I do have a folder with all my in-flight patches. Please note that this 
big backlog has partly been the result of patches being acked, but not 
committed. I'll double check with my colleagues Stefano's list in his 
reply, to see if there are any differences.

> Cheers,
> 
> [1] 
> https://lore.kernel.org/all/a1b5c3b273145c35535fed3647bf850d9ae5db7f.1698829473.git.nicola.vetrini@bugseng.com/
> 
> 
> I pointed out that the patch in
> 
>> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

