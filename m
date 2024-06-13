Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00790680A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 11:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739714.1146651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHgLd-00075D-Kz; Thu, 13 Jun 2024 09:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739714.1146651; Thu, 13 Jun 2024 09:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHgLd-00073O-Hg; Thu, 13 Jun 2024 09:02:21 +0000
Received: by outflank-mailman (input) for mailman id 739714;
 Thu, 13 Jun 2024 09:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+hf=NP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sHgLc-00073I-1y
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 09:02:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2fc1e37-2963-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 11:02:18 +0200 (CEST)
Received: from [172.20.10.8] (unknown [78.209.79.104])
 by support.bugseng.com (Postfix) with ESMTPSA id 7AA344EE0756;
 Thu, 13 Jun 2024 11:02:17 +0200 (CEST)
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
X-Inumbo-ID: a2fc1e37-2963-11ef-90a3-e314d9c70b13
Message-ID: <81332f64-9bd3-47bb-a6a5-adeecabf9730@bugseng.com>
Date: Thu, 13 Jun 2024 11:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: extend existing deviations of
 MISRA C:2012 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20c0779f2d749a682758defc06514772e97c9d89.1718260010.git.federico.serafini@bugseng.com>
 <cbd59b32-213b-4b5c-90fb-67906b7ae680@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <cbd59b32-213b-4b5c-90fb-67906b7ae680@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/24 10:16, Jan Beulich wrote:
> On 13.06.2024 08:38, Federico Serafini wrote:
>> Update ECLAIR configuration to deviate more cases where an
>> unintentional fallthrough cannot happen.
>>
>> Add Rule 16.3 to the monitored set and tag it as clean for arm.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   
>>      * - R16.3
>> -     - Switch clauses ending with continue, goto, return statements are safe.
>> +     - Statements that change the control flow (i.e., break, continue, goto,
>> +       return) and calls to functions that do not return the control back are
>> +       \"allowed terminal statements\".
>>        - Tagged as `safe` for ECLAIR.
>>   
>>      * - R16.3
>> -     - Switch clauses ending with a call to a function that does not give
>> -       the control back (i.e., a function with attribute noreturn) are safe.
>> +     - An if-else statement having both branches ending with one of the allowed
>> +       terminal statemets is itself an allowed terminal statements.
> 
> Nit: "... terminal statements is ... terminal statement."

Thanks.

> 
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R16.3
>> +     - An if-else statement having an always true condition and the true
>> +       branch ending with an allowed terminal statement is itself an allowed
>> +       terminal statement.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R16.3
>> +     - Switch clauses ending with a statement expression which, in turn, ends
>> +       with an allowed terminal statement are safe (e.g., the expansion of
>> +       generate_exception()).
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R16.3
>> +     - Switch clauses ending with a do-while-false which, in turn, ends with an
> 
> Maybe more precisely "the body of which"?

Will do.

> 
>> +       allowed terminal statement are safe (e.g., PARSE_ERR_RET()).
>> +       Being ASSERT_UNREACHABLE() a construct that is effective in debug builds
>> +       only, it is not considered as an allowed terminal statement, despite its
>> +       definition.
> 
> DYM despite its name? Its definition is what specifically renders it unsuitable
> for release builds.

In debug builds, ASSERT_UNREACHABLE() expands to a do-while-false
the body of which ends with __builtin_unreachable() which is a builtin
marked as "noreturn" and thus considered as one of the "allowed
terminal statements".
As a result, ASSERT_UNREACHABLE() will be considered as an
"allowed terminal statement" as well, which is something we want to
avoid.

> 
> Also I think the sentence wants to either start "ASSERT_UNREACHABLE() being a
> ..." or wants to be re-ordered to e.g. "Being a construct that is effective in
> debug builds only, ASSERT_UNREACHABLE() is not considered ..."
> 
> Jan

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

