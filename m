Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41504273CCB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:58:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKdBZ-0001ua-Ew; Tue, 22 Sep 2020 07:58:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKdBY-0001uV-80
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:58:00 +0000
X-Inumbo-ID: 98605fe2-e13d-4fed-af87-388701ce1de7
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98605fe2-e13d-4fed-af87-388701ce1de7;
 Tue, 22 Sep 2020 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600761479; x=1632297479;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=7q6qp4RZnrsNyoZoAdh8OrF1mLo5G8q76u+bCW+2zd8=;
 b=p2KCT3gHQEls6XjH3OYBeP3bvP+dmT+z9dax1z8EvzGxyqD9MwDYx/X6
 xNV9ZJDAFBS0z7Q+yk8D9F8KFlWBOuclrzvl3sqSdRSAZ3akyMPBc/JCw
 oQq62fieWkGDrKRmqGkPSKAnhKqpRGve4Cis/Q4IOBLfDciBJU3eWOKcr c=;
X-IronPort-AV: E=Sophos;i="5.77,289,1596499200"; d="scan'208";a="78173396"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Sep 2020 07:57:55 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id E9A50A0611; Tue, 22 Sep 2020 07:57:53 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.244) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 07:57:48 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
CC: SeongJae Park <sjpark@amazon.com>, <konrad.wilk@oracle.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Date: Tue, 22 Sep 2020 09:57:32 +0200
Message-ID: <20200922075732.23767-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20200922073202.GH19254@Air-de-Roger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.244]
X-ClientProxiedBy: EX13D44UWC003.ant.amazon.com (10.43.162.138) To
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

On Tue, 22 Sep 2020 09:32:02 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:

> On Tue, Sep 22, 2020 at 09:01:25AM +0200, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > 
> > Persistent grants feature provides high scalability.  On some small
> > systems, however, it could incur data copy overhead[1] and thus it is
> > required to be disabled.  But, there is no option to disable it.  For
> > the reason, this commit adds a module parameter for disabling of the
> > feature.
> 
> Have you considered adding a similar option for blkfront?

I will add yet another option for blkfront in the next spin.

> 
> > 
> > [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> > 
> > Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> > ---
> >  .../ABI/testing/sysfs-driver-xen-blkback        |  8 ++++++++
> >  drivers/block/xen-blkback/xenbus.c              | 17 ++++++++++++++---
> >  2 files changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > index ecb7942ff146..0c42285c75ee 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > @@ -35,3 +35,11 @@ Description:
> >                  controls the duration in milliseconds that blkback will not
> >                  cache any page not backed by a grant mapping.
> >                  The default is 10ms.
> > +
> > +What:           /sys/module/xen_blkback/parameters/feature_persistent
> > +Date:           September 2020
> > +KernelVersion:  5.10
> > +Contact:        SeongJae Park <sjpark@amazon.de>
> > +Description:
> > +                Whether to enable the persistent grants feature or not.
> > +                The default is 1 (enable).
> 
> I would add that this option only takes effect on newly created
> backends, existing backends when the option is set will continue to
> use persistent grants.
> 
> For already running backends you could drain the buffer of persistent
> grants and flip the option, but that's more complex and not required.

You're right, I will add the description.

> 
> > diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> > index b9aa5d1ac10b..9c03d70469f4 100644
> > --- a/drivers/block/xen-blkback/xenbus.c
> > +++ b/drivers/block/xen-blkback/xenbus.c
> > @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
> >  
> >  /* ** Connection ** */
> >  
> > +/* Enable the persistent grants feature. */
> > +static unsigned int feature_persistent = 1;
> > +module_param_named(feature_persistent, feature_persistent, int, 0644);
> > +MODULE_PARM_DESC(feature_persistent,
> > +		"Enables the persistent grants feature");
> > +
> >  /*
> >   * Write the physical details regarding the block device to the store, and
> >   * switch to Connected state.
> > @@ -906,7 +912,8 @@ static void connect(struct backend_info *be)
> >  
> >  	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
> >  
> > -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> > +	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> > +			feature_persistent ? 1 : 0);
> 
> You can avoid writing the feature altogether if it's not enabled,
> there's no need to set feature-persistent = 0.

Agreed.  I will do so in the next spin.


Thanks,
SeongJae Park

