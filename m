Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A131C98B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 12:18:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85497.160326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lByMX-00034q-LI; Tue, 16 Feb 2021 11:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85497.160326; Tue, 16 Feb 2021 11:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lByMX-00034T-H2; Tue, 16 Feb 2021 11:17:49 +0000
Received: by outflank-mailman (input) for mailman id 85497;
 Tue, 16 Feb 2021 11:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFEE=HS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lByMW-00034N-0o
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 11:17:48 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e20ea3a-92a4-4e46-8392-5a436c750d18;
 Tue, 16 Feb 2021 11:17:46 +0000 (UTC)
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
X-Inumbo-ID: 6e20ea3a-92a4-4e46-8392-5a436c750d18
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613474266;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zVHhheOKCyOgarTdRy6kcVMNKFqBQcaf5V00FWxK8Mo=;
  b=XDEZIY+k9Mk+SSrGEa1r29Z/fu/IhVLEjlrcCXtWiz/9PVBXtvfPdmSP
   eRGB4G6N7MttPyWRI3u7zW0IPf8kMURkidqs5twzv3ju8u8nEkeoVRGlx
   +cVAdONsd5HKuRlYAWv/3lcBEWAlrVao4qZ5qHpVcfkyMPuNmuc7u1L8r
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FEkv5wIWerMCN8bue7qtLzBiyBR4YQJ9rlmRi2H33Yw4HAXx+qmdcpCyCbyxkPPwFnVeyZpFGJ
 IGPyVzswd0et+oYXSDNeCLdKjTns66XW3en67xPVaUBNJUSY/9raUUy5JlbTEx9ePYXbVoHaZN
 VDgT+yV7XocfztrtYhL0luJUe+hXebqkVurivE6c3ziYlWkZQnFrrcQgwXo8bWIm0I6/zp6pP2
 9VAdgIk7L0mx3dGaOYrzGVR+XDemakqnVAugThw+x4jFtVZ5+oDw8KaHS8aI4XTxXvgxdymSm1
 AfY=
X-SBRS: 5.2
X-MesageID: 37312113
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,183,1610427600"; 
   d="scan'208";a="37312113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4gD5UAW1AHZzX1/gfcliolnJ4/1oDKojmqPUwzVz/wkky5ZsKlSK1Xpmcu0eAUrS7TmIcRToOYffKXKGvG7xR4JJYn2WoaMQtX1u6c4NXWfTvykoO9+/nmuWmjr/wa4w2Z6U3cbbWI1+Tpg9Bf8iPZfntayfNwl1lE1qv7okOZTpW2bgqj5y0VcugV4Ipn2bemb7x73vKrLTh5yc2TxOxI8kM7Uy7WKwFVoJcaZGStiWycYU3t3U1eLNhlJhbcQglJp4XfeTGrBY/6cvYANovNXs/QmWGvhzuivEmVr0zFQVtIGdCKdY+1WRYpIgKdJc9h6l4KRfHZRTnOWLHMRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVHhheOKCyOgarTdRy6kcVMNKFqBQcaf5V00FWxK8Mo=;
 b=oMHu9MR9ZR6Wrc/b7TOvbPILgfbOaMgSo5oH6xAgYvNJZdIvNaVFpHVK97Jxgv6d2nqtwKvMju0iQPKamyKxFvbAuxDcBMovcPH7fJaRcxeA6i10CzJYXFTtYoxeH3+rbsWcahWCr/l5xLYHS3YZJhcXQPccbUba3aAct7ecKAcgetSeoRa/KyP8jqJSRIlz9ALdH5iB3uGHNfOHEVH/IbDgY3w1HmhoKo52oWLd4BZit8zgBM0PKQBlYH5gg3A4TC/L9rqRdRB6i6OSBEETQr/Tc3IhCFq3lcngOtPCBNzT8Ycm0AINQGnaderUac2qSf71PUSB8EWULSX4cgBTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVHhheOKCyOgarTdRy6kcVMNKFqBQcaf5V00FWxK8Mo=;
 b=rmidaeOMivcCcBJb1qjdz4Eo6gsWIYKo+ugO0+j0/i+6HWSRXds6etqsuLUlYZDJydg44WecISUljLlI7ADgYF2NfIcIycBdm6mqN34Nm4w4RDzJxftLStBxco79Tgn8nH0Q77VK4gYXT8kFkKaaalvO32jcap7ajG5nxQjxiKQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Topic: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Index: AQHXBE6IzoDpW0Psi0SLnVWLvJvx9Kpam+MAgAAFtoCAAAB2AA==
