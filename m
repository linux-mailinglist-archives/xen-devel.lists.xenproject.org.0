Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA55150596
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:43:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iya7B-0004Xb-1P; Mon, 03 Feb 2020 11:42:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iya79-0004XV-Me
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:42:03 +0000
X-Inumbo-ID: 31d990c6-467a-11ea-8396-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31d990c6-467a-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580730123; x=1612266123;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TEiKW4Hei5lpjnyUoE9fxt34snSe7++ZGi2/HcOp3nA=;
 b=JZxnycnOyvLpffsEav7uN81IAWUCrC4tB2jCmDN+Bg6sVWbQMaFdHUL/
 Yv9xuZk/KKf4FbGigCz4rT4Lwzdm4ubtpb+IecOJ2i6/PVUKUWKrrPzBZ
 0WL26m+JApjrdnIfQLkoGn+E0tSXPiT2adoyJYFTUd4cB0YDwqH7DXwAZ U=;
IronPort-SDR: 88+n215jcxKrxH8w/ci6PQgYclTAjQvONOoKPqkzCg7w+U1N4KugfmkO+zSjDrFQO4glxXq8qK
 MChqq0eQMRNw==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="24025620"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 03 Feb 2020 11:42:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8241EA255B; Mon,  3 Feb 2020 11:41:59 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 11:41:58 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 11:41:57 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 11:41:57 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v6 05/11] x86/hyperv: setup hypercall page
Thread-Index: AQHV2F7h0j5uTCeDZUSwJbhowp1kHagFDuyAgAQ8dpCAAAekAIAABExQgAADuoCAAACXcIAAAMcAgAAAa+A=
Date: Mon, 3 Feb 2020 11:41:57 +0000
Message-ID: <d15e9f9204a8421f9e6553d53753ad2f@EX13D32EUC003.ant.amazon.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200131175659.5nabkw7joiaepku2@debian>
 <397903e741134867a20bbbb92322e5e8@EX13D32EUC003.ant.amazon.com>
 <5b057f62-d238-267d-3e99-6c43c416e629@suse.com>
 <7fe8ad8c3fdc4375a25695a9b9728d06@EX13D32EUC003.ant.amazon.com>
 <4810a799-3e91-6828-898e-da6e778789f3@suse.com>
 <32f4362647654dad9a6dd9a8755a3ef9@EX13D32EUC003.ant.amazon.com>
 <c332bf8b-b075-9568-ace8-54c61ca14397@suse.com>
