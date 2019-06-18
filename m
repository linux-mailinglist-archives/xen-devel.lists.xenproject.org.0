Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B32D4A83D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 19:25:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdHor-00026E-P1; Tue, 18 Jun 2019 17:22:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hUbn=UR=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hdHoq-000269-1W
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 17:22:52 +0000
X-Inumbo-ID: b2e6fed6-91ed-11e9-8980-bc764e045a96
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe44::628])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b2e6fed6-91ed-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPdVyMbzF6DXXNRgfrAxA80qg3wB0mc1t/gRTtPRZkM=;
 b=dmSeSN0jNaapfozbSn4YGjlg2wR0SmkvEmPXTR2PgG3TFdeMrO5IHCYLTHhyyt36GYoul8xncr9bJ2VOYXCZnqBoqyiamWvbkrneQ6Ma0ZN7o4KQLUHaRwo6ZoAgePuVAk7pzHqy4oy0rCmsShfmbkQggZtDcj5BC4mxyWzuoWE=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3337.namprd12.prod.outlook.com (20.178.31.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Tue, 18 Jun 2019 17:22:49 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 17:22:49 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH 3/5] x86/AMD: make C-state handling independent of Dom0
Thread-Index: AQHVEWGY1Hj53pTSVUKs8yFFp/PPUKaVMFSAgAFTMICAC06cAA==
Date: Tue, 18 Jun 2019 17:22:48 +0000
Message-ID: <20190618172245.GA16087@amd.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
 <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
In-Reply-To: <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR0401CA0041.namprd04.prod.outlook.com
 (2603:10b6:4:73::18) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a95791d7-7054-4f65-9a66-08d6f41195eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3337; 
