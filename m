Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714037D41A
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 22:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126365.237886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvBu-0003pm-0W; Wed, 12 May 2021 20:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126365.237886; Wed, 12 May 2021 20:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvBt-0003md-TP; Wed, 12 May 2021 20:10:45 +0000
Received: by outflank-mailman (input) for mailman id 126365;
 Wed, 12 May 2021 20:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgvBs-0003mX-Lc
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 20:10:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c367de5-ca19-4a09-8571-a7541e6c4968;
 Wed, 12 May 2021 20:10:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E584D61408;
 Wed, 12 May 2021 20:10:42 +0000 (UTC)
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
X-Inumbo-ID: 5c367de5-ca19-4a09-8571-a7541e6c4968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620850243;
	bh=KiSht4eykHbuRx4encDVma3UC0WdUp6sYB51Ups/XBQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oe+sv3ILc/RC+aVoS4W+Yefy9KsbBFO5a0a/INlcBlqGDSktVFnmkAeXr/w639z41
	 FF6tet/bKQ9itBDU7qZ50bOtG4N5MDKvqG9wXs9XE5I7LA6RUYdRx25BxbmF5tLeM8
	 vC7jRmufvNf0Cfxf5++3NwAC67oEPQXe/Acw1pHjw6tfLBhINnc8MFktxvcakjlL3t
	 7tHb+8HFZ7QQHeyqwmf1dF6OY5SnoGvdYQ04BKAkHWVg+Q0awZtJSeCSnfthbMy5YS
	 pp9vmID2lox89aKRN67CxlsLOK/QV8v48IrBEG+cQCZbXsRdFaQTNxlDH3SPOPnQnj
	 ShdB+57YHYeuw==
Date: Wed, 12 May 2021 13:10:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, hch@lst.de, linux-kernel@vger.kernel.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, jgross@suse.com
Subject: Re: [PATCH 2/2] xen/swiotlb: check if the swiotlb has already been
 initialized
In-Reply-To: <2e5a684b-3c74-5efc-2946-8ca002894ab4@oracle.com>
Message-ID: <alpine.DEB.2.21.2105121310210.5018@sstabellini-ThinkPad-T480s>
References: <20210511174142.12742-2-sstabellini@kernel.org> <2e5a684b-3c74-5efc-2946-8ca002894ab4@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 May 2021, Boris Ostrovsky wrote:
> On 5/11/21 1:41 PM, Stefano Stabellini wrote:
> > --- a/drivers/xen/swiotlb-xen.c
> > +++ b/drivers/xen/swiotlb-xen.c
> > @@ -164,6 +164,11 @@ int __ref xen_swiotlb_init(void)
> >  	int rc = -ENOMEM;
> >  	char *start;
> >  
> > +	if (io_tlb_default_mem != NULL) {
> > +		printk(KERN_WARNING "Xen-SWIOTLB: swiotlb buffer already initialized\n");
> 
> 
> pr_warn().
> 
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrvsky@oracle.com>

Thank you! I'll send a v2 shortly with the change to pr_warn and your
reviewed-by.

