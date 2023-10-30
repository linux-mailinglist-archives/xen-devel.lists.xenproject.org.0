Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839BF7DC2F2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 00:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625418.974662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxbGz-0007e5-N4; Mon, 30 Oct 2023 23:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625418.974662; Mon, 30 Oct 2023 23:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxbGz-0007bX-Jj; Mon, 30 Oct 2023 23:02:17 +0000
Received: by outflank-mailman (input) for mailman id 625418;
 Mon, 30 Oct 2023 23:02:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxbGx-0007bR-TX
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 23:02:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cf642a5-7778-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 00:02:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D32C460B2B;
 Mon, 30 Oct 2023 23:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D40C433C8;
 Mon, 30 Oct 2023 23:02:10 +0000 (UTC)
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
X-Inumbo-ID: 5cf642a5-7778-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698706932;
	bh=+QQYqCknssPYlRS2qQe4eRUAkkezYcOasgFSU+5v4Rg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RU0FuN23ie7nySNTVEswuxix7A4jYR8E5kwL+uTLoNnzF1A+eZ16Vh/Tjx54lnK+f
	 Cpk3KQ07JcYMf+HUqjeuTz1pdGlarC0Ht1Ka2Lhin1qBsRzpR5kwxj3Fdl5bIuUCD1
	 F3aLjzdE0/CUYgWqwN72aEivjSsv7Te4/mRYN6PR+fUkxOj+D73AxqVQ523yZwGJgQ
	 YQgX2WS8DLUPrCFhmmrVmoYte8dVJ5k9gcFZ9bou12RIKZXTgHLNKLAbDoeKWIsYGq
	 WpR9ZU5yrWsprEY5cETXZZ4vEhyHstVCxjcxFNCJOehtPeW9DElD5blOC5H6nF5aAO
	 wDLWYuEcMHbnQ==
Date: Mon, 30 Oct 2023 16:02:09 -0700 (PDT)
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
In-Reply-To: <20677a35-37ee-d959-78d5-d8f95f443912@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310301557300.1625118@ubuntu-linux-20-04-desktop>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com> <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com> <20677a35-37ee-d959-78d5-d8f95f443912@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Jan Beulich wrote:
> On 30.10.2023 10:11, Nicola Vetrini wrote:
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is safe."
> >  -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
> >  -doc_end
> >  
> > +-doc_begin="Recognize the occurrence of current_stack_pointer as a declaration."
> > +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
> > +-config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
> > +-doc_end
> > +
> > +-doc_begin="asmlinkage is a marker to indicate that the function is only used from asm modules."
> > +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^.*asmlinkage.*$, -1..0))"}
> > +-doc_end
> 
> In the longer run asmlinkage will want using for functions used either way
> between C and assembly (i.e. C->asm calls as well as asm->C ones). I'd like
> to ask that the text please allow for that (e.g. s/from/to interface with/).
> 
> > --- a/xen/arch/x86/hvm/svm/intr.c
> > +++ b/xen/arch/x86/hvm/svm/intr.c
> > @@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
> >          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
> >  }
> >  
> > -void svm_intr_assist(void)
> > +asmlinkage void svm_intr_assist(void)
> 
> Nit (here and below): Attributes, unless impossible for some specific
> reason, should always go between type and identifier. Not all our code
> is conforming to that, but I think a majority is, and hence you should
> be able to find ample examples (taking e.g. __init).

Hi Jan, in general I agree with this principle but I noticed that this
is not the way Linux uses asmlinkage, a couple of examples:

asmlinkage void do_page_fault(struct pt_regs *regs);
asmlinkage const sys_call_ptr_t sys_call_table[];

Should we go our way or follow Linux on this in terms of code style?

