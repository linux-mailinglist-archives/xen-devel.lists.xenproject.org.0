Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF526AE54
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 22:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIH96-00052k-SQ; Tue, 15 Sep 2020 20:01:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LDf=CY=amazon.com=prvs=520f2d048=anchalag@srs-us1.protection.inumbo.net>)
 id 1kIH95-00052e-MR
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 20:01:43 +0000
X-Inumbo-ID: 4fe6e750-2557-4bd4-9471-53ceed003270
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fe6e750-2557-4bd4-9471-53ceed003270;
 Tue, 15 Sep 2020 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600200102; x=1631736102;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=wNziNNDxrF6gCaxX+ImX9p6CNqpNyiGV3hOiiuWa1DA=;
 b=cT7rmc2HZ/MKV9Gy3JSjzfS5rDll+DJ21PmrK3Ex3bLTGsHvp7s/E6Dr
 92KGV+gTDBOOFQ0qsv73S+3Rwh42RWgiyrSMc9mupQlDiAmr0mGFSMt5W
 o4ET5NOm22R/T+6tkS40+01lqGR2wUmrdGTi4mnPlUSaPYKQpJpm5QAuI 4=;
X-IronPort-AV: E=Sophos;i="5.76,430,1592870400"; d="scan'208";a="75198936"
Subject: Re: [PATCH v3 02/11] xenbus: add freeze/thaw/restore callbacks support
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 15 Sep 2020 19:57:00 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8A814A21BE; Tue, 15 Sep 2020 19:56:58 +0000 (UTC)
Received: from EX13D05UWC004.ant.amazon.com (10.43.162.223) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Sep 2020 19:56:43 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC004.ant.amazon.com (10.43.162.223) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 15 Sep 2020 19:56:43 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 15 Sep 2020 19:56:43 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 5B464408BF; Tue, 15 Sep 2020 19:56:43 +0000 (UTC)
Date: Tue, 15 Sep 2020 19:56:43 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <boris.ostrovsky@oracle.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <jgross@suse.com>, <linux-pm@vger.kernel.org>,
 <linux-mm@kvack.org>, <kamatam@amazon.com>, <sstabellini@kernel.org>,
 <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <axboe@kernel.dk>,
 <davem@davemloft.net>, <rjw@rjwysocki.net>, <len.brown@intel.com>,
 <pavel@ucw.cz>, <peterz@infradead.org>, <eduval@amazon.com>,
 <sblbir@amazon.com>, <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>, 
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <benh@kernel.crashing.org>
Message-ID: <20200915195643.GA28542@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1598042152.git.anchalag@amazon.com>
 <2d3a7ed32bf38e13e0141a631a453b6e4c7ba5dc.1598042152.git.anchalag@amazon.com>
 <eebc26b8-f1b1-3bea-5366-dd77f063237e@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eebc26b8-f1b1-3bea-5366-dd77f063237e@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Sun, Sep 13, 2020 at 12:11:47PM -0400, boris.ostrovsky@oracle.com wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 8/21/20 6:26 PM, Anchal Agarwal wrote:
> > From: Munehisa Kamata <kamatam@amazon.com>
> >
> > Since commit b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for
> > suspend/resume/chkpt"), xenbus uses PMSG_FREEZE, PMSG_THAW and
> > PMSG_RESTORE events for Xen suspend. However, they're actually assigned
> > to xenbus_dev_suspend(), xenbus_dev_cancel() and xenbus_dev_resume()
> > respectively, and only suspend and resume callbacks are supported at
> > driver level. To support PM suspend and PM hibernation, modify the bus
> > level PM callbacks to invoke not only device driver's suspend/resume but
> > also freeze/thaw/restore.
> >
> > Note that we'll use freeze/restore callbacks even for PM suspend whereas
> > suspend/resume callbacks are normally used in the case, becausae the
> > existing xenbus device drivers already have suspend/resume callbacks
> > specifically designed for Xen suspend.
> 
> 
> Something is wrong with this sentence. Or with my brain --- I can't
> quite parse this.
> 
The message is trying to say that that freeze/thaw/restore callbacks will be
used for both PM SUSPEND and PM HIBERNATION. Since, we are only focussing on PM
hibernation, I will remove all wordings of PM suspend from this message to avoid
confusion. I left it there in case someone wants to pick it up in future knowing
framework is already present.
> 
> And please be consistent with "PM suspend" vs. "PM hibernation".
>
I should remove PM suspend from everywhere since the mode is not tested
for.
> 
> >  So we can allow the device
> > drivers to keep the existing callbacks wihtout modification.
> >
> 
> 
> > @@ -599,16 +600,33 @@ int xenbus_dev_suspend(struct device *dev)
> >       struct xenbus_driver *drv;
> >       struct xenbus_device *xdev
> >               = container_of(dev, struct xenbus_device, dev);
> > +     bool xen_suspend = is_xen_suspend();
> >
> >       DPRINTK("%s", xdev->nodename);
> >
> >       if (dev->driver == NULL)
> >               return 0;
> >       drv = to_xenbus_driver(dev->driver);
> > -     if (drv->suspend)
> > -             err = drv->suspend(xdev);
> > -     if (err)
> > -             dev_warn(dev, "suspend failed: %i\n", err);
> > +     if (xen_suspend) {
> > +             if (drv->suspend)
> > +                     err = drv->suspend(xdev);
> > +     } else {
> > +             if (drv->freeze) {
> 
> 
> 'else if' (to avoid extra indent level).  In xenbus_dev_resume() too.
> 
> 
> > +                     err = drv->freeze(xdev);
> > +                     if (!err) {
> > +                             free_otherend_watch(xdev);
> > +                             free_otherend_details(xdev);
> > +                             return 0;
> > +                     }
> > +             }
> > +     }
> > +
> > +     if (err) {
> > +             dev_warn(&xdev->dev,
> 
> 
> Is there a reason why you replaced dev with xdev->dev (here and elsewhere)?
> 
> 
Nope, they should be same. We can use dev here too. I should probably just use
dev.
> >  "%s %s failed: %d\n", xen_suspend ?
> > +                             "suspend" : "freeze", xdev->nodename, err);
> > +             return err;
> > +     }
> > +
> >
> 
> > @@ -653,8 +683,44 @@ EXPORT_SYMBOL_GPL(xenbus_dev_resume);
> >
> >  int xenbus_dev_cancel(struct device *dev)
> >  {
> > -     /* Do nothing */
> > -     DPRINTK("cancel");
> > +     int err;
> > +     struct xenbus_driver *drv;
> > +     struct xenbus_device *xendev = to_xenbus_device(dev);
> 
> 
> xdev for consistency please.
> 
Yes this I left unchanged, it should be consistent with xdev.
> 
> > +     bool xen_suspend = is_xen_suspend();
> 
> 
> No need for this, you use it only once anyway.
> 
> 
> -boris
>
Thanks,
Anchal
> 

