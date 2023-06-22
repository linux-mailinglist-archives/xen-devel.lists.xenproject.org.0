Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965D73A1BC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 15:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553556.864174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCK9S-0001WS-RY; Thu, 22 Jun 2023 13:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553556.864174; Thu, 22 Jun 2023 13:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCK9S-0001TI-OR; Thu, 22 Jun 2023 13:15:06 +0000
Received: by outflank-mailman (input) for mailman id 553556;
 Thu, 22 Jun 2023 13:15:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waO+=CK=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qCK9R-0001TC-1A
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 13:15:05 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc9bc711-10fe-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 15:15:04 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qCK98-001BsM-2N; Thu, 22 Jun 2023 13:14:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 032D43002F0;
 Thu, 22 Jun 2023 15:14:46 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D74EA24263362; Thu, 22 Jun 2023 15:14:45 +0200 (CEST)
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
X-Inumbo-ID: cc9bc711-10fe-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ufmc0Z6O1yW0ICUZh7aoz2TN+c20tRHp51mRicssOYA=; b=W37UuZpUw1vREEI3wtlUKuUETq
	JEynIINmlJItVhZGOkbubOleNJDmZZqE60AGeCIw/dWswSudEfoUxqtiMTqdm0MSfpujyoLq1xtdZ
	16FkN/+uMIIGBENQbQeqPVxaQGhysLA9KCZkZDx3Mh+nAwY3+ZsNYMPMu0vjKViVygVGexQr7pltB
	MCtKV7sQFwyPjIocL174eAywjD21NXhWSW0uP6rPpV2sV6fRmJTeoSaxHw8CVQUBnfWJerD4cluCf
	3I6A8+kHsEtLMzS27V7vmn1MDVq1n9uCbu3bwZv/0852Vzvb4ni892/NkqFw29VdsqzjJD+I3A5uB
	XXkNe7cA==;
Date: Thu, 22 Jun 2023 15:14:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Per Bilse <Per.Bilse@citrix.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"open list:X86 ENTRY CODE" <linux-kernel@vger.kernel.org>,
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Updates to Xen hypercall preemption
Message-ID: <20230622131445.GQ4253@hirez.programming.kicks-ass.net>
References: <20230621151442.2152425-1-per.bilse@citrix.com>
 <20230621164038.GM2053369@hirez.programming.kicks-ass.net>
 <6523f3e2-8dfc-c2dd-6d14-9e0c3ac93cc8@citrix.com>
 <20230621200409.GC4253@hirez.programming.kicks-ass.net>
 <a8cd2788-a695-964a-3311-dbecb669bb72@suse.com>
 <20230622082607.GD4253@hirez.programming.kicks-ass.net>
 <e8f0d101-d803-8ccb-80a0-fc7c6c45ab77@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8f0d101-d803-8ccb-80a0-fc7c6c45ab77@citrix.com>

On Thu, Jun 22, 2023 at 02:05:13PM +0100, Andrew Cooper wrote:
> On 22/06/2023 9:26 am, Peter Zijlstra wrote:
> > On Thu, Jun 22, 2023 at 07:22:53AM +0200, Juergen Gross wrote:
> >
> >> The hypercalls we are talking of are synchronous ones. They are running
> >> in the context of the vcpu doing the call (like a syscall from userland is
> >> running in the process context).
> > (so time actually passes from the guest's pov?)
> 
> Yes.  And in principle it's wired into stolen time.

Hmm, that means that if the scheduler accounts for stolen time (see
update_rq_clock_task(), PARAVIRT_TIME_ACCOUNTING hunk) then it appears
as if no time has passed, which might affect preemption decisions.

Oh well, we'll think about it when it's shown to be a problem I suppose
:-)

