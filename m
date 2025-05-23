Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CACAC21D3
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 13:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995622.1377917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIQME-0003fr-5Y; Fri, 23 May 2025 11:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995622.1377917; Fri, 23 May 2025 11:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIQME-0003do-1y; Fri, 23 May 2025 11:14:34 +0000
Received: by outflank-mailman (input) for mailman id 995622;
 Fri, 23 May 2025 11:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+CO=YH=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1uIQMB-0003di-Dn
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 11:14:31 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14100e4d-37c7-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 13:14:28 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uIQLx-00000007VFJ-22r2; Fri, 23 May 2025 11:14:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 10E13300583; Fri, 23 May 2025 13:14:17 +0200 (CEST)
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
X-Inumbo-ID: 14100e4d-37c7-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qFE8tg2hkqL/QDMRDxBmyrXVviTv054S7EmAHGK1Cu8=; b=VTm6YpXt+rg+boo/Y2XlDLHfjF
	uTUdFDuv7CRduVt0vgcpt1H3qXyWcKOUKwBJyBzjyRnEO9SE7JRpGZOhTfBBSEBXLgYIEYKbXlZDB
	tpsVGBoReZXjDVnjHYqsbdp3l9lenZI0uN4sGBmjoTHFC/oSTcCk06BRBBvKukbRvtHnIoQOohxFp
	AAk2xVkEy/ZUzR6Fa5IR24TYqZXrrQUCbpTsXVqK4NnKuLMx7BbaRzGqb7TLhfaz4cV5tvbk6Bwys
	vuAtkKS5Ar3GY61i/vpDcdclGEPpTbtP7i+0lOv6wFveWet/d/4Gtx0J7aORLDJMVameaAuX32RZ0
	m/g+9Shg==;
Date: Fri, 23 May 2025 13:14:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 00/13] KVM: Make irqfd registration globally unique
Message-ID: <20250523111416.GJ39944@noisy.programming.kicks-ass.net>
References: <20250522235223.3178519-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>

On Thu, May 22, 2025 at 04:52:10PM -0700, Sean Christopherson wrote:
>   sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
>   sched/wait: Add a waitqueue helper for fully exclusive priority
>     waiters

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

