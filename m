Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4B150568
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:40:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iya2q-0003cB-PV; Mon, 03 Feb 2020 11:37:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iya2p-0003c6-84
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:37:35 +0000
X-Inumbo-ID: 92653ca2-4679-11ea-8e50-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92653ca2-4679-11ea-8e50-12813bfff9fa;
 Mon, 03 Feb 2020 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580729856; x=1612265856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Va5OoYB8HAHBuHtfEVPUK7gS3GErNXmNMP2GMwNmO10=;
 b=SA+llB12y1o81WHe+VQwHBeKqlvYCJwr434+JEYrm6EF/sBu0iX6cw3k
 M3DjUiaSgjhFBN9tG1FiewQwoxNXxFLb2fO8yaJSccd58/o0Sa/x33dTm
 wt4wh/tZcbwZE4nAcXJuPMNtVZT3L2fz/apRdB3fD22TDPmHpE9jJGBZS g=;
IronPort-SDR: jBS/9gNokzJwihl7BmaKpIxNM0vgSkQQbmw4BqxtOKHCUtqWDsfptELGgxli3E1eh26CB2Ze5O
 QW5OWiPoC6MQ==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="15402472"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 03 Feb 2020 11:37:35 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id EC3651419C1; Mon,  3 Feb 2020 11:37:32 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 11:37:32 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 11:37:31 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 11:37:30 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v6 05/11] x86/hyperv: setup hypercall page
Thread-Index: AQHV2F7h0j5uTCeDZUSwJbhowp1kHagFDuyAgAQ8dpCAAAekAIAABExQgAADuoCAAACXcA==
Date: Mon, 3 Feb 2020 11:37:30 +0000
Message-ID: <32f4362647654dad9a6dd9a8755a3ef9@EX13D32EUC003.ant.amazon.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
 <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
 <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
 <7fe8ad8c3fdc4375a25695a9b9728d06@EX13D32EUC003.ant.amazon.com>
 <4810a799-3e91-6828-898e-da6e778789f3@suse.com>
In-Reply-To: <4810a799-3e91-6828-898e-da6e778789f3@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjAgMTE6MzQNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2VpDQo+IExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geDg2L2h5cGVydjogc2V0dXAgaHlwZXJjYWxs
IHBhZ2UNCj4gDQo+IE9uIDAzLjAyLjIwMjAgMTI6MjEsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMDMgRmVicnVhcnkgMjAyMCAxMTowNg0KPiA+
PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiA+PiBDYzogV2Vp
IExpdSA8d2xAeGVuLm9yZz47IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tDQo+ID4+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29m
dC5jb20+Ow0KPiBXZWkNCj4gPj4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+ID4+IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA1LzEx
XSB4ODYvaHlwZXJ2OiBzZXR1cCBoeXBlcmNhbGwgcGFnZQ0KPiA+Pg0KPiA+PiBPbiAwMy4wMi4y
MDIwIDExOjM5LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPj4+PiBTZW50
OiAzMSBKYW51YXJ5IDIwMjAgMTc6NTcNCj4gPj4+PiBUbzogWGVuIERldmVsb3BtZW50IExpc3Qg
PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gPj4+PiBDYzogRHVycmFudCwgUGF1
bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgTWljaGFlbCBLZWxsZXkNCj4gPj4+PiA8bWlrZWxs
ZXlAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+OyBXZWkgTGl1
DQo+ID4+Pj4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBB
bmRyZXcgQ29vcGVyDQo+ID4+Pj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDA1LzExXSB4ODYvaHlwZXJ2OiBzZXR1cCBoeXBlcmNhbGwgcGFnZQ0KPiA+Pj4+DQo+
ID4+Pj4gKE5vdGUgdG8gc2VsZikNCj4gPj4+Pg0KPiA+Pj4+IE9uIEZyaSwgSmFuIDMxLCAyMDIw
IGF0IDA1OjQ5OjI0UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6DQo+ID4+Pj4gWy4uLl0NCj4gPj4+
Pj4gK3N0YXRpYyB1aW50NjRfdCBnZW5lcmF0ZV9ndWVzdF9pZCh2b2lkKQ0KPiA+Pj4+PiArew0K
PiA+Pj4+PiArICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlkOw0KPiA+Pj4+PiArDQo+ID4+Pj4N
Cj4gPj4+PiAgICAgICAgaWQucmF3ID0gMDsNCj4gPj4+DQo+ID4+PiBPciBqdXN0IHVzZSBhIEM5
OSBpbml0aWFsaXplciB0byBzZXQgdGhpbmdzIHVwLiBBIGJpdCBuZWF0ZXIgSU1PLg0KPiA+Pg0K
PiA+PiBJZiB5b3UgbWVhbiB0aGlzIGZvciAuLi4NCj4gPj4NCj4gPj4+Pj4gKyAgICBpZC52ZW5k
b3IgPSBIVl9YRU5fVkVORE9SX0lEOw0KPiA+Pj4+PiArICAgIGlkLm1ham9yID0geGVuX21ham9y
X3ZlcnNpb24oKTsNCj4gPj4+Pj4gKyAgICBpZC5taW5vciA9IHhlbl9taW5vcl92ZXJzaW9uKCk7
DQo+ID4+DQo+ID4+IC4uLiB0aGVzZSB0aHJlZSBmaWVsZHMsIHRoZW4gdGhpcyB3b24ndCB3b3Jr
IHdpdGggcmF0aGVyIG9sZCBnY2MNCj4gPj4gd2Ugc3RpbGwgcGVybWl0IHRvIGJlIHVzZWQuIFVz
aW5nIHsgLnJhdyA9IDAgfSB3b3VsZCB3b3JrIGFmYWljdC4NCj4gPj4NCj4gPg0KPiA+IE5vdCBl
dmVuIHsgLnZlbmRvciA9IEhWX1hFTl9WRU5ET1JfSUQgfSA/DQo+IA0KPiBObywgYmVjYXVzZSBv
ZiBpdCBiZWluZyBwYXJ0IG9mIGFuIHVubmFtZWQgKHN0cnVjdCkgbWVtYmVyIG9mDQo+IHRoZSB1
bmlvbi4NCg0KT2suLi4gc2hhbWUuIFByZXN1bWFibHkgYW4gZW1wdHkgaW5pdGlhbGl6ZXIgLSB7
fSAtICB3b3VsZCBiZSBvaz8NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
