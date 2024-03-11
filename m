Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCE987842E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 16:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691531.1077563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjhta-0006PB-Qi; Mon, 11 Mar 2024 15:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691531.1077563; Mon, 11 Mar 2024 15:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjhta-0006NJ-O0; Mon, 11 Mar 2024 15:48:58 +0000
Received: by outflank-mailman (input) for mailman id 691531;
 Mon, 11 Mar 2024 15:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpO+=KR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rjhtZ-0006ND-Ad
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 15:48:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddc294d0-dfbe-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 16:48:55 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id DDC404EE0C90;
 Mon, 11 Mar 2024 16:48:54 +0100 (CET)
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
X-Inumbo-ID: ddc294d0-dfbe-11ee-afdc-a90da7624cb6
MIME-Version: 1.0
Date: Mon, 11 Mar 2024 16:48:54 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen/compiler: deviate the inline macro for MISRA C
 Rule 20.4
In-Reply-To: <6e2c0cb6-89de-4429-8f43-c4687a26cefe@suse.com>
References: <d2b3ae062756a28a040a9553a4f0e621cfdeb5e0.1709885163.git.nicola.vetrini@bugseng.com>
 <6e2c0cb6-89de-4429-8f43-c4687a26cefe@suse.com>
Message-ID: <81b1e9adc87618865c0134fe069d41cf@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-11 08:32, Jan Beulich wrote:
> On 08.03.2024 09:10, Nicola Vetrini wrote:
>> Rule 20.4 states: "A macro shall not be defined with the same name
>> as a keyword".
>> 
>> Defining this macro with the same name as the inline keyword
>> allows for additionally checking that out-of-lined static inline
>> functions end up in the correct section while minimizing churn and
>> has a positive impact on the overall safety. See [1] for additional
>> context on the motivation of this deviation.
>> 
>> No functional change.
>> 
>> [1] 
>> https://lore.kernel.org/xen-devel/adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com/
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  docs/misra/safe.json       | 8 ++++++++
>>  xen/include/xen/compiler.h | 1 +
>>  2 files changed, 9 insertions(+)
>> 
>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>> index 952324f85cf9..a2bbacddf06a 100644
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -28,6 +28,14 @@
>>          },
>>          {
>>              "id": "SAF-3-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.R20.4"
>> +            },
>> +            "name": "MC3R1.R20.4: allow the augmentation of the 
>> inline keyword in some build configurations",
>> +            "text": "The definition of this macro named inline allows 
>> further checking in some build configurations that certain symbols end 
>> up in the right sections."
>> +        },
> 
> With this wording the ID isn't going to be re-usable anywhere else. 
> Even
> if the exact same reasoning would apply.
> 

What about

"name": "MC3R1.R20.4: allow the definition of a macro with the same name 
as a keyword in some special cases"

and

"text": "The definition of a macro with the same name as a keyword can 
be useful in certain configurations to improve the guarantees that can 
be provided by Xen. See docs/misra/deviations.rst for a precise 
rationale for all such cases.

and then..

>> +        {
>> +            "id": "SAF-4-safe",
>>              "analyser": {},
>>              "name": "Sentinel",
>>              "text": "Next ID to be used"
>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>> index 16d554f2a593..e3d9f9fb8e4b 100644
>> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -82,6 +82,7 @@
>>   * inline functions not expanded inline get placed in .init.text.
>>   */
>>  #include <xen/init.h>
>> +/* SAF-3-safe MISRA C Rule 20.4: define the inline macro to perform 
>> checks */
>>  #define inline inline __init
>>  #endif
> 
> I don't think the definition is "to perform checks"; it's rather to 
> make
> sure checking elsewhere wouldn't (seemingly) randomly fail. 'Override
> "inline" for section contents checks to pass when the compiler chooses
> not to inline a particular function' perhaps? Albeit that's getting
> long-ish, I fear.

put this message in deviations.rst

> 
> Jan

is this proposal more appealing?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

