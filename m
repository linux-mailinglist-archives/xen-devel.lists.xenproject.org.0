Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E9331BF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:10:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXndY-0005u6-5X; Mon, 03 Jun 2019 14:08:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Nnt=UC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hXndW-0005u0-AY
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:08:30 +0000
X-Inumbo-ID: 0e43d5f4-8609-11e9-8fe0-2b26364e2264
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e43d5f4-8609-11e9-8fe0-2b26364e2264;
 Mon, 03 Jun 2019 14:08:26 +0000 (UTC)
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
IronPort-SDR: XCzhaVgzwjfsIIR0ZR3WXOFaCxcs0u4T42yayvErJ186S01AlHLd849YECAqUumK1p6viKVKTz
 FHn9R5UxhvmWeQIrqQUy152NAN/qIAvtF6Er8J7eZWm0NfxjM0RgbJLUY+36k5nM24LS5290Yr
 iaGmZsWt8W0XU3aZkVRribjr14kNO67lobIdlxg6tk+XbPzI82wUrbn1qJ07Qt0Q5SwD2ort5p
 S0bJRNiHIyCgh4sUl2jIG7f1JamSCn2qcE8gOwf6Qd7yOp5MvjPZ5/K9j1DDcdx13Oz71MpLkP
 8NU=
X-SBRS: 2.7
X-MesageID: 1245184
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,547,1549947600"; 
   d="scan'208";a="1245184"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH] xen: make tracebuffer configurable
Thread-Index: AQHVFtDkvpXzQTtLSUOuPgPJzIfTmaaE89YAgAQv+oCAAFplgIAAJGkAgAADkoCAADZAgA==
Date: Mon, 3 Jun 2019 14:08:22 +0000
Message-ID: <6852F5F0-0DC1-4FAE-9D80-5AF9C1187DB4@citrix.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
 <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
 <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
 <5CF4FC53020000780023490D@prv1-mh.provo.novell.com>
