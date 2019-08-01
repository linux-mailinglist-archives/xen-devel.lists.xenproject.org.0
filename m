Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5647DE45
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 16:53:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htCPN-0007V4-Q8; Thu, 01 Aug 2019 14:50:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LBr6=V5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1htCPL-0007Uz-MF
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 14:50:20 +0000
X-Inumbo-ID: acdc8fbc-b46b-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::604])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id acdc8fbc-b46b-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 14:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0H2npdqKO/2Cpfu3fdB+YffVdc/J8bRv70bkfyFA9j8actp0zkyD4Svoqo4Fi+Lu/Ygu9MNN18fAu44NZgqDTK+pkHdYEomOuUDWzNjkYDgHeESE97br18D74z209z4WBefNIRjpjkHW1QeiWcLeqRB4CL0Cdryswcnn0GXkyp09Q1I3UvImYmjA4zRtoRyBl5Nlid1OA0zOIZPj5TXK/nd+sf+HRHhECybeQs3vGS5kZWCjSOq1lHe/V0mff0Ks76UgJgqDqAefpXBNrL4dhIuWTJkjiVJlCsmQeesCy/ueO7ZJwxRUr+93E1fMn3kz3f8G87ofs2yCHqlN6fybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8LAKtlZLS0Y+jcs8WVeoovGPIQLh3+u7B1ANKa1HCk=;
 b=iyhtypJRWnEc3GofNXMY32DMiNEFBbZCRus7Tx15FnIzGfLx0hyHW4mlu3EsiK4DSLxzzcFEmkeXIJSWp1Kl7+he8ZR/oFtsMVzZGBR008Il3VmWUYiFfAJXktSIwQg/7nJcPjVJPbkm3x4p8xItxACKxxLjx+3GywnY/hMN0Di4gkDPgd4Fpr+dpXemHn9MzfWsDfcE4u7y783NPpsaLtBrdttj286nr0jPxS0D6WSapx5BJYRlSw6/5AhIaKbX3dMlExyY0y7ioMlatSibJlb6AHtSTB/kq6z5R8vwTd0NNO5TTXNLzPnDp/oOfzQ9ejk9w29nmOZ7wFL7fkExQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8LAKtlZLS0Y+jcs8WVeoovGPIQLh3+u7B1ANKa1HCk=;
 b=FS/LnWTTwEEeelVcGRRINm4vV5i+/hXCtB9nIGN1kh4WzkJ426nWH8/S7pf7i0fmgWgSnokrdc5rzyUI/CO2+Po5a8VnEFVHS73jvMLKdqOPlm/+NZZ/fGb4ptnLoztSXVwKtxctEbYflv+lVcYRkddY/rkic9DqTiVZR1V3RmHov1v8RqcuxyqPP1iIxQoAXzchaFGNMJ7tC7ncowDvGvri6typb0DT/EOYdACmOsjXoV4imDIQFMJLI6S0TURyHvJqaCLBm4RT6IGZ+PnEEiX0xUizzfhjENPztdLNnLTZ3HI1IiBpDY1pBIk4DW2XjIrq/6e/kj+P7ujzer5bZQ==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4178.eurprd03.prod.outlook.com (20.177.40.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 14:50:15 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 14:50:15 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 2/2] xen/arm: consolidate make_timer_node and
 make_timer_domU_node
Thread-Index: AQHVSGFtHm/XQtiLI0+V1CdTguQh+6bmTxUAgAACPoCAAAKyAIAABGwAgAAHpgA=
Date: Thu, 1 Aug 2019 14:50:15 +0000
Message-ID: <87wofxgct5.fsf@epam.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com> <87y30dget5.fsf@epam.com>
 <e022de0d-2515-007f-0a66-2f7a94c68777@arm.com>
