Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFF25FBFC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 16:24:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFI3u-0008UL-7C; Mon, 07 Sep 2020 14:24:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X81s=CQ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kFI3t-0008UA-0B
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 14:24:01 +0000
X-Inumbo-ID: d99ca176-01bf-4be6-96c7-83080abfcf2e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d99ca176-01bf-4be6-96c7-83080abfcf2e;
 Mon, 07 Sep 2020 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599488639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VRZZD6iQEI1m5m6u9S+/5F13H5zdz7U9ScSvl++64es=;
 b=bKtfao9BzNF6ar1O9vnpKu8ZwLi+LcK4LMilZOl8aCO8AFY2ZWUvvfQm
 9LMC4xC8CG26ZZKEulpwL4f8p6xLjsBx2x3JbIiJoIa/FLVtZvEeuhxPF
 B6HLX0o2e3W9tAZCa+xHSKimKeqpK+EfXHKIvoTllDXIx/HxkheLSNA3i M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: GPmt2mDL9SDJ1/R9bk9mzFNP6uFblIUMZXnruILK7Zh9Kh999pD97RtUNla2ngaW5qO4M80lBO
 FHjOupATclao56lyqLNVuD6nnuaVezktv89Nkj+7fRHJvluz2D9SkbXjOGn1iw137hHtDNzicU
 8qlZ231RjWUOFkgt35aQzL9p0Piq/0TqEbDaUiK4QXySnaI2TVlWFcJRn5xZB/i2tr4K6T45KC
 zZ/cSJCIG6QHy/dr1pV9eQ4HL3DKyZ/6IjdFJa5kCP5dwnJt/VjpXDRKvw3UlDAttMo0oApzOG
 vnA=
X-SBRS: 2.7
X-MesageID: 26433071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,402,1592884800"; d="scan'208";a="26433071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYGS+Jk8acNjyeGTBZsxGciWsXdnGbIzA8shRMRdk6RO5fnW7PuDxWTvoZDbCtP3xDjJjZOYe0//aA6mF98Pjz26jH9gPV2GB8sGhzu3NWluGZSFjpirxsyFTi2aN6gB5g/vO/S+otorMJLXlqynqse8EapbVJER66ZheiwQ4WG5auLlIRh5JG2AC9QkP2XRCS9driIIqxsCrQQ2zCoGEWNtSVfxm0+ZEmJzWku2QvCjQ80B0bPNJl2qXMJ4QfslqWBfFhxegD7uAAHUfGm+ZcCP22dfxV4mNaya7x65Lq5rDt4+xOqr79z42r7h+JJ+4m/AnW/nNS6/xDgenJsqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRZZD6iQEI1m5m6u9S+/5F13H5zdz7U9ScSvl++64es=;
 b=Es+BhM6q8elWG73OGzDBqS/y4FChxgel+sKUo+gHP37b7/ST4tMM4bVd6Jlmrm0ga7r56DLwRUZ5Iz3Jw0ixcBOOkUMbvPXQrCYstqSkjACJ88WjSf81KNWDDeJLEJJVBzajE5fo+mHu0yh67grjUY1fDDR27BPB+kCA49+vVs/oC/mgYGnbX6Ci9Bnx2qqq9voGwrbhy+JMHfIqEsKtpYXKWJPgkVTdRz+MjCUAyKoUkB2RXTCcHQky4yEM04LIEM5V8tMF67nzX4V5av+bRLbKqf7EpBpKDQatbXPPm+0/SlenKZMSi00y29mC6MCGC4iyUNmCoWRbg2bHcYVEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRZZD6iQEI1m5m6u9S+/5F13H5zdz7U9ScSvl++64es=;
 b=a7WGdogEfWxS0IslUD6dLlmYE1VAs1ddBTiYR88lLDOsTgNguiCOgtrXzrhTSl+Ar8CyM1sjA450XA1TL7E4j0aqwY+UHI4bH31jcLKXXdDxkHYKbZwtVaUCtzclTUCdgLWIUgeBfCKTG9CVlwOiQ8TRQt5WdFPBY/UTz4dFM0A=
