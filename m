Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F350618F8C6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 16:38:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGP6p-0003Ts-87; Mon, 23 Mar 2020 15:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGP6n-0003Tn-KT
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 15:35:21 +0000
X-Inumbo-ID: e72dfc74-6d1b-11ea-92cf-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e72dfc74-6d1b-11ea-92cf-bc764e2007e4;
 Mon, 23 Mar 2020 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584977721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w+9gPMml/RKrC54jxcqHiMgN3brqeAAn3GQbF0d/rWg=;
 b=FBqaiRwoHafnajDEs2+gJUx1Xl0tyrU056ySqCdhLkeAg+ntiYioYrYu
 kvT62z20F+NNuX0eKRRbz9lYDYf4Zqc3+zkfOh6KhgUzJoTMEPl4QfAAN
 /GIXJSqG5gPC1oLih824tQKLUDXsIygsgrsAmf7jVZvIBIJJ+JGDfvji4 A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cgiuhZKgpzKidqcJht95ig5FrfmTpevm6lZHgKTzrlijSJCp6QmA+wmvRstxBjvgrva0oOpizQ
 /m+RzH8Nq+Jf6yvvzh/A8imuDzUQVWJagUcUG9sFpkGkXgOv+eKglNVpLSBrzABG3+gJLygd14
 /xATD993nxlPth0AmlVqJHfBEti8EWpyP41J1/pGSlMrLeCjefMmAcWw4DHKyYITJL8QIhKfYi
 thyvaj8FLqffHqrRPl61lzrNMWs1OBuCoBHRYTlNqzJI1kHuYOqnrPVIve2Sn+OviE7q7lNJwU
 yH0=
X-SBRS: 2.7
X-MesageID: 14476972
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14476972"
Date: Mon, 23 Mar 2020 16:35:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: create backend/ xenstore dir for driver domains
Message-ID: <20200323153512.GE24458@Air-de-Roger.citrite.net>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
 <24083.16958.769634.476071@mariner.uk.xensource.com>
 <20200106143836.GK1314@mail-itl>
 <24083.21734.512820.514082@mariner.uk.xensource.com>
 <20200106160340.GL1314@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200106160340.GL1314@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jan 06, 2020 at 05:03:40PM +0100, Marek Marczykowski-Górecki wrote:
> On Mon, Jan 06, 2020 at 03:40:22PM +0000, Ian Jackson wrote:
> > Adding Roger to the CC.
> > 
> > Marek Marczykowski-Górecki writes ("Re: [PATCH] libxl: create backend/ xenstore dir for driver domains"):
> > > On Mon, Jan 06, 2020 at 02:20:46PM +0000, Ian Jackson wrote:
> > > > Marek Marczykowski-Górecki writes ("[PATCH] libxl: create backend/ xenstore dir for driver domains"):
> > > > > Cleaning up backend xenstore entries is a responsibility of the backend.
> > > > > When backend lives outside of dom0, the domain needs proper permissions
> > > > > to do it. Normally it is given permission to remove the device dir
> > > > > itself, but not the dir containing it (named after frontend ID). After a
> > > > > whole those empty leftover directories accumulate to the point xenstore
> > > > > returning E2BIG on listing them.
> > > > > 
> > > > > Fix this by giving backend domain write access also to backend/
> > > > > directory itself when c_info->driver_domain option is set. The code
> > > > > removing relevant dir is already there (just lacked permissions to do so).
> > > > > 
> > > > > Note this also allows the backend domain to create new entries,
> > > > > pretending to host backend devices it don't have. But since libxl uses
> > > > > /libxl/ xenstore dir for this information (still outside of backend
> > > > > domain control), this shouldn't be an issue.
> > > > 
> > > > This seems quite hazardous to me.  The reasoning you use to show that
> > > > this iws OK seems fragile, and in general it doesn't feel right to
> > > > give the particular backend such wide scope.
> > > > 
> > > > Can we find another way to address this problem ?  I think the
> > > > containing directory should be removed by the toolstack.  Why is this
> > > > difficult ?  (I presume there is a reason or you would have done it
> > > > that way...)
> > > 
> > > It was done this way previously and caused issues, see this commit:
> > > 
> > > commit 546678c6a60f64fb186640460dfa69a837c8fba5
> > > Author: Roger Pau Monne <roger.pau@citrix.com>
> > > Date:   Wed Sep 23 12:06:56 2015 +0200
> > > 
> > >     libxl: fix the cleanup of the backend path when using driver domains
> > 
> > Thanks.
> > 
> > >     With the current libxl implementation the control domain will
> > >     remove both the frontend and the backend xenstore paths of a
> > >     device that's handled by a driver domain. This is incorrect,
> > >     since the driver domain possibly needs to access the backend
> > >     path in order to perform the disconnection and cleanup of the
> > >     device.
> > >     
> > >     Fix this by making sure the control domain only cleans the
> > >     frontend path, leaving the backend path to be cleaned by the
> > >     driver domain. Note that if the device is not handled by a
> > >     driver domain the control domain will perform the removal of
> > >     both the frontend and the backend paths.
> > 
> > Hmm.  I see my Ack on that.  Nevertheless maybe it is wrong.
> > 
> > Looking at it afresh, I think maybe the right answer is:
> > 
> >  * If the driver domain is expected to be working properly, the
> >    toolstack should wait for the driver domain to complete the device
> >    shutdown, before removing the backend node.  Indeed, the toolstack
> >    ought to wait for this before actually destroying the guest in Xen,
> >    by the usual logic for clean domain shutdown.
> 
> I think that's not enough. .../state = 6 is set by the kernel, but
> xl devd in the driver domain may want to cleanup things (hotplug scripts
> etc). And indeed libxl__device_destroy() is called from
> device_hotplug_done(), not device_backend_callback().
> 
> Alternatively, toolstack could wait for the actual backend node to be
> removed (by the driver domain), and then cleanup the parent directory (if
> empty).

I'm not sure you need to cleanup the parent directory, albeit it
wouldn't hurt. It needs to be done in a transaction though, so that
you don't race with new additions to it.

> I don't find it particularly appealing, as every contact with
> libxl async code reduce overall happiness...
> 
> >  * There needs to be a way to deal with a broken/unresponsive driver
> >    domain.  That will involve not waiting for the backend so must
> >    involve simply deleting the backend from xenstore.
> 
> It's already there: if driver domain fails to set .../state = 6 within
> a timeout, toolstack will forcibly remove the entry.

Would it work to change this and instead of monitor .../state = 6
monitor that the parent directory still exist?

> > Is the distinction here between "xl shutdown" and "xl destroy", on the
> > actual guest domain, good enough ?  Hopefully if the driver domain
> > sees the backend directory simply vanish it can destructively tear
> > everything down ?
> 
> In the past this lead to multiple issues, where hotplug script didn't
> know which device actually was removed. In some cases I needed to
> workaround this by saving xenstore dump into a file in an "online"
> hotplug script, but it is very ugly solution.

Removing the whole directory without giving time to the driver domain
to execute it's hotplug scripts can indeed lead to issues, as there's
no guarantee that the hotplug script won't use data in xenstore in
order to perform the cleanup IIRC.

My preferred option would be to wait for the backend directory to be
removed by the driver domain, as I think it's the cleanest and likely
safest approach.

Thanks, Roger.

