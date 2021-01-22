Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BEA3008CC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 17:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72980.131575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zTj-0003Ei-1U; Fri, 22 Jan 2021 16:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72980.131575; Fri, 22 Jan 2021 16:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2zTi-0003EJ-UB; Fri, 22 Jan 2021 16:40:06 +0000
Received: by outflank-mailman (input) for mailman id 72980;
 Fri, 22 Jan 2021 16:40:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Khkw=GZ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l2zTh-00037p-C9
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 16:40:05 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62d1ba6d-487b-4376-98aa-0a694464a0b9;
 Fri, 22 Jan 2021 16:40:04 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 62d1ba6d-487b-4376-98aa-0a694464a0b9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611333604;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=027SYI3Slt6ltBckZv0CMYB9vKD9vpGdCo460Du6624=;
  b=f5MzYg1js+Q7erId81C1NjS/YRAb1jMLSt6fRTSowH9jDhpIBci4L3ZK
   K3RPTqRtIAHfjZoUlt02UQNUsK2grYvUjLawkocPe/7dd+zlb3na8mK6A
   zNh7l2MoDzV+2EjFiK8XyDSqkllm/8TqYg4PsiukCwnDO5TWGM3mxscu+
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: d9LZkbKrCgxaiGy8AJc+DQQkVgJ6fBKqPeZ5m5XfCqZRI9EVf5RAavXL+Vy4nkU4+RSOGoFG80
 zMx5wXTkeKDmxIvZ5gDDmuVtSuKL0iJeH7YniqVtBswZsxbwBBdecaZr/AvwQV+V4vZ8ZDvwjO
 bn2mCctANj59oIzoqGVp8RW2lc6yQ7vLcRi0/iJ2ekc1R2wXC0jaeF+MIaLzmAQf0U3BJnaopb
 syhaUAQUY0BylT8sCv6a9f9YNBKW0vWqiDXM/ZlPni3ikboPv2RT7exjE23jhRsTHtjZZNkBoI
 JQc=
X-SBRS: 5.2
X-MesageID: 36981534
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,367,1602561600"; 
   d="scan'208";a="36981534"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtddZSjAuwY04MIsQbRAi9TFYCej35rqHzmhqeC2yofaCBkR6xtRPdyd+SnCRLx3diRieDgoHMhjPfgLaOEln5DwwGmn02qEUAj+OZn22XegHmvP9S0PDHEbgy/ljA8PtodGwlDZZvpMeWIFXK06RowqhF95lK+p2L0nODkcQ3iS1F9SXrWMYwJGEmiKFeD2k8Sma4zHuk/eieDjsYDmuhiSLpObV55hE9mIzsJ6Z2UNaA1FxCr8xJ9rny0c1dBdFXoq1zH47AumcDk0JOfCdnBfqyvYhSIwU/1M2YRfk+s+fhPxiZBqNVbtx3oxUQsxeEXml9LIlJowBBoDCZ7fnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=027SYI3Slt6ltBckZv0CMYB9vKD9vpGdCo460Du6624=;
 b=SPqqyFEjFD8p+HAy09e2JIMhfFhDQ9ZSqbet6cEz+F/CAOh5r4A/KNUMdkzdJg/qEYBx6sEHX1wW3dJjPfY0Lxr1p6IUwWdIEP8S7iGoFDAc9lg7Rc7x1ZEYDXKLfxZUh2QUANoZPrUJqohbmfmV5p67GfjP9HzdAau27g40F+me9YiIF1enm+dksLW28cP9rvGtMFiK3pZg3uke/3seXKZJvaa71qgCsE1peUDAm2e01yumgMPMJTJrKZmjBNOmV31z/KFQZPrfl3iLAzDYUUZhCrYadRqYKaNUjemFGFRG7e1zyt2ih5KKvKs2ZOqpvrgaEc8A0pSaIPMhfDUKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=027SYI3Slt6ltBckZv0CMYB9vKD9vpGdCo460Du6624=;
 b=iQ/gDiMO4JhtBDj0lgj5W2fEdADa9Vy52d+tWPqbkjdu5E3uUW5Hzi/i3JIm4K+24kMXkvYVmLCvIv9yqVFVQARTNjhvdnU9FLtY9T9rqG1+rFHg+TE9cG8yHW6dTsf0UB5dfHHmT8V3bHITSs1HQMIWEP8hcyQvCAz7Vkjl6vA=
From: Edwin Torok <edvin.torok@citrix.com>
To: "iwj@xenproject.org" <iwj@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "wl@xen.org" <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>,
	"jgross@suse.com" <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
