Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5A66DD78
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 13:23:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479386.743196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkzY-00065f-Q9; Tue, 17 Jan 2023 12:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479386.743196; Tue, 17 Jan 2023 12:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkzY-00062F-Mx; Tue, 17 Jan 2023 12:23:04 +0000
Received: by outflank-mailman (input) for mailman id 479386;
 Tue, 17 Jan 2023 12:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MSG=5O=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHkzW-000627-Ua
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 12:23:03 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae38c871-9661-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 13:23:00 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHkzP-009fbF-JC; Tue, 17 Jan 2023 12:22:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 361363005C9;
 Tue, 17 Jan 2023 13:22:41 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 15B9420B1647C; Tue, 17 Jan 2023 13:22:41 +0100 (CET)
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
X-Inumbo-ID: ae38c871-9661-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KPcxEANcwfX3iqDYXrP0qaBKg/IIzvrkL1jXD2O4/YU=; b=T37/fdyH3s0FoXrIwst2EWKWW2
	gWZV1W+E91gwq1HK6a/49VgIdqo+idZ6XnC5EolsKpR9J6SEA4x5mV228YM4nl/LqVkHXAv87cJHg
	AJE7gQpSpVbHwcysQlQQvz5d2KUQpnTwfNRun33w361Zbw4/eNEQqe1AbkaGLU75oBwowWHcS0HL7
	nP1LPydHLx7ZFZlAjm46I9fu01OOn1589OFzsMSMprpw34deb7I+GBxJa0tA8ywqvRqcbv45sYaHp
	huG6eQ3fAi/BuUQkxeMmOF/vQ/aRRDhp9PWAihhrUxezDkp53guytzHb8K3MN5IuPYzM0htYLo7Ra
	DUtJsC+g==;
Date: Tue, 17 Jan 2023 13:22:41 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux-foundation.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/paravirt: merge activate_mm and dup_mmap callbacks
Message-ID: <Y8aTEfpw0Vm6g0hC@hirez.programming.kicks-ass.net>
References: <20230112152132.4399-1-jgross@suse.com>
 <3fcb5078-852e-0886-c084-7fb0cfa5b757@csail.mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fcb5078-852e-0886-c084-7fb0cfa5b757@csail.mit.edu>

On Sun, Jan 15, 2023 at 08:27:50PM -0800, Srivatsa S. Bhat wrote:

> I see that's not an issue right now since there is no other actual
> user for these callbacks. But are we sure that merging the callbacks
> just because the current user (Xen PV) has the same implementation for
> both is a good idea?

IIRC the pv_ops are part of the PARAVIRT_ME_HARDER (also spelled as
_XXL) suite of ops and they are only to be used by Xen PV, no new users
of these must happen.

The moment we can drop Xen PV (hopes and dreams etc..) all these things
go in the bin right along with it.



