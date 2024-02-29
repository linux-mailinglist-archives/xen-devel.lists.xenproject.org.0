Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FC586C2F7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 09:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686876.1069448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbME-00077y-5S; Thu, 29 Feb 2024 08:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686876.1069448; Thu, 29 Feb 2024 08:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbME-00076G-2p; Thu, 29 Feb 2024 08:01:34 +0000
Received: by outflank-mailman (input) for mailman id 686876;
 Thu, 29 Feb 2024 08:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRyR=KG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rfbMC-00075c-6A
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 08:01:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beedb57f-d6d8-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 09:01:30 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 57B194EE0737;
 Thu, 29 Feb 2024 09:01:29 +0100 (CET)
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
X-Inumbo-ID: beedb57f-d6d8-11ee-a1ee-f123f15fe8a2
Message-ID: <98d82c40-a81a-4c75-8cdf-aaef640382b6@bugseng.com>
Date: Thu, 29 Feb 2024 09:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: extend deviations of MISRA C:2012
 Rule 16.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <6c96f889ae3fbdf516f0edfe4a5fb207540b6862.1709109662.git.federico.serafini@bugseng.com>
 <1a00c221-ce1c-45be-9ab3-e8f1a0e5678d@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <1a00c221-ce1c-45be-9ab3-e8f1a0e5678d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/24 10:06, Jan Beulich wrote:
> On 28.02.2024 09:53, Federico Serafini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> 
> Comments below apply similarly to text added to this file.
> 
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -291,7 +291,14 @@ Deviations related to MISRA C:2012 Rules:
>>        - Project-wide deviation; tagged as `deliberate` for ECLAIR.
>>   
>>      * - R16.3
>> -     - Switch clauses ending with continue, goto, return statements are safe.
>> +     - Switch clauses ending with an unconditional flow control statement
>> +       (i.e., continue, goto, or return) are safe.
>> +     - Tagged as `safe` for ECLAIR.
> 
> With this edit (unmentioned in the description, btw) ...
> 
>> +   * - R16.3
>> +     - Switch clauses ending with an if-else statement are safe if both
>> +       branches consist of a flow control statement (i.e., continue, break,
>> +       goto, return).
> 
> ... why is it not also "ending with" here?

Because the allowed pattern is:

if ( cond )
  return; /* Or continue / break / goto */
else
  break;  /* Or continue / goto / return */

See below for more information.

> 
> Also what about either situation ending with a call to a noreturn function?

This can be added.

> 
>> @@ -307,6 +314,16 @@ Deviations related to MISRA C:2012 Rules:
>>        - Switch clauses ending with failure method \"BUG()\" are safe.
>>        - Tagged as `safe` for ECLAIR.
>>   
>> +   * - R16.3
>> +     - On X86, switch clauses ending generating an exception through
>> +       \"generate_exception()\" are safe.
>> +     - Tagged as `safe` for ECLAIR.
> 
> This macro is limited to the emulator, so shouldn't be deviated globally.

Noted.

> Furthermore - why does the special case need mentioning here? Shouldn't
> it be the underlying pattern which is deviated (along the lines of the
> earlier ones):
> 
>      if ( true )
>      {
>          ...
>          goto ...; /* Or break / continue / return */
>      }

This pattern that involves a compound statement for the true branch
is not deviated by this configuration.

See below for more information.

> 
>> +   * - R16.3
>> +     - Switch clauses ending generating a parse error through
>> +       \"PARSE_ERR_RET()\" are safe.
>> +     - Tagged as `safe` for ECLAIR.
> 
> Again this isn't a global scope macro, so shouldn't be deviated globally.

Noted.

> Plus it ends in "return", so ought to be covered by the earlier clause.
> The fact that the return is in a body of do {} while(0) shouldn't matter
> at all - that's purely syntactic sugar.

I gather from your comments/questions that you would like to deviate
*all* the patterns where an unintentional fall through can not happen.

Rule 16.3 is a purely syntactic rule, and, as a consequence,
in the current version of ECLAIR additional "allowed pattern" (aka
deviations) for that rule need to be described through AST nodes,
meaning that all what you consider as syntactic sugar cannot be ignored.

A deviation that covers all the pattern you are asking for could be
done, but it will result in a complex and quite long expression
(not easy to read and justify in front of an assessor).

Hence, what I am proposing is to deviate only the the simplest and
most readable cases, such as:

if ( cond )
   return x;
else
   return y;

without involving compound statements, fake do-wile and fake if
statements but rather deviating the macro inside of which are used
(as I did).

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

