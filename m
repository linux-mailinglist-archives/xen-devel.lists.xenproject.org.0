Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D07102BE2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 19:47:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX8QA-0007Ns-6p; Tue, 19 Nov 2019 18:40:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rxLV=ZL=amazon.de=prvs=219959910=wipawel@srs-us1.protection.inumbo.net>)
 id 1iX8Q8-0007Nn-7r
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 18:40:12 +0000
X-Inumbo-ID: 041d7576-0afc-11ea-a300-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 041d7576-0afc-11ea-a300-12813bfff9fa;
 Tue, 19 Nov 2019 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574188811; x=1605724811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=HoAsmUvEmVfrRyMDTER8rzwOyp79aF31dnwC8FPJKdo=;
 b=UiRyqOJg7gLJXaYdgL04smBDvGZ+/s2tObf1rV2HKdWECpE9d/FVLdvW
 gVM+doeCXOsqUDQISI1eJ0kWgKoDqwLXNzRfd5YHsO5cNECP05UZikRA5
 JnSwHHz0BgsRiEOyuT2+kCGIgboNovK+NLVra7CBA1k+sPmTYqDy7+gOh I=;
IronPort-SDR: Jvqx0mdnPJeWAttswRPryeVipkp9l1NN8MXc3541GI9ObAxDNgZ6WNjQQqOQ3pm6s48uPgehbK
 hztadHdiaj4A==
X-IronPort-AV: E=Sophos;i="5.69,218,1571702400"; 
   d="scan'208";a="9693385"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 19 Nov 2019 17:21:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id F14E8A2110; Tue, 19 Nov 2019 17:21:07 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 19 Nov 2019 17:21:06 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 19 Nov 2019 17:21:05 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 19 Nov 2019 17:21:06 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: livepatch-build-tools regression
Thread-Index: AQHVni9ReRquixYoHEOXl3oCOkZoJaeRI0wAgAAGFwCAAAVUAIAAA80AgAGMj4A=
Date: Tue, 19 Nov 2019 17:21:06 +0000
Message-ID: <1A2AE077-662E-40C0-820D-13EC3B88D1F3@amazon.com>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
 <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
 <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
 <D092B667-0662-4B8E-958E-02B14530C363@amazon.com>
 <d65106c4-e35d-bd69-0539-a7fb525ae776@citrix.com>
In-Reply-To: <d65106c4-e35d-bd69-0539-a7fb525ae776@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.222]
Content-ID: <B23F3947BC5C2149BA141EF6826AC024@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] livepatch-build-tools regression
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Paraschiv, Andra-Irina" <andraprs@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE4LiBOb3YgMjAxOSwgYXQgMTg6NDEsIFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFz
bGlAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gT24gMTgvMTEvMjAxOSAxNzoyOCwgV2llY3pvcmtp
ZXdpY3osIFBhd2VsIHdyb3RlOgo+PiAKPj4gQ291bGQgeW91IGJ1aWxkIHRoZSBscCB3aXRoIGRl
YnVnICgtZCkgYW5kIHByb3ZpZGUgbWUgd2l0aCB0aGUgY3JlYXRlLWRpZmYtb2JqZWN0LmxvZyBm
aWxlPwo+PiAKPiAKPiBJJ3ZlIGF0dGFjaGVkIHRoZSBsb2cuIEJ0dywgSSB0aGluayBJIHByb3Zp
ZGVkIGFsbCB0aGUgbmVjZXNzYXJ5IGluZm9ybWF0aW9uCj4gZm9yIG90aGVycyB0byByZXBlYXQg
bXkgZXhwZXJpbWVudC4KPiAKClNvcnJ5IGZvciBhbm90aGVyIHJlcXVlc3QsIGJ1dCBJIGRvIG5v
dCBzZWVtIHRvIGJlIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgbG9jYWxseS4KQ291bGQgeW91IHNl
bmQgbWUgdGhlIGxpdmVwYXRjaCBtb2R1bGUgYmluYXJ5IHRoYXQgZmFpbHMgdG8gdXBsb2FkPwoK
PiAtLQo+IFRoYW5rcywKPiBTZXJnZXkKPiA8Y3JlYXRlLWRpZmYtb2JqZWN0LmxvZy54ej4KCkJl
c3QgUmVnYXJkcywKUGF3ZWwgV2llY3pvcmtpZXdpY3oKCgoKCgoKQW1hem9uIERldmVsb3BtZW50
IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVm
dHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdl
biBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejog
QmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
