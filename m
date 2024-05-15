Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A58C6E77
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 00:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722623.1126747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Mrw-0002Jk-Tg; Wed, 15 May 2024 22:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722623.1126747; Wed, 15 May 2024 22:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Mrw-0002Hy-Q9; Wed, 15 May 2024 22:13:04 +0000
Received: by outflank-mailman (input) for mailman id 722623;
 Wed, 15 May 2024 22:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7Mrv-0002Hs-9o
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 22:13:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 496b380a-1308-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 00:13:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 58DCECE17D4;
 Wed, 15 May 2024 22:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDD7C116B1;
 Wed, 15 May 2024 22:12:54 +0000 (UTC)
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
X-Inumbo-ID: 496b380a-1308-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715811176;
	bh=uEMbC0YIDzL0nk9QPXgGfz2S2MW5Shth3LoY2FW5OdQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Uo36pxTvhxl4mk4sUbbvA8Yn3iGTcGfFfIUr2Nt7dml8QFmHBMP2Jx860DxA3l+om
	 sUb8eSRdtGEhbYx9bwcQSEjBU5wXp07fIXsQyQjNd/kQD3xMAiMWCLdaU140qk4tEF
	 oTR3dZ2gPtHHs2Xx1tRKNlXs7w/hvtBuNmHHG8Yz/EzMITR6OwX0Y2rja2gnbztRog
	 sKOGXojwA6a6q+JvDxBdj4CwkdNF6XFjEJuM+Wq3Xvaf+Et6K/p+3Zm/CNrCcRSwfF
	 haSlMvA4wHdwvgiWsDuH5vqd5EwnUfdj+b5MI61P6pl0ju5g8BTkzmCWWJbuX63xYW
	 KG5UGO33JT6oQ==
Date: Wed, 15 May 2024 15:12:53 -0700 (PDT)
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
Subject: Re: [XEN PATCH] automation/eclair_analysis: fully deviate MISRA C
 Rules 21.9 and 21.10
In-Reply-To: <6990027e12e108a2eaee7300931b1dd01c30795d.1715758910.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405151511520.2544314@ubuntu-linux-20-04-desktop>
References: <6990027e12e108a2eaee7300931b1dd01c30795d.1715758910.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Nicola Vetrini wrote:
> These rules are concerned with the use of facilities provided by the
> C Standard Library (qsort, bsearch for rule 21.9, and those provided
> by <time.h> for rule 21.10).
> 
> Xen provides in its source code its own implementation of some of these
> functions and macros, therefore a justification is provided for allowing
> uses of these functions in the project.
> 
> The rules are also marked as clean as a consequence.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl      | 14 ++++++++++++++
>  .../eclair_analysis/ECLAIR/monitored.ecl       |  2 ++
>  automation/eclair_analysis/ECLAIR/tagging.ecl  |  2 +-
>  docs/misra/deviations.rst                      | 18 ++++++++++++++++++
>  4 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 5eb7368a7322..1478c64a5af1 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -477,6 +477,20 @@ leads to a violation of the Rule are deviated."
>  -config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
>  -doc_end
>  
> +#
> +# Series 21.
> +#
> +
> +-doc_begin="Xen does not use the functions provided by the Standard Library, but
> +implements a set of functions that share the same names as their Standard Library equivalent.
> +The implementation of these functions is available in source form, so the undefined, unspecified
> +or implementation-defined behaviors contemplated by the C Standard do not apply.
> +If some undefined or unspecified behavior does arise in the implementation, it
> +falls under the jurisdiction of other MISRA rules."
> +-config=MC3R1.R21.9,reports+={deliberate, "any()"}
> +-config=MC3R1.R21.10,reports+={deliberate, "any()"}
> +-doc_end
> +
>  #
>  # General
>  #
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 69308ea51c01..9da709dc889c 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -36,12 +36,14 @@
>  -enable=MC3R1.R20.4
>  -enable=MC3R1.R20.9
>  -enable=MC3R1.R2.1
> +-enable=MC3R1.R21.10
>  -enable=MC3R1.R21.13
>  -enable=MC3R1.R21.17
>  -enable=MC3R1.R21.18
>  -enable=MC3R1.R21.19
>  -enable=MC3R1.R21.20
>  -enable=MC3R1.R21.21
> +-enable=MC3R1.R21.9
>  -enable=MC3R1.R2.2
>  -enable=MC3R1.R22.2
>  -enable=MC3R1.R22.4
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index a14bda5033df..acea15f486a1 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -19,7 +19,7 @@
>  
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>  
> --service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
> +-service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.10||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R21.9||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
>  }
>  
>  -setq=target,getenv("XEN_TARGET_ARCH")
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 161134771c77..b5450c38f66c 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -411,6 +411,24 @@ Deviations related to MISRA C:2012 Rules:
>         construct is deviated only in Translation Units that present a violation
>         of the Rule due to uses of this macro.
>       - Tagged as `deliberate` for ECLAIR.
> +     
> +   * - R21.9
> +     - Xen does not use the `bsearch` and `qsort` functions provided by the C
> +       Standard Library, but provides in source form its own implementation,
> +       therefore any unspecified or undefined behavior associated to the
> +       functions provided by the Standard Library does not apply. Any such
> +       behavior that may exist in such functions is therefore under the
> +       jurisdiction of other MISRA C rules.
> +     - Project-wide deviation, tagged as `deliberate` for ECLAIR.
> +
> +   * - R21.10
> +     - Xen does not use the facilities provided by the `\<time.h\>` provided by the C
> +       Standard Library, but provides in source form its own implementation,
> +       therefore any unspecified, undefined or implementation-defined behavior
> +       associated to the functions provided by the Standard Library does not
> +       apply. Any such behavior that may exist in such functions is therefore
> +       under the jurisdiction of other MISRA C rules.
> +     - Project-wide deviation, tagged as `deliberate` for ECLAIR.
>  
>  Other deviations:
>  -----------------
> -- 
> 2.34.1
> 

