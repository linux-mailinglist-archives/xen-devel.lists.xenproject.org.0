Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C575AACF6
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 13:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397525.638125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU4Pc-00083U-9a; Fri, 02 Sep 2022 11:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397525.638125; Fri, 02 Sep 2022 11:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU4Pc-000814-6u; Fri, 02 Sep 2022 11:00:36 +0000
Received: by outflank-mailman (input) for mailman id 397525;
 Fri, 02 Sep 2022 11:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dpb=ZF=amazon.de=prvs=2374d7a62=mheyne@srs-se1.protection.inumbo.net>)
 id 1oU4Pa-00080y-Nf
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 11:00:35 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75d12f11-2aae-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 13:00:33 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2b-22c2b493.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 11:00:13 +0000
Received: from EX13D05EUB003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2b-22c2b493.us-west-2.amazon.com (Postfix) with
 ESMTPS id 30D8345037; Fri,  2 Sep 2022 11:00:12 +0000 (UTC)
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Fri, 2 Sep 2022 11:00:10 +0000
Received: from dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (10.15.57.183)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id
 15.0.1497.38 via Frontend Transport; Fri, 2 Sep 2022 11:00:09 +0000
Received: by dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id D42F2275A; Fri,  2 Sep 2022 11:00:07 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 75d12f11-2aae-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1662116433; x=1693652433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+NMpbPFe8fp8R+B93WiLknkoUnpXkg4bwQ8Cau7P/jw=;
  b=dmHnsjSCMNb7N2BK/XvTgcpq2mH1kC5vG7s/f8RkP1Bw1AewLrTGCYwC
   uBltH/UhinHNVjvoGwdIFSXrjCbZ81xzzpUuL23HDnORLkUr28Cw0CPLf
   BSztLz4xVmsqOrACw5z93RxckqH9ScLmViGtmWLt/Moc5F/J8cOtcBwL7
   M=;
X-IronPort-AV: E=Sophos;i="5.93,283,1654560000"; 
   d="scan'208";a="222899704"
Date: Fri, 2 Sep 2022 11:00:07 +0000
From: Maximilian Heyne <mheyne@amazon.de>
To: SeongJae Park <sj@kernel.org>
CC: <jgross@suse.com>, <roger.pau@citrix.com>,
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>,
	<axboe@kernel.dk>, <ptyadav@amazon.de>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] xen-blk{front, back}: Fix the broken semantic and
 flow of feature-persistent
Message-ID: <20220902110007.GA100460@dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com>
References: <20220831165824.94815-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220831165824.94815-1-sj@kernel.org>
Precedence: Bulk

On Wed, Aug 31, 2022 at 04:58:21PM +0000, SeongJae Park wrote:
> Changes from v1
> (https://lore.kernel.org/xen-devel/20220825161511.94922-1-sj@kernel.org/)
> - Fix the wrong feature_persistent caching position of blkfront
> - Set blkfront's feature_persistent field setting with simple '&&'
>   instead of 'if' (Pratyush Yadav)
> 
> This patchset fixes misuse of the 'feature-persistent' advertisement
> semantic (patches 1 and 2), and the wrong timing of the
> 'feature_persistent' value caching, which made persistent grants feature
> always disabled.
> 
> SeongJae Park (3):
>   xen-blkback: Advertise feature-persistent as user requested
>   xen-blkfront: Advertise feature-persistent as user requested
>   xen-blkfront: Cache feature_persistent value before advertisement
> 
>  drivers/block/xen-blkback/common.h |  3 +++
>  drivers/block/xen-blkback/xenbus.c |  6 ++++--
>  drivers/block/xen-blkfront.c       | 20 ++++++++++++--------
>  3 files changed, 19 insertions(+), 10 deletions(-)
> 
> --
> 2.25.1
> 

I've tested this patch series in the following ways:
* Only applied the blkback patch but not the blkfront patches
* Only applied the blkfront patches but not the blkback patch
* Applied both

All scenarios worked, so

Tested-by: Maximilian Heyne <mheyne@amazon.de>

Actually I also wanted to test changing feature_persistent and try reconnecting
but I don't know how this is done. If anyone has a pointer here, I could test
that as well.



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




