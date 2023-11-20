Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10C7F1050
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 11:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636537.992117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51VA-0007pZ-Mb; Mon, 20 Nov 2023 10:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636537.992117; Mon, 20 Nov 2023 10:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r51VA-0007nJ-K0; Mon, 20 Nov 2023 10:27:36 +0000
Received: by outflank-mailman (input) for mailman id 636537;
 Mon, 20 Nov 2023 10:27:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r51V8-0007ka-Tg
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 10:27:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r51V8-0003q8-8I; Mon, 20 Nov 2023 10:27:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r51V8-0005dL-2f; Mon, 20 Nov 2023 10:27:34 +0000
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
	bh=b9WTyREGn44df4ZwnXmPPUTdHDU1YuvZ6ZCGIAOV4tI=; b=orlSzS97+M2EQur+DZQ8HtG02d
	RT2dApcNOCY7RfV7dpmh/ggrKEgmimV9CgAS1ksbJWD5Ctik2iQDUVcm1ufZ+zDbac3U+tKGvBloU
	qE4jhdZfUAVM70l6292HM40rEwpLMIr/Ack8AdLoa3xLw5m6FEiTs/6IUwjsBG02I2r0=;
Message-ID: <f14ac7c8-0584-40ea-ad7a-2f3c6c7692b2@xen.org>
Date: Mon, 20 Nov 2023 10:27:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b193825385eae75ae320ab7d8c7f63b61c8c8786.1700125246.git.nicola.vetrini@bugseng.com>
 <991883873b73e644ccaf8114a80331c0@bugseng.com>
 <40a3918e-730f-48b9-924f-d8707b197e14@xen.org>
 <c4ff5ecc8f4e11cae4a8e282d87c4e14@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c4ff5ecc8f4e11cae4a8e282d87c4e14@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicola,

On 20/11/2023 08:39, Nicola Vetrini wrote:
> On 2023-11-17 20:15, Julien Grall wrote:
>> Hi Nicola,
>>
>> On 16/11/2023 09:15, Nicola Vetrini wrote:
>>> On 2023-11-16 10:08, Nicola Vetrini wrote:
>>>> The comment-based justifications for MISRA C:2012 Rule 8.4 are replaced
>>>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>>>
>>>> Add missing 'xen/compiler.h' #include-s where needed.
>>>>
>>>> The text in docs/misra/deviations.rst and docs/misra/safe.json
>>>> is modified to reflect this change.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> This patch should be applied after patch 2 of this series.
>>>> The request made by Julien to update the wording is
>>>> contained in the present patch.
>>>> https://lore.kernel.org/all/9ad7f6210c15f520297aac00e8af0e64@bugseng.com/
>>>>
>>>> Concerns about efi_multiboot2 will be dealt with separately.
>>>>
>>>> Changes in v2:
>>>> - Edit safe.json.
>>>> - Remove mention of SAF-1-safe in deviations.rst.
>>>> Changes in v3:
>>>> - Sorted #include-s and rebased against
>>>> 7ad0c774e474 ("x86/boot: tidy #include-s")
>>>> ---
>>>>  docs/misra/deviations.rst   |  5 ++---
>>>>  docs/misra/safe.json        |  2 +-
>>>>  xen/arch/arm/cpuerrata.c    |  7 +++----
>>>>  xen/arch/arm/setup.c        |  5 ++---
>>>>  xen/arch/arm/smpboot.c      |  3 +--
>>>>  xen/arch/arm/traps.c        | 21 +++++++--------------
>>>>  xen/arch/x86/boot/cmdline.c |  5 +++--
>>>>  xen/arch/x86/boot/reloc.c   |  6 +++---
>>>>  xen/arch/x86/extable.c      |  3 +--
>>>>  xen/arch/x86/setup.c        |  3 +--
>>>>  xen/arch/x86/traps.c        | 27 +++++++++------------------
>>>>  xen/common/efi/boot.c       |  5 ++---
>>>>  12 files changed, 35 insertions(+), 57 deletions(-)
>>>>
>>>
>>> In hindsight I should have added an
>>>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>
>>> given that the comment has been addressed in my opinion.
>>
>> I am a bit confused how you considered it was addressed. I see no 
>> update in safe.json when I clearly asked for some (I wouldn't have 
>> bothered to comment in v2 otherwise and just gave an ack).
>>
> 
> I did update safe.json like so:
> 
> -            "text": "Functions and variables used only by asm modules 
> do not need to have a visible declaration prior to their definition."
> +            "text": "Not used anymore."
> 
> but given what you wrote below, maybe you wanted this in the series [1], 
> right?

No. In series [1], we still need a proper description for SAF-1 as there 
are still some use in the codebase. So it was correct to have this hunk 
in this series.

What I was asking in series [1], it to reword:

+     - Functions and variables used only by asm modules are either 
marked with
+       the `asmlinkage` macro or with a SAF-1-safe textual deviation
+       (see safe.json).


to something like:

- Functions and variables used only by asm modules are marked with the 
`asmlinkage macro``. This may also be marked with the now deprecated 
SAF-1-safe textual deviation (see safe.json).

> 
>> To be explicit, I requested to:
>>   1. update the description in [2] to clarify that SAF-1 is deprecated.
>>   2. This patch is rebased on top and therefore remove completely the 
>> mention of SAF-1.
>>
>> I am well-aware that the end result is technically the same. But 
>> patches are meant to be self-contained so if we revert the latest, 
>> then the meaning is still the same.
>>
>> This patch is unlikely to be removed and this is now the nth time I 
>> asked it the same (maybe it was not clear enough?). So I am going to 
>> content with the current proposal because this is not worth to go 
>> further. But I will at least express my discontent how this is handled.
>>
> 
> I misunderstood your previous comments then. When you commented on v2 I 
> surmised that you were ok with this patch condensing all the shuffling. 
> Clearly this was not the case, but I also want to point out that. Given 
> that [2] hasn't been committed yet either, then I can do what you asked.

No need for this time.

Cheers,

-- 
Julien Grall

