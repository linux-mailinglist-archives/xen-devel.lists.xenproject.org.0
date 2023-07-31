Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FCC76915D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 11:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572843.896921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQP1x-0008Rq-I3; Mon, 31 Jul 2023 09:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572843.896921; Mon, 31 Jul 2023 09:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQP1x-0008Pu-EI; Mon, 31 Jul 2023 09:17:33 +0000
Received: by outflank-mailman (input) for mailman id 572843;
 Mon, 31 Jul 2023 09:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQP1w-0008Po-10
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 09:17:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1309a1b3-2f83-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 11:17:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E727D4EE0737;
 Mon, 31 Jul 2023 11:17:29 +0200 (CEST)
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
X-Inumbo-ID: 1309a1b3-2f83-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 31 Jul 2023 11:17:29 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Roberto Bagnara
 <roberto.bagnara@bugseng.com>
Subject: Re: [PATCH 3/3] x86: Delete str()
In-Reply-To: <20230728194320.3082120-4-andrew.cooper3@citrix.com>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
 <20230728194320.3082120-4-andrew.cooper3@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1c9656f333d5a5110122b8f08d264ea4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 28/07/2023 21:43, Andrew Cooper wrote:
> This is used in an assertion only, which is somewhat dubious to begin 
> with and
> won't surivive the x86-S work (where TR will become be a NUL selector).
> 
> Delete it now.  This avoids many cases where as a global symbol, it 
> shadows
> local string variables.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c      | 2 --
>  xen/arch/x86/include/asm/desc.h | 9 ---------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 56cb2f61bb75..4d29ad3bc36a 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1614,8 +1614,6 @@ static int _svm_cpu_up(bool bsp)
>      /* Initialize OSVW bits to be used by guests */
>      svm_host_osvw_init();
> 
> -    /* Minimal checking that enough CPU setup was done by now. */
> -    ASSERT(str() == TSS_SELECTOR);
>      svm_vmsave_pa(per_cpu(host_vmcb, cpu));
> 
>      return 0;
> diff --git a/xen/arch/x86/include/asm/desc.h 
> b/xen/arch/x86/include/asm/desc.h
> index 225a864c483e..a1e0807d97ed 100644
> --- a/xen/arch/x86/include/asm/desc.h
> +++ b/xen/arch/x86/include/asm/desc.h
> @@ -238,15 +238,6 @@ static inline void ltr(unsigned int sel)
>      __asm__ __volatile__ ( "ltr %w0" :: "rm" (sel) : "memory" );
>  }
> 
> -static inline unsigned int str(void)
> -{
> -    unsigned int sel;
> -
> -    __asm__ ( "str %0" : "=r" (sel) );
> -
> -    return sel;
> -}
> -
>  #endif /* !__ASSEMBLY__ */
> 
>  #endif /* __ARCH_DESC_H */

With respect to shadowing (Rule 5.3)
Tested-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

