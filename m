Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD7F6EAA0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 20:26:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoXXC-0004aw-Mu; Fri, 19 Jul 2019 18:23:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AH7D=VQ=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hoXXB-0004ar-HY
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 18:23:09 +0000
X-Inumbo-ID: 41a859da-aa52-11e9-8980-bc764e045a96
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe49::600])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 41a859da-aa52-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 18:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJms4nBSW1jZu3UhA61ohngufYyzmNKxDHXtO4WxaL0E2PSl84e99+TMDZekJ/hzCwOd1gYSRsC/1mTrMkERxc6FKQWHALxG/o1E3wpArF3CEZLtSrTl5Uf25x315/A09lsYII7c5nqzPb7KPMbjhwNu1UsgOgKuvOCmv2JnxP1/MlpnBzpvquPwELfRqtB80hsjTLR8b2evA9K8Zb8htXPVfn2dZYrp0rndsGIWJFLP9P/LXxsVnsFD7cRxvkI3VI+AuUKsgReNiovEDhw4W1/nLwsUfKKWOu1s80Lx1cop5Zh/iGJUKfltYfjeN5xyeMDX13ZQIWdFU8NMrcYyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsxCh8N6FdGCjaKKMYaMvI+Ap2HeeY9J+EUroR+SQso=;
 b=iY0h55QuHNtyQwF8jsD5huJYef6/FaZ3DgRgL+yge+qdjjRJ36AgtODlXT2wJ7QcVaqmaV+v/UsAaegOnZKNrS8l9/LI4oxyKsutp/mJEyGe4lJykHulPTQhbYydBU4XDgH4iYyjb5CJuNAwrYOxqUdvVmpdw971uTcjj698xbUb/2xraYDlNp8gFq1rFbP0Df7ylASGzAn0nOrCfTZ9Gp48/ikaXPcFxy+u8u4OeOKpAqrb8M5H7RavHKktiRNAKkaLjy/b7tr1mW+1wOr43aDwYSrfuP0Hp+CaZv0E7emqrztmaQqxlz+ZdAkQKo34+vI0OR8T6Zg7rLqpo40zGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsxCh8N6FdGCjaKKMYaMvI+Ap2HeeY9J+EUroR+SQso=;
 b=YLPrroQUJNpKPdXvmXtJgn6pryVWAYUP5qa8t9MtCTDREc681ntqAvM7x5Gdt/23ggwLsbdOViyAL9UIQlhpdFQbTulInCj7nGK66fcxne9SGMpDuQ8F2aB7ZQX7IGH+ehCRy/Z+eVK+UKVXiiWh1vV/v1oqvY0wFkHyfo0yoow=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2617.namprd12.prod.outlook.com (20.176.116.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 18:23:06 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 18:23:06 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3 03/14] AMD/IOMMU: use bit field for control register
