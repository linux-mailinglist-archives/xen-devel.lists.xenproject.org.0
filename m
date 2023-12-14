Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9B0812BE1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 10:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654371.1021214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDiEa-0004HK-U9; Thu, 14 Dec 2023 09:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654371.1021214; Thu, 14 Dec 2023 09:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDiEa-0004Eq-Qb; Thu, 14 Dec 2023 09:42:24 +0000
Received: by outflank-mailman (input) for mailman id 654371;
 Thu, 14 Dec 2023 09:42:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDiEZ-0004Ek-BJ
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 09:42:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDiEY-0007Fd-In; Thu, 14 Dec 2023 09:42:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDiEY-0002Ul-7x; Thu, 14 Dec 2023 09:42:22 +0000
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
	bh=yAsO4JtgZOFg9xr7suahAVrKKgl0SRrIhIvpQP6U2gs=; b=fFngiLIEYOGD6C9akJ74hL66rp
	vhw7f6jQjqedi4D/BZz6q3r4MpPbGIrJ0Pvnx49sL6KRV1fRaD95kIzCq0NlI86HzfTkW/roS1CC4
	evX8QFCLBoV03m35UsZ6JTHSYvmmfHL7bSl31eiuLEwaHqdhBbwizQMdH8uJ+qF4Nwl8=;
Message-ID: <2b4eec7c-3657-4542-96b9-56b272e8723b@xen.org>
Date: Thu, 14 Dec 2023 09:42:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
 <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
 <240c97ed-ce27-406d-84ad-68b72e999294@xen.org>
 <5ad1c008182bc9f23e1b37b0d6e35e4c@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5ad1c008182bc9f23e1b37b0d6e35e4c@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/12/2023 14:02, Nicola Vetrini wrote:
> On 2023-12-12 16:49, Julien Grall wrote:
>> Hi,
>>
>> On 11/12/2023 12:32, Julien Grall wrote:
>>> Hi,
>>>
>>> On 11/12/2023 10:30, Nicola Vetrini wrote:
>>>> The branches of the switch after a call to 'do_unexpected_trap'
>>>> cannot return, but there is one path that may return, hence
>>>> only some clauses are marked with ASSERT_UNREACHABLE().
>>> I don't understand why this is necessary. The code should never be 
>>> reachable because do_unexpected_trap() is a noreturn().
>>
>> From the matrix discussion, it wasn't clear what was my position on 
>> this patch.
>>
>> I would much prefer if the breaks are kept. I could accept:
>>
>> ASSERT_UNREACHABLE();
>> break;
>>
>> But this solution is a Nack because if you are concerned about 
>> functions like do_unexpected_trap() to return by mistaken, then it 
>> needs to also be safe in production.
>>
>> The current proposal is not safe.
>>
>> Cheers,
> 
> Ok. I wonder whether the should be applied here in vcpreg.c:
> 
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 39aeda9dab62..089d2f03eb5e 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -707,7 +707,8 @@ void do_cp10(struct cpu_user_regs *regs, const union 
> hsr hsr)
>           inject_undef_exception(regs, hsr);
>           return;
>       }
> -
> +
> +    ASSERT_UNREACHABLE();
>       advance_pc(regs, hsr);
>   }
> 
> the rationale being that, should the switch somehow fail to return, the 
> advance_pc would be called, rather than doing nothing.

To clarify, advance_pc(regs, hsr) would still be called in production 
build. So if you are concerned about advance_pc() been called, then 
adding an ASSERT_UNREACHABLE() is not going to help.

It took me a little while to confirm that none of the path effectively 
returns due to the macros (in hindsight, it wasn't a good idea of mine 
to introduce them).

Depending on what we are trying to solve there are 3 possible approach:
   1. Leave advance_pc(). This means we could potentially
      a. Advance the PC twice (if it was already called) and therefore 
skipping an instruction
      b. Advance the PC once without an emulation
   2. Remove advance_pc(). If we already called the function, then there 
is no problem. Otherwise, we would trap in a loop effectively rendering 
the guest vCPU unusable.
   3. Replace with domain_crash()

Here it feels, that 3 is more suitable as this gives a clear indication 
why/where the emulation gone wrong.

This may still need to be accompanied with a ASSERT_UNREACHABLE() to 
please MISRA.

Bertrand, Michal, Stefano, what do you think?

Cheers,

-- 
Julien Grall

