Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D535E95E28
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 14:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i02z7-0005Y9-Jl; Tue, 20 Aug 2019 12:11:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WUBi=WQ=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i02z5-0005Y4-Pd
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 12:11:32 +0000
X-Inumbo-ID: a3183f87-c343-11e9-8bf7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3183f87-c343-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566303088;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xJSp8dEuDkMwc0tAxtBELuca58a2LVAGkiROt1yCIP0=;
 b=Mbq3YOrJu7ONg2/3/W/txjpEt5K4MrUkzk0FFWB48knpILhsZwjhL7Zm
 bVIWzk1Wu83FvpmAYyUCoPgUOzQ4bC288Xz+yp1+h2JTcTBYuwZNzt0gF
 EGp5EC+RGV+aP/NYY+yalaV10v5rLZi4UYUNxE0W1Jd+2UfJwyr75ONhV Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ko9p0fvXznywdC+hAvs3bfoSHqkNuLnAXNKfzxO/5E2DE7OuZncbvX64mT98Uw+PmhavVjttbr
 366rfEVcxUxtZ2NjecVbjT4flE31ckhB6u2+mRIH6sIFsFIW+Sa8/2iaUi8e35IaZnQiOzM+wu
 wP4KZJvOzzg7JSqJ9yBql6Tzz+vszAVOdm03QCB3ZYVjlwnzhyfhOLZVfv27pENo/iQj5/grd4
 f9e92V2PofUXOqLfF0Y7vlaCw9739M+3Jej8LVPqXBeALdJeinTyWW3at8NXNukum1e/X88OaI
 RRg=
X-SBRS: 2.7
X-MesageID: 4679977
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4679977"
From: Christian Lindig <christian.lindig@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Thread-Topic: [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn rebind
 function from cxenstored
Thread-Index: AQHVVr5MK6au/yYrc0WquZUXd0SG76cDkYSAgAAoOACAABgFAA==
Date: Tue, 20 Aug 2019 12:11:25 +0000
Message-ID: <9324516A-66F9-47FC-AD8F-BF44059D29B2@citrix.com>
References: <1566240335-6614-1-git-send-email-igor.druzhinin@citrix.com>
 <7DFC36D5-7354-4D82-87A6-364FEDEAFAFC@citrix.com>
 <d61c8e5e-eb9b-755f-0917-b4d009c64d74@citrix.com>
In-Reply-To: <d61c8e5e-eb9b-755f-0917-b4d009c64d74@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F670EE61CF37894AAEBB16A8748C4331@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools/oxenstored: port XS_INTRODUCE evtchn
 rebind function from cxenstored
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, "wl@xen.org" <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjAgQXVnIDIwMTksIGF0IDExOjQ1LCBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6
aGluaW5AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyMC8wOC8yMDE5IDA5OjIxLCBDaHJp
c3RpYW4gTGluZGlnIHdyb3RlOg0KPj4+ICsJCQlpZiAoRG9tYWluLmdldF9tZm4gZWRvbSkgPSBt
Zm4gJiYgKENvbm5lY3Rpb25zLmZpbmRfZG9tYWluIGNvbnMgZG9taWQpICE9IGNvbiB0aGVuIGJl
Z2luDQo+PiANCj4+IFRoaXMgc2hvdWxkIHVzZSA8PiBpbnN0ZWFkIG9mICE9IGJlY2F1c2UgIT0g
aXMgcG9pbnRlciBpbmVxdWFsaXR5IGluIE9DYW1sLiBUaGUgcGFyZW50aGVzZXMgYXJlIG5vdCBz
dHJpY3RseSBuZWNlc3NhcnkgYmVjYXVzZSBmdW5jdGlvbiBhcHBsaWNhdGlvbiBoYXMgcHJlY2Vk
ZW5jZS4gU286DQo+PiANCj4+IAlpZiBEb21haW4uZ2V0X21mbiBlZG9tID0gbWZuICYmIENvbm5l
Y3Rpb25zLmZpbmRfZG9tYWluIGNvbnMgZG9taWQgPD4gY29uIHRoZW4gYmVnaW4NCj4+IA0KPiAN
Cj4gQnV0IEkgYWN0dWFsbHkgd2FudCB0byBjb21wYXJlIHBvaW50ZXJzIGhlcmUgLSB0aGUgaWRl
YSBpcyB0aGF0IHRoZQ0KPiBjb25uZWN0aW9uIG9iamVjdCBpbiB0aGUgaGFzaHRhYmxlIGluZGV4
ZWQgYnkgZG9taWQgaXMgbm90IHRoZSBzYW1lIGFzDQo+IGNvbm5lY3Rpb24gdGhhdCB3ZSBnb3Qg
WFNfSU5UUk9EVUNFIG1lc3NhZ2UgZnJvbS4gKHNlZQ0KPiB0b29scy94ZW5zdG9yZS94ZW5zdHJv
cmVkX2RvbWFpbi5jKQ0KDQpJbiB5b3VyIGNvZGUsIGEgIT0gYiBpcyB0cnVlLCBpZiBhIGFuZCBi
IGhhdmUgaWRlbnRpY2FsIHN0cnVjdHVyZSBidXQgZGlmZmVyZW50IGFkZHJlc3Nlcy4gSSBzdHJv
bmdseSBzdXNwZWN0IHRoYXQgdHdvIGNvbm5lY3Rpb24gdmFsdWVzIHNob3VsZCBoYXZlIGRpZmZl
cmVudCBzdHJ1Y3R1cmUgdG8gYmUgY29uc2lkZXJlZCBkaWZmZXJlbnQsIG5vdCBqdXN0IGRpZmZl
cmVudCBhZGRyZXNzZXMuIFdoZW4gYSA8PiBiIGlzIHRydWUsIGl0IGltcGxpZXMgYSAhPSBiLiBT
byB1c2luZyBhIDw+IGIgaXMgc2FmZShyKS4gQnkgdXNpbmcgIT0geW91IHdvdWxkIHJlbHkgb24g
YW4gaW52YXJpYW50IHRoYXQgZXZlcnkgY29ubmVjdGlvbiAoY29uKSBleGlzdHMgb25seSBvbmNl
IGFuZCBpcyBuZXZlciBjb3BpZWQuDQoNCuKAlCBDaHJpc3RpYW4NCg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
