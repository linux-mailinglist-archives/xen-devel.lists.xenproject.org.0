Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4C788F3C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 21:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590982.923356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZcQN-0003aL-IQ; Fri, 25 Aug 2023 19:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590982.923356; Fri, 25 Aug 2023 19:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZcQN-0003Xs-FZ; Fri, 25 Aug 2023 19:24:51 +0000
Received: by outflank-mailman (input) for mailman id 590982;
 Fri, 25 Aug 2023 19:24:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZcQL-0003Xk-F7
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 19:24:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d30da86-437d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 21:24:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0354A63532;
 Fri, 25 Aug 2023 19:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2273EC433C8;
 Fri, 25 Aug 2023 19:24:44 +0000 (UTC)
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
X-Inumbo-ID: 0d30da86-437d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692991485;
	bh=s+G2hkd7b8bkcvaEFm0m8wOov1FYtqEL6GagGIs/nbs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BK0LfbcJIv9AqmJFs9igHhzlaYk20KsbGx8uyAhHuzBTmeGiojbsX0eu9u8Yic6G+
	 7UaUcjrJgEpOCbb/bT9G6UM/l4aKBIqxIbCX3O8ni5AoFnXkZe1iq0qxpCi7Z1PTZw
	 1xE3YxhLD86mDaW8xMfdAAbpZgl/XPik/Qm7TAdME/dA8lTxExTRRAMZ8Y7f2pz75f
	 3vnyID65sYTadZg7L3ERkBG2eV6MC1EcccyzfONjjZTgV+uVk6SjbYgPDVafr6EN0X
	 djeUpwzQZ30uHUpvzAme+mzZYXZKYrAKo+eEGfIgFLU+R4Um6zK6Xyl09sbyWdzPRZ
	 LjdnDOagRujPw==
Date: Fri, 25 Aug 2023 12:24:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3] arm64/vfp: address MISRA C:2012 Dir 4.3
In-Reply-To: <eb05e70faaae3c328bfd3cc6c1aa4c7c90a351fd.1692971966.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308251224350.6458@ubuntu-linux-20-04-desktop>
References: <eb05e70faaae3c328bfd3cc6c1aa4c7c90a351fd.1692971966.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Nicola Vetrini wrote:
> Directive 4.3 prescribes the following:
> "Assembly language shall be encapsulated and isolated",
> on the grounds of improved readability and ease of maintenance.
> 
> A static inline function is the chosen encapsulation mechanism.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Switched to a static inline function
> Changes in v3:
> - Applied changes suggested by Michal
> ---
>  xen/arch/arm/arm64/vfp.c | 82 +++++++++++++++++++++-------------------
>  1 file changed, 44 insertions(+), 38 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> index 2d0d7c2e6ddb..c4f89c7b0e33 100644
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -4,6 +4,48 @@
>  #include <asm/vfp.h>
>  #include <asm/arm64/sve.h>
>  
> +static inline void save_state(uint64_t *fpregs)
> +{
> +    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> +                 "stp q2, q3, [%1, #16 * 2]\n\t"
> +                 "stp q4, q5, [%1, #16 * 4]\n\t"
> +                 "stp q6, q7, [%1, #16 * 6]\n\t"
> +                 "stp q8, q9, [%1, #16 * 8]\n\t"
> +                 "stp q10, q11, [%1, #16 * 10]\n\t"
> +                 "stp q12, q13, [%1, #16 * 12]\n\t"
> +                 "stp q14, q15, [%1, #16 * 14]\n\t"
> +                 "stp q16, q17, [%1, #16 * 16]\n\t"
> +                 "stp q18, q19, [%1, #16 * 18]\n\t"
> +                 "stp q20, q21, [%1, #16 * 20]\n\t"
> +                 "stp q22, q23, [%1, #16 * 22]\n\t"
> +                 "stp q24, q25, [%1, #16 * 24]\n\t"
> +                 "stp q26, q27, [%1, #16 * 26]\n\t"
> +                 "stp q28, q29, [%1, #16 * 28]\n\t"
> +                 "stp q30, q31, [%1, #16 * 30]\n\t"
> +                 : "=Q" (*fpregs) : "r" (fpregs));
> +}
> +
> +static inline void restore_state(const uint64_t *fpregs)
> +{
> +    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
> +                 "ldp q2, q3, [%1, #16 * 2]\n\t"
> +                 "ldp q4, q5, [%1, #16 * 4]\n\t"
> +                 "ldp q6, q7, [%1, #16 * 6]\n\t"
> +                 "ldp q8, q9, [%1, #16 * 8]\n\t"
> +                 "ldp q10, q11, [%1, #16 * 10]\n\t"
> +                 "ldp q12, q13, [%1, #16 * 12]\n\t"
> +                 "ldp q14, q15, [%1, #16 * 14]\n\t"
> +                 "ldp q16, q17, [%1, #16 * 16]\n\t"
> +                 "ldp q18, q19, [%1, #16 * 18]\n\t"
> +                 "ldp q20, q21, [%1, #16 * 20]\n\t"
> +                 "ldp q22, q23, [%1, #16 * 22]\n\t"
> +                 "ldp q24, q25, [%1, #16 * 24]\n\t"
> +                 "ldp q26, q27, [%1, #16 * 26]\n\t"
> +                 "ldp q28, q29, [%1, #16 * 28]\n\t"
> +                 "ldp q30, q31, [%1, #16 * 30]\n\t"
> +                 : : "Q" (*fpregs), "r" (fpregs));
> +}
> +
>  void vfp_save_state(struct vcpu *v)
>  {
>      if ( !cpu_has_fp )
> @@ -12,25 +54,7 @@ void vfp_save_state(struct vcpu *v)
>      if ( is_sve_domain(v->domain) )
>          sve_save_state(v);
>      else
> -    {
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
> -    }
> +        save_state(v->arch.vfp.fpregs);
>  
>      v->arch.vfp.fpsr = READ_SYSREG(FPSR);
>      v->arch.vfp.fpcr = READ_SYSREG(FPCR);
> @@ -46,25 +70,7 @@ void vfp_restore_state(struct vcpu *v)
>      if ( is_sve_domain(v->domain) )
>          sve_restore_state(v);
>      else
> -    {
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
> -    }
> +        restore_state(v->arch.vfp.fpregs);
>  
>      WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
>      WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
> -- 
> 2.34.1
> 

