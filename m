Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3C886E6E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 15:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696909.1088138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfon-0006tB-4t; Fri, 22 Mar 2024 14:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696909.1088138; Fri, 22 Mar 2024 14:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfon-0006r5-1Q; Fri, 22 Mar 2024 14:24:25 +0000
Received: by outflank-mailman (input) for mailman id 696909;
 Fri, 22 Mar 2024 14:24:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jC2=K4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rnfol-0006qz-R9
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 14:24:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0a95fa7-e857-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 15:24:22 +0100 (CET)
Received: from [192.168.1.9] (net-93-144-106-196.cust.dsl.teletu.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id A0DF44EE0742;
 Fri, 22 Mar 2024 15:24:21 +0100 (CET)
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
X-Inumbo-ID: e0a95fa7-e857-11ee-afe0-a90da7624cb6
Message-ID: <329ff232-1ea4-4df0-898b-17500496eaf2@bugseng.com>
Date: Fri, 22 Mar 2024 15:24:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] automation/eclair: add deviation for MISRA
 C:2012 Rule 17.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1711096695.git.simone.ballarin@bugseng.com>
 <dc3c8f2913a9efd54767828bf11fc5767afbbfa5.1711096695.git.simone.ballarin@bugseng.com>
 <9c6f4afd-00af-41f0-86dc-4f4558cb739c@suse.com>
 <7b5bad43-88f2-4d91-abc4-6b527446cb4a@bugseng.com>
 <60181473-501a-4f17-ac11-e1598ead8b29@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <60181473-501a-4f17-ac11-e1598ead8b29@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/24 15:12, Jan Beulich wrote:
> On 22.03.2024 14:44, Simone Ballarin wrote:
>> On 22/03/24 10:44, Jan Beulich wrote:
>>> On 22.03.2024 09:46, Simone Ballarin wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
>>>>    -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
>>>>    -doc_end
>>>>    
>>>> +#
>>>> +# Series 17.
>>>> +#
>>>> +
>>>> +-doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
>>>> +-config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>>>> +-doc_end
>>>
>>> Repeating v1 comments which weren't addressed>
>>> Is there a reason xyzprintk() are all listed individually? Surely if
>>> we'd introduce a new flavor, we'd want that excluded too.
>>>> {,g}dprintk() in neither of their incarnation use any of the va_*
>>> items listed. Why do they need mentioning here?
>>
>> What do you mean with "xyzprintk()"? Maybe you mean a regex-based
>> deviation using ".*printk\(.*\)"?
> 
> Regex or globbing, whatever is available.
> 
>> That would unnecessarily deviate "{,g}dprintk()" as you said.
> 
> Depends on how the regex would be written.
> 
>> Moreover, to cover also "vprintk_common", we would instead need something like
>> "^.*printk.*\(.*\)$".
> 
> Or simply accept that such outliers need listing individually. That
> would imo still be better than a dozen entries.

Ok, I will propose a patch using "^.*printk\(.*\)$"


> 
>> I'm fine in using "^.*printk.*\(.*\)$", I just preferred the individual
>> whitelisting to avoid unwanted exclusions.
>>
>> P.S:
>> using regex I cannot match only the name, but I have to match
>> the entire signature.
> 
> Interesting. Is that a tool limitation?

Why limitation? I wrote the P.S. just to motivate why I've added the "\(.*\)".

"name(abc)&&kind(function)" will simply become "^abc\(.*\)$".

Please note that I've removed "kind(function)" since the regex can only
match functions.

> 
> Jan
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


