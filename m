Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF36A4A414
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 16:34:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdF8O-00043Y-Aq; Tue, 18 Jun 2019 14:30:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kstG=UR=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdF8M-00042m-5d
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 14:30:50 +0000
X-Inumbo-ID: a9853f04-91d5-11e9-8980-bc764e045a96
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::600])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a9853f04-91d5-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 14:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaRCBYSV9OTckG+s0C1cheyIzEWSL/wHfjtQqmijAho=;
 b=eZ0lIz8Orqr2skl2XUXaQeG0lU5VRSJ7ctB7a/oRaFvx/Bhbflk+nt7LgaQC8P8CY3EGVpkI95xQxuNRiL5IURM39lG4egdzvXHO2csmhH/l+DfixfmlUEbO0R2xbHWr8nEHYbPLCJx1o/Fk2XgWTnFsp3GuoEl5b9LrX8UcRGL+cZwYZYejBotKu8yHfOAQOiudCgSM9S9dq58AkHIxx8cMjoa81pTbgBRI07ojK8bT+Z8K4umdKPx5ezwzu2fPh5nOKgoyr8Ecx4uJcqD0ILJhWisca2iG+JOCaNwSOgNwwgmmKjKI9EuVPdXvHIIzRwWSkRA4rCymcBJ3bbm5pQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB3636.eurprd03.prod.outlook.com (52.134.81.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 14:30:45 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Tue, 18 Jun 2019
 14:30:45 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
Thread-Index: AQHVIIYF6TDvIT4pIEiasF2jZbMN/KadGvGAgAQzegCAABkhAIAAHDoA
Date: Tue, 18 Jun 2019 14:30:45 +0000
Message-ID: <87tvcn6k4r.fsf@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-10-volodymyr_babchuk@epam.com>
 <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com> <87v9x36sz1.fsf@epam.com>
 <ead7d399-92a2-9d7f-91e4-2d6cf4c9961b@arm.com>
In-Reply-To: <ead7d399-92a2-9d7f-91e4-2d6cf4c9961b@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb77d7ff-e10d-43fa-fa9a-08d6f3f98ceb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3636; 
x-ms-traffictypediagnostic: AM0PR03MB3636:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB36360746D54E5297E320F4FAE6EA0@AM0PR03MB3636.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(376002)(396003)(346002)(189003)(199004)(54906003)(76116006)(55236004)(25786009)(305945005)(486006)(71200400001)(76176011)(6486002)(5660300002)(7736002)(6512007)(66066001)(316002)(4326008)(8676002)(81166006)(81156014)(71190400001)(256004)(14444005)(80792005)(478600001)(6916009)(36756003)(2906002)(99286004)(8936002)(186003)(2616005)(6246003)(476003)(14454004)(6116002)(446003)(6306002)(11346002)(86362001)(229853002)(6436002)(966005)(3846002)(53936002)(66946007)(26005)(6506007)(102836004)(53546011)(68736007)(66556008)(64756008)(66446008)(91956017)(73956011)(66476007)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3636;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5PDNXas3gkGxBw29hfvjlwxKd+WgKIahL3/QLsSd85lwGTAq1xkDDIlaciY3/Q7dLkUm4FpdrQvwF7q+vBf1Uj/1iPT3xsEscxv6KlyL8/ay/9uV2eBPdu7adLONCAH0oi6po+X1bqHO6o+gITICkRcgfXzQ/v9RMvQMjj0ssBOk7U0hI7UwnNFzu1I7Et3Rv5dtYwVPr6O2Hhi6xMhX36wCP7CpeUL6CWtLTY41BeX3ObR/S47fIgXNq45RvWUaCUsLD/w8FF/t2pDlYi+Xr75DLRsFiN0HiRavD+I6RlC2XfZt26xSZnaK+7bvRpdKRrcftEufyFMLwvGmqOHDvPj/zPdgpHS8/IIGcLUx4fmb8eq+tRIDwDnWAD8HjWrWpgA+Ds7rrLWwAzULYc/mcNyLya0UpdOzCOfrUSxft7c=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb77d7ff-e10d-43fa-fa9a-08d6f3f98ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 14:30:45.5116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3636
Subject: Re: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpKdWxpZW4gR3JhbGwgd3JpdGVzOgoKPiBPbiAxOC8wNi8yMDE5IDEyOjE5LCBWb2xvZHlteXIg
QmFiY2h1ayB3cm90ZToKPj4KPj4gSGkgSnVsaWVuLAo+Cj4gSGksCj4KPj4KPj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPj4+PiArCj4+Pj4gKz1pdGVtIEI8b3B0ZWU+Cj4+Pj4gKwo+Pj4+ICtBbGxv
dyBhIGd1ZXN0IHRvIHVzZSBPUC1URUUuIE5vdGUgdGhhdCBhIHZpcnR1YWxpemF0aW9uLWF3YXJl
IE9QLVRFRQo+Pj4+ICtpcyByZXF1aXJlZCBmb3IgdGhpcy4gSWYgdGhpcyBvcHRpb24gaXMgc2Vs
ZWN0ZWQsIGd1ZXN0IHdpbGwgYmUgYWJsZQo+Pj4KPj4+IE9PSSwgd2hhdCBoYXBwZW4gaWYgT1At
VEVFIGRvZXMgbm90IHN1cHBvcnQgdmlydHVhbGl6YXRpb24uIFdpbGwgWGVuCj4+PiBmb3JiaWQg
dG8gdXNlIGl0Pwo+PiBZZXMsIFhlbiB3aWxsIGdldCBhbiBlcnJvciBmcm9tIE9QLVRFRSBkdXJp
bmcgZG9tYWluIGNvbnN0cnVjdGlvbi4gVGhpcwo+PiB3aWxsIGxlYWQgdG8gZG9tYWluIGNyZWF0
aW9uIGZhaWx1cmUuCj4KPiBUaGlzIGlzIGEgYml0IG9kZC4gSXQgbWVhbnMgd2UgaGF2ZSBubyB3
YXkgdG8ga25vdyBpbiBhZHZhbmNlIHdoZXRoZXIKPiBPUC1URUUgd2lsbCBiZSBhYmxlIHRvIGNy
ZWF0ZSBhIGNsaWVudC4KWWVzLiBUaGVyZSBjYW4gYmUgYXQgbGVhc3QgdHdvIHJlYXNvbnMgZm9y
IHRoaXM6CjEuIE9QLVRFRSBpcyBidWlsdCB3aXRob3V0IHZpcnR1YWxpemF0aW9uIHN1cHBvcnQg
YXQgYWxsCjIuIE9QLVRFRSBoYXZlIG5vIHJlc291cmNlcyBmb3IgYSBuZXcgZ3Vlc3QKCj4gSW4g
b3RoZXIgd29yZCwgd2hlbiB0aGUKPiBtZWRpYXRvciBpcyBidWlsdCBpbiBYZW4sIGFsbCBleGlz
dGluZyBzZXR1cCB3aXRoIE9QLVRFRSAoYW5kCj4gbm8tdmlydHVhbGl6YXRpb24pIHdpbGwgZmFp
bC4KUmlnaHQuIElmIHVzZXIgcHJvdmlkZXMgRFRCIHdpdGggJ29wdGVlJyBub2RlLCBidXQgT1At
VEVFIGlzIGJ1aWxkIHdpdGhvdXQKdmlydHVhbGl6YXRpb24gc3VwcG9ydCwgRG9tMCB3aWxsIG5v
dCBiZSBjcmVhdGVkLiBUaGlzIGNhbiBiZSBmaXhlZCBieQphZGRpbmcgbmV3IGNhcGFiaWxpdHkg
ZmxhZyBpbnRvIE9QLVRFRSwgdGhhdCB0ZWxscyBYZW4gYWJvdXQKdmlydHVhbGl6YXRpb24gc3Vw
cG9ydC4gRm9yIHNvbWUgcmVhc29uIEkgbWlzc2VkIHRoaXMgd2hlbiBJIGltcGxlbWVudGVkClZN
IHN1cHBvcnQgaW4gT1AtVEVFIDooCgo+IE15IGV4cGVjdGF0aW9uIGlzIFhlbiBzaG91bGQgYmUg
YWJsZSB0byBrbm93IHdoZXRoZXIgdGhlIG1lZGlhdG9yIGNhbiBiZSB1c2VkLgpJIG5lZWQgdG8g
aW1wbGVtZW50IGFkZGl0aW9uYWwgY2FwYWJpbGl0eSBmbGFnIGluIHRoZSBPUC1URUUuIFRoaXMg
aXMKbm90IHNvIGhhcmQsIGJ1dCBpdCB3aWxsIGJlIGF2YWlsYWJsZSBvbmx5IGluIHRoZSBuZXh0
IHJlbGVhc2UuIEZvciBub3csCndlIGNhbiBkb2N1bWVudCB0aGlzIGxpbWl0YXRpb24gc29tZXdo
ZXJlLgoKPj4KPj4+PiArdG8gYWNjZXNzIHRvIHRoZSByZWFsIE9QLVRFRSBPUyBydW5uaW5nIG9u
IHRoZSBob3N0LiBHdWVzdCBjcmVhdGlvbgo+Pj4KPj4+IHMvcmVhbC8vIGl0IGlzIHJlZHVuZGFu
dCB3aXRoIHRoZSByZXN0IG9mIHRoZSBzZW50ZW5jZS4gSG93ZXZlciwgaXQKPj4+IGRvZXMgbm90
IHJlYWxseSBhbnN3ZXIgdG8gdGhlIHF1ZXN0aW9uIHJlZ2FyZGluZyBpc29sYXRpb24uCj4+IFlv
dXIgYXNzdW1wdGlvbiBpcyBjb3JyZWN0IC0gT1AtVEVFIHByb3ZpZGVzIGlzb2xhdGlvbiBvbiBp
dHMgc2lkZS4KPj4KPj4+Cj4+Pj4gK3dpbGwgZmFpbCBpZiBPUC1URUUgaGF2ZSBubyByZXNvdXJj
ZXMgZm9yIGEgbmV3IGd1ZXN0LiBOdW1iZXIgb2Ygc3VwcG9ydGVkCj4+Pj4gK2d1ZXN0cyBkZXBl
bmRzIG9uIE9QLVRFRSBjb25maWd1cmF0aW9uLgo+Pj4KPj4+IEhvdyBhYm91dCB0aGUgZm9sbG93
aW5nIGRlc2NyaXB0aW9uIChjb3JyZWN0IG1lIGlmIG15IHVuZGVyc3RhbmRpbmcgaXMKPj4+IHdy
b25nKToKPj4+Cj4+PiAiQWxsb3cgYSBndWVzdCB0byBhY2Nlc3MgdGhlIGhvc3QgT1AtVEVFIE9T
LiBYZW4gd2lsbCBtZWRpYXRlIHRoZQo+Pj4gYWNjZXNzIHRvIE9QLVRFRSBhbmQgdGhlIHJlc291
cmNlIGlzb2xhdGlvbiB3aWxsIGJlIHByb3ZpZGVkIGRpcmVjdGx5Cj4+PiBieSBPUC1URUUuIE9Q
LVRFRSBpdHNlbGYgbWF5IGxpbWl0IHRoZSBudW1iZXIgb2YgZ3Vlc3RzIHRoYXQgY2FuCj4+PiBj
b25jdXJyZW50bHkgdXNlIGl0LiBUaGlzIHJlcXVpcmVzIGEgdmlydHVhbGl6YXRpb24tYXdhcmUg
T1AtVEVFIGZvcgo+Pj4gdGhpcyB0byB3b3JrLgo+Pj4KPj4+IFRoaXMgZmVhdHVyZSBpcyBhIEI8
dGVjaG5vbG9neSBwcmV2aWV3Pi4iCj4+IFRoYXQncyBtdWNoIGJldHRlciB0aGFuIG15IHZlcnNp
b24uIFRoYW5rIHlvdS4KPj4KPj4+IEhvdyBjYW4gYSB1c2VyIGtub3cgd2hldGhlciBPUC1URUUg
c3VwcG9ydHMgdmlydHVhbGl6YXRpb24/IElzIGl0Cj4+PiBjb25maWd1cmFibGUgYXQgYnVpbGQ/
Cj4+IFllcywgdGhlcmUgaXMgYSBzcGVjaWFsIGNvbmZpZ3VyYXRpb24gb3B0aW9uIENGR19WSVJU
VUFMSVpBVElPTi4gVGhpcyBpcwo+PiBjb3ZlcmVkIGluIE9QLVRFRSBkb2N1bWVudGF0aW9uIGF0
IFsxXQo+Pgo+PiBbMV0gaHR0cHM6Ly9vcHRlZS5yZWFkdGhlZG9jcy5pby9hcmNoaXRlY3R1cmUv
dmlydHVhbGl6YXRpb24uaHRtbAo+Cj4gRG8gd2UgZXhwZWN0IHRoZSBsaW5rIHRvIGJlIHN0YWJs
ZT8gSWYgc28sIHRoZW4gSSB0aGluayBhIGxpbmsgaW4gdGhlCj4gZG9jdW1lbnRhdGlvbiB3b3Vs
ZCBiZSB1c2VmdWwuClRoaXMgaXMgdGhlIG9mZmljaWFsIE9QLVRFRSBkb2N1bWVudGF0aW9uLiBT
bywgeWVzLCBpdCBzaG91bGQgYmUgc3RhYmxlLgpJIGNhbiBwdXQgdGhpcyBsaW5rIGludG8gdGhl
IGNvZGUgc29tZXdoZXJlLgoKCi0tIApCZXN0IHJlZ2FyZHMsIFZvbG9keW15ciBCYWJjaHVrCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
