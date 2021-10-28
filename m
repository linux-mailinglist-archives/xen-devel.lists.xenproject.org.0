Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE643DEEC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 12:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217836.378031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2ht-0000jf-8C; Thu, 28 Oct 2021 10:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217836.378031; Thu, 28 Oct 2021 10:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2ht-0000hT-4r; Thu, 28 Oct 2021 10:32:25 +0000
Received: by outflank-mailman (input) for mailman id 217836;
 Thu, 28 Oct 2021 10:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg2hr-0000hL-BR
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 10:32:23 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6647d1dd-e493-4036-b301-22f72f2d84c1;
 Thu, 28 Oct 2021 10:32:21 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S9SZ2a001567; 
 Thu, 28 Oct 2021 10:32:20 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 3byduj23sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 10:32:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3715.eurprd03.prod.outlook.com (2603:10a6:208:43::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 10:32:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:32:17 +0000
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
X-Inumbo-ID: 6647d1dd-e493-4036-b301-22f72f2d84c1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OR1wLKc8IXuIjkO2Gh8DhmkSGH05YktTVrv4Y7DPgG69o7ZcjphcVnXG0JphTjJ4HGT3gKYdiyNZVGnMk9UZ3h1GzNFKQ/yV9fkPeUiM0IxSIBNAP5mMT75sdb79y+sY/F7WzePDu/irpaHqtnP5l3qcTeuggOZbvBsGHsSueHB+HGZfskwVOSvt8fpxV62YWxJnEW3BJtHfz59sEZ0HK8gUw43wWtffej5QJIK8pIkjCs0Q+QWv0h78UvjE3ptVIPB61n+5Qk9RCh2n8p6krUX0QEOlBHaRKvRAkS9ZD18J1SX4iEFfM9XttFuw9qLp5m2Y10QpQ+QAPYo1/E6DDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl6HudNpHslqI/UiWj1QV4BZrWsOMpJYIAhOf971FEE=;
 b=hpuIjmxpf01DfWqEB49YtJWOQjkolx4hcq9tzb51ucTWmcNpx7sDYeGMc7PIXPXjNyutBEaM5RrPGIzVcnAE70IUDYk8VimzEnhwjdrEIpMlog179yoXvtKqiGwX99Xf+HRBTcLoVwQ2LSzJKkMEkjuvWvq/ZINUcpTo0//GmtMUP9zQyKWcmbbalI3RjYphuPe6Tzb/gkcMDDGc8RUeHfHa9NSFFT8E2R1YTmmxdOWPrVPo3eqVDY9rirgdiTi76rjzjalhan1+OL2ya5P1sDc8MbHWFWcHcm4aNVVFYZq48VbwtW1Q7pBbtbkCCw1cUbPGqajM1qdHbK+fY+6nmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl6HudNpHslqI/UiWj1QV4BZrWsOMpJYIAhOf971FEE=;
 b=zQlffk2WDnovT9Q67ZtJ71stfGjjRyerIZjH0zZtxDWU6rPMnBVY2eGMqrQ6LEnWFM2M6I2MxJVQXhxQy7zWXgVDQEqDpP7eItcwwpiAACl6lkpM/Tovdo/gcp7tdj+ZKTllMx5oT4IiVvG+ZhNY9FgovxoAxXwUEGpL6pmPkSGVOm1V8TnNCvR/GyYdDUBSLgoK48DslmaRiXfSLhUJ0nzGKi8QEtkPWQWQR8LOyLSaAYkZk6Vrm2GktEFziuI0hp3LTJFuCkcppmfS1dSUvxgeXEir1aFXsx7SeRsBqZdkGZJvrBW2QgZy9EN/Z5c/DyDXI/wmePCn62zgT8QGdQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: vpci: Need for vpci_cancel_pending
Thread-Topic: vpci: Need for vpci_cancel_pending
Thread-Index: AQHXy+MtilSp1e2bsUu2TEgvHf6jsavoMiQAgAACRgCAAAFoAIAAAJCA
Date: Thu, 28 Oct 2021 10:32:17 +0000
Message-ID: <85fb7d38-3dfa-1120-21bc-638efbe2849c@epam.com>
References: <fd1328da-5ad3-62cc-28d6-0ec60e9ea582@epam.com>
 <YXp4ovmIsHKTGiw0@Air-de-Roger>
 <9eca8f0d-ca4c-696c-5ce8-4073033f59cc@epam.com>
 <YXp7uHdubtmsG/HM@Air-de-Roger>
In-Reply-To: <YXp7uHdubtmsG/HM@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 253d7f1c-075a-44bb-5a57-08d999fe373b
x-ms-traffictypediagnostic: AM0PR03MB3715:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3715C4F8AB444409B49D1041E7869@AM0PR03MB3715.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iY4UfPW6rYMJxtZ4B35dGkdArp5Uv905tnTsUXrLoGK7gvs3qUNVGYLxVtyFuezdvmHD5zOUlPXZ8KjJzQ7Q2ThXbp/IVEpkpabWqI4+W1WZkxLV7/kMVnyurQFRgGJ2XblXfQbVaThVoy8fRk6KiHpWX4YSIBTdaxWdOAX5ILsK0uQdRju3BaCSkeYqdsi1fRqnEmGlkF/8a642TkXkrqt+9mCfxqq37gPlkRf39ifQfLCw/EXiWneXDKLAYLbZ7IA0msTtQf72nssn4PN4UZb0WSVn52bGPqCpHTOoZ/eTbcSpvoc5WGesDtsGGny+2qjQNzCl8YSmVIQWw/2LNqhmbRnZyCk0nb3u/0pIdYDDOsFYhtwFZWKjA0wOMJQB5VzEvojynid9fkZsif8MxxSy962+ZzqiwpAj0ilUOqg4Arj4BmZeG/FwBrLJGlCNHGjSxWbDLdzA73p7yjXTSbG4p+K7axk1r07dO9IUVR00+VidZI48X2QQqEpMD+wtLzS4NlNJKS5WSp5LZzHhbB6q1e6VBcwr6ZuNuemU5BHwALWt3mFUA7oKFfS2gpvJ2ZbkxepKAKkAwA06s6JJjMxbtKZgv5DrwiowwNvdXwPGgWi+tTNUkAyHzYOsLxpeAnx1ptpg0l9m4K1CqF97ILEnAgiBhyp3Ox6xpJ5qnT3YZJ+KLPs5FJ0RooYLywC3vkuVrVqiqOMyB8/wyOpw8IEdGB1GfH8SmUojLQ5TE4OHohcZP6ZImW5XcQ3QKvK6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(76116006)(71200400001)(91956017)(8676002)(6512007)(6916009)(122000001)(86362001)(55236004)(5660300002)(316002)(38070700005)(4326008)(6506007)(66476007)(66446008)(66556008)(64756008)(38100700002)(2906002)(53546011)(2616005)(508600001)(31686004)(8936002)(186003)(83380400001)(6486002)(36756003)(26005)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R1BWRjhCdlU0RlZKS1diVWwwVUNBQ2FEcGtEaU9hakQxVzBiTElUckxFRjlO?=
 =?utf-8?B?dUI5U2RBaE5NdUxRa1BTN0tzU2MrNVc3RkorQ3pFNU5RREMwbm9VMGc5a1lk?=
 =?utf-8?B?YXBQUERiTnFKM1h2S0ExeXdNMHJoUllHUTJiRFZkTnJkd0h3K0RGMXJNeG0w?=
 =?utf-8?B?TUFNdVR4eTQzby9IakJmYWhDQlFKLzlmSXRESmZFUGhaL2tQOTJrSC9Yb3JR?=
 =?utf-8?B?dW10SDlvL2h6SVlMbmRMa0xZOEl6RXpyWVU1TFBFeGR6dzBkdUVhQ2Y0SW55?=
 =?utf-8?B?RFpLVkFmYUs2V0oyL0JPWlprenpKUFdFRjlOWGVjbHBOTUZPa1dUY1JPcVNx?=
 =?utf-8?B?ZHcvMmxsam5nUUZRN2dSWXd6UHdLQ1ZqV2drckFWbkJkd3M2YXgrQmFjeDlR?=
 =?utf-8?B?NnlKZ2R5OWRrd1p5SmNLYnZjVlJEcjlJOTRJZW9PNGEramUyclgzV1hlOGVO?=
 =?utf-8?B?amFQMXBXa0sxRGhPcnhzVW9QSTAvT1k4dmdDT0thRGRVOHRkdkp0SDcyTVV2?=
 =?utf-8?B?NlB3UG5TS2FqUDBHRjk0blVsZkJhVFJ1MjQ4akJWdGx1bTNsME8wa0JYMTY1?=
 =?utf-8?B?MThyZEVmU0pRTkJKLzFiU2I5Y2pUMVNBV21yZUloOWlrZ0dueElHd2piYTRv?=
 =?utf-8?B?N2RMaWJ4Z0E2OUlMS3BGd1VRWU1WTWo2L0ZlNytTeWo1Q2Y1WGI5akZUWUc3?=
 =?utf-8?B?dWpmKzNjbXFucHg5Nys4NDAraWdqMC8zSVNVUi8rZHZNVGpoZWVSdjJlRnUv?=
 =?utf-8?B?czlIUDh5c282ci9TMzVoekxyYlBkSUgybE1SOEJrOXVYMHRXVmVGVlltUC96?=
 =?utf-8?B?NzR1TDBTcm9VdmR5b2JpbXRxQVNDLzR0Q2NRbXptMnBwbUVvQ256SFZndU9M?=
 =?utf-8?B?ZzJmcitndUNKTld0QXlxUjNXdTBUNG4wMkY1aHJBQXE0c1dyNVpxdWhmMWJC?=
 =?utf-8?B?UGRMYlhkMTVSblNsQlR0RlZ1QUlGL0h4L0Y0bStydnpuYWF6OUR1UEFlZFlP?=
 =?utf-8?B?bWdiUmw0bXJVb2o3VExlMkU1RmVrK0U2Y2YvWTVvZW5GN2tpNHNJZTNYVkJ5?=
 =?utf-8?B?OWY0dlgzeGg0WTVDeGY4UmVOeWxPWXJucU5CTDgvTHNVNTdwUlFQcTRva3pZ?=
 =?utf-8?B?ZmgxNFh4SG9ONFNmRDZZMFpLZFRzVXNWbnoyelJwZzV3ZHl6OHh6OHNZK2xl?=
 =?utf-8?B?Z1BHMDBJWUVZU09kdndEUEFoVFl3MXpjd0ttN1dBaW9jYzZ5TWNmRVJ1eno4?=
 =?utf-8?B?Wm9vN09VNnpUTWQ3a25ZVDh6MzNGK3hFdHBzVmVQb2VBbDdZR1MwclpCTVBq?=
 =?utf-8?B?U2JEYS9kN2l0dEcvU2gwVmJMQ1FNL05QTHF0elMzNHZRRkgyZDhlOW1NRHZp?=
 =?utf-8?B?YUQ1dm1CNHVPT2ZwRXMxUEdSYTUyWmZ2UThtaDVyT2psVHNhK1h6YXp4TG9Q?=
 =?utf-8?B?bkNGc3ZiREVKMTliWEl3OXpJUmt1bGxneVhjQTRSWWRqZzd0MGt2VU5iekV2?=
 =?utf-8?B?eVVYSlZ3OTZPTjFIOFBDdzc2Z2w0NXdHVmNHbW9oVDBDdWFBYUozZHF2VWF4?=
 =?utf-8?B?a0doUy9CVzlERlBoa2Z3R3F5UWoxTnMrWnA4Z0VYRUsvYnM5SUVSbkg5S3Vl?=
 =?utf-8?B?VXZOQ2JQQVdGQmNCeTJ1N3Boa3ludXZpUUdFUzkvRFBtZkVhSFhhak9Ma0FF?=
 =?utf-8?B?UTQySlFoMFVQZkpzMmt3OG9IUENNRmNmcHAzb1JPS0p4MVZRYVNpNTJnSnhq?=
 =?utf-8?B?YWtFNkxYMzVBcFpWd3MzL2hKZEhpblU3aTRJVU4zZ3RlVzJxbXFtWm9jM0li?=
 =?utf-8?B?aTN4YXVySEVPNmowUVdEOTlmVjZ1VU9uTzIxcWg5bnEyRFlIaHpMUkFtaU0r?=
 =?utf-8?B?clN0QnVJVm1EYzJnVitldGltV3oyM2twUFhSVlN2NGI3ZE5BMXFscVlrbXJY?=
 =?utf-8?B?TFN5NWNpaUdMRkVXL2ppZmZrQmJqVUlVNHk2SHJoMFU2eWhzZm9iTEw2eWpR?=
 =?utf-8?B?SHFCV3JneHVoeTI1QWQ3V1FqL0ZpRVdiNXBEZXVHV2RWWmJMWGNGdUdDazNC?=
 =?utf-8?B?ck85eWI5Q1pLVDFtZXBaWi9SWEZaNi9SdlBDT1cxK2NDZFRGcysrNzg5azFD?=
 =?utf-8?B?Q1dxTENvSEJnUUx0YjZvbUx2Z1NyeWpLM0tQNE1QUUE3U3JYVjlqQWtKQUpx?=
 =?utf-8?B?UEhDakprTjIxRzlVcUdZRCsvWm51S3RQS3BaVGs2dFJCMzJROC96NU1DZjBG?=
 =?utf-8?B?S3llL0drcFpsems1SmxwNUVqbSt5T0EwclgyemZ6Z0NLMm1rUThZRGUwQllW?=
 =?utf-8?B?aDUzNExYREFwVmQ5enFqNVFwdUNGMEJYamJlbUtocFY3aXNhQzdTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67EC452D085F8346B5D576D9DFF9ACF3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253d7f1c-075a-44bb-5a57-08d999fe373b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 10:32:17.6218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygFDrU8r8j3ib5RCPZmlXUySS353a8yGPfdOid7xK3NA533v8dnjL10fvql0KL6fgM5E01UnSlEF8eP6Pcp2M80BcT/z1PnBjxPufPdpt68wiUzQSgLQrnDFSh1O1hdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3715
X-Proofpoint-GUID: KC2oVsjB2Jlha_g5RdpS26_cPwAWmg8a
X-Proofpoint-ORIG-GUID: KC2oVsjB2Jlha_g5RdpS26_cPwAWmg8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=766
 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110280057

DQoNCk9uIDI4LjEwLjIxIDEzOjMwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IE9jdCAyOCwgMjAyMSBhdCAxMDoyNToyOEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAyOC4xMC4yMSAxMzoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCAxMDowNDoyMEFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gSGksIGFsbCENCj4+Pj4NCj4+Pj4gV2hpbGUg
d29ya2luZyBvbiBQQ0kgcGFzc3Rocm91Z2ggb24gQXJtIEkgc3RlcHBlZCBvbnRvIGEgY3Jhc2gN
Cj4+Pj4gd2l0aCB0aGUgZm9sbG93aW5nIGNhbGwgY2hhaW46DQo+Pj4+DQo+Pj4+IHBjaV9waHlz
ZGV2X29wDQo+Pj4+ICAgIMKgIHBjaV9hZGRfZGV2aWNlDQo+Pj4+ICAgIMKgIMKgwqAgwqBpbml0
X2JhcnMgLT4gbW9kaWZ5X2JhcnMgLT4gZGVmZXJfbWFwIC0+IHJhaXNlX3NvZnRpcnEoU0NIRURV
TEVfU09GVElSUSkNCj4+Pj4gICAgwqAgaW9tbXVfYWRkX2RldmljZSA8LSBGQUlMUw0KPj4+PiAg
ICDCoCB2cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+Pj4NCj4+Pj4g
VGhlbjoNCj4+Pj4gbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdA0KPj4+PiAgICDCoCB2cGNpX3By
b2Nlc3NfcGVuZGluZzogdi0+dnBjaS5tZW0gIT0gTlVMTDsgdi0+dnBjaS5wZGV2LT52cGNpID09
IE5VTEwNCj4+Pj4NCj4+Pj4gV2hpY2ggcmVzdWx0cyBpbiB0aGUgY3Jhc2ggYmVsb3c6DQo+Pj4+
DQo+Pj4+IChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHg2DQo+Pj4+IChYRU4pIFdh
bGtpbmcgSHlwZXJ2aXNvciBWQSAweDEwIG9uIENQVTAgdmlhIFRUQlIgMHgwMDAwMDAwMDQ4MWRk
MDAwDQo+Pj4+IChYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAwMDQ4MWRjZjdmDQo+Pj4+IChYRU4p
IDFTVFsweDBdID0gMHgwMDAwMDAwMDQ4MWQ5ZjdmDQo+Pj4+IChYRU4pIDJORFsweDBdID0gMHgw
MDAwMDAwMDAwMDAwMDAwDQo+Pj4+IChYRU4pIENQVTA6IFVuZXhwZWN0ZWQgVHJhcDogRGF0YSBB
Ym9ydA0KPj4+PiAuLi4NCj4+Pj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+Pj4+IChYRU4pwqDC
oMKgIFs8MDAwMDAwMDAwMDIyNDZkOD5dIF9zcGluX2xvY2srMHg0MC8weGE0IChQQykNCj4+Pj4g
KFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjI0NmMwPl0gX3NwaW5fbG9jaysweDI4LzB4YTQgKExS
KQ0KPj4+PiAoWEVOKcKgwqDCoCBbPDAwMDAwMDAwMDAyNGY2ZDA+XSB2cGNpX3Byb2Nlc3NfcGVu
ZGluZysweDc4LzB4MTI4DQo+Pj4+IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAwMDI3ZjdlOD5dIGxl
YXZlX2h5cGVydmlzb3JfdG9fZ3Vlc3QrMHg1MC8weGNjDQo+Pj4+IChYRU4pwqDCoMKgIFs8MDAw
MDAwMDAwMDI2OWM1Yz5dIGVudHJ5Lm8jZ3Vlc3Rfc3luY19zbG93cGF0aCsweGE4LzB4ZDQNCj4+
Pj4NCj4+Pj4gU28sIGl0IHNlZW1zIHRoYXQgaWYgcGNpX2FkZF9kZXZpY2UgZmFpbHMgYW5kIGNh
bGxzIHZwY2lfcmVtb3ZlX2RldmljZQ0KPj4+PiB0aGUgbGF0ZXIgbmVlZHMgdG8gY2FuY2VsIGFu
eSBwZW5kaW5nIHdvcmsuDQo+Pj4gSW5kZWVkLCB5b3Ugd2lsbCBuZWVkIHRvIGNoZWNrIHRoYXQg
di0+dnBjaS5wZGV2ID09IHBkZXYgYmVmb3JlDQo+Pj4gY2FuY2VsaW5nIHRoZSBwZW5kaW5nIHdv
cmsgdGhvdWdoLCBvciBlbHNlIHlvdSBjb3VsZCBiZSBjYW5jZWxpbmcNCj4+PiBwZW5kaW5nIHdv
cmsgZnJvbSBhIGRpZmZlcmVudCBkZXZpY2UuDQo+PiBIb3cgYWJvdXQ6DQo+Pg0KPj4gdm9pZCB2
cGNpX2NhbmNlbF9wZW5kaW5nKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gew0KPj4gICDCoMKg
wqAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Ow0KPj4NCj4+ICAgwqDCoMKgIGlmICggdi0+dnBj
aS5tZW0gJiYgdi0+dnBjaS5wZGV2ID09IHBkZXYpDQo+PiAgIMKgwqDCoCB7DQo+PiAgIMKgwqDC
oMKgwqDCoMKgIHJhbmdlc2V0X2Rlc3Ryb3kodi0+dnBjaS5tZW0pOw0KPj4gICDCoMKgwqDCoMKg
wqDCoCB2LT52cGNpLm1lbSA9IE5VTEw7DQo+PiAgIMKgwqDCoCB9DQo+PiB9DQo+Pg0KPj4gVGhp
cyB3aWxsIGVmZmVjdGl2ZWx5IHByZXZlbnQgdGhlIHBlbmRpbmcgd29yayBmcm9tIHJ1bm5pbmcN
Cj4gQ2FuJ3QgeW91IGp1c3QgcGxhY2UgdGhpcyBpbiB2cGNpX3JlbW92ZV9kZXZpY2U/DQo+DQo+
IE9yIGlzIHRoZXJlIGEgbmVlZCB0byBjYW5jZWwgcGVuZGluZyB3b3JrIHdpdGhvdXQgcmVtb3Zp
bmcgdGhlIGRldmljZT8NCkBAIC0xNDksOCArMTQ5LDcgQEAgYm9vbCB2cGNpX3Byb2Nlc3NfcGVu
ZGluZyhzdHJ1Y3QgdmNwdSAqdikNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIXJjICYmIHYtPnZwY2kucm9tX29ubHkpOw0KIMKgwqDCoMKgwqDCoMKg
wqAgc3Bpbl91bmxvY2soJnYtPnZwY2kucGRldi0+dnBjaS0+bG9jayk7DQoNCi3CoMKgwqDCoMKg
wqDCoCByYW5nZXNldF9kZXN0cm95KHYtPnZwY2kubWVtKTsNCi3CoMKgwqDCoMKgwqDCoCB2LT52
cGNpLm1lbSA9IE5VTEw7DQorwqDCoMKgwqDCoMKgwqAgdnBjaV9jYW5jZWxfcGVuZGluZyh2LT52
cGNpLnBkZXYpOw0KDQpTbywgd2UgY2FuIHJlLXVzZSBpdCBhbmQgZG8gbm90IGNvcHkgcGFzdGUg
dGhlIHNhbWUNCj4NCj4gVGhhbmtzLCBSb2dlci4NCg==

