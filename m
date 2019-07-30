Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F37AE2D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 18:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsV7Q-0002mf-6o; Tue, 30 Jul 2019 16:36:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEEr=V3=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hsV7O-0002mF-A4
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 16:36:54 +0000
X-Inumbo-ID: 3c1d0a0a-b2e8-11e9-8980-bc764e045a96
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4a::602])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c1d0a0a-b2e8-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 16:36:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjL2SG5aLDFKAoUi5EXfUBfcULco1yKnFtYamJTZyYIvddX1SryiZS3QxfM+9VBR6ATaL2UWcMcUwxrt+GXfwr2DBWWbZy8yEd38uIEMSnXXEQ+0RWzzdC+EpzDXv53blkFHVYVf95uslZ/y24dYEp6YA2q7gPqJXqbzaN7U5n/Jca+WptjwrEgKmBNW2KgH5GsmrhRkZNnO5x8ApLnPq2zH/X5eeCYzm3dlD62dzsjtgxbt1wttHiQKXX5+8yc12Bd3VHq5Q9FeniW+3FvI2S3eq5qhKGMS0J8kzqO2bQh6wnr42iXVaK2Ivoe8RTxTMg5bg/Jfo3khwOF1rQKZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRZmA1SvxK5+GPGuHBqigl25zP9izzggFHMZ/BNRMUM=;
 b=egS92RApTi9vPxMLI1sXVS2KWNJNF2i+IgDupP7MbMXFvxiFBuFVROytbnlKA5H1Ai2s+1m7ouzLp5rQAM8RzpLinatERUml4XYqPJCnOIWmCm54cBdVASJIvDbS9JN2ZP9txboPonMxs1sPCL2Av02O2PgSAlgtC47Bjzre+UZLhq7uoDUBKL7yz8Ju/5yfBAOzS0oh6SuWFyvGTqORFIxUZ33dP62MqLd5leOXbFqM5sBGs8o8xr/8jbjKSr2WTijmXpveg2l4xtzZnZ7EkJcxsn+yW4iZZItMkF2D+C14EBp6P/h0qEv/Pu+T5jk+baSmHsA0wBR5D/MAHsPaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRZmA1SvxK5+GPGuHBqigl25zP9izzggFHMZ/BNRMUM=;
 b=OxUZx6Gw4RYuRaIQ+p9WSRXVhaW/qapFoHZwAt3WB9mLEEjk1rkB4nhq0koFQRCn9cczci44XhIGEkTrc9X9/Ig+DPqU31ltamxyoPiJRN04FNPiCRsBQnX+7lh4bn7/xBnU5azys39ZV7W3JHWgT+id+CJ5g4nKWamivAs5UJU=
