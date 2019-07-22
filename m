Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89196FB3E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:24:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTYo-0002NT-Sw; Mon, 22 Jul 2019 08:20:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VRc=VT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpTYn-0002NO-Kf
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:20:41 +0000
X-Inumbo-ID: 96bf368c-ac59-11e9-ab45-4325b2ed1d69
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96bf368c-ac59-11e9-ab45-4325b2ed1d69;
 Mon, 22 Jul 2019 08:20:39 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BEQaF9bF+ci0qpogOAoYWHBOjSTJNGTMH5IqayK11qh9WBpoBwGtfdLsHigbKsEvTzUolKdPtw
 /ruyeAo5j7f9GyEypT35v6VMEh/u2D8WPIk49vTjqeIZeoA7oIZf/P06jQM5Q6iGmel+t+mZw2
 LGwU9JA3OagqZdPtJwN3Z5mst1vGFQgUEgCCRW2Uxyi8QqO+GNgKqOZU9AyPJVY91ZYHMYkiFP
 nmTQxfvDmdOgVlew++5plQLQn8MAKb2MKZN5Ymje5sbfZiPyDyANzuYCVJsg+ujAsncKp9q/ka
 Dog=
X-SBRS: 2.7
X-MesageID: 3363539
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,294,1559534400"; 
   d="scan'208";a="3363539"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Roman Shaposhnik' <roman@zededa.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVPmzkQranvSB3QkuFJWZsoolqxKbWTmUw
Date: Mon, 22 Jul 2019 08:20:36 +0000
Message-ID: <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
In-Reply-To: <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4gKFhFTikgRG9tYWluIGhl
YXAgaW5pdGlhbGlzZWQNCj4gPiAoWEVOKSBBQ1BJOiAzMi82NFggRkFDUyBhZGRyZXNzIG1pc21h
dGNoIGluIEZBRFQgLQ0KPiA+IDhjZThlZjgwLzAwMDAwMDAwMDAwMDAwMDAsIHVzaW5nIDMyDQo+
ID4gKFhFTikgSU9BUElDWzBdOiBhcGljX2lkIDIsIHZlcnNpb24gMzIsIGFkZHJlc3MgMHhmZWMw
MDAwMCwgR1NJIDAtMTE5DQo+ID4gKFhFTikgRW5hYmxpbmcgQVBJQyBtb2RlOiAgRmxhdC4gIFVz
aW5nIDEgSS9PIEFQSUNzDQo+ID4gKFhFTikgW1ZULURdICBSTVJSIGFkZHJlc3MgcmFuZ2UgOGQ4
MDAwMDAuLjhmZmZmZmZmIG5vdCBpbiByZXNlcnZlZA0KPiA+IG1lbW9yeTsgbmVlZCAiaW9tbXVf
aW5jbHVzaXZlX21hcHBpbmc9MSI/DQoNClRoaXMgaXMgeW91ciBwcm9ibGVtLiBJbiB2ZXJzaW9u
cyBwcmlvciB0byA0LjExIChJIHRoaW5rLCBhbmQgY2VydGFpbmx5IDQuMTIpIGlvbW11X2luY2x1
c2l2ZV9tYXBwaW5nIHVzZWQgdG8gZGVmYXVsdCBvbiwgd2hlcmVhcyBub3cgaXQgYXBwZWFycyB0
byBkZWZhdWx0IG9mZi4gSW4gbW9zdCBjaXJjdW1zdGFuY2VzIHRoaXMgaXMgZmluZSBiZWNhdXNl
IHRoZXJlIGlzIGEgbmV3IGZsYWcsIGlvbW11X2h3ZG9tX3Jlc2VydmVkLCB3aGljaCBkZWZhdWx0
cyBvbiBhbmQgdGhpcyBtYWtlcyBzdXJlIHRoYXQgYWxsIGU4MjAgcmVzZXJ2ZWQgcmVnaW9ucyBh
cmUgaWRlbnRpdHkgbWFwcGVkICh3aGljaCB1c3VhbGx5IGNvdmVycyB1bmRlY2xhcmVkIFJNUlJz
KS4gWW91IGhhdmUgdGhlIG9wcG9zaXRlIHByb2JsZW0uLi4gYSBkZWNsYXJlZCBSTVJSIHdoaWNo
IGlzIG5vdCByZXNlcnZlZCwgc28geW91IHdpbGwgbmVlZCBpb21tdV9pbmNsdXNpdmVfbWFwcGlu
Zy4NCg0KICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
