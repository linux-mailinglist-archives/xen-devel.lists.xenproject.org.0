Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F18295CE0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 12:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10358.27570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVY6J-00038o-8l; Thu, 22 Oct 2020 10:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10358.27570; Thu, 22 Oct 2020 10:45:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVY6J-00038P-5d; Thu, 22 Oct 2020 10:45:43 +0000
Received: by outflank-mailman (input) for mailman id 10358;
 Thu, 22 Oct 2020 10:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/7zn=D5=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kVY6G-00038K-Al
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:45:41 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e22eaed2-bbc0-4d5d-bd07-cc1a537af39c;
 Thu, 22 Oct 2020 10:45:36 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVY66-0008Se-5C; Thu, 22 Oct 2020 10:45:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CEEA830377D;
 Thu, 22 Oct 2020 12:45:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id ADE07203D0836; Thu, 22 Oct 2020 12:45:27 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/7zn=D5=infradead.org=peterz@srs-us1.protection.inumbo.net>)
	id 1kVY6G-00038K-Al
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 10:45:41 +0000
X-Inumbo-ID: e22eaed2-bbc0-4d5d-bd07-cc1a537af39c
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e22eaed2-bbc0-4d5d-bd07-cc1a537af39c;
	Thu, 22 Oct 2020 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Du1SSCXnSrdocEU/quDNtLt04UawTC5Df3w+0WlN3W8=; b=0HqndUpYEunyxC1QFg6Eps1FML
	a0rjNvZkuoHGWJU7KdGIfeL1nFDRxhAnSOvIgQb8JmNERKI64sI6gEC1tHZUSQhgCpTg4/EOExVov
	NHDvjgkMs7vZxCs9ZNsnj6dkbsIKozDSt4mQYsbp2iba8FtADuiHlt+2bJEvHO2+TvJnwMyLg6n8/
	g6X3im+tqS75DIxJ5beJXIGTEuwWa6xY6mC4BLYc3ZfuCmuZfX4K/vFpgN26JbVEXzu/cg5W1IUuR
	8+sWJhHh8TBCCLx6BWJmoy4fhffwNmNCTYbzo5wYOkww6DgR2GMRentfnaqfQT1NVGejpgDlxcc54
	dAw51jxg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVY66-0008Se-5C; Thu, 22 Oct 2020 10:45:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CEEA830377D;
	Thu, 22 Oct 2020 12:45:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id ADE07203D0836; Thu, 22 Oct 2020 12:45:27 +0200 (CEST)
Date: Thu, 22 Oct 2020 12:45:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] x86/alternative: don't call text_poke() in lazy TLB mode
Message-ID: <20201022104527.GI2594@hirez.programming.kicks-ass.net>
References: <20201009144225.12019-1-jgross@suse.com>
 <28ccccfe-b95b-5c4d-af27-5004e9f02c40@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28ccccfe-b95b-5c4d-af27-5004e9f02c40@suse.com>

On Thu, Oct 22, 2020 at 11:24:39AM +0200, Jürgen Groß wrote:
> On 09.10.20 16:42, Juergen Gross wrote:
> > When running in lazy TLB mode the currently active page tables might
> > be the ones of a previous process, e.g. when running a kernel thread.
> > 
> > This can be problematic in case kernel code is being modified via
> > text_poke() in a kernel thread, and on another processor exit_mmap()
> > is active for the process which was running on the first cpu before
> > the kernel thread.
> > 
> > As text_poke() is using a temporary address space and the former
> > address space (obtained via cpu_tlbstate.loaded_mm) is restored
> > afterwards, there is a race possible in case the cpu on which
> > exit_mmap() is running wants to make sure there are no stale
> > references to that address space on any cpu active (this e.g. is
> > required when running as a Xen PV guest, where this problem has been
> > observed and analyzed).
> > 
> > In order to avoid that, drop off TLB lazy mode before switching to the
> > temporary address space.
> > 
> > Fixes: cefa929c034eb5d ("x86/mm: Introduce temporary mm structs")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Can anyone look at this, please? It is fixing a real problem which has
> been seen several times.

As it happens I picked it up yesterday, just pushed it out for you.

Thanks!

