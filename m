Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B72DC5CA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 18:59:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55541.96663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpb56-0007ia-JS; Wed, 16 Dec 2020 17:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55541.96663; Wed, 16 Dec 2020 17:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpb56-0007iB-G6; Wed, 16 Dec 2020 17:59:20 +0000
Received: by outflank-mailman (input) for mailman id 55541;
 Wed, 16 Dec 2020 17:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuYO=FU=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kpb55-0007i5-7B
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 17:59:19 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab5def83-d858-4587-a792-0bc985a594f3;
 Wed, 16 Dec 2020 17:59:14 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpb4K-0005dO-H8; Wed, 16 Dec 2020 17:58:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id ACE52300DAE;
 Wed, 16 Dec 2020 18:58:28 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8D62420274B26; Wed, 16 Dec 2020 18:58:28 +0100 (CET)
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
X-Inumbo-ID: ab5def83-d858-4587-a792-0bc985a594f3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Be2nf2w/Vps/TTeCXTZLGMYhjE3HrJ1GdzWfCzB412A=; b=nqy3TkxWRSI/ZUAfRjb7CiyHmI
	z2b0gw+/xmF3V4bRP9jBf1OEn4etLAnhng4c/UhOWUSeqB05jwPIj8Rh9uZ21hQ4ee6X60bTP9wEA
	RT0YNjOtLitpMmmclOBcDf+B6m0wbgQvaR8LEckSrcfDteNXNOq2baniPg2yh03WmdTFSO9hIdNUI
	8E2mfDpBotw+GKCLBHJG9i8cSzTmpu4Cs3K+bLZySIc078PNlokD2esyT5D92TUH4gAPARyY3Bs4M
	CQ1YkaXuVJJC+yhROI4pG+byk+ORTk/MtIQmn4cU/HodbcrIdCOQPphC4Beha/FAi9+e3UzMniGn2
	1KoBKrug==;
Date: Wed, 16 Dec 2020 18:58:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, luto@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>
Subject: Re: [PATCH v2 00/12] x86: major paravirt cleanup
Message-ID: <20201216175828.GQ3040@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120125342.GC3040@hirez.programming.kicks-ass.net>
 <20201123134317.GE3092@hirez.programming.kicks-ass.net>
 <6771a12c-051d-1655-fb3a-cc45a3c82e29@suse.com>
 <20201215141834.GG3040@hirez.programming.kicks-ass.net>
 <20201215145408.GR3092@hirez.programming.kicks-ass.net>
 <20201216003802.5fpklvx37yuiufrt@treble>
 <20201216084059.GL3040@hirez.programming.kicks-ass.net>
 <20201216165605.4h5q7os5dutjgdqi@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216165605.4h5q7os5dutjgdqi@treble>

On Wed, Dec 16, 2020 at 10:56:05AM -0600, Josh Poimboeuf wrote:
> On Wed, Dec 16, 2020 at 09:40:59AM +0100, Peter Zijlstra wrote:

> > > Could we make it easier by caching the shared
> > > per-alt-group CFI state somewhere along the way?
> > 
> > Yes, but when I tried it grew the code required. Runtime costs would be
> > less, but I figured that since alternatives are typically few and small,
> > that wasn't a real consideration.
> 
> Aren't alternatives going to be everywhere now with paravirt using them?

What I meant was, they're either 2-3 wide and only a few instructions
long. Which greatly bounds the actual complexity of the algorithm,
however daft.

> > No real objection, I just didn't do it because 1) it works, and 2) even
> > moar lines.
> 
> I'm kind of surprised it would need moar lines.  Let me play around with
> it and maybe I'll come around ;-)

Please do, it could be getting all the niggly bits right exhausted my
brain enough to miss the obvious ;-)

