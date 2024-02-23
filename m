Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BC86083B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 02:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684598.1064550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdKMI-00008m-Hz; Fri, 23 Feb 2024 01:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684598.1064550; Fri, 23 Feb 2024 01:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdKMI-00005M-FG; Fri, 23 Feb 2024 01:28:14 +0000
Received: by outflank-mailman (input) for mailman id 684598;
 Fri, 23 Feb 2024 01:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdKMH-00005G-1J
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 01:28:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce073b2a-d1ea-11ee-8a55-1f161083a0e0;
 Fri, 23 Feb 2024 02:28:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 63BF7CE28EA;
 Fri, 23 Feb 2024 01:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22A4C433C7;
 Fri, 23 Feb 2024 01:28:03 +0000 (UTC)
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
X-Inumbo-ID: ce073b2a-d1ea-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708651686;
	bh=46goDBKRAJzr8WceLOh1hdvsIDopHFd3Eu4bfTNcDb0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QKZRClp7rQQWEYKGiCIk+EupIbY/kt+Ccrp16QgSV3gw7yOr0y7RUTYLr44pbpFrZ
	 BlpyaMg/jPEQIjaliY/+/GbmhYztDMtZRxtnf4KLgi38GcblrV3x8JACVkt/kVnqMk
	 iYc6jqToNm5lNC4KsNn3YM0S/cRynhSpyepZRchafJbhtn1OcDD2+IypfHc25WvTpf
	 JpdfNOMDQG4XHqMuHuRgr9MUBTjKwwzOx7xDPYGa2RgYRDUPveacpsMLqZrltcgsnG
	 V0k18OTFUJDf9K30mG7FqwMD3kz4v7lvk1pw4eIK6KBb+q1PrWbICUgqR20SMhs/uY
	 a42LJLdfHN95A==
Date: Thu, 22 Feb 2024 17:28:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate certain macros
 for Rule 20.12
In-Reply-To: <7bc72f6ccd858e0405d62d49c32449e3b5abd790.1707996317.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402221727370.754277@ubuntu-linux-20-04-desktop>
References: <7bc72f6ccd858e0405d62d49c32449e3b5abd790.1707996317.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Feb 2024, Nicola Vetrini wrote:
> Certain macros are allowed to violate the Rule, since their meaning and
> intended use is well-known to all Xen developers.
> 
> Variadic macros that rely on the GCC extension for removing a trailing
> comma when token pasting the variable argument are similarly
> well-understood and therefore allowed.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> Changes in v2:
> - Restrict deviation for GENERATE_CASE to vcpreg.c.
> - Improve deviation justifications.
> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 20 +++++++++++++++++
>  docs/misra/deviations.rst                     | 22 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fd32ff8a9cae..04cb41e16a50 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -387,6 +387,26 @@ in assignments."
>  {safe, "left_right(^[(,\\[]$,^[),\\]]$)"}
>  -doc_end
>  
> +-doc_begin="Uses of variadic macros that have one of their arguments defined as
> +a macro and used within the body for both ordinary parameter expansion and as an
> +operand to the # or ## operators have a behavior that is well-understood and
> +deliberate."
> +-config=MC3R1.R20.12,macros+={deliberate, "variadic()"}
> +-doc_end
> +
> +-doc_begin="Uses of a macro parameter for ordinary expansion and as an operand
> +to the # or ## operators within the following macros are deliberate, to provide
> +useful diagnostic messages to the user."
> +-config=MC3R1.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO)"}
> +-doc_end
> +
> +-doc_begin="The helper macro GENERATE_CASE may use a macro parameter for ordinary
> +expansion and token pasting to improve readability. Only instances where this
> +leads to a violation of the Rule are deviated."
> +-file_tag+={deliberate_generate_case, "^xen/arch/arm/vcpreg\\.c$"}
> +-config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
> +-doc_end
> +
>  #
>  # General
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 123c78e20a01..84da637ef888 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -330,6 +330,28 @@ Deviations related to MISRA C:2012 Rules:
>         (4) as lhs in assignments.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R20.12
> +     - Variadic macros that use token pasting often employ the gcc extension
> +       `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
> +       not easily replaceable; macros that in addition perform regular argument
> +       expansion on the same argument subject to the # or ## operators violate
> +       the Rule if the argument is a macro. 
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R20.12
> +     - Macros that are used for runtime or build-time assertions contain
> +       deliberate uses of an argument as both a regular argument and a
> +       stringification token, to provide useful diagnostic messages.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R20.12
> +     - GENERATE_CASE is a local helper macro that allows some selected switch
> +       statements to be more compact and readable. As such, the risk of
> +       developer confusion in using such macro is deemed negligible. This
> +       construct is deviated only in Translation Units that present a violation
> +       of the Rule due to uses of this macro.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>  Other deviations:
>  -----------------
>  
> -- 
> 2.34.1
> 

