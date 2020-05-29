Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6FF1E8362
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:15:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehfZ-00050I-SF; Fri, 29 May 2020 16:15:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K2ub=7L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jehfY-000509-DN
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:15:40 +0000
X-Inumbo-ID: a2fb0bce-a1c7-11ea-81bc-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2fb0bce-a1c7-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 16:15:39 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 38FOTJdBGyyLsqaMNQ7d+0f9HtyrVHXBruRG7Y9k/p1Z1xYWXr4ewkwKMatofCTKthXgRGUIE6
 WDFmhXM3bs5sOn3KvXlP7c3wh4EAZR4IZf3IvOdtVEWos7Ox4/CdIe+v1YYBGyVtl2n890C6TP
 nV50LZzuPzbiKq7iQyJg2vlPQdETGpJtbdTnHbba77LRgQzyE7j1oCGg7sS/OUObr+OqhT1gnL
 HL4gjFhXQy/rvuUZpcGbolWvSyiCS8m92oGCt4k/NMe5Ike52y8lSnwvwKhNSSqWDrDGeVS29R
 MVY=
X-SBRS: 2.7
X-MesageID: 18777715
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="18777715"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 0/2] xen: credit2: limit the number of CPUs per runqueue
Thread-Topic: [PATCH 0/2] xen: credit2: limit the number of CPUs per runqueue
Thread-Index: AQHWHky4XA5G+M3bUEaQnq/cZhz5cKi+/2qAgABLOYA=
Date: Fri, 29 May 2020 16:15:35 +0000
Message-ID: <430647E9-7EC9-4041-9809-CACD4BC451BC@citrix.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <ab810b293ca8324ca3fba22476401a58435243fa.camel@suse.com>
In-Reply-To: <ab810b293ca8324ca3fba22476401a58435243fa.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D0FEF10C005914883F53CF3818974A6@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI5LCAyMDIwLCBhdCAxMjo0NiBQTSwgRGFyaW8gRmFnZ2lvbGkgPGRmYWdn
aW9saUBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBTbywNCj4gDQo+IEkgZmVsdCBsaWtlIHByb3Zp
ZGluZyBzb21lIGFkZGl0aW9uYWwgdGhvdWdodHMgYWJvdXQgdGhpcyBzZXJpZXMsIGZyb20NCj4g
YSByZWxlYXNlIHBvaW50IG9mIHZpZXcgKGFkZGluZyBQYXVsKS4NCj4gDQo+IFRpbWluZyBpcyAq
YmV5b25kIHRpZ2h0KiBzbyBpZiB0aGlzIHNlcmllcywgZW50aXJlbHkgb3IgcGFydGx5LCBoYXMg
YW55DQo+IGNoYW5jZSB0byBnbyBpbiwgaXQgd291bGQgYmUgdGhyb3VnaCBzb21lIGZvcm0gb2Yg
ZXhjZXB0aW9uLCB3aGljaCBvZg0KPiBjb3Vyc2UgY29tZXMgd2l0aCBzb21lIHJpc2tzLCBldGMu
DQo+IA0KPiBJIGRpZCB3b3JrIGhhcmQgdG8gc3VibWl0IHRoZSBmdWxsIHNlcmllcywgYmVjYXVz
ZSBJIHdhbnRlZCBwZW9wbGUgdG8NCj4gYmUgYWJsZSB0byBzZWUgdGhlIGNvbXBsZXRlIHNvbHV0
aW9uLiBIb3dldmVyLCBJIHRoaW5rIHRoZSBzZXJpZXMNCj4gaXRzZWxmIGNhbiBiZSBsb2dpY2Fs
bHkgc3BsaXQgaW4gdHdvIHBhcnRzLg0KPiANCj4gQmFzaWNhbGx5LCBpZiB3ZSBqdXN0IGNvbnNp
ZGVyIHBhdGNoZXMgMSBhbmQgNCB3ZSB3aWxsIGVuZCB1cCwgcmlnaHQNCj4gYWZ0ZXIgYm9vdCwg
d2l0aCBhIHN5c3RlbSB0aGF0IGhhcyBzbWFsbGVyIHJ1bnF1ZXVlcy4gVGhleSB3aWxsIG1vc3QN
Cj4gbGlrZWx5IGJlIGJhbGFuY2VkIGluIHRlcm1zIG9mIGhvdyBtYW55IENQVXMgZWFjaCBvbmUg
aGFzLCBzbyBhIGdvb2QNCj4gc2V0dXAuIFRoaXMgd2lsbCBsaWtlbHkgKGFjdHVhbCBkaWZmZXJl
bmNlcyBzZWVtcyB0byBkZXBlbmQgKnF1aXRlIGENCj4gYml0KiBvbiB0aGUgYWN0dWFsIHdvcmts
b2FkKSBiZSBhbiBpbXByb3ZlbWVudCBmb3IgdmVyeSBsYXJnZSBzeXN0ZW1zLg0KDQpGdW5kYW1l
bnRhbGx5LCBJIGZlZWwgbGlrZSB0aGUgcmVhc29uIHdlIGhhdmUgdGhlIGZlYXR1cmUgZnJlZXpl
IGlzIGV4YWN0bHkgdG8gaGF2ZSB0byBhdm9pZCBxdWVzdGlvbnMgbGlrZSB0aGlzLiAgU29tZXRo
aW5nIHZlcnkgbXVjaCBsaWtlIHBhdGNoIDQgd2FzIHBvc3RlZCBiZWZvcmUgdGhlIGxhc3QgcG9z
dGluZyBkYXRlOyBwYXRjaGVzIDEtNCByZWNlaXZlZCBSLWLigJlzIGJlZm9yZSB0aGUgZmVhdHVy
ZSBmcmVlemUuICBJIHRoaW5rIHRoZXkgc2hvdWxkIHByb2JhYmx5IGdvIGluLg0KDQpUaGUgcmVi
YWxhbmNpbmcgcGF0Y2hlcyBJ4oCZbSBpbmNsaW5lZCB0byBzYXkgc2hvdWxkIHdhaXQgdW50aWwg
dGhleeKAmXZlIGhhZCBhIGJpdCBtb3JlIHRpbWUgdG8gYmUgdGhvdWdodCBhYm91dC4NCg0KIC1H
ZW9yZ2UNCg0K

