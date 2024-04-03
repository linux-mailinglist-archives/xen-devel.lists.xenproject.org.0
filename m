Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930E9897451
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 17:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700600.1093998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2pD-00027T-Qs; Wed, 03 Apr 2024 15:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700600.1093998; Wed, 03 Apr 2024 15:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2pD-00024q-NL; Wed, 03 Apr 2024 15:46:55 +0000
Received: by outflank-mailman (input) for mailman id 700600;
 Wed, 03 Apr 2024 15:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE2n=LI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rs2pD-00024X-4I
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 15:46:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6486e10f-f1d1-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 17:46:53 +0200 (CEST)
Received: from [192.168.1.18] (host-82-59-164-46.retail.telecomitalia.it
 [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id C125A4EE073C;
 Wed,  3 Apr 2024 17:46:52 +0200 (CEST)
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
X-Inumbo-ID: 6486e10f-f1d1-11ee-a1ef-f123f15fe8a2
Message-ID: <eed0727e-2c04-4783-9498-d39f72c44eeb@bugseng.com>
Date: Wed, 3 Apr 2024 17:46:52 +0200
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
 <5f5b2904-48ca-493a-a353-4c2f9038f5d3@suse.com>
 <67ae7299-4c45-49e8-9055-101334906f80@citrix.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <67ae7299-4c45-49e8-9055-101334906f80@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/04/24 18:09, Andrew Cooper wrote:
> On 02/04/2024 5:06 pm, Jan Beulich wrote:
>> On 02.04.2024 17:54, Andrew Cooper wrote:
>>> On 02/04/2024 4:46 pm, Jan Beulich wrote:
>>>> On 02.04.2024 17:43, Andrew Cooper wrote:
>>>>> MISRA Rule 13.6 doesn't like having an expression in a sizeof() which
>>>>> potentially has side effects.
>>>>>
>>>>> Address several violations by pulling the expression out into a local
>>>>> variable.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> with one caveat:
>>>>
>>>>> --- a/xen/arch/x86/irq.c
>>>>> +++ b/xen/arch/x86/irq.c
>>>>> @@ -1150,8 +1150,9 @@ static void cf_check irq_guest_eoi_timer_fn(void *data)
>>>>>       {
>>>>>           struct domain *d = action->guest[i];
>>>>>           unsigned int pirq = domain_irq_to_pirq(d, irq);
>>>>> +        struct pirq *pirq_info = pirq_info(d, pirq);
>>>> Misra won't like the var's name matching the macro's. Can we go with just
>>>> "info"?
>>> Ah - missed that.
>>>
>>> I can name it to just info, but I considered "struct pirq *info" to be a
>>> little odd.
>> I agree, but what do you do with another "pirq" already there.
>>
>> Or wait, what about
>>
>>          struct pirq *pirq = pirq_info(d, domain_irq_to_pirq(d, irq));
>>
>> ?
> 
> That should work.  I'll switch to this locally, and wait for the
> feedback on whether the patch works for 13.6.

I confirm that both versions of the patch address some violations of
13.6.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

