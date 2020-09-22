Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA38A27444B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:30:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjJZ-0006HX-M7; Tue, 22 Sep 2020 14:30:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKjJX-0006HP-FZ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:30:39 +0000
X-Inumbo-ID: d32f8d46-ffe0-4ed8-81bf-9f4e852bebe5
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d32f8d46-ffe0-4ed8-81bf-9f4e852bebe5;
 Tue, 22 Sep 2020 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600785039; x=1632321039;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=4aZ5guAB6zDWL7GVzE7FWIQhgaqJUvm3Noy9tgb7BRw=;
 b=Zg4mvbNL5yjlEjgqq1dCyykHcfNqQZTcCadByUtXEtYspf0KolSUER++
 i4PYi6xt2Ap+CYXoGsV3N9p1ByHIe1n2dR0esa/PIoXtcG7sFPtSYWl7r
 0y1Vx5bF8ZdNh4YKqjjpLm6GSd48AhdH8JTpJXmM6P5IGVLpyMDhR4HRd 0=;
X-IronPort-AV: E=Sophos;i="5.77,291,1596499200"; d="scan'208";a="78276251"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Sep 2020 14:30:35 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 400A9A24DA; Tue, 22 Sep 2020 14:30:33 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.71) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 14:30:27 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.com>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>, SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] xen-blkback: add a parameter for disabling of
 persistent grants
Date: Tue, 22 Sep 2020 16:30:11 +0200
Message-ID: <20200922143011.29568-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <5d0f75f1-636e-e485-c616-bca47bd6932f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.161.71]
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

On Tue, 22 Sep 2020 16:25:57 +0200 "Jürgen Groß" <jgross@suse.com> wrote:

> On 22.09.20 16:15, SeongJae Park wrote:
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
> >   .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++++
> >   drivers/block/xen-blkback/xenbus.c            | 22 ++++++++++++++-----
> >   2 files changed, 25 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > index ecb7942ff146..ac2947b98950 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> > @@ -35,3 +35,12 @@ Description:
> >                   controls the duration in milliseconds that blkback will not
> >                   cache any page not backed by a grant mapping.
> >                   The default is 10ms.
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
> > index b9aa5d1ac10b..f4c8827fa0ad 100644
> > --- a/drivers/block/xen-blkback/xenbus.c
> > +++ b/drivers/block/xen-blkback/xenbus.c
> > @@ -474,6 +474,12 @@ static void xen_vbd_free(struct xen_vbd *vbd)
> >   	vbd->bdev = NULL;
> >   }
> >   
> > +/* Enable the persistent grants feature. */
> > +static bool feature_persistent = true;
> > +module_param(feature_persistent, bool, 0644);
> > +MODULE_PARM_DESC(feature_persistent,
> > +		"Enables the persistent grants feature");
> > +
> >   static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
> >   			  unsigned major, unsigned minor, int readonly,
> >   			  int cdrom)
> > @@ -519,6 +525,8 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
> >   	if (q && blk_queue_secure_erase(q))
> >   		vbd->discard_secure = true;
> >   
> > +	vbd->feature_gnt_persistent = feature_persistent ? 1 : 0;
> 
> Just assign the value instead of using the ternary operator?

I will do so in the next version.

> 
> With that changed you can add my
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thank you for your kind, quick, and detailed review!


Thanks,
SeongJae Park

