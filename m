Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09710C0D7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 00:55:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia75f-0003Tu-3v; Wed, 27 Nov 2019 23:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v+m/=ZT=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ia75e-0003Tp-KE
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 23:51:22 +0000
X-Inumbo-ID: cfc0e06c-1170-11ea-83b8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfc0e06c-1170-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 23:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574898681;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=a/Jvd9Hg3jOoOV5ovPDZ7amJoOkb2kWyvM35t//LN8A=;
 b=KxKXbKM4GNizljD7rurcGsXugfolhzNh9kyD5u5n5KtDcZhcrk4cxC56
 IgK8dub97qWjkEFFvLRfeE37KToitYbAkXUsf1wXcVAUbXSOEgSo3UM18
 rwDQLCVdsQTcJDuycQMenBRr20c4MTLy8V9C+qoejvmLIzBvHzdOmZDde Y=;
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
IronPort-SDR: tIDfyJd3Yreq04TM2hCqmlkK7AS9fzN7e598HMN6HVqvymXbr+EIQLXV78C+j+15PrmuzaU9ay
 8dIfN/tgzwj3gyJ+0JGfiA+lMq2jdDIAiKgowid0bTfpIqRO09Rv0SY0qpaeERpZf7WP0usH0G
 FQ9gjr/hrQsxCuohpJfpqKXK+/c46VlADYuRb2v17NpSVFsEgdtBMrVfjJY5NmywMp/EnhKW7u
 XHdFhmzW/Uh2gV6g37pYLwpC5w2mLtdyRxoNhuOkSe00iWN2TTXDO3Xp9j4Qwk5fgaYbKNCIL3
 z9E=
X-SBRS: 2.7
X-MesageID: 8936899
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,251,1571716800"; 
   d="scan'208";a="8936899"
From: Lars Kurth <lars.kurth@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien.grall.oss@gmail.com>
Thread-Topic: [Xen-devel] getting 4.11.3 ready
Thread-Index: AQHVix9HteYRXzFI4UOuSppn2iUrG6dwMKQAgABZxICAARltgIAARi4AgC2FhIA=
Date: Wed, 27 Nov 2019 23:51:17 +0000
Message-ID: <1ABB90E8-FBE7-4DDF-923D-0A912B58A720@citrix.com>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
 <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
 <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
 <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
 <alpine.DEB.2.21.1910291141100.29150@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1910291141100.29150@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <FD2DAE8ED890704495380215CE7B9E93@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI5LzEwLzIwMTksIDEyOjQxLCAiU3RlZmFubyBTdGFiZWxsaW5pIiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIDI5IE9jdCAyMDE5LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQogICAgPiBPbiAyOC8xMC8yMDE5IDIxOjQzLCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6DQogICAgPiA+IE9uIE1vbiwgMjggT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3
