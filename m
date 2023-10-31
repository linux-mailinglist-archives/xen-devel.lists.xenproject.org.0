Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558CD7DD8AA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 23:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626024.975907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxxfW-00005d-KZ; Tue, 31 Oct 2023 22:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626024.975907; Tue, 31 Oct 2023 22:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxxfW-0008Uu-I1; Tue, 31 Oct 2023 22:57:06 +0000
Received: by outflank-mailman (input) for mailman id 626024;
 Tue, 31 Oct 2023 22:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+N=GN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxxfV-0008Uo-CN
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 22:57:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce8698c4-7840-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 23:57:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E07ABB811EC;
 Tue, 31 Oct 2023 22:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446E9C433C8;
 Tue, 31 Oct 2023 22:57:00 +0000 (UTC)
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
X-Inumbo-ID: ce8698c4-7840-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698793022;
	bh=HXCMDRt6Te9uTqyqfdhK7gyvfOxNnZTIYQI9MlWyjCI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sZgTJSJmeAczSfaOwQcY1p/++nEAtVQn4gcCvUhUfMerS2+bkANnd9XYGTBjnLXmS
	 Gm+duTkCw2TO92vnhgx+Zdh8qVlZn5IQG+KVqaaPoavD8QLv0QfAUHiFA0qz8slbyH
	 EAL1y//lM2DheTr19+S5pVnrlPGazPW4j663A/GgMkQBow67Y77Geq/yZApntAtATL
	 9u15vMIzovfVEOFVRdp9x7ZIbbnud6cuvWuFryymw4l8M614sluRVO4wpy9t5lo9mF
	 Dy6uWFHqsChuXT/iwGG4/WGQAbAyC3l63cdzrh/Mv4oQoW7RD8UkCgSwyVQ1XwJjHE
	 xMDibVoZhqLCQ==
Date: Tue, 31 Oct 2023 15:56:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
    Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
In-Reply-To: <cb448439-6966-4bcd-1aec-4cbfd1aeedf4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310311556460.1795129@ubuntu-linux-20-04-desktop>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com> <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com> <20677a35-37ee-d959-78d5-d8f95f443912@suse.com> <0e96a194d77d89fbd65537b464664429@bugseng.com>
 <cb448439-6966-4bcd-1aec-4cbfd1aeedf4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 Oct 2023, Jan Beulich wrote:
> On 31.10.2023 09:22, Nicola Vetrini wrote:
> > On 2023-10-30 16:12, Jan Beulich wrote:
> >> On 30.10.2023 10:11, Nicola Vetrini wrote:
> >>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is 
> >>> safe."
> >>>  -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
> >>>  -doc_end
> >>>
> >>> +-doc_begin="Recognize the occurrence of current_stack_pointer as a 
> >>> declaration."
> >>> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
> >>> +-config=MC3R1.R8.4,declarations+={safe, 
> >>> "loc(file(asm_defns))&&^current_stack_pointer$"}
> >>> +-doc_end
> >>> +
> >>> +-doc_begin="asmlinkage is a marker to indicate that the function is 
> >>> only used from asm modules."
> >>> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^.*asmlinkage.*$, 
> >>> -1..0))"}
> >>> +-doc_end
> >>
> >> In the longer run asmlinkage will want using for functions used either 
> >> way
> >> between C and assembly (i.e. C->asm calls as well as asm->C ones). I'd 
> >> like
> >> to ask that the text please allow for that (e.g. s/from/to interface 
> >> with/).
> >>
> >>> --- a/xen/arch/x86/hvm/svm/intr.c
> >>> +++ b/xen/arch/x86/hvm/svm/intr.c
> >>> @@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, 
> >>> struct hvm_intack intack)
> >>>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
> >>>  }
> >>>
> >>> -void svm_intr_assist(void)
> >>> +asmlinkage void svm_intr_assist(void)
> >>
> >> Nit (here and below): Attributes, unless impossible for some specific
> >> reason, should always go between type and identifier. Not all our code
> >> is conforming to that, but I think a majority is, and hence you should
> >> be able to find ample examples (taking e.g. __init).
> >>
> >>> --- a/xen/include/xen/compiler.h
> >>> +++ b/xen/include/xen/compiler.h
> >>> @@ -159,6 +159,9 @@
> >>>  # define ASM_FLAG_OUT(yes, no) no
> >>>  #endif
> >>>
> >>> +/* Mark a function or variable as used only from asm */
> >>> +#define asmlinkage
> >>
> >> I appreciate this being an immediately "natural" place, but considering
> >> what we know from Linux I think we ought to allow for arch overrides 
> >> here
> >> right away. For that I'm afraid compiler.h isn't best; it may still be
> >> okay as long as at least an #ifndef is put around it. Imo, however, 
> >> this
> >> ought to go into xen/linkage.h, as is being introduced by "common:
> >> assembly entry point type/size annotations". It's somewhat a shame that
> >> this and the rest of that series has missed 4.18 ...
> > 
> > An #ifndef around what, exactly?
> 
> The #define. That way at least an arch's config.h can override it.

I think the #ifdef is the way to go for now to reduce dependencies
between series


> > Anyway, making (part of) this series 
> > wait for approval
> > until the other has been accepted into 4.19 (for which I have no 
> > specific timeframe)
> > does not seem that desirable to me.
> 
> It's not ideal, but you or anyone else are free to help that other work
> make progress.

