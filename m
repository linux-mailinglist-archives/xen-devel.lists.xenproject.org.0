Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDECA201EB6
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jun 2020 01:44:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmQfO-0005Hj-MN; Fri, 19 Jun 2020 23:43:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sPVi=AA=amazon.com=prvs=4328a33c8=anchalag@srs-us1.protection.inumbo.net>)
 id 1jmQfN-0005Gz-RK
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 23:43:25 +0000
X-Inumbo-ID: aaf33764-b286-11ea-bc28-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaf33764-b286-11ea-bc28-12813bfff9fa;
 Fri, 19 Jun 2020 23:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1592610205; x=1624146205;
 h=date:from:to:cc:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to:subject;
 bh=SWB6zi6dk7H1UFvBjGxqa8Wz12tvOQnfaL06ZbePiho=;
 b=b/IjkLlvSKGQXcP1y4JWse3VifWK3OmRE60eon8K784R+TY7SxGIGTlt
 L5Y+0uc1TCnDsVxb5Ujfj2tiqLeiF+YkZ/fp6CJYYAZIR7kkBvz8CXS6t
 9G7/5bcceO+aG7Xb/taqJY2TRf34V4R/3fmwPRnSGqC6ZnQhwu9pZWnUC 8=;
IronPort-SDR: V0SG/zvLllpjNx79VHvm2vDaL3yuY6Sm12ogn2cv5SkcExVpFNIj0wUosu91G3vrCbL2gp8Rph
 pcBrxyqWaheg==
X-IronPort-AV: E=Sophos;i="5.75,256,1589241600"; d="scan'208";a="37314133"
Subject: Re: [PATCH 06/12] xen-blkfront: add callbacks for PM suspend and
 hibernation]
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 19 Jun 2020 23:43:22 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 46E48A1ECE; Fri, 19 Jun 2020 23:43:20 +0000 (UTC)
Received: from EX13D05UWB003.ant.amazon.com (10.43.161.26) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 19 Jun 2020 23:43:12 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05UWB003.ant.amazon.com (10.43.161.26) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 19 Jun 2020 23:43:11 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Fri, 19 Jun 2020 23:43:11 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 1C38F40384; Fri, 19 Jun 2020 23:43:12 +0000 (UTC)
Date: Fri, 19 Jun 2020 23:43:12 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200619234312.GA24846@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <7FD7505E-79AA-43F6-8D5F-7A2567F333AB@amazon.com>
 <20200604070548.GH1195@Air-de-Roger>
 <20200616214925.GA21684@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200617083528.GW735@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617083528.GW735@Air-de-Roger>
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
Cc: "Valentin, Eduardo" <eduval@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "bp@alien8.de" <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 10:35:28AM +0200, Roger Pau Monné wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On Tue, Jun 16, 2020 at 09:49:25PM +0000, Anchal Agarwal wrote:
> > On Thu, Jun 04, 2020 at 09:05:48AM +0200, Roger Pau Monné wrote:
> > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > On Wed, Jun 03, 2020 at 11:33:52PM +0000, Agarwal, Anchal wrote:
> > > >  CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > >     > +             xenbus_dev_error(dev, err, "Freezing timed out;"
> > > >     > +                              "the device may become inconsistent state");
> > > >
> > > >     Leaving the device in this state is quite bad, as it's in a closed
> > > >     state and with the queues frozen. You should make an attempt to
> > > >     restore things to a working state.
> > > >
> > > > You mean if backend closed after timeout? Is there a way to know that? I understand it's not good to
> > > > leave it in this state however, I am still trying to find if there is a good way to know if backend is still connected after timeout.
> > > > Hence the message " the device may become inconsistent state".  I didn't see a timeout not even once on my end so that's why
> > > > I may be looking for an alternate perspective here. may be need to thaw everything back intentionally is one thing I could think of.
> > >
> > > You can manually force this state, and then check that it will behave
> > > correctly. I would expect that on a failure to disconnect from the
> > > backend you should switch the frontend to the 'Init' state in order to
> > > try to reconnect to the backend when possible.
> > >
> > From what I understand forcing manually is, failing the freeze without
> > disconnect and try to revive the connection by unfreezing the
> > queues->reconnecting to backend [which never got diconnected]. May be even
> > tearing down things manually because I am not sure what state will frontend
> > see if backend fails to to disconnect at any point in time. I assumed connected.
> > Then again if its "CONNECTED" I may not need to tear down everything and start
> > from Initialising state because that may not work.
> >
> > So I am not so sure about backend's state so much, lets say if  xen_blkif_disconnect fail,
> > I don't see it getting handled in the backend then what will be backend's state?
> > Will it still switch xenbus state to 'Closed'? If not what will frontend see,
> > if it tries to read backend's state through xenbus_read_driver_state ?
> >
> > So the flow be like:
> > Front end marks XenbusStateClosing
> > Backend marks its state as XenbusStateClosing
> >     Frontend marks XenbusStateClosed
> >     Backend disconnects calls xen_blkif_disconnect
> >        Backend fails to disconnect, the above function returns EBUSY
> >        What will be state of backend here?
> 
> Backend should stay in state 'Closing' then, until it can finish
> tearing down.
> 
It disconnects the ring after switching to connected state too. 
> >        Frontend did not tear down the rings if backend does not switches the
> >        state to 'Closed' in case of failure.
> >
> > If backend stays in CONNECTED state, then even if we mark it Initialised in frontend, backend
> 
> Backend will stay in state 'Closing' I think.
> 
> > won't be calling connect(). {From reading code in frontend_changed}
> > IMU, Initialising will fail since backend dev->state != XenbusStateClosed plus
> > we did not tear down anything so calling talk_to_blkback may not be needed
> >
> > Does that sound correct?
> 
> I think switching to the initial state in order to try to attempt a
> reconnection would be our best bet here.
>
It does not seems to work correctly, I get hung tasks all over and all the
requests to filesystem gets stuck. Backend does shows the state as connected
after xenbus_dev_suspend fails but I think there may be something missing.
I don't seem to get IO interrupts thereafter i.e hitting the function blkif_interrupts.
I think just marking it initialised may not be the only thing.
Here is a short description of what I am trying to do:
So, on timeout:
    Switch XenBusState to "Initialized"
    unquiesce/unfreeze the queues and return
    mark info->connected = BLKIF_STATE_CONNECTED
    return EBUSY

I even allowed blkfront_connect to switch state to "CONNECTED" rather me doing
it explicitly as mentioned above without re-allocating/re-registering the device
just to make sure bklfront_info object has all the right values.
Do you see anythign missing here?

Also, while wrapping my brain around this recovery, one of the reasons I see
backend may not disconnct is if there are inflight I/O requests. There cannot be
pending I/O on shared ring because that check is already there before we switch
bus state to Closing. Also, queues are frozen so there will be no new I/O.
The only situation I can think of is since there too much of memory state to be
written and modified  that may not get completed within the timeout provided and
disconnect may fail. In that case, the time out needs to be configurable by the 
user since the hibernation may always fail depending on infrastructure or workload
running during hibernation.

Thanks,
Anchal

