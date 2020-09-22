Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618652740F4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 13:35:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKgZx-0006gR-4V; Tue, 22 Sep 2020 11:35:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKgZv-0006gH-46
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 11:35:23 +0000
X-Inumbo-ID: b32717ac-3ae6-4681-95a6-2377ed82538f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b32717ac-3ae6-4681-95a6-2377ed82538f;
 Tue, 22 Sep 2020 11:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600774522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LEpVh9z5B/gjx7BbT67s1F5sJUZuubzPdeIHh8AvYIU=;
 b=bppjrfv7CyU3AxHqw6qskzEWcEuwSSf7/FdprQTtY6x95A1jPPjeZBA6
 xdwC4Px8IzCcOTFdH5jFvEWJyGvEUOsvFIOYpPZWGB7thN6TISGuout/N
 MIgaf10VUOi8h7gBtOggxPNDDRYPp8AM5bwxbB8KfPwujsU7xzok91LIN I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GCLSnh8hOs3Ru+ShdXfoPjUH80O9R5XsE/lEZntN3FnkZr1g9JCKxXw2X94MqBmGI2JLO0taMh
 n1Y9VkXYPeXaxZyiZf5xKe/CD00oCtgBkkCLw3vMI9mQftR/SHpgiVGhgga/BlrF83lH/CJfUQ
 rH+ZG5UBlRB969GjJ3qt+gG8R1YpiVSEdg+79iuJ/+UOShlUtWU7eyPFrfzW8wtVVjhbENCt7F
 enBthT9jDzyXT64pUHO+Q0v9P+/9hPrG0BdDZDtsLyscMGnpVv6CQ3AoUcAgh1P7Uxe1mac4Ro
 ztc=
X-SBRS: 2.7
X-MesageID: 27578698
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,290,1596513600"; d="scan'208";a="27578698"
Date: Tue, 22 Sep 2020 13:35:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: SeongJae Park <sjpark@amazon.com>
CC: <konrad.wilk@oracle.com>, <jgross@suse.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <pdurrant@amazon.co.uk>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] xen-blkback: add a parameter for disabling of
 persistent grants
Message-ID: <20200922113511.GK19254@Air-de-Roger>
References: <20200922111259.GJ19254@Air-de-Roger>
 <20200922112638.14238-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200922112638.14238-1-sjpark@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 22, 2020 at 01:26:38PM +0200, SeongJae Park wrote:
> On Tue, 22 Sep 2020 13:12:59 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:
> 
> > On Tue, Sep 22, 2020 at 12:52:07PM +0200, SeongJae Park wrote:
> > > From: SeongJae Park <sjpark@amazon.de>
> > > 
> > > Persistent grants feature provides high scalability.  On some small
> > > systems, however, it could incur data copy overheads[1] and thus it is
> > > required to be disabled.  But, there is no option to disable it.  For
> > > the reason, this commit adds a module parameter for disabling of the
> > > feature.
> > > 
> > > [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> > > 
> > > Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> > > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> > > ---
> > >  .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++
> > >  drivers/block/xen-blkback/xenbus.c            | 28 ++++++++++++++-----
> > >  2 files changed, 30 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > > index ecb7942ff146..ac2947b98950 100644
> > > --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > > +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > > @@ -35,3 +35,12 @@ Description:
> > >                  controls the duration in milliseconds that blkback will not
> > >                  cache any page not backed by a grant mapping.
> > >                  The default is 10ms.
> > > +
> > > +What:           /sys/module/xen_blkback/parameters/feature_persistent
> > > +Date:           September 2020
> > > +KernelVersion:  5.10
> > > +Contact:        SeongJae Park <sjpark@amazon.de>
> > > +Description:
> > > +                Whether to enable the persistent grants feature or not.  Note
> > > +                that this option only takes effect on newly created backends.
> > > +                The default is Y (enable).
> > > diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> > > index b9aa5d1ac10b..8a95ddd08b13 100644
> > > --- a/drivers/block/xen-blkback/xenbus.c
> > > +++ b/drivers/block/xen-blkback/xenbus.c
> > > @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
> > >  
> > >  /* ** Connection ** */
> > >  
> > > +/* Enable the persistent grants feature. */
> > > +static bool feature_persistent = true;
> > > +module_param(feature_persistent, bool, 0644);
> > > +MODULE_PARM_DESC(feature_persistent,
> > > +		"Enables the persistent grants feature");
> > > +
> > >  /*
> > >   * Write the physical details regarding the block device to the store, and
> > >   * switch to Connected state.
> > > @@ -906,11 +912,15 @@ static void connect(struct backend_info *be)
> > >  
> > >  	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
> > >  
> > > -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> > > -	if (err) {
> > > -		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
> > > -				 dev->nodename);
> > > -		goto abort;
> > > +	if (feature_persistent) {
> > > +		err = xenbus_printf(xbt, dev->nodename, "feature-persistent",
> > > +				"%u", feature_persistent);
> > > +		if (err) {
> > > +			xenbus_dev_fatal(dev, err,
> > > +					"writing %s/feature-persistent",
> > > +					dev->nodename);
> > > +			goto abort;
> > > +		}
> > >  	}
> > >  
> > >  	err = xenbus_printf(xbt, dev->nodename, "sectors", "%llu",
> > > @@ -1093,8 +1103,12 @@ static int connect_ring(struct backend_info *be)
> > >  		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
> > >  		return -ENOSYS;
> > >  	}
> > > -	pers_grants = xenbus_read_unsigned(dev->otherend, "feature-persistent",
> > > -					   0);
> > > +	if (feature_persistent)
> > > +		pers_grants = xenbus_read_unsigned(dev->otherend,
> > > +				"feature-persistent", 0);
> > > +	else
> > > +		pers_grants = 0;
> > > +
> > 
> > Sorry for not realizing earlier, but looking at it again I think you
> > need to cache the value of feature_persistent when it's first used in
> > the blkback state data, so that it's consistent.
> > 
> > What would happen for example with the following flow (assume a
> > persistent grants enabled frontend):
> > 
> > feature_persistent = false
> > 
> > connect(...)
> > feature-persistent is not written to xenstore
> > 
> > User changes feature_persistent = true
> > 
> > connect_ring(...)
> > pers_grants = true, because feature-persistent is set unconditionally
> > by the frontend and feature_persistent variable is now true.
> > 
> > Then blkback will try to use persistent grants and the whole
> > connection will malfunction because the frontend won't.
> 
> Ah, you're right.  I should also catch this before but didn't, sorry.
> 
> > 
> > The other option is to prevent changing the variable when there are
> > blkback instances already running.
> 
> I think storing the option value in xenstore would be simpler.  That said, if
> you prefer this way, please let me know.

If possible I prefer to avoid reading from xenstore because it's slow,
very slow compared to storing this somewhere in the blkback
structure.

Could you use the feature_gnt_persistent field in xen_vbd maybe as a
place to cache the value before it's set with the final negotiated
value between the frontend and the backend?

Thanks, Roger.

