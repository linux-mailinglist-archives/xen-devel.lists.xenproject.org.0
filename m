Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3948150532
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:26:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZnl-0002Fa-Ts; Mon, 03 Feb 2020 11:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyZnk-0002FQ-Kb
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:22:00 +0000
X-Inumbo-ID: 64b1d902-4677-11ea-8e4e-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64b1d902-4677-11ea-8e4e-12813bfff9fa;
 Mon, 03 Feb 2020 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580728920; x=1612264920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a+oLp1BQa5+ybi4HSYcyb2UVjGgKkWNt3m+cmf7Yebk=;
 b=VhDB/8grHQVkStUkkwsLXKFs4bNPBXXMM0V71ohHA+pQ27nrSPIv6suY
 BDpr7vyvs94vJgUmGA2gfgGJ/5sR57ICrmtNst0LTe/VC4DJP9XxjSH01
 AuZF5LnfUp9GHW3lAPku+p7OB9ScLAywxJ02I8X5jlTR8+3Zto4rfQCss M=;
IronPort-SDR: iEswwROYZ+gjw2q3tB/DJw9saS1Aftah6wVCOhYLAnum+vu9JM1+F3vvLPv5uOvKYRbU4ILklK
 WUJtkXlgyjIg==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="15400141"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 03 Feb 2020 11:21:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 48797A2819; Mon,  3 Feb 2020 11:21:56 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 11:21:56 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 11:21:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 11:21:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v6 05/11] x86/hyperv: setup hypercall page
Thread-Index: AQHV2F7h0j5uTCeDZUSwJbhowp1kHagFDuyAgAQ8dpCAAAekAIAABExQ
Date: Mon, 3 Feb 2020 11:21:55 +0000
Message-ID: <7fe8ad8c3fdc4375a25695a9b9728d06@EX13D32EUC003.ant.amazon.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
 <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
 <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
In-Reply-To: <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjAgMTE6MDYNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2VpDQo+IExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geDg2L2h5cGVydjogc2V0dXAgaHlwZXJjYWxs
IHBhZ2UNCj4gDQo+IE9uIDAzLjAyLjIwMjAgMTE6MzksIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFdlaSBMaXUgPHdsQHhl
bi5vcmc+DQo+ID4+IFNlbnQ6IDMxIEphbnVhcnkgMjAyMCAxNzo1Nw0KPiA+PiBUbzogWGVuIERl
dmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gPj4gQ2M6
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IE1pY2hhZWwgS2VsbGV5DQo+
ID4+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNv
bT47IFdlaSBMaXUNCj4gPj4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+ID4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsg
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMDUvMTFdIHg4Ni9oeXBlcnY6IHNldHVwIGh5cGVyY2FsbCBwYWdlDQo+ID4+
DQo+ID4+IChOb3RlIHRvIHNlbGYpDQo+ID4+DQo+ID4+IE9uIEZyaSwgSmFuIDMxLCAyMDIwIGF0
IDA1OjQ5OjI0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6DQo+ID4+IFsuLi5dDQo+ID4+PiArc3Rh
dGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpDQo+ID4+PiArew0KPiA+Pj4gKyAg
ICB1bmlvbiBodl9ndWVzdF9vc19pZCBpZDsNCj4gPj4+ICsNCj4gPj4NCj4gPj4gICAgICAgIGlk
LnJhdyA9IDA7DQo+ID4NCj4gPiBPciBqdXN0IHVzZSBhIEM5OSBpbml0aWFsaXplciB0byBzZXQg
dGhpbmdzIHVwLiBBIGJpdCBuZWF0ZXIgSU1PLg0KPiANCj4gSWYgeW91IG1lYW4gdGhpcyBmb3Ig
Li4uDQo+IA0KPiA+Pj4gKyAgICBpZC52ZW5kb3IgPSBIVl9YRU5fVkVORE9SX0lEOw0KPiA+Pj4g
KyAgICBpZC5tYWpvciA9IHhlbl9tYWpvcl92ZXJzaW9uKCk7DQo+ID4+PiArICAgIGlkLm1pbm9y
ID0geGVuX21pbm9yX3ZlcnNpb24oKTsNCj4gDQo+IC4uLiB0aGVzZSB0aHJlZSBmaWVsZHMsIHRo
ZW4gdGhpcyB3b24ndCB3b3JrIHdpdGggcmF0aGVyIG9sZCBnY2MNCj4gd2Ugc3RpbGwgcGVybWl0
IHRvIGJlIHVzZWQuIFVzaW5nIHsgLnJhdyA9IDAgfSB3b3VsZCB3b3JrIGFmYWljdC4NCj4gDQoN
Ck5vdCBldmVuIHsgLnZlbmRvciA9IEhWX1hFTl9WRU5ET1JfSUQgfSA/DQoNCiAgUGF1bA0KDQo+
IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
