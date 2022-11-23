Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF8635394
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 09:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447452.703678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlZw-0003Rx-Al; Wed, 23 Nov 2022 08:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447452.703678; Wed, 23 Nov 2022 08:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlZw-0003Pt-7e; Wed, 23 Nov 2022 08:58:00 +0000
Received: by outflank-mailman (input) for mailman id 447452;
 Wed, 23 Nov 2022 08:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMmH=3X=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oxlZu-0003Oz-1q
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 08:57:59 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebd40c24-6b0c-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 09:57:57 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oxlXZ-003jLI-6a; Wed, 23 Nov 2022 08:57:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3564F30013F;
 Wed, 23 Nov 2022 09:55:30 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A0AFF2D819C4D; Wed, 23 Nov 2022 09:55:30 +0100 (CET)
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
X-Inumbo-ID: ebd40c24-6b0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WEbEoRwkNU50xfDUGpl4daXU2L4OBNgPFu286C7zJm8=; b=Zw8zAIaFHr+ssmLxghLb2Zn751
	8Cpacemx3ZAqyuSFe66NhvA0Lg6Ebw3hBz+9NLIdzJ0MfkaN3NrfOf3HFEbALlUF8hzhZZTAjK7Wc
	GUUNogOt3XHOl46ZpgWCQQ2pUJRlYrKlvZrsnheOKJVs74c5f6yGHbw6cJCw8FNnWX/uG4dbRw0DZ
	EMHMlSy6QCb0uskkyg6GtMCJoGpyGszdtq3IB5BUCarFcnz/16Aq4yIA28TYWLy/ieTNTvmhMhW+c
	MNPW56zsypplyYprshJTA3A6b4irPVYCGnQbvgngTm0qbsf6yXnbAzQQv/GuZjfTIKCSEXG82Lf/U
	se5OavBA==;
Date: Wed, 23 Nov 2022 09:55:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, jgross@suse.com,
	sstabellini@kernel.org, boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: objtool warning for next-20221118
Message-ID: <Y33gAiFP2IpVdxJu@hirez.programming.kicks-ass.net>
References: <20221121040736.GA3738360@paulmck-ThinkPad-P17-Gen-1>
 <Y3thrQxfcvZSXFlr@hirez.programming.kicks-ass.net>
 <20221121145215.GF4001@paulmck-ThinkPad-P17-Gen-1>
 <20221122051605.4hcbslwxez2trdvt@treble>
 <Y3yJxQJ9DwxTx7km@hirez.programming.kicks-ass.net>
 <20221123012350.kelmmadh65lyswqz@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123012350.kelmmadh65lyswqz@treble>

On Tue, Nov 22, 2022 at 05:23:50PM -0800, Josh Poimboeuf wrote:
> On Tue, Nov 22, 2022 at 09:35:17AM +0100, Peter Zijlstra wrote:
> > On Mon, Nov 21, 2022 at 09:16:05PM -0800, Josh Poimboeuf wrote:
> > 
> > > It's complaining about an unreachable instruction after a call to
> > > arch_cpu_idle_dead().  In this case objtool detects the fact
> > > arch_cpu_idle_dead() doesn't return due to its call to the
> > > non-CONFIG_SMP version of play_dead().  But GCC has no way of detecting
> > > that because the caller is in another translation unit.
> > > 
> > > As far as I can tell, that function should never return.  Though it
> > > seems to have some dubious semantics (see xen_pv_play_dead() for
> > > example, which *does* seem to return?).  I'm thinking it would be an
> > > improvement to enforce that noreturn behavior across all arches and
> > > platforms, sprinkling __noreturn and BUG() on arch_cpu_idle_dead() and
> > > maybe some of it callees, where needed.
> > > 
> > > Peter, what do you think?  I could attempt a patch.
> > 
> > I'm thinking the Xen case makes all this really rather difficult :/
> > 
> > While normally a CPU is brought up through a trampoline, Xen seems to
> > have implemented it by simply returning from play_dead(), and afaict
> > that is actually a valid way to go about doing it.
> 
> o_O
> 
> How the @#$% is that a valid way of doing it?  Why not just do it the
> normal way?

Well, if you return from arch_cpu_idle_dead() you're back in the idle
loop -- exactly where you would be if you were to bootstrap the whole
CPU -- provided you have it remember the whole state (easier with a
vCPU).

But maybe I'm missing something, lets add Xen folks on.

