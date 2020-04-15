Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B31AA2C6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:07:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOhlJ-0001QS-LN; Wed, 15 Apr 2020 13:07:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJH9=57=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jOhlH-0001QF-Kx
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:07:27 +0000
X-Inumbo-ID: 0d70d0ae-7f1a-11ea-8a49-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d70d0ae-7f1a-11ea-8a49-12813bfff9fa;
 Wed, 15 Apr 2020 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586956047;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ovDGVe72F4HtehzecLzgJ6GKmjgHgrieQ/BnRYJFBYU=;
 b=AHYOlw1KZBjEGKXp4ozu1Eab0qSEcYBMT9BPP6XRKGl6H02PNgKtcZ/O
 Pt6jyFZdncX1hHHA3oFWaX72XXt6Y8Yw3xZxHb9tPPU8+65hK00Fxq+xb
 wGiEgrbUaHjOCgx3+DbkGu0/QK1tbRJ7WsFVm3ueJvhDwIgMwHJ3HUpXA c=;
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
IronPort-SDR: dcQ+MZkJHve15iwwa9DBAFOMnaI20CM6thtaFPOrhq77Z6KB0zn/i64u66AkKUur02uznJCKET
 wYMc1jZr+vgopDp9b36+4nUMIqWNN0jnh13PvPI0qoSvtVpvtS2XCOqR9AvRY+cYdz4pXzOOL8
 Dd4vd2kcK+f7RW1Kmr/3DxxAK4yQ/EsDWFZppEToLEgdYPfTf3RFSYeQxEKOaXF5bj3eefdbp2
 iHFAT6rO++FAGwxaPe6lkjF0v1BPYg/0h/3snc1cXVbLTCg+gbXEX9l/s2kvrFh5vTNL2j4RKw
 9n0=
X-SBRS: 2.7
X-MesageID: 15697461
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="15697461"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24215.1796.244074.907303@mariner.uk.xensource.com>
Date: Wed, 15 Apr 2020 14:07:16 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST v2 1/2] exanime: test for SMT and add a host flag
In-Reply-To: <20200415101509.8763-1-roger.pau@citrix.com>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <20200415101509.8763-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[PATCH OSSTEST v2 1/2] exanime: test for SMT and add a host flag"):
> Check if hosts have SMT based on the number of threads per core. A
> value of threads per core greater than 1 implies SMT support.

I spotted the "0" in v1 but since you had clearly stated the same
thing in the commit message too I thought you knew what you were doing
:-).

Thanks,
Ian.

