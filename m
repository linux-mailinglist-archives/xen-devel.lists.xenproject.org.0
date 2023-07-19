Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F77590B6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565673.884031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2x6-00014M-GO; Wed, 19 Jul 2023 08:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565673.884031; Wed, 19 Jul 2023 08:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2x6-00011t-D4; Wed, 19 Jul 2023 08:54:32 +0000
Received: by outflank-mailman (input) for mailman id 565673;
 Wed, 19 Jul 2023 08:54:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dh/8=DF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qM2x5-00011n-0r
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:54:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deb8bf01-2611-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 10:54:28 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.72.116])
 by support.bugseng.com (Postfix) with ESMTPSA id 240454EE0C89;
 Wed, 19 Jul 2023 10:54:27 +0200 (CEST)
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
X-Inumbo-ID: deb8bf01-2611-11ee-8611-37d641c3527e
Message-ID: <4748db4d-d0d7-142c-b547-c285ceb1357c@bugseng.com>
Date: Wed, 19 Jul 2023 10:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <76cb0f23-ebcb-2c51-2312-c926b0d6d570@xen.org>
 <8617ddae-02f6-981f-73fc-50be2e24ea64@xen.org>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <8617ddae-02f6-981f-73fc-50be2e24ea64@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/07/23 22:45, Julien Grall wrote:
> 
> 
> On 17/07/2023 21:40, Julien Grall wrote:
>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>> The macro 'testop' expands to a function that declares the local
>>> variable 'oldbit', which is written before being set, but is such a
>>> way that is not amenable to automatic checking.
>>>
>>> Therefore, a deviation comment, is introduced to document this 
>>> situation.
>>>
>>> A similar reasoning applies to macro 'guest_testop'.
>>
>> Would you be able to check if the code below (only compile tested so 
>> far) would silence Eclair?
> 
> Hmmm.. I think my e-mail client mangled the diff. Here an unmangled 
> version if needed:
> 
> http://paste.debian.net/1286154/
> 
> Cheers,
> 

I have a question: wouldn't this patch also imply an update of 
xen/arch/arm/include/asm/guest_atomics.h ?

This in particular is the bit of code that needs to be reworked to use 
the newer *_timeout definition.


bool succeed;

succeed = name##_timeout(nr, p, &oldbit, 

                          this_cpu(guest_safe_atomic_max));

if ( succeed )
         return oldbit;

Probably something similar to


int succeed;

succeed = name##_timeout(nr, p, false, NULL, [...]);
if ( succeed != 0 )
   return succeed;

I'm not really sure whether the third param should be true or false, but 
I assumed false because it's similar to the use in bitops.c

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