Date: Tue, 16 Feb 2021 11:17:41 +0000
Message-ID: <E0E24EA5-CF14-45AA-8C0A-122F87051EC0@citrix.com>
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
 <c5eb64fc-a90b-6e28-bb0d-075e3a870299@xen.org>
 <E820CE9D-9671-4ED3-872E-3AECE21505AC@citrix.com>
In-Reply-To: <E820CE9D-9671-4ED3-872E-3AECE21505AC@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdf9687e-b470-491a-d838-08d8d26c7a26
x-ms-traffictypediagnostic: PH0PR03MB5893:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5893F86D22F0CAEB50D4AAC299879@PH0PR03MB5893.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yfp4hbBZwYshENAVB4MMvMIlh6uAUkrNfImJ2WAvBCnFeP71QR7Gux2IwV7rXbCd0HH7ulGfCqa+ez24FcaL53VYdQU3ujjqebUSTGFM8+iIHg1JtQgcdt0ZwaREJaNqObnteOc0n1+dFfEDbU1he67WO6SyPpDVy0z+vUPoOy+zEdVqVg9plALS0C2OPvaKX4izR2IRe4TKa/LfZjRM4X0HtXSLl7hGTcXFaadTCsACv2S4lEBlnustxPtSwleQn9ZnwdjS6LNCGzpCBRWpIZ/xHjXLMmRuK6e+fR3NvAMw31c0Qcy+K/TVhLxJoZjQtmTPqLqlt3OM2dNcKka6C+QqLywAmvxMu1D11B2XBPWDruGGIAWX6LK+25hz2s7DRq+li4TzlqYLedJp4g09sNO6sH75zf0WpPhxKbv9JcCGOa/X8AZW0ag1USb5qbKWcRuw3exiSmqkZ2ZxMxcX0SkPJIl/uv8xEXsIdS3r2juOzSz0EZQ53hx5v6dL+ROagFg0skzyF2d/Z/ask3CQfXwYADwERbgDf+ulnMCxH9BVoQ3b+VRTojZ48joFKF9uoyJi4iS2iX+9bIaUzccvMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(54906003)(8936002)(33656002)(5660300002)(83380400001)(6486002)(66556008)(6916009)(316002)(2616005)(2906002)(186003)(71200400001)(66946007)(86362001)(64756008)(76116006)(36756003)(66476007)(8676002)(6512007)(91956017)(66446008)(4326008)(478600001)(53546011)(26005)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZnBIdC9weE85RUVjcjJ5VDE1cU5paTBZNVFBNW9IU1cxMXMxdEZySjg3UXNK?=
 =?utf-8?B?UlhMY3B4RkVnbkhsTVp6ak9MbEV0MEFEdGFMNXQzMGU5UWRwa0d1cEVXQmYw?=
 =?utf-8?B?Z3UxVGRzR1NGWm1YS2ZrcnNzOTh4dDJSa3k4QnV3eEh0RllTRlFJTUlvclhm?=
 =?utf-8?B?aGtSNXlyQXZ2ay84T0VKNDBJOWtPVkpPdlpodTQzMzVqaVlDRk13Zi9McHRv?=
 =?utf-8?B?NzJHcm5LbzNrUXhSRGdKNFJVazJQanV2OGxDQ3pxcjk4RFJOYzBhbFpWMzl1?=
 =?utf-8?B?cU5xcmVzQ2RXZWcvbU5FVFlSZ0ZPS1BLdW9rdU5kU1hPRVAzVTd5UE9QMVdi?=
 =?utf-8?B?dTBUaGFSblRGVlFGTXVzajVWaHB3OTFsVnVUcGVjVzFQS2tNbmhKYUFhOEla?=
 =?utf-8?B?MkdkUlNjRGNuM0VFQ3c4MFJmWWdRbXNWNjNkYUZOa2pUZit2Ly9JSnd3Mkhz?=
 =?utf-8?B?Q3I2RlNUZmhtQTdoYlpQejN4b1N0U3Z3WTh0Y1FUNndVaHkzbXJHVTV5YTlM?=
 =?utf-8?B?ZVpOSVBzWWV1MnZOVVgyQVFyelJFaDkvcFFhS1pReEI3RWZZS01hL2ZhZWhC?=
 =?utf-8?B?OWtvSVRZa0Y0NnM0Vkc3ZHhGWEtFaWNqSVhSNDVOdTl5S25jL2VuSlBYaHpP?=
 =?utf-8?B?ZERlM3Y4cCtaZjFQVnZXbFFOdWkzVVBwYTR6M3VEdXdtZk90OHQ1SE5XcnJv?=
 =?utf-8?B?ajlzaWFmaGhNNkJVWW1kU0phVDJXMjJ1QldlblQxRUdDODRnOEk1OFNsbHcw?=
 =?utf-8?B?VXRZSi8xSCtNZzJVcGpQM1VHdzNaS2JtcUExRGNDdjBYUFRmdmxUY0FzR254?=
 =?utf-8?B?QVhOR09WclRSdmJKODYxQ00ycTdibGZkZ1kybmRXK1BPNVQ5UlZLSXFlNmJi?=
 =?utf-8?B?V0xWRXJ0VVdQcmE1dFVMVXIrUGczY2Y0Wm1Pb2EzRmdQYkNFNWFTbk5MNnhK?=
 =?utf-8?B?ZUxwZTI5RWJES0htbU9MN3F1VkhlTnU3NERWdWJ2bzVmaFVuYjJkWWNDMHEw?=
 =?utf-8?B?Y0tsUHZvemhPcXJzUmVBMXk2SERJdGJpTG42Q3g3dStkUkJNYWZtQzV0ekk2?=
 =?utf-8?B?Rmh4Uk1hOHNFU3JSRG93VlFjckU0d1lLcFlyV3lDTjROcmJ6bDJ2Vms3V1kv?=
 =?utf-8?B?cHVvTUJ0emk4SlgzZW5qKyt2ZHFxNWpETm1HL0sycWJtUk5WZTdTczREeUtx?=
 =?utf-8?B?dTNzbUx0YnQyN0YvMDRDRFI3MlpxRU80aEQvcDVoU212TUJBaFZ4NDNJMGJh?=
 =?utf-8?B?NHJ3Ry9lRktPQ3VkV1dGbGNBUjZZZU8vMWpobWlBR1hmOGJxbVFvQ2gva1BG?=
 =?utf-8?B?eTNwa3B2TUF3Mzd3MGRLWU14UDN3c3FMbG1SQ0dCS1ZZYkJxRDBrTTZ0eEEw?=
 =?utf-8?B?Vi9weE52OUNIWFhnVzFqY2s2cGdsK2Npc0h1R3lFeVRUNDlnVzE1WUlHb3p6?=
 =?utf-8?B?M2tLR05samZkWDZPdG80UzVNalRhdGNCUFhWRWZGMS9JMHFzYjJCa0FlMHZS?=
 =?utf-8?B?aDJqdCtUQUE0ODE4OUtST2JMRi9Od1ZySndQRWVBOFovd0NXNjhMc0hoNVg0?=
 =?utf-8?B?ZjF0Ymxuc29QcWRmbDZOZmh3QTQwdXlWeENhbkN2S1BtNEtMaGkyNXo3VUxi?=
 =?utf-8?B?Um1YSFdGNnh3NWdySC9mVWJmdVhxS05hbHpxQ05rdnkxOE9pdUdBWEdlZFNk?=
 =?utf-8?B?Q0lYYW4wZjlsN2hQZC83OTQzb2MybGowOWdCSXc0c2FnNGc1S2pubU8zMWZu?=
 =?utf-8?B?d0NsQ1FsYjZURHc3MW5XRXVnZ1lEK1R6a2ljSFBVdEFLWTQrVys5SzEzeTJH?=
 =?utf-8?B?SVhqMHBsUklQNGlyMVovZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5378BE6D9F446B4097B29C427759F275@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf9687e-b470-491a-d838-08d8d26c7a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2021 11:17:41.9437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCU5XUEByvDnv3FjD++16sX3Gs1ALZ3mzLKT4JbwBNE5v3sepavMVZV73O4ZdNl4KM0iQWe0z6Qxeggb/sLEm0HVJqtdq+gtBdBQUZJOuJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5893
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDE2LCAyMDIxLCBhdCAxMToxNiBBTSwgR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIEZlYiAxNiwgMjAy
MSwgYXQgMTA6NTUgQU0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4g
DQo+PiBIaSBHZW9yZ2UsDQo+PiANCj4+IE9uIDE2LzAyLzIwMjEgMTA6MjgsIEdlb3JnZSBEdW5s
YXAgd3JvdGU6DQo+Pj4gRG9jdW1lbnQgdGhlIHByb3BlcnRpZXMgb2YgdGhlIHZhcmlvdXMgYWxs
b2NhdG9ycyBhbmQgbGF5IG91dCBhIGNsZWFyDQo+Pj4gcnVicmljIGZvciB3aGVuIHRvIHVzZSBl
YWNoLg0KPj4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT4NCj4+PiAtLS0NCj4+PiBUaGlzIGRvYyBpcyBteSB1bmRlcnN0YW5kaW5nIG9mIHRo
ZSBwcm9wZXJ0aWVzIG9mIHRoZSBjdXJyZW50DQo+Pj4gYWxsb2NhdG9ycyAoYWxsb2NfeGVuaGVh
cF9wYWdlcywgeG1hbGxvYywgYW5kIHZtYWxsb2MpLCBhbmQgb2YgSmFuJ3MNCj4+PiBwcm9wb3Nl
ZCBuZXcgd3JhcHBlciwgeHZtYWxsb2MuDQo+Pj4geG1hbGxvYywgdm1hbGxvYywgYW5kIHh2bWFs
bG9jIHdlcmUgZGVzaWduZWQgbW9yZSBvciBsZXNzIHRvIG1pcnJvcg0KPj4+IHNpbWlsYXIgZnVu
Y3Rpb25zIGluIExpbnV4IChrbWFsbG9jLCB2bWFsbG9jLCBhbmQga3ZtYWxsb2MNCj4+PiByZXNw
ZWN0aXZlbHkpLg0KPj4+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KPj4+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gQ0M6IFJv
Z2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4gQ0M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+PiBDQzogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4+PiAtLS0NCj4+PiAuLi4vbWVtb3J5LWFsbG9jYXRpb24tZnVuY3Rp
b25zLnJzdCAgICAgICAgICAgfCAxMTggKysrKysrKysrKysrKysrKysrDQo+Pj4gMSBmaWxlIGNo
YW5nZWQsIDExOCBpbnNlcnRpb25zKCspDQo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvaHlw
ZXJ2aXNvci1ndWlkZS9tZW1vcnktYWxsb2NhdGlvbi1mdW5jdGlvbnMucnN0DQo+Pj4gZGlmZiAt
LWdpdCBhL2RvY3MvaHlwZXJ2aXNvci1ndWlkZS9tZW1vcnktYWxsb2NhdGlvbi1mdW5jdGlvbnMu
cnN0IGIvZG9jcy9oeXBlcnZpc29yLWd1aWRlL21lbW9yeS1hbGxvY2F0aW9uLWZ1bmN0aW9ucy5y
c3QNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAwMDAwMDAuLjE1YWEy
YTFhNjUNCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvZG9jcy9oeXBlcnZpc29yLWd1aWRl
L21lbW9yeS1hbGxvY2F0aW9uLWZ1bmN0aW9ucy5yc3QNCj4+PiBAQCAtMCwwICsxLDExOCBAQA0K
Pj4+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQ0MtQlktNC4wDQo+Pj4gKw0KPj4+ICtY
ZW5oZWFwIG1lbW9yeSBhbGxvY2F0aW9uIGZ1bmN0aW9ucw0KPj4+ICs9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KPj4+ICsNCj4+PiArSW4gZ2VuZXJhbCBYZW4gY29udGFpbnMg
dHdvIHBvb2xzIChvciAiaGVhcHMiKSBvZiBtZW1vcnk6IHRoZSAqeGVuDQo+Pj4gK2hlYXAqIGFu
ZCB0aGUgKmRvbSBoZWFwKi4gIFBsZWFzZSBzZWUgdGhlIGNvbW1lbnQgYXQgdGhlIHRvcCBvZg0K
Pj4+ICtgYHhlbi9jb21tb24vcGFnZV9hbGxvYy5jYGAgZm9yIHRoZSBjYW5vbmljYWwgZXhwbGFu
YXRpb24uDQo+Pj4gKw0KPj4+ICtUaGlzIGRvY3VtZW50IGRlc2NyaWJlcyB0aGUgdmFyaW91cyBm
dW5jdGlvbnMgYXZhaWxhYmxlIHRvIGFsbG9jYXRlDQo+Pj4gK21lbW9yeSBmcm9tIHRoZSB4ZW4g
aGVhcDogdGhlaXIgcHJvcGVydGllcyBhbmQgcnVsZXMgZm9yIHdoZW4gdGhleSBzaG91bGQgYmUN
Cj4+PiArdXNlZC4NCj4+PiArDQo+Pj4gKw0KPj4+ICtUTERSIGd1aWRlbGluZXMNCj4+PiArLS0t
LS0tLS0tLS0tLS0tDQo+Pj4gKw0KPj4+ICsqIEJ5IGRlZmF1bHQsIGBgeHZtYWxsb2NgYCAob3Ig
aXRzIGhlbHBlciBjb2duYXRlcykgc2hvdWxkIGJlIHVzZWQNCj4+PiArICB1bmxlc3MgeW91IGtu
b3cgeW91IGhhdmUgc3BlY2lmaWMgcHJvcGVydGllcyB0aGF0IG5lZWQgdG8gYmUgbWV0Lg0KPj4+
ICsNCj4+PiArKiBJZiB5b3UgbmVlZCBtZW1vcnkgd2hpY2ggbmVlZHMgdG8gYmUgcGh5c2ljYWxs
eSBjb250aWd1b3VzLCBhbmQgbWF5DQo+Pj4gKyAgYmUgbGFyZ2VyIHRoYW4gYGBQQUdFX1NJWkVg
YC4uLg0KPj4+ICsNCj4+PiArICAtIC4uLmFuZCBpcyBvcmRlciAyLCB1c2UgYGBhbGxvY194ZW5o
ZWFwX3BhZ2VzYGAuDQo+Pj4gKw0KPj4+ICsgIC0gLi4uYW5kIGlzIG5vdCBvcmRlciAyLCB1c2Ug
YGB4bWFsbG9jYGAgKG9yIGl0cyBoZWxwZXIgY29nbmF0ZXMpLi4NCj4+PiArDQo+Pj4gKyogSWYg
eW91IGRvbid0IG5lZWQgbWVtb3J5IHRvIGJlIHBoeXNpY2FsbHkgY29udGlndW91cywgYW5kIGtu
b3cgdGhlDQo+Pj4gKyAgYWxsb2NhdGlvbiB3aWxsIGFsd2F5cyBiZSBsYXJnZXIgdGhhbiBgYFBB
R0VfU0laRWBgLCB5b3UgbWF5IHVzZQ0KPj4+ICsgIGBgdm1hbGxvY2BgIChvciBvbmUgb2YgaXRz
IGhlbHBlciBjb2duYXRlcykuDQo+Pj4gKw0KPj4+ICsqIElmIHlvdSBrbm93IHRoYXQgYWxsb2Nh
dGlvbiB3aWxsIGFsd2F5cyBiZSBsZXNzIHRoYW4gYGBQQUdFX1NJWkVgYCwNCj4+PiArICB5b3Ug
bWF5IHVzZSBgYHhtYWxsb2NgYC4NCj4+IA0KPj4gQUZBSUNULCB0aGUgZGV0ZXJtaW5pbmcgZmFj
dG9yIGlzIFBBR0VfU0laRS4gVGhpcyBpcyBhIHNpbmdsZSBpcyBhIHNpbmdsZSB2YWx1ZSBvbiB4
ODYgKGUuZy4gNEtCKSBidXQgb24gb3RoZXIgYXJjaGl0ZWN0dXJlIHRoaXMgbWF5IGJlIG11bHRp
cGxlIHZhbHVlcy4NCj4+IA0KPj4gRm9yIGluc3RhbmNlLCBvbiBBcm0sIHRoaXMgY291bGQgYmUg
NEtCLCAxNktCLCA2NEtCIChub3RlIHRoYXQgb25seSB0aGUgZm9ybWVyIGlzIHNvIGZhciBzdXBw
b3J0ZWQgb24gWGVuKS4NCj4+IA0KPj4gRm9yIEFybSBhbmQgY29tbW9uIGNvZGUsIGl0IGZlZWxz
IHRvIG1lIHdlIGNhbid0IG1ha2UgYSBjbGVhciBkZWNpc2lvbiBiYXNlZCBvbiBQQUdFX1NJWkUu
IEluc3RlYWQsIEkgY29udGludWUgdG8gdGhpbmsgdGhhdCB0aGUgZGVjaXNpb24gc2hvdWxkIG9u
bHkgYmUgYmFzZWQgb24gcGh5c2ljYWwgdnMgdmlydHVhbGx5IGNvbnRpZ3VvdXMuDQo+PiANCj4+
IFdlIGNhbiB0aGVuIGFkZCBmdXJ0aGVyIHJ1bGVzIGZvciB4ODYgc3BlY2lmaWMgY29kZSBpZiB0
aGUgbWFpbnRhaW5lcnMgd2FudC4NCj4gDQo+IFNvcnJ5IG15IHNlY29uZCBtYWlsIHdhcyBzb21l
d2hhdCBkZWxheWVkIOKAlCBteSBpbnRlbnQgd2FzOiAxKSBwb3N0IHRoZSBkb2N1bWVudCBJ4oCZ
ZCBhZ3JlZWQgdG8gd3JpdGUsIDIpIHNheSB3aHkgSSB0aGluayB0aGUgcHJvcG9zYWwgaXMgYSBi
YWQgaWRlYS4gOi0pDQo+IA0KPiBSZSBwYWdlIHNpemUg4oCUIHRoZSB2YXN0IG1ham9yaXR5IG9m
IHRpbWUgd2XigJlyZSB0YWxraW5nIOKAnGtub3dpbmfigJ0gdGhhdCB0aGUgc2l6ZSBpcyBsZXNz
IHRoYW4gNGsuICBJZiB3ZeKAmXJlIGNvbmZpZGVudCB0aGF0IG5vIGFyY2hpdGVjdHVyZSB3aWxs
IGV2ZXIgaGF2ZSBhIHBhZ2Ugc2l6ZSBsZXNzIHRoYW4gNGssIHRoZW4gd2Uga25vdyB0aGF0IGFs
bCBhbGxvY2F0aW9ucyBsZXNzIHRoYW4gNGsgd2lsbCBhbHdheXMgYmUgbGVzcyB0aGFuIFBBR0Vf
U0laRS4gIE9idmlvdXNseSBsYXJnZXIgcGFnZSBzaXplcyB0aGVuIGJlY29tZXMgYW4gaXNzdWUu
DQo+IA0KPiBCdXQgaW4gYW55IGNhc2Ug4oCUIHVubGVzcyB3ZSBoYXZlIEJVR19PTihzaXplID4g
UEFHRV9TSVpFKSwgd2XigJlyZSBnb2luZyB0byBoYXZlIHRvIGhhdmUgYSBmYWxsYmFjaywgd2hp
Y2ggaXMgZ29pbmcgdG8gY29zdCBvbmUgcHJlY2lvdXMgY29uZGl0aW9uYWwsIG1ha2luZyB0aGUg
d2hvbGUgZXhlcmNpc2UgcG9pbnRsZXNzLg0KDQpFciwganVzdCBpbiBjYXNlIGl0IHdhc27igJl0
IGNsZWFyIOKAlCBJIGFncmVlIHdpdGggdGhpczoNCg0KPj4gSSBjb250aW51ZSB0byB0aGluayB0
aGF0IHRoZSBkZWNpc2lvbiBzaG91bGQgb25seSBiZSBiYXNlZCBvbiBwaHlzaWNhbCB2cyB2aXJ0
dWFsbHkgY29udGlndW91cy4NCg0KDQogLUdlb3JnZQ==

