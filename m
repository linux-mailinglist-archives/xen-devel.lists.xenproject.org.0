Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50613AEAB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:11:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOkA-0001ir-P6; Tue, 14 Jan 2020 16:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irOk9-0001ie-9p
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:08:37 +0000
X-Inumbo-ID: 19de201e-36e8-11ea-b89f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19de201e-36e8-11ea-b89f-bc764e2007e4;
 Tue, 14 Jan 2020 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579018109;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=/Q/sAqj5AvtE5NkTaUnnH38VybE5Azsy2IpR97LOcYc=;
 b=EWGz9L2m5EWOdZkFkGY8h5tiZIJEnVCzYS1k6kmZgWSltzxbHf/MqiEB
 W18nX/D4XWUYqBBISqvAsQB9eAVe3V2M9odDJnAoJ6gWMoLeYmDJQDToT
 w2jYgCyCtrFS/kTGx+jajo4rwLJ+fyXdYbupmov1RuykHgeG3sGhQDX+S 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5DtHX/i8J+TAfNZv8LBHWtiTSpvZJS85ImZwx3RJACwPmWEVrcEvd7DDlnBMZj8jZSnra+jxqX
 TKwfln/6bhYYeIVLzEUHUXlrVbr0yroZmI0FERGR6skmvVkGxLrhcsscgXHx/L++kCohsTVntQ
 X5Btc5WCLf9U9127vUGOUapDAaQLLW9QmN3zP75xx8YenAFnuAvZsDznYLtKFAJB/i9FTyqXSf
 /WW60i7A9nxLaUIV1pwBz7thbULev18MQbOc+zTemyA0r12zAzanI40wI0h+YxyEOCusLBd640
 45g=
X-SBRS: 2.7
X-MesageID: 10910808
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,433,1571716800"; d="scan'208";a="10910808"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.59257.174624.736025@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:08:25 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-11-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-11-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 10/12] docs/migration: Specify X86_{CPUID,
 MSR}_POLICY records
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMTAvMTJdIGRvY3MvbWlncmF0aW9uOiBTcGVj
aWZ5IFg4Nl97Q1BVSUQsTVNSfV9QT0xJQ1kgcmVjb3JkcyIpOgo+IFRoZXNlIHR3byByZWNvcmRz
IG1vdmUgYmxvYnMgZnJvbSB0aGUgWEVOX0RPTUNUTF97Z2V0LHNldH1fY3B1X3BvbGljeQo+IGh5
cGVyY2FsbC4KCldlIGhhZCBhbiBleHRlbnNpdmUgSVJMIGRpc2N1c3Npb24gcmVjZW50bHkgYWJv
dXQgdGhlIGNvbXBhdGliaWxpdHkKaW1wbGljYXRpb25zIG9mIHRoaXMuICBJcyB0aGF0IHdyaXR0
ZW4gZG93biBzb21ld2hlcmUgPyAgSSB3YXMKZXhwZWN0aW5nIHRvIHNlZSBpdCBpbiB0aGlzIHBh
dGNoLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
