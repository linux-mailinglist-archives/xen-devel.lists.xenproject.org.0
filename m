Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFDF1B5A54
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 13:19:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZsU-0006jk-AW; Thu, 23 Apr 2020 11:18:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRZsT-0006jE-3i
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 11:18:45 +0000
X-Inumbo-ID: 3107219a-8554-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3107219a-8554-11ea-83d8-bc764e2007e4;
 Thu, 23 Apr 2020 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587640723;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uTqedBfjuCgoZc2oAIpg3CX8jDxZEotrsFLCb2Bk3k0=;
 b=UWddsB6wzpwdKdG5KpoZBOiTJmgEszz5iyxMwhgb5FjwMwPRT2ZQWYQ4
 mXLeBa2PjRTaYVhIWjny6y53HvBYoITwo+L/qZ9nmysUfTBy5CZ0DNpse
 gecDBiZaqrJ+WZBd6bfvL5O1/Z6v1XEJZLzAk9rSnDGNepgB2hvz87Y3n A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QgOmS+sABo5YH0YlVXxGV+YC8w2Di1UAuVssMC8OhOYUG2BWTOLFwKSa+whhjpRGoFnsl8DJLw
 8mrxgOq10JvouwTnxL3fRk9401khN9R3AG2/ip0ygEd46ILbXLYHZ8hEavj6OEgmtOUDDDk/w0
 jxT05CC/AxuS+BOQ8TaNOpW+El9e/37qrWC9gAS3UCCPe1gfoYbpxqydMTXWFSgzlJzM4AoPMo
 COd49Oj+j12blSaRrWOkok9ECewaFE6zt2qnUiWmxe7F+kZA2qM/D4wzyHDV1/GFPxMJTsfo8/
 1o0=
X-SBRS: 2.7
X-MesageID: 16437185
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16437185"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: Golang Xen packages and the golang packaging system
Thread-Topic: Golang Xen packages and the golang packaging system
Thread-Index: AQHWGNesUpUX4UDcFkSZQD1qmZkhVKiGbqmA
Date: Thu, 23 Apr 2020 11:18:40 +0000
Message-ID: <B47CC5BA-80C8-43D1-BDB3-25BCF4FDB78F@citrix.com>
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
 <CAEBZRSe=yB6Y1TQSQqAphDw8gVKm8VhpqEYsKXgVnZjvPNPUnQ@mail.gmail.com>
