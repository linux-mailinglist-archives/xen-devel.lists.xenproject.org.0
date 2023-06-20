Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A51737649
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552324.862339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiIa-0006rs-Au; Tue, 20 Jun 2023 20:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552324.862339; Tue, 20 Jun 2023 20:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBiIa-0006pV-8I; Tue, 20 Jun 2023 20:50:00 +0000
Received: by outflank-mailman (input) for mailman id 552324;
 Tue, 20 Jun 2023 20:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBiIY-0006pL-Ma
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:49:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02d08862-0fac-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 22:49:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5C1660EB7;
 Tue, 20 Jun 2023 20:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A616BC433C0;
 Tue, 20 Jun 2023 20:49:52 +0000 (UTC)
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
X-Inumbo-ID: 02d08862-0fac-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687294194;
	bh=N9ipIT1HIT0LYQ3Et6OB57/9wrFskPnakAW6QIBWx+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ojUgM3PAl1Gi9+0eS5Zg9OuONQ+pB3cy3OwkIGu2RDHUJD6Kk3x2xwvRyjSKPGV38
	 8uGAkqG7VouAsS2RQaQ8HhmYZhLFdSXL+N+iiEEjsyvFxHjpElp8wgEla2Ly+YKEqL
	 GTQghbHC8URQlPdkmTceERz5PsICztjKuXopDq3kd5TG4BGvox8Jhk+5yBJ9tyZEe0
	 VwURc11dN+TTHOjfXKeMQM7DgRyxY+v2uoVetwL73KtccurW3+QUFJ35B3HsGh5gtK
	 OC+8gNI6r/UEfkNgGKOvxJNLGrexTcX1oE9Jhua2WJ8Cl+et+xjWfk/GIY96fZMZ9I
	 ABaRBUYX0BNsw==
Date: Tue, 20 Jun 2023 13:49:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 03/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
In-Reply-To: <397206cfac500d171be31dcd3503d9f61e531a97.1687250177.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306201349120.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <397206cfac500d171be31dcd3503d9f61e531a97.1687250177.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Commit message aside:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

FYI I would use the following as commit message title to make it unique:

xen/x86/hvm/svm: fixed violations of MISRA C:2012 Rule 7.2



> ---
>  xen/arch/x86/hvm/svm/asid.c | 2 +-
>  xen/arch/x86/hvm/svm/svm.c  | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
> index 09f8c23fd9..56306d1a16 100644
> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -16,7 +16,7 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
>  
>      /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>      if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
> -        nasids = cpuid_ebx(0x8000000A);
> +        nasids = cpuid_ebx(0x8000000AU);
>  
>      hvm_asid_init(nasids);
>  }
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 59a6e88dff..56cb2f61bb 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -269,9 +269,9 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
>       */
>      if ( msr <= 0x1fff )
>          msr_bit = msr_bitmap + 0x0000 / BYTES_PER_LONG;
> -    else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
> +    else if ( (msr >= 0xc0000000U) && (msr <= 0xc0001fffU) )
>          msr_bit = msr_bitmap + 0x0800 / BYTES_PER_LONG;
> -    else if ( (msr >= 0xc0010000) && (msr <= 0xc0011fff) )
> +    else if ( (msr >= 0xc0010000U) && (msr <= 0xc0011fffU) )
>          msr_bit = msr_bitmap + 0x1000 / BYTES_PER_LONG;
>  
>      return msr_bit;
> @@ -2539,8 +2539,8 @@ const struct hvm_function_table * __init start_svm(void)
>  
>      setup_vmcb_dump();
>  
> -    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000a )
> -        svm_feature_flags = cpuid_edx(0x8000000a);
> +    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
> +        svm_feature_flags = cpuid_edx(0x8000000aU);
>  
>      printk("SVM: Supported advanced features:\n");
>  
> -- 
> 2.41.0
> 

