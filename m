Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4412BAA96
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 13:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32161.63115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5vv-0006OS-Lf; Fri, 20 Nov 2020 12:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32161.63115; Fri, 20 Nov 2020 12:54:35 +0000
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
	id 1kg5vv-0006O3-IL; Fri, 20 Nov 2020 12:54:35 +0000
Received: by outflank-mailman (input) for mailman id 32161;
 Fri, 20 Nov 2020 12:54:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1kg5vu-0006Nv-26
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:54:34 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f926ee76-1607-49c5-8aee-179f3a58969d;
 Fri, 20 Nov 2020 12:54:31 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg5v5-0000yt-TS; Fri, 20 Nov 2020 12:53:44 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9B3B9306BCA;
 Fri, 20 Nov 2020 13:53:42 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 7A8C720244CF6; Fri, 20 Nov 2020 13:53:42 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=++Ek=E2=infradead.org=peterz@srs-us1.protection.inumbo.net>)
	id 1kg5vu-0006Nv-26
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:54:34 +0000
X-Inumbo-ID: f926ee76-1607-49c5-8aee-179f3a58969d
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f926ee76-1607-49c5-8aee-179f3a58969d;
	Fri, 20 Nov 2020 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ARS+JFM8lp7IU5S39whnGWAR9zPTjiLED++SVe3kkDg=; b=LFnlsnKEh1oJBjqJmqWEjBMDPA
	RhYAb819lhVkUmxOATMprP9zwrg4W8r9fnHYLaWcgSZc3ZZ+ibjAd2T+11VhwGcExv5iGdpTyCMCl
	mu8SvfQAmTH0Vap4aaLOeQ7Yz08iwbMPlGI8DH6PpXe94p9k+F+8oAIrNh0dTW6jn/MznD4fLHthg
	hRpx+wkXIeAkTOptyjsOsVhpg3FHxP6C9ShGQ7RFETLGfKWi3GUQcWQGmtIyrah0wRjprJzE6otgq
	BlItKpepcV2xggTTCc5EEQRfa/Ks4Hgph9aAqxMSO+H7U1UxN0JN5JhIiYLI2O9xDoxiQKOjkmQqX
	Ztj/Up7Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg5v5-0000yt-TS; Fri, 20 Nov 2020 12:53:44 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9B3B9306BCA;
	Fri, 20 Nov 2020 13:53:42 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7A8C720244CF6; Fri, 20 Nov 2020 13:53:42 +0100 (CET)
Date: Fri, 20 Nov 2020 13:53:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
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
	Daniel Bristot de Oliveira <bristot@redhat.com>
Subject: Re: [PATCH v2 00/12] x86: major paravirt cleanup
Message-ID: <20201120125342.GC3040@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-1-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:18PM +0100, Juergen Gross wrote:
>  30 files changed, 325 insertions(+), 598 deletions(-)

Much awesome ! I'll try and get that objtool thing sorted.

