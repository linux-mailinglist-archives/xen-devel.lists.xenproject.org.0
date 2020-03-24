Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1703190B60
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 11:49:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGh5m-0004Kl-7l; Tue, 24 Mar 2020 10:47:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGh5k-0004Ke-Hx
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:47:28 +0000
X-Inumbo-ID: da67596c-6dbc-11ea-a6c1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da67596c-6dbc-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585046848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aYByrJevwm6g5XNbgbl1RL1sgLRcjCRhXItsuYSQHoE=;
 b=SZ5OhzyT8f0Wxt7GJ7S+ZjfFxCYQ6nSkRsoMcumfv19qDfx1ug0R3sRD
 70hyUZ+CgOEN68vEZlSBs8l1GpHrmzaKrd16VV0i3UNmCMNk0ttgjvTPP
 0TNzDHmG7HmZr/6X1DMBNGk+oKqc+vt7hdhfi8qIiQdLsvD/B1Yy1o7Ka 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vR6pZVs8UiK9zB26tiIlhkGpnGzoZI+lA5UJzM7laQYAb6tKf9fOKXQ9qAb2n1hqCB7kI+x4v2
 46j2ValK2fGJBq/QKxNbRp05OqgT8JaRCjuoH56WEi9bjZLp4N/jrW8CP7MIMRT1HiDkiInKHX
 w/Vm6jLSklkIm8cJdlKD2ipq1PfcM0O4tKxI1xHOgUbj94w3lYC/gFNeA1plKjDidGxfDFk9Bt
 tg29xDkj3zvXxWn3chAYqkK9jneS27BebdZEXQ/AjABhyhd13mRytZh6KUHUo9J86Mh1c9dS8o
 bjc=
X-SBRS: 2.7
X-MesageID: 14510401
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14510401"
Date: Tue, 24 Mar 2020 11:47:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200324104720.GH24458@Air-de-Roger.citrite.net>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-2-roger.pau@citrix.com>
 <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
 <20200323144837.GB24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5ADE@SHSMSX104.ccr.corp.intel.com>
 <3d0286dd-1702-e7dd-a0a1-795cbd54ccb3@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5D72@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5D72@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 08:49:27AM +0000, Tian, Kevin wrote:
> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: Tuesday, March 24, 2020 4:10 PM
> > 
> > On 24.03.2020 06:41, Tian, Kevin wrote:
> > >> From: Roger Pau Monné <roger.pau@citrix.com>
> > >> Sent: Monday, March 23, 2020 10:49 PM
> > >>
> > >> On Mon, Mar 23, 2020 at 09:09:59AM +0100, Jan Beulich wrote:
> > >>> On 20.03.2020 20:07, Roger Pau Monne wrote:
> > >>>> This reverts commit f96e1469ad06b61796c60193daaeb9f8a96d7458.
> > >>>>
> > >>>> The commit is wrong, as the whole point of nvmx_update_apicv is to
> > >>>> update the guest interrupt status field when the Ack on exit VMEXIT
> > >>>> control feature is enabled.
> > >>>>
> > >>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > >>>
> > >>> Before anyone gets to look at the other two patches, should this
> > >>> be thrown in right away?
> > >>
> > >> I would like if possible get a confirmation from Kevin (or anyone
> > >> else) that my understanding is correct. I find the nested code very
> > >> confusing, and I've already made a mistake while trying to fix it.
> > >> That being said, this was spotted by osstest as introducing a
> > >> regression, so I guess it's safe to just toss it in now.
> > >>
> > >> FWIW patch 2/3 attempts to provide a description of my understanding
> > >> of how nvmx_update_apicv works.
> > >>
> > >
> > > I feel it is not good to take this patch alone, as it was introduced to fix
> > > another problem. W/o understanding whether the whole series can
> > > fix both old and new problems, we may risk putting nested interrupt
> > > logic in an even worse state...
> > 
> > Well, okay, I'll wait then, but it would seem to me that reverting
> > wouldn't put us in a worse state than we were in before that change
> > was put in.
> 
> Roger needs to make the call, i.e. which problem is more severe, old or
> new one.

AFAICT those problems affect different kind of hardware, so it doesn't
make much difference. IMO f96e1469ad06b6 should be reverted because
it's plain wrong, and albeit it seemed to fix the issue in one of my
boxes it was just luck.

I don't thinks it's going to make matters worse, as osstest is already
blocked, but reverting it alone without the rest of the series is not
going to unblock osstest either. If you agree it's wrong I think it
could go in now, even if it's just to avoid having to repost it with
newer versions of the series.

Thanks, Roger.

