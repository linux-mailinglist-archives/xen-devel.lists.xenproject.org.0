Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C142DAEC3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 15:20:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54265.94218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBAl-0004mA-FQ; Tue, 15 Dec 2020 14:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54265.94218; Tue, 15 Dec 2020 14:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBAl-0004ll-Bg; Tue, 15 Dec 2020 14:19:27 +0000
Received: by outflank-mailman (input) for mailman id 54265;
 Tue, 15 Dec 2020 14:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDkq=FT=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kpBAj-0004lN-5p
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 14:19:25 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db42cfca-a869-4ccb-949f-2eafe5a9e9ec;
 Tue, 15 Dec 2020 14:19:20 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpB9x-0007Qz-Vq; Tue, 15 Dec 2020 14:18:38 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C214A300446;
 Tue, 15 Dec 2020 15:18:34 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A8CE3200CFB30; Tue, 15 Dec 2020 15:18:34 +0100 (CET)
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
X-Inumbo-ID: db42cfca-a869-4ccb-949f-2eafe5a9e9ec
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n3MIZt3/znb4uRxmCaPyGVKsSFg4njtwCHLsmpqHHtc=; b=j5aJJbiLj/qdgQPvO1H9cZO69S
	cghj1tVt1MmeFUvrTyb7sI8SjpJMY/zf9c3AF09ZpaS3kpNRMq7Qcza+a+4SVPftUg92+de3j06ij
	TpvnEmE1F1M9N0xpaIyBwLxOwyzPMjM1Fuu/184ceVPJZHJ8yc8/CxeiHpKLfHNVY2JdoHHrZrv/6
	52/R56RdCA7sZvOvf5pukk87Nrmwsfm/qV5Ymb9hkIGZ805z6H/EQBg+eqwMVq1zBU/Ekh8ZN0Wyq
	bkHOj3MQ8RLBs8mNaGQ8LQey8vYZ+0uPL6pOynf1wFmF5Sb2xwez3kwxSkQndlTWxEbDpMaIXx+2n
	SfEy17IQ==;
Date: Tue, 15 Dec 2020 15:18:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
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
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v2 00/12] x86: major paravirt cleanup
Message-ID: <20201215141834.GG3040@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120125342.GC3040@hirez.programming.kicks-ass.net>
 <20201123134317.GE3092@hirez.programming.kicks-ass.net>
 <6771a12c-051d-1655-fb3a-cc45a3c82e29@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6771a12c-051d-1655-fb3a-cc45a3c82e29@suse.com>

On Tue, Dec 15, 2020 at 12:42:45PM +0100, J=FCrgen Gro=DF wrote:
> Peter,
>=20
> On 23.11.20 14:43, Peter Zijlstra wrote:
> > On Fri, Nov 20, 2020 at 01:53:42PM +0100, Peter Zijlstra wrote:
> > > On Fri, Nov 20, 2020 at 12:46:18PM +0100, Juergen Gross wrote:
> > > >   30 files changed, 325 insertions(+), 598 deletions(-)
> > >=20
> > > Much awesome ! I'll try and get that objtool thing sorted.
> >=20
> > This seems to work for me. It isn't 100% accurate, because it doesn't
> > know about the direct call instruction, but I can either fudge that or
> > switching to static_call() will cure that.
> >=20
> > It's not exactly pretty, but it should be straight forward.
>=20
> Are you planning to send this out as an "official" patch, or should I
> include it in my series (in this case I'd need a variant with a proper
> commit message)?

Ah, I was waiting for Josh to have an opinion (and then sorta forgot
about the whole thing again). Let me refresh and provide at least a
Changelog.

