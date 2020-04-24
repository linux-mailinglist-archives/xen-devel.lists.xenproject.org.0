Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BDC1B7893
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:51:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzek-0008TN-Ji; Fri, 24 Apr 2020 14:50:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7No=6I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jRzej-0008TI-Bo
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:50:17 +0000
X-Inumbo-ID: e8931f8a-863a-11ea-9e09-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8931f8a-863a-11ea-9e09-bc764e2007e4;
 Fri, 24 Apr 2020 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587739816;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=BcTA3vtDQQUUeG3y2NL8ndNOg0AIfp294luSkOKkHhM=;
 b=iBy83Odv8CuggWC9Y6O1meGdp+F7/qNoODPZPYbb+I3nX7NR0WKQmda8
 24GHzbAoK+bzk2FleC/yQxbX9IwTTWC2+OuBTI3medmw7FzAVLZBQfE/i
 CIlj0blqed8kXJ61XpqM2SUdUCOz5sR6bOlac19W86bUi96wdmPM2hTIT Y=;
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
IronPort-SDR: BWWAQSqWzSMmY6RWdU7xibLguAYzDTKSKBql1fkj2hNdp+Ec+MHlB9qXZJdptaXuzWLZOmrCwS
 BYdARmu9mQ2caWsjJFYpuM+OQCeGkIZdk4UTk7Gplna9UiY2Lu2EKnPNpkNhj12c4SkFE0wAou
 i7HqydVCcmIi2myZVtYOdp30LopaY4BRGpo1dmhbNBhWQF5t0v7dy8bff9KIAGO+OuNXKz2Mmn
 jGwvxKyKvstY2RrD+l5KISVCVNB1r/FGg94ncrQZvE1C2EqhRKPIw4pSXsDE+R/QvIvFn98zbT
 GXk=
X-SBRS: 2.7
X-MesageID: 16191687
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,311,1583211600"; d="scan'208";a="16191687"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24226.64676.86981.838902@mariner.uk.xensource.com>
Date: Fri, 24 Apr 2020 15:50:12 +0100
To: Maximilian Heyne <mheyne@amazon.de>
Subject: Re: [PATCH 0/3] Cleanup IOREQ server on exit
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <6f476505-5e85-8a8a-d6d7-db56ea921637@amazon.de>
References: <20200313123316.122003-1-mheyne@amazon.de>
 <6f476505-5e85-8a8a-d6d7-db56ea921637@amazon.de>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Maximilian Heyne writes ("Re: [PATCH 0/3] Cleanup IOREQ server on exit"):
> Could someone please have a look at this patch? It solves an actual issue:
> Try soft-reset with qemu-xen-traditional and it will fail.

Thanks.  I reviewed this.

qemu is in deep freeze but the changes looked correct and are indeed
solving a regression.  I convinced myself that they were appropriately
low risk, so

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

for all three and I have pushed them.

In theory a backport might be appropriate since this is a bugfix but
my inclination is to leave existing releases where they are, since
anyone using qemu-trad probably wants things super-stable.  Contrary
opinions welcome.

It has been a very long time since I did an update of qemu trad so it
is possible that I have mangled the process somehow.  We will see I
guess...

Thanks also to Paul for chasing me about this.

Regards,
Ian.

