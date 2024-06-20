Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E8910928
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744772.1151883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJFU-000820-17; Thu, 20 Jun 2024 14:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744772.1151883; Thu, 20 Jun 2024 14:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJFT-00080F-UA; Thu, 20 Jun 2024 14:58:51 +0000
Received: by outflank-mailman (input) for mailman id 744772;
 Thu, 20 Jun 2024 14:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKJFS-000806-II
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:58:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c5e908-2f15-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 16:58:49 +0200 (CEST)
Received: from [192.168.1.113] (93-36-220-117.ip62.fastwebnet.it
 [93.36.220.117])
 by support.bugseng.com (Postfix) with ESMTPSA id 8581B4EE0738;
 Thu, 20 Jun 2024 16:58:48 +0200 (CEST)
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
X-Inumbo-ID: 99c5e908-2f15-11ef-90a3-e314d9c70b13
Message-ID: <7f1256d8-6db4-4320-9bd4-c89ab5e68ce6@bugseng.com>
Date: Thu, 20 Jun 2024 16:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/13] automation/eclair: consider also hypened
 fall-through
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1718892030.git.federico.serafini@bugseng.com>
 <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718892030.git.federico.serafini@bugseng.com>
 <846a944c-13a6-4b38-915a-d29136a90c19@xen.org>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <846a944c-13a6-4b38-915a-d29136a90c19@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/06/24 16:39, Julien Grall wrote:
> Hi,
> 
> On 20/06/2024 15:02, Federico Serafini wrote:
>> Update ECLAIR configuration to deviate MISRA C Rule 16.3
>> using different version of hypened fall-through and search for
>> the comment for 2 lines after the last statement.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
>>   docs/misra/deviations.rst                        | 4 ++++
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index b8f9155267..b99a6b8a92 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -400,7 +400,7 @@ safe."
>>   -doc_end
>>   -doc_begin="Switch clauses ending with an explicit comment 
>> indicating the fallthrough intention are safe."
>> --config=MC3R1.R16.3,reports+={safe, 
>> "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? 
>> \\*/.*$,0..1))))"}
>> +-config=MC3R1.R16.3,reports+={safe, 
>> "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all[ -]?through.? 
>> \\*/.*$,0..2))))"}
>>   -doc_end
>>   -doc_begin="Switch statements having a controlling expression of 
>> enum type deliberately do not have a default case: gcc -Wall enables 
>> -Wswitch which warns (and breaks the build as we use -Werror) if one 
>> of the enum labels is missing from the switch."
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index 41cdfbe5f5..411e1fed3d 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -353,6 +353,10 @@ Deviations related to MISRA C:2012 Rules:
>>          However, the use of such comments in new code is deprecated:
>>          the pseudo-keyword "fallthrough" shall be used.
>>        - Tagged as `safe` for ECLAIR. The accepted comments are:
>> +         - /\* fall-through \*/
>> +         - /\* Fall-through. \*/
>> +         - /\* Fall-through \*/
>> +         - /\* fall-through. \*/
> 
> How many places use the 4 above? The reason I am asking is I am not 
> particularly happy to add yet another set of variant.
> 
> I would rather prefer if we settle down with a single comment and 
> therefore convert them to the pseudo-keyword.

7 occurrences and 3 of them are in xen/arch/x86/hvm/emulate.c
PATCH 07/13 modifies emulate.c anyway, so I could remove them in a v2.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

