Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A204497DF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 16:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223446.386163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6J6-0000XS-Al; Mon, 08 Nov 2021 15:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223446.386163; Mon, 08 Nov 2021 15:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6J6-0000VJ-68; Mon, 08 Nov 2021 15:11:36 +0000
Received: by outflank-mailman (input) for mailman id 223446;
 Mon, 08 Nov 2021 15:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BZQ9=P3=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1mk6J3-0000Tg-He
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:11:34 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 213c3ca2-40a6-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 16:11:30 +0100 (CET)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6Ij-00Eu4k-7h; Mon, 08 Nov 2021 15:11:13 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 023D130030B;
 Mon,  8 Nov 2021 16:11:11 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 83AD3202A012E; Mon,  8 Nov 2021 16:11:11 +0100 (CET)
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
X-Inumbo-ID: 213c3ca2-40a6-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dxaRhZt5F08/udnZL3CT8J1LOmJHz7WyeU2TgGdEl3U=; b=ZYlxcYrANbLZOibAhF/IENDrFq
	8darFlH3eoI0uZ7T38r9vgIUO0SbL9MCfLDTsVuyqXOPH9q+41BxOp9julYgXd4J7qWj52i6Ktcx+
	OkXQDZxItZ+SK5YuUZP0qAbFZTqV8NvdkWNLnbIMXyD6tbMd0BRCmD/czn6j89W5ZYSFy/n9PU3ei
	hw4y7LWmR2hSpxiljrFbFNWYUPfZxoHZNhFRIWrCB3dVplbrDB8RiB3f3aZ3HaWNsMaCdPYbO6G8/
	G5D/XIMtUApg0H5wwY41prTHDbcEKw9vyOQKb117TlL051INr0gnWhlH0QMjDAOQ5M9h7WdBPeOgA
	7AP3rRHQ==;
Date: Mon, 8 Nov 2021 16:11:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jgross@suse.com
Subject: Re: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
Message-ID: <YYk+D17oIOGKWNtN@hirez.programming.kicks-ass.net>
References: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>

On Tue, Nov 02, 2021 at 07:36:36PM -0400, Boris Ostrovsky wrote:
> Commit 66558b730f25 ("sched: Add cluster scheduler level for x86")
> introduced cpu_l2c_shared_map mask which is expected to be initialized
> by smp_op.smp_prepare_cpus(). That commit only updated
> native_smp_prepare_cpus() version but not xen_pv_smp_prepare_cpus().
> As result Xen PV guests crash in set_cpu_sibling_map().
> 
> While the new mask can be allocated in xen_pv_smp_prepare_cpus() one can
> see that both versions of smp_prepare_cpus ops share a number of common
> operations that can be factored out. So do that instead.
> 
> Fixes: 66558b730f25 ("sched: Add cluster scheduler level for x86")
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Thanks! I'll go stick that somewhere /urgent (I've had another report on
that here:

  https://lkml.kernel.org/r/20211105074139.GE174703@worktop.programming.kicks-ass.net
)

But looking at those functions; there seems to be more spurious
differences. For example, the whole sched_topology thing.

Should we re-architect this whole smp_prepare_cpus() thing instead? Have
a common function and a guest function? HyperV for instance seems to
call native_smp_prepare_cpus() and then does something extra (as does
xen_hvm).

