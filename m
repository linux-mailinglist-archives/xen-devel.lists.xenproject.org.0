Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1873ACCAC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144665.266250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEps-00063R-Mx; Fri, 18 Jun 2021 13:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144665.266250; Fri, 18 Jun 2021 13:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEps-00060N-JW; Fri, 18 Jun 2021 13:47:04 +0000
Received: by outflank-mailman (input) for mailman id 144665;
 Fri, 18 Jun 2021 13:47:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=axfQ=LM=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1luEpr-0005zg-7N
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:47:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcc4bad4-082a-4c32-8f07-587709833a43;
 Fri, 18 Jun 2021 13:47:02 +0000 (UTC)
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
X-Inumbo-ID: bcc4bad4-082a-4c32-8f07-587709833a43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624024022;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=H+610r95/mEl0uWAJ5OlOC40N1wDr546XfSq/hoUwqM=;
  b=O8bixDPTg+VSdglyEnJJzR7fwWsx5nrDJdN5D04uxnfk7jAZjBQajpPI
   1qmcnzt6lBSpXQODwpRaq+fDGc/LSIHuJOY+9PtbTwNUZjcqOEoD2//4w
   bWnV8a+7cEVgn+BBHtgZe6JtMi1DCIrE6jyhrERaseMwWkGytfEOjAhqH
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gO4jcaCNHacz/TQfRvw/1XvJvn9uPQQIi9L/hM8XcBE/Ul0XQbYwqPtxHAR/dWw94sEcBMwMJk
 ZEKK5LwKoPmic7v+MuKbPJI87ZWgx/6f4I5oQi0MFfH7QW+PEKz5/r2ghwS8Q0pzfmJOKoGYLE
 qRF1+lJM5cSQ5DVETKLt+te8Y/iGpcaSVORy5+pOWXYRfwG0ft8ehTA8mXrGBI3U9AEcp4WYdT
 12D0ah95qCz1SOe3/sY8I4y0nDBcpoHuWi1m0vdQ3EkOkE48Yv2LJq4tyBuMGotU/E7tNn3YFI
 XMg=
X-SBRS: 5.1
X-MesageID: 46461339
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ZlLsVaCzfS0GWQrlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46461339"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhZSGVx03O8ee89VreKa3yuVWlBm/n8oP43D6+vCKNG9X0AeofZyH02wlovpVMYI6kISFjpfk9Ecl/auJ6TtSm6ArN6DRu+YQJkUYI2Jxhm1Ro74vQ66TpeSgpqS9hS98FukthgeTFbHw1HY3fE1Lt+ymhInGBvK8djdDvt76+02Z3BteHqyF6rTi3wa5RqZTi+qx1NJotGSUVU3vLUDUQS4COocarXoEpxWhzmSFA8H1RvJ/q4idJ5pD/bhI5+LwiSZZTFRl/qhBzVhwYr1VxVTtimMfkEpYzFhQccCTV4UWO0ngB9TOpt+adm1bUXBB+DKs5afNtZ56WUeuifu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+610r95/mEl0uWAJ5OlOC40N1wDr546XfSq/hoUwqM=;
 b=H5kCPBeeV+LVTJysco9vxYh8Fnf54ayrGZCwOtIWw24MKAEXELyDGeSAZkpAxz+Uo83CmPSaMNdr0BWHotOMDHu1qlA8+0ShZSyjg3b7EAjzKzOp4jZ3Z0Ziy6MNWtJjzNu2NBklqWA8t6v9b3HE37AiJHO27Drs5YVC9LYFOAB8w6Yuayz/Phrb+g50BaGaGzbfJuPL8FbGBqgemUiqAWHiZGaXQUYY/GKCLHIwxbInERmzwKgC+cbP3Q1cNH/vGVVUnCwnmgBMkZLuz5c0ICAaVQdbwnczvL0SQb3Bo3GJGul72YTuwZhihpYCiIUEx2PdMDJ0CAWlAQ3KNfL7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+610r95/mEl0uWAJ5OlOC40N1wDr546XfSq/hoUwqM=;
 b=munzUIenqG/uuX3r/I+4neGk6MxZ3/wEok7vCblQpTqts1ecaeWPVau+KFAQMwo9ENABKs14k/QpbcniyRf0JPGKvbXhwq8OVIIzKnexyuUnnuuYHX5TWVIGaJsa9IddwhlfDAevg39y9RiJgXypZZtiqbnNG2r5ahFoKGZFqds=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
