Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED18167D5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 09:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655689.1023400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8ex-0001mk-1S; Mon, 18 Dec 2023 08:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655689.1023400; Mon, 18 Dec 2023 08:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF8ew-0001ka-Ur; Mon, 18 Dec 2023 08:07:30 +0000
Received: by outflank-mailman (input) for mailman id 655689;
 Mon, 18 Dec 2023 08:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MePR=H5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rF8ev-0001kU-Ls
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 08:07:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b3a95b7-9d7c-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 09:07:26 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 828D64EE0741;
 Mon, 18 Dec 2023 09:07:25 +0100 (CET)
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
X-Inumbo-ID: 7b3a95b7-9d7c-11ee-9b0f-b553b5be7939
Message-ID: <180268ec-b3c3-43b6-a1ea-2f7262580621@bugseng.com>
Date: Mon, 18 Dec 2023 09:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <7b07ed4a2a87c2774b469eb0fa280c19f945b3a4.1702631924.git.federico.serafini@bugseng.com>
 <a011c39d-7154-47d3-8604-073bcabb645b@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <a011c39d-7154-47d3-8604-073bcabb645b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/12/23 08:42, Jan Beulich wrote:
> On 15.12.2023 10:26, Federico Serafini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -327,6 +327,34 @@ therefore have the same behavior of a boolean"
>>   -config=MC3R1.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
>>   -doc_end
>>   
>> +#
>> +# Series 16.
>> +#
>> +
>> +-doc_begin="Switch clauses ending with continue, goto, return statements are
>> +safe."
>> +-config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
>> +-doc_end
>> +
>> +-doc_begin="Switch clauses ending with a call to a function that does not give
>> +the control back are safe."
>> +-config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
>> +-doc_end
>> +
>> +-doc_begin="Switch clauses ending with pseudo-keyword \"fallthrough\" are
>> +safe."
>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/fallthrough;/))))"}
>> +-doc_end
>> +
>> +-doc_begin="Switch clauses ending with failure method \"BUG()\" are safe."
>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
>> +-doc_end
>> +
>> +-doc_begin="Switch clauses not ending with the break statement are safe if an
>> +explicit comment indicating the fallthrough intention is present."
>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>> +-doc_end
>> +
>>   #
>>   # Series 20.
>>   #
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -276,6 +276,34 @@ Deviations related to MISRA C:2012 Rules:
>>          therefore have the same behavior of a boolean.
>>        - Project-wide deviation; tagged as `deliberate` for ECLAIR.
>>   
>> +   * - R16.3
>> +     - Switch clauses ending with continue, goto, return statements are safe.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R16.3
>> +     - Switch clauses ending with a call to a function that does not give
>> +       the control back are safe.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R16.3
>> +     - Switch clauses ending with failure method \"BUG()\" are safe.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R16.3
>> +     - Existing switch clauses not ending with the break statement are safe if
>> +       an explicit comment indicating the fallthrough intention is present.
>> +       However, the use of such comments in new code is deprecated:
>> +       pseudo-keyword "fallthrough" shall be used.
>> +     - Tagged as `safe` for ECLAIR. The accepted comments are:
>> +         - /\* fall through \*/
>> +         - /\* fall through. \*/
>> +         - /\* fallthrough \*/
>> +         - /\* fallthrough. \*/
>> +         - /\* Fall through \*/
>> +         - /\* Fall through. \*/
>> +         - /\* Fallthrough \*/
>> +         - /\* Fallthrough. \*/
> 
> I was puzzled by there being 4 bullet points here, but 5 additions to the
> other file. I don't think the wording here is sufficiently unambiguous towards
> the use of the pseudo-keyword. If that's to remain a single bullet point, imo
> the pseudo-keyword needs mentioning first, and only the talk should be about
> comments as an alternative.

I'll send a v3 to include Stefano's observations and an
explicit bullet point for pseudo-keyword fallthrough.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

