Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5C785B4F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 16:59:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589359.921253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYpK5-00047Y-6c; Wed, 23 Aug 2023 14:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589359.921253; Wed, 23 Aug 2023 14:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYpK5-000453-3I; Wed, 23 Aug 2023 14:59:05 +0000
Received: by outflank-mailman (input) for mailman id 589359;
 Wed, 23 Aug 2023 14:59:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYpK3-00044w-Um
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 14:59:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYpK2-0002yd-Si; Wed, 23 Aug 2023 14:59:02 +0000
Received: from [15.248.3.2] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYpK2-0004f1-LT; Wed, 23 Aug 2023 14:59:02 +0000
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
	bh=kTe+RaKLC6YFwnpP4z+Zwcd44TIXajD0zXa6Aa2R3HE=; b=GE+8LtXXkpfGVVY7gW0DyxWMeP
	smOu09lA21aPMqCySKkvVcRWbwnha05DFRxV2L4BKq9WFFScsaE5W8i4/lBbA6aekGEtaFTy5+B+9
	xusPYJkebqkcpbMTF+8xlnDCLfnQW1YkFAiPFbh61cOUhtgo+0KxRi2XKfGxCsYYNSP0=;
Message-ID: <a0a4a13a-3ada-4586-81cf-86a9e583fc60@xen.org>
Date: Wed, 23 Aug 2023 15:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] arm64/vfp: address MISRA C:2012 Dir 4.3
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <998ecebdda92f1704fa35e8692b1f7e37b674d16.1692800477.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <998ecebdda92f1704fa35e8692b1f7e37b674d16.1692800477.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/08/2023 15:27, Nicola Vetrini wrote:
> Directive 4.3 prescribes the following:
> "Assembly language shall be encapsulated and isolated",
> on the grounds of improved readability and ease of maintenance.
> The Directive is violated in this case by asm code in between C code.
> 
> A macro is the chosen encapsulation mechanism.

I would rather prefer if we use a static inline.

> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> A couple of remarks:
> - An inline function is another possible encapsulation technique
> - A #define wrapper() do { asm volatile (...) } while(0); is also allowed,
>    but I don't think this is needed in the specific case.
> ---
>   xen/arch/arm/arm64/vfp.c | 74 ++++++++++++++++++++++------------------
>   1 file changed, 40 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> index 2d0d7c2e6ddb..0248601453ec 100644
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -4,6 +4,44 @@
>   #include <asm/vfp.h>
>   #include <asm/arm64/sve.h>
> 
> +#define save_state(fpregs)                           \
> +    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"     \
> +                 "stp q2, q3, [%1, #16 * 2]\n\t"     \
> +                 "stp q4, q5, [%1, #16 * 4]\n\t"     \
> +                 "stp q6, q7, [%1, #16 * 6]\n\t"     \
> +                 "stp q8, q9, [%1, #16 * 8]\n\t"     \
> +                 "stp q10, q11, [%1, #16 * 10]\n\t"  \
> +                 "stp q12, q13, [%1, #16 * 12]\n\t"  \
> +                 "stp q14, q15, [%1, #16 * 14]\n\t"  \
> +                 "stp q16, q17, [%1, #16 * 16]\n\t"  \
> +                 "stp q18, q19, [%1, #16 * 18]\n\t"  \
> +                 "stp q20, q21, [%1, #16 * 20]\n\t"  \
> +                 "stp q22, q23, [%1, #16 * 22]\n\t"  \
> +                 "stp q24, q25, [%1, #16 * 24]\n\t"  \
> +                 "stp q26, q27, [%1, #16 * 26]\n\t"  \
> +                 "stp q28, q29, [%1, #16 * 28]\n\t"  \
> +                 "stp q30, q31, [%1, #16 * 30]\n\t"  \
> +                 : "=Q" (*fpregs) : "r" (fpregs));
> +
> +#define restore_state(fpregs)                        \
> +    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"     \
> +                 "ldp q2, q3, [%1, #16 * 2]\n\t"     \
> +                 "ldp q4, q5, [%1, #16 * 4]\n\t"     \
> +                 "ldp q6, q7, [%1, #16 * 6]\n\t"     \
> +                 "ldp q8, q9, [%1, #16 * 8]\n\t"     \
> +                 "ldp q10, q11, [%1, #16 * 10]\n\t"  \
> +                 "ldp q12, q13, [%1, #16 * 12]\n\t"  \
> +                 "ldp q14, q15, [%1, #16 * 14]\n\t"  \
> +                 "ldp q16, q17, [%1, #16 * 16]\n\t"  \
> +                 "ldp q18, q19, [%1, #16 * 18]\n\t"  \
> +                 "ldp q20, q21, [%1, #16 * 20]\n\t"  \
> +                 "ldp q22, q23, [%1, #16 * 22]\n\t"  \
> +                 "ldp q24, q25, [%1, #16 * 24]\n\t"  \
> +                 "ldp q26, q27, [%1, #16 * 26]\n\t"  \
> +                 "ldp q28, q29, [%1, #16 * 28]\n\t"  \
> +                 "ldp q30, q31, [%1, #16 * 30]\n\t"  \
> +                 : : "Q" (*fpregs), "r" (fpregs))
> +
>   void vfp_save_state(struct vcpu *v)
>   {
>       if ( !cpu_has_fp )
> @@ -13,23 +51,7 @@ void vfp_save_state(struct vcpu *v)
>           sve_save_state(v);
>       else
>       {
> -        asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> -                     "stp q2, q3, [%1, #16 * 2]\n\t"
> -                     "stp q4, q5, [%1, #16 * 4]\n\t"
> -                     "stp q6, q7, [%1, #16 * 6]\n\t"
> -                     "stp q8, q9, [%1, #16 * 8]\n\t"
> -                     "stp q10, q11, [%1, #16 * 10]\n\t"
> -                     "stp q12, q13, [%1, #16 * 12]\n\t"
> -                     "stp q14, q15, [%1, #16 * 14]\n\t"
> -                     "stp q16, q17, [%1, #16 * 16]\n\t"
> -                     "stp q18, q19, [%1, #16 * 18]\n\t"
> -                     "stp q20, q21, [%1, #16 * 20]\n\t"
> -                     "stp q22, q23, [%1, #16 * 22]\n\t"
> -                     "stp q24, q25, [%1, #16 * 24]\n\t"
> -                     "stp q26, q27, [%1, #16 * 26]\n\t"
> -                     "stp q28, q29, [%1, #16 * 28]\n\t"
> -                     "stp q30, q31, [%1, #16 * 30]\n\t"
> -                     : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
> +        save_state(v->arch.vfp.fpregs);
>       }
> 
>       v->arch.vfp.fpsr = READ_SYSREG(FPSR);
> @@ -47,23 +69,7 @@ void vfp_restore_state(struct vcpu *v)
>           sve_restore_state(v);
>       else
>       {
> -        asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> -                     "ldp q2, q3, [%1, #16 * 2]\n\t"
> -                     "ldp q4, q5, [%1, #16 * 4]\n\t"
> -                     "ldp q6, q7, [%1, #16 * 6]\n\t"
> -                     "ldp q8, q9, [%1, #16 * 8]\n\t"
> -                     "ldp q10, q11, [%1, #16 * 10]\n\t"
> -                     "ldp q12, q13, [%1, #16 * 12]\n\t"
> -                     "ldp q14, q15, [%1, #16 * 14]\n\t"
> -                     "ldp q16, q17, [%1, #16 * 16]\n\t"
> -                     "ldp q18, q19, [%1, #16 * 18]\n\t"
> -                     "ldp q20, q21, [%1, #16 * 20]\n\t"
> -                     "ldp q22, q23, [%1, #16 * 22]\n\t"
> -                     "ldp q24, q25, [%1, #16 * 24]\n\t"
> -                     "ldp q26, q27, [%1, #16 * 26]\n\t"
> -                     "ldp q28, q29, [%1, #16 * 28]\n\t"
> -                     "ldp q30, q31, [%1, #16 * 30]\n\t"
> -                     : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
> +        restore_state(v->arch.vfp.fpregs);
>       }
> 
>       WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
> --
> 2.34.1

-- 
Julien Grall

