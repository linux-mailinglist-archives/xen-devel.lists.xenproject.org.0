Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777F274453
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjKs-0006Pp-8n; Tue, 22 Sep 2020 14:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKjKq-0006PZ-SY
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:32:00 +0000
X-Inumbo-ID: 234ca1ee-6435-4fb7-a935-54a6e0381aae
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 234ca1ee-6435-4fb7-a935-54a6e0381aae;
 Tue, 22 Sep 2020 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600785120; x=1632321120;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=noIQ/EB2UQYZv4x5hTS9cjTceBsCt2CTaoR0u2DKqiY=;
 b=XlK9+DhYwJElGQ2wkhwkzrxnKFsv/eqAfV8ni7+voKBMEO9ibTGRm/bL
 FeykGi8g/9Fuf6s3+mWKkMfwn8QRBmlPCeyPWTcHpat/eV7O+W5ltqINf
 5au1rJe9g1nfl43gBLmQThHUGvN4sAmuPNH9GgJP+R2Suw0cX25DhNdIw g=;
X-IronPort-AV: E=Sophos;i="5.77,291,1596499200"; d="scan'208";a="77050146"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 22 Sep 2020 14:31:45 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8E204A4527; Tue, 22 Sep 2020 14:31:40 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.85) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 14:31:34 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.com>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>, SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] xen-blkfront: add a parameter for disabling of
 persistent grants
Date: Tue, 22 Sep 2020 16:31:17 +0200
Message-ID: <20200922143117.30167-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <28773bff-7664-99fa-a542-b87e907bf705@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.85]
X-ClientProxiedBy: EX13D01UWA001.ant.amazon.com (10.43.160.60) To
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

On Tue, 22 Sep 2020 16:27:03 +0200 "Jürgen Groß" <jgross@suse.com> wrote:

> On 22.09.20 16:15, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > 
> > Persistent grants feature provides high scalability.  On some small
> > systems, however, it could incur data copy overheads[1] and thus it is
> > required to be disabled.  It can be disabled from blkback side using a
> > module parameter, 'feature_persistent'.  But, it is impossible from
> > blkfront side.  For the reason, this commit adds a blkfront module
> > parameter for disabling of the feature.
> > 
> > [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> > 
> > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> > ---
> >   .../ABI/testing/sysfs-driver-xen-blkfront     |  9 +++++++++
> >   drivers/block/xen-blkfront.c                  | 20 ++++++++++++++-----
> >   2 files changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkfront b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
> > index c0a6cb7eb314..9c31334cb2e6 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-xen-blkfront
> > +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
> > @@ -8,3 +8,12 @@ Description:
> >                   is 32 - higher value means more potential throughput but more
> >                   memory usage. The backend picks the minimum of the frontend
> >                   and its default backend value.
> > +
> > +What:           /sys/module/xen_blkfront/parameters/feature_persistent
> > +Date:           September 2020
> > +KernelVersion:  5.10
> > +Contact:        SeongJae Park <sjpark@amazon.de>
> > +Description:
> > +                Whether to enable the persistent grants feature or not.  Note
> > +                that this option only takes effect on newly created frontends.
> > +                The default is Y (enable).
> > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > index 91de2e0755ae..b2d3b1262404 100644
> > --- a/drivers/block/xen-blkfront.c
> > +++ b/drivers/block/xen-blkfront.c
> > @@ -1866,8 +1866,8 @@ static int talk_to_blkback(struct xenbus_device *dev,
> >   		message = "writing protocol";
> >   		goto abort_transaction;
> >   	}
> > -	err = xenbus_printf(xbt, dev->nodename,
> > -			    "feature-persistent", "%u", 1);
> > +	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> > +			info->feature_persistent);
> >   	if (err)
> >   		dev_warn(&dev->dev,
> >   			 "writing persistent grants feature to xenbus");
> > @@ -1941,6 +1941,13 @@ static int negotiate_mq(struct blkfront_info *info)
> >   	}
> >   	return 0;
> >   }
> > +
> > +/* Enable the persistent grants feature. */
> > +static bool feature_persistent = true;
> > +module_param(feature_persistent, bool, 0644);
> > +MODULE_PARM_DESC(feature_persistent,
> > +		"Enables the persistent grants feature");
> > +
> >   /**
> >    * Entry point to this code when a new device is created.  Allocate the basic
> >    * structures and the ring buffer for communication with the backend, and
> > @@ -2007,6 +2014,8 @@ static int blkfront_probe(struct xenbus_device *dev,
> >   	info->vdevice = vdevice;
> >   	info->connected = BLKIF_STATE_DISCONNECTED;
> >   
> > +	info->feature_persistent = feature_persistent ? 1 : 0;
> 
> Just use the value.

Yes, I will.

> 
> With that changed:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Appreciate :)


Thanks,
SeongJae Park

