Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A328867EF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 09:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696698.1087819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZwp-0000F9-FE; Fri, 22 Mar 2024 08:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696698.1087819; Fri, 22 Mar 2024 08:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZwp-0000Cd-Cc; Fri, 22 Mar 2024 08:08:19 +0000
Received: by outflank-mailman (input) for mailman id 696698;
 Fri, 22 Mar 2024 08:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jC2=K4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rnZwo-0000CX-Gk
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 08:08:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54301543-e823-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 09:08:13 +0100 (CET)
Received: from [192.168.1.9] (net-93-144-106-196.cust.dsl.teletu.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 1C2784EE0742;
 Fri, 22 Mar 2024 09:08:15 +0100 (CET)
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
X-Inumbo-ID: 54301543-e823-11ee-a1ee-f123f15fe8a2
Message-ID: <326f84ad-9c8f-47b5-b725-bf4f00e583e0@bugseng.com>
Date: Fri, 22 Mar 2024 09:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] automation/eclair: add deviation for MISRA C:2012
 Rule 17.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710923235.git.simone.ballarin@bugseng.com>
 <882b442c8c1f73f8116676ab9351defe5c9609ac.1710923235.git.simone.ballarin@bugseng.com>
 <9341a711-74c3-463f-8cc2-a54e19b4b2f4@suse.com>
 <alpine.DEB.2.22.394.2403201848340.1569010@ubuntu-linux-20-04-desktop>
 <d8b2bf3d-7656-4a60-9888-86755735e825@suse.com>
 <alpine.DEB.2.22.394.2403211100030.1569010@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2403211100030.1569010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/24 19:00, Stefano Stabellini wrote:
> On Thu, 21 Mar 2024, Jan Beulich wrote:
>> On 21.03.2024 02:50, Stefano Stabellini wrote:
>>> On Wed, 20 Mar 2024, Jan Beulich wrote:
>>>> On 20.03.2024 09:50, Simone Ballarin wrote:
>>>>> MISRA C:2012 Rule 17.1 states:
>>>>> The features of `<stdarg.h>' shall not be used
>>>>>
>>>>> The Xen community wants to avoid using variadic functions except for
>>>>> specific circumstances where it feels appropriate by strict code review.
>>>>>
>>>>> Add deviation for functions related to console output (printk and similar).
>>>>>
>>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>>> ---
>>>>>   .../eclair_analysis/ECLAIR/deviations.ecl     | 26 +++++++++++++++++++
>>>>>   docs/misra/deviations.rst                     |  5 ++++
>>>>>   2 files changed, 31 insertions(+)
>>>>>
>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> index 9ac3ee4dfd..7c3559a3a0 100644
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
>>>>>   -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
>>>>>   -doc_end
>>>>>   
>>>>> +#
>>>>> +# Series 17.
>>>>> +#
>>>>> +
>>>>> +-doc_begin="Functions related to console output are allowed to use the variadic features provided by stdarg.h."
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
>>>>
>>>> This isn't concole output related.
>>>
>>> Should we say "related to console output or tracing" ?
>>>
>>>
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
>>>>
>>>> These three and ...
>>>>
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
>>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
>>>>
>>>> ... these three aren't either.
>>>
>>> Maybe it is better to write it as:
>>>
>>> "Functions related printk, logging and tracing are allowed..."
>>
>> How about simply saying "printf()-like functions"? In what you suggest,
>> sprintf() and friends would still not be covered.
> 
> I like it
> 

Ok, great.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


