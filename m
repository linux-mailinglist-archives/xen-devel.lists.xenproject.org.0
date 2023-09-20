Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822AD7A87A9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 16:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605783.943375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiyaD-0008SZ-5J; Wed, 20 Sep 2023 14:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605783.943375; Wed, 20 Sep 2023 14:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiyaD-0008Q2-2f; Wed, 20 Sep 2023 14:53:41 +0000
Received: by outflank-mailman (input) for mailman id 605783;
 Wed, 20 Sep 2023 14:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GbOY=FE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1qiyaA-0008Pu-Jv
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 14:53:39 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79c22d9c-57c5-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 16:53:37 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qiyZT-006Oz0-BC; Wed, 20 Sep 2023 14:52:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 04996300348; Wed, 20 Sep 2023 16:52:55 +0200 (CEST)
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
X-Inumbo-ID: 79c22d9c-57c5-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GyiHhTkxOm0E3nJZzmdSc55EE6M80FFoZ8Fg8eF69QI=; b=qal6/LGdy1+KLISPaYnZD8Qx03
	0sPsW4Hb98j/QISugyJf8X+fjehOvS9Ll09sNhQBGt4zYCqJLS05+5zcypr1lxzUUBMMzVD94e3dM
	WsEbCy3MXmjjSIbGTjummdcpDaTg/Q5P6+27Ache2MDt+PDg7wvaaYBxEqYwmH7IH6z3v4Nrab3kH
	jumgDPBEh8iwGY7QxhMaZVdU9o7YOZ+lp8opCiziKvMXLydIfARsPghjuMR+QFMMUTvGJiINVUWkL
	bzeShoJxnjyr3LqxNC1fTfMdieOivUFEv0jhy8CMnJm5sqI4skd6Rbs5aAGT9J8EfMFToJBwbaylz
	Z9nmpmCw==;
Date: Wed, 20 Sep 2023 16:52:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 1/3] x86/paravirt: move some functions and defines to
 alternative
Message-ID: <20230920145254.GC6687@noisy.programming.kicks-ass.net>
References: <20230608140333.4083-1-jgross@suse.com>
 <20230608140333.4083-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608140333.4083-2-jgross@suse.com>

On Thu, Jun 08, 2023 at 04:03:31PM +0200, Juergen Gross wrote:
> As a preparation for replacing paravirt patching completely by
> alternative patching, move some backend functions and #defines to
> alternative code and header.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