From: George Dunlap <George.Dunlap@citrix.com>
To: Wei Liu <wl@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Nick Rosbrook
 <rosbrookn@ainfosec.com>, Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH] golang/xenlight: Move to an entirely external repo
Thread-Topic: [PATCH] golang/xenlight: Move to an entirely external repo
Thread-Index: AQHWgtoY+gmcVIyUZUS8XTTIIdRNDKldPY4AgAABxQA=
Date: Mon, 7 Sep 2020 14:23:55 +0000
Message-ID: <59E0E455-720D-4D09-963F-77C2AC545625@citrix.com>
References: <20200904164000.602618-1-george.dunlap@citrix.com>
 <20200907141734.zf4ikuxhu57lwojm@liuwe-devbox-debian-v2>
In-Reply-To: <20200907141734.zf4ikuxhu57lwojm@liuwe-devbox-debian-v2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7af0d346-ceda-45a3-aaf7-08d85339a712
x-ms-traffictypediagnostic: BYAPR03MB4390:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4390B72036BE071E3B61472A99280@BYAPR03MB4390.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6DuZ40o7+2ySOL0HQApMFU6MHZZ1wZUf87CxGeBMdPvL9stgrzPliqgvdKuRK2HMajKQdzAWmagwMgl5E4CQgiaiDHTLicIuAlWfXo97hCRM7EF4dRzP4qSIomtKJeHkoLDeVhh+/1NQ7SnvkcovESd4YSfK0ahhjPRt/9JGlu+gM9LNIVmGBQKJSPmAek1yFHczAOmAqcYF4GusI4QiGltubgPcPEiwZ8TCU0mlUsHyUocPJBKgEdOcfYwBzSiulZRxc65VwjfrERc9k0LsDgI3XPiCQDTVCECVfViwXwZ2v1oAYI+wnIPW6fHUeZjwH0KXSgL5ve1dGInEgTrXkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(186003)(2906002)(53546011)(86362001)(6486002)(33656002)(54906003)(83380400001)(36756003)(316002)(8676002)(6512007)(64756008)(66556008)(6916009)(91956017)(66446008)(4326008)(55236004)(66476007)(6506007)(2616005)(5660300002)(66946007)(76116006)(26005)(107886003)(478600001)(71200400001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 5XuEnag9YFYJWkGkjXv88FxT1ZNHPHJqrwcj+5pllXshbcIUJXdrUCI/0uGiJE7NSmlfg0d/Nf6/foOtG+bwipR5hHX5BhZl874RL9mafRRkVlVbeYgy/2/bT2IAtPF9cIUo0DO6HIp0ArkOQ/dT2F/CPD1uxjlmyhza0+24OsbVZ+ntewguRRASv9guRIvQmpo/SsZlEwqM70O7Hh6bMHV2Z/aBAEv0oaksxzQJX7u8TeIag1Xhov9R/nm7Li39xQvVCMkXtxAP/9uGV6u3n4TTwXXA0mxGB8kTzGHDjpwc4gFoYILSmpZBLT8RlkrMU5Ck6SN0HWYN11TUqnJjh9e0KDeyStu42rvzSisNiOc0I9Q3kDzSf7D+cpwWsgb/Rg4Qvx9FW1L/c+96tGFMqgsvDIu5+GtzIB83zuFfhy8Wn1FoF5FK++vB3aEEVFiPWG2wTmicFxwr2+41xh383u+6Gm7PLS4Ta19GMyQDBcfWOPpsO2bi0jWoll8fw4xIJtmI8DUsLPKTTilFiU39CKc3ZbeWpkaqnRoVJaSwIhGf3VBQFR6Gulyiuz007GT98psAljyrcL8q/S4oul840zxZtFbH00VnbhUWNlPTrnWBMICupajIggQrBowFT5dhepz/wSdcQ5J6WDDOA6DzQg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <56E0E9D8AAF7AE42AEEE3082801F091A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af0d346-ceda-45a3-aaf7-08d85339a712
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2020 14:23:55.2655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZzL9ackHZhPxQqdA9PxQt2UHHxuLRELeac7lET6LuOvIlyqugXR0F9ZkeBg5kyn7tdD2b7KcXowfuW9TLdu+7MU0CQFasnZxGqiInWMXbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4390
X-OriginatorOrg: citrix.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gU2VwIDcsIDIwMjAsIGF0IDM6MTcgUE0sIFdlaSBMaXUgPHdsQHhlbi5vcmc+IHdy
b3RlOg0KPiANCj4gT24gRnJpLCBTZXAgMDQsIDIwMjAgYXQgMDU6NDA6MDBQTSArMDEwMCwgR2Vv
cmdlIER1bmxhcCB3cm90ZToNCj4+IFJlbW92ZSBhbGwgZ28gZmlsZXMgYW5kIGdlbmVyYXRpb24g
dGFyZ2V0cy4NCj4+IA0KPj4gQWRkIGEgY29udmVuaWVuY2UgbWFjcm8gdG8gYnVpbGQgdGhlIHBh
Y2thZ2UgZnJvbSBzdGFnaW5nLiAgVGhpcyBpc24ndA0KPj4gcmVhbGx5IG1lYW50IHRvIGJlIGNh
bGxlZCBkaXJlY3RseTsgcmF0aGVyLCBpdCdzIG1lYW50IHRvIGJlIGNhbGxlZA0KPj4gZnJvbSBh
IGNvcnJlc3BvbmRpbmcgYnVpbGQgdGFyZ2V0IGluc2lkZSB0aGUgZXh0ZXJuYWwgeGVubGlnaHQg
cGFja2FnZQ0KPj4gcmVwby4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBDQzogTmljayBSb3Nicm9vayA8
cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4NCj4+IENDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
Y2l0cml4LmNvbT4NCj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4gLS0tDQo+PiB0b29s
cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgICA1ICstDQo+PiB0b29scy9nb2xh
bmcveGVubGlnaHQvTElDRU5TRSAgICAgICAgfCAgNTAyIC0tLS0NCj4+IHRvb2xzL2dvbGFuZy94
ZW5saWdodC9NYWtlZmlsZSAgICAgICB8ICAgMzYgKy0NCj4+IHRvb2xzL2dvbGFuZy94ZW5saWdo
dC9SRUFETUUubWQgICAgICB8ICAgMjggLQ0KPj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdv
dHlwZXMucHkgIHwgIDczOCAtLS0tLQ0KPj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dvLm1vZCAg
ICAgICAgIHwgICAgMyAtDQo+PiB0b29scy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28g
fCA0MTgyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiB0b29scy9nb2xhbmcveGVubGln
aHQvdHlwZXMuZ2VuLmdvICAgfCAxMTk0IC0tLS0tLS0tDQo+PiB0b29scy9nb2xhbmcveGVubGln
aHQveGVubGlnaHQuZ28gICAgfCAxMjczIC0tLS0tLS0tDQo+PiA5IGZpbGVzIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDc5NTEgZGVsZXRpb25zKC0pDQo+PiBkZWxldGUgbW9kZSAxMDA2NDQg
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L0xJQ0VOU0UNCj4+IGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29s
cy9nb2xhbmcveGVubGlnaHQvUkVBRE1FLm1kDQo+PiBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkNCj4+IGRlbGV0ZSBtb2RlIDEwMDY0NCB0b29s
cy9nb2xhbmcveGVubGlnaHQvZ28ubW9kDQo+PiBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvDQo+PiBkZWxldGUgbW9kZSAxMDA2NDQgdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbw0KPj4gZGVsZXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbw0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
TWFrZWZpbGUgYi90b29scy9NYWtlZmlsZQ0KPj4gaW5kZXggMTk4YjIzOWVkYy4uZjI0ZDdiNmY3
NCAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL01ha2VmaWxlDQo+PiArKysgYi90b29scy9NYWtlZmls
ZQ0KPj4gQEAgLTMxLDcgKzMxLDYgQEAgZW5kaWYNCj4+IA0KPj4gU1VCRElSUy15ICs9IHhlbnBt
ZA0KPj4gU1VCRElSUy15ICs9IGxpYnhsDQo+PiAtU1VCRElSUy0kKENPTkZJR19HT0xBTkcpICs9
IGdvbGFuZw0KPj4gU1VCRElSUy15ICs9IHhsDQo+PiBTVUJESVJTLXkgKz0gaGVscGVycw0KPj4g
U1VCRElSUy0kKENPTkZJR19YODYpICs9IHhlbnBhZ2luZw0KPj4gQEAgLTExMyw3ICsxMTIsNyBA
QCBlbmRpZg0KPj4gIyAgICBQdWxsIHRvIHRoZSBtb3N0IHJlY2VudCB1cGRhdGUgKGFzIGlmIHlv
dSBoYWQgY2hlY2tlZCBpdCBvdXQgZm9yIHRoZQ0KPj4gIyAgICBmaXJzdCB0aW1lKQ0KPj4gIyAg
c3ViZGlyLWFsbC0ke3RhcmdldH0tZGlyDQo+PiAtIyAgICBEbyAibWFrZSBhbGwiIGZvciAke3Rh
cmdldH0sIGluY2x1ZGluZyBhbGwgcHJlcmVxdWlzaXRlcyAoc3VjaCBhcyANCj4+ICsjICAgIERv
ICJtYWtlIGFsbCIgZm9yICR7dGFyZ2V0fSwgaW5jbHVkaW5nIGFsbCBwcmVyZXF1aXNpdGVzIChz
dWNoIGFzDQo+PiAjICAgIGNvbmZpZ3VyZSkNCj4+ICMgIHN1YmRpci1pbnN0YWxsLSR7dGFyZ2V0
fS1kaXINCj4+ICMgICAgRG8gIm1ha2UgaW5zdGFsbCIgZm9yICRUQVJHRVQNCj4+IEBAIC0xMjYs
NyArMTI1LDcgQEAgZW5kaWYNCj4+ICMgICR7dGFyZ2V0fS1kaXItcmVtb3RlDQo+PiAjICAgIFdo
ZXJlIHJlbW90ZSByZXBvc2l0b3JpZXMgYXJlIGNsb25lZA0KPj4gIyAgJHt0YXJnZXR9DQo+PiAt
IyAgICBXaGVyZSBhIGNvcHkgb2YgdGhlIHNvdXJjZSBmaWxlcyBhcmUgcHV0IHdoZW4gYnVpbGRp
bmcgYSBzb3VyY2UgDQo+PiArIyAgICBXaGVyZSBhIGNvcHkgb2YgdGhlIHNvdXJjZSBmaWxlcyBh
cmUgcHV0IHdoZW4gYnVpbGRpbmcgYSBzb3VyY2UNCj4gDQo+IFVucmVsYXRlZCBjaGFuZ2VzIGhl
cmU/DQoNClRyYWlsaW5nIHdoaXRlc3BhY2UgZGVsZXRpb24sIGRvbmUgYXV0b21hdGljYWxseSBi
eSBteSBlZGl0b3Igb24gc2F2ZS4gIEkgcHJvYmFibHkgc2hvdWxkIGhhdmUgbWVudGlvbmVkIHRo
ZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBidXQgSSBkb27igJl0IHRoaW5rIGl04oCZcyB3b3J0
aCByZW1vdmluZyB0aGVtIG9yIG1vdmluZyB0aGVtIHRvIGFub3RoZXIgcGF0Y2guDQoNCiAtR2Vv
cmdl

