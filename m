Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3782910810
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744731.1151837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIgL-0001s5-JX; Thu, 20 Jun 2024 14:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744731.1151837; Thu, 20 Jun 2024 14:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIgL-0001q6-F2; Thu, 20 Jun 2024 14:22:33 +0000
Received: by outflank-mailman (input) for mailman id 744731;
 Thu, 20 Jun 2024 14:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKIgJ-0001pz-52
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:22:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860bd7a9-2f10-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 16:22:28 +0200 (CEST)
Received: from [192.168.1.113] (93-36-220-117.ip62.fastwebnet.it
 [93.36.220.117])
 by support.bugseng.com (Postfix) with ESMTPSA id EFB504EE0738;
 Thu, 20 Jun 2024 16:22:27 +0200 (CEST)
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
X-Inumbo-ID: 860bd7a9-2f10-11ef-b4bb-af5377834399
Message-ID: <e1e2d30c-6dc1-420b-aa4f-456cba6fb605@bugseng.com>
Date: Thu, 20 Jun 2024 16:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/13] automation/eclair: consider also hypened
 fall-through
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1718892030.git.federico.serafini@bugseng.com>
 <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718892030.git.federico.serafini@bugseng.com>
 <af656be1-3950-45f3-9da9-f377d9e6396c@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <af656be1-3950-45f3-9da9-f377d9e6396c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/24 16:15, Jan Beulich wrote:
> On 20.06.2024 16:02, Federico Serafini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -400,7 +400,7 @@ safe."
>>   -doc_end
>>   
>>   -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
>> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all[ -]?through.? \\*/.*$,0..2))))"}
> 
> Is is a regex, isn't it? Doesn't the period also need escaping (or enclosing
> in square brackets)? (I realize it was like this before, but still.)

Yes, thanks for noticing.

> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -353,6 +353,10 @@ Deviations related to MISRA C:2012 Rules:
>>          However, the use of such comments in new code is deprecated:
>>          the pseudo-keyword "fallthrough" shall be used.
>>        - Tagged as `safe` for ECLAIR. The accepted comments are:
>> +         - /\* fall-through \*/
>> +         - /\* Fall-through. \*/
>> +         - /\* Fall-through \*/
>> +         - /\* fall-through. \*/
>>            - /\* fall through \*/
>>            - /\* fall through. \*/
>>            - /\* fallthrough \*/
> 
> Nit: Can the capital-F and non-capital-f variants please be next to each other?

Ok.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

