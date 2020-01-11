Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D812137C80
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2020 10:05:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqCfO-0003fK-Jq; Sat, 11 Jan 2020 09:02:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BWeW=3A=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iqCfN-0003fF-S4
 for xen-devel@lists.xen.org; Sat, 11 Jan 2020 09:02:45 +0000
X-Inumbo-ID: 20d20e92-3451-11ea-8006-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20d20e92-3451-11ea-8006-12813bfff9fa;
 Sat, 11 Jan 2020 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578733365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nXvHlVsWNp/Qzw5ZZzIj5hMcCrtDGq8qRUyGE8TqZ/Q=;
 b=COMNDmc72QEXLDB8rVZ6mVki8tuh53a/k9tGybP0811KMSUfEAuCx+ra
 mAvq/XwRbXN7fqTg0qWeA1shw1XiYH5WT7hMRF9tBV6wwhM6kPIFn2JTN
 rm9Npaab377an1TaT4nTQEFuBs0QyxS+rRog3i4HMqYT4VFYGh6y8yxep E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fYWwIfM+gd9BCrjnBFGGhApNzLzknF3STVSe3jJJdn1eV6IcU1MHT0U+fC+v0Ro88hqryKtcu7
 M0AP7Zn9WSeP33+uOUr/8pcUK0eceZObGYaLl/vpVOSsIut7kDwHBQK5ZtiyIwu87+nz7ZrctU
 08WFlDCBCruTCUXJYEOnhI1UBV/5Yqd8jZ7NEkM7zObikZi1jQmEA8F7QqxX0HeXcCvPtMIc1b
 ZDBWXGH3jxT9lGM7fAVq2IZZgwCGCvDlblj6qbm+XqfxhDxHz+3jsUls0qObhAEJecBP5kJjyv
 1yU=
X-SBRS: 2.7
X-MesageID: 10770766
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,420,1571716800"; d="scan'208";a="10770766"
From: George Dunlap <George.Dunlap@citrix.com>
To: Doug Goldstein <cardoe@cardoe.com>
Thread-Topic: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
Thread-Index: AQHVx6H06GanjEQbAUmN87QxqbsgEKfkx7wAgABT/IA=
Date: Sat, 11 Jan 2020 09:02:39 +0000
Message-ID: <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
In-Reply-To: <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.40.2.2.4)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <58C8E90E9E5C10419AEA51BE5C79F63B@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSmFuIDExLCAyMDIwLCBhdCA0OjAyIEFNLCBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9l
QGNhcmRvZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxLzEwLzIwIDQ6MzcgQU0sIFNl
cmdleSBEeWFzbGkgd3JvdGU6DQo+PiBIaWRlIHRoZSBmb2xsb3dpbmcgaW5mb3JtYXRpb24gdGhh
dCBjYW4gaGVscCBpZGVudGlmeSB0aGUgcnVubmluZyBYZW4NCj4+IGJpbmFyeSB2ZXJzaW9uOiBY
RU5WRVJfZXh0cmF2ZXJzaW9uLCBYRU5WRVJfY29tcGlsZV9pbmZvLCBYRU5WRVJfY2hhbmdlc2V0
Lg0KPj4gQWRkIGV4cGxpY2l0IGNhc2VzIGZvciBYRU5WRVJfY29tbWFuZGxpbmUgYW5kIFhFTlZF
Ul9idWlsZF9pZCBhcyB3ZWxsLg0KPj4gSW50cm9kdWNlIHhzbV9maWx0ZXJfZGVuaWVkKCkgdG8g
aHZtbG9hZGVyIHRvIHJlbW92ZSAiPGRlbmllZD4iIHN0cmluZw0KPj4gZnJvbSBndWVzdCdzIERN
SSB0YWJsZXMgdGhhdCBvdGhlcndpc2Ugd291bGQgYmUgc2hvd24gaW4gdG9vbHMgbGlrZQ0KPj4g
ZG1pZGVjb2RlLg0KPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNs
aUBjaXRyaXguY29tPg0KPj4gLS0tDQo+PiB2MSAtLT4gdjI6DQo+PiAtIEFkZGVkIHhzbV9maWx0
ZXJfZGVuaWVkKCkgdG8gaHZtbG9hZGVyIGluc3RlYWQgb2YgbW9kaWZ5aW5nIHhlbl9kZW55KCkN
Cj4gDQo+IFNvIDEwMCUgdGhpcyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB3b24ndCBmbHkgd2l0aCB0
aGUgdmFyaW91cyBkb3duc3RyZWFtcyB0aGF0IHJ1biB0aGUgdjEgb2YgdGhpcyBwYXRjaC4gVGhv
c2UgdmFyaW91cyBjb25zdW1lcnMgd2lsbCBzdGljayB3aXRoIHYxLg0KPiANCj4gSWYgdGhlIGdv
YWwgb2YgdGhpcyBpcyB0byByZWR1Y2UgdGhlIGJ1cmRlbiBvZiB0aGUgZG93bnN0cmVhbXMgYW5k
IHRoZWlyIGN1c3RvbWVycyB0byBjYXJyeSBhIHBhdGNoIGFnYWluc3QgWGVuIHRoZW4gSSB3b3Vs
ZG4ndCBldmVuIGJvdGhlciB3aXRoIHRoaXMgdmVyc2lvbi4NCg0KSWYgdGhlIGdvYWwgaXMgdG8g
Y29tZSB1cCB3aXRoIGEgc29sdXRpb24gdGhhdCB3b3JrcyBmb3IgZXZlcnlvbmUsIGl0IHdvdWxk
IGJlIGhlbHBmdWwgaWYgeW91IHNhaWQgKndoeSog4oCcdmFyaW91cyBjb25zdW1lcnPigJ0gd291
bGQgZmluZCB0aGlzIHBhdGNoIHVuYWNjZXB0YWJsZTsgYW5kIGFsc28gd2hhdCB0aGV5IG1pZ2h0
IHRoaW5rIGFib3V0IHRoZSBhbHRlcm5hdGUgc29sdXRpb25zIHByb3Bvc2VkIChhbmQgd2h5KS4N
Cg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
