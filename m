Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39590116F75
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:46:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieKGX-0001v0-8k; Mon, 09 Dec 2019 14:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieKGW-0001uu-55
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:44:00 +0000
X-Inumbo-ID: 554d56a0-1a92-11ea-87e6-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 554d56a0-1a92-11ea-87e6-12813bfff9fa;
 Mon, 09 Dec 2019 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575902639; x=1607438639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iGoWidMNVInFNhSXnKfxopkGV70iHnI0iGUx6t5L0Tc=;
 b=BcJn5LCVhJF6zBbJv6Dky9NBIOTPpt6Ud7f3+MlZPHUMwDQUaEtQQK78
 X3781gQPrEs9oMtl4YgL68t4Se85kHWeKpXiVWqk9tbVEVlZGonnOlFg/
 O2EKTI53G4mWhDt8cC6nkor5Jhn7QHSMfhe06qOcvsNw1Uxxq0GV7AjaH U=;
IronPort-SDR: exKL2d+tX+TkZJxYTtPt5xau58EUJegXsneRYllWlzaqrR9FvZ4QNFG+ZQ9wdzS/e/7oBrGU65
 /kuL8jcDNrSQ==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; 
   d="scan'208";a="6821072"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 09 Dec 2019 14:43:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id AAF7BA1C78; Mon,  9 Dec 2019 14:43:56 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:43:56 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:43:55 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 14:43:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEWoCAAAHxUIAAAeGAgAAAtoCAABhzAIAABs0QgAAB3ACAAAKyUIAABhkAgAAAQJA=
Date: Mon, 9 Dec 2019 14:43:54 +0000
Message-ID: <2fe66a09f53745bdac1f0858004797d5@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
 <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
 <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
 <63d653a04207451e9041c89acd04f2a2@EX13D32EUC003.ant.amazon.com>
 <2cd2a27e-2bb8-bd9d-45d8-1710038fb97a@suse.com>
 <c86eadaf008f48aeb4bb7140a80b69e6@EX13D32EUC003.ant.amazon.com>
 <1c4c9b3e-31a5-d8b3-01de-3ad84db6390a@suse.com>
 <380d160eb06c45e5962fe85aedd79ed5@EX13D32EUC003.ant.amazon.com>
 <208da9ea-738d-f4f8-fc0d-71523148deeb@suse.com>
