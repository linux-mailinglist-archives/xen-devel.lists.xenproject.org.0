Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53CC17AD6A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 18:39:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9uRL-0003M0-Gd; Thu, 05 Mar 2020 17:37:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P6JL=4W=amazon.co.uk=prvs=326373da0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9uRJ-0003Lu-Cj
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 17:37:41 +0000
X-Inumbo-ID: 0367e5d4-5f08-11ea-a63a-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0367e5d4-5f08-11ea-a63a-12813bfff9fa;
 Thu, 05 Mar 2020 17:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583429862; x=1614965862;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kZ/0ZPOmDl10n40kEWSNO42YwEGeKcdnGOvgBXhXVSo=;
 b=EFh6244nxUT80QrMcOve/y4/sfAScl4aiRREL/SOI3Bjjghaj8w3vQAZ
 z9WBt8YYSh0F2Vy/lRJGU2zStye/VZkrGZWzn/XatjhH6kUKQ9fujv/pm
 KR+g76at1FnzFsD5Gz3xsXeWYTigN+O7KV4W58vHzN+9eUrRLg4/8rD7N U=;
IronPort-SDR: 7+bQYlYW91K6guouz9g+7Mg3o+Siu+NtO7cV4rj0QYImvP7/qnvHlrEqVfDF2o+KTkzbBGsEIA
 3khc2KhZk/1Q==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="20235674"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 05 Mar 2020 17:37:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id EDFDAA2546; Thu,  5 Mar 2020 17:37:27 +0000 (UTC)
Received: from EX13D22EUA003.ant.amazon.com (10.43.165.210) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 17:37:27 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D22EUA003.ant.amazon.com (10.43.165.210) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 17:37:26 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 5 Mar 2020 17:37:26 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "Gautam, Varad" <vrd@amazon.de>
Thread-Topic: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
Thread-Index: AQJ8SDT59uyhxucSdGy6HcZhZ44orwIWBJeGAvYgMkWmxLGdgIAAhftA
Date: Thu, 5 Mar 2020 17:37:26 +0000
Message-ID: <1179b523b5b94eb29d76d7822031b4a8@EX13D32EUC003.ant.amazon.com>
References: <1580290087-20636-1-git-send-email-vrd@amazon.de>
 <20200129103050.GV57924@desktop-tdan49n.eng.citrite.net>
 <9bb58eaf-bb85-f0f2-b626-3442532305ac@suse.com>
 <708d6906-455f-108f-3733-e8cf5367deec@suse.com>
