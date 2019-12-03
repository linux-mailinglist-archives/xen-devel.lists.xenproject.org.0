Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0D10FAAB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 10:21:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic4JO-0006IN-KX; Tue, 03 Dec 2019 09:17:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X1Vu=ZZ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ic4JN-0006II-B5
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 09:17:37 +0000
X-Inumbo-ID: be467496-15ad-11ea-81d5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be467496-15ad-11ea-81d5-12813bfff9fa;
 Tue, 03 Dec 2019 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575364655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=497NkfbobK6GQlAdtxHcuO4dBwrdpUxq1vMFz+V80Zk=;
 b=OUb/CrzrqPqvKrUetrTfnjSblJnrtMEdIn0Xz1IGh+X7eNwEJy3uQ7Vd
 Z5ACD+kVkEJ1ms/PqyzYKCrrudBIE5IoPR7TlV2iaG6UdLf1CFmKY/XQ7
 yb8icmka0aex74JPBbSkegFGezTG3/jApGuwXXzoKyJrOVK9hzj3aaYHO k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XFuNBBY2Jr2prR9H3CaZDxOYxlnq+m5va6tlziljsixAChVjEwS2LTqDkeTYXtBk8ACCsr9kAN
 iaSIXVJouSgd0jZo76P3glLJdZ71AhXN/AIl1hlioe0yE6JHMVQOddh+BztWAQiLzaeJLI9F0c
 58voWA/tONCIKzJTo+lel3bet35HeIXZ5Y/nSHId22ZUfVuWxP6de0EioLPKt4n0kt0Ept0wmD
 LEFYI7qZ+UO114QJ1FiXWx2oeshu9qYXc3urX6qDeJpIgv61SY0XxQOuXe1r/2M7RMkarALpoQ
 YYo=
X-SBRS: 2.7
X-MesageID: 9514094
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,272,1571716800"; 
   d="scan'208";a="9514094"
From: George Dunlap <George.Dunlap@citrix.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH for-4.13] clang: do not enable live-patching support
Thread-Index: AQHVpTvnnE0Et3/W80CjE48mVSpwQaefIEoAgAACCYCAAAEPAIAAArEAgAACGACAB83kAIAAAG4AgAASg4CAARCsgA==
Date: Tue, 3 Dec 2019 09:17:15 +0000
Message-ID: <FD2CFC15-D051-4D3D-A878-66D31E6A1F9C@citrix.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
 <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
 <9154ab98-8bb7-d8c7-5310-61c865040ed4@citrix.com>
 <55667545-7298-e4ef-8022-ca3c05009719@suse.com>
 <aac11d8f-7945-1126-e5f8-9cacaef69614@suse.com>
 <5d59c68c-6246-9ece-a786-a9d0647b34b9@citrix.com>
 <20191202155332.GA17893@char.us.oracle.com>
 <db8386cf-1309-b24a-59a8-e0bd96f3749d@citrix.com>
 <20191202170119.GA18997@char.us.oracle.com>
