Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A7125372
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 21:27:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihfs5-0004cw-9d; Wed, 18 Dec 2019 20:24:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x42c=2I=microsoft.com=mikelley@srs-us1.protection.inumbo.net>)
 id 1ihfs3-0004cr-Ly
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 20:24:35 +0000
X-Inumbo-ID: 66eea398-21d4-11ea-90fa-12813bfff9fa
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.244.92]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66eea398-21d4-11ea-90fa-12813bfff9fa;
 Wed, 18 Dec 2019 20:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtdNqMDWh/jqew2IOQVRCqZCZGS74EcKBAU/qKDqqMjs0MRzqWd7GtFpRciG4P3ghMm6cISCcndGdy+Du5l/QAFqZAQl8wz2dMuEn70fMwWIGk0dWdBgEmUQHaMu3XfwuQTun8sWEmp4j9kcNSE1QvWSSIm/IB/I8VPSqSLX/D+yLmGykKlgPL93oIMLCHozV95y4Dpn1aeWGQ/PlAUgJN2zVa2OmdKk6xuvqezmYFEScD8PKfUpOruBq7GhDKMdMDBg9kdN0y8ijhNxWHMljX+Hk55abcGgRHznaRA90U3qaKwgKk1GSX+4GvZQ/6vz+opNBrfAxz2dJc+z3Bh7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L0x5rHJmRCQhpJ22mtUJS4KQZ3hIg24AVjYni3pPwo=;
 b=XJkE2EDt4VgQh99Dg0mekMm2aop8F1cRV65jwy+RG2XiMBB9tAI3GOQkyfruFZcKC32rBeA+46kNTsypa3EKuKqV2YTDXhMT90KLV5NBjsw5hfYSo4xlnj8ZfQUbW3BP/aOqA6JeIRe2rFkso74AnaeylR3hG3zt6b4w5W8k5CZ7/0jMZgCqI7gVI/Tgqv8A5Ud/OoXGfQ1VgF7EodsSfEW217JYVH1ierHZOUdHHfg5/enb+cJzFz+ng3R3Fn71uW4s7uPXnoC++R/MEsWLmeWDjWU8t1jg+8Jn7c1hCRpFl11DaDsJ//bsal/Yl99eYeBYzYykVKmGYMi06RLCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L0x5rHJmRCQhpJ22mtUJS4KQZ3hIg24AVjYni3pPwo=;
 b=BDizBXMEHVeczPaxlMTi89layOzYC0+jrthNt4ibFWvC0jPiy/rE63uTIgAE69cS13551kNVsMZtCitIFPI2uQf9oSCxDj+sfUAtB1vsPpa8Rd6WLmIx9m2ytnB0zvogz8w2UF8SiGyEn6T2Jksl3s1z2L25Ap4PDDl2A+33YwU=
Received: from CY4PR21MB0629.namprd21.prod.outlook.com (10.175.115.19) by
 CY4PR21MB0149.namprd21.prod.outlook.com (10.173.189.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.8; Wed, 18 Dec 2019 20:24:31 +0000
Received: from CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::b056:4c98:4be7:3504]) by CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::b056:4c98:4be7:3504%10]) with mapi id 15.20.2559.012; Wed, 18 Dec
 2019 20:24:31 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: "Durrant, Paul" <pdurrant@amazon.com>, Wei Liu <wl@xen.org>, Xen
 Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 6/6] x86: implement Hyper-V clock source
Thread-Index: AQHVtbGNqrdYXOMZNUqZZ156KbPUoqfAAwUAgABSzqA=
Date: Wed, 18 Dec 2019 20:24:31 +0000
Message-ID: <CY4PR21MB0629365FA8E64586AAD0E031D7530@CY4PR21MB0629.namprd21.prod.outlook.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-7-liuwe@microsoft.com>
 <dcd1dc1a6e99484bbabb6c994c6506ce@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <dcd1dc1a6e99484bbabb6c994c6506ce@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-18T20:24:29.6664157Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=06178f7d-d678-477a-9974-174d75fe3f3e;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
