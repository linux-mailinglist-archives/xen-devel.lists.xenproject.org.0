Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848774034AC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181489.328625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNraD-0005su-IO; Wed, 08 Sep 2021 07:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181489.328625; Wed, 08 Sep 2021 07:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNraD-0005r7-F7; Wed, 08 Sep 2021 07:01:21 +0000
Received: by outflank-mailman (input) for mailman id 181489;
 Wed, 08 Sep 2021 07:01:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNraB-0005r1-VT
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:01:19 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce99a267-d7c9-403e-8b14-e9dad578ed15;
 Wed, 08 Sep 2021 07:01:19 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrZH-008aHN-76; Wed, 08 Sep 2021 07:00:34 +0000
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
X-Inumbo-ID: ce99a267-d7c9-403e-8b14-e9dad578ed15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R8OKvw4S2MzNKNmIXpBxq9HTvvmNUrQ/SvUk9VnsHUY=; b=rpo3HkOJxy7GQnr44u+Kw8/GWw
	b8U0qMtuai8fWaIBPF65LKePgrrYtAvsRonr7HKZ/kABbXwFaD3Mpb9NLGgv57kVtXFmpclCY72AW
	bRhylceyEaHc9mZwksibH7RRQWka7q8ZoZO0inYa0QUo14guNPVn4vgylPrf7IJVRKoj/ZEvI6QNn
	BnqFevB+Z2JckxFutk9LRF6NHmlUhurLK75V0CumKbej0KWAQMeYjX0SWkuA0cQAqZ5knLN3VjNDg
	0Q71U9TW6LUgg1Y/e5lIBYVvFbraJ7etFrdulT7G7nM5y7yJQdeATwHB+s08UVof9jVe9hk8cGZ1V
	nCpsr0OQ==;
Date: Wed, 8 Sep 2021 08:00:23 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/12] swiotlb-xen: limit init retries
Message-ID: <YThfh2aIlAIkdrXA@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <984fa426-2b7b-4b77-5ce8-766619575b7f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <984fa426-2b7b-4b77-5ce8-766619575b7f@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:06:37PM +0200, Jan Beulich wrote:
> Due to the use of max(1024, ...) there's no point retrying (and issuing
> bogus log messages) when the number of slabs is already no larger than
> this minimum value.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

