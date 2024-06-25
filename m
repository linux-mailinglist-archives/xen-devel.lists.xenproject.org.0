Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40289915B16
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747028.1154303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuJ3-0007JU-Ng; Tue, 25 Jun 2024 00:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747028.1154303; Tue, 25 Jun 2024 00:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuJ3-0007Hf-Ks; Tue, 25 Jun 2024 00:45:09 +0000
Received: by outflank-mailman (input) for mailman id 747028;
 Tue, 25 Jun 2024 00:45:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuJ2-0006mj-9K
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:45:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ac1d045-328c-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:45:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0865D60F80;
 Tue, 25 Jun 2024 00:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B91CC32786;
 Tue, 25 Jun 2024 00:45:04 +0000 (UTC)
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
X-Inumbo-ID: 2ac1d045-328c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276305;
	bh=g7R6x5apNxQHB7old6xqfKbgGuO0ogJzumML+KWlAVw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W4p/dkt00RNJEju2ekiUJnywHk9syXAokFV6VIJADdHEYS0ljj0ZmmbgFxCnAALju
	 4pucPlrt/RkEyZPrnR8KoBsXdEWBZRNoZ8eUuM761U4l1nXrtt98HaP2Qb+kVMups4
	 seIGGV8zOexLHD59AWPlq7xOkiGfPF0S/vSTh+/J7ePsGnLxRGD1uD1xlL3Pe11HE2
	 7hZANNWSrFiQajNW51zW7fYJITmr3mNGus+fOYUcFvMwdcqzOlBmS1XrIC6+cDicdu
	 9wndxpdo/+sLM1y+PVuAZeaakZGNIf5jcw+8bCk9C/IM788GITb+V4T57RWblsnsMS
	 nqIyk3TucVFAA==
Date: Mon, 24 Jun 2024 17:45:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2 4/6][RESEND] automation/eclair_analysis: address
 violations of MISRA C Rule 20.7
In-Reply-To: <dfebde9cc657f2669df60b08ca34352288e082ab.1718378539.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241744540.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com> <dfebde9cc657f2669df60b08ca34352288e082ab.1718378539.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Jun 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses".
> 
> The local helpers GRP2 and XADD in the x86 emulator use their first
> argument as the constant expression for a case label. This pattern
> is deviated project-wide, because it is very unlikely to induce
> developer confusion and result in the wrong control flow being
> carried out.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Introduce a deviation instead of adding parentheses
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++--
>  docs/misra/deviations.rst                        | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index c2698e7074aa..fc248641dc78 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -428,13 +428,15 @@ unexpected result when the structure is given as argument to a sizeof() operator
>  
>  -doc_begin="Code violating Rule 20.7 is safe when macro parameters are used: (1)
>  as function arguments; (2) as macro arguments; (3) as array indices; (4) as lhs
> -in assignments; (5) as initializers, possibly designated, in initalizer lists."
> +in assignments; (5) as initializers, possibly designated, in initalizer lists;
> +(6) as the constant expression in a switch clause label."
>  -config=MC3R1.R20.7,expansion_context=
>  {safe, "context(__call_expr_arg_contexts)"},
>  {safe, "left_right(^[(,\\[]$,^[),\\]]$)"},
>  {safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(array_subscript_expr), subscript)))"},
>  {safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(operator(assign), lhs)))"},
> -{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(init_list_expr||designated_init_expr), init)))"}
> +{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(init_list_expr||designated_init_expr), init)))"},
> +{safe, "context(skip_to(__expr_non_syntactic_contexts, stmt_child(node(case_stmt), lower||upper)))"}
>  -doc_end
>  
>  -doc_begin="Violations involving the __config_enabled macros cannot be fixed without
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 36959aa44ac9..be2cc6bf03eb 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -376,7 +376,8 @@ Deviations related to MISRA C:2012 Rules:
>         (2) as macro arguments;
>         (3) as array indices;
>         (4) as lhs in assignments;
> -       (5) as initializers, possibly designated, in initalizer lists.
> +       (5) as initializers, possibly designated, in initalizer lists;
> +       (6) as constant expressions of switch case labels.
>       - Tagged as `safe` for ECLAIR.
>  
>     * - R20.7
> -- 
> 2.34.1
> 

