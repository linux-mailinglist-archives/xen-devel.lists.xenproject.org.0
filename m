Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB22CEDB0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 13:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44689.80078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9sf-0000ng-0M; Fri, 04 Dec 2020 12:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44689.80078; Fri, 04 Dec 2020 12:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9se-0000nH-Sn; Fri, 04 Dec 2020 12:08:08 +0000
Received: by outflank-mailman (input) for mailman id 44689;
 Fri, 04 Dec 2020 12:08:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mnCO=FI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kl9sd-0000nC-13
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 12:08:07 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8149ed8-4223-400a-a05b-17597fb4bd18;
 Fri, 04 Dec 2020 12:08:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8315C67373; Fri,  4 Dec 2020 13:08:03 +0100 (CET)
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
X-Inumbo-ID: c8149ed8-4223-400a-a05b-17597fb4bd18
Date: Fri, 4 Dec 2020 13:08:03 +0100
From: Christoph Hellwig <hch@lst.de>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
Message-ID: <20201204120803.GA20727@lst.de>
References: <20201129035639.GW2532@mail-itl> <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com> <20201202000642.GJ201140@mail-itl> <20201204110847.GU201140@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201204110847.GU201140@mail-itl>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Dec 04, 2020 at 12:08:47PM +0100, Marek Marczykowski-Górecki wrote:
> culprit: 
> 
> commit 9e2369c06c8a181478039258a4598c1ddd2cadfa
> Author: Roger Pau Monne <roger.pau@citrix.com>
> Date:   Tue Sep 1 10:33:26 2020 +0200
> 
>     xen: add helpers to allocate unpopulated memory
>     
> I'm adding relevant people and xen-devel to the thread.
> For completeness, here is the original crash message:

That commit definitively adds a new ZONE_DEVICE user, so it does look
related.  But you are not running on Xen, are you?

