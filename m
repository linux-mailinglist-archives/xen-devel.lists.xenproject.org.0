Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6A25CFE9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 14:59:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiILM-0007Jz-1E; Tue, 02 Jul 2019 12:57:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiILK-0007Ju-3M
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 12:57:06 +0000
X-Inumbo-ID: e29b1562-9cc8-11e9-a387-5fdfcf2c735a
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e29b1562-9cc8-11e9-a387-5fdfcf2c735a;
 Tue, 02 Jul 2019 12:57:02 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y5SA1qUlHEkDi/xHm0I3AW5rzNC4b7BHMjueGA3XDZsvQA71jTPn2swtnFiWZZLt6u4F5s2mmg
 Oe72RztyQBVBt80w/Q2imbFfQqwAJ97vp3IgUFWWpYmuRZgdZMJQ/Kl/4UWK6iozi86Ubg/E6t
 I/d/JEG4/nA8GbR9bxmMkC21kbVwaamB1xUsKbz6wrs53fxOY2MQaDjwqfBT9rcoX6NnNZwqk7
 vAEDBoMtK+81i56K0TWPbaku0Iz5S+h6nH8VztzRDQMrQRPApKVH0moqUQmiszSBQBkRlUVc38
 q9M=
X-SBRS: 2.7
X-MesageID: 2488355
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; 
   d="scan'208";a="2488355"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 5/6] x86emul: support INVPCID
Thread-Index: AQHVMASpqU/8yDzXkU2hL/Q+xA10Paa3Sl+A
Date: Tue, 2 Jul 2019 12:54:51 +0000
Message-ID: <c8ddc2b05f88460aa94da91b72ce876a@AMSPEX02CL03.citrite.net>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <61bcef1a-aa70-067f-b2a4-06580b00fe40@suse.com>
In-Reply-To: <61bcef1a-aa70-067f-b2a4-06580b00fe40@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/6] x86emul: support INVPCID
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAxIEp1bHkgMjAxOSAxMjo1OA0KPiBUbzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IFJv
Z2VyIFBhdSBNb25uZQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBbUEFUQ0ggNS82XSB4ODZlbXVsOiBzdXBwb3J0IElOVlBDSUQNCj4g
DQo+IEp1c3QgbGlrZSBmb3IgSU5WTFBHQSB0aGUgSFZNIGhvb2sgb25seSBzdXBwb3J0cyBQQ0lE
IDAgZm9yIHRoZSB0aW1lDQo+IGJlaW5nIGZvciBpbmRpdmlkdWFsIGFkZHJlc3MgaW52YWxpZGF0
aW9uLiBJdCBhbHNvIHRyYW5zbGF0ZXMgdGhlIG90aGVyDQo+IHR5cGVzIHRvIGEgZnVsbCBmbHVz
aCwgd2hpY2ggaXMgYXJjaGl0ZWN0dXJhbGx5IHBlcm1pdHRlZCBhbmQNCj4gcGVyZm9ybWFuY2Ut
d2lzZSBwcmVzdW1hYmx5IG5vdCBtdWNoIHdvcnNlIGJlY2F1c2UgZW11bGF0aW9uIGlzIHNsb3cN
Cj4gYW55d2F5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpodm0vZW11bGF0ZSBiaXRzLi4uDQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
