Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2F3F94F6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 09:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173428.316449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJW8M-0007ak-6q; Fri, 27 Aug 2021 07:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173428.316449; Fri, 27 Aug 2021 07:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJW8M-0007Y4-3c; Fri, 27 Aug 2021 07:18:38 +0000
Received: by outflank-mailman (input) for mailman id 173428;
 Fri, 27 Aug 2021 07:18:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vFra=NS=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mJW8K-0007Xy-8I
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 07:18:36 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1414de0b-c45c-4d66-9d5f-0179bcf71f4b;
 Fri, 27 Aug 2021 07:18:33 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJW5C-00EFBb-NY; Fri, 27 Aug 2021 07:15:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 915013001CD;
 Fri, 27 Aug 2021 09:15:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 708F32C597E4C; Fri, 27 Aug 2021 09:15:17 +0200 (CEST)
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
X-Inumbo-ID: 1414de0b-c45c-4d66-9d5f-0179bcf71f4b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZQ3CU43IWogsKyG+uqc1TCqPH8QEEhdztK1oMhkx3lw=; b=UEWQ5QT1Y91/ArLjsjiq9W9wMI
	4duU1mRjJn7JeeiAF847EnVYvfwy4Rfpdir+x9o7riPAQa7etq+VNF8POzrhtbCqJR9z1sDHo+02+
	HbRjsvwxweLsyjOac0MdoWbdd7InTqsNF0dlSuTIm9XrvQy3b/4YvfSEiVegiut0LsQRQ6jPkb8bY
	IfuvY98Og8QSy5GUJ7lJvsT1gSp6DIN+Jh1ydVw5QcNhrxKH4onHt1u2fN6HncmwxCS76O+WauSkn
	5Gg/ot5B8Psq7tBf27BAosAhcGQs4x7CwCAan6H6s6t6hdJz/pw7lyH6HaF3gC9dwlVv0nm5ojf50
	S3+xyWHg==;
Date: Fri, 27 Aug 2021 09:15:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH 05/15] perf: Track guest callbacks on a per-CPU basis
Message-ID: <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-6-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827005718.585190-6-seanjc@google.com>

On Thu, Aug 26, 2021 at 05:57:08PM -0700, Sean Christopherson wrote:
> Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
> the callbacks more precisely and avoid a lurking NULL pointer dereference.

I'm completely failing to see how per-cpu helps anything here...

> On x86, KVM supports being built as a module and thus can be unloaded.
> And because the shared callbacks are referenced from IRQ/NMI context,
> unloading KVM can run concurrently with perf, and thus all of perf's
> checks for a NULL perf_guest_cbs are flawed as perf_guest_cbs could be
> nullified between the check and dereference.

No longer allowing KVM to be a module would be *AWESOME*. I detest how
much we have to export for KVM :/

Still, what stops KVM from doing a coherent unreg? Even the
static_call() proposed in the other patch, unreg can do
static_call_update() + synchronize_rcu() to ensure everybody sees the
updated pointer (would require a quick audit to see all users are with
preempt disabled, but I think your using per-cpu here already imposes
the same).



