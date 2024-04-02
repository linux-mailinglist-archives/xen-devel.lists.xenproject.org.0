Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45508895955
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 18:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700221.1093020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgj8-0004ju-MJ; Tue, 02 Apr 2024 16:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700221.1093020; Tue, 02 Apr 2024 16:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrgj8-0004gp-Ii; Tue, 02 Apr 2024 16:11:10 +0000
Received: by outflank-mailman (input) for mailman id 700221;
 Tue, 02 Apr 2024 16:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tdu6=LH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rrgj7-0004gh-9j
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 16:11:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d22f46c-f10b-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 18:11:08 +0200 (CEST)
Received: from [192.168.1.18] (host-82-59-164-46.retail.telecomitalia.it
 [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 48C594EE0737;
 Tue,  2 Apr 2024 18:11:07 +0200 (CEST)
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
X-Inumbo-ID: 9d22f46c-f10b-11ee-afe5-a90da7624cb6
Message-ID: <85a2101f-ba3a-4449-bd38-65528229793d@bugseng.com>
Date: Tue, 2 Apr 2024 18:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Address MISRA Rule 13.6
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402154339.2448435-1-andrew.cooper3@citrix.com>
 <35fc596e-8134-4471-83d4-40b01f5821bf@suse.com>
 <6ac9cb14-2e68-41d6-b061-c7caa74fde5b@citrix.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <6ac9cb14-2e68-41d6-b061-c7caa74fde5b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/24 17:54, Andrew Cooper wrote:
> On 02/04/2024 4:46 pm, Jan Beulich wrote:
>> On 02.04.2024 17:43, Andrew Cooper wrote:
>>> MISRA Rule 13.6 doesn't like having an expression in a sizeof() which
>>> potentially has side effects.
>>>
>>> Address several violations by pulling the expression out into a local
>>> variable.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one caveat:
>>
>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -1150,8 +1150,9 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>>>       {
>>>           struct domain *d = action->guest[i];
>>>           unsigned int pirq = domain_irq_to_pirq(d, irq);
>>> +        struct pirq *pirq_info = pirq_info(d, pirq);
>> Misra won't like the var's name matching the macro's. Can we go with just
>> "info"?
> 
> Ah - missed that.
> 
> I can name it to just info, but I considered "struct pirq *info" to be a
> little odd.

The local variable is a non-callable entity;
"clashes" between function-like macros and non-callable entities
will be deviated (as agreed during MISRA meetings).

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

