Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949963667A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 18:05:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447692.704213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxtA2-0007hk-NK; Wed, 23 Nov 2022 17:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447692.704213; Wed, 23 Nov 2022 17:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxtA2-0007fx-KR; Wed, 23 Nov 2022 17:03:46 +0000
Received: by outflank-mailman (input) for mailman id 447692;
 Wed, 23 Nov 2022 17:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7hN=3X=kernel.org=jpoimboe@srs-se1.protection.inumbo.net>)
 id 1oxtA0-0007fr-CX
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 17:03:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8aa8001-6b50-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 18:03:42 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F16CEB821D8;
 Wed, 23 Nov 2022 17:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84193C433B5;
 Wed, 23 Nov 2022 17:03:39 +0000 (UTC)
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
X-Inumbo-ID: c8aa8001-6b50-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669223019;
	bh=m9XRdTo1RKmcs2mxaIv6FBSHv+6lgqotVqiNHoXrWdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIsPk3EyOIxwWCYLSnt73pV3xqGkyYI625biqcGf6DZOEwcTFpFfPyetoe4qgcmD0
	 9B/nQKKjGeOJznrCyFEEO1diQUnxBXnB1OS6/fbbMC/f2cbaKCEMACyE0zoK8+mYM0
	 XcAVCDy9AP+95u/VmUv7e9UOtIlbvf+lsM1MqifC9asQqh36Bv2oEQstSSVEA3Z1G0
	 NqWF28lvWXIWqsmuGepb4eM5KYVoRaDd8iFOwPKPYOCW3rWm7zxwikrcM5o1uVt5Kk
	 V4K7KnlBJ+4e8mcPyqzJPxAZzmnpbtrI1trv1tOMUNdDliSVXHqCoY1aC08XKiGU7F
	 voULg1tMcGajA==
Date: Wed, 23 Nov 2022 09:03:37 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jgross@suse.com" <jgross@suse.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: objtool warning for next-20221118
Message-ID: <20221123170337.keacggyvn4ykbtsw@treble>
References: <20221121040736.GA3738360@paulmck-ThinkPad-P17-Gen-1>
 <Y3thrQxfcvZSXFlr@hirez.programming.kicks-ass.net>
 <20221121145215.GF4001@paulmck-ThinkPad-P17-Gen-1>
 <20221122051605.4hcbslwxez2trdvt@treble>
 <Y3yJxQJ9DwxTx7km@hirez.programming.kicks-ass.net>
 <20221123012350.kelmmadh65lyswqz@treble>
 <Y33gAiFP2IpVdxJu@hirez.programming.kicks-ass.net>
 <2255c45f-d8ba-3f32-9d99-737ad3040dd7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2255c45f-d8ba-3f32-9d99-737ad3040dd7@citrix.com>

On Wed, Nov 23, 2022 at 10:52:09AM +0000, Andrew Cooper wrote:
> > Well, if you return from arch_cpu_idle_dead() you're back in the idle
> > loop -- exactly where you would be if you were to bootstrap the whole
> > CPU -- provided you have it remember the whole state (easier with a
> > vCPU).

play_dead() really needs sane semantics.  Not only does it introduce a
surprise to the offlining code in do_idle(), it also skips the entire
hotplug state machine.  Not sure if that introduces any bugs, but at the
very least it's subtle and surprising.

> > But maybe I'm missing something, lets add Xen folks on.
> 
> Calling VCPUOP_down on oneself always succeeds, but all it does is
> deschedule the vCPU.
> 
> It can be undone at a later point by a different vcpu issuing VCPUOP_up
> against the previously-downed CPU, at which point the vCPU gets rescheduled.
> 
> This is why the VCPUOP_down hypercall returns normally.  All state
> really is intact.
> 
> As for what Linux does, this is how xen_pv_cpu_up() currently behaves. 
> If you want to make Xen behave more everything else, then bug a BUG()
> after VCPUOP_down, and adjust xen_pv_cpu_up() to skip its initialised
> check and always use VCPUOP_initialise to bring the vCPU back online.

Or we could do what sev_es_play_dead() does and just call start_cpu0()
after the hypercall returns?

Though, start_cpu0() seems very suspect, it just uses the stack of the
idle task of whatever CPU happened to be last brought up via cpu_up().
Which means we now have two idle tasks sharing the same stack?  How is
start_cpu0() not broken???

-- 
Josh

