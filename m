Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF9D120155
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 10:42:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igmly-0003QJ-SB; Mon, 16 Dec 2019 09:34:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ILIH=2G=amazon.com=prvs=2465856dc=pdurrant@srs-us1.protection.inumbo.net>)
 id 1igmlx-0003QE-V0
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 09:34:38 +0000
X-Inumbo-ID: 457ae6d4-1fe7-11ea-9374-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 457ae6d4-1fe7-11ea-9374-12813bfff9fa;
 Mon, 16 Dec 2019 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576488876; x=1608024876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DDvQ3yiYVhJ9tjd97HjSV//yi9mEV12YY9NIt5fiudc=;
 b=bjboAZXqx0uzpy4X83qdePkld+33FZYh80ikyN4Lk/6oHLXbFdO73M7/
 8yvzQHKQDdPyOfi7EQM+tGJm6tPmrDOMwjnT1/zwU1iEWXyYy/c6s2iC1
 PUXHjgl16tSm9fI+Hs52J1PCFYZ7QPrYkAWISgDugn0Tu0cY9DQORgsZE s=;
IronPort-SDR: tG4VUDsXH98xrilH5/vb03JyVOr/zbCtvBy/Tdrt6TTtewQ1v655wvHFSS18FI35wGtAfa7xZ/
 NMlSe+8PBvTA==
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; 
   d="scan'208";a="7777485"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Dec 2019 09:34:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5D755A2947; Mon, 16 Dec 2019 09:34:32 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 09:34:28 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 09:34:28 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 16 Dec 2019 09:34:27 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: xen-block: race condition when stopping the device (WAS: Re:
 [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL)
Thread-Index: AQHVshZtoj9Bbp/0YEqGkIeiJVi8AKe8ep0A
Date: Mon, 16 Dec 2019 09:34:27 +0000
Message-ID: <e49691262df2450aa48522dc38f80657@EX13D32EUC003.ant.amazon.com>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
 <24051.30893.31444.319978@mariner.uk.xensource.com>
 <7a0ef296-eb50-fbda-63e2-8d890fad5111@xen.org>
 <a65ae7dca64f4f718f116b9174893730@EX13D32EUC003.ant.amazon.com>
 <65df8a75-a658-1a14-6780-66c8706bcc80@xen.org>
In-Reply-To: <65df8a75-a658-1a14-6780-66c8706bcc80@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] xen-block: race condition when stopping the device
 (WAS: Re: [xen-4.13-testing test] 144736: regressions - FAIL)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4+DQo+ID4+IFRoaXMgZmVl
