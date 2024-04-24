Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACF8B0532
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 11:00:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711284.1111125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzYUC-0005af-5i; Wed, 24 Apr 2024 09:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711284.1111125; Wed, 24 Apr 2024 09:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzYUC-0005XT-2k; Wed, 24 Apr 2024 09:00:16 +0000
Received: by outflank-mailman (input) for mailman id 711284;
 Wed, 24 Apr 2024 09:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7Hn=L5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rzYUB-0005XN-EQ
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 09:00:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e6f48b6-0219-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 11:00:12 +0200 (CEST)
Received: from [192.168.1.11] (host-79-60-221-62.business.telecomitalia.it
 [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 08FEC4EE0739;
 Wed, 24 Apr 2024 11:00:10 +0200 (CEST)
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
X-Inumbo-ID: 0e6f48b6-0219-11ef-b4bb-af5377834399
Message-ID: <70252c73-e93b-4006-8acd-1e760db5aab7@bugseng.com>
Date: Wed, 24 Apr 2024 11:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <310e1dac8ecf2a85f1c552dbdad9093b1cfdcb98.1713946892.git.federico.serafini@bugseng.com>
 <891c21cf-695a-4b1d-b10b-53f23199380f@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <891c21cf-695a-4b1d-b10b-53f23199380f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/24 10:30, Jan Beulich wrote:
> On 24.04.2024 10:25, Federico Serafini wrote:
>> Update ECLAIR configuration to take into account the deviations
>> agreed during MISRA meetings for Rule 16.4.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>>   docs/misra/deviations.rst                        | 13 +++++++++++++
>>   2 files changed, 21 insertions(+)
>>
> 
> So what has changed here from v1? It looks all the same to me, with it still
> remaining unclear what exactly ...
> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -334,6 +334,19 @@ Deviations related to MISRA C:2012 Rules:
>>            - /\* Fallthrough \*/
>>            - /\* Fallthrough. \*/
>>   
>> +   * - R16.4
>> +     - Switch statements having a controlling expression of enum type
>> +       deliberately do not have a default case: gcc -Wall enables -Wswitch
>> +       which warns (and breaks the build as we use -Werror) if one of the enum
>> +       labels is missing from the switch.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>> +   * - R16.4
>> +     - A switch statement with a single switch clause and no default label may
>> +       be used in place of an equivalent if statement if it is considered to
>> +       improve readability.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>>      * - R16.6
>>        - A switch statement with a single switch clause and no default label may
>>          be used in place of an equivalent if statement if it is considered to
> 
> ... a "switch clause" is.

I would define a switch clause as:
"the non-empy list of statements which follows a non-empty list of
case/default labels".
If you agree, I will place it near the occurrences of the term
"switch clause".

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

