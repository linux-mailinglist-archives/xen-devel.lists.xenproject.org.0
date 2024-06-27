Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C92391B29F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 01:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750383.1158552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMyOR-0005PV-Kl; Thu, 27 Jun 2024 23:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750383.1158552; Thu, 27 Jun 2024 23:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMyOR-0005NV-Ht; Thu, 27 Jun 2024 23:19:07 +0000
Received: by outflank-mailman (input) for mailman id 750383;
 Thu, 27 Jun 2024 23:19:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMyOQ-0005NP-HT
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 23:19:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3729df8-34db-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 01:19:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 962CACE38EB;
 Thu, 27 Jun 2024 23:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F444C2BBFC;
 Thu, 27 Jun 2024 23:18:58 +0000 (UTC)
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
X-Inumbo-ID: a3729df8-34db-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719530339;
	bh=vvSrM9S+NU+xVveE+rpadMDdDOUqZa36aZzukwm2AMA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kppyzGEGFEdYO5X7bdOmIxnf5rBSOaMQyhX/rDCebj1oGa4cVRDeZLofzi1ptkKny
	 ZOpiklgKC/X62cTxUZdXVfXNCtvZiPmwmcVn436lQ7DGxkOSGwWkgIMFt/hC/lTwSX
	 eQ5ew3DOO6lnRSDy8toYf82KKvA0381vy96wGn1SgXt2KbaDHMe+i7/TDez4cLDvzx
	 m/Ekx0LrZUiIYPZR4Jj8THCOlvqNHgqgVXe0PKgPmUSfaKcjBeGCKwhQSCvKGUAyrx
	 6AXumJTdL6f4jgIWjnTOEYdZnOHCUG4MHbJwMeeHa7KfNk2e7Nc4gvxFU3vV5CfEEm
	 10PMFHIAfmWCA==
Date: Thu, 27 Jun 2024 16:18:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] x86: p2m-pod: address violation of MISRA C Rule
 2.1
In-Reply-To: <a050ef1b662f64bb58afb2f6118254254dd1d649.1719478448.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406271617320.3635@ubuntu-linux-20-04-desktop>
References: <a050ef1b662f64bb58afb2f6118254254dd1d649.1719478448.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jun 2024, Nicola Vetrini wrote:
> The label 'out_unmap' is only reachable after ASSERT_UNREACHABLE,
> so the code below is only executed upon erroneously reaching that
> program point and calling domain_crash, thus resulting in the
> for loop after 'out_unmap' to become unreachable in some configurations.
> 
> This is a defensive coding measure to have a safe fallback that is
> reachable in non-debug builds, and can thus be deviated with a
> comment-based deviation.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

The patch needs rebasing as it doesn't apply to staging anymore

Other than that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

This is actually going help also in terms of identifying impossible code
paths for coverage

> ---
>  docs/misra/safe.json      | 8 ++++++++
>  xen/arch/x86/mm/p2m-pod.c | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index c213e0a0be3b..b114c9485c86 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -60,6 +60,14 @@
>          },
>          {
>              "id": "SAF-7-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.R2.1"
> +            },
> +            "name": "MC3R1.R2.1: statement unreachable in some configurations",
> +            "text": "Every path that can reach this statement is preceded by statements that make it unreachable in certain configurations (e.g. ASSERT_UNREACHABLE). This is understood as a means of defensive programming."
> +        },
> +        {
> +            "id": "SAF-8-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
> index bd84fe9e27ee..5a96c46a2286 100644
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -1040,6 +1040,7 @@ out_unmap:
>       * Something went wrong, probably crashing the domain.  Unmap
>       * everything and return.
>       */
> +    /* SAF-7-safe Rule 2.1: defensive programming */
>      for ( i = 0; i < count; i++ )
>          if ( map[i] )
>              unmap_domain_page(map[i]);
> -- 
> 2.34.1
> 

