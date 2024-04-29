Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1AE8B57E9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 14:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714036.1115000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PxU-0007Kd-Jy; Mon, 29 Apr 2024 12:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714036.1115000; Mon, 29 Apr 2024 12:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PxU-0007J5-H7; Mon, 29 Apr 2024 12:18:12 +0000
Received: by outflank-mailman (input) for mailman id 714036;
 Mon, 29 Apr 2024 12:18:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPPc=MC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1PxT-0007Iz-7L
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 12:18:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a2789b4-0622-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 14:18:09 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 739B84EE0738;
 Mon, 29 Apr 2024 14:18:08 +0200 (CEST)
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
X-Inumbo-ID: 8a2789b4-0622-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Mon, 29 Apr 2024 14:18:08 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, julien@xen.org, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 03/10] automation/eclair_analysis: deviate macro
 count_args_ for MISRA Rule 20.7
In-Reply-To: <alpine.DEB.2.22.394.2404241727520.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <7de407c218f0911e28b7c3f609a55636165166a8.1713885065.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2404241727520.3940@ubuntu-linux-20-04-desktop>
Message-ID: <5b675fcdf688723bc6d4ea260d10004e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-25 02:28, Stefano Stabellini wrote:
> On Tue, 23 Apr 2024, Nicola Vetrini wrote:
>> The count_args_ macro violates Rule 20.7, but it can't be made
>> compliant with Rule 20.7 without breaking its functionality. Since
>> it's very unlikely for this macro to be misused, it is deviated.
> 
> That is OK but can't we use the SAF- framework to do it, given that it
> is just one macro?
> 
> If not, this is also OK.
> 
> 

It would be more fragile, for no substantial gain

>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>>  docs/misra/deviations.rst                        | 6 ++++++
>>  2 files changed, 12 insertions(+)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index d21f112a9b94..c17e2f5a0886 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -445,6 +445,12 @@ not to parenthesize their arguments."
>>  -config=MC3R1.R20.7,reports+={safe, 
>> "any_area(any_loc(any_exp(macro(^alternative_(v)?call[0-9]$))))"}
>>  -doc_end
>> 
>> +-doc_begin="The argument 'x' of the count_args_ macro can't be 
>> parenthesized as
>> +the rule would require, without breaking the functionality of the 
>> macro. The uses
>> +of this macro do not lead to developer confusion, and can thus be 
>> deviated."
>> +-config=MC3R1.R20.7,reports+={safe, 
>> "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>> +-doc_end
>> +
>>  -doc_begin="Uses of variadic macros that have one of their arguments 
>> defined as
>>  a macro and used within the body for both ordinary parameter 
>> expansion and as an
>>  operand to the # or ## operators have a behavior that is 
>> well-understood and
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index ed0c1e8ed0bf..e228ae2e715f 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -371,6 +371,12 @@ Deviations related to MISRA C:2012 Rules:
>>         sanity checks in place.
>>       - Tagged as `safe` for ECLAIR.
>> 
>> +   * - R20.7
>> +     - The macro `count_args_` is not compliant with the rule, but is 
>> not likely
>> +       to incur in the risk of being misused or lead to developer 
>> confusion, and
>> +       refactoring it to add parentheses breaks its functionality.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>>     * - R20.12
>>       - Variadic macros that use token pasting often employ the gcc 
>> extension
>>         `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, 
>> which is
>> --
>> 2.34.1
>> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

