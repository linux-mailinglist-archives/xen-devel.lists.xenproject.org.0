Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ECB8B5904
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 14:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714047.1115020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1QRf-0004WT-1E; Mon, 29 Apr 2024 12:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714047.1115020; Mon, 29 Apr 2024 12:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1QRe-0004TT-UH; Mon, 29 Apr 2024 12:49:22 +0000
Received: by outflank-mailman (input) for mailman id 714047;
 Mon, 29 Apr 2024 12:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7+Y=MC=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1s1QRd-0004TH-DC
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 12:49:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e50f0b68-0626-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 14:49:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 314704EE0738;
 Mon, 29 Apr 2024 14:49:19 +0200 (CEST)
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
X-Inumbo-ID: e50f0b68-0626-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Mon, 29 Apr 2024 14:49:19 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair_enalysis: amend configuration for
 some MISRA rules
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <7e8f6f4e0e007656d8809c4d521e73e642747d7f.1714394212.git.alessandro.zucchelli@bugseng.com>
References: <7e8f6f4e0e007656d8809c4d521e73e642747d7f.1714394212.git.alessandro.zucchelli@bugseng.com>
Message-ID: <b1ef1faec9834805e5db85e214b09bb2@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-29 14:44, Alessandro Zucchelli wrote:
> Adjust ECLAIR configuration for rules: R21.14, R21.15, R21.16 by taking
> into account mem* macros defined in the Xen sources as if they were
> equivalent to the ones in Standard Library.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
>  automation/eclair_analysis/ECLAIR/analysis.ecl | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl 
> b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index a604582da3..f3b634baba 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -19,6 +19,23 @@ map_strings("scheduled-analysis",analysis_kind)
> 
>  -enable=B.EXPLAIN
> 
> +-doc_begin="These configurations serve the purpose of recognizing the 
> 'mem*' macros as
> +their Standard Library equivalents."
> +
> +-config=MC3R1.R21.14,call_select+=
> +{"macro(^memcmp$)&&any_arg(1..2, 
> skip(__non_syntactic_paren_cast_stmts, node(string_literal)))",
> + "any()", violation, "%{__callslct_any_base_fmt()}", {{arg, 
> "%{__callslct_arg_fmt()}"}}}
> +
> +-config=MC3R1.R21.15,call_args+=
> +{"macro(^mem(cmp|move|cpy)$)", {1, 2}, "unqual_pointee_compatible",
> + "%{__argscmpr_culprit_fmt()}", "%{__argscmpr_evidence_fmt()}"}
> +
> +-config=MC3R1.R21.16,call_select+=
> +{"macro(^memcmp$)&&any_arg(1..2, skip(__non_syntactic_paren_stmts, 
> type(canonical(__memcmp_pte_types))))",
> + "any()", violation, "%{__callslct_any_base_fmt()}", 
> {{arg,"%{__callslct_arg_type_fmt()}"}}}
> +
> +-doc_end
> +
>  -eval_file=toolchain.ecl
>  -eval_file=public_APIs.ecl
>  if(not(scheduled_analysis),

Typo in the title: should be automation/eclair_analysis.
Sorry.
-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

