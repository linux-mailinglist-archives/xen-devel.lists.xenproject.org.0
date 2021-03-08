Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30636331371
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 17:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95025.179211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJIo5-0006eT-Ef; Mon, 08 Mar 2021 16:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95025.179211; Mon, 08 Mar 2021 16:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJIo5-0006e7-Ba; Mon, 08 Mar 2021 16:32:33 +0000
Received: by outflank-mailman (input) for mailman id 95025;
 Mon, 08 Mar 2021 16:32:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jF2O=IG=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1lJIo3-0006e2-Ev
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 16:32:32 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9e0e3f5-f6b1-4907-b936-b0de7befaa3e;
 Mon, 08 Mar 2021 16:32:22 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJImq-00FhSp-Nd; Mon, 08 Mar 2021 16:31:18 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E6098301A32;
 Mon,  8 Mar 2021 17:31:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AED8F23662BE6; Mon,  8 Mar 2021 17:31:14 +0100 (CET)
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
X-Inumbo-ID: f9e0e3f5-f6b1-4907-b936-b0de7befaa3e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ctgZEZ6SYMXYKEHtwrX/ccObphSH4Tanp4Hu/eZWjco=; b=O6GPVLkfkFCoPo4u770nad6OVA
	ehvFbr/4Mm4vWAjFwqwO5SUsDEau/mYHQZ2gkZ8bdv6assDl5XHprfvP70WyYSlLZqB6F19bheizF
	nWPQ2Fl72q4it0NkKb6zdcBFPwO70OKu3vEzT2CGrnUjfYkNffqBcBu5G1k4oM0zmDsfKpRv9mKKH
	whBUzj7rXE+Y3QCrs42HCNj7eF65Dc+sIk2yQUI7l5GArDZPP9GU2hC1IbAcptmuQ8kurX/Qn02eX
	G65NDEmgPjiiWczczc82QFlc/DRBUkXZOonwrC3aGjytll0ncMWktJG6plrfBKKjODkeclkevvDPx
	zKEDNnOw==;
Date: Mon, 8 Mar 2021 17:31:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, clang-built-linux@googlegroups.com,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v5 00/12] x86: major paravirt cleanup
Message-ID: <YEZRUh6sYS+8Rm+I@hirez.programming.kicks-ass.net>
References: <20210308122844.30488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308122844.30488-1-jgross@suse.com>

On Mon, Mar 08, 2021 at 01:28:32PM +0100, Juergen Gross wrote:
> This is a major cleanup of the paravirt infrastructure aiming at
> eliminating all custom code patching via paravirt patching.
> 
> This is achieved by using ALTERNATIVE instead, leading to the ability
> to give objtool access to the patched in instructions.
> 
> In order to remove most of the 32-bit special handling from pvops the
> time related operations are switched to use static_call() instead.
> 
> At the end of this series all paravirt patching has to do is to
> replace indirect calls with direct ones. In a further step this could
> be switched to static_call(), too.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

I've rebased my objtool/retpoline branch on top of this, will post
if/when this hits tip. Negative alternative works like a charm.

