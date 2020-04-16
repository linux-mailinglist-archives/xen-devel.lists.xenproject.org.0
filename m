Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F01ACDD1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 18:36:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP7Uv-0002t3-8s; Thu, 16 Apr 2020 16:36:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8YfG=6A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jP7Ut-0002sy-Il
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:36:15 +0000
X-Inumbo-ID: 630dac30-8000-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 630dac30-8000-11ea-83d8-bc764e2007e4;
 Thu, 16 Apr 2020 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587054974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IW4X/8elxpsv9rYspMp4ZxClWi5lZ3p/vTWGpAsRf4A=;
 b=b4zZhr2vKtCFOr3S6RBHjvO64tL1bADAiNUadRDMu4WVXMYfYlOg2myp
 JXnsVfhZrZpnmfukoRBZ4w3fAwwtGT/PVR1Ky4Np8nlpdkXm4fLpbsG8M
 AZw23k8ZNFrtd8oGxUtO3+0WLOknYNsXk8XSwwmgLqNsQ0AwncCaDq2YL Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YRBBME4ZSTJ/s//42/YcNnsOYEFjv9MgE4xtapPebpTdsq6GyAwc/xVx3RHO7pG4+KG0C42gXL
 wZ6tYQj8CzwiKTqmSwX1aa18xhMDtyfqp2uYoTH+6YOlmFEW0f1Ol+imb3z7ecez2HkeVZLqJ2
 D/dfK2WDSqNP/YLple+UOtDY/KRZ47WVIi7dS4yzHubK+NF5oQe4WK/z41/NucFx1KJiHrGf2s
 /kGZiWiiqx3BsOhAsQtWan9h+CC+FLz2srhQKOGFbKvFxi39ztQm5V9Vjenb2m0OL70YT2koi5
 Vb0=
X-SBRS: 2.7
X-MesageID: 16196245
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="16196245"
Date: Thu, 16 Apr 2020 18:36:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job
Message-ID: <20200416163607.GO28601@Air-de-Roger>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <20200415085246.7945-2-roger.pau@citrix.com>
 <24215.1729.892903.300149@mariner.uk.xensource.com>
 <ca19a888e95d00ce664b9d777510e366547327cc.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ca19a888e95d00ce664b9d777510e366547327cc.camel@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 16, 2020 at 06:28:33PM +0200, Dario Faggioli wrote:
> On Wed, 2020-04-15 at 14:06 +0100, Ian Jackson wrote:
> > Roger Pau Monne writes ("[PATCH OSSTEST 2/2] make-flight: add a core
> > scheduling job"):
> > > Run a simple core scheduling tests on a host that has SMT support.
> > > This is only enabled for Xen >= 4.13.
> > ...
> > > +  # Core-scheduling tests are x86 only
> > > +  if [ x$test_coresched = xy -a $xenarch = amd64 ]; then
> > > +    job_create_test test-$xenarch$kern-coresched-$dom0arch-xl \
> > > +                    test-debian xl $xenarch $dom0arch
> > > $debian_runvars \
> > > +                    all_hostflags=$most_hostflags,smt \
> > > +                    xen_boot_append='sched-gran=core'
> > > +
> > > +  fi
> > 
> > This seems fine as far as it goes, but all it does is check that
> > things still work if sched-gran=core is passed. 
> >
> Yep, and that's enough for enabling and starting using ore-scheduling.
> So, doing like this, core-scheduling should get the same amount and
> kind of testing that scheduling in general gets.

Well, we run a lot more tests without 'sched-gran=core', but I don't
think it's feasible to duplicate the matrix to run all tests with and
without core-scheduling.

> >  I'm not sure whether
> > anything more sophisticated is needed, and in any case this is a step
> > in the right direction, so:
> > 
> Indeed.
> 
> One question, as my OSSTest-fu is a bit rusty... does this create
> "sched-gran=core" tests for all the schedulers? Or just one of them for
> th default scheduler?

Just for the default scheduler ATM, we can expand this if required.
The test also is very simple, as it just creates a Debian PV guest
and does some basic life cycle operations, it's exactly like the job
below but with 'sched-gran=core':

http://logs.test-lab.xenproject.org/osstest/logs/149667/test-amd64-amd64-xl/info.html

Roger.

