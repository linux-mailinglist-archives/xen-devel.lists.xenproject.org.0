Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFA7F314D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 15:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637874.993923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Rwq-0001gd-0G; Tue, 21 Nov 2023 14:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637874.993923; Tue, 21 Nov 2023 14:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Rwp-0001dd-Tq; Tue, 21 Nov 2023 14:41:55 +0000
Received: by outflank-mailman (input) for mailman id 637874;
 Tue, 21 Nov 2023 14:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f+q9=HC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r5Rwo-00016Z-8I
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 14:41:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c9e4563-887c-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 15:41:53 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CF78F4EE073A;
 Tue, 21 Nov 2023 15:41:52 +0100 (CET)
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
X-Inumbo-ID: 1c9e4563-887c-11ee-98e1-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 15:41:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [RFC PATCH 0/4] address MISRA C:2012 Rule 15.2
In-Reply-To: <cover.1699295113.git.nicola.vetrini@bugseng.com>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
Message-ID: <7e2993c68fda95d1eda6fd136750fcba@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-07 11:33, Nicola Vetrini wrote:
> This series is aimed at presenting some strategies that can be used to 
> deal with
> violations of Rule 15.2:
> "The goto statement shall jump to a label declared later in the same 
> function".
> 
> The rule's rationale is about possible developer confusion, therefore 
> it could
> be argued that there is no substantial gain in complying with it, given 
> the
> torough review process in place.
> 
> Nonetheless, the proposed resolution strategies are the following:
> - use a loop instead of a goto (see patch 1 and 3)
> - make the jump due to the goto forward, rather than backward (see 
> patch 2)
> - unconditionally allow certain constructs, such as "goto retry", whose 
> presence
>   in the codebase typically signifies that all other reasonable 
> approaches (e.g,
>   loops, forward jumps) have been considered and deemed inferior in 
> terms of
>   code readability.
> 
> The latter strategy may be postponed until all goto-s with a certain 
> label have
> been examined. An alternative strategy could be to allow certain files
> (most notably those under x86/x86_emulate) to have backward jumps, and 
> resolve
> the remaining violations.
> 
> Any feedback on this matter is welcome.
> 
> Nicola Vetrini (4):
>   xen/vsprintf: replace backwards jump with loop
>   x86/dom0: make goto jump forward
>   xen/arm: GICv3: address MISRA C:2012 Rule 15.2
>   automation/eclair: add deviation for certain backwards goto
> 
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 10 +++
>  docs/misra/deviations.rst                     | 10 +++
>  xen/arch/arm/gic-v3-its.c                     | 81 ++++++++++---------
>  xen/arch/x86/dom0_build.c                     | 14 ++--
>  xen/common/vsprintf.c                         | 20 +++--
>  5 files changed, 81 insertions(+), 54 deletions(-)

Cc: all involved maintainers

In concert with Stefano, and given the feedback received on this RFC 
series, it has been decided to deviate globally this rule, on the 
grounds that there are already guidelines on the usage of goto-s within 
Xen, so it was deemed not worth pursuing the resolution of these 
violations. Therefore, the patches contained here can be ignored for the 
purposes of MISRA compliance.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