Thread-Index: AQHVO/S8EvSZwaI0v0+m6Zfm+fAVm6bSRheA
Date: Fri, 19 Jul 2019 18:23:06 +0000
Message-ID: <20190719182303.GB4496@amd.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <3bca9f91-7cd8-e1bd-6d4c-736998fd3f0a@suse.com>
In-Reply-To: <3bca9f91-7cd8-e1bd-6d4c-736998fd3f0a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:3:ef::19) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68fc3397-8388-40de-bd7e-08d70c762506
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2617; 
x-ms-traffictypediagnostic: DM6PR12MB2617:
x-microsoft-antispam-prvs: <DM6PR12MB26176720202C5A1AB6827B0CE5CB0@DM6PR12MB2617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(14454004)(256004)(14444005)(3846002)(316002)(54906003)(305945005)(66066001)(7736002)(66946007)(66476007)(66446008)(64756008)(66556008)(1076003)(5660300002)(99286004)(8936002)(30864003)(36756003)(6116002)(68736007)(25786009)(52116002)(76176011)(4326008)(86362001)(33656002)(2906002)(53936002)(53946003)(6436002)(6512007)(229853002)(478600001)(26005)(486006)(102836004)(386003)(6506007)(81166006)(81156014)(186003)(6246003)(6916009)(6486002)(71190400001)(11346002)(476003)(8676002)(71200400001)(2616005)(446003)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2617;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jB5bzv5h/KricWjLfcr1iEtlTHPhRxutJCxY8m96N/K8wG55KfBR3D326q4KGogDshLQa6umlIIEhO7Dugdqb0EFePD53XnXjAWrbjm+8LBiXFifnnt8YQ7qmYKq12MZ/lVHoA0zieEZhPAQUnplA4t4E91K0gOkFniTWY6qchWyhFXQr9Qx2xY28cmGe1styDeHidIeo/kvPcApN7SmddBVPMi/nm8nasIqvpRaKg+mnpqwEHui3q1b81UmX9Tzl2Oz8reg1p9hB3RXPN7lVpctxGi2a85euEF5HAc3xeU+2W57vYM15b/vwzc1+tmHCfpALlV8ItCwxn+7IiyOXAcr3TUlzqI9yyzU/TmJ1UpmvAyiLMX66vbwpOIVyZtcGylwQ4pEYzYXUfId2ulwWaBPeQO8Im/wPa8T3v5edbE=
Content-ID: <09CA76186F019F498B50C2CBB708D192@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fc3397-8388-40de-bd7e-08d70c762506
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 18:23:06.4786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2617
Subject: Re: [Xen-devel] [PATCH v3 03/14] AMD/IOMMU: use bit field for
 control register
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMDQ6MzY6MDZQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQWxzbyBpbnRyb2R1Y2UgYSBmaWVsZCBpbiBzdHJ1Y3QgYW1kX2lvbW11IGNhY2hpbmcg
dGhlIG1vc3QgcmVjZW50bHkKPiB3cml0dGVuIGNvbnRyb2wgcmVnaXN0ZXIuIEFsbCB3cml0ZXMg
c2hvdWxkIG5vdyBoYXBwZW4gZXhjbHVzaXZlbHkgZnJvbQo+IHRoYXQgY2FjaGVkIHZhbHVlLCBz
dWNoIHRoYXQgaXQgaXMgZ3VhcmFudGVlZCB0byBiZSB1cCB0byBkYXRlLgo+IAo+IFRha2UgdGhl
IG9wcG9ydHVuaXR5IGFuZCBhZGQgZnVydGhlciBmaWVsZHMuIEFsc28gY29udmVydCBhIGZldyBi
b29sZWFuCj4gZnVuY3Rpb24gcGFyYW1ldGVycyB0byBib29sLCBzdWNoIHRoYXQgdXNlIG9mICEh
IGNhbiBiZSBhdm9pZGVkLgo+IAo+IEJlY2F1c2Ugb2YgdGhlcmUgbm93IGJlaW5nIGRlZmluaXRp
b25zIGJleW9uZCBiaXQgMzEsIHdyaXRlbCgpIGFsc28gZ2V0cwo+IHJlcGxhY2VkIGJ5IHdyaXRl
cSgpIHdoZW4gdXBkYXRpbmcgaGFyZHdhcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0Bh
bWQuY29tPgoKPiAtLS0KPiB2MzogU3dpdGNoIGJvb2xlYW4gYml0ZmllbGRzIHRvIGJvb2wuCj4g
djI6IEFkZCBkb21haW5faWRfcG5lIGZpZWxkLiBNZW50aW9uIHdyaXRlbCgpIC0+IHdyaXRlcSgp
IGNoYW5nZS4KPiAKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfZ3Vl
c3QuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9ndWVzdC5jCj4g
QEAgLTMxNyw3ICszMTcsNyBAQCBzdGF0aWMgaW50IGRvX2ludmFsaWRhdGVfaW90bGJfcGFnZXMo
c3RyCj4gICAKPiAgIHN0YXRpYyBpbnQgZG9fY29tcGxldGlvbl93YWl0KHN0cnVjdCBkb21haW4g
KmQsIGNtZF9lbnRyeV90ICpjbWQpCj4gICB7Cj4gLSAgICBib29sX3QgY29tX3dhaXRfaW50X2Vu
LCBjb21fd2FpdF9pbnQsIGksIHM7Cj4gKyAgICBib29sIGNvbV93YWl0X2ludCwgaSwgczsKPiAg
ICAgICBzdHJ1Y3QgZ3Vlc3RfaW9tbXUgKmlvbW11Owo+ICAgICAgIHVuc2lnbmVkIGxvbmcgZ2Zu
Owo+ICAgICAgIHAybV90eXBlX3QgcDJtdDsKPiBAQCAtMzU0LDEyICszNTQsMTAgQEAgc3RhdGlj
IGludCBkb19jb21wbGV0aW9uX3dhaXQoc3RydWN0IGRvbQo+ICAgICAgICAgICB1bm1hcF9kb21h
aW5fcGFnZSh2YWRkcik7Cj4gICAgICAgfQo+ICAgCj4gLSAgICBjb21fd2FpdF9pbnRfZW4gPSBp
b21tdV9nZXRfYml0KGlvbW11LT5yZWdfY3RybC5sbywKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgSU9NTVVfQ09OVFJPTF9DT01QX1dBSVRfSU5UX1NISUZUKTsKPiAgICAg
ICBjb21fd2FpdF9pbnQgPSBpb21tdV9nZXRfYml0KGlvbW11LT5yZWdfc3RhdHVzLmxvLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfU1RBVFVTX0NPTVBfV0FJVF9J
TlRfU0hJRlQpOwo+ICAgCj4gLSAgICBpZiAoIGNvbV93YWl0X2ludF9lbiAmJiBjb21fd2FpdF9p
bnQgKQo+ICsgICAgaWYgKCBpb21tdS0+cmVnX2N0cmwuY29tX3dhaXRfaW50X2VuICYmIGNvbV93
YWl0X2ludCApCj4gICAgICAgICAgIGd1ZXN0X2lvbW11X2RlbGl2ZXJfbXNpKGQpOwo+ICAgCj4g
ICAgICAgcmV0dXJuIDA7Cj4gQEAgLTUyMSw0MCArNTE5LDE3IEBAIHN0YXRpYyB2b2lkIGd1ZXN0
X2lvbW11X3Byb2Nlc3NfY29tbWFuZCgKPiAgICAgICByZXR1cm47Cj4gICB9Cj4gICAKPiAtc3Rh
dGljIGludCBndWVzdF9pb21tdV93cml0ZV9jdHJsKHN0cnVjdCBndWVzdF9pb21tdSAqaW9tbXUs
IHVpbnQ2NF90IG5ld2N0cmwpCj4gK3N0YXRpYyBpbnQgZ3Vlc3RfaW9tbXVfd3JpdGVfY3RybChz
dHJ1Y3QgZ3Vlc3RfaW9tbXUgKmlvbW11LCB1aW50NjRfdCB2YWwpCj4gICB7Cj4gLSAgICBib29s
X3QgY21kX2VuLCBldmVudF9lbiwgaW9tbXVfZW4sIHBwcl9lbiwgcHByX2xvZ19lbjsKPiAtICAg
IGJvb2xfdCBjbWRfZW5fb2xkLCBldmVudF9lbl9vbGQsIGlvbW11X2VuX29sZDsKPiAtICAgIGJv
b2xfdCBjbWRfcnVuOwo+IC0KPiAtICAgIGlvbW11X2VuID0gaW9tbXVfZ2V0X2JpdChuZXdjdHJs
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0NPTlRST0xfVFJBTlNMQVRJ
T05fRU5BQkxFX1NISUZUKTsKPiAtICAgIGlvbW11X2VuX29sZCA9IGlvbW11X2dldF9iaXQoaW9t
bXUtPnJlZ19jdHJsLmxvLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01N
VV9DT05UUk9MX1RSQU5TTEFUSU9OX0VOQUJMRV9TSElGVCk7Cj4gLQo+IC0gICAgY21kX2VuID0g
aW9tbXVfZ2V0X2JpdChuZXdjdHJsLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBJT01N
VV9DT05UUk9MX0NPTU1BTkRfQlVGRkVSX0VOQUJMRV9TSElGVCk7Cj4gLSAgICBjbWRfZW5fb2xk
ID0gaW9tbXVfZ2V0X2JpdChpb21tdS0+cmVnX2N0cmwubG8sCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBJT01NVV9DT05UUk9MX0NPTU1BTkRfQlVGRkVSX0VOQUJMRV9TSElGVCk7
Cj4gLSAgICBjbWRfcnVuID0gaW9tbXVfZ2V0X2JpdChpb21tdS0+cmVnX3N0YXR1cy5sbywKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX1NUQVRVU19DTURfQlVGRkVSX1JVTl9T
SElGVCk7Cj4gLSAgICBldmVudF9lbiA9IGlvbW11X2dldF9iaXQobmV3Y3RybCwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9DT05UUk9MX0VWRU5UX0xPR19FTkFCTEVfU0hJ
RlQpOwo+IC0gICAgZXZlbnRfZW5fb2xkID0gaW9tbXVfZ2V0X2JpdChpb21tdS0+cmVnX2N0cmwu
bG8sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0NPTlRST0xfRVZF
TlRfTE9HX0VOQUJMRV9TSElGVCk7Cj4gLQo+IC0gICAgcHByX2VuID0gaW9tbXVfZ2V0X2JpdChu
ZXdjdHJsLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9DT05UUk9MX1BQUl9F
TkFCTEVfU0hJRlQpOwo+IC0gICAgcHByX2xvZ19lbiA9IGlvbW11X2dldF9iaXQobmV3Y3RybCwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0NPTlRST0xfUFBSX0xPR19F
TkFCTEVfU0hJRlQpOwo+ICsgICAgdW5pb24gYW1kX2lvbW11X2NvbnRyb2wgbmV3Y3RybCA9IHsg
LnJhdyA9IHZhbCB9Owo+ICAgCj4gLSAgICBpZiAoIGlvbW11X2VuICkKPiArICAgIGlmICggbmV3
Y3RybC5pb21tdV9lbiApCj4gICAgICAgewo+ICAgICAgICAgICBndWVzdF9pb21tdV9lbmFibGUo
aW9tbXUpOwo+ICAgICAgICAgICBndWVzdF9pb21tdV9lbmFibGVfZGV2X3RhYmxlKGlvbW11KTsK
PiAgICAgICB9Cj4gICAKPiAtICAgIGlmICggaW9tbXVfZW4gJiYgY21kX2VuICkKPiArICAgIGlm
ICggbmV3Y3RybC5pb21tdV9lbiAmJiBuZXdjdHJsLmNtZF9idWZfZW4gKQo+ICAgICAgIHsKPiAg
ICAgICAgICAgZ3Vlc3RfaW9tbXVfZW5hYmxlX3JpbmdfYnVmZmVyKGlvbW11LCAmaW9tbXUtPmNt
ZF9idWZmZXIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
b2YoY21kX2VudHJ5X3QpKTsKPiBAQCAtNTYyLDcgKzUzNyw3IEBAIHN0YXRpYyBpbnQgZ3Vlc3Rf
aW9tbXVfd3JpdGVfY3RybChzdHJ1Y3QKPiAgICAgICAgICAgdGFza2xldF9zY2hlZHVsZSgmaW9t
bXUtPmNtZF9idWZmZXJfdGFza2xldCk7Cj4gICAgICAgfQo+ICAgCj4gLSAgICBpZiAoIGlvbW11
X2VuICYmIGV2ZW50X2VuICkKPiArICAgIGlmICggbmV3Y3RybC5pb21tdV9lbiAmJiBuZXdjdHJs
LmV2ZW50X2xvZ19lbiApCj4gICAgICAgewo+ICAgICAgICAgICBndWVzdF9pb21tdV9lbmFibGVf
cmluZ19idWZmZXIoaW9tbXUsICZpb21tdS0+ZXZlbnRfbG9nLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGV2ZW50X2VudHJ5X3QpKTsKPiBAQCAtNTcw
LDcgKzU0NSw3IEBAIHN0YXRpYyBpbnQgZ3Vlc3RfaW9tbXVfd3JpdGVfY3RybChzdHJ1Y3QKPiAg
ICAgICAgICAgZ3Vlc3RfaW9tbXVfY2xlYXJfc3RhdHVzKGlvbW11LCBJT01NVV9TVEFUVVNfRVZF
TlRfT1ZFUkZMT1dfU0hJRlQpOwo+ICAgICAgIH0KPiAgIAo+IC0gICAgaWYgKCBpb21tdV9lbiAm
JiBwcHJfZW4gJiYgcHByX2xvZ19lbiApCj4gKyAgICBpZiAoIG5ld2N0cmwuaW9tbXVfZW4gJiYg
bmV3Y3RybC5wcHJfZW4gJiYgbmV3Y3RybC5wcHJfbG9nX2VuICkKPiAgICAgICB7Cj4gICAgICAg
ICAgIGd1ZXN0X2lvbW11X2VuYWJsZV9yaW5nX2J1ZmZlcihpb21tdSwgJmlvbW11LT5wcHJfbG9n
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHBwcl9l
bnRyeV90KSk7Cj4gQEAgLTU3OCwxOSArNTUzLDIxIEBAIHN0YXRpYyBpbnQgZ3Vlc3RfaW9tbXVf
d3JpdGVfY3RybChzdHJ1Y3QKPiAgICAgICAgICAgZ3Vlc3RfaW9tbXVfY2xlYXJfc3RhdHVzKGlv
bW11LCBJT01NVV9TVEFUVVNfUFBSX0xPR19PVkVSRkxPV19TSElGVCk7Cj4gICAgICAgfQo+ICAg
Cj4gLSAgICBpZiAoIGlvbW11X2VuICYmIGNtZF9lbl9vbGQgJiYgIWNtZF9lbiApCj4gKyAgICBp
ZiAoIG5ld2N0cmwuaW9tbXVfZW4gJiYgaW9tbXUtPnJlZ19jdHJsLmNtZF9idWZfZW4gJiYKPiAr
ICAgICAgICAgIW5ld2N0cmwuY21kX2J1Zl9lbiApCj4gICAgICAgewo+ICAgICAgICAgICAvKiBE
aXNhYmxlIGlvbW11IGNvbW1hbmQgcHJvY2Vzc2luZyAqLwo+ICAgICAgICAgICB0YXNrbGV0X2tp
bGwoJmlvbW11LT5jbWRfYnVmZmVyX3Rhc2tsZXQpOwo+ICAgICAgIH0KPiAgIAo+IC0gICAgaWYg
KCBldmVudF9lbl9vbGQgJiYgIWV2ZW50X2VuICkKPiArICAgIGlmICggaW9tbXUtPnJlZ19jdHJs
LmV2ZW50X2xvZ19lbiAmJiAhbmV3Y3RybC5ldmVudF9sb2dfZW4gKQo+ICAgICAgICAgICBndWVz
dF9pb21tdV9jbGVhcl9zdGF0dXMoaW9tbXUsIElPTU1VX1NUQVRVU19FVkVOVF9MT0dfUlVOX1NI
SUZUKTsKPiAgIAo+IC0gICAgaWYgKCBpb21tdV9lbl9vbGQgJiYgIWlvbW11X2VuICkKPiArICAg
IGlmICggaW9tbXUtPnJlZ19jdHJsLmlvbW11X2VuICYmICFuZXdjdHJsLmlvbW11X2VuICkKPiAg
ICAgICAgICAgZ3Vlc3RfaW9tbXVfZGlzYWJsZShpb21tdSk7Cj4gICAKPiAtICAgIHU2NF90b19y
ZWcoJmlvbW11LT5yZWdfY3RybCwgbmV3Y3RybCk7Cj4gKyAgICBpb21tdS0+cmVnX2N0cmwgPSBu
ZXdjdHJsOwo+ICsKPiAgICAgICByZXR1cm4gMDsKPiAgIH0KPiAgIAo+IEBAIC02MzIsNyArNjA5
LDcgQEAgc3RhdGljIHVpbnQ2NF90IGlvbW11X21taW9fcmVhZDY0KHN0cnVjdAo+ICAgICAgICAg
ICB2YWwgPSByZWdfdG9fdTY0KGlvbW11LT5wcHJfbG9nLnJlZ190YWlsKTsKPiAgICAgICAgICAg
YnJlYWs7Cj4gICAgICAgY2FzZSBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VUOgo+IC0gICAgICAg
IHZhbCA9IHJlZ190b191NjQoaW9tbXUtPnJlZ19jdHJsKTsKPiArICAgICAgICB2YWwgPSBpb21t
dS0+cmVnX2N0cmwucmF3Owo+ICAgICAgICAgICBicmVhazsKPiAgICAgICBjYXNlIElPTU1VX1NU
QVRVU19NTUlPX09GRlNFVDoKPiAgICAgICAgICAgdmFsID0gcmVnX3RvX3U2NChpb21tdS0+cmVn
X3N0YXR1cyk7Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQu
Ywo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiBAQCAt
NDEsNyArNDEsNyBAQCBMSVNUX0hFQURfUkVBRF9NT1NUTFkoYW1kX2lvbW11X2hlYWQpOwo+ICAg
c3RydWN0IHRhYmxlX3N0cnVjdCBkZXZpY2VfdGFibGU7Cj4gICBib29sX3QgaW9tbXV2Ml9lbmFi
bGVkOwo+ICAgCj4gLXN0YXRpYyBpbnQgaW9tbXVfaGFzX2h0X2ZsYWcoc3RydWN0IGFtZF9pb21t
dSAqaW9tbXUsIHU4IG1hc2spCj4gK3N0YXRpYyBib29sIGlvbW11X2hhc19odF9mbGFnKHN0cnVj
dCBhbWRfaW9tbXUgKmlvbW11LCB1OCBtYXNrKQo+ICAgewo+ICAgICAgIHJldHVybiBpb21tdS0+
aHRfZmxhZ3MgJiBtYXNrOwo+ICAgfQo+IEBAIC02OSwzMSArNjksMTggQEAgc3RhdGljIHZvaWQg
X19pbml0IHVubWFwX2lvbW11X21taW9fcmVnaQo+ICAgCj4gICBzdGF0aWMgdm9pZCBzZXRfaW9t
bXVfaHRfZmxhZ3Moc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCj4gICB7Cj4gLSAgICB1MzIgZW50
cnk7Cj4gLSAgICBlbnRyeSA9IHJlYWRsKGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9M
X01NSU9fT0ZGU0VUKTsKPiAtCj4gICAgICAgLyogU2V0dXAgSFQgZmxhZ3MgKi8KPiAgICAgICBp
ZiAoIGlvbW11X2hhc19jYXAoaW9tbXUsIFBDSV9DQVBfSFRfVFVOTkVMX1NISUZUKSApCj4gLSAg
ICAgICAgaW9tbXVfaGFzX2h0X2ZsYWcoaW9tbXUsIEFDUElfSVZIRF9UVF9FTkFCTEUpID8KPiAt
ICAgICAgICAgICAgaW9tbXVfc2V0X2JpdCgmZW50cnksIElPTU1VX0NPTlRST0xfSFRfVFVOTkVM
X1RSQU5TTEFUSU9OX1NISUZUKSA6Cj4gLSAgICAgICAgICAgIGlvbW11X2NsZWFyX2JpdCgmZW50
cnksIElPTU1VX0NPTlRST0xfSFRfVFVOTkVMX1RSQU5TTEFUSU9OX1NISUZUKTsKPiAtCj4gLSAg
ICBpb21tdV9oYXNfaHRfZmxhZyhpb21tdSwgQUNQSV9JVkhEX1JFU19QQVNTX1BXKSA/Cj4gLSAg
ICAgICAgaW9tbXVfc2V0X2JpdCgmZW50cnksIElPTU1VX0NPTlRST0xfUkVTUF9QQVNTX1BPU1RF
RF9XUklURV9TSElGVCk6Cj4gLSAgICAgICAgaW9tbXVfY2xlYXJfYml0KCZlbnRyeSwgSU9NTVVf
Q09OVFJPTF9SRVNQX1BBU1NfUE9TVEVEX1dSSVRFX1NISUZUKTsKPiAtCj4gLSAgICBpb21tdV9o
YXNfaHRfZmxhZyhpb21tdSwgQUNQSV9JVkhEX0lTT0MpID8KPiAtICAgICAgICBpb21tdV9zZXRf
Yml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9JU09DSFJPTk9VU19TSElGVCk6Cj4gLSAgICAgICAg
aW9tbXVfY2xlYXJfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9JU09DSFJPTk9VU19TSElGVCk7
Cj4gLQo+IC0gICAgaW9tbXVfaGFzX2h0X2ZsYWcoaW9tbXUsIEFDUElfSVZIRF9QQVNTX1BXKSA/
Cj4gLSAgICAgICAgaW9tbXVfc2V0X2JpdCgmZW50cnksIElPTU1VX0NPTlRST0xfUEFTU19QT1NU
RURfV1JJVEVfU0hJRlQpOgo+IC0gICAgICAgIGlvbW11X2NsZWFyX2JpdCgmZW50cnksIElPTU1V
X0NPTlRST0xfUEFTU19QT1NURURfV1JJVEVfU0hJRlQpOwo+ICsgICAgICAgIGlvbW11LT5jdHJs
Lmh0X3R1bl9lbiA9IGlvbW11X2hhc19odF9mbGFnKGlvbW11LCBBQ1BJX0lWSERfVFRfRU5BQkxF
KTsKPiArCj4gKyAgICBpb21tdS0+Y3RybC5wYXNzX3B3ICAgICA9IGlvbW11X2hhc19odF9mbGFn
KGlvbW11LCBBQ1BJX0lWSERfUEFTU19QVyk7Cj4gKyAgICBpb21tdS0+Y3RybC5yZXNfcGFzc19w
dyA9IGlvbW11X2hhc19odF9mbGFnKGlvbW11LCBBQ1BJX0lWSERfUkVTX1BBU1NfUFcpOwo+ICsg
ICAgaW9tbXUtPmN0cmwuaXNvYyAgICAgICAgPSBpb21tdV9oYXNfaHRfZmxhZyhpb21tdSwgQUNQ
SV9JVkhEX0lTT0MpOwo+ICAgCj4gICAgICAgLyogRm9yY2UgY29oZXJlbnQgKi8KPiAtICAgIGlv
bW11X3NldF9iaXQoJmVudHJ5LCBJT01NVV9DT05UUk9MX0NPSEVSRU5UX1NISUZUKTsKPiArICAg
IGlvbW11LT5jdHJsLmNvaGVyZW50ID0gdHJ1ZTsKPiAgIAo+IC0gICAgd3JpdGVsKGVudHJ5LCBp
b21tdS0+bW1pb19iYXNlK0lPTU1VX0NPTlRST0xfTU1JT19PRkZTRVQpOwo+ICsgICAgd3JpdGVx
KGlvbW11LT5jdHJsLnJhdywgaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX0NPTlRST0xfTU1JT19P
RkZTRVQpOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCByZWdpc3Rlcl9pb21tdV9kZXZfdGFi
bGVfaW5fbW1pb19zcGFjZShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSkKPiBAQCAtMjA1LDU1ICsx
OTIsMzcgQEAgc3RhdGljIHZvaWQgcmVnaXN0ZXJfaW9tbXVfcHByX2xvZ19pbl9tbQo+ICAgCj4g
ICAKPiAgIHN0YXRpYyB2b2lkIHNldF9pb21tdV90cmFuc2xhdGlvbl9jb250cm9sKHN0cnVjdCBh
bWRfaW9tbXUgKmlvbW11LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50IGVuYWJsZSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYm9vbCBlbmFibGUpCj4gICB7Cj4gLSAgICB1MzIgZW50cnk7Cj4gKyAgICBp
b21tdS0+Y3RybC5pb21tdV9lbiA9IGVuYWJsZTsKPiAgIAo+IC0gICAgZW50cnkgPSByZWFkbChp
b21tdS0+bW1pb19iYXNlICsgSU9NTVVfQ09OVFJPTF9NTUlPX09GRlNFVCk7Cj4gLQo+IC0gICAg
ZW5hYmxlID8KPiAtICAgICAgICBpb21tdV9zZXRfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9U
UkFOU0xBVElPTl9FTkFCTEVfU0hJRlQpIDoKPiAtICAgICAgICBpb21tdV9jbGVhcl9iaXQoJmVu
dHJ5LCBJT01NVV9DT05UUk9MX1RSQU5TTEFUSU9OX0VOQUJMRV9TSElGVCk7Cj4gLQo+IC0gICAg
d3JpdGVsKGVudHJ5LCBpb21tdS0+bW1pb19iYXNlK0lPTU1VX0NPTlRST0xfTU1JT19PRkZTRVQp
Owo+ICsgICAgd3JpdGVxKGlvbW11LT5jdHJsLnJhdywgaW9tbXUtPm1taW9fYmFzZSArIElPTU1V
X0NPTlRST0xfTU1JT19PRkZTRVQpOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCBzZXRfaW9t
bXVfZ3Vlc3RfdHJhbnNsYXRpb25fY29udHJvbChzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGVuYWJs
ZSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9v
bCBlbmFibGUpCj4gICB7Cj4gLSAgICB1MzIgZW50cnk7Cj4gLQo+IC0gICAgZW50cnkgPSByZWFk
bChpb21tdS0+bW1pb19iYXNlICsgSU9NTVVfQ09OVFJPTF9NTUlPX09GRlNFVCk7Cj4gKyAgICBp
b21tdS0+Y3RybC5ndF9lbiA9IGVuYWJsZTsKPiAgIAo+IC0gICAgZW5hYmxlID8KPiAtICAgICAg
ICBpb21tdV9zZXRfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9HVF9FTkFCTEVfU0hJRlQpIDoK
PiAtICAgICAgICBpb21tdV9jbGVhcl9iaXQoJmVudHJ5LCBJT01NVV9DT05UUk9MX0dUX0VOQUJM
RV9TSElGVCk7Cj4gLQo+IC0gICAgd3JpdGVsKGVudHJ5LCBpb21tdS0+bW1pb19iYXNlK0lPTU1V
X0NPTlRST0xfTU1JT19PRkZTRVQpOwo+ICsgICAgd3JpdGVxKGlvbW11LT5jdHJsLnJhdywgaW9t
bXUtPm1taW9fYmFzZSArIElPTU1VX0NPTlRST0xfTU1JT19PRkZTRVQpOwo+ICAgCj4gICAgICAg
aWYgKCBlbmFibGUgKQo+ICAgICAgICAgICBBTURfSU9NTVVfREVCVUcoIkd1ZXN0IFRyYW5zbGF0
aW9uIEVuYWJsZWQuXG4iKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgc2V0X2lvbW11X2Nv
bW1hbmRfYnVmZmVyX2NvbnRyb2woc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZW5hYmxlKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGVuYWJs
ZSkKPiAgIHsKPiAtICAgIHUzMiBlbnRyeTsKPiAtCj4gLSAgICBlbnRyeSA9IHJlYWRsKGlvbW11
LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VUKTsKPiAtCj4gLSAgICAvKnJl
c2V0IGhlYWQgYW5kIHRhaWwgcG9pbnRlciBtYW51YWxseSBiZWZvcmUgZW5hYmxlbWVudCAqLwo+
ICsgICAgLyogUmVzZXQgaGVhZCBhbmQgdGFpbCBwb2ludGVyIG1hbnVhbGx5IGJlZm9yZSBlbmFi
bGVtZW50ICovCj4gICAgICAgaWYgKCBlbmFibGUgKQo+ICAgICAgIHsKPiAgICAgICAgICAgd3Jp
dGVxKDAsIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DTURfQlVGRkVSX0hFQURfT0ZGU0VUKTsK
PiAgICAgICAgICAgd3JpdGVxKDAsIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DTURfQlVGRkVS
X1RBSUxfT0ZGU0VUKTsKPiAtCj4gLSAgICAgICAgaW9tbXVfc2V0X2JpdCgmZW50cnksIElPTU1V
X0NPTlRST0xfQ09NTUFORF9CVUZGRVJfRU5BQkxFX1NISUZUKTsKPiAgICAgICB9Cj4gLSAgICBl
bHNlCj4gLSAgICAgICAgaW9tbXVfY2xlYXJfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9DT01N
QU5EX0JVRkZFUl9FTkFCTEVfU0hJRlQpOwo+ICAgCj4gLSAgICB3cml0ZWwoZW50cnksIGlvbW11
LT5tbWlvX2Jhc2UrSU9NTVVfQ09OVFJPTF9NTUlPX09GRlNFVCk7Cj4gKyAgICBpb21tdS0+Y3Ry
bC5jbWRfYnVmX2VuID0gZW5hYmxlOwo+ICsKPiArICAgIHdyaXRlcShpb21tdS0+Y3RybC5yYXcs
IGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VUKTsKPiAgIH0KPiAg
IAo+ICAgc3RhdGljIHZvaWQgcmVnaXN0ZXJfaW9tbXVfZXhjbHVzaW9uX3JhbmdlKHN0cnVjdCBh
bWRfaW9tbXUgKmlvbW11KQo+IEBAIC0yOTUsNTcgKzI2NCwzOCBAQCBzdGF0aWMgdm9pZCByZWdp
c3Rlcl9pb21tdV9leGNsdXNpb25fcmFuCj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHNldF9p
b21tdV9ldmVudF9sb2dfY29udHJvbChzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKPiAtICAgICAg
ICAgICAgaW50IGVuYWJsZSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgZW5hYmxlKQo+ICAgewo+IC0gICAgdTMyIGVudHJ5Owo+IC0KPiAtICAgIGVudHJ5
ID0gcmVhZGwoaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX0NPTlRST0xfTU1JT19PRkZTRVQpOwo+
IC0KPiAtICAgIC8qcmVzZXQgaGVhZCBhbmQgdGFpbCBwb2ludGVyIG1hbnVhbGx5IGJlZm9yZSBl
bmFibGVtZW50ICovCj4gKyAgICAvKiBSZXNldCBoZWFkIGFuZCB0YWlsIHBvaW50ZXIgbWFudWFs
bHkgYmVmb3JlIGVuYWJsZW1lbnQgKi8KPiAgICAgICBpZiAoIGVuYWJsZSApCj4gICAgICAgewo+
ICAgICAgICAgICB3cml0ZXEoMCwgaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX0VWRU5UX0xPR19I
RUFEX09GRlNFVCk7Cj4gICAgICAgICAgIHdyaXRlcSgwLCBpb21tdS0+bW1pb19iYXNlICsgSU9N
TVVfRVZFTlRfTE9HX1RBSUxfT0ZGU0VUKTsKPiAtCj4gLSAgICAgICAgaW9tbXVfc2V0X2JpdCgm
ZW50cnksIElPTU1VX0NPTlRST0xfRVZFTlRfTE9HX0lOVF9TSElGVCk7Cj4gLSAgICAgICAgaW9t
bXVfc2V0X2JpdCgmZW50cnksIElPTU1VX0NPTlRST0xfRVZFTlRfTE9HX0VOQUJMRV9TSElGVCk7
Cj4gLSAgICB9Cj4gLSAgICBlbHNlCj4gLSAgICB7Cj4gLSAgICAgICAgaW9tbXVfY2xlYXJfYml0
KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9FVkVOVF9MT0dfSU5UX1NISUZUKTsKPiAtICAgICAgICBp
b21tdV9jbGVhcl9iaXQoJmVudHJ5LCBJT01NVV9DT05UUk9MX0VWRU5UX0xPR19FTkFCTEVfU0hJ
RlQpOwo+ICAgICAgIH0KPiAgIAo+IC0gICAgaW9tbXVfY2xlYXJfYml0KCZlbnRyeSwgSU9NTVVf
Q09OVFJPTF9DT01QX1dBSVRfSU5UX1NISUZUKTsKPiArICAgIGlvbW11LT5jdHJsLmV2ZW50X2lu
dF9lbiA9IGVuYWJsZTsKPiArICAgIGlvbW11LT5jdHJsLmV2ZW50X2xvZ19lbiA9IGVuYWJsZTsK
PiArICAgIGlvbW11LT5jdHJsLmNvbV93YWl0X2ludF9lbiA9IGZhbHNlOwo+ICAgCj4gLSAgICB3
cml0ZWwoZW50cnksIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VU
KTsKPiArICAgIHdyaXRlcShpb21tdS0+Y3RybC5yYXcsIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01N
VV9DT05UUk9MX01NSU9fT0ZGU0VUKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgc2V0X2lv
bW11X3Bwcl9sb2dfY29udHJvbChzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZW5hYmxlKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZW5hYmxlKQo+ICAgewo+IC0gICAgdTMyIGVu
dHJ5Owo+IC0KPiAtICAgIGVudHJ5ID0gcmVhZGwoaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX0NP
TlRST0xfTU1JT19PRkZTRVQpOwo+IC0KPiAtICAgIC8qcmVzZXQgaGVhZCBhbmQgdGFpbCBwb2lu
dGVyIG1hbnVhbGx5IGJlZm9yZSBlbmFibGVtZW50ICovCj4gKyAgICAvKiBSZXNldCBoZWFkIGFu
ZCB0YWlsIHBvaW50ZXIgbWFudWFsbHkgYmVmb3JlIGVuYWJsZW1lbnQgKi8KPiAgICAgICBpZiAo
IGVuYWJsZSApCj4gICAgICAgewo+ICAgICAgICAgICB3cml0ZXEoMCwgaW9tbXUtPm1taW9fYmFz
ZSArIElPTU1VX1BQUl9MT0dfSEVBRF9PRkZTRVQpOwo+ICAgICAgICAgICB3cml0ZXEoMCwgaW9t
bXUtPm1taW9fYmFzZSArIElPTU1VX1BQUl9MT0dfVEFJTF9PRkZTRVQpOwo+IC0KPiAtICAgICAg
ICBpb21tdV9zZXRfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9QUFJfRU5BQkxFX1NISUZUKTsK
PiAtICAgICAgICBpb21tdV9zZXRfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9QUFJfTE9HX0lO
VF9TSElGVCk7Cj4gLSAgICAgICAgaW9tbXVfc2V0X2JpdCgmZW50cnksIElPTU1VX0NPTlRST0xf
UFBSX0xPR19FTkFCTEVfU0hJRlQpOwo+IC0gICAgfQo+IC0gICAgZWxzZQo+IC0gICAgewo+IC0g
ICAgICAgIGlvbW11X2NsZWFyX2JpdCgmZW50cnksIElPTU1VX0NPTlRST0xfUFBSX0VOQUJMRV9T
SElGVCk7Cj4gLSAgICAgICAgaW9tbXVfY2xlYXJfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9Q
UFJfTE9HX0lOVF9TSElGVCk7Cj4gLSAgICAgICAgaW9tbXVfY2xlYXJfYml0KCZlbnRyeSwgSU9N
TVVfQ09OVFJPTF9QUFJfTE9HX0VOQUJMRV9TSElGVCk7Cj4gICAgICAgfQo+ICAgCj4gLSAgICB3
cml0ZWwoZW50cnksIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VU
KTsKPiArICAgIGlvbW11LT5jdHJsLnBwcl9lbiA9IGVuYWJsZTsKPiArICAgIGlvbW11LT5jdHJs
LnBwcl9pbnRfZW4gPSBlbmFibGU7Cj4gKyAgICBpb21tdS0+Y3RybC5wcHJfbG9nX2VuID0gZW5h
YmxlOwo+ICsKPiArICAgIHdyaXRlcShpb21tdS0+Y3RybC5yYXcsIGlvbW11LT5tbWlvX2Jhc2Ug
KyBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VUKTsKPiArCj4gICAgICAgaWYgKCBlbmFibGUgKQo+
ICAgICAgICAgICBBTURfSU9NTVVfREVCVUcoIlBQUiBMb2cgRW5hYmxlZC5cbiIpOwo+ICAgfQo+
IEBAIC0zOTgsNyArMzQ4LDcgQEAgc3RhdGljIGludCBpb21tdV9yZWFkX2xvZyhzdHJ1Y3QgYW1k
X2lvbQo+ICAgLyogcmVzZXQgZXZlbnQgbG9nIG9yIHBwciBsb2cgd2hlbiBvdmVyZmxvdyAqLwo+
ICAgc3RhdGljIHZvaWQgaW9tbXVfcmVzZXRfbG9nKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCByaW5nX2J1ZmZlciAqbG9nLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAoKmN0cmxfZnVuYykoc3RydWN0IGFt
ZF9pb21tdSAqaW9tbXUsIGludCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICgqY3RybF9mdW5jKShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgYm9vbCkpCj4gICB7Cj4gICAg
ICAgdTMyIGVudHJ5Owo+ICAgICAgIGludCBsb2dfcnVuLCBydW5fYml0Owo+IEBAIC02MTUsMTEg
KzU2NSwxMSBAQCBzdGF0aWMgdm9pZCBpb21tdV9jaGVja19ldmVudF9sb2coc3RydWN0Cj4gICAg
ICAgICAgIGlvbW11X3Jlc2V0X2xvZyhpb21tdSwgJmlvbW11LT5ldmVudF9sb2csIHNldF9pb21t
dV9ldmVudF9sb2dfY29udHJvbCk7Cj4gICAgICAgZWxzZQo+ICAgICAgIHsKPiAtICAgICAgICBl
bnRyeSA9IHJlYWRsKGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VU
KTsKPiAtICAgICAgICBpZiAoICEoZW50cnkgJiBJT01NVV9DT05UUk9MX0VWRU5UX0xPR19JTlRf
TUFTSykgKQo+ICsgICAgICAgIGlmICggIWlvbW11LT5jdHJsLmV2ZW50X2ludF9lbiApCj4gICAg
ICAgICAgIHsKPiAtICAgICAgICAgICAgZW50cnkgfD0gSU9NTVVfQ09OVFJPTF9FVkVOVF9MT0df
SU5UX01BU0s7Cj4gLSAgICAgICAgICAgIHdyaXRlbChlbnRyeSwgaW9tbXUtPm1taW9fYmFzZSAr
IElPTU1VX0NPTlRST0xfTU1JT19PRkZTRVQpOwo+ICsgICAgICAgICAgICBpb21tdS0+Y3RybC5l
dmVudF9pbnRfZW4gPSB0cnVlOwo+ICsgICAgICAgICAgICB3cml0ZXEoaW9tbXUtPmN0cmwucmF3
LAo+ICsgICAgICAgICAgICAgICAgICAgaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX0NPTlRST0xf
TU1JT19PRkZTRVQpOwo+ICAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAqIFJlLXNj
aGVkdWxlIHRoZSB0YXNrbGV0IHRvIGhhbmRsZSBldmVudHVhbCBsb2cgZW50cmllcyBhZGRlZAo+
ICAgICAgICAgICAgICAgICogYmV0d2VlbiByZWFkaW5nIHRoZSBsb2cgYWJvdmUgYW5kIHJlLWVu
YWJsaW5nIHRoZSBpbnRlcnJ1cHQuCj4gQEAgLTcwNCwxMSArNjU0LDExIEBAIHN0YXRpYyB2b2lk
IGlvbW11X2NoZWNrX3Bwcl9sb2coc3RydWN0IGEKPiAgICAgICAgICAgaW9tbXVfcmVzZXRfbG9n
KGlvbW11LCAmaW9tbXUtPnBwcl9sb2csIHNldF9pb21tdV9wcHJfbG9nX2NvbnRyb2wpOwo+ICAg
ICAgIGVsc2UKPiAgICAgICB7Cj4gLSAgICAgICAgZW50cnkgPSByZWFkbChpb21tdS0+bW1pb19i
YXNlICsgSU9NTVVfQ09OVFJPTF9NTUlPX09GRlNFVCk7Cj4gLSAgICAgICAgaWYgKCAhKGVudHJ5
ICYgSU9NTVVfQ09OVFJPTF9QUFJfTE9HX0lOVF9NQVNLKSApCj4gKyAgICAgICAgaWYgKCAhaW9t
bXUtPmN0cmwucHByX2ludF9lbiApCj4gICAgICAgICAgIHsKPiAtICAgICAgICAgICAgZW50cnkg
fD0gSU9NTVVfQ09OVFJPTF9QUFJfTE9HX0lOVF9NQVNLOwo+IC0gICAgICAgICAgICB3cml0ZWwo
ZW50cnksIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9MX01NSU9fT0ZGU0VUKTsKPiAr
ICAgICAgICAgICAgaW9tbXUtPmN0cmwucHByX2ludF9lbiA9IHRydWU7Cj4gKyAgICAgICAgICAg
IHdyaXRlcShpb21tdS0+Y3RybC5yYXcsCj4gKyAgICAgICAgICAgICAgICAgICBpb21tdS0+bW1p
b19iYXNlICsgSU9NTVVfQ09OVFJPTF9NTUlPX09GRlNFVCk7Cj4gICAgICAgICAgICAgICAvKgo+
ICAgICAgICAgICAgICAgICogUmUtc2NoZWR1bGUgdGhlIHRhc2tsZXQgdG8gaGFuZGxlIGV2ZW50
dWFsIGxvZyBlbnRyaWVzIGFkZGVkCj4gICAgICAgICAgICAgICAgKiBiZXR3ZWVuIHJlYWRpbmcg
dGhlIGxvZyBhYm92ZSBhbmQgcmUtZW5hYmxpbmcgdGhlIGludGVycnVwdC4KPiBAQCAtNzU0LDcg
KzcwNCw2IEBAIHN0YXRpYyB2b2lkIGRvX2FtZF9pb21tdV9pcnEodW5zaWduZWQgbG8KPiAgIHN0
YXRpYyB2b2lkIGlvbW11X2ludGVycnVwdF9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzKQo+ICAgewo+IC0gICAgdTMyIGVudHJ5Owo+ICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3M7Cj4gICAgICAgc3RydWN0IGFtZF9pb21tdSAqaW9tbXUgPSBkZXZfaWQ7Cj4gICAKPiBA
QCAtNzY0LDEwICs3MTMsOSBAQCBzdGF0aWMgdm9pZCBpb21tdV9pbnRlcnJ1cHRfaGFuZGxlcihp
bnQKPiAgICAgICAgKiBTaWxlbmNlIGludGVycnVwdHMgZnJvbSBib3RoIGV2ZW50IGFuZCBQUFIg
YnkgY2xlYXJpbmcgdGhlCj4gICAgICAgICogZW5hYmxlIGxvZ2dpbmcgYml0cyBpbiB0aGUgY29u
dHJvbCByZWdpc3Rlcgo+ICAgICAgICAqLwo+IC0gICAgZW50cnkgPSByZWFkbChpb21tdS0+bW1p
b19iYXNlICsgSU9NTVVfQ09OVFJPTF9NTUlPX09GRlNFVCk7Cj4gLSAgICBpb21tdV9jbGVhcl9i
aXQoJmVudHJ5LCBJT01NVV9DT05UUk9MX0VWRU5UX0xPR19JTlRfU0hJRlQpOwo+IC0gICAgaW9t
bXVfY2xlYXJfYml0KCZlbnRyeSwgSU9NTVVfQ09OVFJPTF9QUFJfTE9HX0lOVF9TSElGVCk7Cj4g
LSAgICB3cml0ZWwoZW50cnksIGlvbW11LT5tbWlvX2Jhc2UgKyBJT01NVV9DT05UUk9MX01NSU9f
T0ZGU0VUKTsKPiArICAgIGlvbW11LT5jdHJsLmV2ZW50X2ludF9lbiA9IGZhbHNlOwo+ICsgICAg
aW9tbXUtPmN0cmwucHByX2ludF9lbiA9IGZhbHNlOwo+ICsgICAgd3JpdGVxKGlvbW11LT5jdHJs
LnJhdywgaW9tbXUtPm1taW9fYmFzZSArIElPTU1VX0NPTlRST0xfTU1JT19PRkZTRVQpOwo+ICAg
Cj4gICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPmxvY2ssIGZsYWdzKTsKPiAg
IAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYW1kLWlvbW11LmgKPiArKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L2FtZC1pb21tdS5oCj4gQEAgLTg4LDYgKzg4LDggQEAgc3RydWN0IGFtZF9p
b21tdSB7Cj4gICAgICAgdm9pZCAqbW1pb19iYXNlOwo+ICAgICAgIHVuc2lnbmVkIGxvbmcgbW1p
b19iYXNlX3BoeXM7Cj4gICAKPiArICAgIHVuaW9uIGFtZF9pb21tdV9jb250cm9sIGN0cmw7Cj4g
Kwo+ICAgICAgIHN0cnVjdCB0YWJsZV9zdHJ1Y3QgZGV2X3RhYmxlOwo+ICAgICAgIHN0cnVjdCBy
aW5nX2J1ZmZlciBjbWRfYnVmZmVyOwo+ICAgICAgIHN0cnVjdCByaW5nX2J1ZmZlciBldmVudF9s
b2c7Cj4gQEAgLTE3Miw3ICsxNzQsNyBAQCBzdHJ1Y3QgZ3Vlc3RfaW9tbXUgewo+ICAgICAgIHVp
bnQ2NF90ICAgICAgICAgICAgICAgIG1taW9fYmFzZTsgICAgICAgICAgICAgLyogTU1JTyBiYXNl
IGFkZHJlc3MgKi8KPiAgIAo+ICAgICAgIC8qIE1NSU8gcmVncyAqLwo+IC0gICAgc3RydWN0IG1t
aW9fcmVnICAgICAgICAgcmVnX2N0cmw7ICAgICAgICAgICAgICAvKiBNTUlPIG9mZnNldCAwMDE4
aCAqLwo+ICsgICAgdW5pb24gYW1kX2lvbW11X2NvbnRyb2wgcmVnX2N0cmw7ICAgICAgICAgICAg
ICAvKiBNTUlPIG9mZnNldCAwMDE4aCAqLwo+ICAgICAgIHN0cnVjdCBtbWlvX3JlZyAgICAgICAg
IHJlZ19zdGF0dXM7ICAgICAgICAgICAgLyogTU1JTyBvZmZzZXQgMjAyMGggKi8KPiAgICAgICB1
bmlvbiBhbWRfaW9tbXVfZXh0X2ZlYXR1cmVzIHJlZ19leHRfZmVhdHVyZTsgIC8qIE1NSU8gb2Zm
c2V0IDAwMzBoICovCj4gICAKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1k
LWlvbW11LWRlZnMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9hbWQtaW9t
bXUtZGVmcy5oCj4gQEAgLTI5NSwzOCArMjk1LDU2IEBAIHN0cnVjdCBhbWRfaW9tbXVfZHRlIHsK
PiAgIAo+ICAgLyogQ29udHJvbCBSZWdpc3RlciAqLwo+ICAgI2RlZmluZSBJT01NVV9DT05UUk9M
X01NSU9fT0ZGU0VUCQkJMHgxOAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfVFJBTlNMQVRJT05f
RU5BQkxFX01BU0sJCTB4MDAwMDAwMDEKPiAtI2RlZmluZSBJT01NVV9DT05UUk9MX1RSQU5TTEFU
SU9OX0VOQUJMRV9TSElGVAkJMAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfSFRfVFVOTkVMX1RS
QU5TTEFUSU9OX01BU0sJMHgwMDAwMDAwMgo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfSFRfVFVO
TkVMX1RSQU5TTEFUSU9OX1NISUZUCTEKPiAtI2RlZmluZSBJT01NVV9DT05UUk9MX0VWRU5UX0xP
R19FTkFCTEVfTUFTSwkJMHgwMDAwMDAwNAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfRVZFTlRf
TE9HX0VOQUJMRV9TSElGVAkJMgo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfRVZFTlRfTE9HX0lO
VF9NQVNLCQkweDAwMDAwMDA4Cj4gLSNkZWZpbmUgSU9NTVVfQ09OVFJPTF9FVkVOVF9MT0dfSU5U
X1NISUZUCQkzCj4gLSNkZWZpbmUgSU9NTVVfQ09OVFJPTF9DT01QX1dBSVRfSU5UX01BU0sJCTB4
MDAwMDAwMTAKPiAtI2RlZmluZSBJT01NVV9DT05UUk9MX0NPTVBfV0FJVF9JTlRfU0hJRlQJCTQK
PiAtI2RlZmluZSBJT01NVV9DT05UUk9MX0lOVkFMSURBVElPTl9USU1FT1VUX01BU0sJCTB4MDAw
MDAwRTAKPiAtI2RlZmluZSBJT01NVV9DT05UUk9MX0lOVkFMSURBVElPTl9USU1FT1VUX1NISUZU
CTUKPiAtI2RlZmluZSBJT01NVV9DT05UUk9MX1BBU1NfUE9TVEVEX1dSSVRFX01BU0sJCTB4MDAw
MDAxMDAKPiAtI2RlZmluZSBJT01NVV9DT05UUk9MX1BBU1NfUE9TVEVEX1dSSVRFX1NISUZUCQk4
Cj4gLSNkZWZpbmUgSU9NTVVfQ09OVFJPTF9SRVNQX1BBU1NfUE9TVEVEX1dSSVRFX01BU0sJMHgw
MDAwMDIwMAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfUkVTUF9QQVNTX1BPU1RFRF9XUklURV9T
SElGVAk5Cj4gLSNkZWZpbmUgSU9NTVVfQ09OVFJPTF9DT0hFUkVOVF9NQVNLCQkJMHgwMDAwMDQw
MAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfQ09IRVJFTlRfU0hJRlQJCQkxMAo+IC0jZGVmaW5l
IElPTU1VX0NPTlRST0xfSVNPQ0hST05PVVNfTUFTSwkJCTB4MDAwMDA4MDAKPiAtI2RlZmluZSBJ
T01NVV9DT05UUk9MX0lTT0NIUk9OT1VTX1NISUZUCQkJMTEKPiAtI2RlZmluZSBJT01NVV9DT05U
Uk9MX0NPTU1BTkRfQlVGRkVSX0VOQUJMRV9NQVNLCTB4MDAwMDEwMDAKPiAtI2RlZmluZSBJT01N
VV9DT05UUk9MX0NPTU1BTkRfQlVGRkVSX0VOQUJMRV9TSElGVAkxMgo+IC0jZGVmaW5lIElPTU1V
X0NPTlRST0xfUFBSX0xPR19FTkFCTEVfTUFTSwkJMHgwMDAwMjAwMAo+IC0jZGVmaW5lIElPTU1V
X0NPTlRST0xfUFBSX0xPR19FTkFCTEVfU0hJRlQJCTEzCj4gLSNkZWZpbmUgSU9NTVVfQ09OVFJP
TF9QUFJfTE9HX0lOVF9NQVNLCQkJMHgwMDAwNDAwMAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xf
UFBSX0xPR19JTlRfU0hJRlQJCQkxNAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfUFBSX0VOQUJM
RV9NQVNLCQkJMHgwMDAwODAwMAo+IC0jZGVmaW5lIElPTU1VX0NPTlRST0xfUFBSX0VOQUJMRV9T
SElGVAkJCTE1Cj4gLSNkZWZpbmUgSU9NTVVfQ09OVFJPTF9HVF9FTkFCTEVfTUFTSwkJCTB4MDAw
MTAwMDAKPiAtI2RlZmluZSBJT01NVV9DT05UUk9MX0dUX0VOQUJMRV9TSElGVAkJCTE2Cj4gLSNk
ZWZpbmUgSU9NTVVfQ09OVFJPTF9SRVNUQVJUX01BU0sJCQkweDgwMDAwMDAwCj4gLSNkZWZpbmUg
SU9NTVVfQ09OVFJPTF9SRVNUQVJUX1NISUZUCQkJMzEKPiArCj4gK3VuaW9uIGFtZF9pb21tdV9j
b250cm9sIHsKPiArICAgIHVpbnQ2NF90IHJhdzsKPiArICAgIHN0cnVjdCB7Cj4gKyAgICAgICAg
Ym9vbCBpb21tdV9lbjoxOwo+ICsgICAgICAgIGJvb2wgaHRfdHVuX2VuOjE7Cj4gKyAgICAgICAg
Ym9vbCBldmVudF9sb2dfZW46MTsKPiArICAgICAgICBib29sIGV2ZW50X2ludF9lbjoxOwo+ICsg
ICAgICAgIGJvb2wgY29tX3dhaXRfaW50X2VuOjE7Cj4gKyAgICAgICAgdW5zaWduZWQgaW50IGlu
dl90aW1lb3V0OjM7Cj4gKyAgICAgICAgYm9vbCBwYXNzX3B3OjE7Cj4gKyAgICAgICAgYm9vbCBy
ZXNfcGFzc19wdzoxOwo+ICsgICAgICAgIGJvb2wgY29oZXJlbnQ6MTsKPiArICAgICAgICBib29s
IGlzb2M6MTsKPiArICAgICAgICBib29sIGNtZF9idWZfZW46MTsKPiArICAgICAgICBib29sIHBw
cl9sb2dfZW46MTsKPiArICAgICAgICBib29sIHBwcl9pbnRfZW46MTsKPiArICAgICAgICBib29s
IHBwcl9lbjoxOwo+ICsgICAgICAgIGJvb2wgZ3RfZW46MTsKPiArICAgICAgICBib29sIGdhX2Vu
OjE7Cj4gKyAgICAgICAgdW5zaWduZWQgaW50IGNydzo0Owo+ICsgICAgICAgIGJvb2wgc21pZl9l
bjoxOwo+ICsgICAgICAgIGJvb2wgc2xmX3diX2RpczoxOwo+ICsgICAgICAgIGJvb2wgc21pZl9s
b2dfZW46MTsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgZ2FtX2VuOjM7Cj4gKyAgICAgICAgYm9v
bCBnYV9sb2dfZW46MTsKPiArICAgICAgICBib29sIGdhX2ludF9lbjoxOwo+ICsgICAgICAgIHVu
c2lnbmVkIGludCBkdWFsX3Bwcl9sb2dfZW46MjsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgZHVh
bF9ldmVudF9sb2dfZW46MjsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgZGV2X3RibF9zZWdfZW46
MzsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgcHJpdl9hYnJ0X2VuOjI7Cj4gKyAgICAgICAgYm9v
bCBwcHJfYXV0b19yc3BfZW46MTsKPiArICAgICAgICBib29sIG1hcmNfZW46MTsKPiArICAgICAg
ICBib29sIGJsa19zdG9wX21ya19lbjoxOwo+ICsgICAgICAgIGJvb2wgcHByX2F1dG9fcnNwX2Fv
bjoxOwo+ICsgICAgICAgIGJvb2wgZG9tYWluX2lkX3BuZToxOwo+ICsgICAgICAgIHVuc2lnbmVk
IGludCA6MTsKPiArICAgICAgICBib29sIGVwaF9lbjoxOwo+ICsgICAgICAgIHVuc2lnbmVkIGlu
dCBoYWRfdXBkYXRlOjI7Cj4gKyAgICAgICAgYm9vbCBnZF91cGRhdGVfZGlzOjE7Cj4gKyAgICAg
ICAgdW5zaWduZWQgaW50IDoxOwo+ICsgICAgICAgIGJvb2wgeHRfZW46MTsKPiArICAgICAgICBi
b29sIGludF9jYXBfeHRfZW46MTsKPiArICAgICAgICBib29sIHZjbWRfZW46MTsKPiArICAgICAg
ICBib29sIHZpb21tdV9lbjoxOwo+ICsgICAgICAgIGJvb2wgZ2FfdXBkYXRlX2RpczoxOwo+ICsg
ICAgICAgIGJvb2wgZ2FwcGlfZW46MTsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgOjg7Cj4gKyAg
ICB9Owo+ICt9Owo+ICAgCj4gICAvKiBFeGNsdXNpb24gUmVnaXN0ZXIgKi8KPiAgICNkZWZpbmUg
SU9NTVVfRVhDTFVTSU9OX0JBU0VfTE9XX09GRlNFVAkJMHgyMAo+IAoKLS0gCkJyaWFuIFdvb2Rz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