In-Reply-To: <708d6906-455f-108f-3733-e8cf5367deec@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.216]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gN
Cj4gU2VudDogMDUgTWFyY2ggMjAyMCAwOTozNw0KPiBUbzogR2F1dGFtLCBWYXJhZCA8dnJkQGFt
YXpvbi5kZT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVu
QHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2M10geDg2OiBpcnE6IERvIG5vdCBCVUdfT04g
bXVsdGlwbGUgdW5iaW5kIGNhbGxzIGZvciBzaGFyZWQgcGlycXMNCj4gDQo+IE9uIDI5LjAxLjIw
MjAgMTI6NDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDI5LjAxLjIwMjAgMTE6MzAsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+ID4+IEhlbGxvLA0KPiA+Pg0KPiA+PiBUaGFua3MgZm9y
IHRoZSBwYXRjaCEgTmV4dCB0aW1lIGNvdWxkIHlvdSBwbGVhc2UgdHJ5IHRvIHJlcGx5IHRvIHRo
ZQ0KPiA+PiBwcmV2aW91cyBxdWVzdGlvbnMgYmVmb3JlIHNlbmRpbmcgYSBuZXcgdmVyc2lvbjoN
Cj4gPj4NCj4gPj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTA3L21zZzAwMjU3Lmh0bWwNCj4gPj4NCj4gPj4gT24gV2VkLCBKYW4gMjks
IDIwMjAgYXQgMTA6Mjg6MDdBTSArMDEwMCwgVmFyYWQgR2F1dGFtIHdyb3RlOg0KPiA+Pj4gWEVO
X0RPTUNUTF9kZXN0cm95ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWluX2tp
bGwgLUVSRVNUQVJUUy4NCj4gPj4+IEluIHRoYXQgc2NlbmFyaW8sIGl0IGlzIHBvc3NpYmxlIHRv
IHJlY2VpdmUgbXVsdGlwbGUgX3BpcnFfZ3Vlc3RfdW5iaW5kDQo+ID4+PiBjYWxscyBmb3IgdGhl
IHNhbWUgcGlycSBmcm9tIGRvbWFpbl9raWxsLCBpZiB0aGUgcGlycSBoYXMgbm90IHlldCBiZWVu
DQo+ID4+PiByZW1vdmVkIGZyb20gdGhlIGRvbWFpbidzIHBpcnFfdHJlZSwgYXM6DQo+ID4+PiAg
IGRvbWFpbl9raWxsKCkNCj4gPj4+ICAgICAtPiBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMo
KQ0KPiA+Pj4gICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2aWNlcygpDQo+ID4+PiAgICAgICAgIC0+
IHBjaV9jbGVhbl9kcGNpX2lycSgpDQo+ID4+PiAgICAgICAgICAgLT4gcGlycV9ndWVzdF91bmJp
bmQoKQ0KPiA+Pj4gICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmluZCgpDQo+ID4+Pg0K
PiA+Pj4gRm9yIGEgc2hhcmVkIHBpcnEgKG5yX2d1ZXN0cyA+IDEpLCB0aGUgZmlyc3QgY2FsbCB3
b3VsZCB6YXAgdGhlIGN1cnJlbnQNCj4gPj4+IGRvbWFpbiBmcm9tIHRoZSBwaXJxJ3MgZ3Vlc3Rz
W10gbGlzdCwgYnV0IHRoZSBhY3Rpb24gaGFuZGxlciBpcyBuZXZlciBmcmVlZA0KPiA+Pj4gYXMg
dGhlcmUgYXJlIG90aGVyIGd1ZXN0cyB1c2luZyB0aGlzIHBpcnEuIEFzIGEgcmVzdWx0LCBvbiB0
aGUgc2Vjb25kIGNhbGwsDQo+ID4+PiBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0
aGUgY3VycmVudCBkb21haW4gd2hpY2ggaGFzIGJlZW4gcmVtb3ZlZA0KPiA+Pj4gZnJvbSB0aGUg
Z3Vlc3RzW10gbGlzdCwgYW5kIGhpdHMgYSBCVUdfT04uDQo+ID4+Pg0KPiA+Pj4gTWFrZSBfX3Bp
cnFfZ3Vlc3RfdW5iaW5kIHNhZmUgdG8gYmUgY2FsbGVkIG11bHRpcGxlIHRpbWVzIGJ5IGxldHRp
bmcgeGVuDQo+ID4+PiBjb250aW51ZSBpZiBhIHNoYXJlZCBwaXJxIGhhcyBhbHJlYWR5IGJlZW4g
dW5ib3VuZCBmcm9tIHRoaXMgZ3Vlc3QuIFRoZQ0KPiA+Pj4gUElSUSB3aWxsIGJlIGNsZWFuZWQg
dXAgZnJvbSB0aGUgZG9tYWluJ3MgcGlycV90cmVlIGR1cmluZyB0aGUgZGVzdHJ1Y3Rpb24NCj4g
Pj4+IGluIGNvbXBsZXRlX2RvbWFpbl9kZXN0cm95IGFueXdheXMuDQo+ID4+DQo+ID4+IFNvIEFG
QUlDVCB0aGlzIGlzIGJlY2F1c2UgcHRfcGlycV9zb2Z0aXJxX2FjdGl2ZSgpIHJldHVybnMgdHJ1
ZSBpbg0KPiA+PiBwY2lfY2xlYW5fZHBjaV9pcnEoKSBhbmQgaGVuY2UgdGhlIGl0ZXJhdGlvbiBp
cyBzdG9wcGVkIGFuZA0KPiA+PiBodm1fZG9tYWluX2lycShkKS0+ZHBjaSBpcyBub3Qgc2V0IHRv
IE5VTEwuDQo+ID4+DQo+ID4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGNsZWFuIHRoZSBhbHJl
YWR5IHByb2Nlc3NlZCBJUlFzIGZyb20gdGhlDQo+ID4+IGRvbWFpbiBwaXJxX3RyZWU/DQo+ID4N
Cj4gPiBUaGlzIG1pZ2h0IHdvcmssIHBlcmhhcHMgYnkgd2F5IG9mIGludm9raW5nIHVubWFwX2Rv
bWFpbl9waXJxKCkNCj4gPiByaWdodCBhZnRlciBwaXJxX2d1ZXN0X3VuYmluZCgpLCBhcyBsb25n
IGFzIGh2bV9kaXJxX2Fzc2lzdCgpIChhcw0KPiA+IGNhbGxlZCBmcm9tIGRwY2lfc29mdGlycSgp
KSBjYW4gYmUgbWFkZSBza2lwIGFsbCBhY3R1YWwgd29yayBpdA0KPiA+IG1lYW5zIHRvIGRvIGlu
IHN1Y2ggYSBjYXNlLiBVbmZvcnR1bmF0ZWx5IHRoZSB0d28gLT5tYXNrZWQgZmllbGRzDQo+ID4g
YWN0ZWQgdXBvbiBhcmUgZGlmZmVyZW50IGJldHdlZW4gX19waXJxX2d1ZXN0X3VuYmluZCgpIGFu
ZA0KPiA+IGh2bV9kaXJxX2Fzc2lzdCgpLg0KPiANCj4gUGluZz8gVW5sZXNzIEkgaGVhciBiYWNr
IHNvb24sIEknbSBhZnJhaWQgSSdtIGdvaW5nIHRvIGRyb3AgdGhpcw0KPiBwYXRjaCBmcm9tIG15
ICJwZW5kaW5nIiBtYWlsIGZvbGRlciwgYXMgbm90IGJlaW5nIGFncmVlZCB3aGV0aGVyDQo+IHRv
IHN0aWNrIHRvIHRoZSBjdXJyZW50IHZlcnNpb24gb3Igd2hldGhlciB0byBnbyB0aGlzIGFsdGVy
bmF0aXZlDQo+IHJvdXRlLiBBIG1vcmUgIm5hdHVyYWwiIGFwcHJvYWNoIHRvIGZpeGluZyB0aGUg
aXNzdWUgd291bGQgYmUNCj4gcXVpdGUgbmljZSwgYWZ0ZXIgYWxsLg0KDQpJJ2xsIHRyeSB0byBw
aWNrIHRoaXMgdXAgdG9tb3Jyb3cgYXMgSSBoZWxwZWQgZGlhZ25vc2UgdGhlIHByb2JsZW0gYmVp
bmcgZml4ZWQuDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCj4gDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QN
Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
