Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F9911736
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 02:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744921.1152032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKRz5-0002xg-Cm; Fri, 21 Jun 2024 00:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744921.1152032; Fri, 21 Jun 2024 00:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKRz5-0002v6-9g; Fri, 21 Jun 2024 00:18:31 +0000
Received: by outflank-mailman (input) for mailman id 744921;
 Fri, 21 Jun 2024 00:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKRz2-0002uz-KO
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 00:18:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5f30e1e-2f63-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 02:18:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCB56619D9;
 Fri, 21 Jun 2024 00:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561C0C2BD10;
 Fri, 21 Jun 2024 00:18:22 +0000 (UTC)
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
X-Inumbo-ID: c5f30e1e-2f63-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718929103;
	bh=1USuxWu7b9A6qXib0MYnNhePTbZqLfTkORHQ+Mmycks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a21mVf57u5xXnXJRYuhqsZ6SG0mUkSOGDmbN0xE57FCrOfInDM1osxe8gcv5QSkP/
	 8M5ncplykX3cMuobHw2ea/BTo1YsMeMDG9yX6GEZ3dJ6LSjrcPnvGoTWyxsOLkDcMN
	 7LR84hiSuhChXXgzUasXy8OOqC1GmDkrS1fzSyyPfXGuOl9a8oJ0iJAyVSHHtfNcJw
	 af7IFu+XB0r7X5Tr8QRZVRmF1vGfLuUqDaioPQyg1rQAFaRlU1BIfQwWwaVIV08r6M
	 hCSdMUssE1rsXueCv6E3Ws/GLK5+Mhk4DXPVxUqgsJtBiGnE2ZAgdTKGffSk7suofJ
	 0A0NcLc8KJYYA==
Date: Thu, 20 Jun 2024 17:18:20 -0700 (PDT)
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
Message-ID: <alpine.DEB.2.22.394.2406201718140.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com> <af4b0512eb52be99e37c9c670f98967ca15c68ac.1718378539.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2024, Nicola Vetrini wrote:
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

If possible, I would prefer we used a SAF in-code comment deviation. If
that doesn't work for any reason this patch is fine and I'd ack it.


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

