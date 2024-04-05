Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B298995BB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701104.1095229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdK8-0004fS-OO; Fri, 05 Apr 2024 06:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701104.1095229; Fri, 05 Apr 2024 06:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdK8-0004dx-La; Fri, 05 Apr 2024 06:45:16 +0000
Received: by outflank-mailman (input) for mailman id 701104;
 Fri, 05 Apr 2024 06:45:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M48I=LK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rsdK7-0004dm-4q
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:45:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dfc282b-f318-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 08:45:13 +0200 (CEST)
Received: from [192.168.1.18] (host-82-59-164-46.retail.telecomitalia.it
 [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id F3B544EE073E;
 Fri,  5 Apr 2024 08:45:12 +0200 (CEST)
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
X-Inumbo-ID: 0dfc282b-f318-11ee-afe6-a90da7624cb6
Message-ID: <0cb2fcc5-9ee6-4b9d-baab-4652ad7913fc@bugseng.com>
Date: Fri, 5 Apr 2024 08:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automaton/eclair: add deviations for MISRA C:2012
 Rule 13.6
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cca71f954bec4efc14b98e3ad991581441d593d7.1712238975.git.federico.serafini@bugseng.com>
 <4c008f38-2618-4e17-8cb5-c226660edf37@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <4c008f38-2618-4e17-8cb5-c226660edf37@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/24 16:34, Jan Beulich wrote:
> On 04.04.2024 16:21, Federico Serafini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -333,6 +333,14 @@ of the short-circuit evaluation strategy of such logical operators."
>>   -config=MC3R1.R13.5,reports+={disapplied,"any()"}
>>   -doc_end
>>   
>> +-doc_begin="Macros alternative_vcall[0-9] use sizeof to type-check \"func\" and the func parameters without evaluating them."
>> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))))"}
>> +-doc_end
> 
> alternative_vcall(), for now at least, is x86-only. Why blindly deviate it also
> for Arm?

I'll reduce the scope to x86 only.

>> +-doc_begin="Macro chk_fld is only used to introduce BUILD_BUG_ON checks in very specific cases where by code inspection you can see that its usage is correct. The BUILD_BUG_ON checks check that EFI_TIME and struct xenpf_efi_time fields match."
>> +-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^chk_fld$))))"}
>> +-doc_end
> 
> As indicated on earlier occasions - when a macro isn't global, its deviation
> better wouldn't be global either. An identically named macro may be introduced
> elsewhere, and may not need deviating there.

Noted.

>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -279,6 +279,18 @@ Deviations related to MISRA C:2012 Rules:
>>          the short-circuit evaluation strategy for logical operators.
>>        - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>>   
>> +   * - R13.6
>> +     - Macros alternative_vcall[0-9] use sizeof to type-check \"func\" and the
>> +       func parameters without evaluating them.
> 
> Just to mention it: The return type of the function isn't really of interest
> there. What's being checked is that the argument types match the corresponding
> parameter ones, which otherwise would "naturally" be done by the compiler when
> seeing function calls. Might be useful to state no more and no less than what
> is really needed.

Noted.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

