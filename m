Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA88C6F12
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722668.1126846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NtQ-0000Iu-Gb; Wed, 15 May 2024 23:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722668.1126846; Wed, 15 May 2024 23:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NtQ-0000H5-E1; Wed, 15 May 2024 23:18:40 +0000
Received: by outflank-mailman (input) for mailman id 722668;
 Wed, 15 May 2024 23:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7NtP-0008CI-7P
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:18:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75529a13-1311-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 01:18:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB985615E4;
 Wed, 15 May 2024 23:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF1EC116B1;
 Wed, 15 May 2024 23:18:34 +0000 (UTC)
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
X-Inumbo-ID: 75529a13-1311-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715815116;
	bh=SCXizz/EilxvN1gX2HeXJkgWZPC7AaUPWUwCx3Q36s0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hzjfUaoZiEE+jdsQN82i5QlmhradRn3/W5Bv/xsaYNJPBsEIVGiQ/JzDJvkrdWcz+
	 GLfgfp4AOcxbDU8gbe6Hv8xrTUHBBQw7VhqQNe1u+9YWO2ArKwwR5LmMHMHzBAqDG/
	 Ifw5xkUQKa+sb/mW6SZe7GVik9frix5TQbr0J2GC2T2DsQS/b/+D/7iyVOvSUA46hE
	 /7Fjj8hvK3Nyfwp48l+zh6i7ETuhCjzQZ0Q7TO+q1V58AFlyXtEdu86du6ugsjwheC
	 WarMLghdZ2tCV3GOri7IhxPr6j84Lu2CDzmh6grZ+toBptiOt/4oQr7d2H5F6D8iXl
	 K27uHIE8JQcnw==
Date: Wed, 15 May 2024 16:18:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 2/4] x86/hvm: address violations of MISRA C Rule
 20.7
In-Reply-To: <6d14b3283005cf1a30c4fa24f9841586a41e2b1b.1715757982.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405151618170.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com> <6d14b3283005cf1a30c4fa24f9841586a41e2b1b.1715757982.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/hvm/mtrr.c             | 2 +-
>  xen/arch/x86/hvm/rtc.c              | 2 +-
>  xen/arch/x86/include/asm/hvm/save.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
> index 32f74c1db03b..1079851f70ed 100644
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -16,7 +16,7 @@
>  #include <public/hvm/e820.h>
>  
>  /* Get page attribute fields (PAn) from PAT MSR. */
> -#define pat_cr_2_paf(pat_cr,n)  ((((uint64_t)pat_cr) >> ((n)<<3)) & 0xff)
> +#define pat_cr_2_paf(pat_cr, n)  ((((uint64_t)(pat_cr)) >> ((n) << 3)) & 0xff)

just a cosmetic change


>  /* Effective mm type lookup table, according to MTRR and PAT. */
>  static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
> diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> index 4bb1c7505534..72c7bdbfcd02 100644
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -45,7 +45,7 @@
>  #define vrtc_domain(x) (container_of(x, struct pl_time, vrtc)->domain)
>  #define vrtc_vcpu(x)   (pt_global_vcpu_target(vrtc_domain(x)))
>  #define epoch_year     1900
> -#define get_year(x)    (x + epoch_year)
> +#define get_year(x)    ((x) + epoch_year)
>  
>  enum rtc_mode {
>     rtc_mode_no_ack,
> diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
> index 8149aa113cb4..ec8de029319d 100644
> --- a/xen/arch/x86/include/asm/hvm/save.h
> +++ b/xen/arch/x86/include/asm/hvm/save.h
> @@ -50,7 +50,7 @@ int _hvm_check_entry(struct hvm_domain_context *h,
>                            HVM_SAVE_LENGTH(x), true) == 0 )      \
>      {                                                           \
>          ptr = &(h)->data[(h)->cur];                             \
> -        h->cur += HVM_SAVE_LENGTH(x);                           \
> +        (h)->cur += HVM_SAVE_LENGTH(x);                         \
>      }                                                           \
>      ptr; })
>  
> -- 
> 2.34.1
> 