In-Reply-To: <208da9ea-738d-f4f8-fc0d-71523148deeb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTQ6NDENCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQm9yaXMgT3N0cm92c2t5DQo+IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhlbmJ1
czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8NCj4gY2xvc2VkDQo+IA0KPiBPbiAwOS4x
Mi4xOSAxNToyMywgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg0KPiA+
PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDE0OjEwDQo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+ID4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFN0ZWZhbm8NCj4gPj4gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJvcmlzIE9zdHJvdnNreQ0KPiA+PiA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80
XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMgZm9yY2VkDQo+IHRvDQo+ID4+IGNsb3NlZA0K
PiA+Pg0KPiA+PiBPbiAwOS4xMi4xOSAxNTowNiwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IErDvHJnZW4gR3Jvw58g
PGpncm9zc0BzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDEzOjM5DQo+
ID4+Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBSb2dlciBQYXUg
TW9ubsOpDQo+ID4+Pj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+Pj4+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+
ID4+IFN0ZWZhbm8NCj4gPj4+PiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
Qm9yaXMgT3N0cm92c2t5DQo+ID4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPg0KPiA+
Pj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80XSB4ZW5idXM6IGxpbWl0IHdo
ZW4gc3RhdGUgaXMNCj4gZm9yY2VkDQo+ID4+IHRvDQo+ID4+Pj4gY2xvc2VkDQo+ID4+Pj4NCj4g
Pj4+PiBPbiAwOS4xMi4xOSAxMzoxOSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4+Pj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+ID4+Pj4+PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDEyOjA5DQo+
ID4+Pj4+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT47IFJvZ2VyIFBh
dSBNb25uw6kNCj4gPj4+Pj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4+Pj4+IENjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7DQo+ID4+Pj4gU3RlZmFubw0KPiA+Pj4+Pj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IEJvcmlzIE9zdHJvdnNreQ0KPiA+Pj4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPg0KPiA+Pj4+Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhl
bmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcw0KPiA+PiBmb3JjZWQNCj4gPj4+PiB0bw0KPiA+Pj4+
Pj4gY2xvc2VkDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMDkuMTIuMTkgMTM6MDMsIER1cnJhbnQs
IFBhdWwgd3JvdGU6DQo+ID4+Pj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
Pj4+Pj4+IEZyb206IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4NCj4gPj4+Pj4+Pj4g
U2VudDogMDkgRGVjZW1iZXIgMjAxOSAxMTo1NQ0KPiA+Pj4+Pj4+PiBUbzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBEdXJyYW50LCBQYXVsDQo+ID4+Pj4+Pj4+IDxw
ZHVycmFudEBhbWF6b24uY29tPg0KPiA+Pj4+Pj4+PiBDYzogbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+Pj4+Pj4gU3RlZmFu
bw0KPiA+Pj4+Pj4+PiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQm9yaXMg
T3N0cm92c2t5DQo+ID4+Pj4+Pj4+IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4NCj4gPj4+
Pj4+Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhlbmJ1czogbGltaXQg
d2hlbiBzdGF0ZSBpcw0KPiA+Pj4+IGZvcmNlZA0KPiA+Pj4+Pj4gdG8NCj4gPj4+Pj4+Pj4gY2xv
c2VkDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IE9uIDA5LjEyLjE5IDEyOjM5LCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOg0KPiA+Pj4+Pj4+Pj4gT24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDI6MDE6
MjFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4+Pj4+Pj4+IE9ubHkgZm9yY2Ug
c3RhdGUgdG8gY2xvc2VkIGluIHRoZSBjYXNlIHdoZW4gdGhlIHRvb2xzdGFjayBtYXkNCj4gPj4g
bmVlZA0KPiA+Pj4+IHRvDQo+ID4+Pj4+Pj4+Pj4gY2xlYW4gdXAuIFRoaXMgY2FuIGJlIGRldGVj
dGVkIGJ5IGNoZWNraW5nIHdoZXRoZXIgdGhlIHN0YXRlIGluDQo+ID4+Pj4+Pj4+IHhlbnN0b3Jl
DQo+ID4+Pj4+Pj4+Pj4gaGFzIGJlZW4gc2V0IHRvIGNsb3NpbmcgcHJpb3IgdG8gZGV2aWNlIHJl
bW92YWwuDQo+ID4+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+Pj4gSSdtIG5vdCBzdXJlIEkgc2VlIHRoZSBw
b2ludCBvZiB0aGlzLCBJIHdvdWxkIGV4cGVjdCB0aGF0IGENCj4gPj4gZmFpbHVyZQ0KPiA+Pj4+
IHRvDQo+ID4+Pj4+Pj4+PiBwcm9iZSBvciB0aGUgcmVtb3ZhbCBvZiB0aGUgZGV2aWNlIHdvdWxk
IGxlYXZlIHRoZSB4ZW5idXMgc3RhdGUNCj4gYXMNCj4gPj4+Pj4+Pj4+IGNsb3NlZCwgd2hpY2gg
aXMgY29uc2lzdGVudCB3aXRoIHRoZSBhY3R1YWwgZHJpdmVyIHN0YXRlLg0KPiA+Pj4+Pj4+Pj4N
Cj4gPj4+Pj4+Pj4+IENhbiB5b3UgZXhwbGFpbiB3aGF0J3MgdGhlIGJlbmVmaXQgb2YgbGVhdmlu
ZyBhIGRldmljZSB3aXRob3V0IGENCj4gPj4+Pj4+Pj4+IGRyaXZlciBpbiBzdWNoIHVua25vd24g
c3RhdGU/DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IEFuZCBtb3JlIGNvbmNlcm5pbmc6IGRpZCB5
b3UgY2hlY2sgdGhhdCBubyBmcm9udGVuZC9iYWNrZW5kIGlzDQo+ID4+Pj4+Pj4+IHJlbHlpbmcg
b24gdGhlIGNsb3NlZCBzdGF0ZSB0byBiZSB2aXNpYmxlIHdpdGhvdXQgY2xvc2luZyBoYXZpbmcN
Cj4gPj4gYmVlbg0KPiA+Pj4+Pj4+PiBzZXQgYmVmb3JlPw0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4g
QmxrZnJvbnQgZG9lc24ndCBzZWVtIHRvIG1pbmQgYW5kIEkgYmVsaWV2ZSB0aGUgV2luZG93cyBQ
ViBkcml2ZXJzDQo+ID4+Pj4gY29wZSwNCj4gPj4+Pj4+IGJ1dCBJIGRvbid0IHJlYWxseSB1bmRl
cnN0YW5kIHRoZSBjb21tZW50IHNpbmNlIHRoaXMgcGF0Y2ggaXMNCj4gPj4gYWN0dWFsbHkNCj4g
Pj4+Pj4+IHJlbW92aW5nIGEgY2FzZSB3aGVyZSB0aGUgYmFja2VuZCB0cmFuc2l0aW9ucyBkaXJl
Y3RseSB0byBjbG9zZWQuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gSSdtIG5vdCBzcGVha2luZyBvZiBi
bGtmcm9udC9ibGtiYWNrIG9ubHksIGJ1dCBvZiBuZXQsIHRwbSwgc2NzaSwNCj4gPj4+PiBwdmNh
bGwNCj4gPj4+Pj4+IGV0Yy4gZnJvbnRlbmRzL2JhY2tlbmRzLiBBZnRlciBhbGwgeW91IGFyZSBt
b2RpZnlpbmcgYSBmdW5jdGlvbg0KPiA+PiBjb21tb24NCj4gPj4+Pj4+IHRvIGFsbCBQViBkcml2
ZXIgcGFpcnMuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gWW91IGFyZSByZW1vdmluZyBhIHN0YXRlIHN3
aXRjIHRvICJjbG9zZWQiIGluIGNhc2UgdGhlIHN0YXRlIHdhcw0KPiA+PiBfbm90Xw0KPiA+Pj4+
Pj4gImNsb3NpbmciIGJlZm9yZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gWWVzLCB3aGljaCBBRkFJSyBp
cyBhZ2FpbnN0IHRoZSBpbnRlbnRpb24gb2YgdGhlIGdlbmVyaWMgUFYgcHJvdG9jb2wNCj4gPj4+
PiBzdWNoIHRoYXQgaXQgZXZlciBleGlzdGVkIGFueXdheS4NCj4gPj4+Pg0KPiA+Pj4+IFdoaWxl
IHRoaXMgbWlnaHQgYmUgdGhlIGNhc2Ugd2Ugc2hvdWxkIF9ub3RfIGJyZWFrIGFueSBndWVzdHMN
Cj4gPj4+PiBydW5uaW5nIG5vdy4gU28gdGhpcyBraW5kIG9mIHJlYXNvbmluZyBpcyBkYW5nZXJv
dXMuDQo+ID4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4+IFNvIGFueSBQViBkcml2ZXIgcmVhY3Rpbmcg
dG8gImNsb3NlZCIgb2YgdGhlIG90aGVyIGVuZA0KPiA+Pj4+Pj4gaW4gY2FzZSB0aGUgcHJldmlv
dXMgc3RhdGUgbWlnaHQgbm90IGhhdmUgYmVlbiAiY2xvc2luZyIgYmVmb3JlIGlzDQo+IGF0DQo+
ID4+Pj4+PiByaXNrIHRvIG1pc2JlaGF2ZSB3aXRoIHlvdXIgcGF0Y2guDQo+ID4+Pj4+DQo+ID4+
Pj4+IFdlbGwsIHRoZXkgd2lsbCBzZWUgbm90aGluZyBub3cuIElmIHRoZSBzdGF0ZSB3YXMgbm90
IGNsb3NpbmcsIGl0DQo+IGdldHMNCj4gPj4+PiBsZWZ0IGFsb25lLCBzbyB0aGUgZnJvbnRlbmQg
c2hvdWxkbid0IGRvIGFueXRoaW5nLiBUaGUgb25seSByaXNrIHRoYXQNCj4gSQ0KPiA+Pj4+IGNh
biBzZWUgaXMgdGhhdCBzb21lIGZyb250ZW5kL2JhY2tlbmQgcGFpciBuZWVkZWQgYSBkaXJlY3Qg
NCAtPiA2DQo+ID4+Pj4gdHJhbnNpdGlvbiB0byBzdXBwb3J0ICd1bmJpbmQnIGJlZm9yZSBidXQg
QUZBSUsgbm90aGluZyBoYXMgZXZlcg0KPiA+PiBzdXBwb3J0ZWQNCj4gPj4+PiB0aGF0LCBhbmQg
YmxrIGFuZCBuZXQgY3Jhc2gnbididXJuIGlmIHlvdSB0cnkgdGhhdCBvbiB1cHN0cmVhbSBhcyBp
dA0KPiA+Pj4+IHN0YW5kcy4gQSBjbGVhbiB1bnBsdWcgd291bGQgYWx3YXlzIHNldCBzdGF0ZSB0
byA1IGZpcnN0LCBzaW5jZQ0KPiB0aGF0J3MNCj4gPj4+PiBwYXJ0IG9mIHRoZSB1bnBsdWcgcHJv
dG9jb2wuDQo+ID4+Pj4NCj4gPj4+PiBUaGF0IHdhcyBteSBxdWVzdGlvbjogYXJlIHlvdSBzdXJl
IGFsbCBjdXJyZW50IGFuZCBwcmV2aW91cw0KPiA+Pj4+IGd1ZXN0IGZyb250ZW5kcyBhbmQgYmFj
a2VuZHMgYXJlIGhhbmRsaW5nIHVucGx1ZyB0aGlzIHdheT8NCj4gPj4+Pg0KPiA+Pj4+IE5vdCAi
c2hvdWxkIGhhbmRsZSIsIGJ1dCAiZG8gaGFuZGxlIi4NCj4gPj4+DQo+ID4+PiBUaGF0IGRlcGVu
ZHMgb24gdGhlIHRvb2xzdGFjay4gSUlVQyB0aGUgb25seSAnc3VwcG9ydGVkJyB0b29sc3RhY2sg
aXMNCj4gPj4geGwvbGlieGwsIHdoaWNoIHdpbGwgc2V0ICdzdGF0ZScgdG8gNSBhbmQgJ29ubGlu
ZScgdG8gMCB0byBpbml0aWF0ZSBhbg0KPiA+PiB1bnBsdWcuDQo+ID4+DQo+ID4+IEkgZ3Vlc3Mg
bGlidmlydC9saWJ4bCBpcyBkb2luZyB0aGUgc2FtZT8NCj4gPj4NCj4gPg0KPiA+IFRoZSB1bnBs
dWcgbWVjaGFuc2lzbSBpcyBhbGwgaW4gbGlieGwgQUZBSUNULCBzbyBpdCBzaG91bGQgYmUgaWRl
bnRpY2FsLg0KPiA+DQo+ID4+IEF0IGxlYXN0IGF0IFNVU0Ugd2Ugc3RpbGwgaGF2ZSBzb21lIGN1
c3RvbWVycyBydW5uaW5nIHhlbmQgYmFzZWQNCj4gPj4gWGVuIGluc3RhbGxhdGlvbnMgd2l0aCBy
ZWNlbnQgTGludXggb3IgV2luZG93cyBndWVzdHMuDQo+ID4+DQo+ID4NCj4gPiBJcyB0aGF0IHNv
bWV0aGluZyB0aGUgdXBzdHJlYW0gY29kZSBjYW4vc2hvdWxkIHN1cHBvcnQgdGhvdWdoPyBJJ2Qg
YmUNCj4gc3VycHJpc2VkIGlmIHhlbmQgaXMgYWN0dWFsbHkgZG9pbmcgYW55dGhpbmcgZGlmZmVy
ZW50IHRvIGxpYnhsIHNpbmNlIEkndmUNCj4gYmVlbiBjb2RpbmcgdGhlIFdpbmRvd3MgUFYgZHJp
dmVycyB0byB0cmlnZ2VyIG9mZiB0aGUgY29tYmluZWQNCj4gY2xvc2luZy9vbmxpbmUgdHJhbnNp
dGlvbiBmb3IgYXMgbG9uZyBhcyBJIGNhbiByZW1lbWJlci4NCj4gDQo+IEknZCByYXRoZXIgbm90
IGhhdmUgdG8gY2FycnkgYSBwcml2YXRlIHBhdGNoIGZvciBuZXcgTGludXgga2VybmVsIHRvIGJl
DQo+IGFibGUgdG8gcnVuIG9uIHRob3NlIGhvc3RzLg0KPiANCj4gQUZBSUsgeW91IGF0IEFtYXpv
biBoYXZlIHNvbWUgcXVpdGUgb2xkIFhlbiBpbnN0YWxsYXRpb25zLCB0b28uIEhvdyBhcmUNCj4g
eW91IGhhbmRsaW5nIHRoYXQgKGFzc3VtaW5nIHRoZSBjdXN0b21lciBpcyB1cGRhdGluZyB0aGUg
a2VybmVsIHRvIGENCj4gcmVjZW50IHZlcnNpb24gaW4gaGlzIGd1ZXN0KT8NCg0KSSdtIG5vdCBh
d2FyZSBvZiBhbnkgcHJvYmxlbXMgcnVubmluZyB3aXRoIHhlbmQgKGJ1dCBJJ20gbm90IEkgdGhl
IGxvb3Agb24gZXZlcnl0aGluZykuIEkgdGhpbmsgaXQgaXMgc3RpbGwgYSByZWFzb25hYmx5IHNh
ZmUgYXNzdW1wdGlvbiB0aGF0IHhlbmQgaW5pdGlhdGVkIHVucGx1ZyBjbGVhbmx5IGFuZCBkb2Vz
bid0IHJlbHkgb24gYSA0IC0+IDYgdHJhbnNpdGlvbi4NCg0KICBQYXVsDQoNCj4gDQo+IA0KPiBK
dWVyZ2VuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