Thread-Topic: [OSSTEST PATCH 7/7] make-flight: Stripy xenstored
Thread-Index: AQHW8Nc0Pgeo5S7LXkqV4d4+1jYjq6oz2MQA
Date: Fri, 22 Jan 2021 16:40:01 +0000
Message-ID: <8b231075e5ed13412f98881c3b3454d9abf9e871.camel@citrix.com>
References: <20210122155603.23402-1-iwj@xenproject.org>
	 <20210122155603.23402-7-iwj@xenproject.org>
In-Reply-To: <20210122155603.23402-7-iwj@xenproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1-1 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83cacdbe-45d1-4f70-0df3-08d8bef45cf4
x-ms-traffictypediagnostic: BY5PR03MB5203:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR03MB52031E551D6CC08C0A6ECC4D9BA09@BY5PR03MB5203.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TTaEfYRDB2dStwUC3Q6z1B0wKTxyqopwc9XopkCJ+uLG4CmTW6/xrjgiZ2oZB9JPwkCQuMEZtIBbi4BL3C4Uud3I1U03N+4ed+TFwQYNYGkf2gqtAczFMYJwMGGXSUXF9qRSRQFjyq2bqo/RyQURMFEVz5agpiE1yUEupPdZu/vq8KeipyOQOZpVIK4pfGRi4aUXH28HtA6VxGLfWpjCwJJ9ocK8RbWaCwDRdD38Fv9J4QfOf3KE1warc3yjTnnfbfEGRL0NXq4LiaDuhNYen08JOlzoiZ5mrDDPaRZXQNN9/xXrWTxJvvMscqvxvpZTEPcucbvsMUHA6gyfQHaKIrWrWojGpCMjgtYHzLM0X5wF1WDtq7j7Bg0cgLeJtinXmK9SRlBUH87S3oNtN7ECg4v4kB3AL8NQyS4aZh2W1I4X/XjPwANFdDO+72uN2ew1/y5HN+j8oWlSeyA8UNpWLCINZ9amPvtMhcI5OhCEq05/HPjXUFvQsb/BfbBHJYjVceGoiU6jzrg7aqHxJBcofg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(6506007)(26005)(83380400001)(110136005)(6512007)(107886003)(316002)(8936002)(54906003)(4326008)(478600001)(86362001)(71200400001)(76116006)(66446008)(6486002)(8676002)(2906002)(91956017)(36756003)(66556008)(2616005)(66946007)(186003)(64756008)(5660300002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?REhHS3JXZVVVejBrVCtYUFdDd2wydDlSR2JrY3l4ckQwVE1qMTZvR0hlWTAw?=
 =?utf-8?B?bzVTQ0lMQ0xZMDZwdVdNYk1VYkVUcGcyMFhMR3pLeThqdjRpZFdtNmprbjAy?=
 =?utf-8?B?L0J2bmZyQm93NldtZm42WFEveUZoRjN5MDFrcklPN0haMmZldTBzTFhhelU3?=
 =?utf-8?B?bkVFc1BCTzJxYWl1cDZHZ1E4RmE0bGZpR1FaZFRLSXhvOHlKRXRrc1g5MndS?=
 =?utf-8?B?alI4N09IOUtETXp5Y0Jnb2R2ZXJDYi9aZjUxSndLWnh6c2VKSjNTRHFtb3pn?=
 =?utf-8?B?cEJXZ3A4c0hDYnJ2OE5WOExUZ0Zac2pKRURmL0dPeFU5R2Y3dGd0emRpcFI5?=
 =?utf-8?B?QmZ1Vll1MGxFOGgyUzNGWHo0U0U4NTZJNWkvK2V2NkVZNFNoZHJ6Q3h1dFF5?=
 =?utf-8?B?M1FUV2xaSE8zQytRblJsaFlYRTF6SVl2bEZUTW5CbFg1YzlRdmU0M2xXVWdF?=
 =?utf-8?B?ZDJzaVNOMEtHbGtCSjZ0Nk1ZRFgwc2hVeEgwNW15Z1RoSmp3WlRscW1Nejdt?=
 =?utf-8?B?eEJScVg1NGlOdFVsUVM1U1E4K3YrQ2hkbkUvdThueVIwdEFyTlJhcFNnV2w2?=
 =?utf-8?B?RTRsUHRVOENiMFFOOGxleG1tVEo1TG9sdGlLbVVwSU1XcW9vSC9nOWpTU1Fo?=
 =?utf-8?B?VlRQdWdSMmJKMHh4M1c4UzRWcE1yVnJ4ZE5od1hEUlJpNHJkb0ZTZlc4cXJr?=
 =?utf-8?B?cVBmYWpNWk1CTnI0eURVc0dyc1NxR0s0WWI0Q0JFcjZLQlgyNDZoVm8zcERR?=
 =?utf-8?B?MWRrUTNQdm5mWHU4emd1WGxVZkVuK1VxRHlwdVg0MFBNeG1uQStILy9pZ253?=
 =?utf-8?B?azZlbzU1Sm9aL3B5cUFnRjdzWTl6RDdwWTRNVmlHa3ZaazJHZElXZForZ2xw?=
 =?utf-8?B?cEJKK21EenJuUkx4UFFad2pjRytDTXpiRVFCdW5qMlhmM3U5dWNTdnQxSHU0?=
 =?utf-8?B?ZnVycTBFbmpOajlmRzlWNHBIcXZ2U3VNNDQ0M0Z0cW12bDBoZHJSaWVrU1Jk?=
 =?utf-8?B?dkVxejZDT2d2NTR2ekc3SllVSU1UNzQvOHg1N2Y5OGpzUjF2TDJVSlU2dG80?=
 =?utf-8?B?aERBcGdYY2Q2YWdhQkpiOCt6RnJldyt3YjlBekxRMWtRQWN6NzV3RlBseXhT?=
 =?utf-8?B?MDZtVWVWMlJ2NWZpZzdkWXB2VW8yaFI3YnB4Z28yOEtJSVlmdEgrb2tWK3ZE?=
 =?utf-8?B?ZG5Jbm5Fa1Y0Sm93QWwwamxvUzNJanRyckZMWnlxV2lGbGhMcWl1aXA0NHcr?=
 =?utf-8?B?MnBUWGhsNWJ6UE0rZkVFRWM4akJhVThYaVJ0dGM1ekFUT0JxdGdQOVNjN1VP?=
 =?utf-8?B?UnpyUzRKekFRRnRreVpxQ0hpRlgwV0ZkZUNtajJISnR1L0pvd0tGYnNuY09o?=
 =?utf-8?B?dzZ5STRTQkhzOXhBK2pycDdSODV5U1hXTnZyM2Z0enVxQ3QxYkdwU2dya2Uy?=
 =?utf-8?B?TUQxSWlTYXMycFlTc0N3WkE2RGsxQnZSWnliamZ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F20EB879937234293A442F519F16060@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cacdbe-45d1-4f70-0df3-08d8bef45cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 16:40:01.3113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57JtPvyYc7+Pv5kG+AgN+k2w2LpjM9vsIErPw+YQoGDIJxJk81+5GuQcQmGDTKF0oQ9HgzfqeiGq2CzyAq23bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5203
X-OriginatorOrg: citrix.com

T24gRnJpLCAyMDIxLTAxLTIyIGF0IDE1OjU2ICswMDAwLCBJYW4gSmFja3NvbiB3cm90ZToNCj4g
UHJldmlvdXNseSwgd2UgbGV0IHRoZSBYZW4gYnVpbGQgc3lzdGVtIGFuZCBzdGFydHVwIHNjcmlw
dHMgY2hvb3NlDQo+IHdoaWNoIHhlbnN0b3JlZCB0byB1c2UuwqAgQmVmb3JlIHdlIHVwZ3JhZGVk
IHRvIERlYmlhbiBidXN0ZXIsIHRoYXQNCj4gZ2F2ZSB1cyBDIHhlbnRvcmVkIHRlc3RzIG9uIEFS
TS7CoCBTaW5jZSB0aGVuLCBhcm1oZiBhbmQgYXJtNjQgaGF2ZQ0KPiBib3RoIGhhZCBlbm91Z2gg
b2NhbWwgc3VwcG9ydCBhbmQgd2UgaGF2ZW4ndCBiZWVuIHRlc3RpbmcgQyB4ZW5zdG9yZWQNCj4g
YXQgYWxsICENCj4gDQo+IENoYW5nZSB0aGlzLCBieSBzZWxlY3RpbmcgYmV0d2VlbiBDIHhlbnN0
b3JlZCBhbmQgT2NhbWwgeGVuc3RvcmVkDQo+ICJhdCByYW5kb20iLsKgIEFjdHVhbGx5LCB0aGlz
IGlzIGJhc2VkIG9uIHRoZSBqb2IgbmFtZS7CoCBTbyB0aGUgc2FtZQ0KPiBqb2IgaW4gZGlmZmVy
ZW50IGJyYW5jaGVzIHdpbGwgdXNlIHRoZSBzYW1lIHhlbnN0b3JlZCAtIHdoaWNoIGhlbHBzDQo+
IGF2b2lkIGNvbmZ1c2lvbi4NCj4gDQo+IEkgaGF2ZSBkaWZmZWQgdGhlIG91dHB1dCBvZiBzdGFu
ZGFsb25lLWdlbmVyYXRlLWR1bXAtZmxpZ2h0LXJ1bnZhcnMuDQo+IEFzIGV4cGVjdGVkLCB0aGlz
IGFkZGVzIGEgdmFyaWFibGUgYWxsX2hvc3RfeGVuc3RvcmVkIHRvIGV2ZXJ5IGpvYi4NCj4gDQo+
IFRvIG1ha2Ugc3VyZSB3ZSBoYXZlIGVub3VnaCBkaXZlcnNpdHksIEkgZXllYmFsbGVkIHRoZSBy
ZXN1bHRzLsKgIEluDQo+IHBhcnRpY3VsYXI6DQo+IMKgICogVGhlIHNtb2tlIHRlc3RzIG5vdyBo
YXZlIDIgQyBhbmQgMiBPY2FtbCwgb25lIG9mIGVhY2ggb24NCj4gwqDCoMKgIEFSTSBhbmQgeDg2
Lg0KPiDCoCAqIFhURiB0ZXN0cyBoYXZlIDIgb3hlbnN0b3JlZCBhbmQgMyBDIHhlbnN0b3JlZC4N
Cj4gwqAgKiBUaGUgb3ZtZiBmbGlnaHQgaGFzIG9uZSBvZiBlYWNoDQo+IMKgICogVGhlIHNlYWJp
b3MgYW5kIGxpYnZpcnQgZmxpZ2h0cyBsb29rIHJlYXNvbmFibHkgbWl4ZWQuDQo+IA0KPiBNb3N0
IG90aGVyIGZsaWdodHMgaGF2ZSBlbm91Z2ggam9icyB0aGF0IEkgdGhpbmsgdGhpbmdzIGFyZSBk
aXZlcnNlDQo+IGVub3VnaCB3aXRob3V0IGxvb2tpbmcgYXQgdGhlbSBhbGwgaW4gZGV0YWlsLg0K
PiANCj4gSSB0aGluayB0aGlzIGxhY2sgb2YgdGVzdGluZyBuZWVkcyBmaXhpbmcgZm9yIHRoZSBY
ZW4gNC4xNSByZWxlYXNlLg0KPiBTbyBhZnRlciByZXZpZXcgSSBpbnRlbmQgdG8gcHVzaCB0aGlz
IHRvIG9zc3Rlc3QgcHJldGVzdCwgYW5kIG1heQ0KPiBmb3JjZSBwdXNoIGl0IGV2ZW4gaWYgc2hv
d3MgcmVncmVzc2lvbnMuDQoNClNvdW5kcyBnb29kLg0KDQpJbiB0aGUgcGF0Y2ggc2VyaWVzIHRo
YXQgSSd2ZSByZWNlbnRseSBwb3N0ZWQgdG8geGVuLWRldmVsIHRoZXJlIGlzDQphbHNvIGEgJ21h
a2UgY2hlY2snIHRhcmdldCBpbiB0b29scy9vY2FtbC94ZW5zdG9yZWQuDQoNClRoZXJlIGlzIGEg
Yml0IG9mIHBsdW1iaW5nIHRvIGRvIGJlZm9yZSB0aGF0IGlzIHJlYWR5IHRvIGJlIHJ1bg0KYXV0
b21hdGljYWxseSAodGhlcmUgaXMgYSBEb2NrZXJmaWxlIGluIHRoZSBwYXRjaHNlcmllcywgc28g
aXQgc2hvdWxkDQpiZSBwb3NzaWJsZSB0byBlaXRoZXIgYWRhcHQgdGhhdCwgb3IgdmVuZG9yIHRo
ZSAzcmRwYXJ0eSBkZXBlbmRlbmNpZXMNCmZvciB0aGUgcHVycG9zZXMgb2Ygb3NzdGVzdCwgd2hp
Y2hldmVyIGlzIHByZWZlcmFibGUpLg0KDQpUaGVzZSB1bml0IHRlc3RzIHJlcXVpcmUgT0NhbWwg
NC4wNissIHNvIGl0J2QgYmUgZ29vZCB0byBlbnN1cmUgdGhhdCBhdA0KbGVhc3Qgb25lIG9mIHRo
ZSBidWlsZGVycyBoYXMgdGhhdCAodGhlIFVidW50dTpmb2NhbCBmcm9tIG15IHBhdGNoDQpzZXJp
ZXMgc2hvdWxkKS4NCg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg0KDQo=

