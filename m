Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415FD251972
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 15:22:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAYsl-0005pf-Mn; Tue, 25 Aug 2020 13:20:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2gY=CD=casper.srs.infradead.org=batv+e2e8a9c35d4e33688cf1+6211+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kAYsh-0005pa-SD
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 13:20:58 +0000
X-Inumbo-ID: 5363b778-44be-44ff-b4d5-e582acfdd277
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5363b778-44be-44ff-b4d5-e582acfdd277;
 Tue, 25 Aug 2020 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LRm0a/AB7+1jHaa0sot49R1mIGi0p1SlyxSDm8WQBUY=; b=lrAraWCD0S6gbXfgpQDHWUO/c9
 h9fHLCFKRmzwX3tEO6KmBBJPdc2hC2xC5WOzhw8pvEPStATv125pL/mG+LzD+hfrKqJVp27Y0mNER
 9aeCh3lIVcvwz3xMQ30QSJ9oELZaSR2ANlcR1FM80B7yrdX7N9ZB8JEqVgcWQp0CQfufwfzgf9B+W
 feHcq1Y1tQnTThv0sDdbo49HNl0TnG08P6WBYs3Ic3AfN5b814aejFz/QqC408/5ipz+8R/Eb/wk0
 IaozjHE1Ud/5cy0pdrYHwhGtwPqKow6xBRZvgY7qyHtHQjlGwSR+Y2nXk7DN6GtMra4WkUZ9wvtcg
 v36HK0hA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kAYrq-0006b2-89; Tue, 25 Aug 2020 13:20:02 +0000
Date: Tue, 25 Aug 2020 14:20:02 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: mingo@redhat.com, bp@alien8.de, hpa@zytor.com, x86@kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, kamatam@amazon.com,
 sstabellini@kernel.org, konrad.wilk@oracle.com,
 roger.pau@citrix.com, axboe@kernel.dk, davem@davemloft.net,
 rjw@rjwysocki.net, len.brown@intel.com, pavel@ucw.cz,
 peterz@infradead.org, eduval@amazon.com, sblbir@amazon.com,
 anchalag@amazon.com, xen-devel@lists.xenproject.org,
 vkuznets@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org
Subject: Re: [PATCH v3 05/11] genirq: Shutdown irq chips in suspend/resume
 during hibernation
Message-ID: <20200825132002.GA25009@infradead.org>
References: <cover.1598042152.git.anchalag@amazon.com>
 <d9bcd552c946ac56f3f17cc0c1be57247d4a3004.1598042152.git.anchalag@amazon.com>
 <87h7svqzxm.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7svqzxm.fsf@nanos.tec.linutronix.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Aug 22, 2020 at 02:36:37AM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> followed by an empty new line before the actual changelog text
> starts. That way the attribution of the patch when applying it will be
> correct.

The way he sent it attribution will be correct as he managed to get his
MTU to send out the mail claiming to be from you.  But yes, it needs
the second From line, _and_ the first from line needs to be fixed to
be from him.

