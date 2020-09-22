Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6CC273BBF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKcfh-000789-T6; Tue, 22 Sep 2020 07:25:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKcfg-000782-PW
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:25:04 +0000
X-Inumbo-ID: 19c38402-14ae-46b6-b603-7b8989292355
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19c38402-14ae-46b6-b603-7b8989292355;
 Tue, 22 Sep 2020 07:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600759504; x=1632295504;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=0+bAyvjF/IRHs0wEyMipvSEvEkOVBr0aJg9baDfrY4k=;
 b=jGUpqqTKtxFgGotfnibU4EvwKhAZYP2vcS+uUxd+pK1FzVK2qU9e5n9b
 2D/la0F/d8vroVo2NyEK/q3nZhnsFQsqOLZfSEr5vXtr7lWP35Q58SkQ1
 kKhuoXPYk44+895tnWrURbZceISGM7tfkKb2sUplD9s/suee7LCAAotGS Q=;
X-IronPort-AV: E=Sophos;i="5.77,289,1596499200"; d="scan'208";a="70012700"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Sep 2020 07:25:02 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1D0C8A0829; Tue, 22 Sep 2020 07:25:01 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.185) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 07:24:54 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.com>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>, SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Date: Tue, 22 Sep 2020 09:24:37 +0200
Message-ID: <20200922072437.2495-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <5fd34475-c296-c4f3-2bac-180c166449fe@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.185]
X-ClientProxiedBy: EX13D39UWA004.ant.amazon.com (10.43.160.73) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 22 Sep 2020 09:18:05 +0200 "Jürgen Groß" <jgross@suse.com> wrote:

> On 22.09.20 09:01, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > 
> > Persistent grants feature provides high scalability.  On some small
> > systems, however, it could incur data copy overhead[1] and thus it is
> > required to be disabled.  But, there is no option to disable it.  For
> > the reason, this commit adds a module parameter for disabling of the
> > feature.
> > 
> > [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> > 
> > Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> > ---
> >   .../ABI/testing/sysfs-driver-xen-blkback        |  8 ++++++++
> >   drivers/block/xen-blkback/xenbus.c              | 17 ++++++++++++++---
> >   2 files changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > index ecb7942ff146..0c42285c75ee 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > @@ -35,3 +35,11 @@ Description:
> >                   controls the duration in milliseconds that blkback will not
> >                   cache any page not backed by a grant mapping.
> >                   The default is 10ms.
> > +
> > +What:           /sys/module/xen_blkback/parameters/feature_persistent
> > +Date:           September 2020
> > +KernelVersion:  5.10
> > +Contact:        SeongJae Park <sjpark@amazon.de>
> > +Description:
> > +                Whether to enable the persistent grants feature or not.
> > +                The default is 1 (enable).
> > diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> > index b9aa5d1ac10b..9c03d70469f4 100644
> > --- a/drivers/block/xen-blkback/xenbus.c
> > +++ b/drivers/block/xen-blkback/xenbus.c
> > @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
> >   
> >   /* ** Connection ** */
> >   
> > +/* Enable the persistent grants feature. */
> > +static unsigned int feature_persistent = 1;
> 
> Use bool, please.

Oops, I will.

> 
> > +module_param_named(feature_persistent, feature_persistent, int, 0644);
> 
> module_param()
> 
> > +MODULE_PARM_DESC(feature_persistent,
> > +		"Enables the persistent grants feature");
> > +
> >   /*
> >    * Write the physical details regarding the block device to the store, and
> >    * switch to Connected state.
> > @@ -906,7 +912,8 @@ static void connect(struct backend_info *be)
> >   
> >   	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
> >   
> > -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> > +	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> > +			feature_persistent ? 1 : 0);
> 
> Using bool above should allow to just use the value of
> feature_persistent here.

Indeed.  I will fix these as you recommended in the next spin.


Thanks,
SeongJae Park

