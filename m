Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6C430E7B
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 15:02:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWh7i-0006CH-2X; Fri, 31 May 2019 12:59:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nX14=T7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hWh7g-0006CA-Kc
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 12:59:04 +0000
X-Inumbo-ID: dcf67de8-83a3-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dcf67de8-83a3-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 12:59:02 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 5hjBS/v8JRrAnOOfP3JNqaC0VZXy68CUl8cfV/VcdraNmv5zgVQZJgQ96557GcC9exFxjUbLMJ
 bZMrRKFskbvDJZDyRhgcI4GUlbPSjxk/Anv4nj5nDeDtgpBcsuseJRY+baNTjabDyyekhu3glk
 kfgXKEW/Dgl1EBVejv97FjvptbafczixXeHMpoojnaOc2/sQ0aver/gr3Ayv+5AMCvGtdzy8H4
 pDF6yykqgvNLtaZVzklJgRkAyi/kHSyfLp13qJp2rv+3eWtDvSKTgv9mwjoUEi8mcr1DKNnCxw
 ueo=
X-SBRS: 2.7
X-MesageID: 1156393
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,535,1549947600"; 
   d="scan'208";a="1156393"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH] xen: make tracebuffer configurable
Thread-Index: AQHVFtDkvpXzQTtLSUOuPgPJzIfTmaaE89YAgAAeHwA=
Date: Fri, 31 May 2019 12:58:36 +0000
Message-ID: <D13DE1D6-CE96-4A41-941E-FC4161CFA1EA@citrix.com>
References: <1559211432-30973-1-git-send-email-chenbaodong@mxnavi.com>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
In-Reply-To: <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5F55328682AA864E94B69B4D3E5D1059@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Baodong Chen <chenbaodong@mxnavi.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDMxLCAyMDE5LCBhdCAxMjoxMCBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+Pj4+IE9uIDMwLjA1LjE5IGF0IDEyOjE3LCA8Y2hlbmJh
b2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6DQo+PiBEZWZhdWx0OiBlbmFibGVkLg0KPj4gQ2FuIGJl
IGRpc2FibGVkIGZvciBzbWFsbGVyIGNvZGUgZm9vdHByaW50Lg0KPiANCj4gQnV0IHlvdSdyZSBh
d2FyZSB0aGF0IHdlJ3JlLCBmb3Igbm93IGF0IGxlYXN0LCB0cnlpbmcgdG8gbGltaXQgdGhlDQo+
IG51bWJlciBvZiBpbmRlcGVuZGVudGx5IHNlbGVjdGFibGUgY29uZmlnIG9wdGlvbnM/IE9uZXMg
ZGVwZW5kaW5nDQo+IG9uIEVYUEVSVCBhcmUgc29ydCBvZiBhbiBleGNlcHRpb24gaW4gY2VydGFp
biBjYXNlcy4NCg0KSeKAmW0gdHJ5aW5nIHRvIHJlbWVtYmVyIGV4YWN0bHkgd2hhdCB3ZSBoYXZl
IG9yIGhhdmVu4oCZdCBkZWNpZGVkLiAgSSB0YWtlIGl0IHlvdSB0aGluayB3ZSBzaG91bGQgYXZv
aWQgaGF2aW5nIGEgbG9hZCBvZiBpbmRlcGVuZGVudGx5LXNlbGVjdGFibGUgY29uZmlndXJhdGlv
bnMgdG8gc3VwcG9ydD8NCg0KQmFvZG9uZywgd2hhdCB3YXMgeW91ciBtYWluIHB1cnBvc2UgaW4g
YWRkaW5nIGEgcGF0Y2ggbGlrZSB0aGlzPyAgSnVzdCB0byBtYWtlIHRoaW5ncyBhIGJpdCB0aWRp
ZXIsIG9yIHdhcyBpdCB0byB0cnkgdG8gZ28gdGhyb3VnaCBhbmQgZ2VuZXJhdGUgYSBmYXIgc21h
bGxlciBoeXBlcnZpc29yIGNvZGViYXNlIChmb3IgaW5zdGFuY2UsIHBlcmhhcHMgdG8gbWFrZSBz
YWZldHkgY2VydGlmaWNhdGlvbiBtb3JlIHRyYWN0YWJsZSk/DQoNCkkgdGhpbmsgd2XigJl2ZSB0
YWxrZWQgYWJvdXQgdGhpcyBiZWZvcmUsIGJ1dCBvdXIgYmFzaWMgb3B0aW9ucywgYXMgZmFyIGFz
IHN1cHBvcnQsIHdvdWxkIGJlOg0KDQoxLiBIYXZlIGEgc2luZ2xlIGxhcmdlIGNvbmZpZyBvcHRp
b24gd2hpY2ggZGlzYWJsZWQgbGFyZ2Ugc3dhdGhlcyBvZiB1bnVzZWQgZnVuY3Rpb25hbGl0eQ0K
Mi4gSGF2ZSBpbmRpdmlkdWFsIGJpdHMgY29uZmlndXJhYmxlLCBidXQgaGF2ZSBvbmx5IGEgaGFu
ZGZ1bCBvZiDigJxzZWN1cml0eSBzdXBwb3J0ZWTigJ0gY29uZmlndXJhdGlvbnMuDQoNClRoZSBp
ZGVhIHdpdGggIzIgaXMgdGhhdCB3ZeKAmWQgaGF2ZSBhIOKAnGNlcnRpZmljYXRpb27igJ0gY29u
ZmlnIHRoYXQgd2UgdGVzdGVkIGFuZCBzZWN1cml0eSBzdXBwb3J0ZWQsIHdpdGggYWxsIG9mIHRo
ZXNlIGluZGl2aWR1YWwgYml0cyBvZmYsIGFzIHdlbGwgYXMg4oCcY2xvdWTigJ0gYW5kIOKAnGNs
aWVudOKAnSBjb25maWdzIHdpdGggYWxsIG9mIHRoZXNlIOKAnG9wdGlvbmFs4oCdIGJpdHMgb24g
KG9yIHNvbWUgc3Vic2V0IG9uLCBkZXBlbmRpbmcgb24gd2hhdCBlYWNoIGNvbW11bml0eSB0aG91
Z2h0IG1hZGUgdGhlIG1vc3Qgc2Vuc2UgZm9yIHRoZWlyIHVzZSBjYWZlKS4gIElmIHBlb3BsZSB3
YW50ZWQgdG8gZW5hYmxlIG9yIGRpc2FibGUgaW5kaXZpZHVhbCBjb25maWcgb3B0aW9ucyBvdXRz
aWRlIGZvIHRob3NlLCB0aGV54oCZZCBiZSB0YWtpbmcgYSByaXNrIHdydCBicmVha2FnZSAobm90
IHRlc3RlZCkgb3Igc2VjdXJpdHkgaXNzdWVzIChubyBYU0EgaXNzdWVkIHVubGVzcyBpdCBhZmZl
Y3RlZCBvbmUgb2YgdGhlIHN1cHBvcnRlZCBjb25maWdzKS4NCg0KUmljaCAvIERhbmllbCwgYW0g
SSBvbiB0aGUgcmlnaHQgdHJhY2sgaGVyZT8gIEFueSB0aG91Z2h0cz8NCg0KIC1HZW9yZ2UNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
