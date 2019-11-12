Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44726F94D0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 16:54:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUYTJ-0008HV-9e; Tue, 12 Nov 2019 15:52:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jBsL=ZE=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iUYTH-0008HQ-39
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 15:52:47 +0000
X-Inumbo-ID: 782c6320-0564-11ea-a21f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 782c6320-0564-11ea-a21f-12813bfff9fa;
 Tue, 12 Nov 2019 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573573966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HILb4KpjtvN6iaCW+tonA3upKCjJ/3phoOlB4sV80vI=;
 b=YrcA9I+AGyPUZNJknBhkTSKtM+hpwqcRJBRSxmunHV927ItIhWUYSdK+
 xq4wsd0yWygxfCqnFpLZWrOA2A6X6Yp9xuQc7xhEmXkOcGE7rubP26bls
 3SMX/StGp68JUddgCUJZ5xOgYMtckMU0F8t0XfsMC5XxEazdc9DqmrG+0 U=;
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
IronPort-SDR: 8GeMciMUtfNVfNvIiZQhjvfacdduUNpTqsxuL798omcYH8n9gWf891pmcZgE4bs2rFcX/fbjNf
 HiSA2e+JjuWEzUvKRTyLwl1gK3etnAYDwwBI8jETReaHpU5+3/8G1uK6fNLAZdwVERksB/bl63
 1NQ1Hv9m2LXBGNRvNczW/4/mpK3GRhLaRWFGrWPReamOm5Uj164WR273zdX3ClNAoA+Ip0Ty+o
 tI6ZXZ6Prn4qGpcQCGbHcCzckDahzVWAEtmuRSeyMDY27BOYlkW/8tw9oig4+DhDkuQvswvWhP
 200=
X-SBRS: 2.7
X-MesageID: 8620150
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8620150"
From: George Dunlap <George.Dunlap@citrix.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH] xen/sched: remove wrong assertions in
 csched2_free_pdata()
Thread-Index: AQHVlgeMgOer/S1O/EqNSzzHmmw/rKeHpZwA
Date: Tue, 12 Nov 2019 15:52:42 +0000
Message-ID: <A1DBEE0C-4CE9-41A0-B8C9-B22FE6844D5C@citrix.com>
References: <20191108073837.5797-1-jgross@suse.com>
In-Reply-To: <20191108073837.5797-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <0E25B8C25BF5D9468B253047442B0BE9@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove wrong assertions in
 csched2_free_pdata()
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
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTm92IDgsIDIwMTksIGF0IDc6MzggQU0sIEp1ZXJnZW4gR3Jvc3MgPEpHcm9zc0Bz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgYXNzZXJ0aW9ucyBpbiBjc2NoZWQyX2ZyZWVfcGRh
dGEoKSBhcmUgd3JvbmcgYXMgaW4gY2FzZSBpdCBpcw0KPiBjYWxsZWQgYnkgc2NoZWR1bGVfY3B1
X2FkZCgpIGFmdGVyIGEgZmFpbHVyZSBvZiBzY2hlZF9hbGxvY191ZGF0YSgpDQo+IHRoZSBpbml0
IHBkYXRhIGZ1bmN0aW9uIHdvbid0IGhhdmUgYmVlbiBjYWxsZWQuDQoNCknigJltIGEgYml0IGNv
bmZ1c2VkIGJ5IHRoaXMsIGFzIHRoZSBjb21tZW50IHNheXMgdGhhdCB0aGUgQVNTRVJUKClzIHNo
b3VsZCBiZSBPSyB3aXRoIHRoYXQgY2FzZTsgaS5lLiwgdGhhdCB0aGV5IHNob3VsZCBjaGVjayAq
ZWl0aGVyKiB0aGF0IHBkYXRhIGhhc27igJl0IGJlZW4gY2FsbGVkLCBvciB0aGF0IGRpbml0X3Bk
YXRhKCkgaGFzIGJlZW4gY2FsbGVkOg0KDQo+IC0gICAgICogeGZyZWUoKSBkb2VzIG5vdCByZWFs
bHkgbWluZCwgYnV0IHdlIHdhbnQgdG8gYmUgc3VyZSB0aGF0IGVpdGhlcg0KPiAtICAgICAqIGlu
aXRfcGRhdGEgaGFzIG5ldmVyIGJlZW4gY2FsbGVkLCBvciBkZWluaXRfcGRhdGEgaGFzIGJlZW4g
Y2FsbGVkDQo+IC0gICAgICogYWxyZWFkeS4NCg0KU28gd2hpY2ggb2YgdGhlIGZvbGxvd2luZyBj
b25kaXRpb25zIHdpbGwgZmFpbCBpZiBzY2hlZF9hbGxvY191ZGF0YSgpIGZhaWxzPyAgSXQgbG9v
a3MgdG8gbWUgbGlrZSB0aGV5IHNob3VsZCBib3RoIGJlIGZpbmUuDQoNCj4gLSAgICBBU1NFUlQo
IXBjcHUgfHwgc3BjLT5ydW5xX2lkID09IC0xKTsNCj4gLSAgICBBU1NFUlQoIWNwdW1hc2tfdGVz
dF9jcHUoY3B1LCAmY3NjaGVkMl9wcml2KG9wcyktPmluaXRpYWxpemVkKSk7DQoNCiAtR2Vvcmdl
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
