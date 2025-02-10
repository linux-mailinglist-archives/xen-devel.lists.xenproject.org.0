Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F844A2FC0A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 22:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884983.1294739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thbLL-0002if-MY; Mon, 10 Feb 2025 21:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884983.1294739; Mon, 10 Feb 2025 21:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thbLL-0002ga-JH; Mon, 10 Feb 2025 21:29:27 +0000
Received: by outflank-mailman (input) for mailman id 884983;
 Mon, 10 Feb 2025 21:29:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1thbLK-0002gU-Gb
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 21:29:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1thbLJ-00BLjw-2x;
 Mon, 10 Feb 2025 21:29:25 +0000
Received: from [2a02:8012:3a1:0:c076:8426:eb1f:4b85]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1thbLJ-003VGK-1X;
 Mon, 10 Feb 2025 21:29:25 +0000
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
	bh=npBN2BLbyZA1r634Oi0gIPhDvPdyEoVTA/qMLJ8vMuM=; b=Xm/X8nucekTcMFXUwpaRA+yUnW
	Xd3ROWOW31fGPFD1vfu3S33d0/qHmxTOvXS4TjhH2MdQe2Fkj4xhnZkP/dbW9OpsQ5fSeSlvA9AG7
	Asu14G704g41QbnyZstcD+YCEY0Bli35zEqPx++JNlu0t3Ek6Q2Grq7Z5VU4omvGOnJA=;
Message-ID: <e46af210-4e99-4324-aaae-d531e88c4792@xen.org>
Date: Mon, 10 Feb 2025 21:29:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ARM: Fix register constraints in
 run_in_exception_handler()
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
 <20250208000256.431883-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250208000256.431883-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/02/2025 00:02, Andrew Cooper wrote:
> Right now, run_in_exception_handler() takes an input in an arbitrary register,
> and clobbers BUG_FN_REG.  This causes the compiler to calculate fn in the
> wrong regsiter.

Just to confirm, you mean, the compiler is not clever enough to notice 
that the value should be in the register BUG_FN_REG and therefore, two 
registers will be clobbered. Is that correct?

 > > Instead, use `register asm()` which is the normal way of tying register
> constraints to exact registers.
> 
> Bloat-o-meter reports:
> 
>    ARM64:
>      Function                                     old     new   delta
>      dump_registers                               356     348      -8
> 
>    ARM32:
>      ns16550_poll                                  52      48      -4
>      dump_registers                               432     428      -4
> 
> The other instruction dropped in ARM64's dump_registers() is an alignment nop.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
 > ----> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/arm/include/asm/bug.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
> index cacaf014ab09..8bf71587bea1 100644
> --- a/xen/arch/arm/include/asm/bug.h
> +++ b/xen/arch/arm/include/asm/bug.h
> @@ -59,15 +59,15 @@ struct bug_frame {
>    * be called function in a fixed register.
>    */
>   #define  run_in_exception_handler(fn) do {                                  \
> -    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
> -         "1:"BUG_INSTR"\n"                                                  \
> +    register unsigned long _fn asm (STR(BUG_FN_REG)) = (unsigned long)(fn); \
> +    asm ("1:"BUG_INSTR"\n"                                                  \
>            ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
>            "             \"a\", %%progbits\n"                                 \
>            "2:\n"                                                             \
>            ".p2align 2\n"                                                     \
>            ".long (1b - 2b)\n"                                                \
>            ".long 0, 0, 0\n"                                                  \
> -         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
> +         ".popsection" :: "r" (_fn) );                                      \
>   } while (0)
>   
>   #define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")

-- 
Julien Grall


