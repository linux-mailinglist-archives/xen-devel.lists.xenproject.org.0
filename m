Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B45730682
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549107.857451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UmU-0003s4-Ng; Wed, 14 Jun 2023 17:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549107.857451; Wed, 14 Jun 2023 17:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UmU-0003q0-KX; Wed, 14 Jun 2023 17:59:42 +0000
Received: by outflank-mailman (input) for mailman id 549107;
 Wed, 14 Jun 2023 17:59:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9UmT-0003pu-6U
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 17:59:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9UmS-0001hL-Je; Wed, 14 Jun 2023 17:59:40 +0000
Received: from [15.248.2.55] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9UmS-0005AO-DX; Wed, 14 Jun 2023 17:59:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=CVWO/3SeL+AfNSv869a3XqeTW4ElIy17X4+hP2IKDXk=; b=ZJLJmic6Kt2zQDhrkfON/h1DrJ
	Jbwl0q+PdT+7hSnuCrruJ0Zq6puN7TrWcDTaCJ3osipVyNZYvtVgAObiuCy1h1jF8i2CsoAFqAxSq
	dfwYJNpXFdZ9S5XvYaLmqBb4j9apBW/u0J510V36ImNKUs7mOS9seJPThEoaC9YxkCuc=;
Message-ID: <fa08b37a-ec10-dd17-4a56-2ad8d3138744@xen.org>
Date: Wed, 14 Jun 2023 18:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Functions _spin_lock_cb() and handle_ro_raz()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <c171c21a-b19e-7edd-06e5-17f2e95e839a@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c171c21a-b19e-7edd-06e5-17f2e95e839a@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Bertrand and Stefano)

On 14/06/2023 14:08, Federico Serafini wrote:
> Hello everyone,

Hi Federico,

Let me start with a tip to help reaching the maintainers and getting a 
more timely answer. Xen-devel has a large volume of e-mails (still less 
than Linux :)). So some of us will have filter to try to classify the 
e-mails received.

Commonly, all the e-mails where the person is in the CC/To list will go 
to the inbox. All the others will go a separate directory that may or 
may not be watched. Personally, I tend to glance in that directory, but 
I would not read all of them.

So I would highly recommend to CC the maintainers/reviewers of the 
specific component. You can find them in MAINTAINERS at the root of the 
Xen repository. We also have script like scripts/get_maintainers.pl that 
can help you to find who to CC.

If you pass '-f <file>', it will output the maintainers of that file. 
You can also use the script with patch to find all the maintainers to CC.

Now back to the subject of the e-mail.

> 
> I am working on the violations of MISRA C:2012 Rule 8.10,
> whose headline says:
> "An inline function shall be declared with the static storage class".
> 
> For both ARM64 and X86_64 builds,
> function _spin_lock_cb() defined in spinlock.c violates the rule.
> Such function is declared in spinlock.h without
> the inline function specifier: are there any reasons to do this?
> What about solving the violation by moving the function definition in
> spinlock.h and declaring it as static inline?

Jan answered it and sent a patch. So I will skip the reply for this one.

> 
> The same happens also for the function handle_ro_raz() in the ARM64
> build, declared in traps.h and defined in traps.c.

I looked at the history and it is not clear to me why the 'inline' was 
added at first. That said, I don't see any value to ask the compiler to 
inline (which it would be free to ignore) the function.

So I would suggest to send a patch to remove the 'inline'.

Best regards,

-- 
Julien Grall

