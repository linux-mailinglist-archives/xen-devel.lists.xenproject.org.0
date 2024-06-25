Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D109915F16
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747268.1154627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM02x-00088k-34; Tue, 25 Jun 2024 06:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747268.1154627; Tue, 25 Jun 2024 06:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM02w-00086o-VR; Tue, 25 Jun 2024 06:52:54 +0000
Received: by outflank-mailman (input) for mailman id 747268;
 Tue, 25 Jun 2024 06:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9u5k=N3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sM02v-00086i-ES
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:52:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8af0402c-32bf-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 08:52:52 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EFE704EE0738;
 Tue, 25 Jun 2024 08:52:51 +0200 (CEST)
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
X-Inumbo-ID: 8af0402c-32bf-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Tue, 25 Jun 2024 08:52:51 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>, Doug Goldstein
 <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 1/6][RESEND] automation/eclair: address violations
 of MISRA C Rule 20.7
In-Reply-To: <alpine.DEB.2.22.394.2406201718140.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
 <af4b0512eb52be99e37c9c670f98967ca15c68ac.1718378539.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2406201718140.2572888@ubuntu-linux-20-04-desktop>
Message-ID: <4aa05e0f26f050363d9ed0401855e1bb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-21 02:18, Stefano Stabellini wrote:
> On Mon, 16 Jun 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses".
>> 
>> The helper macro bitmap_switch has parameters that cannot be 
>> parenthesized
>> in order to comply with the rule, as that would break its 
>> functionality.
>> Moreover, the risk of misuse due developer confusion is deemed not
>> substantial enough to warrant a more involved refactor, thus the macro
>> is deviated for this rule.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> If possible, I would prefer we used a SAF in-code comment deviation. If
> that doesn't work for any reason this patch is fine and I'd ack it.
> 

Would that be an improvement for safety in your opinion?

> 
>> ---
>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 447c1e6661d1..c2698e7074aa 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -463,6 +463,14 @@ of this macro do not lead to developer confusion, 
>> and can thus be deviated."
>>  -config=MC3R1.R20.7,reports+={safe, 
>> "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>>  -doc_end
>> 
>> +-doc_begin="The arguments of macro bitmap_switch macro can't be 
>> parenthesized as
>> +the rule would require, without breaking the functionality of the 
>> macro. This is
>> +a specialized local helper macro only used within the bitmap.h 
>> header, so it is
>> +less likely to lead to developer confusion and it is deemed better to 
>> deviate it."
>> +-file_tag+={xen_bitmap_h, "^xen/include/xen/bitmap\\.h$"}
>> +-config=MC3R1.R20.7,reports+={safe, 
>> "any_area(any_loc(any_exp(macro(loc(file(xen_bitmap_h))&&^bitmap_switch$))))"}
>> +-doc_end
>> +
>>  -doc_begin="Uses of variadic macros that have one of their arguments 
>> defined as
>>  a macro and used within the body for both ordinary parameter 
>> expansion and as an
>>  operand to the # or ## operators have a behavior that is 
>> well-understood and
>> --
>> 2.34.1
>> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

