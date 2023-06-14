Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 830607304D5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 18:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549028.857351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9THD-0006GG-Ik; Wed, 14 Jun 2023 16:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549028.857351; Wed, 14 Jun 2023 16:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9THD-0006EN-FX; Wed, 14 Jun 2023 16:23:19 +0000
Received: by outflank-mailman (input) for mailman id 549028;
 Wed, 14 Jun 2023 16:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wBJ=CC=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1q9THB-0006E8-VV
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 16:23:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c365f86f-0acf-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 18:23:15 +0200 (CEST)
Received: from [192.168.1.125] (unknown [176.206.20.8])
 by support.bugseng.com (Postfix) with ESMTPSA id 7EB674EE0738;
 Wed, 14 Jun 2023 18:23:14 +0200 (CEST)
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
X-Inumbo-ID: c365f86f-0acf-11ee-8611-37d641c3527e
Message-ID: <d615c546-87d9-6d87-aa78-5e09bb12696c@bugseng.com>
Date: Wed, 14 Jun 2023 18:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Functions _spin_lock_cb() and handle_ro_raz()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <c171c21a-b19e-7edd-06e5-17f2e95e839a@bugseng.com>
 <4c13ea0f-9e53-62b2-feb8-45381d4f652b@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <4c13ea0f-9e53-62b2-feb8-45381d4f652b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 14/06/23 16:03, Jan Beulich wrote:
> On 14.06.2023 15:08, Federico Serafini wrote:
>> Hello everyone,
>>
>> I am working on the violations of MISRA C:2012 Rule 8.10,
>> whose headline says:
>> "An inline function shall be declared with the static storage class".
>>
>> For both ARM64 and X86_64 builds,
>> function _spin_lock_cb() defined in spinlock.c violates the rule.
>> Such function is declared in spinlock.h without
>> the inline function specifier: are there any reasons to do this?
> Since this function was mentioned elsewhere already, I'm afraid I
> have to be a little blunt and ask back: Did you check the history
> of the function. Yes, it is intentional to be that way, for the
> function to be inlined into _spin_lock(), and for it to also be
> available for external callers (we have just one right now, but
> that could change).
>
>> What about solving the violation by moving the function definition in
>> spinlock.h and declaring it as static inline?
> Did you try whether that would work at least purely mechanically?
> I'm afraid you'll find that it doesn't, because of LOCK_PROFILE_*
> being unavailable then. Yet we also don't want to expose all that
> in the header.
>
> In the earlier context I did suggest already to make the function
> an always-inline one in spinlock.c, under a slightly altered name,
> and then have _spin_lock_cb() be a trivial wrapper just like
> _spin_lock() is. I guess best is going to be if I make and post a
> patch ...
>
> Jan
Thank you for the information.

Federico

