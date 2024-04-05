Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877DD899299
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701059.1095130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXQh-0006E4-6b; Fri, 05 Apr 2024 00:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701059.1095130; Fri, 05 Apr 2024 00:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXQh-0006Bi-3P; Fri, 05 Apr 2024 00:27:39 +0000
Received: by outflank-mailman (input) for mailman id 701059;
 Fri, 05 Apr 2024 00:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsXQf-0006Ba-V2
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:27:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c5fea5b-f2e3-11ee-afe5-a90da7624cb6;
 Fri, 05 Apr 2024 02:27:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B8DC6178E;
 Fri,  5 Apr 2024 00:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6BCC433C7;
 Fri,  5 Apr 2024 00:27:32 +0000 (UTC)
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
X-Inumbo-ID: 4c5fea5b-f2e3-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712276854;
	bh=GxsmvDDq2LYhU0OGXSmmHfWKNFojvsFGDr0U8bYt0BM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ONZIvxMCezsT7W6pMTPM7fheE8rJq2meLf4kdJ4B15gVvEtFBhKWred1EglfJS672
	 OLdxkq+jLRly0DNVNgKZ+Vo1vOwmr9IiowrnPpg3AcsBKKsEsD76Sm8bRsEKYYqrKb
	 3zR4Xl4JsL6TMW1gIt0PyiI8XYN7UEFAvdhZfaphwviqwzlGVepwMnxFuLERJ22vvx
	 M00xeuy4bSixvCV6v1YK8wka2gdlw+F8BcvZk/GlYpgbDkorrJ/fbw/JSfktu+zPLf
	 kgMeI6+jsOW2XjB8hIn73WbcZ+rsv8SKn/DsCTL6ZkCdjI0Kil/SbHJm6FI4ut4Etm
	 WoMeJIVIansQw==
Date: Thu, 4 Apr 2024 17:27:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3 2/2] MISRA C Rule 20.7 states: "The features of
 `<stdarg.h>' shall not be used"
In-Reply-To: <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404041725580.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1711621080.git.simone.ballarin@bugseng.com> <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Mar 2024, Simone Ballarin wrote:
> The Xen community wants to avoid using variadic functions except for
> specific circumstances where it feels appropriate by strict code review.
> 
> Functions hypercall_create_continuation and hypercall_xlat_continuation
> are internal helper functions made to break long running hypercalls into
> multiple calls. They take a variable number of arguments depending on the
> original hypercall they are trying to continue.
> 
> Add SAF deviations for the aforementioned functions.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I fixed the title on commit


> ---
> Changes in v3:
> - rebase: change SAF-3-safe to SAF-4-safe.
> Changes in v2:
> - replaced "special hypercalls" with "internal helper functions".
> ---
>  docs/misra/safe.json     | 8 ++++++++
>  xen/arch/arm/domain.c    | 1 +
>  xen/arch/x86/hypercall.c | 2 ++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index d361d0e65c..fe2bc18509 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -36,6 +36,14 @@
>          },
>          {
>              "id": "SAF-4-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R17.1"
> +            },
> +            "name": "Rule 17.1: internal helper functions made to break long running hypercalls into multiple calls.",
> +            "text": "They need to take a variable number of arguments depending on the original hypercall they are trying to continue."
> +        },
> +        {
> +            "id": "SAF-5-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index f38cb5e04c..34cbfe699a 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -382,6 +382,7 @@ unsigned long hypercall_create_continuation(
>      const char *p = format;
>      unsigned long arg, rc;
>      unsigned int i;
> +    /* SAF-4-safe allowed variadic function */
>      va_list args;
>  
>      current->hcall_preempted = true;
> diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
> index 01cd73040d..133e9f221c 100644
> --- a/xen/arch/x86/hypercall.c
> +++ b/xen/arch/x86/hypercall.c
> @@ -31,6 +31,7 @@ unsigned long hypercall_create_continuation(
>      const char *p = format;
>      unsigned long arg;
>      unsigned int i;
> +    /* SAF-4-safe allowed variadic function */
>      va_list args;
>  
>      curr->hcall_preempted = true;
> @@ -115,6 +116,7 @@ int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
>      struct cpu_user_regs *regs;
>      unsigned int i, cval = 0;
>      unsigned long nval = 0;
> +    /* SAF-4-safe allowed variadic function */
>      va_list args;
>  
>      ASSERT(nr <= ARRAY_SIZE(mcs->call.args));
> -- 
> 2.34.1
> 

