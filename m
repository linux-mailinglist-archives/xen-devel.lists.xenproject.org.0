Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCCC1C3975
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 14:35:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVaJD-0008E2-Jo; Mon, 04 May 2020 12:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QXc9=6S=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jVaJC-0008Dx-HW
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 12:34:54 +0000
X-Inumbo-ID: a7531d24-8e03-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7531d24-8e03-11ea-b07b-bc764e2007e4;
 Mon, 04 May 2020 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588595693;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=VJ9czVXLihgM9UipBJi3mo9l4BtGdOy0Wr/OhyZ+xio=;
 b=hYki99Y2DkGmRZ6dmRiRH4xLOoJmGpSbSCFfV8B2lUQewzQhzC9K0vSM
 gGd+Q8CjySR+9Wgd2lvPlacid4+OATmoHZKlN9ON9i6pGFJia+uAFHA+w
 JsneeW4hGMdwrEhZtFIT1obZgWu/nm8HhUyw7oWIurkU2ieultaZ2SEv+ Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P0L8QXjcZgfw9moBcyl/BuW8tmnVQo1O4S0NDpS7YEVym5d2YKyz4Ja0sZY9bQk3BjsCD9faC/
 PTsNWTrHuie3YOsLUfonPRfB9kVwFJel4HnP6YXHOT4dUBvwmK9mndbK6bt2Bfa0rbeX7LrQa4
 lFuD5PzjUC+IcSrIn3mbPU69qSTkkhmxbNrsOFJ9bWgAnMhnGnmJkgLAKmMDVY44AJsRdVRvS3
 ygVfe3xL3F+G1SNX3ZoZGcnIiC3NU3zZIIasMWhmjwqUv1q1k8Ksl3I4aNk1Xjh/2cDRnk6qFb
 1Xo=
X-SBRS: 2.7
X-MesageID: 16650907
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,352,1583211600"; d="scan'208";a="16650907"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24240.3047.877655.345428@mariner.uk.xensource.com>
Date: Mon, 4 May 2020 13:34:47 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
In-Reply-To: <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
> On Apr 30, 2020, at 3:50 PM, Jan Beulich <JBeulich@suse.com> wrote:
> > Well, if I'm not mis-remembering it was on purpose to make it more
> > difficult for people to declare themselves "experts". FAOD I'm not
> > meaning to imply I don't see and accept the frustration aspect you
> > mention further up. The two need to be carefully weighed against
> > one another.

Yes, it was on purpose.  However, I had my doubts at the time and
I think experience has shown that this was a mistake.

> I don’t think we need to make it difficult for people to declare
> themselves experts, particularly as “all” it means at the moment is,
> “Can build something which is not security supported”.  People who
> are building their own hypervisors are already pretty well advanced;
> I think we can let them shoot themselves in the foot if they want
> to.

Precisely.

Ian.

