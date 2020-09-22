Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D72740C8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 13:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKgRv-0005o5-8a; Tue, 22 Sep 2020 11:27:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKgRu-0005o0-4v
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 11:27:06 +0000
X-Inumbo-ID: b2d279a4-c3cd-4abf-8981-ab91896be91d
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2d279a4-c3cd-4abf-8981-ab91896be91d;
 Tue, 22 Sep 2020 11:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600774025; x=1632310025;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=g3JRr23a6mY+Y62r/GZOjEp5HQn72fVEKBXRryfrcNw=;
 b=vdJ60tHHiy6FiMbhGvaBN6RfFxljnik5p68JNSbL3kKq0E9sRwMuahmb
 D0tY/eiT4HIqCGFbJgVy9NybIPI6xonM6y07ahQEMs2LRzOZXeQJbnsXh
 hulA2ipS+4OiG7m1ZpZh3qON2Laru6dJaJT3yZZIDGAg1krs9mqfLJTVe E=;
X-IronPort-AV: E=Sophos;i="5.77,290,1596499200"; d="scan'208";a="56930374"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 22 Sep 2020 11:27:05 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id C017BA20B0; Tue, 22 Sep 2020 11:27:02 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.244) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 11:26:55 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
CC: SeongJae Park <sjpark@amazon.com>, <konrad.wilk@oracle.com>,
 <jgross@suse.com>, SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] xen-blkback: add a parameter for disabling of
 persistent grants
Date: Tue, 22 Sep 2020 13:26:38 +0200
Message-ID: <20200922112638.14238-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20200922111259.GJ19254@Air-de-Roger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.160.244]
X-ClientProxiedBy: EX13D17UWC001.ant.amazon.com (10.43.162.188) To
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

On Tue, 22 Sep 2020 13:12:59 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:

> On Tue, Sep 22, 2020 at 12:52:07PM +0200, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > 
> > Persistent grants feature provides high scalability.  On some small
> > systems, however, it could incur data copy overheads[1] and thus it is
> > required to be disabled.  But, there is no option to disable it.  For
> > the reason, this commit adds a module parameter for disabling of the
> > feature.
> > 
> > [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> > 
> > Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> > ---
> >  .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++
> >  drivers/block/xen-blkback/xenbus.c            | 28 ++++++++++++++-----
> >  2 files changed, 30 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > index ecb7942ff146..ac2947b98950 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > @@ -35,3 +35,12 @@ Description:
> >                  controls the duration in milliseconds that blkback will not
> >                  cache any page not backed by a grant mapping.
> >                  The default is 10ms.
> > +
> > +What:           /sys/module/xen_blkback/parameters/feature_persistent
> > +Date:           September 2020
> > +KernelVersion:  5.10
> > +Contact:        SeongJae Park <sjpark@amazon.de>
> > +Description:
> > +                Whether to enable the persistent grants feature or not.  Note
> > +                that this option only takes effect on newly created backends.
> > +                The default is Y (enable).
> > diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> > index b9aa5d1ac10b..8a95ddd08b13 100644
> > --- a/drivers/block/xen-blkback/xenbus.c
> > +++ b/drivers/block/xen-blkback/xenbus.c
> > @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
> >  
> >  /* ** Connection ** */
> >  
> > +/* Enable the persistent grants feature. */
> > +static bool feature_persistent = true;
> > +module_param(feature_persistent, bool, 0644);
> > +MODULE_PARM_DESC(feature_persistent,
> > +		"Enables the persistent grants feature");
> > +
> >  /*
> >   * Write the physical details regarding the block device to the store, and
> >   * switch to Connected state.
> > @@ -906,11 +912,15 @@ static void connect(struct backend_info *be)
> >  
> >  	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
> >  
> > -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> > -	if (err) {
> > -		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
> > -				 dev->nodename);
> > -		goto abort;
> > +	if (feature_persistent) {
> > +		err = xenbus_printf(xbt, dev->nodename, "feature-persistent",
> > +				"%u", feature_persistent);
> > +		if (err) {
> > +			xenbus_dev_fatal(dev, err,
> > +					"writing %s/feature-persistent",
> > +					dev->nodename);
> > +			goto abort;
> > +		}
> >  	}
> >  
> >  	err = xenbus_printf(xbt, dev->nodename, "sectors", "%llu",
> > @@ -1093,8 +1103,12 @@ static int connect_ring(struct backend_info *be)
> >  		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
> >  		return -ENOSYS;
> >  	}
> > -	pers_grants = xenbus_read_unsigned(dev->otherend, "feature-persistent",
> > -					   0);
> > +	if (feature_persistent)
> > +		pers_grants = xenbus_read_unsigned(dev->otherend,
> > +				"feature-persistent", 0);
> > +	else
> > +		pers_grants = 0;
> > +
> 
> Sorry for not realizing earlier, but looking at it again I think you
> need to cache the value of feature_persistent when it's first used in
> the blkback state data, so that it's consistent.
> 
> What would happen for example with the following flow (assume a
> persistent grants enabled frontend):
> 
> feature_persistent = false
> 
> connect(...)
> feature-persistent is not written to xenstore
> 
> User changes feature_persistent = true
> 
> connect_ring(...)
> pers_grants = true, because feature-persistent is set unconditionally
> by the frontend and feature_persistent variable is now true.
> 
> Then blkback will try to use persistent grants and the whole
> connection will malfunction because the frontend won't.

Ah, you're right.  I should also catch this before but didn't, sorry.

> 
> The other option is to prevent changing the variable when there are
> blkback instances already running.

I think storing the option value in xenstore would be simpler.  That said, if
you prefer this way, please let me know.


Thanks,
SeongJae Park

