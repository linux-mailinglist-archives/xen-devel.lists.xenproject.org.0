Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C83976F699
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 02:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576668.903059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiuE-0004kn-RM; Fri, 04 Aug 2023 00:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576668.903059; Fri, 04 Aug 2023 00:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRiuE-0004iw-NI; Fri, 04 Aug 2023 00:43:02 +0000
Received: by outflank-mailman (input) for mailman id 576668;
 Fri, 04 Aug 2023 00:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRiuD-0004im-3L
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 00:43:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db29d1ed-325f-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 02:42:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E92761EF7;
 Fri,  4 Aug 2023 00:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBAFC433C7;
 Fri,  4 Aug 2023 00:42:55 +0000 (UTC)
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
X-Inumbo-ID: db29d1ed-325f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691109776;
	bh=UdXT2+JAmcKcv7dOtJNeXBI+rNm0c9k8j9eT6RBgY3Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kJ3QqrSHslJGLiwb4kI4SayoF8TMhC7gDLOfxzMoLmmCF5a40iralPryD4G/9N1ll
	 DH+0+xKOJDKwM8fi8fbHZKc9OLmFH8Spvcw60SzdSU2g0NeT1jajTem1I3taHV+P/8
	 zQClv+xp+6+hCyru1I/Za0fJ7MgNgQXA5xl2VWQDw5ayBvijvoJN8aw2ELWZWvXon+
	 +dH38jgS9iiGwl7gMAO8b95qt23Em0ba6+z2kN9fZBeZpm5qBMf0ClzKwJx9ICakmb
	 UofvkHsax9ZawhSzf3B4hmy637HOiJnFtQC7HWgIQaR3MubuRE6beTvqaujY6jc3WO
	 x0PJuRFO3ygzw==
Date: Thu, 3 Aug 2023 17:42:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/13] x86/svm: address violations of MISRA C:2012
 Rule 7.3
In-Reply-To: <2779c3b2cbe27d95274a4ab44f6b9c877e59e8bc.1691053438.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031742470.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <2779c3b2cbe27d95274a4ab44f6b9c877e59e8bc.1691053438.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> states:
> "The lowercase character 'l' shall not be used in a literal suffix".
> 
> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> 
> The changes in this patch are mechanical.
> 
> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/hvm/svm/svm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index b3845bdca7..01dd592d9b 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1077,7 +1077,7 @@ static void svm_guest_osvw_init(struct domain *d)
>       * Guests should see errata 400 and 415 as fixed (assuming that
>       * HLT and IO instructions are intercepted).
>       */
> -    svm->osvw.length = min(max(3ul, osvw_length), 64ul);
> +    svm->osvw.length = min(max(3UL, osvw_length), 64UL);
>      svm->osvw.status = osvw_status & ~6;
>  
>      /*
> @@ -1652,7 +1652,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
>      else if ( pfec & NPT_PFEC_in_gpt )
>          npfec.kind = npfec_kind_in_gpt;
>  
> -    ret = hvm_hap_nested_page_fault(gpa, ~0ul, npfec);
> +    ret = hvm_hap_nested_page_fault(gpa, ~0UL, npfec);
>  
>      if ( tb_init_done )
>      {
> -- 
> 2.34.1
> 
> 

