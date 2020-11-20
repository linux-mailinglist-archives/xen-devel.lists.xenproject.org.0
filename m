Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F92BA510
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 09:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31750.62396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg27L-0006F9-Io; Fri, 20 Nov 2020 08:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31750.62396; Fri, 20 Nov 2020 08:50:07 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg27L-0006Ek-FA; Fri, 20 Nov 2020 08:50:07 +0000
Received: by outflank-mailman (input) for mailman id 31750;
 Fri, 20 Nov 2020 08:50:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kg27K-0005ct-6t
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:50:06 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7732ed9f-d17a-43b9-a405-c75d75e7b049;
 Fri, 20 Nov 2020 08:49:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A171367373; Fri, 20 Nov 2020 09:49:56 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tRH+=E2=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kg27K-0005ct-6t
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:50:06 +0000
X-Inumbo-ID: 7732ed9f-d17a-43b9-a405-c75d75e7b049
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7732ed9f-d17a-43b9-a405-c75d75e7b049;
	Fri, 20 Nov 2020 08:49:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A171367373; Fri, 20 Nov 2020 09:49:56 +0100 (CET)
Date: Fri, 20 Nov 2020 09:49:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 07/20] init: refactor name_to_dev_t
Message-ID: <20201120084956.GA21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-8-hch@lst.de> <20201118143747.GL1981@quack2.suse.cz> <20201119075225.GA15815@lst.de> <20201119082505.GS1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119082505.GS1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 19, 2020 at 09:25:05AM +0100, Jan Kara wrote:
> OK, understood. Still it would seem more logical to leave blk_lookup_devt()
> declaration inside #ifdef CONFIG_BLOCK and just delete the !CONFIG_BLOCK
> definition (to make it clear we ever expect only users compiled when
> CONFIG_BLOCK is defined). But whatever... Feel free to add:

Not having the ifdef would allow using IS_ENABLED() around it.  Which
is what I did in one of the earlier variants before settlings on this one.

