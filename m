Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B845B1F05B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 23:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075267.1437713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUwh-0003no-Jr; Fri, 08 Aug 2025 21:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075267.1437713; Fri, 08 Aug 2025 21:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukUwh-0003lN-GX; Fri, 08 Aug 2025 21:48:15 +0000
Received: by outflank-mailman (input) for mailman id 1075267;
 Fri, 08 Aug 2025 21:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wHVc=2U=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ukUwf-0003lH-Qy
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 21:48:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c1b711-74a1-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 23:48:12 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8CEB74EE3C0F;
 Fri,  8 Aug 2025 23:48:11 +0200 (CEST)
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
X-Inumbo-ID: 61c1b711-74a1-11f0-a324-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754689691;
	b=LraQxGs/6v/ylioM9b3HQ7xMbZHpBYNlFEjpQv+6o1NBkHaT1owc6biH5x65if854Ud3
	 kpeD/15snqbO8j99T1StJgsvYzSR+jxzc77/DINMxwaGA6ya9M4zhNVTrmhc3tcMl3Wl9
	 uw6weqWa3F9wWws5cx+IjBC55onNaUe2LFB7BRwF5+7lhbadmeDCdS/IFAe8clE74WFWZ
	 0OVcpxg8eUpmexsBqYN8qqAiFg4AAWTDJihkNkOKKJlDrVMiaJVAv3OmbTbxFQ2LReWAB
	 gfrw7IBx412E3ON+DtkX2rSw5MWCr92oNLROcaJ6UJskSXFKQVk8B6xdtURc8RONaVgAN
	 hPX1yosKY4AKVxoRlRJknyuu9V3OViioBhGBM8+SZtrXWwapLMwX7XLwjTxcJOtufCpwD
	 OfsIXUEWrlIFFEaBNNUG+BdaxshH1B+X2l5UwUQ+1bL45kV5Hj63kN4ivsA8RTDbnigc9
	 D9Iyq53xen5ySoppWVQqLZmpozp3zpkbn0nP+2rABP4sBPaTG5z9MSa2Zt6pIs6fx684g
	 UOlVWe+GFSZyEespSvAKvVEKeeJdkVWv207300qgJ4qWoy3DpM7sYvx7eaxfOG9Rf5Ros
	 +wU6rvEYHY1KpfbvyPxG81Ug2ly6pzuYpPXImQuaTZo8R6pedfqwdQvSqwZ8fAo=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754689691;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=xFcQKHXegIvKJblG1Z3LGDUHf+S7KN1+cD6cSTYks0E=;
	b=vYMeuOckxNiHzqDn3b+V7wyaMLVBm0cbh8bGMEDwq76glLFI1QbYE3CQbh2xTMwE7OYC
	 OVNoZcUq/y7sA4+2rss+T5xuv1HpKKoHvmsAUJGFqQbNfY8SAflQ429tG7vkTHSaanTBN
	 Cub/DxLAsG6n1+jjcGtnNXi6qWAJ9D7vqwQ7xnpYWRfXFZncVv9cskuNy7nW0hLu94Im/
	 +yLjuDvo9l9k8Vu/rRUH44vPOdlKGXURxZF9Zx938euzTIe9bOOyIy3kAZiApQY8xogDI
	 NrXPZ2k4RSLm3MkF6GtVbT3M4tk2KP4/vYtJm03ftjdgAOZe7NSIM140hMkpdSQs3JD+H
	 jJqAEXdNudsEsJn63j9aRYdAFgrWPJa6iLvxchS3pP9k5PNqDl7JeBQ4bHKTZGXj01nRR
	 gxRowfcN8YW0XqqSWZXRS2AFJmFnBtZNxbHHEGjQiPimxQfxB3YFnXogOJEmvJfxcMMe1
	 1WmfskNCHYqQpkxYQ9eZjBLC4FvPuoWlqDo5YEgDnbjJncFq2aYh8AuV4/ZtTD6ZbwdA9
	 8FKu+3SuGtxDYLDeSG6OzqjD5hHo00ksmZXti4MEFRP3GimesbKmyb0IiFqCVf1UBlboT
	 sBVoiMzUliv7Ul1TbiOZrG0e/rWcm1PWJOfhTA+s4BlbEXnNEzvJNtAJKOBrfTQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754689691; bh=ysuzWgd3sr4j/IHxZwC3H6VTCfSPR6a0Xlv7ccrgPXc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H0wbnSGPSVy3KISgY2saU/ARDgww4GEjvDI4xzqXd9z0ecv2EQ7F3k1HN9O7p6Nwv
	 gQDkXVZiZ0URhcTJjB0GewALT1AjEzetczg69ZjmujaXjfnXhGOTdAZLC6FBAmHimR
	 3cPojdGv3kCoJyVjesDMwICqQOG/7jYKRSMYAVA+cM0IWRb/BQan6OSUyrdWZrPLMA
	 QNtdLX05FDI8SevxDIhWRxZzIkSqGvXN/1l+TQnbeAG+BRnIhDwvpHY77ZWoBF1EjM
	 HqYYyTrO26TQp5lk8hh3FKzyL2K8Du6UUiGt+vRey342/ph/zGF8CSZ2MqGw6JG8xR
	 Cn2cqIbm2D3Tg==
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 23:48:11 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, consulting@bugseng.com,
 dmytro_prokopchuk1@epam.com, andrew.cooper3@citrix.com, jbeulich@suse.com,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 1/2] automation/eclair: ECLAIR configuration changes
 due to GitLab runner update
