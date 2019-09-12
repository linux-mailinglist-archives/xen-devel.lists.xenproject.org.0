Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E4B0D2D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:48:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Mbk-0006NC-Kp; Thu, 12 Sep 2019 10:45:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pnqf=XH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i8Mbj-0006N3-1F
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:45:47 +0000
X-Inumbo-ID: 78294efa-d54a-11e9-83e7-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78294efa-d54a-11e9-83e7-12813bfff9fa;
 Thu, 12 Sep 2019 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568285144;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=yQ9RDPU3tvuFgVBhPuxWxNV4cuZ8L0IYxqVmM8PHVwc=;
 b=EHP5NusAU+9CTFughJMP22BHpiV58o6JGp5vbl05495+bbZBUj9xUtCC
 P+UZ7VLHsR+qQ17bkaC6cR4+7LuMgCMg2EN3S2r7ZZphYEjeKKF5UcTpI
 +hfNlNJTAf2iSxUBDp3zsVOgoXKD1tyi2eC7QhHBAq/nkSOfA/m/4d8Z/ A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b7sFqxeBrDXlZ67JTQNSXg3f3aOOcKVUMzERWMfWkQeziNzCjyc2Q8/SV+sf5yAhaoRPxHtFrQ
 QGTfYA12Cbf1kryEJSHV/gtffPr+G24CelI9a/K3cx7uXhs3L7RQ+NFNhwrOi8nlaLeoBSkpzD
 2wKJL9rowVhY3wp81LFrwZrOLRAN+ezkUP59E4FBZhMDJB8UP9oJWXIMIOMj/N0w+C6vGC3U2O
 iU92jI/acqjoXqt2MgzX+3MVILSwoZLH8doLCSllC0bawtGtnr09pIPFlziTfBqtf3fw5YQFpU
 6r8=
X-SBRS: 2.7
X-MesageID: 5477410
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5477410"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23930.8630.48500.46728@mariner.uk.xensource.com>
Date: Thu, 12 Sep 2019 11:45:10 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190910152538.36921-2-roger.pau@citrix.com>
References: <20190910152538.36921-1-roger.pau@citrix.com>
 <20190910152538.36921-2-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 2/2] sysctl: report shadow paging
 capability
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
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim  \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCB2NCAyLzJdIHN5c2N0bDogcmVwb3J0IHNo
YWRvdyBwYWdpbmcgY2FwYWJpbGl0eSIpOgo+IFJlcG9ydCB3aGV0aGVyIHNoYWRvdyBwYWdpbmcg
aXMgc3VwcG9ydGVkIGJ5IHRoZSBoeXBlcnZpc29yLCBzaW5jZSBpdAo+IGNhbiBiZSBkaXNhYmxl
ZCBhdCBidWlsZCB0aW1lLgouLi4KPiBOQjogSSdtIG5vdCBzdXJlIHRoZSBhZGRlZCBjaGVjayBp
bgo+IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdCBpcyB0aGF0IHVzZWZ1bCwg
b3IgaWYgaXQgY291bGQgYmUKPiBiZXR0ZXIgcGxhY2VkIHNvbWV3aGVyZSBlbHNlLgoKQWNrZWQt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKPiArICAgICAgICBp
ZiAoIWluZm8uY2FwX2hhcCAmJiAhaW5mby5jYXBfc2hhZG93KSB7Cj4gKyAgICAgICAgICAgIExP
RyhFUlJPUiwgIm5laXRoZXIgaGFwIG5vciBzaGFkb3cgcGFnaW5nIGF2YWlsYWJsZSIpOwo+ICsg
ICAgICAgICAgICByZXR1cm4gRVJST1JfSU5WQUw7Cj4gKyAgICAgICAgfQo+ICsKPiAgICAgICAg
ICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmNfaW5mby0+aGFwLCBpbmZvLmNhcF9oYXApOwoK
SSB3b3VsZCBoYXZlIHdyaXR0ZW4KCiAgaWYgKGNhcF9oYXApIHNldGRlZmF1bHQoaW5mby0+aGFw
LCB0cnVlKTsKICBlbHNlIGlmIChjYXBfc2hhZG93KSBzZXRkZWZhdWx0KGluZm8tPmhhcCwgZmFs
c2UpOwogIGVsc2UgYm9tYl9vdXQoKTsKCmJ1dCB0aGUgcmVzdWx0IGlzIGVxdWl2YWxlbnQuCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