bHMgbGlrZSBhIHJhY2UgY29uZGl0aW9uIGJldHdlZW4gdGhlIGluaXQvZnJlZSBjb2RlIHdpdGgN
Cj4gPj4gaGFuZGxlci4gQW50aG9ueSwgZG9lcyBpdCByaW5nIGFueSBiZWxsPw0KPiA+Pg0KPiA+
DQo+ID4gIEZyb20gdGhhdCBzdGFjayBidCBpdCBsb29rcyBsaWtlIGFuIGlvdGhyZWFkIG1hbmFn
ZWQgdG8gcnVuIGFmdGVyIHRoZQ0KPiBzcmluZyB3YXMgTlVMTGVkLiBUaGlzIHNob3VsZCBub3Qg
YmUgYWJsZSBoYXBwZW4gYXMgdGhlIGRhdGFwbGFuZSBzaG91bGQNCj4gaGF2ZSBiZWVuIG1vdmVk
IGJhY2sgb250byBRRU1VJ3MgbWFpbiB0aHJlYWQgY29udGV4dCBiZWZvcmUgdGhlIHJpbmcgaXMN
Cj4gdW5tYXBwZWQuDQo+IA0KPiBNeSBrbm93bGVkZ2Ugb2YgdGhpcyBjb2RlIGlzIGZhaXJseSBs
aW1pdGVkLCBzbyBjb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuDQo+IA0KPiBibGtfc2V0X2Fpb19j
b250ZXh0KCkgd291bGQgc2V0IHRoZSBjb250ZXh0IGZvciB0aGUgYmxvY2sgYWlvLiBBRkFJQ1Qs
DQo+IHRoZSBvbmx5IGFpbyBmb3IgdGhlIGJsb2NrIGlzIHhlbl9ibG9ja19jb21wbGV0ZV9haW8o
KS4NCg0KTm90IHF1aXRlLiB4ZW5fYmxvY2tfZGF0YXBsYW5lX3N0YXJ0KCkgY2FsbHMgeGVuX2Rl
dmljZV9iaW5kX2V2ZW50X2NoYW5uZWwoKSBhbmQgdGhhdCB3aWxsIGFkZCBhbiBldmVudCBjaGFu
bmVsIGZkIGludG8gdGhlIGFpbyBjb250ZXh0LCBzbyB0aGUgc2hhcmVkIHJpbmcgaXMgcG9sbGVk
IGJ5IHRoZSBpb3RocmVhZCBhcyB3ZWxsIGFzIGJsb2NrIGkvbyBjb21wbGV0aW9uLg0KDQo+IA0K
PiBJbiB0aGUgc3RhY2sgYWJvdmUsIHdlIGFyZSBub3QgZGVhbGluZyB3aXRoIGEgYmxvY2sgYWlv
IGJ1dCBhbiBhaW8gdGllDQo+IHRvIHRoZSBldmVudCBjaGFubmVsIChzZWUgdGhlIGNhbGwgZnJv
bSB4ZW5fZGV2aWNlX3BvbGwpLiBTbyBJIGRvbid0DQo+IHRoaW5rIHRoZSBibGtfc2V0X2Fpb19j
b250ZXh0KCkgd291bGQgYWZmZWN0IHRoZSBhaW8uDQo+IA0KDQpGb3IgdGhlIHJlYXNvbiBJIG91
dGxpbmUgYWJvdmUsIGl0IGRvZXMuDQoNCj4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gZ2V0
IHRoZSBpb3RocmVhZCBydW5uaW5nIGJlY2F1c2Ugd2UgcmVjZWl2ZWQNCj4gYSBub3RpZmljYXRp
b24gb24gdGhlIGV2ZW50IGNoYW5uZWwgd2hpbGUgd2UgYXJlIHN0b3BwaW5nIHRoZSBibG9jayAo
aS5lDQo+IHhlbl9ibG9ja19kYXRhcGxhbmVfc3RvcCgpKS4NCj4gDQoNCldlIHNob3VsZCBhc3N1
bWUgYW4gaW90aHJlYWQgY2FuIGVzc2VudGlhbGx5IHJ1biBhdCBhbnkgdGltZSwgYXMgaXQgaXMg
YSBwb2xsaW5nIGVudGl0eS4gSXQgc2hvdWxkIGV2ZW50dWFsbHkgYmxvY2sgcG9sbGluZyBvbiBm
ZHMgYXNzaWduIHRvIGl0cyBhaW8gY29udGV4dCBidXQgSSBkb24ndCB0aGluayB0aGUgYWJzdHJh
Y3Rpb24gZ3VhcmFudGVlcyB0aGF0IGl0IGNhbm5vdCBiZSBhd29rZW4gZm9yIG90aGVyIHJlYXNv
bnMgKGUuZy4gb2ZmIGEgdGltZW91dCkuIEhvd2V2ZXIgYW5kIGV2ZW50IGZyb20gdGhlIGZyb250
ZW5kIHdpbGwgY2VydGFpbmx5IGNhdXNlIHRoZSBldnRjaG4gZmQgcG9sbCB0byB3YWtlIHVwLg0K
DQo+IElmIHhlbl9ibG9ja19kYXRhcGxhbmVfc3RvcCgpIGdyYWIgdGhlIGNvbnRleHQgbG9jayBm
aXJzdCwgdGhlbiB0aGUNCj4gaW90aHJlYWQgZGVhbGluZyB3aXRoIHRoZSBldmVudCBtYXkgd2Fp
dCBvbiB0aGUgbG9jayB1bnRpbCBpdHMgcmVsZWFzZWQuDQo+IA0KPiBCeSB0aGUgdGltZSB0aGUg
bG9jayBpcyBncmFiYmVkLCB3ZSBtYXkgaGF2ZSBmcmVlIGFsbCB0aGUgcmVzb3VyY2VzDQo+IChp
bmNsdWRpbmcgc3JpbmdzKS4gU28gdGhlIGV2ZW50IGlvdGhyZWFkIHdpbGwgZW5kIHVwIHRvIGRl
cmVmZXJlbmNlIGENCj4gTlVMTCBwb2ludGVyLg0KPiANCg0KSSB0aGluayB0aGUgcHJvYmxlbSBt
YXkgYWN0dWFsbHkgYmUgdGhhdCB4ZW5fYmxvY2tfZGF0YXBsYW5lX2V2ZW50KCkgZG9lcyBub3Qg
YWNxdWlyZSB0aGUgY29udGV4dCBhbmQgdGh1cyBpcyBub3Qgc3luY2hyb25pemVkIHdpdGggeGVu
X2Jsb2NrX2RhdGFwbGFuZV9zdG9wKCkuIFRoZSBkb2N1bWVudGF0aW9uIGluIG11bHRpcGxlLWlv
dGhyZWFkcy50eHQgaXMgbm90IGNsZWFyIHdoZXRoZXIgYSBwb2xsIGhhbmRsZXIgY2FsbGVkIGJ5
IGFuIGlvdGhyZWFkIG5lZWRzIHRvIGFjcXVpcmUgdGhlIGNvbnRleHQgdGhvdWdoOyBUQkggSSB3
b3VsZCBub3QgaGF2ZSB0aG91Z2h0IGl0IG5lY2Vzc2FyeS4NCg0KPiBJdCBmZWVscyB0byBtZSB3
ZSBuZWVkIGEgd2F5IHRvIHF1aWVzY2UgYWxsIHRoZSBpb3RocmVhZHMgKGJsaywNCj4gZXZlbnQs
Li4uKSBiZWZvcmUgY29udGludWluZy4gQnV0IEkgYW0gYSBiaXQgdW5zdXJlIGhvdyB0byBkbyB0
aGlzIGluDQo+IFFFTVUuDQo+IA0KDQpMb29raW5nIGF0IHZpcnRpby1ibGsuYyBJIHNlZSB0aGF0
IGl0IGRvZXMgc2VlbSB0byBjbG9zZSBvZmYgaXRzIGV2dGNobiBlcXVpdmFsZW50IGZyb20gaW90
aHJlYWQgY29udGV4dCB2aWEgYWlvX3dhaXRfYmhfb25lc2hvdCgpLiBTbyBJIHdvbmRlciB3aGV0
aGVyIHRoZSAncmlnaHQnIHRoaW5nIHRvIGRvIGlzIHRvIGNhbGwgeGVuX2RldmljZV91bmJpbmRf
ZXZlbnRfY2hhbm5lbCgpIHVzaW5nIHRoZSBzYW1lIG1lY2hhbmlzbSB0byBlbnN1cmUgeGVuX2Js
b2NrX2RhdGFwbGFuZV9ldmVudCgpIGNhbid0IHJhY2UuDQoNCiAgUGF1bA0KDQo+IENoZWVycywN
Cj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
