Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DE135E9B6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 01:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110164.210259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWSWe-00047u-CV; Tue, 13 Apr 2021 23:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110164.210259; Tue, 13 Apr 2021 23:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWSWe-00047Z-9F; Tue, 13 Apr 2021 23:32:56 +0000
Received: by outflank-mailman (input) for mailman id 110164;
 Tue, 13 Apr 2021 23:32:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1MWi=JK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lWSWc-00047U-Uz
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 23:32:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16d6cc9f-0d1b-4a16-974c-979b6c1342d8;
 Tue, 13 Apr 2021 23:32:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46F1A61222;
 Tue, 13 Apr 2021 23:32:53 +0000 (UTC)
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
X-Inumbo-ID: 16d6cc9f-0d1b-4a16-974c-979b6c1342d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618356773;
	bh=PDWurdlRjIMbrz/aF4frD96uw6kSwSCdW9WLetMQJ2g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eeuhNogG6wddYtSlkqY1kbW3362Mq3rQbyckLffkXQRGwR3+0/CGNRxXsHqetDY0g
	 gqo/fXuPFNghVznGTNPoeKHpQF0syEU9/X7eAk6M9Yn9IiFfqTBybKfhyko1Xzg5uy
	 fsZ3tCNMZNRWcKkP8XLERt66sdgVW5qzihwxFfl6C51q7nmsx//T7vpOKTXCaX47/e
	 HefDbr0C32qp3gGRa3I9Xqy6A2Evo8pLCzrcOnjaY388eYUYJ7hyt85OhiwWMC3W2T
	 PrJkKKWnZRYlkFBH+sGs08UuMdMSwKPbV9F4JJ8bXFVBXx/pWZqnFigbDVJnJ+vZig
	 ig3wvHl9CFjvQ==
Date: Tue, 13 Apr 2021 16:32:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
cc: Juergen Gross <jgross@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Support of old Xen versions in the Linux kernel
In-Reply-To: <b7684e00-8675-5768-b4b2-f9435620b34e@oracle.com>
Message-ID: <alpine.DEB.2.21.2104131631470.4885@sstabellini-ThinkPad-T480s>
References: <1e4dc7c0-4364-1095-bb6b-c6341bc58e60@suse.com> <b7684e00-8675-5768-b4b2-f9435620b34e@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Apr 2021, Boris Ostrovsky wrote:
> On 4/13/21 2:14 AM, Juergen Gross wrote:
> > In x86 kernel development the question came up whether we need to
> > support XENFEAT_gnttab_map_avail_bits not being set when running as a PV
> > guest.
> >
> > This feature is active for PV guests since Xen 3.4.
> >
> > So the basic question is: which is the oldest version of Xen we want to
> > support in the Linux kernel? As far as I know there is no Xen based
> > product in productive use with Xen older than 4.2.
> >
> > Would we be fine to drop support for older versions (feel free to
> > suggest other versions than 4.2 as the first to be supported Xen
> > version)?
> >
> > In case the answer is yes, I'd post some patches to clean up the kernel,
> > including a safety net to bail out in case a feature needed isn't
> > available.
> 
> Sounds good to me.

For ARM, the Xen ABI became stable only with Xen 4.4.

