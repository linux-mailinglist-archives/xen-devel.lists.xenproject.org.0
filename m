Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFE5161BEF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 20:53:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3mQm-0008Ku-D9; Mon, 17 Feb 2020 19:51:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LHIC=4F=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1j3mQk-0008Kp-R9
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 19:51:46 +0000
X-Inumbo-ID: ed403be0-51be-11ea-aa99-bc764e2007e4
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.236.95]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed403be0-51be-11ea-aa99-bc764e2007e4;
 Mon, 17 Feb 2020 19:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/4v1TXXFRYHDaMqMlE6AUV7uwRfFuFHGL6Fau0I56IhW0TlWSartKRXnnrQbkuFnlxLb47r6hq33pDsuAj0UvPrc/C+/lsqr8/CVqUCzdzclJIlGU7YnKhoqpugRLX0t39Fq6XxKc8M9vNVEVpdXJrlEbVVA+Ajo9wa3xUceB4V/X5CHecbIwBcJM2kHirk4xNeo2VKbYPKyvrt6M86bpC4ApVsa3DH5SLF0Xn9d5URccg/aeqQuosJQu8XuTeGxAvmwcO5wleXoDB1vYHyKsGy9Ww3F2pejx0bybicBz8U95sLumCkZBadXiy91ZHewjHW2UyRe4ntfubdsKjTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6Xabp4FkDkl5YG04e/Em2QuDZL8jUpADoK9Q0iw4m0=;
 b=e0+m9rEj/OWyz0hStAAsqbgREYHlmCeeN5jiGvgZIZYN2/q2DZUeix1r4gCdn8JGUGfOmm1zF2a3dVRVhr1gAZBoC+VMZ8UBmHu6joKI/ccw3kkappbJm+osLRjRQIGmfPBysnTtPfbLd1mrvii69r8Wbdm3qtpsARxUoJcaPfQs1JApWY8mNRNmU2qsCCsBT4WOc0GYmnhNxK7vxa5v5qGszYSRC4lQWz+kJ5/qefUiDimEIxUJDwvSjCtoUeT9u/UYr4r7DsJNQHydxlcHhr3qy5WM/327N2tPt/kgNHsnn5AjifC3UrMH9XVLIXkMJQcxOBdroLEooKXO9JlVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6Xabp4FkDkl5YG04e/Em2QuDZL8jUpADoK9Q0iw4m0=;
 b=BTWwpxu+QQmWk/INQWT5AQ9lEPsRbAj2tKlalxtQ1QVtRetPFYykmxig/dQGBS7lFMlHNNmOc2j30gBxZZg0abP4wnyCgU2gruD/lvOtq0X8OmrmWf+0ooOeGWgLpGKScjVvLPBhzxHoxtUMmRqh/Y0R4xNkR/yHQfTsS/eIrgY=
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com (52.132.149.16) by
 MW2PR2101MB0907.namprd21.prod.outlook.com (52.132.152.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.1; Mon, 17 Feb 2020 19:51:42 +0000
Received: from MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::79be:4582:d077:d039]) by MW2PR2101MB1052.namprd21.prod.outlook.com
 ([fe80::79be:4582:d077:d039%6]) with mapi id 15.20.2729.010; Mon, 17 Feb 2020
 19:51:42 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/3] x86/hyperv: L0 assisted TLB flush
Thread-Index: AQHV5Zno5JoyTE6f5U+pDv6g/fcVFqgfycSQ
Date: Mon, 17 Feb 2020 19:51:42 +0000
Message-ID: <MW2PR2101MB10521C77BCE006C4345D1D51D7160@MW2PR2101MB1052.namprd21.prod.outlook.com>
References: <20200217135517.5826-1-liuwe@microsoft.com>
 <20200217135517.5826-4-liuwe@microsoft.com>