In-Reply-To: <e022de0d-2515-007f-0a66-2f7a94c68777@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8752b5e-443a-4a70-b376-08d7168f9057
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4178; 
x-ms-traffictypediagnostic: AM0PR03MB4178:|AM0PR03MB4178:
x-microsoft-antispam-prvs: <AM0PR03MB41784534B83890F54CA25F53E6DE0@AM0PR03MB4178.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(189003)(199004)(8676002)(486006)(2616005)(476003)(478600001)(102836004)(11346002)(55236004)(53546011)(68736007)(66446008)(64756008)(66556008)(76116006)(3846002)(36756003)(186003)(76176011)(6506007)(6512007)(6436002)(446003)(6116002)(6486002)(14454004)(91956017)(229853002)(26005)(80792005)(5660300002)(54906003)(6246003)(66946007)(305945005)(66476007)(8936002)(81166006)(7736002)(2906002)(86362001)(6916009)(81156014)(53936002)(71200400001)(256004)(4326008)(66066001)(99286004)(316002)(71190400001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4178;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D6ee23+bWqRV4Zq0RDCgF9xGthpNV/FbPUcn4YvXTyNxx+0XuCwUxtWh1mfyAcIu6pLjQ9Dc+L4xugNRjrZaFbYzN0TPq6ZKH+awY/OSGQdiETgpSPghO+Y90exfBTdcCiccvlbOYXMN4iwuHzN7NX4F4jlZfFu8YDINFD3g2k4MJyvsYvc2BAve9tL4lXcZk8WSry7SBtak+3KiQiqshmrfZxQ4vx4GO5ArS5tfiS9t6Yzvs5M71N14W6ToWOBqQyrBagCDiQ+3nYf7TOKPLzGcIu4y0szquzc6vGL5+eVWEmA+5d2T5q830Fl8mv96LnyZLFHiP/4Gonvgs3aGI9yJqhI6Dis2khNmM7IuxXE/FKJcDJupFAabFDJZ6nB+2CbCMRqvkk0uqy6DN4gFNFiO+GT4mGcFHWrKVo8m/og=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8752b5e-443a-4a70-b376-08d7168f9057
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 14:50:15.2966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4178
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9uIDAxLzA4LzIwMTkg
MTU6MDcsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pgo+PiBIaSBKdWxpZW4sCj4+Cj4+IEp1
bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBIaSwKPj4+Cj4+PiBPbiAwMS8wOC8yMDE5IDE0OjQ5
LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pgo+Pj4+IFZpa3RvciBNaXRpbiB3cml0ZXM6
Cj4+Pj4KPj4+Pj4gRnVuY3Rpb25zIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9kb21V
X25vZGUgYXJlIHF1aXRlIHNpbWlsYXIuCj4+Pj4+IFNvIGl0IGlzIGJldHRlciB0byBjb25zb2xp
ZGF0ZSB0aGVtIHRvIGF2b2lkIGRpc2NyZXBhbmN5Lgo+Pj4+PiBUaGUgbWFpbiBkaWZmZXJlbmNl
IGJldHdlZW4gdGhlIGZ1bmN0aW9ucyBpcyB0aGUgdGltZXIgaW50ZXJydXB0cyB1c2VkLgo+Pj4+
Pgo+Pj4+PiBLZWVwIHRoZSBkb21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRpYmxlIGFzIGl0IGlz
IHNpbXBsZXIuCj4+Pj4+IE1lYW4gZG8gbm90IGNvcHkgcGxhdGZvcm0ncyAnY29tcGF0aWJsZScg
cHJvcGVydHkgaW50byBod2RvbQo+Pj4+PiBkZXZpY2UgdHJlZSwgaW5zdGVhZCBzZXQgZWl0aGVy
IGFybSxhcm12Ny10aW1lciBvciBhcm0sYXJtdjgtdGltZXIsCj4+Pj4+IGRlcGVuZGluZyBvbiB0
aGUgcGxhdGZvcm0gdHlwZS4KPj4+PiBJdCBpcyBoYXJkIHRvIHBhcnNlIHRoZSBsYXN0IHNlbnRl
bmNlLiBXaGF0IGFib3V0ICJLZWVwIHRoZSBkb21VIHZlcnNpb24KPj4+PiBmb3IgdGhlIGNvbXBh
dGlibGUgYXMgaXQgaXMgc2ltcGxlcjogZG8gbm90IGNvcHkgcGxhdGZvcm0ncwo+Pj4+ICdjb21w
YXRpYmxlJyBwcm9wZXJ0eSBpbnRvIGh3ZG9tIGRldmljZSB0cmVlLCBpbnN0ZWFkIHNldCBlaXRo
ZXIKPj4+PiBhcm0sYXJtdjctdGltZXIgb3IgYXJtLGFybXY4LXRpbWVyLCBkZXBlbmRpbmcgb24g
dGhlIHBsYXRmb3JtIHR5cGUuIiA/Cj4+Pj4KPj4+Pgo+Pj4+PiBLZWVwIHRoZSBodyB2ZXJzaW9u
IGZvciB0aGUgY2xvY2sgYXMgaXQgaXMgcmVsZXZhbnQgZm9yIHRoZSBib3RoIGNhc2VzLgo+Pj4+
Pgo+Pj4+PiBUaGUgbmV3IGZ1bmN0aW9uIGhhcyBjaGFuZ2VkIHByb3RvdHlwZSBkdWUgdG8gZmR0
X3Byb3BlcnR5X2ludGVycnVwdHMKPj4+Pj4gICAgIG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1
Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+Pj4+Pgo+Pj4+PiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBN
aXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29tPgo+Pj4+PiAtLS0KPj4+Pj4gdjQgdXBkYXRlczoK
Pj4+Pj4gICAgICB1cGRhdGVkICJLZWVwIHRoZSBkb21VIHZlcnNpb24gZm9yIHRoZSBjb21wYXRp
YmxlIGFzIGl0IGlzIHNpbXBsZXIiCj4+Pj4+Cj4+Pj4+IHY1IHVwZGF0ZXM6Cj4+Pj4+ICAgICAg
IC0gY2hhbmdlZCAna2VwdCcgdG8gJ2tlZXAnLCBldGMuCj4+Pj4+ICAgICAgIC0gcmVtb3ZlZCBl
bXB0eSBsaW5lCj4+Pj4+ICAgICAgIC0gdXBkYXRlZCBpbmRlbnRhdGlvbiBvZiBwYXJhbWV0ZXJz
IGluIGZ1bmN0aW9ucyBjYWxscwo+Pj4+PiAgICAgICAtIGZpeGVkIE5JVHMKPj4+Pj4gICAgICAg
LSB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlCj4+Pj4+IC0tLQo+Pj4+PiAgICB4ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMgfCAxMDYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA2NyBkZWxldGlvbnMo
LSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+Pj4+PiBpbmRleCBiYzdkMTdkZDJjLi41ODU0
MjEzMGNhIDEwMDY0NAo+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4+Pj4+IEBAIC05NzMsMTAgKzk3
Myw4IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJfbm9kZShjb25zdCBzdHJ1Y3Qga2Vy
bmVsX2luZm8gKmtpbmZvKQo+Pj4+PiAgICAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPj4+
Pj4gICAgICAgIH07Cj4+Pj4+ICAgICAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldjsKPj4+
Pj4gLSAgICB1MzIgbGVuOwo+Pj4+PiAtICAgIGNvbnN0IHZvaWQgKmNvbXBhdGlibGU7Cj4+Pj4+
ICAgICAgICBpbnQgcmVzOwo+Pj4+PiAtICAgIHVuc2lnbmVkIGludCBpcnE7Cj4+Pj4+ICsgICAg
dW5zaWduZWQgaW50IGlycVtNQVhfVElNRVJfUFBJXTsKPj4+PiBBcyBJIHNhaWQgaW4gdGhlIHBy
ZXZpb3VzIHZlcnNpb24sIHlvdSBhcmUgd2FzdGluZyBzdGFjayBzcGFjZQo+Pj4+IHRoZXJlLiBB
bHNvLCB0aGlzIGlzIG1pc2xlYWRpbmcuIFdoZW4gSSBzZWUgYXJyYXkgb2YgNCBpdGVtcywgSSBl
eHBlY3QKPj4+PiB0aGF0IGFsbCA0IGl0ZW1zIHdpbGwgYmUgdXNlZC4gQnV0IHlvdSBhcmUgdXNp
bmcgb25seSAzLCBzbyBpdCBsZWFkcyB0bwo+Pj4+IHR3byBjb25jbHVzaW9uczogZWl0aGVyIHlv
dSBtYWRlIGEgbWlzdGFrZSwgb3IgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQKPj4+PiBpdCBoYXBw
ZW5pbmcuIEVpdGhlciBvcHRpb24gaXMgYmFkLgo+Pj4KPj4+IDQgYnl0ZSBvbiBhIHN0YWNrIG9m
IDE2S0IuLi4gdGhhdCdzIG5vdCByZWFsbHkgYSB3YXN0ZSB3b3J0aCBhbgo+Pj4gYXJndW1lbnQu
IFRoZSBtb3JlIHRoZSBzdGFjayBpcyBwcmV0dHkgZW1wdHkgYXMgdGhpcyBpcyBib290LiBTbyB5
ZXMsCj4+PiB5b3Ugd2lsbCBub3QgdXNlIHRoZSBsYXN0IGluZGV4IGJlY2F1c2UgeW91IGRvbid0
IGV4cG9zZSBoeXBlcnZpc29yCj4+PiB0aW1lciB0byBndWVzdCB5ZXQhIChJbWFnaW5lIG5lc3Rl
ZCB2aXJ0KS4gQnV0IGF0IGxlYXN0IGl0IGF2b2lkcwo+Pj4gaGFyZGNvZGluZyBhIG51bWJlciBv
ZiBpbmRleCBhbmQgbWF0Y2ggdGhlIGVudW0uCj4+IFllcywgYnV0IHRoZW4gaXQgc2hvdWxkIGJl
IGRvY3VtZW50ZWQgYXQgbGVhc3QuIENvbW1lbnQgYWJvdmUgd2lsbCBiZQo+PiBmaW5lLgo+Cj4g
SSBkb24ndCByZWFsbHkgc2VlIHRoZSBwcm9ibGVtIHdpdGggdGhlIGN1cnJlbnQgY29kZS4uLiBU
aGlzIGlzCj4gc2ltaWxhciB0byB3aGVuIHdlIHVzZSBhIHN0cnVjdHVyZSBidXQgbm90IGFsbCB0
aGUgZmllbGQgaW4gY2VydGFpbgo+IGNpcmN1bXN0YW5jZSAoc2VlIGR0X2RldmljZV9tYXRjaCBm
b3IgaW5zdGFuY2UpLiBTbyBJIHdvdWxkIG5vdCBmb3JjZQo+IHRoZSBjb250cmlidXRvciB0byBk
byBpdC4KT2theSwgdGhlbi4KCj4+IEluIHRoaXMgY2FzZSB3ZSBhbHNvIGNhbiBkZWNsYXJlIGFu
ZCB1c2UgaW50cnNbXSBpbiB0aGUgc2FtZSB3YXkuCj4KPiBUaGVyZSBpcyBubyBndWFyYW50ZWUg
dGhlIGluZGV4IGluIGlycSB3aWxsIG1hdGNoIGludHJzWy4uLl0uIFNvIHlvdQo+IG5lZWQgdG8g
a2VlcCB0aGVtIGhhcmRjb2RlZCBpbiB0aGUgbGF0dGVyIGNhc2UuCk9oLCByaWdodC4KCi0tIApW
b2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