Received: from MN2PR12MB3520.namprd12.prod.outlook.com (20.179.82.28) by
 MN2PR12MB4207.namprd12.prod.outlook.com (52.135.50.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 16:36:51 +0000
Received: from MN2PR12MB3520.namprd12.prod.outlook.com
 ([fe80::3cfb:fd2c:cea1:9cb9]) by MN2PR12MB3520.namprd12.prod.outlook.com
 ([fe80::3cfb:fd2c:cea1:9cb9%5]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 16:36:51 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v4 11/12] AMD/IOMMU: don't needlessly log headers when
 dumping IRTs
Thread-Index: AQHVQu3vQWkQ4BW/m0a3zbmA7VKnu6bjZBoA
Date: Tue, 30 Jul 2019 16:36:51 +0000
Message-ID: <20190730163648.GC31577@amd.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
 <27308615-9199-2183-d987-180520d8afc3@suse.com>
In-Reply-To: <27308615-9199-2183-d987-180520d8afc3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0801CA0001.namprd08.prod.outlook.com
 (2603:10b6:803:29::11) To MN2PR12MB3520.namprd12.prod.outlook.com
 (2603:10b6:208:100::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67c58893-b14e-45f6-b8d8-08d7150c1f9c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4207; 
x-ms-traffictypediagnostic: MN2PR12MB4207:
x-microsoft-antispam-prvs: <MN2PR12MB42074E2A50DACB84E00E66B4E5DC0@MN2PR12MB4207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(316002)(476003)(2906002)(2616005)(66946007)(486006)(186003)(6436002)(99286004)(6916009)(66446008)(33656002)(14454004)(64756008)(71190400001)(7736002)(6512007)(6486002)(1076003)(66556008)(66476007)(36756003)(11346002)(256004)(71200400001)(4326008)(478600001)(446003)(53936002)(14444005)(25786009)(5660300002)(229853002)(86362001)(6116002)(81166006)(81156014)(3846002)(102836004)(8676002)(8936002)(305945005)(76176011)(54906003)(66066001)(52116002)(6246003)(68736007)(6506007)(26005)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4207;
 H:MN2PR12MB3520.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e+rz6Kv4AUjYO6rKAtq5CZYl+JGe4/u64XhYNN3Rykr779NYW9vX1t6zJ/chZSOeVvafsW28y5g8R0KZ5tD/9NsQfFlF8Kvkwd9U6IVjatWSaz5OAGCRV2iEibI7GjYbRLxyP2ygvvt/tFqbiuMUSXl7czSjmc0eglp5OMqd06qtRxEck3xQlnUTeegGzt4/bIZAamKNhyv/M4UbFKmHYl+E06UdU82f8hiFGFTdiJsSaYuE9RDfA7FgDD42rP3OdiiIC75/gxIsKXIHQyubLoFUfVqTfVWmh/wpl3FEeZ4f+2bvjdCOExrcWYgEDqdnzbsfeK1CjeTVZQO+GR7PnDx+UFoTLg7PtexBMsGNRSW623Z2wJLulacC6UUx2YMX6RQ8UhAZl+UohxN+gei2nsO9qbOvKJElFt4uvfEtmzk=
Content-ID: <40EE73D2FBD21D4284C7ED60327FFF74@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c58893-b14e-45f6-b8d8-08d7150c1f9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 16:36:51.1579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
Subject: Re: [Xen-devel] [PATCH v4 11/12] AMD/IOMMU: don't needlessly log
 headers when dumping IRTs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods, 
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDE6MzM6MjRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTG9nIFNCREYgaGVhZGVycyBvbmx5IHdoZW4gdGhlcmUgYXJlIGFjdHVhbCBJUlRFcyB0
byBsb2cuIFRoaXMgaXMKPiBwYXJ0aWN1bGFybHkgaW1wb3J0YW50IGZvciB0aGUgdG90YWwgdm9s
dW1lIG9mIG91dHB1dCB3aGVuIHRoZSBBQ1BJCj4gdGFibGVzIGRlc2NyaWJlIGZhciBtb3JlIHRo
YW4ganVzdCB0aGUgZXhpc3RpbmcgZGV2aWNlcy4gT24gbXkgUm9tZQo+IHN5c3RlbSBzbyBmYXIg
dGhlcmUgd2FzIG9uZSBsaW5lIGZvciBldmVyeSBmdW5jdGlvbiBvZiBldmVyeSBkZXZpY2Ugb24K
PiBhbGwgMjU2IGJ1c2VzIG9mIHNlZ21lbnQgMCwgd2l0aCBleHRyZW1lbHkgZmV3IGV4Y2VwdGlv
bnMgKGxpa2UgdGhlCj4gSU9NTVVzIHRoZW1zZWx2ZXMpLgo+IAo+IEFsc28gb25seSBsb2cgb25l
IG9mIHRoZSAicGVyLWRldmljZSIgb3IgInNoYXJlZCIgb3ZlcmFsbCBoZWFkZXJzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBC
cmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KCj4gLS0tCj4gdjQ6IE5ldy4KPiAKPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+IEBAIC04ODMsNyArODgzLDgg
QEAgaW50IF9faW5pdCBhbWRfc2V0dXBfaHBldF9tc2koc3RydWN0IG1zaQo+ICAgfQo+ICAgCj4g
ICBzdGF0aWMgdm9pZCBkdW1wX2ludHJlbWFwX3RhYmxlKGNvbnN0IHN0cnVjdCBhbWRfaW9tbXUg
KmlvbW11LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuaW9uIGlydGVfY3B0
ciB0YmwpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5pb24gaXJ0ZV9jcHRy
IHRibCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgaXZy
c19tYXBwaW5ncyAqaXZyc19tYXBwaW5nKQo+ICAgewo+ICAgICAgIHVuc2lnbmVkIGludCBjb3Vu
dDsKPiAgIAo+IEBAIC04OTIsMTkgKzg5MywyNSBAQCBzdGF0aWMgdm9pZCBkdW1wX2ludHJlbWFw
X3RhYmxlKGNvbnN0IHN0Cj4gICAKPiAgICAgICBmb3IgKCBjb3VudCA9IDA7IGNvdW50IDwgSU5U
UkVNQVBfRU5UUklFUzsgY291bnQrKyApCj4gICAgICAgewo+IC0gICAgICAgIGlmICggaW9tbXUt
PmN0cmwuZ2FfZW4gKQo+IC0gICAgICAgIHsKPiAtICAgICAgICAgICAgaWYgKCAhdGJsLnB0cjEy
OFtjb3VudF0ucmF3WzBdICYmICF0YmwucHRyMTI4W2NvdW50XS5yYXdbMV0gKQo+ICsgICAgICAg
IGlmICggaW9tbXUtPmN0cmwuZ2FfZW4KPiArICAgICAgICAgICAgID8gIXRibC5wdHIxMjhbY291
bnRdLnJhd1swXSAmJiAhdGJsLnB0cjEyOFtjb3VudF0ucmF3WzFdCj4gKyAgICAgICAgICAgICA6
ICF0YmwucHRyMzJbY291bnRdLnJhdyApCj4gICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
Kwo+ICsgICAgICAgIGlmICggaXZyc19tYXBwaW5nICkKPiArICAgICAgICB7Cj4gKyAgICAgICAg
ICAgIHByaW50aygiICAlMDR4OiUwMng6JTAyeDoldTpcbiIsIGlvbW11LT5zZWcsCj4gKyAgICAg
ICAgICAgICAgICAgICBQQ0lfQlVTKGl2cnNfbWFwcGluZy0+ZHRlX3JlcXVlc3Rvcl9pZCksCj4g
KyAgICAgICAgICAgICAgICAgICBQQ0lfU0xPVChpdnJzX21hcHBpbmctPmR0ZV9yZXF1ZXN0b3Jf
aWQpLAo+ICsgICAgICAgICAgICAgICAgICAgUENJX0ZVTkMoaXZyc19tYXBwaW5nLT5kdGVfcmVx
dWVzdG9yX2lkKSk7Cj4gKyAgICAgICAgICAgIGl2cnNfbWFwcGluZyA9IE5VTEw7Cj4gKyAgICAg
ICAgfQo+ICsKPiArICAgICAgICBpZiAoIGlvbW11LT5jdHJsLmdhX2VuICkKPiAgICAgICAgICAg
ICAgIHByaW50aygiICAgIElSVEVbJTAzeF0gJTAxNmx4XyUwMTZseFxuIiwKPiAgICAgICAgICAg
ICAgICAgICAgICBjb3VudCwgdGJsLnB0cjEyOFtjb3VudF0ucmF3WzFdLCB0YmwucHRyMTI4W2Nv
dW50XS5yYXdbMF0pOwo+IC0gICAgICAgIH0KPiAgICAgICAgICAgZWxzZQo+IC0gICAgICAgIHsK
PiAtICAgICAgICAgICAgaWYgKCAhdGJsLnB0cjMyW2NvdW50XS5yYXcgKQo+IC0gICAgICAgICAg
ICAgICAgY29udGludWU7Cj4gICAgICAgICAgICAgICBwcmludGsoIiAgICBJUlRFWyUwM3hdICUw
OHhcbiIsIGNvdW50LCB0YmwucHRyMzJbY291bnRdLnJhdyk7Cj4gLSAgICAgICAgfQo+ICAgICAg
IH0KPiAgIH0KPiAgIAo+IEBAIC05MTYsMTMgKzkyMyw4IEBAIHN0YXRpYyBpbnQgZHVtcF9pbnRy
ZW1hcF9tYXBwaW5nKGNvbnN0IHMKPiAgICAgICBpZiAoICFpdnJzX21hcHBpbmcgKQo+ICAgICAg
ICAgICByZXR1cm4gMDsKPiAgIAo+IC0gICAgcHJpbnRrKCIgICUwNHg6JTAyeDolMDJ4OiV1Olxu
IiwgaW9tbXUtPnNlZywKPiAtICAgICAgICAgICBQQ0lfQlVTKGl2cnNfbWFwcGluZy0+ZHRlX3Jl
cXVlc3Rvcl9pZCksCj4gLSAgICAgICAgICAgUENJX1NMT1QoaXZyc19tYXBwaW5nLT5kdGVfcmVx
dWVzdG9yX2lkKSwKPiAtICAgICAgICAgICBQQ0lfRlVOQyhpdnJzX21hcHBpbmctPmR0ZV9yZXF1
ZXN0b3JfaWQpKTsKPiAtCj4gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJihpdnJzX21hcHBpbmct
PmludHJlbWFwX2xvY2spLCBmbGFncyk7Cj4gLSAgICBkdW1wX2ludHJlbWFwX3RhYmxlKGlvbW11
LCBpdnJzX21hcHBpbmctPmludHJlbWFwX3RhYmxlKTsKPiArICAgIGR1bXBfaW50cmVtYXBfdGFi
bGUoaW9tbXUsIGl2cnNfbWFwcGluZy0+aW50cmVtYXBfdGFibGUsIGl2cnNfbWFwcGluZyk7Cj4g
ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmKGl2cnNfbWFwcGluZy0+aW50cmVtYXBfbG9j
ayksIGZsYWdzKTsKPiAgIAo+ICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOwo+IEBA
IC05MzIsMTcgKzkzNCwyMiBAQCBzdGF0aWMgaW50IGR1bXBfaW50cmVtYXBfbWFwcGluZyhjb25z
dCBzCj4gICAKPiAgIHN0YXRpYyB2b2lkIGR1bXBfaW50cmVtYXBfdGFibGVzKHVuc2lnbmVkIGNo
YXIga2V5KQo+ICAgewo+IC0gICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiAtCj4gLSAgICBwcmlu
dGsoIi0tLSBEdW1waW5nIFBlci1kZXYgSU9NTVUgSW50ZXJydXB0IFJlbWFwcGluZyBUYWJsZSAt
LS1cbiIpOwo+ICsgICAgaWYgKCAhc2hhcmVkX2ludHJlbWFwX3RhYmxlICkKPiArICAgIHsKPiAr
ICAgICAgICBwcmludGsoIi0tLSBEdW1waW5nIFBlci1kZXYgSU9NTVUgSW50ZXJydXB0IFJlbWFw
cGluZyBUYWJsZSAtLS1cbiIpOwo+ICAgCj4gLSAgICBpdGVyYXRlX2l2cnNfZW50cmllcyhkdW1w
X2ludHJlbWFwX21hcHBpbmcpOwo+ICsgICAgICAgIGl0ZXJhdGVfaXZyc19lbnRyaWVzKGR1bXBf
aW50cmVtYXBfbWFwcGluZyk7Cj4gKyAgICB9Cj4gKyAgICBlbHNlCj4gKyAgICB7Cj4gKyAgICAg
ICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiAgIAo+IC0gICAgcHJpbnRrKCItLS0gRHVtcGluZyBT
aGFyZWQgSU9NTVUgSW50ZXJydXB0IFJlbWFwcGluZyBUYWJsZSAtLS1cbiIpOwo+ICsgICAgICAg
IHByaW50aygiLS0tIER1bXBpbmcgU2hhcmVkIElPTU1VIEludGVycnVwdCBSZW1hcHBpbmcgVGFi
bGUgLS0tXG4iKTsKPiAgIAo+IC0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNoYXJlZF9pbnRyZW1h
cF9sb2NrLCBmbGFncyk7Cj4gLSAgICBkdW1wX2ludHJlbWFwX3RhYmxlKGxpc3RfZmlyc3RfZW50
cnkoJmFtZF9pb21tdV9oZWFkLCBzdHJ1Y3QgYW1kX2lvbW11LAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3QpLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICBzaGFyZWRfaW50cmVtYXBfdGFibGUpOwo+IC0gICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
c2hhcmVkX2ludHJlbWFwX2xvY2ssIGZsYWdzKTsKPiArICAgICAgICBzcGluX2xvY2tfaXJxc2F2
ZSgmc2hhcmVkX2ludHJlbWFwX2xvY2ssIGZsYWdzKTsKPiArICAgICAgICBkdW1wX2ludHJlbWFw
X3RhYmxlKGxpc3RfZmlyc3RfZW50cnkoJmFtZF9pb21tdV9oZWFkLCBzdHJ1Y3QgYW1kX2lvbW11
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0KSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNoYXJlZF9pbnRyZW1hcF90YWJsZSwgTlVM
TCk7Cj4gKyAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmc2hhcmVkX2ludHJlbWFwX2xv
Y2ssIGZsYWdzKTsKPiArICAgIH0KPiAgIH0KPiAKCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