cm90ZToNCiAgICA+ID4+IEhpLA0KICAgID4gPj4NCiAgICA+ID4+IE9uIDI1LzEwLzIwMTkgMTE6
MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KICAgID4gPj4+IEFsbCwNCiAgICA+ID4+Pg0KICAgID4g
Pj4+IHRoZSA0LjExLjMgc3RhYmxlIHJlbGVhc2UgaXMgZHVlLiBJIGludGVuZCB0byB3YWl0IGZv
ciB0aGUgWFNBIGZpeGVzDQogICAgPiA+Pj4gZ29pbmcgcHVibGljIG9uIHRoZSAzMXN0LCBidXQg
bm90IChtdWNoKSBsb25nZXIuIFBsZWFzZSBwb2ludCBvdXQNCiAgICA+ID4+PiBiYWNrcG9ydGlu
ZyBjYW5kaWRhdGVzIHRoYXQgeW91IGZpbmQgbWlzc2luZyBmcm9tIHRoZSByZXNwZWN0aXZlDQog
ICAgPiA+Pj4gc3RhYmxlIHRyZWVzLiBJIGhhdmUgdGhyZWUgb25lcyBxdWV1ZWQgd2hpY2ggaGF2
ZW4ndCBwYXNzZWQgdGhlIHB1c2gNCiAgICA+ID4+PiBnYXRlIHRvIHRoZSBtYXN0ZXIgYnJhbmNo
IHlldDoNCiAgICA+ID4+Pg0KICAgID4gPj4+IDkyNTdjMjE4ZTUJeDg2L3Z2bXg6IEZpeCB0aGUg
dXNlIG9mIFJEVFNDUCB3aGVuIGl0IGlzIGludGVyY2VwdGVkIGF0IEwwDQogICAgPiA+Pj4gN2Vl
ZTljMTZkNgl4ODYvdHNjOiB1cGRhdGUgdmNwdSB0aW1lIGluZm8gb24gZ3Vlc3QgVFNDIGFkanVz
dG1lbnRzDQogICAgPiA+Pj4gOTYzMzkyOTgyNAl4ODY6IGZpeCBvZmYtYnktb25lIGluIGlzX3hl
bl9maXhlZF9tZm4oKQ0KICAgID4gPj4NCiAgICA+ID4+IFdlIGRvbid0IHNlZW0gdG8gaGF2ZSBi
YWNrcG9ydGVkIHBhdGNoZXMgZm9yIHF1aXRlIGEgd2hpbGUgb24gQXJtLiBTb21lIG9mIG15DQog
ICAgPiA+PiBwYXRjaGVzIGhhdmUgYmVlbiBtYXJrZWQgYXMgdG8gYmUgYmFja3BvcnRlZCBmcm9t
IHRoZSBiZWdpbm5pbmcgWzFdLiBJIGFtDQogICAgPiA+PiBzcGVjaWZpY2FsbHkgdGhpbmtpbmcg
dG86DQogICAgPiA+PiAJDQogICAgPiA+PiBlMDQ4MThiNDZkIHhlbi9hcm06IHRyYXBzOiBBdm9p
ZCB1c2luZyBCVUdfT04oKSB0byBjaGVjayBndWVzdCBzdGF0ZSBpbg0KICAgID4gPj4gYWR2YW5j
ZV9wYygpDQogICAgPiANCiAgICA+IFVyZ2gsIEkgZ2F2ZSB0aGUgY29ycmVjdCB0aXRsZSBidXQg
dGhlIHdyb25nIGNvbW1pdCBzaGExLiBJdCBzaG91bGQgYmUgDQogICAgPiANCiAgICA+IDcyNjE1
ZjJlNmI5OGU4NjFjMDhhYmIxZDJiMTk0MTI2MDEzZDU0ZmUNCiAgICA+IA0KICAgID4gPiANCiAg
ICA+ID4gSSBoYXZlIGUwNDgxOGI0NmQsIHBsdXMgdGhlIGZvbGxvd2luZyBtYXJrZWQgZm9yIGJh
Y2twb3J0Og0KICAgID4gPiANCiAgICA+ID4gZTk4ZWRjY2I5NDRhODBkYjc4MmU1NTFmMzA5MDYy
OGU2NmM3ZmI1MiB4ZW4vYXJtOiBTQ1RMUl9FTDEgaXMgYSA2NC1iaXQgcmVnaXN0ZXIgb24gQXJt
NjQNCiAgICA+IA0KICAgID4gVGhlcmUgYXJlIG1vcmUgdGhhbiB0aGF0IHRvIGJhY2twb3J0Og0K
ICAgID4gDQogICAgPiAzMGY1MDQ3YjJjNGU1Nzc0MzZiNTA1YmE3NjI3ZjM0YzNiZTAyMDE0ICAg
IHhlbi9hcm06IGdpYzogTWFrZSBzdXJlIHRoZSBudW1iZXIgb2YgaW50ZXJydXB0IGxpbmVzIGlz
IHZhbGlkIGJlZm9yZSB1c2luZyBpdCAgWzQuMTFdDQogICAgPiA4YWEyNzYyMzViOTNlZWI0Zjgx
MDk1YzYzODk3MDkwMGUxOWIzMWU1ICAgIHhlbi9hcm06IGlycTogRW5kIGNsZWFubHkgc3B1cmlv
dXMgaW50ZXJydXB0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTFdDQog
ICAgPiBiNGRmNzNkZTQ5Mzk1NGM0NGYyNDBmNzg3NzljOWJkMzc4MmUxNTcyICAgIHhlbi9hcm06
IGdpYy12MjogZGVhY3RpdmF0ZSBpbnRlcnJ1cHRzIGR1cmluZyBpbml0aWFsaXphdGlvbiAgICAg
ICAgICAgICAgICAgICAgWzQuMTFdDQogICAgPiAwMzIyZTBkYjViMjlhMGQxY2U0YjQ1Mjg4NWUz
NDAyM2UzYTRiMDBlICAgIGFybTogZ2ljLXYzOiBkZWFjdGl2YXRlIGludGVycnVwdHMgZHVyaW5n
IGluaXRpYWxpemF0aW9uICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTFdDQogICAgPiANCiAg
ICA+IDViYTFjNWQwNjQxY2Y2MzA4NmIzMDU4ZTU0N2ZjZDI4YzNjNGEwMTEgICAgeGVuL2FybTog
bWVtYWNjZXNzOiBJbml0aWFsaXplIGNvcnJlY3RseSAqYWNjZXNzIGluIF9fcDJtX2dldF9tZW1f
YWNjZXNzICAgICAgICBbNC4xMl0NCiAgICA+IDA3ZTQ0YjNkMWJlMzJmYTIxNjVjMjM2N2FlM2Vm
OWM2YzhiMzllMWUgICAgeGVuL2FybTogSW1wbGVtZW50IHdvcmthcm91bmQgZm9yIENvcnRleCBB
LTU3IGFuZCBDb3J0ZXggQTcyIEFUIHNwZWN1bGF0ZSAgICAgICBbNC4xMl0NCiAgICA+IA0KICAg
ID4gMDhlMjA1OWZhY2Q3OGQ1ZmZhZjIwNmJhMDZhYzIwMTdjNGFkZWVkNCAgICB4ZW4vYXJtOiBz
ZXR1cDogQ2FsY3VsYXRlIGNvcnJlY3RseSB0aGUgc2l6ZSBvZiBYZW4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFs0LjExK10NCiAgICA+IDhkYmE5YTgxZTdjNjJiOGE3ZGJlMDIzZmZmZWNk
MmUxNmNjMjA0ODYgICAgeGVuL2FybTogRG9uJ3QgdXNlIF9lbmQgaW4gaXNfeGVuX2ZpeGVkX21m
bigpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbNC4xMStdDQogICAgPiA2NzE4
Nzg3Nzk3NDFiMzhjNWYyMzYzYWRjZWVmOGRlMmNlMGIzOTQ1ICAgIHhlbi9hcm06IHAybTogRnJl
ZSB0aGUgcDJtIGVudHJ5IGFmdGVyIGZsdXNoaW5nIHRoZSBJT01NVSBUTEJzICAgICAgICAgICAg
ICAgICAgWzQuMTErXQ0KICAgID4gN2Y0MjE3Y2M2MDU3NDg2NmNiOTBkNjdkOTc1MDIyOGM2Yjg2
YzkxZSAgICB4ZW4vYXJtOiB2c21jOiBUaGUgZnVuY3Rpb24gaWRlbnRpZmllciBpcyBhbHdheXMg
MzItYml0ICAgICAgICAgICAgICAgICAgICAgICAgIFs0LjExK10NCiAgICA+IDYxMmQ0NzZlNzRh
MzE0YmU1MTRlZTZhOTc0NGVlYThkYjA5ZDMyZTUgICAgeGVuL2FybTY0OiBDb3JyZWN0bHkgY29t
cHV0ZSB0aGUgdmlydHVhbCBhZGRyZXNzIGluIG1hZGRyX3RvX3ZpcnQoKSAgICAgICAgICAgICBb
NC4xMStdDQogICAgPiBmNTEwMjdiZTA2ODg1NDBhYWFiNjE1MTNiMDZhODY5M2EzN2U0YzAwICAg
IHhlbi9hcm06IGZpeCBucl9wZHhzIGNhbGN1bGF0aW9uICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWzQuMTErXQ0KICAgID4gYTE4OWVmMDI3ZGJiN2EzYzBk
ZmU1NjYxMzdmMDVjMDZkNjY4NWZiOSAgICB4ZW4vYXJtOiBtbTogRmx1c2ggdGhlIFRMQnMgZXZl
biBpZiBhIG1hcHBpbmcgZmFpbGVkIGluIGNyZWF0ZV94ZW5fZW50cmllcyAgICAgIFs0LjExK10N
CiAgICANCiAgICBUaGV5IGFsbCBtYWtlIHNlbnNlLCBJIGRpZCB0aGUgYmFja3BvcnRzLCBidWls
ZGluZyBlYWNoIGNvbW1pdA0KICAgIGluZGl2aWR1YWxseS4NCiAgICANCkphbiwgQUZBSUNUIHRo
aXMgaXMgbm90IHlldCByZWFkeSB0byBydW4gdGhlIFhTQSBjaGVja2luZyB0b29scy4NCkxldCBt
ZSBrbm93IHdoZW4geW91IHRoaW5rIEkgc2hvdWxkIHJ1biB0aGVtDQpMYXJzDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
