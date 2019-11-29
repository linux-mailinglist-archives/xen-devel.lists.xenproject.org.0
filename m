Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A085D10D06F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 02:53:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaVRS-0007cW-Im; Fri, 29 Nov 2019 01:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eJ48=ZV=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iaVRQ-0007cL-UX
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 01:51:28 +0000
X-Inumbo-ID: b5e963a0-124a-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5e963a0-124a-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574992268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dvXwHZySBmHOdhS+WEP9343A3DX5FkkP1OgHEKlhCNA=;
 b=dJ7p6o8vAmKRnG5h+uMxjvDyyNzrkZ1LJ5MRs5nbiwTGXJsXAn9a7rEx
 H1WVaBcH8T1pjG4vlBi6JxhjYvpQMd9uOXlusw21SvN0auiDNgid0z/r9
 gkh+GVjLDzlaorHllbgTkG8FqJktaCMgZoDQBopxzl/G110CcIb5sokN+ 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
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
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sVWnWrW6qUX1A0sc+Zb+wLrtSltH3GvRc/o1Y05/PO2HKDOYz+n6pqCqRs9wVTres0Uw3esDBZ
 9LMvm07tozc8VAkxXJf+w2aCCAgO9gctDzJ0EhmVudoRq/XLm75wm5f1iUvEVjwAfMz9wXl+nQ
 qxaDpAn1h3GPaBEfDRYf45piYUe3IilgopOCizcQvgOX17u3BHPpawzJ2VAsrPfIwgwvIfh5vL
 yDygOAH3TtNSccJ+t2jFd1cYoU3riiADrwCdjhJBOVAd48WnnQL6exMZ/Odz3X8Ou4FgrE3OgH
 G14=
X-SBRS: 2.7
X-MesageID: 8973721
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,255,1571716800"; 
   d="scan'208";a="8973721"
From: Lars Kurth <lars.kurth@citrix.com>
To: Rich Persaud <persaur@gmail.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
Thread-Index: AQHVdKIj+bIBaPEUGUyD9FYiIrE4J6egEqKAgACbQgCAAIb3AIAAG2qA
Date: Fri, 29 Nov 2019 01:50:59 +0000
Message-ID: <2DC43965-F2D4-4413-9CDB-EB52E8C218AA@citrix.com>
References: <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
 <10E1B547-180B-4620-9E4A-62C5B0DB2B93@gmail.com>
