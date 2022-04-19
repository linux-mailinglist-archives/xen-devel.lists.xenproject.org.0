Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CAC506B94
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 13:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308054.523555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmUX-0007ID-At; Tue, 19 Apr 2022 11:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308054.523555; Tue, 19 Apr 2022 11:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngmUX-0007GM-7h; Tue, 19 Apr 2022 11:57:57 +0000
Received: by outflank-mailman (input) for mailman id 308054;
 Tue, 19 Apr 2022 11:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F37o=U5=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1ngmUV-0007GG-5F
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 11:57:55 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb446323-bfd7-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 13:57:45 +0200 (CEST)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmUF-006oN1-7J; Tue, 19 Apr 2022 11:57:39 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id A3E4B986195; Tue, 19 Apr 2022 13:57:37 +0200 (CEST)
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
X-Inumbo-ID: eb446323-bfd7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DzuI/hP4j8qyKw02hy+UWxmxPErK21aY6wcTdlY7vX0=; b=dYA53jEasPAswBQt9fprgbs7Q6
	Pr1tFn/7z5/Q1Q901av7xURJmYYp5Es4BaV7Tcnowc/kX8mmc9S/NdwlGtjcY2YiDE4G3LKanvS7B
	wLmYO1TIUFsmwKEkKVmsT7awSo0MtIWQjX7HIWu6S+CQA08Ml2uaPmxr427ZgqeqEFrBfHJj+W2BT
	mLDfsoN5tsUe63kLOA1Lzd1OZZElV4ku6xScEaEkuO37s/wLg/9JM8/4yKcJRyqzClDJ9qvaqsYD3
	632Ihd6pLS0RdjcDGfgjOomBVlV/cEtKR31yUOp33Gy9tC6QvzejJUyooy4b/muCHrqjRaLywR+X1
	LhcoX+qw==;
Date: Tue, 19 Apr 2022 13:57:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 06/25] x86/xen: Add ANNOTATE_ENDBR to startup_xen()
Message-ID: <20220419115737.GU2731@worktop.programming.kicks-ass.net>
References: <cover.1650300597.git.jpoimboe@redhat.com>
 <a87bd48b06d11ec4b98122a429e71e489b4e48c3.1650300597.git.jpoimboe@redhat.com>
 <b94cbac6-0a4d-8e4a-ec58-bbd46e385d45@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b94cbac6-0a4d-8e4a-ec58-bbd46e385d45@citrix.com>

On Tue, Apr 19, 2022 at 11:42:12AM +0000, Andrew Cooper wrote:
> On 18/04/2022 17:50, Josh Poimboeuf wrote:
> > The startup_xen() kernel entry point is referenced by the ".note.Xen"
> > section, but is presumably not indirect-branched to.
> 
> It's the real entrypoint of the VM.  It's "got to" by setting %rip
> during vcpu setup.
> 
> We could in principle support starting a PV VM with CET active, but that
> sounds like an enormous quantity of effort for very little gain.  CET
> for Xen PV requires paravirt anyway (because the kernel runs in CPL!=0)
> so decisions like this can wait until someone feels like doing the work.
> 
> >   Add ANNOTATE_ENDBR
> > to silence future objtool warnings.
> >
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: xen-devel@lists.xenproject.org
> > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> 
> FWIW, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably
> with the commit message tweaked to remove the uncertainty.

Something like so then?

---
Subject: x86/xen: Add ANNOTATE_ENDBR to startup_xen()
From: Josh Poimboeuf <jpoimboe@redhat.com>
Date: Mon, 18 Apr 2022 09:50:25 -0700

From: Josh Poimboeuf <jpoimboe@redhat.com>

The startup_xen() kernel entry point is referenced by the ".note.Xen"
section, and is the real entry point of the VM. It *will* be
indirectly branched to, *however* currently Xen doesn't support PV VM
with CET active.

Add ANNOTATE_ENDBR to silence future objtool warnings.

Fixes: ed53a0d97192 ("x86/alternative: Use .ibt_endbr_seal to seal indirect calls")
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Link: https://lkml.kernel.org/r/a87bd48b06d11ec4b98122a429e71e489b4e48c3.1650300597.git.jpoimboe@redhat.com

