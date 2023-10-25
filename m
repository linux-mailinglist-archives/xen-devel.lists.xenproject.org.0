Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8E7D780C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 00:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623351.971146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmSQ-0004TF-Mn; Wed, 25 Oct 2023 22:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623351.971146; Wed, 25 Oct 2023 22:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmSQ-0004Qx-Jw; Wed, 25 Oct 2023 22:34:34 +0000
Received: by outflank-mailman (input) for mailman id 623351;
 Wed, 25 Oct 2023 22:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvmSO-0004Qb-SU
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 22:34:32 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa1e5ad5-7386-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 00:34:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AE4BDB80D06;
 Wed, 25 Oct 2023 22:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7ABC433C8;
 Wed, 25 Oct 2023 22:34:28 +0000 (UTC)
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
X-Inumbo-ID: aa1e5ad5-7386-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698273270;
	bh=U1q9U7VIUhhWOYDLPgRVssCY2R4rZk2p90wJs5u1tXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bKbGTwBrc+8yR6NM6GV/78CVygw0/i/UJPbOZs7ZKf2wReadQKSdE+t3tou5dVTVz
	 8usJnkt9aJLrUjBRz2KfomwopNBsyrplWrARvLW41jx7J1TK2F/jgviY83Ohv38PAZ
	 0mpd261MpRReTKYgV20x938Jso7XS5wANViqwsgyzzm1MRe8ZoXL7Akw57ZBzG2ovn
	 LUcc4kHoq91dHSwIf6Cndsnog85IONZxCdyKBcRr50Sg8NuatJ2E91MI0PUIlclw5J
	 NNEAnpiexqRiauY6e7qHBdvZJ7ZiWGn6VQXNvbC7gW0MJtUtgQEltre94Pkdjw5uPw
	 B6kRhcFI5kVDQ==
Date: Wed, 25 Oct 2023 15:34:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH][for-4.19 v3] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <78107fe9-de43-30b8-7423-240450bc0da8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310251532290.271731@ubuntu-linux-20-04-desktop>
References: <5e0f1bcd7b4325141e64a3c2d581034956b42293.1698136547.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2310241329390.271731@ubuntu-linux-20-04-desktop> <78107fe9-de43-30b8-7423-240450bc0da8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Jan Beulich wrote:
> On 24.10.2023 22:30, Stefano Stabellini wrote:
> > On Tue, 24 Oct 2023, Nicola Vetrini wrote:
> >> As specified in rules.rst, these constants can be used
> >> in the code.
> >>
> >> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >> ---
> >> Changes in v2:
> >> - replace some SAF deviations with configurations
> >> Changes in v3:
> >> - refine configurations and justifications
> >> ---
> >>  automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++----
> >>  docs/misra/deviations.rst                        |  5 +++++
> >>  docs/misra/safe.json                             |  8 ++++++++
> >>  xen/arch/x86/hvm/svm/emulate.c                   |  6 +++---
> >>  xen/common/inflate.c                             |  4 ++--
> >>  5 files changed, 24 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> index fa56e5c00a27..ea5e0eb1813f 100644
> >> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >> @@ -85,10 +85,12 @@ conform to the directive."
> >>  # Series 7.
> >>  #
> >>  
> >> --doc_begin="Usage of the following constants is safe, since they are given as-is
> >> -in the inflate algorithm specification and there is therefore no risk of them
> >> -being interpreted as decimal constants."
> >> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
> >> +-doc_begin="It is safe to use certain octal constants the way they are defined in
> >> +specifications, manuals, and algorithm descriptions."
> >> +-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
> >> +-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
> >> +-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
> >> +-config=MC3R1.R7.1,reports+={safe, "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}
> >>  -doc_end
> >>  
> >>  -doc_begin="Violations in files that maintainers have asked to not modify in the
> >> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> >> index 8511a189253b..26c6dbbc9ffe 100644
> >> --- a/docs/misra/deviations.rst
> >> +++ b/docs/misra/deviations.rst
> >> @@ -90,6 +90,11 @@ Deviations related to MISRA C:2012 Rules:
> >>           - __emulate_2op and __emulate_2op_nobyte
> >>           - read_debugreg and write_debugreg
> >>  
> >> +   * - R7.1
> >> +     - It is safe to use certain octal constants the way they are defined in
> >> +       specifications, manuals, and algorithm descriptions.
> > 
> > I think we should add that these cases have "octal-ok" as a in-code
> > comment. Everything else looks OK so this small change could be done on
> > commit.
> 
> But that needs wording carefully, as it doesn't hold across the board:
> Right now relevant MASK_EXTR() uses gain such comments, but INSTR_ENC()
> ones (deliberately) don't.

What about:

* - R7.1
  - It is safe to use certain octal constants the way they are defined
    in specifications, manuals, and algorithm descriptions. Such places
    are marked safe with a /* octal-ok */ in-code comment, or with a SAF
    comment (see safe.json).

