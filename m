Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9428A542
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 20:04:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxEd4-0002pA-J5; Mon, 12 Aug 2019 18:01:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JASq=WI=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hxEd3-0002p5-7P
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 18:01:09 +0000
X-Inumbo-ID: 291da2be-bd2b-11e9-8980-bc764e045a96
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe44::624])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 291da2be-bd2b-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 18:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bw0Imrxnn5OcYQEvnR+U3ckD7Tj4H0iTdKGgyovRX/f9Sff6kPHoFw1xayGPl6W0/vA/c/AEG763RoHZhlbb4xoszOpUDmLdaiE5ShOUhlQ0LJao2Da4wYuswBHO721QnCOta2Dm4f1w9k4Xv9R4tX7llkTGoYYeZre19k0F3tiSYdCYG6V7zprk+4DMv/7X7yTjWxy51XBHdbgnFPlH8LFnUDSffxakMz3hExusljTcp4XVaTmJUik3d8gBSUjekBAAUEq9Howmv+Hom1FDK1hGWatdmOzRVv4e0wegqAiBPBMwlSFmiYrR80We0YccQn2kTAvgHa00PiLaqkCd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCVz3JhrZMIRX3KcKqpTC21dU7dut6AlirdSqBOSr9Q=;
 b=crR/C0p+W7Uad8bXlxtyU+On5HOE68CWZHDzFC7Oc15bT6GtMsCWHEYWOHJ25GrX3ZGvri3NdetT6HPuF20FVm8Nz6og5w7i+rBIBjFAbt7Bf73VOPYfXfYFuhTbJ8pHw+yPwPyXYnTCEZC0PcqmwhswlJNZe1CL87Zo0JxjZST63VM+W2Gq8hlh/NU38Sh+Pz+1wCQ2/F2AaiEFL7gOSB6/r3g9xRsurgJ++g3BogwqSgXdefu+wWqeqKT0innOdEWmHc0goRmBiPGUk9cGTrVvAMFSPKnJJYBlMj2VsXEeDIBPGk5X9mcvzMwcG1xWwjHKvnnGXphrwTPriU/uOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCVz3JhrZMIRX3KcKqpTC21dU7dut6AlirdSqBOSr9Q=;
 b=bWL9EvACFvDkyHC5DGS2bC2jodgSYAeOPGKFIXmSSeI/sP0FchepmXeMYHIK5Y8zRmAM+a4I/inaFcFOGpeCl9q54Dzg1UYzWxGjeJxtNDh9ootRXbxZmHQZdHPyK75lUkPR52JzJtvFeQHegfeKKbV5/3q57vcOQ+UsyKbLCws=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2922.namprd12.prod.outlook.com (20.179.104.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Mon, 12 Aug 2019 18:01:07 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090%3]) with mapi id 15.20.2157.021; Mon, 12 Aug 2019
 18:01:07 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/AMD-Vi: Fold exit paths of {enable,disable}_iommu()
Thread-Index: AQHVUTaqOMIPPU6k90KWamZ+6e/EQqb3zWKA
Date: Mon, 12 Aug 2019 18:01:06 +0000
Message-ID: <20190812180101.GB1377@amd.com>
References: <20190812175205.29143-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190812175205.29143-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0201CA0037.namprd02.prod.outlook.com
 (2603:10b6:803:2e::23) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d096f320-2c62-4f65-c247-08d71f4f0c4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2922; 
