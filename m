Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A69BB286B4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 21:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083812.1443260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0SN-0004IR-1p; Fri, 15 Aug 2025 19:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083812.1443260; Fri, 15 Aug 2025 19:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0SM-0004Gu-VQ; Fri, 15 Aug 2025 19:51:18 +0000
Received: by outflank-mailman (input) for mailman id 1083812;
 Fri, 15 Aug 2025 19:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1un0SL-0004Go-TR
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 19:51:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34167c35-7a11-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 21:51:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB5D05C68F6;
 Fri, 15 Aug 2025 19:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEBCC4CEEB;
 Fri, 15 Aug 2025 19:51:13 +0000 (UTC)
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
X-Inumbo-ID: 34167c35-7a11-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755287474;
	bh=I5SyojDAyh5oE0Zg/W7EpO9tvOZPWPQm1sMUtoQ5TFY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lTp0ud5x3PAE1M5aXLmt4PEvAJor4ks+t/23M08yRo4ANbca7HXyrCiaB63ZRYwaw
	 RhFy3aWt34Qxxpxe92enfwYKpSt/kG4oOh74ZP1KfY4E3UxPZrm8eHEa5phlxoM7yw
	 Di+oubgEU/kt/GO5oMvVEJVFsnrcg+404XR6LlR3G5IsWM+6EnHaUBVnmwz3mVWjR6
	 x4soMMsmh6wU4PsWTMoRGj7GGeHsF7421qoT9nFZud4myYHhRhz13ni0SotcXv114F
	 CMeZwURBneYt9l435j7QAD4+syeGstSl0kwh7bI1WZrlXYOJauIgXvwe4Vs4/mgjzT
	 CxWPAwN+oROIw==
Date: Fri, 15 Aug 2025 12:51:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    consulting@bugseng.com, dmytro_prokopchuk1@epam.com, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] Address violation of MISRA C Rule 13.1 involving
 asm side effects.
In-Reply-To: <c4da2554d94c3f7bd4b1e460dcaa27db382ece2f.1754689062.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2508151250460.923618@ubuntu-linux-20-04-desktop>
References: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com> <c4da2554d94c3f7bd4b1e460dcaa27db382ece2f.1754689062.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Aug 2025, Nicola Vetrini wrote:
> The rule states: "Initializer lists shall not contain persistent side effects".
> The specific way in which the 'mrs' instruction is used does not lead to
> visible side effects for the surrounding code.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Ideally, with the improved doc as suggested by Dmytro.


> ---
> Not yet tested on the Xen ECLAIR runner, as the syntax used in the deviation
> is only supported after updating the runner.
> 
> What the tool is reporting is that due to the '=r' constraint and the
> semantics of the instruction, there is the side effect of writing to '_r',
> but this is not observable outside the stmt expr. The deviation ends up being
> a bit too general for my taste, but the restriction on the actual istruction
> should be enough to limit applicability to cases that are arguably safe in
> practice.
> 
> An alternative approach would be represented by stating that side effects in
> 'READ_SYSREG64' are safe, but this is not true in general.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index ec0cac797e5f..6b492e38505d 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -437,6 +437,10 @@ write or not"
>  # Series 13
>  #
>  
> +-doc_begin="Consider the asm instruction to read an Arm system register to have no side effects."
> +-asm_properties+={"asm(any())&&child(text, ast_field(value,^mrs\\s+%0.*$))", {no_side_effect}}
> +-doc_end
> +
>  -doc_begin="All developers and reviewers can be safely assumed to be well aware
>  of the short-circuit evaluation strategy of such logical operators."
>  -config=MC3A2.R13.5,reports+={disapplied,"any()"}
> -- 
> 2.43.0
> 

