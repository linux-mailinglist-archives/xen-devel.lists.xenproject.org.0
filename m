Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8B143A3F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 11:04:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqLh-0003oM-8j; Tue, 21 Jan 2020 10:01:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MI7m=3K=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1itqLf-0003oH-VT
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:01:28 +0000
X-Inumbo-ID: fc960bd2-3c34-11ea-8e9a-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::707])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc960bd2-3c34-11ea-8e9a-bc764e2007e4;
 Tue, 21 Jan 2020 10:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPEZUlRp12fZ+arCcD9yHKQQCtVHjJ0uWGBPT8r/LgJBiARcoznrlzXxe7ThH8FlJvlFTlbop6fGsdC2NSqS/xdzqnBIZ2x79dL5R9XqzFlajDHR47PXNf+apz+0RZzT+4IfZXNnNEVIdQFn5m/lJuP3TKiLVeh+sEJbcDeCLpQilm4yxfwPjlCZRRYpSEja1szxr5kDzYde9hYZwBBhPXwjLGwhCzoXQ201PGZFuWvHXpEm+hWAGqLSoTK+/R4wodybR/0W7W9qRpzYBANTzyvl3w+1KQuMcbPBM7PqJja5MoOQHGRud5fCT0705rQzXdbVZ+7ELdTUhh0AZGUhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzXBLiba4Aik8WezPwLr+0iN2pakAWZlvNBSbmjEm9s=;
 b=lptLFTS2kbWCFyUe5gKnnBgbpRbKyo/5L4kEVI/za9OBzoRn3hSWlaYg68Q77q2FSw/ZCCfX6aVh2o3tojbt3Vl+koYVtQD9AIo7jjXhtK4jDjqKVeS3O6eUfRtJa3zAJurAYtkm/CX/CCyoETFltDYFGCX8gLgY3WjI/lK3+8TmuhGVyUnicBoKGPtp56jXRYQ/JZWae/dbfe0xXfjtAXmTQdkRe8rSCCK5DH/MPptF61OrmQ6E4wxaXqywQPy00xvhaZuzUYlELwSk+RW2MOBrUJdClZBGtjp/WGox1ZZqri8C3tkrwSMYSPNhmeldhkjgs0sflKNWXmLRebR13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzXBLiba4Aik8WezPwLr+0iN2pakAWZlvNBSbmjEm9s=;
 b=V3G3Bb32aqsJ961dJ0uglp9YPkQsHG1jmA033nSr3o9fBTdASUaIF9Rb21T9qDBB+qPHxh3trrSrBWf3/CWgCmNamUUXLCW5t+DJfoOUpvXNKLfxtdFDizg0MaJJ+5EAluGKqV36XwaBWRCevktCzY1KXDIWYwI0Pf6gYH6OawE=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3015.eurprd02.prod.outlook.com (10.175.234.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.22; Tue, 21 Jan 2020 10:01:23 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2644.026; Tue, 21 Jan 2020
 10:01:22 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR06CA0053.eurprd06.prod.outlook.com (2603:10a6:208:aa::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18 via Frontend Transport; Tue, 21 Jan 2020 10:01:21 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Wei Xu <xuwei5@hisilicon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function
 for ARM
Thread-Index: AQHV0EBzyX2it6CDtUGAF3Arvy+eQaf04vQA
Date: Tue, 21 Jan 2020 10:01:22 +0000
Message-ID: <9f8c3201-e40b-18bf-12e5-ed9f3f0a563a@bitdefender.com>
References: <5E26C935.9080107@hisilicon.com>
In-Reply-To: <5E26C935.9080107@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0053.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::30) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e198a74-6a19-49ba-63f1-08d79e58de96
x-ms-traffictypediagnostic: DB6PR02MB3015:|DB6PR02MB3015:
x-microsoft-antispam-prvs: <DB6PR02MB3015109207CE0E052AB41926AB0D0@DB6PR02MB3015.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(346002)(366004)(136003)(396003)(376002)(189003)(199004)(31696002)(4744005)(36756003)(316002)(956004)(71200400001)(478600001)(2616005)(7416002)(8936002)(31686004)(4326008)(110136005)(54906003)(53546011)(86362001)(52116002)(6486002)(66476007)(16526019)(81156014)(5660300002)(2906002)(8676002)(66946007)(66446008)(66556008)(81166006)(186003)(64756008)(16576012)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3015;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bgcAIc+7XhsvZW3CGdJRdyQLlGoBYtbuTD7lO+XWF9P1VI+28W/QNZbnh/ODlxFg9fwDN0cfAJV7+3ffv3pNmaUVv7DIiPHeX4zcq/vfn6RZ9vADFxsMI//q7CesM1RN5m/hFlkGwBTvgN2wQ8tishDH2Q6s02bj+bnKLCGpmlgU4DAFUySburc81GrorXNqybbYzo26TSf56ZQM7qxvX89yTfOCKYVU+050S/O57hhvkmzLLnREOKILXvaXP3lVYmRvOOWrzDdAwvuTHMKNoKhcIxzrNl4MXPPgSF4f9Tmn9rz7gYUKT6sxEoxzTuPf/7uhpgHGASyBV8V8772QwMmwmAG1BDQMJBy9+R+9mJIL6s3LY5aTCkEWhUrjQIdiS693s2K4/O9BUr+wf9O8niyvYV2TiBiqJ8k+Uh9xL+F0zUdRQRsb1tuGrUMczkv2
x-ms-exchange-transport-forked: True
Content-ID: <AE412E5FBD613C4582120BDD88E5FED3@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e198a74-6a19-49ba-63f1-08d79e58de96
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 10:01:22.8400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeYMfBZAF48OQ5mjeDfI46ZsMiaT2qGONQiddszpI9I4ahPZYfbgus4Vmk28R/5KxrAj87Quedeq86lfXpHqNXjEpz2hw+sqALEV12TfYfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3015
Subject: Re: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function
 for ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIxLjAxLjIwMjAgMTE6NDksIFdlaSBYdSB3cm90ZToNCj4gQWRkIF9fYWNwaV91bm1h
cF90YWJsZSBmdW5jdGlvbiBmb3IgQVJNIGFuZCBpbnZva2UgaXQgYXQgYWNwaV9vc191bm1hcF9t
ZW1vcnkNCj4gdG8gbWFrZSBzdXJlIHRoZSByZWxhdGVkIGZpeG1hcCBoYXMgYmVlbiBjbGVhcmVk
IGJlZm9yZSB1c2luZyBpdCBmb3IgYQ0KPiBkaWZmZXJlbnQgbWFwcGluZy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBYdTx4dXdlaTVAaGlzaWxpY29uLmNvbT4NCj4gLS0tDQo+ICAgeGVuL2Fy
Y2gvYXJtL2FjcGkvbGliLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgeGVu
L2RyaXZlcnMvYWNwaS9vc2wuYyAgfCAgMiArKw0KPiAgIHhlbi9pbmNsdWRlL3hlbi9hY3BpLmgg
IHwgIDEgKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hY3BpL2xpYi5jIGIveGVuL2FyY2gvYXJtL2FjcGkvbGli
LmMNCj4gaW5kZXggNGZjNmUxNy4uNjllODdlYyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJt
L2FjcGkvbGliLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2FjcGkvbGliLmMNCj4gQEAgLTQ5LDYg
KzQ5LDMxIEBAIGNoYXIgKl9fYWNwaV9tYXBfdGFibGUocGFkZHJfdCBwaHlzLCB1bnNpZ25lZCBs
b25nIHNpemUpDQo+ICAgICAgIHJldHVybiAoKGNoYXIgKikgYmFzZSArIG9mZnNldCk7DQo+ICAg
fQ0KPiAgIA0KPiArdm9pZCBfX2FjcGlfdW5tYXBfdGFibGUodm9pZCBfX2lvbWVtICogdmlydCwg
dW5zaWduZWQgbG9uZyBzaXplKQ0KDQpZb3UgaGF2ZSBhIHN0cmF5IHNwYWNlIGhlcmUgYWZ0ZXIg
IioiDQoNCj4gK3sNCj4gKyAgICB1bnNpZ25lZCBsb25nIGJhc2UsIGVuZDsNCj4gKyAgICBpbnQg
aWR4Ow0KPiArDQo+ICsgICAgYmFzZSA9IEZJWE1BUF9BRERSKEZJWE1BUF9BQ1BJX0JFR0lOKTsN
Cj4gKyAgICBlbmQgPSBGSVhNQVBfQUREUihGSVhNQVBfQUNQSV9FTkQpOw0KDQpNYXliZSB0aGUg
aW5pdGlhbGl6YXRpb24gY2FuIGJlIG1vdmVkIHRvIHRoZSBkZWNsYXJhdGlvbj8NCg0KDQpBbGV4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
