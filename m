Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50213742D6F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557033.870024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExFB-0004ix-K7; Thu, 29 Jun 2023 19:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557033.870024; Thu, 29 Jun 2023 19:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExFB-0004gH-Gk; Thu, 29 Jun 2023 19:23:53 +0000
Received: by outflank-mailman (input) for mailman id 557033;
 Thu, 29 Jun 2023 19:23:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qExFA-0004g9-BI
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:23:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 793a74cf-16b2-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 21:23:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93CD061602;
 Thu, 29 Jun 2023 19:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A264C433C8;
 Thu, 29 Jun 2023 19:23:46 +0000 (UTC)
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
X-Inumbo-ID: 793a74cf-16b2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688066628;
	bh=Tp5ftz1O2T2j2QXmu2EUJBq4TSbmYH/0Oj709Uv2u/k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gfyqu+DhcMqVnv1E4glzprOkO8SgryFXJjy6xV7H9G69uQMM0oSRpp+3KH2mdtOUJ
	 nqbFK0tJLDZS0LOCZAucawW8qdGkwZPxKHBmHT0QfulfUcowC2TfulkJCAP4wdiO4A
	 YPtSx9+nS1IRTLTcVW8y8DCJ2GOMwnXIFw2fUjLP0BwdKsUpFCJYbhhrSroJhofpgf
	 XfGS1EfS9F7lOMQui0sjqzq3qQumohKF3i2qGlkKJrQc1Uin4Y8ZAL1gaxaVcTTTuD
	 XwtgVBW9ySUVslTD/HRY7Xro715HWMRA115UV8BdtFEN/hamLBJE1Ak29uTuXiUkJl
	 kKJbAMpU98DEg==
Date: Thu, 29 Jun 2023 12:23:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 1/5] x86: swap parameter names of hvm_copy_context_and_params()
 declaration
In-Reply-To: <441ddc3eb422c009d68db090166cfbc863d6c0b7.1688049495.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306291222390.3936094@ubuntu-linux-20-04-desktop>
References: <cover.1688049494.git.federico.serafini@bugseng.com> <441ddc3eb422c009d68db090166cfbc863d6c0b7.1688049495.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jun 2023, Federico Serafini wrote:
> Swap parameter names 'src' and 'dst' of hvm_copy_context_and_params()
> declaration for consistency with the corresponding definition and the
> uses of such function.
> Also, this fixes a violation of MISRA C:2012 Rule 8.3.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

better to change the title of the patch to:
x86/hvm: swap parameter names of hvm_copy_context_and_params() declaration

It could be done on commit.


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/include/asm/hvm/hvm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 04cbd4ff24..9555b4c41f 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -366,7 +366,7 @@ const char *hvm_efer_valid(const struct vcpu *v, uint64_t value,
>                             signed int cr0_pg);
>  unsigned long hvm_cr4_guest_valid_bits(const struct domain *d);
>  
> -int hvm_copy_context_and_params(struct domain *src, struct domain *dst);
> +int hvm_copy_context_and_params(struct domain *dst, struct domain *src);
>  
>  int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
>  
> -- 
> 2.34.1
> 

