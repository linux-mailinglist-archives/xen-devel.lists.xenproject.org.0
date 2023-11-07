Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D37E36BF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 09:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628616.980246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0HZS-0001qt-Ko; Tue, 07 Nov 2023 08:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628616.980246; Tue, 07 Nov 2023 08:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0HZS-0001of-HM; Tue, 07 Nov 2023 08:36:26 +0000
Received: by outflank-mailman (input) for mailman id 628616;
 Tue, 07 Nov 2023 08:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0HZQ-0001oW-CW
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 08:36:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba1e10eb-7d48-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 09:36:21 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 86CC84EE0C81;
 Tue,  7 Nov 2023 09:36:15 +0100 (CET)
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
X-Inumbo-ID: ba1e10eb-7d48-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 09:36:15 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH][for-4.19] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <ef60f721-f784-4595-8866-e1c57da7e48f@xen.org>
References: <334b360fada7177e0b6e074fbdd33e02ce186b8f.1699034672.git.nicola.vetrini@bugseng.com>
 <ef60f721-f784-4595-8866-e1c57da7e48f@xen.org>
Message-ID: <bb40675e3372abf264dcd63d0d64d476@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-06 23:57, Julien Grall wrote:
> Hi Nicola,
> 
> On 03/11/2023 18:05, Nicola Vetrini wrote:
>> The comment-based justifications for MISRA C:2012 Rule 8.4 are 
>> replaced
>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>> The deviation with a comment based on the SAF framework is also
>> mentioned as a last resort.
> 
> I don't see any reason to keep SAF-1 after this patch. So can this be 
> removed?
> 

In documenting-violations.rst it's stated:
"Entries in the database shall never be removed, even if they are not 
used
anymore in the code (if a patch is removing or modifying the faulty 
line).
This is to make sure that numbers are not reused which could lead to 
conflicts
with old branches or misleading justifications."

that's why I kept SAF-1 in the safe.json file and added the remark about 
it
being a last resort. I am ok with that remark becoming not to use SAF-1 
in new code
at all (I probably didn't go back to check your reply when writing the 
patch).

>> 
>> Add missing 'xen/compiler.h' #include-s where needed.
>> 
>> The text in docs/misra/deviations.rst is modified to reflect this 
>> change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>   docs/misra/deviations.rst   |  6 +++---
>>   xen/arch/arm/cpuerrata.c    |  7 +++----
>>   xen/arch/arm/setup.c        |  5 ++---
>>   xen/arch/arm/smpboot.c      |  3 +--
>>   xen/arch/arm/traps.c        | 21 +++++++--------------
>>   xen/arch/x86/boot/cmdline.c |  5 +++--
>>   xen/arch/x86/boot/reloc.c   |  7 ++++---
>>   xen/arch/x86/extable.c      |  3 +--
>>   xen/arch/x86/setup.c        |  3 +--
>>   xen/arch/x86/traps.c        | 27 +++++++++------------------
>>   xen/common/efi/boot.c       |  5 ++---
>>   11 files changed, 36 insertions(+), 56 deletions(-)
>> 
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index d468da2f5ce9..ed5d36c08647 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -134,9 +134,9 @@ Deviations related to MISRA C:2012 Rules:
>>        - Tagged as `safe` for ECLAIR.
>>        * - R8.4
>> -     - Functions and variables used only by asm modules are either 
>> marked with
>> -       the `asmlinkage` macro or with a SAF-1-safe textual deviation
>> -       (see safe.json).
> 
> I thought we agreed to a different wording [1]. So is this really based 
> on last version?
> 
>> +     - Functions and variables used only to interface with asm 
>> modules should
>> +       be marked with the `asmlinkage` macro. If that's not possible, 
>> consider
>> +       using the SAF-1-safe textual deviation (see safe.json).
> 
> See above. Actually, I am a bit surprised that SAF-1 is still mentioned 
> given that I have now requested multiple that it should be removed and 
> I haven't yet seen a reason to keep it.
> 
> Cheers,
> 
> [1] 
> https://lore.kernel.org/all/b914ac93-2499-4bfd-a60a-51a9f1c170ec@xen.org/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