In-Reply-To: <CAEBZRSe=yB6Y1TQSQqAphDw8gVKm8VhpqEYsKXgVnZjvPNPUnQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C69E4833A71004D812832FF787A4C8B@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDIyLCAyMDIwLCBhdCA3OjU1IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+PiBPbmUgcXVlc3Rpb24gSSBoYXZlIGZyb20gdGhl
IGFib3ZlIGlzIGhvdyB0aGUgeGVuLmdpdCBSRUxFQVNFLVguWS5aIHNob3VsZCBjb3JyZXNwb25k
IHRvIHRoZSB2QS5CLkMgaW4gdGhlIGdvbGFuZyBwYWNrYWdlIHJlcG8uDQo+PiANCj4+IFRoZSBv
YnZpb3VzIGFuc3dlciwgb2YgY291cnNlLCBpcyAoQSwgQiwgQykgPSAoWCwgWSwgWik7IHRoYXQg
aXMsIHhlbi5naXQgdGFnIFJFTEVBU0UtNC4xNC4wIHNob3VsZCBjcmVhdGUgYSBnb2xhbmcgcGFj
a2FnZSB0YWcgb2YgdjQuMTQuMC4NCj4+IA0KPj4gVGhlIGlzc3VlIHdpdGggdGhpcyBpcyB0aGF0
IGdvbGFuZyBhc3N1bWVzIHlvdeKAmXJlIHVzaW5nIHNlbWFudGljIHZlcnNpb25pbmc7IHNvIGEg
YGdvIGdldCAtdWAgd291bGQgbm9ybWFsbHkgZmVlbCBqdXN0aWZpZWQgaW4gdXBncmFkaW5nIGZy
b20gdjQuMTQueCB0byB2NC4xNS54Lg0KPj4gDQo+PiBBIGNvdXBsZSBvZiBwb3NzaWJsZSByZXNw
b25zZXM6DQo+PiANCj4+IDEuIERlY2xhcmUgdGhhdCBPSy4gIFRoYXQgd291bGQgbWVhbiBub3Qg
b25seSB0aGF0IHdlIGhhdmUgdG8gaGF2ZSB2NC4xNS54IGJlIGNvbXBhdGlibGUgd2l0aCBnb2xh
bmcgc291cmNlIGNvZGUgd3JpdHRlbiBhZ2FpbnN0IHY0LjE0OyBpdCB3b3VsZCBhbHNvIG1lYW4g
dGhhdCB2NC4xNS54IG5lZWRzIHRvIGJlIGFibGUgdG8gKmNvbXBpbGUqIGFnYWluc3QgbGlieGwg
dmVyc2lvbiA0LjE0LiAgV2hpY2ggbWlnaHQgYmUgYSBnb29kIGlkZWEsIGJ1dCB3ZeKAmWQgd2Fu
dCB0byB0aGluayBjYXJlZnVsbHkgYmVmb3JlIG1ha2luZyB0aGF0IGtpbmQgb2YgY29tbWl0bWVu
dC4NCj4+IA0KPj4gMi4gRGVjbGFyZSB0aGF0IHBlb3BsZSBuZWVkIHRvIHVzZSBgZ28gZ2V0IC11
PXBhdGNoYCB3aGVuIHVwZGF0aW5nLCBhbmQvb3IgdXNlIGdvLm1vZCAmYyB0byBtYW51YWxseSBy
ZXN0cmljdCB0aGUgdmVyc2lvbiBvZiBnbyB0byB1c2UgdG8gdGhlIGN1cnJlbnRseS1pbnN0YWxs
ZWQgWGVuIHZlcnNpb24NCj4+IA0KPj4gMy4gTWFwIChBLCBCLCBDKSA9IChZLCBaLCAwKS4gIChp
LmUuLCBSRUxFQVNFLTQuMTQuNSB3b3VsZCBtYWtlIHRhZyB2MTQuNS4wIC4pICBgZ28gZ2V0YCB3
b3VsZG7igJl0IHVwZGF0ZSBhdXRvbWF0aWNhbGx5LCBidXQgaXQgbWlnaHQgYmUgY29uZnVzaW5n
IHdoaWNoIHZlcnNpb24gKnNob3VsZCogYmUgdXNlZDsgcGFydGljdWxhcmx5IGlmIHdlIGV2ZXIg
cm9sbCBvdmVyIGEgbWFqb3IgdmVyc2lvbiBmb3IgWGVuLg0KPj4gDQo+PiBBbnkgb3RoZXIgcG9z
c2liaWxpdGllcz8NCj4+IA0KPj4gSSB0aGluayBJ4oCZZCBzdGFydCBvdXQgd2l0aCAjMiwgYW5k
IHRoZW4gY29uc2lkZXIgbW92aW5nIHRvICMxIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZS4N
Cj4+IA0KPj4gVGhvdWdodHM/DQo+IA0KPiBXZSBzaG91bGQgYWxzbyBjb25zaWRlciBhbGlnbmlu
ZyB3aXRoIEdvIG1vZHVsZSB2ZXJzaW9uaW5nDQo+IGNvbnZlbnRpb25zLiBGb3IgZXhhbXBsZSwg
cmlnaHQgbm93IHRoZSBwYWNrYWdlIGlzIHVuc3RhYmxlLCBzbw0KPiBhY2NvcmRpbmcgdG8gY29u
dmVudGlvbiB3ZSBzaG91bGQgYmUgaW4gdjAuMS54LiBBICJ2MCIgaW5kaWNhdGVzIHRvDQo+IHRo
ZSBHbyBlY29zeXN0ZW0gdGhhdCwgYXQgdGhpcyBzdGFnZSwgd2Ugd2lsbCBsaWtlbHkgbWFrZSBi
cmVha2luZw0KPiBjaGFuZ2VzIHRvIHRoZSBwYWNrYWdlIEFQSS4gU28sIHRhZ2dpbmcgdjQuMTQu
MCBpcyBhIGJpdCBjb25mdXNpbmcNCj4gc2luY2UgdGhpcyBpbmRpY2F0ZXMgdGhhdCB3ZSBhcmUg
b24gdGhlIDR0aCBtYWpvciB2ZXJzaW9uIG9mIHRoZQ0KPiBwYWNrYWdlLCBhbmQgdGhhdCBpdCdz
IHN0YWJsZS4gU2VlIFsxXSBhbmQgWzJdIGZvciBtb3JlIG9uIHRoZXNlDQo+IGNvbnZlbnRpb25z
Lg0KPiANCj4gSG93ZXZlciwgdGhpbmdzIGFyZSBvYnZpb3VzbHkgY29tcGxpY2F0ZWQgYnkgdGhl
IGZhY3QgdGhhdCB0aGUNCj4geGVubGlnaHQgcGFja2FnZSBkZXBlbmRzIG9uIGxpYnhsLCBhbmQg
Zm9sbG93aW5nIGNvbnZlbnRpb24gbWlnaHQgbWFrZQ0KPiB0aGF0IHJlbGF0aW9uc2hpcCBsZXNz
IGNsZWFyIGFuZCBkaWZmaWN1bHQgdG8gdHJhY2suIEJ1dCwgaWYgd2Ugc3RyYXkNCj4gZnJvbSBj
b252ZW50aW9uIHdlIGF0IGxlYXN0IG5lZWQgdG8gYmUgY2xlYXIgYWJvdXQgaXQgYW5kIGhhdmUg
YSBnb29kDQo+IGV4cGxhbmF0aW9uIHdoeS4NCj4gDQo+IFRoYXQgc2FpZCwgdW5sZXNzIHdlIGNh
biBjb21lIHVwIHdpdGggYSBnb29kIHdheSB0byBmb2xsb3cgY29udmVudGlvbg0KPiAqYW5kKiBr
ZWVwIHRoZSBsaWJ4bCB2ZXJzaW9uIHNvcnRlZCwgSSB0aGluayAjMiBtYWtlcyB0aGUgbW9zdCBz
ZW5zZQ0KPiByaWdodCBub3cuDQoNClNvIHRoZSB3YXkgd2UgaGF2ZSB0aGluZ3MgcmlnaHQgbm93
LCBJIGRvbuKAmXQgdGhpbmsgIzEgaXMgYWN0dWFsbHkgcG9zc2libGU6IElmIHlvdSBoYXZlIFhl
biA0LjE0IGluc3RhbGxlZCwgYW5kIHlvdSB1cGRhdGUgdG8gYSA0LjE1IHZlcnNpb24gb2YgdGhl
IGdlbmVyYXRlZCBiaW5kaW5ncywgdGhlcmUgd2lsbCBiZSBsb2FkcyBvZiBjb2RlIHRyeWluZyB0
byBtYXJzaGFsIHN0cnVjdHVyYWwgZWxlbWVudHMgdGhhdCBkb27igJl0IGV4aXN0IHlldC4NCg0K
VW5sZXNzIHdlIGNhbiB0aGluayBvZiBhIGdvb2Qgd2F5IHRvIGhhdmUgYGdvIGJ1aWxkYCBkZXRl
Y3QgYXQgYnVpbGQtdGltZSB3aGF04oCZcyBhdmFpbGFibGUgYW5kIGNvbXBpbGUgdGhvc2Ugb3V0
LCB3ZeKAmXJlIGFsd2F5cyBnb2luZyB0byBuZWVkIGEgMS0xIGNvbm5lY3Rpb24gYmV0d2VlbiBn
b2xhbmcgeGVubGlnaHQgcGFja2FnZSBhbmQgdGhlIGluc3RhbGxlZCBYZW4gdmVyc2lvbiAodW5m
b3J0dW5hdGVseSkuDQoNCkhtbeKApiBvciwgY291bGQgd2UgYWN0dWFsbHkgdXNlIHRoZSByZWZs
ZWN0IHBhY2thZ2UgdG8gZGV0ZWN0IGl0IGF0IHJ1bnRpbWU/ICBUaGF04oCZcyBhbm5veWluZyBi
ZWNhdXNlIHlvdeKAmXJlIHN0aWxsIHN0dWNrIHVzaW5nIHRoZSBoZWFkZXJzIGNvbXBpbGVkIGlu
IGF0ICpjb21waWxlKiB0aW1lLg0KDQpUaGUgb3RoZXIgdGhpbmcgdG8gcG9pbnQgb3V0IGlzIHRo
YXQgd2UgY2FuIGFsd2F5cyBzdGFydCB3aXRoIDAueCBhbmQgdGhlbiBzd2l0Y2ggdG8gNC4xNCBp
ZiB3ZSB3YW50IHRvOyBidXQgZ29pbmcgdGhlIG90aGVyIHdheSBpcyBnb2luZyB0byBiZSBtb3Jl
IGRpZmZpY3VsdC4NCg0KSSBndWVzcyB3ZSBjb3VsZCBjYWxsIGl0IHYwLjQuMTQgZm9yIG5vdy4g
IElmIHdlIG1hbmFnZSB0byBtYWtlIGl0IGJhY2t3YXJkcy1hbmQtZm9yd2FyZHMtY29tcGF0aWJs
ZSwgd2UgY2FuIHJlbmFtZSBpdCB2MS4wOyBpZiB3ZSBkZWNpZGUgdG8gZ2l2ZSB1cCBvbiB0aGF0
IGlkZWEsIHdlIGNvdWxkIHJlbmFtZSB0aGVtIHY0LjE0LCB2NC4xNSwgJmMuDQoNCiAtR2Vvcmdl