In-Reply-To: <5CF4FC53020000780023490D@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <CB09F98F1FF78C40AB7988A431834C11@citrix.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Baodong Chen <chenbaodong@mxnavi.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDMsIDIwMTksIGF0IDExOjU0IEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gT24gMDMuMDYuMTkgYXQgMTI6NDEsIDxjaGVuYmFv
ZG9uZ0BteG5hdmkuY29tPiB3cm90ZToNCj4gDQo+PiBPbiA2LzMvMTkgMTY6MzEsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDAzLjA2LjE5IGF0IDA1OjA3LCA8Y2hlbmJhb2RvbmdAbXhu
YXZpLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDUvMzEvMTkgMTk6MTAsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+Pj4gT24gMzAuMDUuMTkgYXQgMTI6MTcsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29t
PiB3cm90ZToNCj4+Pj4+PiBEZWZhdWx0OiBlbmFibGVkLg0KPj4+Pj4+IENhbiBiZSBkaXNhYmxl
ZCBmb3Igc21hbGxlciBjb2RlIGZvb3RwcmludC4NCj4+Pj4+IEJ1dCB5b3UncmUgYXdhcmUgdGhh
dCB3ZSdyZSwgZm9yIG5vdyBhdCBsZWFzdCwgdHJ5aW5nIHRvIGxpbWl0IHRoZQ0KPj4+Pj4gbnVt
YmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJsZSBjb25maWcgb3B0aW9ucz8gT25lcyBkZXBl
bmRpbmcNCj4+Pj4+IG9uIEVYUEVSVCBhcmUgc29ydCBvZiBhbiBleGNlcHRpb24gaW4gY2VydGFp
biBjYXNlcy4NCj4+Pj4gTGltaXQgdGhlIG51bWJlciBvZiBpbmRlcGVuZGVudGx5IHNlbGVjdGFi
bGUgY29uZmlnIHNvdW5kcyBnb29kIHRvIG1lLg0KPj4+PiANCj4+Pj4gRG9lcyB0aGUgZm9sbG93
aW5nIGxvb2tzIGdvb2Q/DQo+Pj4+IA0KPj4+PiArY29uZmlnIEhBU19UUkFDRUJVRkZFUg0KPj4+
PiArICAgICAgIGJvb2wgIkVuYWJsZS9EaXNhYmxlIHRyYWNlYnVmZmVyIiAgaWYgRVhQRVJUID0g
InkiDQo+Pj4+ICsgICAgICAgLS0taGVscC0tLQ0KPj4+PiArICAgICAgICAgRW5hYmxlIG9yIGRp
c2FibGUgdHJhY2VidWZmZXIgZnVuY3Rpb24uDQo+Pj4+ICsgICAgICAgICBYZW4gaW50ZXJuYWwg
cnVubmluZyBzdGF0dXModHJhY2UgZXZlbnQpIHdpbGwgYmUgc2F2ZWQgdG8NCj4+Pj4gdHJhY2Ug
bWVtb3J5DQo+Pj4+ICsgICAgICAgICB3aGVuIGVuYWJsZWQuDQo+Pj4+ICsNCj4+PiBUaGUgRVhQ
RVJUIGFkZGl0aW9uIG1ha2UgaW50cm9kdWNpbmcgdGhpcyBmaW5lIGJ5IG1lLiBCdXQgaXRzIG5h
bWUNCj4+PiBpcyBzdGlsbCB3cm9uZywgYW5kIHRoZSBoZWxwIHRleHQgYWxzbyBuZWVkcyBmdXJ0
aGVyIGltcHJvdmVtZW50IGltby4NCj4+IA0KPj4gSGkgSmFuLCB0aGFua3MgZm9yIHlvdXIga2lu
ZGx5IHJldmlldyBhbmQgZmVlZGJhY2suDQo+PiANCj4+IEZvciB0aGlzLCB3b3VsZCB5b3UgcGxl
YXNlIGdpdmUgeW91ciBzdWdnZXN0aW9ucyBhYm91dCB0aGUgbmFtZSBhbmQgaGVscCANCj4+IHRl
eHQ/DQo+IA0KPiBBcyBmYXIgYXMgdGhlIG5hbWUgaXMgY29uY2VybmVkLCB0aGUgSEFTXyBzaG91
bGQgYmUgZHJvcHBlZC4NCj4gSSdtIGFmcmFpZCBJIGRvbid0IGhhdmUgYSBwYXJ0aWN1bGFyIHN1
Z2dlc3Rpb24gZm9yIHRoZSBoZWxwIHRleHQuDQoNCllvdSBjb3VsZCBhdCBsZWFzdCBnaXZlIGFu
IGlkZWEgd2hhdCB5b3UgdGhpbmsgdGhlIGhlbHAgdGV4dCBzaG91bGQgaW5jbHVkZSwgb3Igc29t
ZSBraW5kIG9mIGd1aWRhbmNlIGFzIHRvIHdoYXQgd291bGQgc2F0aXNmeSB5b3UuICBPYnZpb3Vz
bHkgeW91IHNob3VsZG7igJl0IGJlIHJlcXVpcmVkIHRvIHdyaXRlIGV2ZXJ5Ym9keeKAmXMgaGVs
cCB0ZXh0IGZvciB0aGVtOyBidXQgYnkgdGhlIHNhbWUgdG9rZW4sIGV2ZXJ5Ym9keSBzaG91bGRu
4oCZdCBiZSByZXF1aXJlZCB0byByZWFkIHlvdXIgbWluZC4NCg0KSXMsIOKAnEEgZGVzY3JpcHRp
b24gb2YgdGhlIGZlYXR1cmUsIGFsb25nIHdpdGggdGhlIGNvc3RzIG9mIGVuYWJsaW5nIGl04oCd
IHRoZSBzb3J0IG9mIHRoaW5nIHlvdSBoYWQgaW4gbWluZD8NCg0KIC1HZW9yZ2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
