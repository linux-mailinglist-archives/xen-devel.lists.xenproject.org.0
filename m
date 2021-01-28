Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C561530818F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 23:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77492.140373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5GDM-0004aw-U7; Thu, 28 Jan 2021 22:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77492.140373; Thu, 28 Jan 2021 22:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5GDM-0004aX-Qd; Thu, 28 Jan 2021 22:56:36 +0000
Received: by outflank-mailman (input) for mailman id 77492;
 Thu, 28 Jan 2021 22:56:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oM/R=G7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l5GDL-0004aB-66
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 22:56:35 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c9ce3b9-bf34-4c3f-9ea5-31644c708505;
 Thu, 28 Jan 2021 22:56:33 +0000 (UTC)
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
X-Inumbo-ID: 5c9ce3b9-bf34-4c3f-9ea5-31644c708505
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611874593;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bVJm24GNRGiLDJsySIQpJE1+emgBYdDnzk3xLDFhf5g=;
  b=DCS5f9pwIRY61mMDsx13U3umhmIDAp8sW0A5nQ/5siNtG9Ta0erxPwMF
   Kxtl0hBAwkdm6vLbZ2FcJlRYgLzdk9DvGqPkC9BL0pDHvAm80Ay5pWDg4
   Pg8wIXu27JTgtT0uOrgE288qyKVFFwkChUg2CzjywfSMwRiK/BKm+jiJR
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BW0qtozWtXA9KC8RaMAgloGzoX/qZYFDncK5YIjaLvaVIHwczmTH8aOTZdRltvTe4KML11vV+7
 GFui53FquKOhJ/jIE1+41Rec/4/wNrMHioPpMj2Bs2aESj9HLY3UW8zKY9uB0sP/9DBvNNEpFb
 5u5r/fSthbXmLTNUhnh3ongleMyYpbDaTC0iWWZEqccMmM8tjORzfOQkhSjdPb3QjihG/Njghf
 FLYk5kpzq32IE05PDuF3L81IK8NZnXv5119G/M59Pays0sv9XixT1DS11cvIk0ryb0BHxi/fPK
 jps=
X-SBRS: 5.2
X-MesageID: 36486473
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,383,1602561600"; 
   d="scan'208";a="36486473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cma5WynCHAb7y0d8EmIDaCVegXnpzWWazzQbEeGz8D9zsLH0PE5v0hDcxGuYK04AYR1U0J30Vn6M0XPKTYdtcanEP9ITdDpWpIMHn6kH4uCFzx6YX8R10tMg5o4Ly1FgbksTOrAct1udIFqJxmwLm90ZkRUp5TibeTRckB7cfbPCDwacBNUnVN4Rct7aqGvZWjDWhhDbRtW0UrbiTDW0sfX5+s4X36pnRX8cUqTfGCrM8hdMqj5NYJjRvt7haB4SFOxWzLTCOrMmRGoNNUx89/XHjYqLEV+A5zYFq252A/f87P91nqbCVTR1YPzRsow1poV/dYZFtAX5ivqn6syWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVJm24GNRGiLDJsySIQpJE1+emgBYdDnzk3xLDFhf5g=;
 b=FxPi5OSDYVDfO+ZRXZFLd9UClx71UzCEkF4Gh/07fZBJ1coovfUU3/mx/Puoo1bfhhMrqivtMK7Y01R8C3VJo3/R9M6cTgFU4KargkHUzAkBbL7KO0WUi9dGJ2rNemc7zdnXJcR6SmwzdSeHxtRd/lMLn97EX8s9RRCAhtwlhc3DrPnSgT/GyAjan6REmyVkffwZLoBZerUZcdokoFeAzgyL5TlIKMw5iS5QfSoRD5X2sBSYbGA2FNQgMCZWeGXU0TXgAChioYVgXCrqi1qas5XZNftKROZU+3bxo0IPzXfAccU7JR4O7iaaWQMYerspR8ImJ7Jvh+WCkymO5HB4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVJm24GNRGiLDJsySIQpJE1+emgBYdDnzk3xLDFhf5g=;
 b=gY+x+R+naEV7UGGtyy+Q3Yeo3tImsJCM77iCsaJicnu9sI959genWMzO190OApPQSWBu/mQUkuk9mzXgJniiOIhlAmf+M/bFWxsqQ02baxyDYPegGUuznZqUx/R6mHG66muNT82txLacegdiYumKdfLS1gCBIkoULQRxsdnbpQQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Topic: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Index: AQHW8qXhfghyfjZCb0iw2DUJHGLmxKo4G2OAgACDU4CAASMUgIAAcJSAgAELJICAAK7PgIAADiAAgAAXqgCAAMbHgIAAiAKAgABHgwCAAAPrgA==