x-ms-traffictypediagnostic: DM6PR12MB2922:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2922058BEF7796157DCB5A09E5D30@DM6PR12MB2922.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(53936002)(66446008)(66946007)(66476007)(66556008)(64756008)(25786009)(386003)(6506007)(8936002)(6916009)(102836004)(26005)(52116002)(305945005)(76176011)(6116002)(486006)(476003)(7736002)(2616005)(6246003)(11346002)(81166006)(81156014)(33656002)(446003)(8676002)(229853002)(256004)(66066001)(2906002)(6436002)(14454004)(6486002)(6512007)(54906003)(36756003)(316002)(71190400001)(5660300002)(3846002)(1076003)(71200400001)(478600001)(14444005)(4326008)(99286004)(86362001)(186003)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2922;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u2b0NN4y/QgFt90Br3qWQlgoy/1X+msXwFQJ1JLpud/iXCn90POcmpdDvXUDBsBjQ/T9/SMtTrCzWk0MuZzjLOtvzi4/p25WhzyvwZAgiZcgUES49jNoiylzBIBRvENsquF8y21lvNZ4S7xyX/2OazgTbfAIumBTxnMG+PGPj247e6/64oEf2qauW6RckjAlHT56B/UA1QIw7fJdcQ+IrT0M4IQC6uegW5W1AqNXM4gQpYou/7E21QY4dFqZJ4CK4g9DCtFCBc3GQsxxBF3TO1wcq+WkT5wNAbnOHkPvEh0nPBQPqWOHHhHFpDsTwaPzXEWTnCqXqfgogwDo7gDcO3kTEvTMGGQu0TFeQ6Y9bk1yREqQ4rwrd4Muc5J9GHHkSbc2tjNM9X4uKSGzPA/pSasxHmyl+kUciGAKzqwG09U=
Content-ID: <EC242CEEA2236F4CA94ADBDDC320DD1D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d096f320-2c62-4f65-c247-08d71f4f0c4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 18:01:06.7239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o1cuFvL5LhZZcPjLyBPnM6jkq5XjPIfUuJ5SqLTx2fRKsk4rF39YDUJcjOAj9hhP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2922
Subject: Re: [Xen-devel] [PATCH] x86/AMD-Vi: Fold exit paths of {enable,
 disable}_iommu()
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDY6NTI6MDVQTSArMDEwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gLi4uIHRvIGF2b2lkIGhhdmluZyBtdWx0aXBsZSBzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCkgY2FsbHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNv
bT4KCj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
Cj4gQ0M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5j
b20+Cj4gQ0M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgo+IAo+IEludGVyZXN0
aW5nbHkgR0NDIDYuMyBtYW5hZ2VkIHRvIGZvbGQgZGlzYWJsZV9pb21tdSgpIGF1dG9tYXRpY2Fs
bHkuICBUaGVyZSBpcwo+IHNvbWUgcGFydGlhbCBmb2xkaW5nIGZvciBlbmFibGVfaW9tbXUoKSAo
aW5zb2ZhciBhcyB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlCj4gY2FsbCB0byBfc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSBlbWl0dGVkKSwgYnV0IHRoaXMgZGVsdGEgeWVpbGRzCj4gCj4gICBhZGQvcmVt
b3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvMSB1cC9kb3duOiAwLy0yMCAoLTIwKQo+ICAgRnVuY3Rp
b24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0
YQo+ICAgZW5hYmxlX2lvbW11ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxODQ0ICAg
IDE4MjQgICAgIC0yMAo+ICAgVG90YWw6IEJlZm9yZT0zMzQwMjk5LCBBZnRlcj0zMzQwMjc5LCBj
aGcgLTAuMDAlCj4gCj4gd2hpY2ggbWVhbnMgdGhhdCBzb21ldGhpbmcgd2Fzbid0IGRvbmUgYXV0
b21hdGljYWxseS4KPiAKPiBOb3RpY2VkIHdoaWxlIGludmVzdGlnYXRpbmcgdGhlIFMzIHJlZ3Jl
c3Npb24uCj4gLS0tCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMg
fCAxNyArKysrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X2luaXQuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9p
bml0LmMKPiBpbmRleCBiYjlmMzNlMjY0Li5iYjVhM2U1N2M5IDEwMDY0NAo+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gQEAgLTg5OSwxMSArODk5LDggQEAgc3RhdGlj
IHZvaWQgZW5hYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQo+ICAKPiAgICAgIHNw
aW5fbG9ja19pcnFzYXZlKCZpb21tdS0+bG9jaywgZmxhZ3MpOwo+ICAKPiAtICAgIGlmICggaW9t
bXUtPmVuYWJsZWQgKQo+IC0gICAgewo+IC0gICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmlvbW11LT5sb2NrLCBmbGFncyk7IAo+IC0gICAgICAgIHJldHVybjsKPiAtICAgIH0KPiArICAg
IGlmICggdW5saWtlbHkoaW9tbXUtPmVuYWJsZWQpICkKPiArICAgICAgICBnb3RvIG91dDsKPiAg
Cj4gICAgICBhbWRfaW9tbXVfZXJyYXR1bV83NDZfd29ya2Fyb3VuZChpb21tdSk7Cj4gIAo+IEBA
IC05NTcsNiArOTU0LDggQEAgc3RhdGljIHZvaWQgZW5hYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9t
bXUgKmlvbW11KQo+ICAgICAgICAgIGFtZF9pb21tdV9mbHVzaF9hbGxfY2FjaGVzKGlvbW11KTsK
PiAgCj4gICAgICBpb21tdS0+ZW5hYmxlZCA9IDE7Cj4gKwo+ICsgb3V0Ogo+ICAgICAgc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPmxvY2ssIGZsYWdzKTsKPiAgfQo+ICAKPiBAQCAtOTY2
LDExICs5NjUsOCBAQCBzdGF0aWMgdm9pZCBkaXNhYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbXUg
KmlvbW11KQo+ICAKPiAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+bG9jaywgZmxhZ3Mp
Owo+ICAKPiAtICAgIGlmICggIWlvbW11LT5lbmFibGVkICkKPiAtICAgIHsKPiAtICAgICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZpb21tdS0+bG9jaywgZmxhZ3MpOwo+IC0gICAgICAgIHJl
dHVybjsKPiAtICAgIH0KPiArICAgIGlmICggdW5saWtlbHkoIWlvbW11LT5lbmFibGVkKSApCj4g
KyAgICAgICAgZ290byBvdXQ7Cj4gIAo+ICAgICAgaWYgKCAhaW9tbXUtPmN0cmwuaW50X2NhcF94
dF9lbiApCj4gICAgICAgICAgYW1kX2lvbW11X21zaV9lbmFibGUoaW9tbXUsIElPTU1VX0NPTlRS
T0xfRElTQUJMRUQpOwo+IEBAIC05ODgsNiArOTg0LDcgQEAgc3RhdGljIHZvaWQgZGlzYWJsZV9p
b21tdShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKPiAgCj4gICAgICBpb21tdS0+ZW5hYmxlZCA9
IDA7Cj4gIAo+ICsgb3V0Ogo+ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPmxv
Y2ssIGZsYWdzKTsKPiAgfQo+ICAKPiAtLSAKPiAyLjExLjAKPiAKCi0tIApCcmlhbiBXb29kcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