In-Reply-To: <10E1B547-180B-4620-9E4A-62C5B0DB2B93@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <817B101C0B53DE488DCF9D091D64143D@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI4LzExLzIwMTksIDEyOjEyLCAiUmljaCBQZXJzYXVkIiA8cGVyc2F1ckBnbWFp
bC5jb20+IHdyb3RlOg0KDQogICAgT24gTm92IDI4LCAyMDE5LCBhdCAwNToxMiwgSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gT24gMjguMTEuMjAx
OSAwMTo1NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KICAgID4+PiBPbiBUaHUsIDI2IFNl
cCAyMDE5LCBMYXJzIEt1cnRoIHdyb3RlOg0KICAgID4+PiBGcm9tOiBMYXJzIEt1cnRoIDxsYXJz
Lmt1cnRoQGNpdHJpeC5jb20+DQogICAgPj4+IA0KICAgID4+PiBUaGlzIGRvY3VtZW50IGhpZ2hs
aWdodHMgd2hhdCByZXZpZXdlcnMgc3VjaCBhcyBtYWludGFpbmVycyBhbmQgY29tbWl0dGVycyBs
b29rDQogICAgPj4+IGZvciB3aGVuIHJldmlld2luZyBjb2RlLiBJdCBzZXRzIGV4cGVjdGF0aW9u
cyBmb3IgY29kZSBhdXRob3JzIGFuZCBwcm92aWRlcw0KICAgID4+PiBhIGZyYW1ld29yayBmb3Ig
Y29kZSByZXZpZXdlcnMuDQogICAgPj4gDQogICAgPj4gSSB0aGluayB0aGUgZG9jdW1lbnQgaXMg
bWlzc2luZyBhIGNvdXBsZSBvZiB0aGluZ3M6DQogICAgPj4gDQogICAgPj4gLSBhIHNpbXBsZSBv
bmUgbGluZSBzdGF0ZW1lbnQgdGhhdCBwb3NzaWJseSB0aGUgbW9zdCBpbXBvcnRhbnQgdGhpbmcg
aW4NCiAgICA+PiAgYSBjb2RlIHJldmlldyBpcyB0byBpbmRlbnRpZnkgYW55IGJ1Z3MgaW4gdGhl
IGNvZGUNCiAgICA+PiANCiAgICA+PiAtIGFuIGV4cGxhbmF0aW9uIHRoYXQgcmVxdWVzdHMgZm9y
IG1ham9yIGNoYW5nZXMgdG8gdGhlIHNlcmllcyBzaG91bGQgYmUNCiAgICA+PiAgbWFkZSBlYXJs
eSBvbiAoaS5lLiBsZXQncyBub3QgY2hhbmdlIHRoZSBhcmNoaXRlY3R1cmUgb2YgYSBmZWF0dXJl
IGF0DQogICAgPj4gIHY5IGlmIHBvc3NpYmxlKSBJIGFsc28gbWFkZSB0aGlzIGNvbW1lbnQgaW4g
cmVwbHkgdG8gcGF0Y2ggIzUuIEknbGwNCiAgICA+PiAgbGV0IHlvdSBkZWNpZGUgd2hlcmUgaXMg
dGhlIGJlc3QgcGxhY2UgZm9yIGl0Lg0KICAgID4gDQogICAgPiBUaGlzIG5lZWRzIGJhbGFuY2lu
Zy4gUGVvcGxlIGNydWNpYWwgdG8gdGhlIGV2YWx1YXRpb24gb2YgYSBuZXcNCiAgICA+IGZlYXR1
cmUgYW5kIGl0cyBpbXBsZW1lbnRhdGlvbiBzaW1wbHkgbWF5IG5vdCBoYXZlIHRoZSB0aW1lIHRv
DQogICAgPiByZXBseSBwcmlvciB0byB2OS4gV2UndmUgaGFkIHNpdHVhdGlvbnMgd2hlcmUgcGVv
cGxlIHBvc3RlZCBuZXcNCiAgICA+IHJldmlzaW9ucyBldmVyeSBvdGhlciBkYXksIHNvbWV0aW1l
cyBldmVuIG1vcmUgdGhhbiBvbmUgcGVyIGRheS4NCiAgICA+IA0KICAgID4gQXMgaW5kaWNhdGVk
IGluIHNldmVyYWwgb3RoZXIgY29udGV4dHMgYmVmb3JlIC0gaW1vIHBlb3BsZSBub3QNCiAgICA+
IGhlbHBpbmcgdG8gc2hvdWxkZXIgdGhlIHJldmlldyBsb2FkIHNob3VsZCBhbHNvIG5vdCBoYXZl
IHRoZQ0KICAgID4gZXhwZWN0YXRpb24gdGhhdCB0aGVpciAobGFyZ2UpIGNvbnRyaWJ1dGlvbnMg
d2lsbCBiZSBsb29rZWQgYXQNCiAgICA+IGluIGR1ZSBjb3Vyc2UuIA0KICAgIA0KICAgIFRvIG1h
a2UgdGhpcyBhY3Rpb25hYmxlLCB3ZSBjb3VsZCBoYXZlOg0KICAgIA0KICAgIC0gcmV2aWV3ZXIg
ZGVtYW5kIGluZGV4OiAgYXV0b21hdGVkIGluZGV4IG9mIG9wZW4gcGF0Y2hlcyBzdGlsbCBpbiBu
ZWVkIG9mIHJldmlldywgc29ydGVkIGJ5IGRlY3JlYXNpbmcgYWdlDQogICAgDQogICAgLSByZXZp
ZXcgZmxvdyBjb250cm9sOiAgZWFjaCBuZXcgcGF0Y2ggc3VibWlzc2lvbiBjaXRlcyBvbmUgcmVj
ZW50IHJldmlldyBieSB0aGUgcGF0Y2ggc3VibWl0dGVyLCBmb3IgYSBwYXRjaCBvZiBjb21wYXJh
YmxlIHNpemUNCiAgICANCiAgICAtIHJldmlld2VyIHN1cHBseSBncm93dGg6ICBhIGJvb3RzdHJh
cHBpbmcgZ3VpZGUgZm9yIG5ldyByZXZpZXdlcnMgYW5kIHN1Ym1pdHRlcnMsIHdpdGggcGF0dGVy
bnMsIGFudGktcGF0dGVybnMsIGFuZCBleGFtcGxlcyB0byBiZSBlbXVsYXRlZA0KICAgIA0KVGhh
dCBpcyBhIGdyZWF0IGlkZWEuIEhvd2V2ZXIsIEkgd291bGQgbm90IHdhbnQgdG8gaG9sZCB1cCB0
aGUgcHVibGljYXRpb24gb2YgdGhlc2UgZG9jdW1lbnRzIG9uIHRoZXNlIHN1Z2dlc3Rpb25zLiBT
b21lIG9mIHRoZW0gd291bGQgcmVxdWlyZSBpbXBsZW1lbnRpbmcgdG9vbHMuIEkgd2FzIGhvcGlu
ZyB0aGVyZSB3b3VsZCBiZSBtb3JlIHByb2dyZXNzIG9uIGxvcmUgYW5kIG90aGVycyB0b29saW5n
L3dvcmtmbG93IHJlbGF0ZWQgc3R1ZmYgYnkgbm93LiBTbyBJIHRoaW5rIGZvciBub3csIEkgdGhp
bmsgaXQgaXMgc3VmZmljaWVudCB0byBzZXQgZXhwZWN0YXRpb25zIGJldHRlci4NCg0KUmVnYXJk
cw0KTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
