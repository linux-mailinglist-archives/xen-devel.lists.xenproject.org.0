Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D48167AE2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 11:36:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j55d0-0008Va-Tu; Fri, 21 Feb 2020 10:33:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9FNp=4J=amazon.co.uk=prvs=313f46acb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j55cy-0008VV-QS
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:33:48 +0000
X-Inumbo-ID: a475dde7-5495-11ea-8622-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a475dde7-5495-11ea-8622-12813bfff9fa;
 Fri, 21 Feb 2020 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582281229; x=1613817229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Icj/QM3WRK8rzgrH5UZj/qyzMGOKB3KQesC2wNeSdyA=;
 b=BEbALJ6Foyw1SIdlrBeBxgqIRGbq34qsMMPAWjLfaDMnPWdAt69uJJgI
 k0Y8xDQMKGQzmJ7EE359KB0mlKZp2X5rlgcZufsdBsN6Jq91mAt39dPtA
 ZuYhXtx99yrj0V5wi7FIBSb67XUVuiaw1yw1jcb8wgqPTbUbyBCEapvEm 8=;
IronPort-SDR: +PxkK+n1oxJ3ulW13Vw7G4yj4RSXk27rjbkB6oZO78HYL59lNh94e4FAvFGpsfCQdw594otsCh
 pDO4CgAV6uIg==
X-IronPort-AV: E=Sophos;i="5.70,467,1574121600"; d="scan'208";a="18283252"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Feb 2020 10:33:46 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id BA354A0611; Fri, 21 Feb 2020 10:33:44 +0000 (UTC)
Received: from EX13D10UWA004.ant.amazon.com (10.43.160.64) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 10:33:44 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D10UWA004.ant.amazon.com (10.43.160.64) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 21 Feb 2020 10:33:43 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 21 Feb 2020 10:33:42 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks for
 PM suspend and hibernation
Thread-Index: AQHV446AUecZloiSDUiowKQxKdi9t6gfLFuAgADaIoCAAKqFgIACJekAgAD0YQCAAAHOgIAAdTyAgAAHU1CAAAptgIAAAgSwgAETnYCAAAiO8IAAB/sAgAACgiA=
Date: Fri, 21 Feb 2020 10:33:42 +0000
Message-ID: <66a211bae1de4be9861ef8393607d1b3@EX13D32EUC003.ant.amazon.com>
References: <20200218091611.GN4679@Air-de-Roger>
 <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200220083904.GI4679@Air-de-Roger>
 <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
 <20200220154507.GO4679@Air-de-Roger>
 <c9662397256a4568a5cc7d70a84940e5@EX13D32EUC003.ant.amazon.com>
 <20200220164839.GR4679@Air-de-Roger>
 <e42fa35800f04b6f953e4af87f2c1a02@EX13D32EUC003.ant.amazon.com>
 <20200221092219.GU4679@Air-de-Roger>
 <5ddf980a3fba4fb39571184e688cefc5@EX13D32EUC003.ant.amazon.com>
 <20200221102130.GW4679@Air-de-Roger>
In-Reply-To: <20200221102130.GW4679@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.171]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks
 for PM suspend and hibernation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Valentin, Eduardo" <eduval@amazon.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "x86@kernel.org" <x86@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "Agarwal,
 Anchal" <anchalag@amazon.com>, "bp@alien8.de" <bp@alien8.de>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMjEgRmVicnVhcnkgMjAyMCAxMDoyMg0KPiBU
bzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogQWdhcndhbCwg
QW5jaGFsIDxhbmNoYWxhZ0BhbWF6b24uY29tPjsgVmFsZW50aW4sIEVkdWFyZG8NCj4gPGVkdXZh
bEBhbWF6b24uY29tPjsgbGVuLmJyb3duQGludGVsLmNvbTsgcGV0ZXJ6QGluZnJhZGVhZC5vcmc7
DQo+IGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZzsgeDg2QGtlcm5lbC5vcmc7IGxpbnV4LW1tQGt2
YWNrLm9yZzsNCj4gcGF2ZWxAdWN3LmN6OyBocGFAenl0b3IuY29tOyB0Z2x4QGxpbnV0cm9uaXgu
ZGU7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7DQo+IGZsbGluZGVuQGFtYW96bi5jb207IEthbWF0
YSwgTXVuZWhpc2EgPGthbWF0YW1AYW1hem9uLmNvbT47DQo+IG1pbmdvQHJlZGhhdC5jb207IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgU2luZ2gsIEJhbGJpcg0KPiA8c2JsYmlyQGFt
YXpvbi5jb20+OyBheGJvZUBrZXJuZWwuZGs7IGtvbnJhZC53aWxrQG9yYWNsZS5jb207DQo+IGJw
QGFsaWVuOC5kZTsgYm9yaXMub3N0cm92c2t5QG9yYWNsZS5jb207IGpncm9zc0BzdXNlLmNvbTsN
Cj4gbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtcG1Admdlci5rZXJuZWwub3JnOyByandA
cmp3eXNvY2tpLm5ldDsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgdmt1em5ldHNA
cmVkaGF0LmNvbTsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsNCj4gV29vZGhvdXNlLCBEYXZpZCA8ZHdt
d0BhbWF6b24uY28udWs+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUkZDIFBBVENIIHYz
IDA2LzEyXSB4ZW4tYmxrZnJvbnQ6IGFkZCBjYWxsYmFja3MNCj4gZm9yIFBNIHN1c3BlbmQgYW5k
IGhpYmVybmF0aW9uDQo+IA0KPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAwOTo1Njo1NEFNICsw
MDAwLCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0K
PiA+ID4gU2VudDogMjEgRmVicnVhcnkgMjAyMCAwOToyMg0KPiA+ID4gVG86IER1cnJhbnQsIFBh
dWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gPiA+IENjOiBBZ2Fyd2FsLCBBbmNoYWwgPGFu
Y2hhbGFnQGFtYXpvbi5jb20+OyBWYWxlbnRpbiwgRWR1YXJkbw0KPiA+ID4gPGVkdXZhbEBhbWF6
b24uY29tPjsgbGVuLmJyb3duQGludGVsLmNvbTsgcGV0ZXJ6QGluZnJhZGVhZC5vcmc7DQo+ID4g
PiBiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc7IHg4NkBrZXJuZWwub3JnOyBsaW51eC1tbUBrdmFj
ay5vcmc7DQo+ID4gPiBwYXZlbEB1Y3cuY3o7IGhwYUB6eXRvci5jb207IHRnbHhAbGludXRyb25p
eC5kZTsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsNCj4gPiA+IGZsbGluZGVuQGFtYW96bi5j
b207IEthbWF0YSwgTXVuZWhpc2EgPGthbWF0YW1AYW1hem9uLmNvbT47DQo+ID4gPiBtaW5nb0By
ZWRoYXQuY29tOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFNpbmdoLCBCYWxiaXIN
Cj4gPiA+IDxzYmxiaXJAYW1hem9uLmNvbT47IGF4Ym9lQGtlcm5lbC5kazsga29ucmFkLndpbGtA
b3JhY2xlLmNvbTsNCj4gPiA+IGJwQGFsaWVuOC5kZTsgYm9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b207IGpncm9zc0BzdXNlLmNvbTsNCj4gPiA+IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LXBtQHZnZXIua2VybmVsLm9yZzsgcmp3QHJqd3lzb2NraS5uZXQ7DQo+ID4gPiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyB2a3V6bmV0c0ByZWRoYXQuY29tOw0KPiBkYXZlbUBkYXZlbWxv
ZnQubmV0Ow0KPiA+ID4gV29vZGhvdXNlLCBEYXZpZCA8ZHdtd0BhbWF6b24uY28udWs+DQo+ID4g
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1JGQyBQQVRDSCB2MyAwNi8xMl0geGVuLWJsa2Zy
b250OiBhZGQNCj4gY2FsbGJhY2tzDQo+ID4gPiBmb3IgUE0gc3VzcGVuZCBhbmQgaGliZXJuYXRp
b24NCj4gPiA+DQo+ID4gPiBPbiBUaHUsIEZlYiAyMCwgMjAyMCBhdCAwNTowMTo1MlBNICswMDAw
LCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+ID4gPiA+ID4gSG9wZWZ1bGx5IHdoYXQgSSBzYWlk
IGFib3ZlIGlsbHVzdHJhdGVzIHdoeSBpdCBtYXkgbm90IGJlIDEwMCUNCj4gPiA+IGNvbW1vbi4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IFllcywgdGhhdCdzIGZpbmUuIEkgZG9uJ3QgZXhwZWN0IGl0
IHRvIGJlIDEwMCUgY29tbW9uIChhcyBJIGd1ZXNzDQo+ID4gPiA+ID4gdGhhdCB0aGUgaG9va3Mg
d2lsbCBoYXZlIGRpZmZlcmVudCBwcm90b3R5cGVzKSwgYnV0IEkgZXhwZWN0DQo+ID4gPiA+ID4g
dGhhdCByb3V0aW5lcyBjYW4gYmUgc2hhcmVkLCBhbmQgdGhhdCB0aGUgYXBwcm9hY2ggdGFrZW4g
Y2FuIGJlDQo+IHRoZQ0KPiA+ID4gPiA+IHNhbWUuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBGb3Ig
ZXhhbXBsZSBvbmUgbmVjZXNzYXJ5IGRpZmZlcmVuY2Ugd2lsbCBiZSB0aGF0IHhlbmJ1cyBpbml0
aWF0ZWQNCj4gPiA+ID4gPiBzdXNwZW5kIHdvbid0IGNsb3NlIHRoZSBQViBjb25uZWN0aW9uLCBp
biBjYXNlIHN1c3BlbnNpb24gZmFpbHMuDQo+IE9uIFBNDQo+ID4gPiA+ID4gc3VzcGVuZCB5b3Ug
c2VlbSB0byBhbHdheXMgY2xvc2UgdGhlIGNvbm5lY3Rpb24gYmVmb3JlaGFuZCwgc28geW91DQo+
ID4gPiA+ID4gd2lsbCBhbHdheXMgaGF2ZSB0byByZS1uZWdvdGlhdGUgb24gcmVzdW1lIGV2ZW4g
aWYgc3VzcGVuc2lvbg0KPiBmYWlsZWQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXaGF0IEknbSBt
b3N0bHkgd29ycmllZCBhYm91dCBpcyB0aGUgZGlmZmVyZW50IGFwcHJvYWNoIHRvIHJpbmcNCj4g
PiA+ID4gPiBkcmFpbmluZy4gSWU6IGVpdGhlciB4ZW5idXMgaXMgY2hhbmdlZCB0byBmcmVlemUg
dGhlIHF1ZXVlcyBhbmQNCj4gZHJhaW4NCj4gPiA+ID4gPiB0aGUgc2hhcmVkIHJpbmdzLCBvciBQ
TSB1c2VzIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGxvZ2ljIG9mIG5vdA0KPiA+ID4gPiA+IGZsdXNo
aW5nIHRoZSByaW5ncyBhbiByZS1pc3N1aW5nIGluLWZsaWdodCByZXF1ZXN0cyBvbiByZXN1bWUu
DQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gWWVzLCB0aGF0J3MgbmVlZHMgY29uc2lkZXJh
dGlvbi4gSSBkb27igJl0IHRoaW5rIHRoZSBzYW1lIHNlbWFudGljIGNhbg0KPiBiZQ0KPiA+ID4g
c3VpdGFibGUgZm9yIGJvdGguIEUuZy4gaW4gYSB4ZW4tc3VzcGVuZCB3ZSBuZWVkIHRvIGZyZWV6
ZSB3aXRoIGFzDQo+IGxpdHRsZQ0KPiA+ID4gcHJvY2Vzc2luZyBhcyBwb3NzaWJsZSB0byBhdm9p
ZCBkaXJ0eWluZyBSQU0gbGF0ZSBpbiB0aGUgbWlncmF0aW9uDQo+IGN5Y2xlLA0KPiA+ID4gYW5k
IHdlIGtub3cgdGhhdCBpbi1mbGlnaHQgZGF0YSBjYW4gd2FpdC4gQnV0IGluIGEgdHJhbnNpdGlv
biB0byBTNCB3ZQ0KPiA+ID4gbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBhdCBsZWFzdCBhbGwgdGhl
IGluLWZsaWdodCBibGtpZiByZXF1ZXN0cyBnZXQNCj4gPiA+IGNvbXBsZXRlZCwgc2luY2UgdGhl
eSBwcm9iYWJseSBjb250YWluIGJpdHMgb2YgdGhlIGd1ZXN0J3MgbWVtb3J5DQo+IGltYWdlDQo+
ID4gPiBhbmQgdGhhdCdzIG5vdCBnb2luZyB0byBnZXQgc2F2ZWQgYW55IG90aGVyIHdheS4NCj4g
PiA+DQo+ID4gPiBUaGFua3MsIHRoYXQgbWFrZXMgc2Vuc2UgYW5kIHNvbWV0aGluZyBhbG9uZyB0
aGlzIGxpbmVzIHNob3VsZCBiZQ0KPiA+ID4gYWRkZWQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIElN
Ty4NCj4gPiA+DQo+ID4gPiBXb25kZXJpbmcgYWJvdXQgUzQsIHNob3VsZG4ndCB3ZSBleHBlY3Qg
dGhlIHF1ZXVlcyB0byBhbHJlYWR5IGJlDQo+ID4gPiBlbXB0eT8gQXMgYW55IHN1YnN5c3RlbSB0
aGF0IHdhbnRlZCB0byBzdG9yZSBzb21ldGhpbmcgdG8gZGlzayBzaG91bGQNCj4gPiA+IG1ha2Ug
c3VyZSByZXF1ZXN0cyBoYXZlIGJlZW4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZCBiZWZvcmUNCj4g
PiA+IHN1c3BlbmRpbmcuDQo+ID4NCj4gPiBXaGF0IGFib3V0IHdyaXRpbmcgdGhlIHN1c3BlbmQg
aW1hZ2UgaXRzZWxmPyBOb3JtYWwgZmlsZXN5c3RlbSBJL08NCj4gPiB3aWxsIGhhdmUgYmVlbiBm
bHVzaGVkIG9mIGNvdXJzZSwgYnV0IHdoYXRldmVyIHZlc3RpZ2lhbCBrZXJuZWwNCj4gPiBhY3R1
YWxseSB3cml0ZXMgb3V0IHRoZSBoaWJlcm5hdGlvbiBmaWxlIG1heSB3ZWxsIGV4cGVjdCBhIGZp
bmFsDQo+ID4gRDAtPkQzIG9uIHRoZSBzdG9yYWdlIGRldmljZSB0byBjYXVzZSBhIGZsdXNoLg0K
PiANCj4gSG0sIEkgaGF2ZSBubyBpZGVhIHJlYWxseS4gSSB0aGluayB3aGF0ZXZlciB3cml0ZXMg
dG8gdGhlIGRpc2sgYmVmb3JlDQo+IHN1c3BlbmQgc2hvdWxkIGFjdHVhbGx5IG1ha2Ugc3VyZSBy
ZXF1ZXN0cyBoYXZlIGNvbXBsZXRlZCwgYnV0IHdoYXQNCj4geW91IHN1Z2dlc3QgbWlnaHQgYWxz
byBiZSBhIHBvc3NpYmlsaXR5Lg0KPiANCj4gQ2FuIHlvdSBmaWd1cmUgb3V0IHdoZXRoZXIgdGhl
cmUgYXJlIHJlcXVlc3RzIG9uIHRoZSByaW5nIG9yIGluIHRoZQ0KPiBxdWV1ZSBiZWZvcmUgc3Vz
cGVuZGluZz8NCg0KV2VsbCB0aGVyZSdzIGNsZWFybHkgcGVuZGluZyBzdHVmZiBpbiB0aGUgcmlu
ZyBpZiByc3BfcHJvZCAhPSByZXFfcHJvZCA6LSkgQXMgZm9yIGludGVybmFsIHF1ZXVlcywgSSBk
b24ndCBrbm93IGhvdyBibGtmcm9udCBtYW5hZ2VzIHRoYXQgKG9yIHdoZXRoZXIgaXQgaGFzIGFu
eSBwZW5kaW5nIHdvcmsgcXVldWUgYXQgYWxsKS4NCg0KICBQYXVsDQoNCj4gDQo+ID4gQWdhaW4s
IEkgZG9uJ3Qga25vdyB0aGUgc3BlY2lmaWNzIGZvciBMaW51eCAoYW5kIFdpbmRvd3MgYWN0dWFs
bHkNCj4gPiB1c2VzIGFuIGluY2FybmF0aW9uIG9mIHRoZSBjcmFzaCBrZXJuZWwgdG8gZG8gdGhl
IGpvYiwgd2hpY2ggYnJpbmdzDQo+ID4gd2l0aCBpdCBhIHdob2xlIG90aGVyIHNldCBvZiBjb21w
bGV4aXR5IGFzIGZhciBhcyBQViBkcml2ZXJzIGdvKS4NCj4gDQo+IFRoYXQgc2VlbXMgZXh0cmVt
ZWx5IGNvbXBsZXgsIEknbSBzdXJlIHRoZXJlJ3MgYSByZWFzb24gZm9yIGl0IDopLg0KPiANCj4g
VGhhbmtzLCBSb2dlci4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