x-originating-ip: [167.220.2.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 50ab40c4-31bd-4618-17f5-08d783f84a1c
x-ms-traffictypediagnostic: CY4PR21MB0149:|CY4PR21MB0149:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR21MB0149C6C310428170D4923511D7530@CY4PR21MB0149.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(189003)(199004)(4326008)(498600001)(10290500003)(5660300002)(8676002)(26005)(8990500004)(86362001)(8936002)(7696005)(6506007)(52536014)(81166006)(186003)(81156014)(55016002)(9686003)(54906003)(66946007)(64756008)(71200400001)(76116006)(33656002)(66556008)(66446008)(4744005)(66476007)(110136005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0149;
 H:CY4PR21MB0629.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: la3nZe/svcWA/rdjq0D3j2kXLHHi2NsDnOVRdgT2jnimEy3b5N6X5OZT/1xBUeXsR7dv0uyDRbqju6d05XGjIa+vdGQy3bkvUBNiOS1FjL6bBa2pDOU0vvpuG6BBevdXlT9i/HVNUMNq74qD0ruEAcEpditnXKzgB2upZ/jZcfaTAp1c3DHcu1d4QBdAxPa/oTQ1Fa0mrMZpIX/WpC+w7ca6yGWcnvpHjSOyguHVKM8+B4cGXDaQKa46vU8Cn/4Co95HWNrCtACf/s3JcehaDbwaukNoVZ06ejULfX5iIevrQIcuGFTgFoV0xrF0pb/q6pWTZv+n2JB/1yBQ9iiP+weJD8lduvLZ8YP5oSDKl+Ykivb030XQfQp5qi2lmdp8RF1mZSUNhEeRtlwOBRtHDrlBAU1sMl8Ar2EeGWnUWA8G6UNy/ktQbvjZnhjWVq5b
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ab40c4-31bd-4618-17f5-08d783f84a1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 20:24:31.3498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U4L5L6Uqb43MyEQge8NlQ+D6VqEYrRVLM9WshlxYev2SIXMDwG0qWa5DBvtVhp0Y30xXwdxHp4Bxw1D1pDxpqIOsOX7fCMRcPIfHuFYz+IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0149
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86: implement Hyper-V clock source
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4gU2VudDogV2VkbmVzZGF5
LCBEZWNlbWJlciAxOCwgMjAxOSA3OjI0IEFNCgo+ID4gRnJvbTogV2VpIExpdSA8d2VpLmxpdS54
ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExpdQo+ID4gU2VudDogMTggRGVjZW1iZXIg
MjAxOSAxNDo0MwoKW3NuaXBdCgo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgdWludDY0X3QgcmVh
ZF9oeXBlcnZfdGltZXIodm9pZCkKPiA+ICt7Cj4gPiArICAgIHVpbnQ2NF90IHNjYWxlLCBvZmZz
ZXQsIHJldCwgdHNjOwo+ID4gKyAgICB1aW50MzJfdCBzZXE7Cj4gPiArICAgIGNvbnN0IHN0cnVj
dCBtc19oeXBlcnZfdHNjX3BhZ2UgKnRzY19wYWdlID0gaHlwZXJ2X3RzYzsKPiA+ICsKPiA+ICsg
ICAgZG8gewo+ID4gKyAgICAgICAgc2VxID0gdHNjX3BhZ2UtPnRzY19zZXF1ZW5jZTsKPiA+ICsK
PiA+ICsgICAgICAgIC8qIFNlcSAwIGlzIHNwZWNpYWwuIEl0IG1lYW5zIHRoZSBUU0MgZW5saWdo
dGVubWVudCBpcyBub3QKPiA+ICsgICAgICAgICAqIGF2YWlsYWJsZSBhdCB0aGUgbW9tZW50LiBU
aGUgcmVmZXJlbmNlIHRpbWUgY2FuIG9ubHkgYmUKPiA+ICsgICAgICAgICAqIG9idGFpbmVkIGZy
b20gdGhlIFJlZmVyZW5jZSBDb3VudGVyIE1TUi4KPiA+ICsgICAgICAgICAqLwo+ID4gKyAgICAg
ICAgaWYgKCBzZXEgPT0gMCApCj4gCj4gT2xkZXIgdmVyc2lvbnMgb2YgdGhlIHNwZWMgdXNlZCB0
byB1c2UgMHhGRkZGRkZGRiBJIHRoaW5rLCBhbHRob3VnaCB3aGVuIEkgbG9vayBhZ2FpbiB0aGV5
Cj4gc2VlbSB0byBoYXZlIGJlZW4gcmV0cm8tYWN0aXZlbHkgZml4ZWQuIEluIGFueSBjYXNlIEkg
dGhpbmsgeW91IHNob3VsZCB0cmVhdCBib3RoCj4gMHhGRkZGRkZGRiBhbmQgMCBhcyBpbnZhbGlk
LgoKRldJVywgdGhlIDB4RkZGRkZGRkYgd2FzIGp1c3QgYSBidWcgaW4gdGhlIHNwZWMuICBIeXBl
ci1WIGltcGxlbWVudGF0aW9ucyBvbmx5CnNldCB0aGUgdmFsdWUgdG8gMCB0byBpbmRpY2F0ZSBp
bnZhbGlkLiAgVGhlIGVxdWl2YWxlbnQgTGludXggY29kZSBjaGVja3Mgb25seSBmb3IgMC4KCk1p
Y2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
