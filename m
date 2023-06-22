Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9338739F56
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 13:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553510.864104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCIIQ-0002qQ-Fz; Thu, 22 Jun 2023 11:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553510.864104; Thu, 22 Jun 2023 11:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCIIQ-0002nk-Be; Thu, 22 Jun 2023 11:16:14 +0000
Received: by outflank-mailman (input) for mailman id 553510;
 Thu, 22 Jun 2023 11:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=waO+=CK=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qCIIN-0002ne-CG
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 11:16:12 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f350ecd-10ee-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 13:16:07 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qCII7-001ARB-0R; Thu, 22 Jun 2023 11:15:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E8A73300137;
 Thu, 22 Jun 2023 13:15:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CB762241BF9B6; Thu, 22 Jun 2023 13:15:52 +0200 (CEST)
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
X-Inumbo-ID: 2f350ecd-10ee-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0Cbef4n6vE+HAJoLMq2Y/8WwGP0ekiPLuwwxxjpzqoc=; b=hwo7dOex3aQbN6n7P2bWblAVf2
	J1nfVEJY/K9oVk0rH0ZeuXY79n1SILio804dj27F3FjXQRjkEh/OJcU1NQdmMW6LvHfuWEAJ2w0S5
	zP6diLuTL2gZKHfkRXtTq9taqznetzaVFPnu3xQFgaWyjojXgFgOiNZ/gxpM62IGcQv4DfXdipEYz
	N/plPXfhZ0OpI4FO9Xzyu9f9EB4d5tuu2o1tvpBEGC0k8vtMSRwPgxuugg58jDs770YWvtEGpdX8P
	QN0qfPkYs8fbMOmHtJIeWuFsciVzqisYV9ndPj1s43YxHJcxAbnxaFmKUTAM8hmFi0/i2OcnyrkAy
	3sK+/uBw==;
Date: Thu, 22 Jun 2023 13:15:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: Per Bilse <Per.Bilse@citrix.com>, Andy Lutomirski <luto@kernel.org>,
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
Message-ID: <20230622111552.GI4253@hirez.programming.kicks-ass.net>
References: <20230621151442.2152425-1-per.bilse@citrix.com>
 <20230621164038.GM2053369@hirez.programming.kicks-ass.net>
 <6523f3e2-8dfc-c2dd-6d14-9e0c3ac93cc8@citrix.com>
 <20230621200409.GC4253@hirez.programming.kicks-ass.net>
 <a8cd2788-a695-964a-3311-dbecb669bb72@suse.com>
 <20230622082607.GD4253@hirez.programming.kicks-ass.net>
 <4d29bfe0-975a-c97f-3e79-5b77d95d3494@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4d29bfe0-975a-c97f-3e79-5b77d95d3494@suse.com>

On Thu, Jun 22, 2023 at 12:33:31PM +0200, Juergen Gross wrote:
> On 22.06.23 10:26, Peter Zijlstra wrote:

> > > The downside would be that some workloads might see worse performance
> > > due to backend I/O handling might get preempted.
> >=20
> > Is that an actual concern? Mark this a legaxy inteface and anybody who
> > wants to get away from it updates.
>=20
> It isn't that easy. See above.

Well, the old stuff gets to use full preemption on Dom0, then the new
stuff gets more shiny options.

> > > Just thinking - can full preemption be enabled per process?
> >=20
> > Nope, that's a system wide thing. Preemption is something that's driven
> > by the requirements of the tasks that preempt, not something by the
> > tasks that get preempted.
>=20
> Depends. If a task in a non-preempt system could switch itself to be
> preemptable, we could do so around hypercalls without compromising the
> general preemption setting. Disabling preemption in a preemptable system
> should continue to be possible for short code paths only, of course.

So something along those lines was suggested elsewhere, and I'm still
not entirely sure how I feel about it, but look here:

  https://lkml.kernel.org/r/20230403052233.1880567-1-ankur.a.arora@oracle.c=
om

Specifically patches 7 and 8. It is very close so that you currently
do/want. Those patches are many moons old and i've not seen an update on
them, so I've no idea where they are.

It solves a similar problem except it is 'rep string' instructions
that's being interrupted.

