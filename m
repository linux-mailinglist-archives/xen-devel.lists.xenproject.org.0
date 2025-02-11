Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77156A307F9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885276.1295064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thn9R-0008Hm-SL; Tue, 11 Feb 2025 10:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885276.1295064; Tue, 11 Feb 2025 10:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thn9R-0008Fj-P1; Tue, 11 Feb 2025 10:05:57 +0000
Received: by outflank-mailman (input) for mailman id 885276;
 Tue, 11 Feb 2025 10:05:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1thn9Q-0008Fd-6d
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:05:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1thn9P-00D1yE-2s;
 Tue, 11 Feb 2025 10:05:55 +0000
Received: from [2a02:8012:3a1:0:6936:5dcd:97cd:143f]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1thn9P-004sAC-1J;
 Tue, 11 Feb 2025 10:05:55 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=8akY9kA9CiY07JefUjglw5FC6xlr1EZINHrsWpNV5Ls=; b=VhifXiyE5PCTzZu3j2K1nMhTW5
	oECQcn4wWo6XB42Ae1UN/5EYgRkoI1wRwGMmGUgjxPuMXbA0rHoTh/bjlnLauUhI+ZDawiAiB7ehY
	e7UX3hNh6fmNhSgjBcgnt6GBRIDAEuxHfZsFUeyWQuxKhg9sOhQ7afsPf5dJB8m65vDI=;
Message-ID: <67688f52-00ae-4b8d-8cef-f5f7419e27ed@xen.org>
Date: Tue, 11 Feb 2025 10:05:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/4] ARM32/traps: Fix
 do_trap_undefined_instruction()'s detection of kernel text
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-2-andrew.cooper3@citrix.com>
 <34c2dc12-eb49-4c16-97b5-166b889822a2@xen.org>
 <55f44ab1-25ed-4756-8621-162e02471fda@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <55f44ab1-25ed-4756-8621-162e02471fda@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 10/02/2025 22:23, Andrew Cooper wrote:
> On 10/02/2025 9:23 pm, Julien Grall wrote:
>> Hi Andrew,
>>
>> On 08/02/2025 00:02, Andrew Cooper wrote:
>>> While fixing some common/arch boundaries for UBSAN support on other
>>> architectures, the following debugging patch:
>>>
>>>     diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>>     index c1f2d1b89d43..58d1d048d339 100644
>>>     --- a/xen/arch/arm/setup.c
>>>     +++ b/xen/arch/arm/setup.c
>>>     @@ -504,6 +504,8 @@ void asmlinkage __init start_xen(unsigned long
>>> fdt_paddr)
>>>
>>>          system_state = SYS_STATE_active;
>>>
>>>     +    dump_execution_state();
>>>     +
>>>          for_each_domain( d )
>>>              domain_unpause_by_systemcontroller(d);
>>>
>>> fails with:
>>>
>>>     (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to
>>> switch input)
>>>     (XEN) CPU0: Unexpected Trap: Undefined Instruction
>>>     (XEN) ----[ Xen-4.20-rc  arm32  debug=n  Not tainted ]----
>>>     (XEN) CPU:    0
>>>     <snip>
>>>     (XEN)
>>>     (XEN) ****************************************
>>>     (XEN) Panic on CPU 0:
>>>     (XEN) CPU0: Unexpected Trap: Undefined Instruction
>>>     (XEN) ****************************************
>>>
>>> This is because the condition for init text is wrong.  While there's
>>> nothing
>>> interesting from that point onwards in start_xen(), it's also wrong
>>> for any
>>> livepatch which brings in an adjusted BUG_FRAME().
>>>
>>> Use is_active_kernel_text() which is the correct test for this
>>> purpose, and is
>>> aware of init and livepatch regions too.
>>>
>>> Commit c8d4b6304a5e ("xen/arm: add support for
>>> run_in_exception_handler()"),
>>> made run_in_exception_handler() work, but didn't complete the TODO
>>> left in
>>> commit 3e802c6ca1fb ("xen/arm: Correctly support WARN_ON").  Do so,
>>> to make
>>> ARM consistent with other architectures.
>>
>> This was done on purpose. If you look at the current implementation of
>> run_in_exception_handler(), it will clobber some registers.
>>
>> With your patch #2, the function should only clobber one. It is a bit
>> better, but it still not great. So I think we need to stick with
>> WARN() on Arm (+ maybe a comment explaning why it is implemented
>> differently).
> 
> I'm sorry but I don't follow.
> 
> run_in_exception_handler() only uses 1 register (after patch 2), but
> it's fully described to the invoking context, so nothing is clobbered
> from the compilers point of view.

Maybe "clobbered" was the wrong word. I was comparing the existing 
implementation (WARN()) with your proposed one. You don't mention in the 
commit message that r0/x0 will be missing. It wasn't clear to me whether 
this was intended.

> 
> Are you concerned about losing r0/x0 in the resulting trace?

I think the consolidation is not a strong enough reason to end up losing 
some registers in the dump. See below a proposal.

> 
> I can certainly split the patch in half.  The
> do_trap_undefined_instruction() change isn't related, although the
> second hunk is needed for patch 3 to consolidate dump_execution_state()
> across architectures.

What about checking if the arch is already providing a 
dump_execution_state() helper? This should allow the consolidation until 
we managed to convert Arm over to the generic bug infrastructure.

Cheers,

-- 
Julien Grall


