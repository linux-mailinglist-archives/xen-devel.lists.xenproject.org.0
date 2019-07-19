Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCFA6E479
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:47:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoQMe-0005LF-8u; Fri, 19 Jul 2019 10:43:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoQMd-0005L9-5A
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:43:47 +0000
X-Inumbo-ID: 11aeb380-aa12-11e9-a0eb-cbe4aa317bd5
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11aeb380-aa12-11e9-a0eb-cbe4aa317bd5;
 Fri, 19 Jul 2019 10:43:42 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 10:43:40 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 10:40:59 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 10:40:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpmXEPiL+Ec0PmdE55nWNxLCJAQsJC3lr+UNtMdGSkHbPD3GIYXky9JJW6IX9mFAoX0WZO/klA1wZnoGGpXvpE6Zo2aQYw/e488LFwnJn5DUTFAaw66zoI07QkVmw9LAVksd6YL2Tl9zhr8iChSlM+Xh0bUE3HDXAbtlPobTHfI1m7Ab5fYKaOqCmJ9b4ycc233l89kkX4B2DFbqaMlCrp4Jcym2oLCCEGnIdsw2WwxsMrRKXDm8kVok12JvwpMdpUkRajAI1T/1nqgCOSuGtKTxXdVwD/lATkvgaQcTtMeoVN2mhaXIH6BLQcnMfHnQo4Jnoii8Dt1eW2k32yzgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muBU1ItzFW2zI883cGX73Euh46WgcFKkd4RIJqILg4g=;
 b=ZQO0GrxutL5ifxgTEu3blgYLVkzEz2PWIsr2Ck6YLMyBs5CCmXzyqlJ0ZQHylJo3UR3tebLAd3uQVcMRE5aU0b4cWnrdBN4agHv+U/MmqRKldt3T8QDNJApwjq815drzncUDS0OT1MP2n0EHrFEQ1eaSCo460akfh9ZSEqBNdxRXDHv3arD2udM8KBFPE+uCA6FmTTSegLSMn5bgpm1eA+vNSeIOeZ3+X4EUDIW56TpiHEELbUhn2jCXBuLt4yP5H68oLfAZkvuvnWLJotutL73ehRo6DgksZolIYcVJnlzg6ExIYPm1R3s7/701JqfiGFlNOXXPOhFdOX0pjDM7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2811.namprd18.prod.outlook.com (20.179.50.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 10:40:58 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 10:40:58 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
Thread-Index: AQHVPDtOMbEO/dU1S0mmyHfOXncKyabRxG0A
Date: Fri, 19 Jul 2019 10:40:58 +0000
Message-ID: <8c5f98e6-3159-9634-226d-48a35440107b@suse.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0062.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::39) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74cafea3-dc14-4808-52f3-08d70c35961f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2811; 
x-ms-traffictypediagnostic: DM6PR18MB2811:
x-microsoft-antispam-prvs: <DM6PR18MB28118E693162212DEFD98A19B3CB0@DM6PR18MB2811.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(189003)(199004)(6486002)(31696002)(80792005)(6916009)(76176011)(6506007)(386003)(68736007)(53546011)(7416002)(6436002)(36756003)(86362001)(64756008)(7736002)(6246003)(6512007)(66066001)(102836004)(229853002)(305945005)(14454004)(316002)(54906003)(8676002)(26005)(66476007)(71200400001)(66446008)(3846002)(66556008)(2906002)(486006)(476003)(8936002)(66946007)(11346002)(81166006)(2616005)(71190400001)(52116002)(99286004)(446003)(256004)(4744005)(5660300002)(6116002)(53936002)(31686004)(186003)(4326008)(14444005)(478600001)(25786009)(81156014)(66574012);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2811;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8HtigZzeI3UVL/0WQGOV8TquIegAE1PLlEzwRCjfPGB/4PVOxYgRMsGtBEmB3+wgJcV1vekb6lYTpmo17N/T9sB6bu1ySBCjls2+EZE3KaQ4AMZb4rp6SKgSzPSg2Q9k0AyieJM6xFWrp+Rlp77X83UWf8UmX/xAKkGkHPe+nfOdpI2hb14v/RSxxhO25zCHSAlSdB+6pU/T1PsWwxpiXzy4+gl2D4idktWuBvscvIPiGgkpxIa0Cp2uFSSPhIAvPgRd24CiQvTWTXTBArIGJWBQoaR8q4MMTpVZ0nABW2P6tYS6gIQWp8LmD0NJGXr9++xUCt/zSVoUAX3Y777CmWLbx+kxUXDNdXvvXx+8nfJrW8gLCe1Sa6rVBoIMH35jZj6ACOw176J2ozBy4orza+Y/XMko9+oHB2Hfk/+PvNE=
Content-ID: <CDFA5A85872B78459F78B88459797C33@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 74cafea3-dc14-4808-52f3-08d70c35961f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 10:40:58.8519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2811
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAwMzowMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToN
Cj4gLS0tIGEveGVuL2FyY2gveDg2L3BoeXNkZXYuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvcGh5
c2Rldi5jDQo+IEBAIC02NjIsNiArNjYyLDMxIEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNt
ZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+ICAgICAgICAgICBicmVhazsN
Cj4gICAgICAgfQ0KPiAgIA0KPiArICAgIGNhc2UgUEhZU0RFVk9QX21zaV9jb250cm9sOiB7DQo+
ICsgICAgICAgIHN0cnVjdCBwaHlzZGV2X21zaV9jb250cm9sIG9wOw0KPiArICAgICAgICBzdHJ1
Y3QgcGNpX2RldiAqcGRldjsNCj4gKw0KPiArICAgICAgICByZXQgPSAtRUZBVUxUOw0KPiArICAg
ICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgmb3AsIGFyZywgMSkgKQ0KPiArICAgICAgICAgICAg
YnJlYWs7DQo+ICsNCj4gKyAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gKyAgICAgICAgaWYgKCBv
cC5mbGFncyAmIH4oUEhZU0RFVk9QX01TSV9DT05UUk9MX01TSVggfCBQSFlTREVWT1BfTVNJX0NP
TlRST0xfRU5BQkxFKSApDQo+ICsgICAgICAgICAgICBicmVhazsNCj4gKw0KPiArICAgICAgICBw
Y2lkZXZzX2xvY2soKTsNCj4gKyAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihvcC5zZWcsIG9w
LmJ1cywgb3AuZGV2Zm4pOw0KPiArICAgICAgICBpZiAoIHBkZXYgKQ0KPiArICAgICAgICAgICAg
cmV0ID0gbXNpX2NvbnRyb2wocGRldiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG9wLmZsYWdzICYgUEhZU0RFVk9QX01TSV9DT05UUk9MX01TSVgsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvcC5mbGFncyAmIFBIWVNERVZPUF9NU0lfQ09OVFJPTF9FTkFCTEUp
Ow0KDQpOb3RlIHRoYXQgcGNpX2dldF9wZGV2KCkgcmV0dXJucyBoaWRkZW4gZGV2aWNlcyBhcyB3
ZWxsLiBUaGF0J3MNCm5vdCBhIHByb2JsZW0gZm9yIHRoZSBvdGhlciB0d28gdXNlcyBpbiB0aGlz
IGZpbGUsIGJ1dCBJIHRoaW5rDQp5b3Ugd2FudCB0byBleHBsaWNpdGx5IGRlbnkgYWNjZXNzIHRv
IGhpZGRlbiBvbmVzIGhlcmUsDQppcnJlc3BlY3RpdmUgb2YgdGhlIFhTTSBjaGVjay4NCg0KSmFu
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
