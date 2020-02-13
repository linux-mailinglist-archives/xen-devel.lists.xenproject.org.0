Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2378E15BB05
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 09:51:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2AB7-0007Uu-7K; Thu, 13 Feb 2020 08:48:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3q6q=4B=amazon.co.uk=prvs=305d558ea=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j2AB5-0007Up-Tc
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 08:48:55 +0000
X-Inumbo-ID: aaf2f3ec-4e3d-11ea-bc8e-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaf2f3ec-4e3d-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581583735; x=1613119735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9e2gqG5oHMen9z5odqpmcxO6GW98XaCMFnPM1+dITYE=;
 b=I2TyZYDmKO4hYQsZZ0wyIEBG6Newxcof04ibaPgbe59Oex26rnALsJpf
 +6ZCBAsZ16p2G4w7E/3emmlWHESyIhRwmN0j2tnEpNSVi7Km1QF75PlWd
 DN7UDZLONSDVMrYlLXuUefUouAROmKSiP2XddTVVgc3PytRkZykmhV4Tw 8=;
IronPort-SDR: GefXDdMaxSgpF56Tvof5yzE9wNdcMseHDoGt79zURnzGErABrwLiiOAQ9Qns/lCkNwwON/7VRm
 wpDNYqUBhnJQ==
X-IronPort-AV: E=Sophos;i="5.70,436,1574121600"; d="scan'208";a="16989699"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 13 Feb 2020 08:48:42 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9E011A1FE6; Thu, 13 Feb 2020 08:48:41 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 13 Feb 2020 08:48:40 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 13 Feb 2020 08:48:39 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 13 Feb 2020 08:48:39 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>
Thread-Topic: [PATCH 2/4] x86/hypervisor: pass flags to hypervisor_flush_tlb
Thread-Index: AQHV4b8JZqce0FDP0kybZlEzdhQ3aqgXyHKAgAEIjKA=
Date: Thu, 13 Feb 2020 08:48:39 +0000
Message-ID: <0fd1bb31e2054ddeb5e21793aa0c8750@EX13D32EUC003.ant.amazon.com>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-3-liuwe@microsoft.com>
 <20200212170047.GR4679@Air-de-Roger>
In-Reply-To: <20200212170047.GR4679@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.77]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMTIgRmVicnVhcnkgMjAyMCAxODowMQ0KPiBU
bzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ2M6IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBEdXJyYW50LCBQYXVsDQo+IDxwZHVycmFudEBh
bWF6b24uY28udWs+OyBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdl
aSBMaXUNCj4gPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDIvNF0geDg2L2h5cGVydmlzb3I6IHBhc3MgZmxhZ3MgdG8NCj4g
aHlwZXJ2aXNvcl9mbHVzaF90bGINCj4gDQo+IE9uIFdlZCwgRmViIDEyLCAyMDIwIGF0IDA0OjA5
OjE2UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6DQo+ID4gSHlwZXItVidzIEwwIGFzc2lzdGVkIGZs
dXNoIGhhcyBmaW5lLWdyYWluZWQgY29udHJvbCBvdmVyIHdoYXQgZ2V0cw0KPiA+IGZsdXNoZWQu
IFdlIG5lZWQgYWxsIHRoZSBmbGFncyBhdmFpbGFibGUgdG8gbWFrZSB0aGUgYmVzdCBkZWNpc2lv
bnMNCj4gPiBwb3NzaWJsZS4NCj4gPg0KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGJlY2F1c2Ug
WGVuJ3MgaW1wbGVtZW50YXRpb24gZG9lc24ndCBjYXJlIGFib3V0DQo+ID4gd2hhdCBpcyBwYXNz
ZWQgdG8gaXQuDQo+IA0KPiBXaGlsZSBpdCdzIGNlcnRhaW5seSBmaW5lIHRvIHBhc3MgYSBmbGFn
cyBmaWVsZCB3aXRoIG1vcmUgaW5mb3JtYXRpb24sDQo+IHRoZSBmbHVzaCBmbGFncyBmb3IgWGVu
IGNhbiBhbHNvIGNvbnRhaW4gRkxVU0hfQ0FDSEUsIEZMVVNIX1ZDUFVfU1RBVEUNCj4gb3IgRkxV
U0hfUk9PVF9QR1RCTCwgY2FuIHlvdSBhZGQgYW4gYXNzZXJ0IHRoYXQgdGhvc2UgbmV2ZXIgZ2V0
IHBhc3NlZA0KPiB0byB0aGUgZmx1c2ggaG9vaz8NCj4gDQo+IElNTyB3ZSBzaG91bGQgZGVmaW5l
IGEgbWFzayB3aXRoIEZMVVNIX1RMQiwgRkxVU0hfVExCX0dMT0JBTCwNCj4gRkxVU0hfVkFfVkFM
SUQgYW5kIEZMVVNIX09SREVSX01BU0sgYW5kIGFzc2VydCB0aGF0IHRob3NlIGFyZSB0aGUgb25s
eQ0KPiB2YWxpZCBmbGFncyB0byBiZSB1c2VkIGZvciB0aGUgaHlwZXJ2aXNvciBhc3Npc3RlZCBm
bHVzaCBob29rLg0KPg0KDQpBZ3JlZWQgdGhhdCB0aGlzIHNob3VsZCBiZSBhYnN0cmFjdGVkOyB3
ZSBjZXJ0YWlubHkgZG9uJ3Qgd2FudCB0byBoYXZlIHZhcmlvdXMgYml0cyBvZiBYZW4gbmVlZGlu
ZyB0byBrbm93IHdoYXQgaHlwZXJ2aXNvciBpdCBpcyBydW5uaW5nIG9uIHRvcCBvZi4NCg0KICBQ
YXVsDQoNCiANCj4gVGhhbmtzLCBSb2dlci4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
