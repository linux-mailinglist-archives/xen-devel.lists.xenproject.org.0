Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F578D69E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593019.925906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMTp-0004Sn-9t; Wed, 30 Aug 2023 14:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593019.925906; Wed, 30 Aug 2023 14:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMTp-0004PX-6Z; Wed, 30 Aug 2023 14:47:37 +0000
Received: by outflank-mailman (input) for mailman id 593019;
 Wed, 30 Aug 2023 14:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtsd=EP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbMTn-0004PR-Ng
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:47:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26b7e2d6-4744-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:47:33 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.38.20.102])
 by support.bugseng.com (Postfix) with ESMTPSA id 6E1294EE0738;
 Wed, 30 Aug 2023 16:47:31 +0200 (CEST)
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
X-Inumbo-ID: 26b7e2d6-4744-11ee-9b0d-b553b5be7939
Message-ID: <04f03604-e788-0d76-1ae8-8bb74c6b4c7a@bugseng.com>
Date: Wed, 30 Aug 2023 16:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 05/13] automation/eclair: add deviation for usercopy.c
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, nicola.vetrini@bugseng.com, Bertrand.Marquis@arm.com,
 Luca.Fancellu@arm.com, michal.orzel@amd.com
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <4039623dc4341758f383ec49228c1e55e5862b0f.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2308281512360.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/08/23 00:27, Stefano Stabellini wrote:
> +Nicola, Luca
> 
> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>> xen/arch/x86/usercopy.c includes itself, so it is not supposed to
>> comply with Directive 4.10:
>> "Precautions shall be taken in order to prevent the contents of a
>> header file being included more than once"
>>
>> This patch adds a deviation for the file.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>>   docs/misra/rules.rst                             | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 2681a4cff5..a7d4f29b43 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -96,6 +96,10 @@ conform to the directive."
>>   -config=MC3R1.D4.10,reports+={safe, "first_area(text(^ \\* In this case, no inclusion guards apply and the caller is responsible.*\\*/$, begin-1))"}
>>   -doc_end
>>   
>> +-doc_begin="xen/arch/x86/usercopy.c includes itself: it is not supposed to comply with the directive"
>> +-config=MC3R1.D4.10,reports+={deliberate, "all_area(all_loc(file("^xen/arch/x86/usercopy\\.c$")))"}
>> +-doc_end
>> +
>>   #
>>   # Series 5.
>>   #
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index 4b1a7b02b6..45e13d0302 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -62,6 +62,8 @@ maintainers if you want to suggest a change.
>>        - Files that are intended to be included more than once do not need to
>>          conform to the directive. Files that explicitly avoid inclusion guards
>>          under specific circumstances do not need to conform the directive.
>> +       xen/arch/x86/usercopy.c includes itself: it is not supposed to comply
>> +       with the directive.
> 
> 
> We need to find a consistent way to document this kind of deviations in
> a non-ECLAIR specific way, without adding the complete list of
> deviations to rules.rst.
> 
> Can we use safe.json and add an in-code comment at the top of
> usercopy.c? E.g.:
> 
> diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
> index b8c2d1cc0b..8bb591f472 100644
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -1,3 +1,4 @@
> +/* SAF-1-safe */
>   /*
>    * User address space access functions.
>    *
>  > Otherwise, maybe we should extend safe.json to also have an extra field
> with a list of paths. For instance see "files" below >
> {
>      "version": "1.0",
>      "content": [
>          {
>              "id": "SAF-0-safe",
>              "analyser": {
>                  "eclair": "MC3R1.R8.6",
>                  "coverity": "misra_c_2012_rule_8_6_violation"
>              },
>              "name": "Rule 8.6: linker script defined symbols",
>              "text": "It is safe to declare this symbol because it is defined in the linker script."
>          },
>          {
>              "id": "SAF-1-safe",
>              "analyser": {
>                  "eclair": "MC3R1.D4.10"
>              },
>              "name": "Dir 4.10: files that include themselves",
>              "text": "Files purposely written to include themselves are not supposed to comply with D4.10.",
>              "files": ["xen/arch/x86/usercopy.c"]
>          },
>          {
>              "id": "SAF-2-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
>          }
>      ]
> }
> 
In general, I prefer the first option for such ad hoc deviation (the 
comment at the beginning of the file): this way, anyone who touches the 
file will immediately see the comment and think as its changes will 
affect the deviation (is it still safe? is it still necessary?).

To help the developer more, I think it is better to also add the "name" 
in the comment, this is my proposal:

/* SAF-4-safe Dir 4.10: files that include themselves*/
/*
  * User address space access functions.
  *
  * Copyright 1997 Andi Kleen <ak@muc.de>
  * Copyright 1997 Linus Torvalds
  * Copyright 2002 Andi Kleen <ak@suse.de>
  */

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