Date: Thu, 28 Jan 2021 22:56:28 +0000
Message-ID: <26680EFB-29DE-4221-9E8C-3E2FEB0E0C3D@citrix.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
 <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
 <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
 <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
In-Reply-To: <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb9f0b1d-cccb-4adf-9af1-08d8c3dff244
x-ms-traffictypediagnostic: PH0PR03MB5798:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5798BB9555666DF74B9F9E6299BA9@PH0PR03MB5798.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwM8adrCtjOA6L3Sl6lP17bciz8SbZHCQc+RuMOihaSNNpbiUjj8ykBDZNCJEJAxOQU0Zz6ERJWu+QOvpVtDvhgVK4MpaiWls6Ez7rzogcefKKF50ojU7HiPk0i7G8KNemCfUM9h6pPPpxA8slIKSvUWOnCODKBMndJA0LW5UISZjbIkoZe51O9yYAj85AcOMhHaksAg8/wMSy/2voOaY6AoxPy8a9PpOt7kwUKMSQ52leJI/veoz1Qa5mYbHGqlF5CzHUE4hFdktDNYz5Ws+HSgs4TgnePzdoDLPvNdAv4WcNHcwURmcydPT7Qgamd+CFPviOXo5BamctJDWSLUce9AX9RmoGpr07nx4IF4biHQnJbWEeqnWZVL7fPWFuYrkg/k9Ok1ONcTLpDxttzr5MI+rncU/x2YzIO98x2VjxDz2IAggOMJluECnewINQ4OQvass4RnTrQ8sVhycTDtOfhNvckqkOylFK5nu/9xewMDWXALWhqteXwTJXAYp+2xn5eJBvdH6zq4DV5gdPCvnYJuDeSpEjZ+cafwN3Z17RIU9yaoiiiQHbDKH6wyCFODiDmztXBodNhmqoksZcyWcw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(6486002)(316002)(8676002)(86362001)(2906002)(107886003)(6512007)(54906003)(5660300002)(33656002)(478600001)(36756003)(83380400001)(66946007)(6506007)(66446008)(76116006)(64756008)(91956017)(2616005)(53546011)(26005)(186003)(71200400001)(66476007)(66556008)(8936002)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QTJWS3pjSlJLeTFFVWpZRWZ1U0hJMkdsakpWcUZCRTNjSVRKdmVaQjJjTmxV?=
 =?utf-8?B?SVE5NndzdEhMY3JGVG1CZ1NDMzFVemwxNllqSW9RRmlDUnBxaE1rSWNnSzl2?=
 =?utf-8?B?ZkF5Z2l1dWIrc0xPSFJRci80RkJEVUdwaEowMW5YTjJYeG11ZVB4ZzU3cnZS?=
 =?utf-8?B?VDVBUnRWQWRtZ3BTeDVDYVB3cDBqa3JRWm15ZjRFWW10QytlMVhzNHo4dXZD?=
 =?utf-8?B?ZHNyL1BUUlhvdTlSOU9Ccms5WUtPY1Q0WmhGWHNFM010NFpoc3BUbDVUYVNF?=
 =?utf-8?B?U3NHdDVLa1FpTWlYUm5RUzBWWFd0bjRlVmZUODhSVjl3U3VUbWh2QXZ0YXpr?=
 =?utf-8?B?SGRtQjBCWFczTzhadzd4Z0FWcExKRUJIS3ZZWjNXL2x1UkFGcWpKQTF4dlkz?=
 =?utf-8?B?UjU2OWVtRHVyVng1WDlnOWIyWldnQThGM29zSFoyWGJaNmc1ZGdPcnlyTjVm?=
 =?utf-8?B?RjV4NDkzRXFXdjhhLzJFQkRZV1VEU09kT25TRjdYZHd3VVJ6UG9WMGppRk9Q?=
 =?utf-8?B?M2FXSDdndkxBSjM2QnA4TzNXbnJiTmdKY2liUThCdUFza0t4d0EyVEFtSnVI?=
 =?utf-8?B?TGpsSndUU1NvbzFSVmVOTHhPNlNXcDVMaThnVVNKT0dmMVRQbTNCN3FDeG8z?=
 =?utf-8?B?aUNQUHNNQ3ZpbnRuczdnWFk2RS9wSG8xR2tUZE9SeGxiMllUR1JGVDRGbjNN?=
 =?utf-8?B?dThlUm1ieExlSEtCR2MxSTU2akd2cmdKbXg1NFRneFhReEVRQ3RFbUVILzR4?=
 =?utf-8?B?bW9jMXpWUjlUOEovQnJpR3JhT053c2drblpHazJ6bngrQjNva2ZVbHBjN2R1?=
 =?utf-8?B?dUhTa3pUcFFjN2kyNXYzVTFDcDh4YktWZDZWcjdvSEIrVGhQZ3BYNkJXTTI1?=
 =?utf-8?B?UkFJYmVRODBuNDZnWXJaemJqdnpUQ05YWEtGbDNiYVNGbE5WREdZZk5IcVIw?=
 =?utf-8?B?ZGFqT01jdDZwZ1JwUUZvZktoRzI0eW1KbUpJL0hiUjBtMFN5dWdZVnpmLzJ6?=
 =?utf-8?B?NlhhZ3E4cU1QK01tbzZUZG0zbFR2QTdURmc4cUUyZ2NnaDBpbDhHSDM1ZS9t?=
 =?utf-8?B?ODJMV0JjL1Q0WU1LZ1RXc05PZ1BRek90L2QyN0pCeDNENGJpQWlQUGp0b3kr?=
 =?utf-8?B?VlcyNS9zcDU5alh5YlhVTTAxaEtvd202OU9aMFZHVW9kLzZZWXo1anFKTzRo?=
 =?utf-8?B?Lzc3NHd2VEt2RXNTd0xtU29Pakx3WXNxV29KUTV6Qlp0eUEvZWt0emwzSlNW?=
 =?utf-8?B?K0NzbUJYVVBqLzVkZlh1ZkVzaU83Q0tDR0pleGEyNTlDWTNVQ3dDM2YrYnhB?=
 =?utf-8?B?UzFvSE9kTDVKTGtDUzVVaytuSFFEWTl1djlpaGEwOXhxMG1nMXJMMVU2enFG?=
 =?utf-8?B?NjREQXZTWkZHd3NKeXpmUE5Fenp6NFM5TEZSRzlsaUFZRm4wSjRMVHZsMGdL?=
 =?utf-8?B?MDZzdkYwK1R5NkFGV3VMa1RqblJCdXErOVJCWml3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F82EBC8954EF8F4D935296B6D48544FF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9f0b1d-cccb-4adf-9af1-08d8c3dff244
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 22:56:28.1346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3Cdgn2OiV7rznRD5wHXMWvvwg+rjdsPw2Fbh5qlnqCqLhHhn7Di85C0zFtcA2DSwYmWH1Ms1v5nT/oj+afYsLqXQcWIAC5IZCcIVNL6lSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5798
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSmFuIDI4LCAyMDIxLCBhdCAxMDo0MiBQTSwgR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIEphbiAyOCwgMjAy
MSwgYXQgNjoyNiBQTSwgRWxsaW90dCBNaXRjaGVsbCA8ZWhlbSt4ZW5AbTVwLmNvbT4gd3JvdGU6
DQo+PiANCj4+IE9uIFRodSwgSmFuIDI4LCAyMDIxIGF0IDExOjE5OjQxQU0gKzAxMDAsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI3LjAxLjIwMjEgMjM6MjgsIEVsbGlvdHQgTWl0Y2hlbGwg
d3JvdGU6DQo+Pj4+IE9uIFdlZCwgSmFuIDI3LCAyMDIxIGF0IDA5OjAzOjMyUE0gKzAwMDAsIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+PiBTby4/PyBXaGF0ICpzaG91bGQqIGhhcHBlbiBpcyB0
aGF0IGlmIFFFTVUvT1ZNRiBkaXJ0aWVzIG1vcmUgbWVtb3J5IHRoYW4NCj4+Pj4+IGV4aXN0cyBp
biB0aGUgUG9EIGNhY2hlLCB0aGUgZG9tYWluIGdldHMgdGVybWluYXRlZC4NCj4+Pj4+IA0KPj4+
Pj4gSXJyZXNwZWN0aXZlLCBYZW4vZG9tMCBkeWluZyBpc24ndCBhbiBleHBlY3RlZCBjb25zZXF1
ZW5jZSBvZiBhbnkgbm9ybWFsDQo+Pj4+PiBhY3Rpb24gbGlrZSB0aGlzLg0KPj4+Pj4gDQo+Pj4+
PiBEbyB5b3UgaGF2ZSBhIHNlcmlhbCBsb2cgb2YgdGhlIGNyYXNoPz8/IElmIG5vdCwgY2FuIHlv
dSBzZXQgdXAgYSBjcmFzaA0KPj4+Pj4ga2VybmVsIGVudmlyb25tZW50IHRvIGNhcHR1cmUgdGhl
IGxvZ3MsIG9yIGFsdGVybmF0aXZlbHkgcmVwcm9kdWNlIHRoZQ0KPj4+Pj4gaXNzdWUgb24gYSBk
aWZmZXJlbnQgYm94IHdoaWNoIGRvZXMgaGF2ZSBzZXJpYWw/DQo+Pj4+IA0KPj4+PiBObywgSSBk
b24ndC4gIEknbSBzZXR1cCB0byBkZWJ1ZyBBUk0gZmFpbHVyZXMsIG5vdCB4ODYgb25lcy4NCj4+
PiANCj4+PiBUaGVuIGFsdGVybmF0aXZlbHkgY2FuIHlvdSBhdCBsZWFzdCBnaXZlIGNvbmRpdGlv
bnMgdGhhdCBuZWVkIHRvDQo+Pj4gYmUgbWV0IHRvIG9ic2VydmUgdGhlIHByb2JsZW0sIGZvciBz
b21lb25lIHRvIHJlcHJvIGFuZCB0aGVuDQo+Pj4gZGVidWc/IChUaGUgbGVzcyBjb21wbGV4IHRo
ZSBiZXR0ZXIsIG9mIGNvdXJzZS4pDQo+PiANCj4+IE11bHRpcGxlIHByaW9yIG1lc3NhZ2VzIGhh
dmUgaW5jbHVkZWQgc3RhdGVtZW50cyBvZiB3aGF0IEkgYmVsaWV2ZWQgdG8gYmUNCj4+IHRoZSBt
aW5pbWFsIGNhc2UgdG8gcmVwcm9kdWNlLiAgUHJlc2VudGx5IEkgYmVsaWV2ZSB0aGUgbWluaW1h
bA0KPj4gY29uc3RyYWludHMgYXJlLCBtYXhtZW0gPj0gaG9zdCBtZW1vcnksIG1lbW9yeSA8IGZy
ZWUgWGVuIG1lbW9yeSwgdHlwZQ0KPj4gSFZNLiAgQSBtaW5pbWFsIGtyNDVobWUuY2ZnIGZpbGU6
DQo+PiANCj4+IHR5cGUgPSAiaHZtIg0KPj4gbWVtb3J5ID0gMTAyNA0KPj4gbWF4bWVtID0gMTA3
Mzc0MTgyNA0KPj4gDQo+PiBJIHN1c3BlY3QgbWF4bWVtID4gZnJlZSBYZW4gbWVtb3J5IG1heSBi
ZSBzdWZmaWNpZW50LiAgVGhlIGluc3RhbmNlcyBJDQo+PiBjYW4gYmUgY2VydGFpbiBvZiBoYXZl
IGJlZW4gbWF4bWVtID0gdG90YWwgaG9zdCBtZW1vcnkgKjcuDQo+IA0KPiBDYW4geW91IGluY2x1
ZGUgeW91ciBYZW4gdmVyc2lvbiBhbmQgZG9tMCBjb21tYW5kLWxpbmU/DQo+IA0KPiBGb3IgbWUs
IGRvbWFpbiBjcmVhdGlvbiBmYWlscyB3aXRoIGFuIGVycm9yIGxpa2UgdGhpczoNCj4gDQo+IHJv
b3RAaW1tb3J0YWw6L2ltYWdlcyMgeGwgY3JlYXRlIGM2LTAxLmNmZyBtYXhtZW09MTA3Mzc0MTgy
NA0KPiBQYXJzaW5nIGNvbmZpZyBmcm9tIGM2LTAxLmNmZw0KPiB4YzogZXJyb3I6IHBhbmljOiB4
Y19kb21fYm9vdC5jOjEyMDogeGNfZG9tX2Jvb3RfbWVtX2luaXQ6IGNhbid0IGFsbG9jYXRlIGxv
dyBtZW1vcnkgZm9yIGRvbWFpbjogT3V0IG9mIG1lbW9yeQ0KPiBsaWJ4bDogZXJyb3I6IGxpYnhs
X2RvbS5jOjU5MzpsaWJ4bF9fYnVpbGRfZG9tOiB4Y19kb21fYm9vdF9tZW1faW5pdCBmYWlsZWQ6
IENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkNCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzox
NTc2OmRvbWNyZWF0ZV9yZWJ1aWxkX2RvbmU6IERvbWFpbiA5OmNhbm5vdCAocmUtKWJ1aWxkIGRv
bWFpbjogLTMNCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMTgyOmxpYnhsX19kZXN0
cm95X2RvbWlkOiBEb21haW4gOTpOb24tZXhpc3RhbnQgZG9tYWluDQo+IGxpYnhsOiBlcnJvcjog
bGlieGxfZG9tYWluLmM6MTEzNjpkb21haW5fZGVzdHJveV9jYWxsYmFjazogRG9tYWluIDk6VW5h
YmxlIHRvIGRlc3Ryb3kgZ3Vlc3QNCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMDYz
OmRvbWFpbl9kZXN0cm95X2NiOiBEb21haW4gOTpEZXN0cnVjdGlvbiBvZiBkb21haW4gZmFpbGVk
DQo+IA0KPiBUaGlzIGlzIG9uIHN0YWdpbmctNC4xNCBmcm9tIGEgbW9udGggb3IgdHdvIGFnbyAo
aS5lLiwgd2hhdCBJIGhhcHBlbmVkIHRvIGhhdmUgb24gYSByYW5kb20gdGVzdCAgYm94KSwgYW5k
IGBkb20wX21lbT0xMDI0TSxtYXg6MTAyNE1gIGluIG15IGNvbW1hbmQtbGluZS4gIFRoYXQgcnVu
ZSB3aWxsIGdpdmUgZG9tMCBvbmx5IDFHaUIgb2YgUkFNLCBidXQgYWxzbyBwcmV2ZW50IGl0IGZy
b20gYXV0by1iYWxsb29uaW5nIGRvd24gdG8gZnJlZSB1cCBtZW1vcnkgZm9yIHRoZSBndWVzdC4N
Cg0KSG1tLCBidXQgd2l0aCB0aGF0IGxpbmUgcmVtb3ZlZCwgSSBnZXQgdGhpczoNCg0Kcm9vdEBp
bW1vcnRhbDovaW1hZ2VzIyB4bCBjcmVhdGUgYzYtMDEuY2ZnIG1heG1lbT0xMDczNzQxODI0DQpQ
YXJzaW5nIGNvbmZpZyBmcm9tIGM2LTAxLmNmZw0KbGlieGw6IGVycm9yOiBsaWJ4bF9tZW0uYzoy
Nzk6bGlieGxfc2V0X21lbW9yeV90YXJnZXQ6IE5ldyB0YXJnZXQgMCBmb3IgZG9tMCBpcyBiZWxv
dyB0aGUgbWluaW11bSB0aHJlc2hvbGQNCmZhaWxlZCB0byBmcmVlIG1lbW9yeSBmb3IgdGhlIGRv
bWFpbg0KDQpNYXliZSB0aGUgaXNzdWUgeW914oCZcmUgcHJvYmFibHkgZmFjaW5nIGlzIHRoYXQg
4oCcbWluaW11bSB0aHJlc2hvbGTigJ0gc2FmZXR5IGNhdGNoIGVpdGhlciBpc27igJl0IHRyaWdn
ZXJpbmcsIG9yIGlzIHNldCBsb3cgZW5vdWdoIHRoYXQgeW91ciBkb20wIGlzIE9PTWluZyB0cnlp
bmcgdG8gbWFrZSBlbm91Z2ggbWVtb3J5IGZvciB5b3VyIFZNPw0KDQpUaGF0IDFUaUIgb2YgZW1w
dHkgc3BhY2UgaXNu4oCZdCBhY3R1YWxseSBmcmVlIGFmdGVyIGFsbCwgZXZlbiBmb3IgWGVuIOKA
lCB5b3UgaGF2ZSB0byBhY3R1YWxseSBhbGxvY2F0ZSBwMm0gbWVtb3J5IGZvciB0aGUgZG9tYWlu
IHRvIGhvbGQgYWxsIG9mIHRob3NlIFBvRCBlbnRyaWVzLg0KDQogLUdlb3JnZQ==

