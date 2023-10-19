Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A033D7CED02
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 02:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618856.963072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtHM1-0000yU-P1; Thu, 19 Oct 2023 00:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618856.963072; Thu, 19 Oct 2023 00:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtHM1-0000wH-MP; Thu, 19 Oct 2023 00:57:37 +0000
Received: by outflank-mailman (input) for mailman id 618856;
 Thu, 19 Oct 2023 00:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtHLz-0000wA-WB
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 00:57:35 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bb3197f-6e1a-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 02:57:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D0280CE27CD;
 Thu, 19 Oct 2023 00:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0036FC433C7;
 Thu, 19 Oct 2023 00:57:27 +0000 (UTC)
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
X-Inumbo-ID: 7bb3197f-6e1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697677049;
	bh=DQFzB0JJgxaX4dt/xISPVDIvil8RJ5j5M+4FThrvG+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ED62PIkRl5qLG3MxXK+yvdTDQKUAyE8i3rnGrIFxvnbHrAt2HUNOB01LwkO9azlL5
	 9WHeyI4FPagbweGvXWBDuu7fjhqRDurU1sg26xObDQJS/WEhFPSHTNA3hwjiwPamOT
	 s5QOkz56uxeTdFzmRmvmV9oxktjX4KKVn1se/S8stcU/MRIZgGIQucNdTwGLflzYwo
	 hJdu5UBbMQZeLoN8/71eqgqGq+XnfovHgn7uo8DrlfeSDko1h71JP5Tb/1y0UG3q8w
	 ujEHnyLHQ47TQPNMkLp1u+7tlHdxxvb2W/Utpvfzhl4wLv8rzsx8DvHXnMOudJb4M4
	 L8xQgw7okVnFg==
Date: Wed, 18 Oct 2023 17:57:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/4] automation/eclair: add deviations and call
 properties.
In-Reply-To: <8f426cc761c734d457a74416dd5b83fd10128c26.1697638210.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310181756410.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697638210.git.simone.ballarin@bugseng.com> <8f426cc761c734d457a74416dd5b83fd10128c26.1697638210.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Oct 2023, Simone Ballarin wrote:
> Deviate violations of MISRA C:2012 Rule 13.1 caused by
> functions vcpu_runnable and __bad_atomic_size. These functions
> contain side-effects such as debugging logs, assertions and
> failures that cannot cause unexpected behaviors.
> 
> Add "noeffect" call property to functions read_u.*_atomic and
> get_cycles.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

However one comment below


> ---
>  .../eclair_analysis/ECLAIR/call_properties.ecl      | 10 ++++++++++
>  automation/eclair_analysis/ECLAIR/deviations.ecl    | 13 +++++++++++++
>  docs/misra/deviations.rst                           | 11 +++++++++++
>  3 files changed, 34 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl b/automation/eclair_analysis/ECLAIR/call_properties.ecl
> index 3f7794bf8b..f410a6aa58 100644
> --- a/automation/eclair_analysis/ECLAIR/call_properties.ecl
> +++ b/automation/eclair_analysis/ECLAIR/call_properties.ecl
> @@ -104,3 +104,13 @@ Furthermore, their uses do initialize the involved variables as needed by futher
>  -call_properties+={"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
>  -call_properties+={"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
>  -doc_end
> +
> +-doc_begin="Functions generated by build_atomic_read cannot be considered pure
> +since the input pointer is volatile."
> +-call_properties+={"^read_u(8|16|32|64|int)_atomic.*$", {"noeffect"}}
> +-doc_end
> +
> +-doc_begin="get_cycles does not perform visible side-effects "
> +-call_property+={"name(get_cycles)", {"noeffect"}}
> +-doc_end
> +
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index fa56e5c00a..b80ccea7bc 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -233,6 +233,19 @@ this."
>  -config=MC3R1.R10.1,etypes+={safe,
>    "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
>    "any()"}
> +#
> +# Series 13.
> +#
> +
> +-doc_begin="Function __bad_atomic_size is intended to generate a linkage error
> +if invoked. Calling it in intentionally unreachable switch cases is safe even
> +in a initializer list."
> +-config=MC3R1.R13.1,reports+={safe, "first_area(^.*__bad_atomic_size.*$)"}
> +-doc_end
> +
> +-doc_begin="Function vcpu_runnable contains pragmas and other side-effects for
> +debugging purposes, their invocation is safe even in a initializer list."
> +-config=MC3R1.R13.1,reports+={safe, "first_area(^.*vcpu_runnable.*$)"}
>  -doc_end
>  
>  -doc_begin="See Section \"4.5 Integers\" of \"GCC_MANUAL\", where it says that
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 8511a18925..2fcdb8da58 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -192,6 +192,17 @@ Deviations related to MISRA C:2012 Rules:
>         See automation/eclair_analysis/deviations.ecl for the full explanation.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R13.1
> +     - Function __bad_atomic_size is intended to generate a linkage error if
> +       invoked. Calling it in intentionally unreachable switch cases is
> +       safe even in a initializer list.
> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R13.1
> +     - Function vcpu_runnable contains pragmas and other side-effects for
> +       debugging purposes, their invocation is safe even in a initializer list.
> +     - Tagged as `safe` for ECLAIR.


Would it be possible to use SAF instead? If not, this is fine.

