Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C501F403514
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181533.328690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrp6-0002FJ-6s; Wed, 08 Sep 2021 07:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181533.328690; Wed, 08 Sep 2021 07:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrp6-0002DW-3p; Wed, 08 Sep 2021 07:16:44 +0000
Received: by outflank-mailman (input) for mailman id 181533;
 Wed, 08 Sep 2021 07:16:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrp4-0002DM-4b
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:16:42 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f81b569-4fed-42fa-9d05-4bfd16929154;
 Wed, 08 Sep 2021 07:16:40 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrml-008b2V-QY; Wed, 08 Sep 2021 07:14:58 +0000
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
X-Inumbo-ID: 6f81b569-4fed-42fa-9d05-4bfd16929154
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MnjsixqmosBihT6Q0qVYXXqBZ2K/JeOxHPpv883b1xQ=; b=XbM8Xg3PjSFGTYmv3zW07WfyaY
	yWEdMq1eEqx0RRQqf2r7e6pYKpvEx0oG4KVrQaoCagb/MmI7o0acywnXwpXSPJTo/1MkSPkPOEFJy
	mKVPyz7XoUQE44YQmLjxnlC/1P/RLwrxrspgdaqdkFsWsJpB2cRQfFSd4r+Bz7k7bOYyGJ9XCEdOU
	VV701Kva713ECwwrgTRZcHhYdgohcpF+ORONW/M/BNUXYF7JoqGFO0tJVrTc+1JqjXQEOCwt3RRqO
	IbwKTqnS0QnoY/SeWesV1xBSinYJz2jyaANLtuvExQupl4FPr9q6HdJd1s3vCXjHopyF3JjAZ7vVe
	7+fwQCwQ==;
Date: Wed, 8 Sep 2021 08:14:19 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 12/12] swiotlb-xen: this is PV-only on x86
Message-ID: <YThiyxG0d2tmCtb+@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <004feaef-f3bb-e4bb-fb10-f205a9f69f28@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004feaef-f3bb-e4bb-fb10-f205a9f69f28@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:13:21PM +0200, Jan Beulich wrote:
> The code is unreachable for HVM or PVH, and it also makes little sense
> in auto-translated environments. On Arm, with
> xen_{create,destroy}_contiguous_region() both being stubs, I have a hard
> time seeing what good the Xen specific variant does - the generic one
> ought to be fine for all purposes there. Still Arm code explicitly
> references symbols here, so the code will continue to be included there.

Can the Xen/arm folks look into that?  Getting ARM out of using
swiotlb-xen would be a huge step forward cleaning up some DMA APIs.

> 
> Instead of making PCI_XEN's "select" conditional, simply drop it -
> SWIOTLB_XEN will be available unconditionally in the PV case anyway, and
> is - as explained above - dead code in non-PV environments.
> 
> This in turn allows dropping the stubs for
> xen_{create,destroy}_contiguous_region(), the former of which was broken
> anyway - it failed to set the DMA handle output.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