In-Reply-To: <20191202170119.GA18997@char.us.oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <0FE15642E0EDE84BADEC5ABD0F21ED86@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gRGVjIDIsIDIwMTksIGF0IDU6MDEgUE0sIEtvbnJhZCBSemVzenV0ZWsgV2lsayA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIERlYyAwMiwgMjAx
OSBhdCAwMzo1NTowNFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMDIvMTIv
MjAxOSAxNTo1MywgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOg0KPj4+Pj4gSSBwbGFuIHRv
IHJlbGVhc2UgYWNrIHRoZSBwYXRjaCBpbiBjYXNlIHRoZSBtaXNzaW5nIG1haW50YWluZXIncyBh
Y2tzDQo+Pj4+PiBhcmUgbm90IGNvbWluZyBpbiB0b28gbGF0ZS4NCj4+Pj4gSSB0aGluayBBbmR5
J3Mgb2JqZWN0aW9uIHdhcyB0aGF0IHRoZXJlIGhhcyBiZWVuIHplcm8gdGVzdGluZyBvZg0KPj4+
PiBsaXZlcGF0Y2hpbmcgb24gZ2NjLiAgTWF5YmUgd2UgY2FuIGZpbmQgc29tZW9uZSB0byBkbyBh
IHNtb2tlLXRlc3QuDQo+Pj4gQXMgaW4gaW50ZWdyYXRlIGxpdmVwYXRjaC1idWlsZCB0b29scyBp
biBvc3N0ZXN0IHNtb2tlLXRlc3RzPw0KPj4+IEJlY2F1c2UgdGhlIGxpdmVwYXRjaCB0ZXN0IGNh
c2VzIGFyZSBpbiBvc3N0ZXN0LCB1bmxlc3Mgc29tZXRoaW5nIHdlbnQgYXdyeT8NCj4+IA0KPj4g
VGhlIHN1bSB0b3RhbCBvZiBsaXZlcGF0Y2ggdGVzdGluZyBpbiBPU1NUZXN0IGlzIHVzaW5nIHRo
ZSBoYW5kLWNvZGVkDQo+PiBFTEYgb2JqZWN0cyBmcm9tIHRoZSB0ZXN0cy8gZGlyZWN0b3J5Lg0K
Pj4gDQo+PiBUaGlzIGlzIHBlcmhhcHMgb2sgZm9yIHRoZSBiYXNpYyBtZWNoYW5pc20sIGJ1dCBp
dHMgbm90IHJlcHJlc2VudGF0aXZlDQo+PiBvZiBhY3R1YWxseSBidWlsZGluZyByZWFsIGxpdmVw
YXRjaGVzIHVzaW5nIGxpdmVwYXRjaCBidWlsZCB0b29scy4NCj4gDQo+IFRydWUuIEJ1dCBpdCB0
ZXN0cyB0aGUgX2h5cGVydmlzb3JfIGxpdmVwYXRjaCBjb2RlLg0KPiANCj4gSSBhbSB0aGlua2lu
ZyB0aGF0IHRoaXMgZGlzY3Vzc2lvbiBhYm91dCAib2gsIGJ1dCBsaXZlcGF0Y2gtYnVpbGQgdG9v
bHMgZG9uJ3Qgd29yayBiL2MiDQo+IGlzIHdlbGwgPHNocnVnPiBzdWNrcyBidXQgc2hvdWxkIG5l
dmVyIGJsb2NrIGFuIHJlbGVhc2UgYXMgdGhlIGNvcmUNCj4gbGl2ZXBhdGNoIGZ1bmN0aW9uYWxp
dHkgaXMgT0suDQoNCkkgdGhpbmsgYSBwYXJhbGxlbCBpcyBpZiBYZW4gZG9lc27igJl0IGJ1aWxk
IHdpdGggYSBwYXJ0aWN1bGFyIHZlcnNpb24gb2YgdGhlIGNvbXBpbGVyLCBvciBjYW7igJl0IGJ1
aWxkIG9uIGEgcGFydGljdWxhciBkaXN0cm8gZm9yIHNvbWUgcmVhc29uLiAgV2Ugc2hvdWxkIGNl
cnRhaW5seSAqdHJ5KiB0byBtYWtlIHRoaW5ncyB3b3JrIHdpdGggb3RoZXIgcHJvamVjdHMsIGJ1
dCBpZiB0aGUgaXNzdWUgaXMgY2xlYXJseSB3aXRoIHRoZSBvdGhlciBwcm9qZWN0LCB3ZSBzaG91
bGRu4oCZdCBoYXZlIHRvIGJsb2NrIHRvIHdhaXQgZm9yIHRoYXQgb3RoZXIgcHJvamVjdCB0byBn
ZXQgdGhpbmdzIHNvcnRlZCBvdXQuDQoNCi1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
