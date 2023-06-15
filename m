Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E47310C2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 09:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549436.857975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9hT5-0001sR-UA; Thu, 15 Jun 2023 07:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549436.857975; Thu, 15 Jun 2023 07:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9hT5-0001p9-Qq; Thu, 15 Jun 2023 07:32:31 +0000
Received: by outflank-mailman (input) for mailman id 549436;
 Thu, 15 Jun 2023 07:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eswf=CD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1q9hT4-0001p3-C4
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 07:32:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7fc280f-0b4e-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 09:32:28 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.161.238.96])
 by support.bugseng.com (Postfix) with ESMTPSA id 92D544EE0748;
 Thu, 15 Jun 2023 09:32:27 +0200 (CEST)
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
X-Inumbo-ID: c7fc280f-0b4e-11ee-b232-6b7b168915f2
Message-ID: <6f3b663a-1f8b-5555-ae61-ddf768b46fbd@bugseng.com>
Date: Thu, 15 Jun 2023 09:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Functions _spin_lock_cb() and handle_ro_raz()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <c171c21a-b19e-7edd-06e5-17f2e95e839a@bugseng.com>
 <fa08b37a-ec10-dd17-4a56-2ad8d3138744@xen.org>
Content-Language: en-US
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <fa08b37a-ec10-dd17-4a56-2ad8d3138744@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 14/06/23 19:59, Julien Grall wrote:
> (+ Bertrand and Stefano)
>
> On 14/06/2023 14:08, Federico Serafini wrote:
>> Hello everyone,
>
> Hi Federico,
>
> Let me start with a tip to help reaching the maintainers and getting a 
> more timely answer. Xen-devel has a large volume of e-mails (still 
> less than Linux :)). So some of us will have filter to try to classify 
> the e-mails received.
>
> Commonly, all the e-mails where the person is in the CC/To list will 
> go to the inbox. All the others will go a separate directory that may 
> or may not be watched. Personally, I tend to glance in that directory, 
> but I would not read all of them.
>
> So I would highly recommend to CC the maintainers/reviewers of the 
> specific component. You can find them in MAINTAINERS at the root of 
> the Xen repository. We also have script like 
> scripts/get_maintainers.pl that can help you to find who to CC.
>
> If you pass '-f <file>', it will output the maintainers of that file. 
> You can also use the script with patch to find all the maintainers to CC.
>
> Now back to the subject of the e-mail.
>
>>
>> I am working on the violations of MISRA C:2012 Rule 8.10,
>> whose headline says:
>> "An inline function shall be declared with the static storage class".
>>
>> For both ARM64 and X86_64 builds,
>> function _spin_lock_cb() defined in spinlock.c violates the rule.
>> Such function is declared in spinlock.h without
>> the inline function specifier: are there any reasons to do this?
>> What about solving the violation by moving the function definition in
>> spinlock.h and declaring it as static inline?
>
> Jan answered it and sent a patch. So I will skip the reply for this one.
>
>>
>> The same happens also for the function handle_ro_raz() in the ARM64
>> build, declared in traps.h and defined in traps.c.
>
> I looked at the history and it is not clear to me why the 'inline' was 
> added at first. That said, I don't see any value to ask the compiler 
> to inline (which it would be free to ignore) the function.
>
> So I would suggest to send a patch to remove the 'inline'.
>
> Best regards,
>
Thank you Julien, very helpful.