x-ms-traffictypediagnostic: DM6PR12MB3337:
x-microsoft-antispam-prvs: <DM6PR12MB3337DE3FC38E3F83D4BE2C4AE5EA0@DM6PR12MB3337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(396003)(39860400002)(136003)(376002)(199004)(189003)(186003)(386003)(81166006)(6116002)(7736002)(76176011)(316002)(3846002)(81156014)(33656002)(256004)(99286004)(14444005)(71190400001)(8676002)(71200400001)(54906003)(229853002)(6436002)(8936002)(2906002)(73956011)(25786009)(305945005)(6916009)(66556008)(1076003)(6486002)(5660300002)(66066001)(478600001)(446003)(6512007)(52116002)(6246003)(66946007)(4326008)(66476007)(14454004)(68736007)(66446008)(64756008)(11346002)(86362001)(102836004)(53546011)(72206003)(53936002)(6506007)(36756003)(476003)(26005)(2616005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3337;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PAhyIwF25w09wRtDlfaIj/5WvJrqYMA7kCkzcpnIkkGEdolfJiN3En5yF/oDm4+vPceTVeX1z+OrmBzMHe0BVbH1UjDtJdqYknTDFmJC/CYtwNarfzRxMAASMDTNVKSuGkeO7NiZZCagjxS2hH1U2fSR4RKKeDn8ka1DIgP5QAHhucxQPQPmKyTf6WdAktFjKJXWsr9/8WD8cEpsNqraAVSeZc9zpdBDyvn0PnfsSbLBL3JCcnmKhWc6DLIRfwf67r8jG9WB+6o7zEH3jQ2jX/SfG51f6MKpGQTYTIGnX4gFXdZA6u1wDfZfRoL/8JcAYHtC8RlaRku3mPuJcJitPYjK3IkFo5pQTo+aJK8LZXTlDDvPaXB7zsLHw48vIlJdGs9WfXgVphnXDmfpNE5D5rac1vJbr7hfk5G2Je3bFtg=
Content-ID: <8D8472C489796F48AF7D570908F5F80E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95791d7-7054-4f65-9a66-08d6f41195eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 17:22:48.9409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3337
Subject: Re: [Xen-devel] [PATCH 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDY6NDI6MzNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA2LjE5IGF0IDE4OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAyMy8wNS8yMDE5IDEzOjE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
PiBBdCBsZWFzdCBmb3IgbW9yZSByZWNlbnQgQ1BVcywgZm9sbG93aW5nIHdoYXQgQktERyAvIFBQ
UiBzdWdnZXN0IGZvciB0aGUKPiA+PiBCSU9TIHRvIHN1cmZhY2UgdmlhIEFDUEkgd2UgY2FuIG1h
a2Ugb3Vyc2VsdmVzIGluZGVwZW5kZW50IG9mIERvbTAKPiA+PiB1cGxvYWRpbmcgcmVzcGVjdGl2
ZSBkYXRhLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+ID4+IC0tLQo+ID4+IFRCRDogQ2FuIHdlIHNldCBsb2NhbF9hcGljX3RpbWVyX2My
X29rIHRvIHRydWU/IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIGFueQo+ID4+ICAgICAgc3RhdGVtZW50
IGluIHRoZSBCS0RHIC8gUFBSIGFzIHRvIHdoZXRoZXIgdGhlIExBUElDIHRpbWVyIGNvbnRpbnVl
cwo+ID4+ICAgICAgcnVubmluZyBpbiBDQzYuCj4gPiAKPiA+IFRoaXMgb3VnaHQgdG8gYmUgZWFz
eSB0byBkZXRlcm1pbmUuICBHaXZlbiB0aGUgZGVzY3JpcHRpb24gb2YgQ0M2Cj4gPiBmbHVzaGlu
ZyB0aGUgY2FjaGUgYW5kIHBvd2VyIGdhdGluZyB0aGUgY29yZSwgSSdkIHNheSB0aGVyZSBpcyBh
Cj4gPiByZWFzb25hYmxlIGNoYW5jZSB0aGF0IHRoZSBMQVBJQyB0aW1lciBzdG9wcyBpbiBDQzYu
Cj4gCj4gQnV0ICJyZWFzb25hYmxlIGNoYW5jZSIgaXNuJ3QgZW5vdWdoIGZvciBteSB0YXN0ZSBo
ZXJlLiBBbmQgZnJvbQo+IHdoYXQgeW91IGRlZHVjZSwgdGhlIGFuc3dlciB0byB0aGUgcXVlc3Rp
b24gd291bGQgYmUgIm5vIiwgYW5kCj4gaGVuY2Ugc2ltcGx5IG5vIGNoYW5nZSB0byBiZSBtYWRl
IGFueXdoZXJlLiAoSSBkbyB0aGluayB0aG91Z2gKPiB0aGF0IGl0J3MgbW9yZSBjb21wbGljYXRl
ZCB0aGFuIHRoaXMsIGJlY2F1c2UgaWlyYyBtdWNoIGFsc28gZGVwZW5kcwo+IG9uIHdoYXQgdGhl
IGZpcm13YXJlIGFjdHVhbGx5IGRvZXMuKQoKVGhlIExBUElDIHRpbWVyIG5ldmVyIHN0b3BzIG9u
IHRoZSBjdXJyZW50bHkgcGxhdGZvcm1zIChOYXBsZXMgYW5kClJvbWUpLiAgVGhpcyBpcyBhIGtu
b3dsZWRnYWJsZSBIVyBlbmdpbmVlciBzby4KCj4gPj4gVEJEOiBXZSBtYXkgd2FudCB0byB2ZXJp
ZnkgdGhhdCBITFQgaW5kZWVkIGlzIGNvbmZpZ3VyZWQgdG8gZW50ZXIgQ0M2Lgo+ID4gCj4gPiBJ
IGNhbid0IGFjdHVhbGx5IHNwb3QgYW55dGhpbmcgd2hpY2ggdGFsa3MgYWJvdXQgSExUIGRpcmVj
dGx5LiAgVGhlCj4gPiBjbG9zZXN0IEkgY2FuIHBvc3QgaXMgQ0ZPSCAoY2FjaGUgZmx1c2ggb24g
aGFsdCkgd2hpY2ggaXMgYW4KPiA+IGF1dG8tdHJhbnNpdGlvbiBmcm9tIENDMSB0byBDQzYgYWZ0
ZXIgYSBzcGVjaWZpYyB0aW1lb3V0LCBidXQgdGhlCj4gPiB3b3JkaW5nIHN1Z2dlc3RzIHRoYXQg
bXdhaXQgd291bGQgYWxzbyB0YWtlIHRoaXMgcGF0aC4KPiAKPiBXZWxsLCBJIGhhZCBjb21lIGFj
cm9zcyBhIHNlY3Rpb24gZGVzY3JpYmluZyBob3cgSExUIGNhbiBiZQo+IGNvbmZpZ3VyZWQgdG8g
YmUgdGhlIHNhbWUgYWN0aW9uIGFzIHRoZSBJL08gcG9ydCByZWFkIGZyb20gb25lCj4gb2YgdGhl
IHRocmVlIHBvcnRzIGludm9sdmVkIGluIEMtc3RhdGUgbWFuYWdlbWVudAo+IChDU3RhdGVCYXNl
QWRkciswLi4uMikuIEJ1dCBJIGNhbid0IHNlZW0gdG8gZmluZCB0aGlzIGFnYWluLgo+IAo+IEFz
IHRvIE1XQUlUIGJlaGF2aW5nIHRoZSBzYW1lLCBJIGRvbid0IHRoaW5rIEkgY2FuIHNwb3QgcHJv
b2YKPiBvZiB5b3VyIGludGVycHJldGF0aW9uIG9yIHByb29mIG9mIEJyaWFuJ3MuCgpJdCdzIG5v
dCByZWFsbHkgZG9jdW1lbnRlZCBjbGVhcmx5LiAgSSBnb3QgbXkgaW5mb3JtYXRpb24gZnJvbSB0
aGUgSFcKZW5naW5lZXJzLiAgSSd2ZSBhbHJlYWR5IHBvc3RlZCB3aGF0IGluZm9ybWF0aW9uIEkg
a25vdyBzbyBJIHdvbid0CnJlcGVhdCBpdC4KCj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkv
Y3B1X2lkbGUuYwo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKPiA+PiBA
QCAtMTI4Myw2ICsxMjg4LDk4IEBAIGxvbmcgc2V0X2N4X3BtaW5mbyh1aW50MzJfdCBhY3BpX2lk
LCBzdHIKPiA+PiAgICAgIHJldHVybiAwOwo+ID4+ICB9Cj4gPj4gIAo+ID4+ICtzdGF0aWMgdm9p
ZCBhbWRfY3B1aWRsZV9pbml0KHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9wb3dlciAqcG93ZXIpCj4g
Pj4gK3sKPiA+PiArICAgIHVuc2lnbmVkIGludCBpLCBuciA9IDA7Cj4gPj4gKyAgICBjb25zdCBz
dHJ1Y3QgY3B1aW5mb194ODYgKmMgPSAmY3VycmVudF9jcHVfZGF0YTsKPiA+PiArICAgIGNvbnN0
IHVuc2lnbmVkIGludCBlY3hfcmVxID0gQ1BVSUQ1X0VDWF9FWFRFTlNJT05TX1NVUFBPUlRFRCB8
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVUlENV9FQ1hfSU5URVJS
VVBUX0JSRUFLOwo+ID4+ICsgICAgY29uc3Qgc3RydWN0IGFjcGlfcHJvY2Vzc29yX2N4ICpjeCA9
IE5VTEw7Cj4gPj4gKyAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfcHJvY2Vzc29yX2N4IGZh
bTE3W10gPSB7Cj4gPj4gKyAgICAgICAgewo+ID4+ICsgICAgICAgICAgICAudHlwZSA9IEFDUElf
U1RBVEVfQzEsCj4gPj4gKyAgICAgICAgICAgIC5lbnRyeV9tZXRob2QgPSBBQ1BJX0NTVEFURV9F
TV9GRkgsCj4gPj4gKyAgICAgICAgICAgIC5hZGRyZXNzID0gMCwKPiA+PiArICAgICAgICAgICAg
LmxhdGVuY3kgPSAxLAo+ID4+ICsgICAgICAgIH0sCj4gPj4gKyAgICAgICAgewo+ID4+ICsgICAg
ICAgICAgICAudHlwZSA9IEFDUElfU1RBVEVfQzIsCj4gPj4gKyAgICAgICAgICAgIC5lbnRyeV9t
ZXRob2QgPSBBQ1BJX0NTVEFURV9FTV9IQUxULAo+ID4+ICsgICAgICAgICAgICAubGF0ZW5jeSA9
IDQwMCwKPiA+PiArICAgICAgICB9LAo+ID4+ICsgICAgfTsKPiA+PiArCj4gPj4gKyAgICBpZiAo
IHBtX2lkbGVfc2F2ZSAmJiBwbV9pZGxlICE9IGFjcGlfcHJvY2Vzc29yX2lkbGUgKQo+ID4+ICsg
ICAgICAgIHJldHVybjsKPiA+PiArCj4gPj4gKyAgICBpZiAoIHZlbmRvcl9vdmVycmlkZSA8IDAg
KQo+ID4+ICsgICAgICAgIHJldHVybjsKPiA+PiArCj4gPj4gKyAgICBzd2l0Y2ggKCBjLT54ODYg
KQo+ID4+ICsgICAgewo+ID4+ICsgICAgY2FzZSAweDE3Ogo+ID4gCj4gPiBXaXRoIEh5Z29uIGlu
IHRoZSBtaXgsIHRoaXMgc2hvdWxkIGJlIGV4cGFuZGVkIHRvIEZhbTE4aC4KPiAKPiBCdXQgb25s
eSBvbmNlIHdlIGdldCBhIGd1YXJhbnRlZSBmcm9tIEFNRCB0aGF0IHRoZXkgd29uJ3QgdXNlCj4g
ZmFtaWx5IDE4aC4gT3RoZXJ3aXNlIHdlJ2QgaGF2ZSB0byB1c2UgdmVuZG9yIGNoZWNrcyBoZXJl
Lgo+IEFueXdheSB0aGlzIHNlcmllcyBwcmVkYXRlcyB0aGUgbWVyZ2luZyBvZiB0aGUgSHlnb24g
b25lLiBCdXQKPiB5ZXMsIEkgY2FuIGVhc2lseSBkbyB0aGlzIGZvciB2Mi4KPiAKPiBKYW4KPiAK
PiAKCi0tIApCcmlhbiBXb29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