In-Reply-To: <c332bf8b-b075-9568-ace8-54c61ca14397@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjAgMTE6MzkNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2VpDQo+IExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0geDg2L2h5cGVydjogc2V0dXAgaHlwZXJjYWxs
IHBhZ2UNCj4gDQo+IE9uIDAzLjAyLjIwMjAgMTI6MzcsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMDMgRmVicnVhcnkgMjAyMCAxMTozNA0KPiA+
PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiA+PiBDYzogV2Vp
IExpdSA8d2xAeGVuLm9yZz47IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tDQo+ID4+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29m
dC5jb20+Ow0KPiBXZWkNCj4gPj4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+ID4+IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA1LzEx
XSB4ODYvaHlwZXJ2OiBzZXR1cCBoeXBlcmNhbGwgcGFnZQ0KPiA+Pg0KPiA+PiBPbiAwMy4wMi4y
MDIwIDEyOjIxLCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiA+Pj4+IFNlbnQ6IDAzIEZlYnJ1YXJ5IDIwMjAgMTE6MDYNCj4gPj4+PiBUbzogRHVycmFudCwg
UGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiA+Pj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPjsgWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi0NCj4gPj4+PiBkZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsNCj4g
Pj4gV2VpDQo+ID4+Pj4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+ID4+Pj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNS8xMV0g
eDg2L2h5cGVydjogc2V0dXAgaHlwZXJjYWxsIHBhZ2UNCj4gPj4+Pg0KPiA+Pj4+IE9uIDAzLjAy
LjIwMjAgMTE6MzksIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4+Pj4+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+Pj4gRnJvbTogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPj4+
Pj4+IFNlbnQ6IDMxIEphbnVhcnkgMjAyMCAxNzo1Nw0KPiA+Pj4+Pj4gVG86IFhlbiBEZXZlbG9w
bWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+DQo+ID4+Pj4+PiBDYzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgTWljaGFlbCBLZWxsZXkNCj4g
Pj4+Pj4+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0
LmNvbT47IFdlaSBMaXUNCj4gPj4+Pj4+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA+Pj4+Pj4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4+
Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMDUvMTFdIHg4Ni9oeXBlcnY6IHNldHVwIGh5cGVy
Y2FsbCBwYWdlDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gKE5vdGUgdG8gc2VsZikNCj4gPj4+Pj4+DQo+
ID4+Pj4+PiBPbiBGcmksIEphbiAzMSwgMjAyMCBhdCAwNTo0OToyNFBNICswMDAwLCBXZWkgTGl1
IHdyb3RlOg0KPiA+Pj4+Pj4gWy4uLl0NCj4gPj4+Pj4+PiArc3RhdGljIHVpbnQ2NF90IGdlbmVy
YXRlX2d1ZXN0X2lkKHZvaWQpDQo+ID4+Pj4+Pj4gK3sNCj4gPj4+Pj4+PiArICAgIHVuaW9uIGh2
X2d1ZXN0X29zX2lkIGlkOw0KPiA+Pj4+Pj4+ICsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAgICAgICAg
aWQucmF3ID0gMDsNCj4gPj4+Pj4NCj4gPj4+Pj4gT3IganVzdCB1c2UgYSBDOTkgaW5pdGlhbGl6
ZXIgdG8gc2V0IHRoaW5ncyB1cC4gQSBiaXQgbmVhdGVyIElNTy4NCj4gPj4+Pg0KPiA+Pj4+IElm
IHlvdSBtZWFuIHRoaXMgZm9yIC4uLg0KPiA+Pj4+DQo+ID4+Pj4+Pj4gKyAgICBpZC52ZW5kb3Ig
PSBIVl9YRU5fVkVORE9SX0lEOw0KPiA+Pj4+Pj4+ICsgICAgaWQubWFqb3IgPSB4ZW5fbWFqb3Jf
dmVyc2lvbigpOw0KPiA+Pj4+Pj4+ICsgICAgaWQubWlub3IgPSB4ZW5fbWlub3JfdmVyc2lvbigp
Ow0KPiA+Pj4+DQo+ID4+Pj4gLi4uIHRoZXNlIHRocmVlIGZpZWxkcywgdGhlbiB0aGlzIHdvbid0
IHdvcmsgd2l0aCByYXRoZXIgb2xkIGdjYw0KPiA+Pj4+IHdlIHN0aWxsIHBlcm1pdCB0byBiZSB1
c2VkLiBVc2luZyB7IC5yYXcgPSAwIH0gd291bGQgd29yayBhZmFpY3QuDQo+ID4+Pj4NCj4gPj4+
DQo+ID4+PiBOb3QgZXZlbiB7IC52ZW5kb3IgPSBIVl9YRU5fVkVORE9SX0lEIH0gPw0KPiA+Pg0K
PiA+PiBObywgYmVjYXVzZSBvZiBpdCBiZWluZyBwYXJ0IG9mIGFuIHVubmFtZWQgKHN0cnVjdCkg
bWVtYmVyIG9mDQo+ID4+IHRoZSB1bmlvbi4NCj4gPg0KPiA+IE9rLi4uIHNoYW1lLiBQcmVzdW1h
Ymx5IGFuIGVtcHR5IGluaXRpYWxpemVyIC0ge30gLSAgd291bGQgYmUgb2s/DQo+IA0KPiBJIHRo
aW5rIHNvLCB5ZXMuIEkgdW5kZXJzdGFuZCB5b3UnZCBsaWtlIHRoaXMgYmV0dGVyIHRoYW4NCj4g
eyAucmF3ID0gMCB9ID8NCj4gDQoNClllcy4gSW4gZ2VuZXJhbCwgdXNpbmcgYSBjOTkgaW5pdGlh
bGl6ZXIgdG8gZXhwbGljaXRseSBzZXQgc29tZXRoaW5nIHRvIDAgc2VlbXMgYSBiaXQgcmVkdW5k
YW50IHRvIG1lLg0KDQogIFBhdWwNCg0KPiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
