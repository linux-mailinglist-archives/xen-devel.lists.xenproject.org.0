Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4F4034A6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181482.328613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrYx-0004Zx-8C; Wed, 08 Sep 2021 07:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181482.328613; Wed, 08 Sep 2021 07:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNrYx-0004WI-4y; Wed, 08 Sep 2021 07:00:03 +0000
Received: by outflank-mailman (input) for mailman id 181482;
 Wed, 08 Sep 2021 07:00:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHX5=N6=casper.srs.infradead.org=BATV+2e9f3f7219a4df6f1e93+6590+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1mNrYv-0004Hv-Hk
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:00:01 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc851688-09a0-43ef-9428-e4d35a423485;
 Wed, 08 Sep 2021 07:00:00 +0000 (UTC)
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mNrXr-008aF4-Do; Wed, 08 Sep 2021 06:59:08 +0000
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
X-Inumbo-ID: cc851688-09a0-43ef-9428-e4d35a423485
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7gmr+v/UYd69hqQff5Fcu4B0asSjyasIdDD4iqilMBs=; b=BhJhq2e3Ic/6vaQ2X9A7y70QlA
	LN7tsn+RSNKPWUCjSCIDNsjviepIb4CgpXAMqNPNl0hCUOuRIE5CY+CkQLja8SX75eR6DryDm1ntu
	3lscohH7+1ssTfUDNi/P/N7uBNXacnQBZA8Hwdqtv+q8NMyvtpoAp4qXNq9o5P6fAZ2/dkCjoEriy
	9tKDLpzsK8JdUsp5eCc433G7x3oabL/dTqC0I0T/PLIzJFdqeztX9uUHC6V51OBay7pb4m35Oya0f
	MqyWaHEDdXo8bVRyW4we+Z42VMXBxFTjies7EWwuwlP/xoOr+NeRaW4DyrX4oGeCcpwEA6IVe1Gbq
	8C+Nm+Sg==;
Date: Wed, 8 Sep 2021 07:58:55 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/12] swiotlb-xen: suppress certain init retries
Message-ID: <YThfL9RChhtBA0Oc@infradead.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <56477481-87da-4962-9661-5e1b277efde0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56477481-87da-4962-9661-5e1b277efde0@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Sep 07, 2021 at 02:05:54PM +0200, Jan Beulich wrote:
> Only on the 2nd of the paths leading to xen_swiotlb_init()'s "error"
> label it is useful to retry the allocation; the first one did already
> iterate through all possible order values.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

