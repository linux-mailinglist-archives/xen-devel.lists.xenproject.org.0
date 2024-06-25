Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6FD915B17
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747036.1154314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuJk-0007wt-35; Tue, 25 Jun 2024 00:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747036.1154314; Tue, 25 Jun 2024 00:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuJk-0007vA-0K; Tue, 25 Jun 2024 00:45:52 +0000
Received: by outflank-mailman (input) for mailman id 747036;
 Tue, 25 Jun 2024 00:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuJi-0006mj-0W
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:45:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43b65cec-328c-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:45:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28C9F6035D;
 Tue, 25 Jun 2024 00:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7486C2BBFC;
 Tue, 25 Jun 2024 00:45:46 +0000 (UTC)
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
X-Inumbo-ID: 43b65cec-328c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276347;
	bh=aaxf+ji/ptweHJPtDnQS2q/m4wnxpBHymjbwKJ1gOTg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s1oXxf6snDxBlc80Z6iQ2pYo50e5nSTML37+5/iaj6P5NA2RqMIbGjejezlUrK4FQ
	 sbi9awcAuF1B4RP7jVQWrw/jC9nxpeSnionGs8YYaaFnH1u3sShRJs0+ocKwzejzth
	 FJfJA02WYQclq+IvpjlPH1QHfaiKa0zM+hkkHGa5WnRyVUd/6Nnz8EiicxpNAY289s
	 OxCEJE1KFON2kx8+57BM3nVUj7ynMsqf0S7oSv92RKIHEEG+vpEUxkww1XoTDF6Xmg
	 9UUEqCV53Pu7qL2mQqIOtVwA+m1CSocxRp+Tn3/X9MG/0/39j0cEm9kuDhjnlO5K/X
	 M16aYDWIokFfw==
Date: Mon, 24 Jun 2024 17:45:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 1/6][RESEND] automation/eclair: address violations
 of MISRA C Rule 20.7
In-Reply-To: <af4b0512eb52be99e37c9c670f98967ca15c68ac.1718378539.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241745140.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com> <af4b0512eb52be99e37c9c670f98967ca15c68ac.1718378539.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Jun 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses".
> 
> The helper macro bitmap_switch has parameters that cannot be parenthesized
> in order to comply with the rule, as that would break its functionality.
> Moreover, the risk of misuse due developer confusion is deemed not
> substantial enough to warrant a more involved refactor, thus the macro
> is deviated for this rule.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

I would have preferred a SAF tag instead but it can be done later

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 447c1e6661d1..c2698e7074aa 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -463,6 +463,14 @@ of this macro do not lead to developer confusion, and can thus be deviated."
>  -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>  -doc_end
>  
> +-doc_begin="The arguments of macro bitmap_switch macro can't be parenthesized as
> +the rule would require, without breaking the functionality of the macro. This is
> +a specialized local helper macro only used within the bitmap.h header, so it is
> +less likely to lead to developer confusion and it is deemed better to deviate it."
> +-file_tag+={xen_bitmap_h, "^xen/include/xen/bitmap\\.h$"}
> +-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(loc(file(xen_bitmap_h))&&^bitmap_switch$))))"}
> +-doc_end
> +
>  -doc_begin="Uses of variadic macros that have one of their arguments defined as
>  a macro and used within the body for both ordinary parameter expansion and as an
>  operand to the # or ## operators have a behavior that is well-understood and
> -- 
> 2.34.1
> 

