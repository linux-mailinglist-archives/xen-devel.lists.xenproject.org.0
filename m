Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82A17A9EA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 17:01:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9suO-0001dQ-3z; Thu, 05 Mar 2020 15:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HqXF=4W=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j9suM-0001dE-Iu
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:59:34 +0000
X-Inumbo-ID: 4da45460-5efa-11ea-a60a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4da45460-5efa-11ea-a60a-12813bfff9fa;
 Thu, 05 Mar 2020 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583423973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2olwluwB7FChHFVEB9lZoC6jj8Gp0qx1fx03n3XJXJE=;
 b=ZUqKyFrcZi6ssx3STuVBv1OcOqLmeyYbmwpIWXPQ1LYSxOHr92pQgkN9
 6sAa3VK2vBB68TiDouTbZ2F8YVVPEkUZ/X+RHzNuCPoSatrgTQvdzJNrT
 tUo18RECWrqpG4WeHxfDfiajN0AjRSzMo0vGiwwRLHsl7r0EvUKJ+iovf o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7S65N88XtT+oZLNeJTtikMlYoqDpD471nFxuMwNtmdCCKeJSn146SlPwMAt7fNrcngyjsh0R3S
 J0zz4GSmLNnVzPWIb9ed7i6T5OVniXtKgn0EbcxYr7f9k+efZbXjE+OlgLgB4uND0YjiSc1NVJ
 7KD7cjvfqTygS+pQcBUikYHgTfklNqVeQoD78BJ5TYdntoBVEPo0A8T1cdWdaTnGKGZs0I3HmJ
 wFNlGISXsWsIFwmSl/Z6qPQ7+Eaew8/Mpw/4o+swluS9CPrTFThEvwjvSaiSVKWBLnFyoeujcX
 x1Y=
X-SBRS: 2.7
X-MesageID: 13815709
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="13815709"
Date: Thu, 5 Mar 2020 15:59:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200305155929.GA15912@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
 <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
 <e194bb44-9d71-070e-7ef7-47dd1a21c56e@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e194bb44-9d71-070e-7ef7-47dd1a21c56e@xen.org>
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMDM6MDI6MjJQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEphbiwKPiAKPiA+ID4gICB4ZW4vUnVsZXMubWsgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAxOSArKysrKysrKy0tLS0tLS0tLS0tCj4gPiA+ICAgeGVuL2FyY2gvYXJtL01ha2Vm
aWxlICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KPiA+ID4gICB4ZW4vYXJjaC9h
cm0vYXJtMzIvTWFrZWZpbGUgICAgICAgICAgfCAgMiArLQo+ID4gPiAgIHhlbi9hcmNoL2FybS9h
cm02NC9NYWtlZmlsZSAgICAgICAgICB8ICAyICstCj4gPiAKPiA+IEp1bGllbiwgU3RlZmFubyAt
IGFueSBjaGFuY2Ugb2YgZ2V0dGluZyBhbiBhY2sgaGVyZT8KPiAKPiBTdGV3YXJ0IHBvaW50ZWQg
b25lIGJ1aWxkIGlzc3VlIG9uIEFybSBpbiB0aGUgY292ZXIgbGV0dGVyLiBJIGFtIG5vdCBzdXJl
Cj4gd2hlcmUgdGhlIGJ1ZyBsaWVzLCBzbyBJIHdvdWxkIGxpa2UgdG8gaG9sZCBvZmYgbXkgYWNr
IHVudGlsIHNvbWVvbmUgZmlndXJlCj4gb3V0IHdoYXQncyBnb2luZyBvbi4KClRoZSBidWcgaXMg
aW4gcGF0Y2ggIltYRU4gUEFUQ0ggdjMgMTUvMjNdIHhlbi9idWlsZDogaGF2ZSB0aGUgcm9vdApN
YWtlZmlsZSBnZW5lcmF0ZXMgdGhlIENGTEFHUyIuIFNvIHRoaXMgcGF0Y2ggaXMgZmluZSA6LSku
CgpDaGVlcnMsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