In-Reply-To: <20200217135517.5826-4-liuwe@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-02-17T19:51:40.4190282Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=861f5a65-5866-4192-89ea-379f506cfe2e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [173.197.107.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b16cb94c-3a75-4d65-d705-08d7b3e2cfe8
x-ms-traffictypediagnostic: MW2PR2101MB0907:|MW2PR2101MB0907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB0907BE834C4BEFFAA76E7402D7160@MW2PR2101MB0907.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(189003)(199004)(52536014)(110136005)(7696005)(86362001)(966005)(54906003)(316002)(478600001)(5660300002)(10290500003)(6506007)(186003)(55016002)(2906002)(71200400001)(81166006)(8676002)(26005)(64756008)(66556008)(66446008)(8990500004)(76116006)(8936002)(66476007)(9686003)(81156014)(66946007)(4326008)(33656002)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR2101MB0907;
 H:MW2PR2101MB1052.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /9lwfLcHz7aAlHVAGqxKV7vMTHYrmx5sDBnaTFif1lPd1rxHq4ElcrvtKfLHLNGcKI+W8DCfQpdipaJuFPgOeVR2sTRV/sxPf1PeMZtpbMtHbOJqC2VKAX0hEsYEQOG5HLQwMUwy4z6VGbQqITQbUfFT7PkehUGAYVyuaLjthnayWDVaATPNE236z6P+Ql8yi5oWh6JccdBPkazeu/T7iKK+m5bUBTXhQNrsRSc/5QbTD0nkK5p/5ZPYyYGnYoggNMxbq622JvNrbo7/WQjcA2lu2Q9Ad4B9kejOaWEg/4XbqfAnKJCReei7Ds9w2E3tnxnIpKYWj1ST0KEm9TZ3kt2FV4lWNdwgfe4snFCMYWgDYcEmwsgRkjODPgE5Je0BGSjC1BaicN084BeuQMN2Jl6gLiunEsZN2vMRRa3AKHPhWFkwIby8/AS90G8xubav4s+6mDJZxNFqFMiIBViEtAoaESoxfG+4wxz66CnnF8RIdsS4gU37Urf57DARMGjYTFCUGQbNYqEF70lfTPRI4d2UCQfSd2Haxim5dZOaZwudePD19KDv5Z9B89B+eUWV
x-ms-exchange-antispam-messagedata: iocbAUFB+nkECewwO/cgHkuUj78A/EZ76A9zJwIDLfOT20xybmfycMuezOI784mCpKnvcFGEwvRAueygZoDkJlI+BTGgu/atW5JW+SGV2sNkiJDQXglcv44aAZcSp7S6N/tVFl5A+npe+DVxsuKabQ==
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16cb94c-3a75-4d65-d705-08d7b3e2cfe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 19:51:42.6269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OW+thnKkCQr31dWzB35IZ34rl5hMqobh1Zw0oZ0SxN+//OqTpvnBqsreTJHNnie4S7iivQd2fXcWHmFMQvWWGbUYduJQCCvzF3SFVbvIpUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB0907
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86/hyperv: L0 assisted TLB flush
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
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExp
dQoKW3NuaXBdCgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3V0aWwu
YyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdXRpbC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wYWJiMzdiMDVmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdXRpbC5jCj4gQEAgLTAsMCArMSw3NCBAQAo+ICsv
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKPiAqKioqCj4gKyAqIGFyY2gveDg2L2d1ZXN0L2h5cGVydi91dGls
LmMKPiArICoKPiArICogSHlwZXItViB1dGlsaXR5IGZ1bmN0aW9ucwo+ICsgKgo+ICsgKiBUaGlz
IHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
IG1vZGlmeQo+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+ICsgKiAoYXQgeW91ciBv
cHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlz
dHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPiArICogYnV0IFdJ
VEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YK
PiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZQo+ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRh
aWxzLgo+ICsgKgo+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQo+ICsgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsg
SWYgbm90LCBzZWUgaHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8uCj4gKyAqCj4gKyAqIENv
cHlyaWdodCAoYykgMjAyMCBNaWNyb3NvZnQuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPHhlbi9j
cHUuaD4KPiArI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vZXJybm8u
aD4KPiArCj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2Lmg+Cj4gKyNpbmNsdWRlIDxhc20v
Z3Vlc3QvaHlwZXJ2LXRsZnMuaD4KPiArCj4gKyNpbmNsdWRlICJwcml2YXRlLmgiCj4gKwo+ICtp
bnQgY3B1bWFza190b192cHNldChzdHJ1Y3QgaHZfdnBzZXQgKnZwc2V0LAo+ICsgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjcHVtYXNrX3QgKm1hc2spCj4gK3sKPiArICAgIGludCBuciA9IDE7
Cj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1LCB2Y3B1X2JhbmssIHZjcHVfb2Zmc2V0Owo+ICsgICAg
dW5zaWduZWQgaW50IG1heF9iYW5rcyA9IG1zX2h5cGVydi5tYXhfdnBfaW5kZXggLyA2NDsKPiAr
Cj4gKyAgICAvKiBVcCB0byA2NCBiYW5rcyBjYW4gYmUgcmVwcmVzZW50ZWQgYnkgdmFsaWRfYmFu
a19tYXNrICovCj4gKyAgICBpZiAoIG1heF9iYW5rcyA+IDY0ICkKPiArICAgICAgICByZXR1cm4g
LUUyQklHOwo+ICsKPiArICAgIC8qIENsZWFyIGFsbCBiYW5rcyB0byBhdm9pZCBmbHVzaGluZyB1
bndhbnRlZCBDUFVzICovCj4gKyAgICBmb3IgKCB2Y3B1X2JhbmsgPSAwOyB2Y3B1X2JhbmsgPCBt
YXhfYmFua3M7IHZjcHVfYmFuaysrICkKPiArICAgICAgICB2cHNldC0+YmFua19jb250ZW50c1t2
Y3B1X2JhbmtdID0gMDsKPiArCj4gKyAgICB2cHNldC0+dmFsaWRfYmFua19tYXNrID0gMDsKPiAr
ICAgIHZwc2V0LT5mb3JtYXQgPSBIVl9HRU5FUklDX1NFVF9TUEFSU0VfNEs7Cj4gKwo+ICsgICAg
Zm9yX2VhY2hfY3B1ICggY3B1LCBtYXNrICkKPiArICAgIHsKPiArICAgICAgICB1bnNpZ25lZCBp
bnQgdmNwdSA9IGh2X3ZwX2luZGV4KGNwdSk7Cj4gKwo+ICsgICAgICAgIHZjcHVfYmFuayA9IHZj
cHUgLyA2NDsKPiArICAgICAgICB2Y3B1X29mZnNldCA9IHZjcHUgJSA2NDsKPiArCj4gKyAgICAg
ICAgX19zZXRfYml0KHZjcHVfb2Zmc2V0LCAmdnBzZXQtPmJhbmtfY29udGVudHNbdmNwdV9iYW5r
XSk7Cj4gKyAgICAgICAgX19zZXRfYml0KHZjcHVfYmFuaywgJnZwc2V0LT52YWxpZF9iYW5rX21h
c2spOwoKVGhpcyBhcHByb2FjaCB0byBzZXR0aW5nIHRoZSBiaXRzIGluIHRoZSB2YWxpZF9iYW5r
X21hc2sgY2F1c2VzIGEgYnVnLgpJZiBhbiBlbnRpcmUgNjQtYml0IHdvcmQgaW4gdGhlIGJhbmtf
Y29udGVudHMgYXJyYXkgaXMgemVybyBiZWNhdXNlIHRoZXJlCmFyZSBubyBDUFVzIGluIHRoYXQg
cmFuZ2UsIHRoZSBjb3JyZXNwb25kaW5nIGJpdCBpbiB2YWxpZF9iYW5rX21hc2sgc3RpbGwKbXVz
dCBiZSBzZXQgdG8gdGVsbCBIeXBlci1WIHRoYXQgdGhlIDY0LWJpdCB3b3JkIGlzIHByZXNlbnQg
aW4gdGhlIGFycmF5CmFuZCBzaG91bGQgYmUgcHJvY2Vzc2VkLCBldmVuIHRob3VnaCB0aGUgY29u
dGVudCBpcyB6ZXJvLiAgQSB6ZXJvIGJpdAppbiB2YWxpZF9iYW5rX21hc2sgaW5kaWNhdGVzIHRo
YXQgdGhlIGNvcnJlc3BvbmRpbmcgNjQtYml0IHdvcmQgaW4gdGhlCmFycmF5IGlzIG5vdCBwcmVz
ZW50LCBhbmQgZXZlcnkgNjQtYml0IHdvcmQgYWJvdmUgaXQgaGFzIGJlZW4gc2hpZnRlZCBkb3du
LgpUaGF0J3Mgd2h5IHRoZSBzaW1pbGFyIExpbnV4IGZ1bmN0aW9uIHNldHMgdmFsaWRfYmFua19t
YXNrIHRoZSB3YXkgdGhhdAppdCBkb2VzLgoKTWljaGFlbAoKPiArCj4gKyAgICAgICAgaWYgKCB2
Y3B1X2JhbmsgPj0gbnIgKQo+ICsgICAgICAgICAgICBuciA9IHZjcHVfYmFuayArIDE7Cj4gKyAg
ICB9Cj4gKwo+ICsgICAgcmV0dXJuIG5yOwo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBMb2NhbCB2YXJp
YWJsZXM6Cj4gKyAqIG1vZGU6IEMKPiArICogYy1maWxlLXN0eWxlOiAiQlNEIgo+ICsgKiBjLWJh
c2ljLW9mZnNldDogNAo+ICsgKiB0YWItd2lkdGg6IDQKPiArICogaW5kZW50LXRhYnMtbW9kZTog
bmlsCj4gKyAqIEVuZDoKPiArICovCj4gLS0KPiAyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
