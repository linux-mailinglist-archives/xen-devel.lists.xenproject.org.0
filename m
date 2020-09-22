Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510592741CB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 14:08:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKh6E-0001R3-QS; Tue, 22 Sep 2020 12:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKh6D-0001Qu-9r
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 12:08:45 +0000
X-Inumbo-ID: c04a6772-0197-4864-ad5d-46d416f783ce
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c04a6772-0197-4864-ad5d-46d416f783ce;
 Tue, 22 Sep 2020 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600776524; x=1632312524;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=Iu17TnezrR9cCfm/mX2pd36Twy2NLDZBTF2SbIDH3UQ=;
 b=CXKxGxyZTYCTm4WIambZmZP50xwAdBYJjY00gOwelHXkA/MSGkzG4ELL
 Oyk4p4kIe+82c8JMID3z6/25CBr8tznq3qLdG1BzM0tqbB0eVG97umGnA
 hVsy9WQvaLc2kdobhEWYgATiD0GT/a2636KDrDZj4GzgEbSoT6Qzf6CD7 g=;
X-IronPort-AV: E=Sophos;i="5.77,290,1596499200"; d="scan'208";a="70077461"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Sep 2020 12:08:43 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 216E3A227B; Tue, 22 Sep 2020 12:08:43 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.43) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 12:08:36 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <konrad.wilk@oracle.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <pdurrant@amazon.co.uk>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] xen-blkback: add a parameter for disabling of
 persistent grants
Date: Tue, 22 Sep 2020 14:08:20 +0200
Message-ID: <20200922120820.24978-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <33a8d880-d8ce-0cf7-d115-ca6938889f27@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.43]
X-ClientProxiedBy: EX13D50UWC002.ant.amazon.com (10.43.162.189) To
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

On Tue, 22 Sep 2020 13:35:30 +0200 "Jürgen Groß" <jgross@suse.com> wrote:

> On 22.09.20 13:26, SeongJae Park wrote:
> > On Tue, 22 Sep 2020 13:12:59 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:
> > 
> >> On Tue, Sep 22, 2020 at 12:52:07PM +0200, SeongJae Park wrote:
> >>> From: SeongJae Park <sjpark@amazon.de>
> >>>
> >>> Persistent grants feature provides high scalability.  On some small
> >>> systems, however, it could incur data copy overheads[1] and thus it is
> >>> required to be disabled.  But, there is no option to disable it.  For
> >>> the reason, this commit adds a module parameter for disabling of the
> >>> feature.
> >>>
> >>> [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> >>>
> >>> Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> >>> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> >>> ---
> >>>   .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++
> >>>   drivers/block/xen-blkback/xenbus.c            | 28 ++++++++++++++-----
> >>>   2 files changed, 30 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> >>> index ecb7942ff146..ac2947b98950 100644
> >>> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> >>> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> >>> @@ -35,3 +35,12 @@ Description:
> >>>                   controls the duration in milliseconds that blkback will not
> >>>                   cache any page not backed by a grant mapping.
> >>>                   The default is 10ms.
> >>> +
> >>> +What:           /sys/module/xen_blkback/parameters/feature_persistent
> >>> +Date:           September 2020
> >>> +KernelVersion:  5.10
> >>> +Contact:        SeongJae Park <sjpark@amazon.de>
> >>> +Description:
> >>> +                Whether to enable the persistent grants feature or not.  Note
> >>> +                that this option only takes effect on newly created backends.
> >>> +                The default is Y (enable).
> >>> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> >>> index b9aa5d1ac10b..8a95ddd08b13 100644
> >>> --- a/drivers/block/xen-blkback/xenbus.c
> >>> +++ b/drivers/block/xen-blkback/xenbus.c
> >>> @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
> >>>   
> >>>   /* ** Connection ** */
> >>>   
> >>> +/* Enable the persistent grants feature. */
> >>> +static bool feature_persistent = true;
> >>> +module_param(feature_persistent, bool, 0644);
> >>> +MODULE_PARM_DESC(feature_persistent,
> >>> +		"Enables the persistent grants feature");
> >>> +
> >>>   /*
> >>>    * Write the physical details regarding the block device to the store, and
> >>>    * switch to Connected state.
> >>> @@ -906,11 +912,15 @@ static void connect(struct backend_info *be)
> >>>   
> >>>   	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
> >>>   
> >>> -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> >>> -	if (err) {
> >>> -		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
> >>> -				 dev->nodename);
> >>> -		goto abort;
> >>> +	if (feature_persistent) {
> >>> +		err = xenbus_printf(xbt, dev->nodename, "feature-persistent",
> >>> +				"%u", feature_persistent);
> >>> +		if (err) {
> >>> +			xenbus_dev_fatal(dev, err,
> >>> +					"writing %s/feature-persistent",
> >>> +					dev->nodename);
> >>> +			goto abort;
> >>> +		}
> >>>   	}
> >>>   
> >>>   	err = xenbus_printf(xbt, dev->nodename, "sectors", "%llu",
> >>> @@ -1093,8 +1103,12 @@ static int connect_ring(struct backend_info *be)
> >>>   		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
> >>>   		return -ENOSYS;
> >>>   	}
> >>> -	pers_grants = xenbus_read_unsigned(dev->otherend, "feature-persistent",
> >>> -					   0);
> >>> +	if (feature_persistent)
> >>> +		pers_grants = xenbus_read_unsigned(dev->otherend,
> >>> +				"feature-persistent", 0);
> >>> +	else
> >>> +		pers_grants = 0;
> >>> +
> >>
> >> Sorry for not realizing earlier, but looking at it again I think you
> >> need to cache the value of feature_persistent when it's first used in
> >> the blkback state data, so that it's consistent.
> >>
> >> What would happen for example with the following flow (assume a
> >> persistent grants enabled frontend):
> >>
> >> feature_persistent = false
> >>
> >> connect(...)
> >> feature-persistent is not written to xenstore
> >>
> >> User changes feature_persistent = true
> >>
> >> connect_ring(...)
> >> pers_grants = true, because feature-persistent is set unconditionally
> >> by the frontend and feature_persistent variable is now true.
> >>
> >> Then blkback will try to use persistent grants and the whole
> >> connection will malfunction because the frontend won't.
> > 
> > Ah, you're right.  I should also catch this before but didn't, sorry.
> > 
> >>
> >> The other option is to prevent changing the variable when there are
> >> blkback instances already running.
> > 
> > I think storing the option value in xenstore would be simpler.  That said, if
> > you prefer this way, please let me know.
> 
> No, Xenstore isn't the right place for that. This is a local
> implementation detail of blkback and shouldn't be exported to Xenstore.

Agreed.  I will try using the 'feature_gnt_persistent' as Roger recommended.


Thanks,
SeongJae Park

