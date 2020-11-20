Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7A2BA9C1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 13:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32086.63004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg57y-0008Aq-HP; Fri, 20 Nov 2020 12:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32086.63004; Fri, 20 Nov 2020 12:02:58 +0000
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
	id 1kg57y-0008AR-E6; Fri, 20 Nov 2020 12:02:58 +0000
Received: by outflank-mailman (input) for mailman id 32086;
 Fri, 20 Nov 2020 12:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kg57x-0008A9-85
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:02:57 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f49863d4-8d81-4a8e-8d9e-9d260c9434e5;
 Fri, 20 Nov 2020 12:02:49 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg572-0006MQ-D6; Fri, 20 Nov 2020 12:02:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EAD53305C16;
 Fri, 20 Nov 2020 13:01:54 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CD10B200DF1A6; Fri, 20 Nov 2020 13:01:54 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
	id 1kg57x-0008A9-85
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:02:57 +0000
X-Inumbo-ID: f49863d4-8d81-4a8e-8d9e-9d260c9434e5
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f49863d4-8d81-4a8e-8d9e-9d260c9434e5;
	Fri, 20 Nov 2020 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xeukajkb0Dh8Aj05tLhXcYnJX0ZZcEiN+jLi0pnGRWQ=; b=eEI2XdW3SS3SvnEYkgrxIgrkkZ
	QESj0xks6qaTJAnkv/SrECagNU+vSqctcrq0xLMAWIfHAZKLk9ye2uO7gskiUylP8RbcybpWeUXL2
	uK6+gWyoCZxLIYAsj/8Cr6bDQjqDWnVAJEvPDRs9mQv3WAo/KAacUwgv54o4zvTL/2MI1ffWEmq47
	iGzPS/OuVWATcJv3FdWhjqRfpijJMY2zQfXpueb6tRHat5LxD9HkJ5lF4m33YjKhMqWD/w/svRfZq
	kIH2ZsgedGxLYnMj1h8GrezPVSEXeHN6F04tocRnYrqwZsV1M6RSBowt+3mIDzez5FevIapCnyvmm
	E0VqGnQQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg572-0006MQ-D6; Fri, 20 Nov 2020 12:02:00 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EAD53305C16;
	Fri, 20 Nov 2020 13:01:54 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id CD10B200DF1A6; Fri, 20 Nov 2020 13:01:54 +0100 (CET)
Date: Fri, 20 Nov 2020 13:01:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>
Subject: Re: [PATCH v2 06/12] x86/paravirt: switch time pvops functions to
 use static_call()
Message-ID: <20201120120154.GE3021@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-7-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:24PM +0100, Juergen Gross wrote:
> The time pvops functions are the only ones left which might be
> used in 32-bit mode and which return a 64-bit value.
> 
> Switch them to use the static_call() mechanism instead of pvops, as
> this allows quite some simplification of the pvops implementation.
> 
> Due to include hell this requires to split out the time interfaces
> into a new header file.

There's also this patch floating around; just in case that would come in
handy:

  https://lkml.kernel.org/r/20201110005609.40989-3-frederic@kernel.org