Thread-Topic: [PATCH] tools/ocaml/libs/xc: add OCaml stubs to query CPU policy
Thread-Index: AQHXZC8pdx4Fbe3SD0u2mLoPzHVclasZwB4AgAAIUoA=
Date: Fri, 18 Jun 2021 13:46:58 +0000
Message-ID: <5B331E67-0BE9-47DE-8076-EBBE06BDEBF4@citrix.com>
References: <5fdb7b4cdee69af8e2b9d77b56b1027a8799cf04.1624012999.git.edvin.torok@citrix.com>
 <4eb5d3fb-db71-5981-e6f5-0503ff896fd9@citrix.com>
In-Reply-To: <4eb5d3fb-db71-5981-e6f5-0503ff896fd9@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e08d667-43ec-4429-f728-08d9325f8ad0
x-ms-traffictypediagnostic: BYAPR03MB3655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB3655851ABD40D4AC3B85863A9B0D9@BYAPR03MB3655.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XZZXz1ShlQn4+ML/fOK2ckD6AyFuNDyY9TZkihW8GVX/vPhVoS+0grqUoi/2KPAlKHtrAl/gPQoxw7uUdRevPM4r3jVsHDAZy03h0KS22y4T2EtWJ4CcMURK4ITxBceDqwIKXHCtVWXWDMaFelClRX6msUgQarrmrns4U/khJb5DwlkHt2+7kpjRcAEaqh7VHz6Lz9BrOJwD9NmcnU28kOk26t31TA0v1qwDn5W9hFPL5gVzonvJAlZGs1ktJ0Wthi1l70qqe/EQ9dTZqxe1ltsIEAcC4Su7+erhldbY/KAL3dSoKPyAOgklG/LLMg3v2Z9b38m2Zp67pQQUb2aaRiHinF4y+mHSN4dRThZwzuiT3G/OcGYZDvBXMcQ1qkp+Z/sQ6UVwd1hc36HmJOlMbu8gFRt7y6gUnJs5bxnFju4+LNi3xEqedh/HZFbrkHa1O0zAxChu9+eaOGjcxVTFjpz3+HpE5zKmePZfDhWIHtb9uFUDbSEIzBWHHc0e23cwoAhe/dd5s9jp5sIvGHKGm5xpJJU9vwrJ9nGDDlqRKaXJ9BmMlbF5iaGOkl4uEfzMe5qbke75hisWBAO++Z5aUEFENfUDGDbX7a5E5MsggQe6h68Ab5ncgIQSFgB2h1kSDPnOF814Utllr2q4KxR5BDL4IJ5Udzde4iPDhPXwQ9VVEgaH/bvgW8UF+3ZJPirQiBop8oTz8nmVmQJCJ3fgUNJed1VJOuBhuXjDj09xDpEX23rGQQl2rtOFXBOeSbBKdGIgZtCfnNzUTaUj0206ucZuY+f8lI0qxjDFXljJKjU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(54906003)(2906002)(66574015)(83380400001)(8936002)(6636002)(66556008)(966005)(91956017)(37006003)(478600001)(53546011)(26005)(6512007)(122000001)(316002)(8676002)(71200400001)(86362001)(6486002)(64756008)(36756003)(186003)(2616005)(76116006)(66476007)(6506007)(66446008)(4744005)(66946007)(33656002)(6862004)(4326008)(5660300002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTI3dWx2aEVxUTdhVlJUN1l2TzlhTmQ4VWZyWXMrSE1peUNNc1QvdldETEZ6?=
 =?utf-8?B?MHgvcENCY2s3RFk3ZGlVQ0ZOVzNDb2xWZjVnTEFHNmwzeEZzQ0k1SlFuL0lB?=
 =?utf-8?B?WnRZTVdLeVNaakZEK0k2UVVZWDZIaVhFaWI4TytsQjkvbkU3bEtGVkdHVzNn?=
 =?utf-8?B?Y3Ivd0ExVWFtcjZjTVp4d3lvbTlmMWVRVWhwSjNPYngxckxreVlCL0dJemZo?=
 =?utf-8?B?TnNvQVhwWUhYamVMU0ZEVENoeUlPNVBwdWRsUHdRblcwYWQxR3A1WmlvTTJ4?=
 =?utf-8?B?Ry9iTjgzdml0aXJROGoyY3FCZGY3dGc3MndqaHRaVnFzeGRXSFFGLzBrVHQv?=
 =?utf-8?B?SlV3VytKYXRNSGgwU3VFY3N2YzdIRGpUQi9id0hSQ0MzNjExWmVONlU1Wkd6?=
 =?utf-8?B?VnhWUW5mWWxGMklkbU9pTkNRdjNBZ1ZiMlFXMnBkb1Awd1VPL3kzQmlIZHRh?=
 =?utf-8?B?cFJyUmJMRkorMmFPNGxib1NWQVVLQ1puenRNSklFNndFNkZ4SGNESlNtaHJh?=
 =?utf-8?B?Q1k5QVdYaXk0MzFxckJURzZ6REI3L2ZnQTJTWXpTc2lzVE1DaHF5RDB3dTRs?=
 =?utf-8?B?N0NlZWg3Yk9kL0pYTTRrdnZ6eVAvWnNQa2owZks3OXdXT0JXT0c2QVV0bE1v?=
 =?utf-8?B?RHFxYnhXWnVoLzM4amFGeUthYWdWeDdjU2ZrWDlBWU9aTkFRV3psMmU5Q2lk?=
 =?utf-8?B?cnMrQnB2ZmpGL1piNEFCenVhbGMzOEp6S0F6RzV5ZUN6Yjc1Mm1MbE5rOGQ4?=
 =?utf-8?B?RVFxdEw4VlJHc1JRSnNwWmVVRWNXY2wvRVF3d0xaTFZyUXJrK3FzQ1dJaUxJ?=
 =?utf-8?B?YkdFVG9MNWtydTI5T2ZxOG1MeUI5ZFNBTzd5TU1SWCtmOGtwWk85SlB1WlYv?=
 =?utf-8?B?Znl5aGpsVVZzTzZBWDMyVXZvUzZsMkRMc3ZNazVIMDN1cy8vT0FsNDRwbDFw?=
 =?utf-8?B?K0hTNFBYU21UOWZodlJpVXhZTUpaUXU0WEcwTTBla25GV3dKY2dTcWMyZXp2?=
 =?utf-8?B?VlVTOFBXZmZ2MStWWTZuWStaVjVmbXdRRUwza3FmblBpZDBBVS9GcUdrT1lr?=
 =?utf-8?B?OGNaeTNDWDhnekRHYlU5Vi9pU3VNcENvN081bDFDNWt6WWtKVTV4QmtlQ3FK?=
 =?utf-8?B?aHp6R1Fmb1M4SlFFSzI2bWZVSDA5czExb2drYkZ2bERRMjdPYmxWK2JvOUMr?=
 =?utf-8?B?NW5McWIvZGtjckV0REFJV0phYjRBTkY3M3ZFMFYwV1lOQmtxeVNBU2xUS3Yy?=
 =?utf-8?B?SW45WkJsMEF1UU03dTdKSitCdXJtQ3NFMnp5TlA0SlJXMkpTejJPcEV2cTE2?=
 =?utf-8?B?d0ROaXNPRXhSL0VGZnN2M3VkR0NIRkVuRzZBSjU3NE1ESmN5NDdGOVg3cWdM?=
 =?utf-8?B?VllZNTNSRnZHYW4rRExHSERGOUVTVkNlVzZIbFd3bGF4TUVGeWh2Tksrc1pT?=
 =?utf-8?B?RURMN0huYk1JR2phUHRXS0ZRcXd6b3pUYTZaL0FoQmI0cWUzTXJnaUN2WFBG?=
 =?utf-8?B?Q3QvVHFyRmh1aC9hRTl5QkR2UnBsekJ4MFJvR28vbFU5SkM1L2plSjQ0MUJY?=
 =?utf-8?B?UGFjVm52RlNWd3ZTVkJZNnR2QTEwY3RiZjNCMWpPdHBGclhyZzIxZDc2elFE?=
 =?utf-8?B?Q25qMFlxWUVIaHFsTVJGRU5CR2FMcEM0SStIYTlrekkrR0xpWWkxM05qVm0r?=
 =?utf-8?B?WEpWeTB0cXBXeXQ2c0FCTGc4aEVxUXEwM2lvVzdBaVFQdkNyRlF4cXZFTWRF?=
 =?utf-8?B?bUl4ZVg5czV5aTV3bldwdys2dmtvc3VWMndVOVlTOHBETFZoRS9keWZmbTRh?=
 =?utf-8?B?ejRhS283bXVTdWFyWlZ5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C53E1E0088E5A4080036368FC1C3DE7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e08d667-43ec-4429-f728-08d9325f8ad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 13:46:58.0693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwO14xe+Udv9qUSF8CBlkP9m5CVWYx2GEPqAG5OEc9ByRKYKPcaFeWsevN8LjNPwea2lzpOQG4IZlQo71lNwbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3655
X-OriginatorOrg: citrix.com

DQoNCj4gT24gMTggSnVuIDIwMjEsIGF0IDE0OjE3LCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDE4LzA2LzIwMjEgMTE6NDUsIEVkd2lu
IFTDtnLDtmsgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5j
dHJsX3N0dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPj4gaW5k
ZXggZDA1ZDdiYjMwZS4uNGEyMzBkZThiNyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybF9zdHVicy5jDQo+PiArKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0
cmxfc3R1YnMuYw0KPj4gQEAgLTM0LDYgKzM0LDkgQEANCj4+ICNpbmNsdWRlIDx4ZW5jdHJsLmg+
DQo+PiAjaW5jbHVkZSA8eGVuLXRvb2xzL2xpYnMuaD4NCj4+IA0KPj4gKyNpbmNsdWRlIDx4ZW4v
bGliL3g4Ni9jcHVpZC5oPg0KPj4gKyNpbmNsdWRlIDx4ZW4vbGliL3g4Ni9tc3IuaD4NCj4gDQo+
IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRjaGV3L3hlbi8tL2pvYnMvMTM1ODQw
MzQ5NQ0KPiANCj4gQ0kgc2F5cyBuby4gIFRoaXMgbmVlZHMgdG8gYmUgYmVoaW5kIGEgc3VpdGFi
bGUgaWZkZWYsIGZvciBub24teDg2IGJ1aWxkcy4NCg0KDQpTaG91bGQgdGhlIHN0dWJzIGJlIGRp
c2FibGVkIGNvbXBsZXRlbHkgYW5kIHJhaXNlIEVOT1NZUy9mYWlsd2l0aCBvbiBub24teDg2IChl
LmcuIEFSTSksIG9yIGFyZSB0aGVyZSBwbGFucyBvbiBkb2luZyBlcXVpdmFsZW50IENQVSBwb2xp
Y3kgb24gQVJNIGF0IHNvbWUgcG9pbnQ/DQoNCuKAlEVkd2luDQoNCj4gDQo+IChJJ3ZlIG5vdCBs
b29rZWQgYXQgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoIHlldC4gIEknbGwgZ2V0IGFyb3VuZCB0byBp
dCBhdA0KPiBzb21lIHBvaW50LikNCj4gDQo+IH5BbmRyZXcNCg0K

