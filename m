Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084FF1A1F63
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:06:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8WE-0001iB-R1; Wed, 08 Apr 2020 11:05:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LAz7=5Y=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1jM8WE-0001i6-0I
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:05:18 +0000
X-Inumbo-ID: ce01660e-7988-11ea-b58d-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce01660e-7988-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oqUjbefYS3Yk7lY8aXBkaPJgSKoP23s64kxD/fHCpR8=; b=ugEMl3nwCKlvAWACI3gmebiipt
 8/1xS63dnZ7clRpRx+bkMlxjyy8k+YsGj2MI+19jCGbSbjP9/Mh5p/Sq4Ns9IBZ0gRBma6VKHMr/o
 XEW41GFTJDDlVx/mihtetBghKO/Pe9haIl5N9JxwKET5XHndOUhNK/ybyUXpJEQJAjk2gFBFkRJZB
 +02sNenIRFkYFGQEGXc6iwLxT+UnA4UTLIsWcXvI4Ai5zcYW6wgFbgT0qxY+3I8cqsnpMr251t/ZG
 vDz6HI4/lhpMzkmvbNWol4H34lr5aKfXny5PMY1OzXL/BXXZbLP430nCgbEc5TvjOztIXWIfYYJ1u
 pLlISIDg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8W0-0007ea-8z; Wed, 08 Apr 2020 11:05:04 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9ACC7300130;
 Wed,  8 Apr 2020 13:05:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8BE212BA90A60; Wed,  8 Apr 2020 13:05:01 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:05:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 09/26] x86/paravirt: Add runtime_patch()
Message-ID: <20200408110501.GS20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408050323.4237-10-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-10-ankur.a.arora@oracle.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, hpa@zytor.com, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 10:03:06PM -0700, Ankur Arora wrote:
> +/*
> + * preempt_enable_no_resched() so we don't add any preemption points until
> + * after the caller has returned.
> + */
> +#define preempt_enable_runtime_patch()	preempt_enable_no_resched()
> +#define preempt_disable_runtime_patch()	preempt_disable()

NAK, this is probably a stright preemption bug, also, afaict, there
aren't actually any users of this in the patch-set.