In-Reply-To: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
References: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
Message-ID: <7dfa016caddc615b7bbbef3781dd23a4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-08 23:40, Nicola Vetrini wrote:
> Update configurations to adapt to the new syntax used by the newer
> version of the tool in the GitLab runner.
> 

Sorry, forgot to include the cover letter. See below.

 From c4da2554d94c3f7bd4b1e460dcaa27db382ece2f Mon Sep 17 00:00:00 2001
Message-ID: <cover.1754689388.git.nicola.vetrini@bugseng.com>
 From: Nicola Vetrini <nicola.vetrini@bugseng.com>
Date: Fri, 8 Aug 2025 23:43:08 +0200
Subject: [XEN PATCH 0/2] Update ECLAIR runner and address MISRA 
violations

The first patch of the series contains the necessary updates to the
ECLAIR syntax needed to run the updated runners. The change was
motivated by usage of the new syntax in a deviation that is part of the
second patch.

As a result, the runners should be updated either just before or just
after committing the patches.

These have not been properly tested yet on an ECLAIR analysis of Xen, 
but
I sent the patches to get some feedback first and then coordinate with
maintainers to take the needed action once agreed on the approach.

Nicola Vetrini (2):
   automation/eclair: ECLAIR configuration changes due to GitLab runner
     update
   Address violation of MISRA C Rule 13.1 involving asm side effects.

  automation/eclair_analysis/ECLAIR/deviations.ecl | 16 ++++++++++------
  1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0


> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> This will of course need coordination with me to update the runners
> just before committing the patches, as any analysis done in between 
> will
> fail due to syntax errors in the tool configuration files.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index ebce1ceab912..ec0cac797e5f 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -536,8 +536,8 @@ safe."
>  -config=MC3A2.R16.3,reports+={safe, 
> "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? 
> \\*/.*$,0..2))))"}
>  -doc_end
> 
> --doc_begin="Switch statements having a controlling expression of enum 
> type deliberately do not have a default case: gcc -Wall enables 
> -Wswitch which warns (and breaks the build as we use -Werror) if one of 
> the enum labels is missing from the switch."
> --config=MC3A2.R16.4,reports+={deliberate,'any_area(kind(context)&&^.* 
> has no 
> `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,type(canonical(enum_underlying_type(any())))))))'}
> +-doc_begin="Switch statements having a controlling expression of enum 
> type deliberately do not have a default case: gcc -Wall enables 
> -Wswitch which warns (and breaks the build as -Werror is used) if one 
> of the enumeration values is missing from the switch."
> +-config=MC3A2.R16.4,reports+={deliberate,"any_area(kind(context)&&^.* 
> has no 
> `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,ref(enum_underlying_type(any()))))))"}
>  -doc_end
> 
>  -doc_begin="A switch statement with a single switch clause and no 
> default label may be used in place of an equivalent if statement if it 
> is considered to improve readability."
> @@ -596,10 +596,10 @@ in assignments; (5) as initializers, possibly 
> designated, in initalizer lists;
>  -config=MC3A2.R20.7,expansion_context=
>  {safe, "context(__call_expr_arg_contexts)"},
>  {safe, "left_right(^[(,\\[]$,^[),\\]]$)"},
> -{safe, "context(skip_to(__expr_non_syntactic_contexts, 
> stmt_child(node(array_subscript_expr), subscript)))"},
> -{safe, "context(skip_to(__expr_non_syntactic_contexts, 
> stmt_child(operator(assign), lhs)))"},
> -{safe, "context(skip_to(__expr_non_syntactic_contexts, 
> stmt_child(node(init_list_expr||designated_init_expr), init)))"},
> -{safe, "context(skip_to(__expr_non_syntactic_contexts, 
> stmt_child(node(case_stmt), lower||upper)))"}
> +{safe, "context(skip(__expr_non_syntactic_contexts, 
> is(subscript)&&node(array_subscript_expr)))"},
> +{safe, "context(skip(__expr_non_syntactic_contexts, 
> is(lhs)&&stmt(operator(assign))))"},
> +{safe, "context(skip(__expr_non_syntactic_contexts, 
> is(init)&&node(init_list_expr||designated_init_expr)))"},
> +{safe, "context(skip(__expr_non_syntactic_contexts, 
> is(lower||upper)&&node(case_stmt)))"}
>  -doc_end
> 
>  -doc_begin="Violations involving the __config_enabled macros cannot be 
> fixed without

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

