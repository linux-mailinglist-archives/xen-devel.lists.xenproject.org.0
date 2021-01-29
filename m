Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC33087F6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77992.141657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RSS-00025A-Vu; Fri, 29 Jan 2021 10:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77992.141657; Fri, 29 Jan 2021 10:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RSS-00024l-SF; Fri, 29 Jan 2021 10:56:56 +0000
Received: by outflank-mailman (input) for mailman id 77992;
 Fri, 29 Jan 2021 10:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxIo=HA=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l5RSR-00024g-KF
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:56:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4934c1ce-7765-4ff2-9927-8b7d3357b7f0;
 Fri, 29 Jan 2021 10:56:53 +0000 (UTC)
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
X-Inumbo-ID: 4934c1ce-7765-4ff2-9927-8b7d3357b7f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611917813;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7m82AvifGteFckzMK0MKTeirHM3Gf2rO6Qcwv+aMMzE=;
  b=QGc1q0u7ssOJ/InN6cxnjY42NR0ilDWkEQqOKfSG52WdDblu7gRbI8hN
   FEjRhIkQM7LfFN8lxa9a21ZwpWt+7+23NgvFoXqWYU3DxccXJnw6Zc8As
   rQRl+S2R5isovXVrQPKGOv1oHoGPOZgIJdaZ0eoPla3M37BFosBGHDWnR
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: t9ZDY4dyr8AegtQuSCglpEr2ILTQBfNlemmi8JSwjiW1Uy9mevsh8hA8+BfEHfCMzZ+tmwv/mu
 bbkxESclLmCszGeK5HjG33wM8EV7oaCY0geL7uoFCFHynQSASopkzGcSM37AdWpyIAN4fMfWC7
 uMDAxm5WiZ99q9sioQqKQHKEVgYB1OvSJcQRghsLHlkEzcjfUNcSr+5H+U4VVIvR8r9n13ecTr
 3goKqRF/SmzPrzFjptY44zS+PyHVJvMf5hb9n2yL8YFF+wHmR9hahTSBfXvCRM7VzJTDmqMyzZ
 KjA=
X-SBRS: 5.2
X-MesageID: 36517710
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36517710"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWxNVPYvkxYbpc2On9pM3tUwZzriev2JOX/O8KwiP76cMxDXqG0s4nLk+7Vh7N0JaQ8UA6mwsqqntqHuJTZzAGwuwBZ1OJCfLZUgxPRV5SCnCrDAZwwm0jsjQs/lvusEniJmuL/b04VnKw1GnT2xEEu0cBGpPDVNRpfCzKmiWRyja/zEVyUJCUFNhJfouQJchxJDX6xMWizwYGNsI5Ajt5XnRVmFgInGKbl/QjwKyrvxIIwtoHmNzqux7F4owT4IjpBGvSI7dbW5vfSljG2rsI3RWluRbSwfq+WdreSCkClgZejmEMOD6sICYTrZgf7zotJ17LR5wq7D4vtjo8Jo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m82AvifGteFckzMK0MKTeirHM3Gf2rO6Qcwv+aMMzE=;
 b=JBogGZ/j3UM/gjGrgX/Q9mgTU5tlFWsQhk5hjZQSu9DflEGybQfOn02WRd3xAaPyXjiPJuUHKQyYoRc8OVOrlINff4cMsSNqr6Jzy0qCqRWEySFH59ztwQ/p4ocS1RuIr8mbskAUJcMVL0wHfRksEY5vXZKzN94sx8jE9BLYyjfuawoBhGJB3Dt5v5F+m69SPBmG+EljNsXaGC8dI++GMvqZhrx9NDSBWSqC2MdLC1ifjHp/WzhZcLdPpky36Lhvw7Zq6S8vR525D4GxViDlPIOMFahZ8c+e6kAql/b8kit2DMrSCLaNLHwmbAheJT4F5LvAvq/shdfsA77O1a7xOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m82AvifGteFckzMK0MKTeirHM3Gf2rO6Qcwv+aMMzE=;
 b=Ki+tmG7iO/YlRRXEaVRYRjNgMUlx3h7gG3+TjIP7hDo+lU6EhxN6f4jCBESxpITiO1TkOS3EUDAU18hkJrCbc9iq0w7G4gBDIFaY36NjY8wBnlGDHy0fMVq/mOffGbY+DC4gbeKGaDMDcgZx1402v5R4EiXzxg7i/qUNwqSjnoU=
From: George Dunlap <George.Dunlap@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Topic: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Index: AQHW8qXhfghyfjZCb0iw2DUJHGLmxKo4G2OAgACDU4CAASMUgIAAcJSAgAELJICAAK7PgIAADiAAgAAXqgCAAMbHgIAAiAKAgABHgwCAAAPrgIAAyUKA
Date: Fri, 29 Jan 2021 10:56:48 +0000
Message-ID: <30FB3CCE-AAA0-4ACC-B63A-A211D18500A8@citrix.com>
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
 <26680EFB-29DE-4221-9E8C-3E2FEB0E0C3D@citrix.com>
In-Reply-To: <26680EFB-29DE-4221-9E8C-3E2FEB0E0C3D@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb8e4042-75a9-4a22-f86a-08d8c44493d9
x-ms-traffictypediagnostic: PH0PR03MB5688:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5688792449E91329AA66D7E199B99@PH0PR03MB5688.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AdW8lLAD0rM+BC3jvcQ0jQboZWGFPl63jsAUNEHU9ktGmMSVgu6ApkL95e/D6Nw4vMEovcQIgAZObTLK/cHKP/go9cpKb4UzCKSIjSQqfeWlI1/h2cNFngNMFU1bO1lyMD5mHH9RbIx4uNNuH5S/uJMhalIsJzPp/E1zuAiMCoP7bdvr4Vk2ECL+eiiF5uQ4dsP9FtTs3LqLMTTTgVa20XD2fjw5MTjZOz0l0uTLJuHkV4HM60Z0lxaz8hR5cnxwmBwsv8ANUtuqaYAbAsNULR6xasjzbbsx/y0kA+vyT0+IgbRb7/8lvxgiWPuZ6s5bBvlPb32bsnC4sDGzvG49tLyzhb8VAk4Gd7FUkT4aJHxW3NenEJs0gEBE4fkGuxVy0AyPjWGQ/PEqL58BKHuJeHaRkREOX9wP59nt+CigD2Nhd+E30GefZSZt7/J3dvaTszqWzgAAw/WMwrELY0C5zi6M1OsIhYCpSiMp/ui2eXZAws6i92A7F44MAkJEW6g+xBu98zANzcOR+MtJtLWVClX2DLVL15qaAd/FhaSceseiKD7+QoqnJPNexmoDSSozOj2HIVGA8ZQ6Fpbea5qnq91zCNKrOIvDrWaYR23DPNJHackbJW5leCalN7LLTBRZhFe1FnRI6Tc+Q7fYRyMHMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(86362001)(33656002)(6486002)(53546011)(8936002)(66476007)(4326008)(6512007)(26005)(316002)(6506007)(966005)(64756008)(5660300002)(186003)(66556008)(2616005)(8676002)(66446008)(36756003)(478600001)(54906003)(91956017)(107886003)(66946007)(76116006)(2906002)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RklwRXhrUVdOdHdyYzVnam9SSjh0TkFnVmsrMWljSUJGVkUxb3JEUDRQUHkw?=
 =?utf-8?B?ekZMV2JML2txZkQvRHFaZU80UGJQU3BNeVF2b2xybHdzd1NxaUdmaExjdjRX?=
 =?utf-8?B?VWlEUVdmaXpNZnBCT2RDOFpVd25EazEreXVQTFplWEZYcnNIdVpoNlRGUDE4?=
 =?utf-8?B?ZWhxd0ZGMXlpUE41QU1BNEZxQTErMVRtSkNXTEdOei9tL2JKTVQ1WnIwakZF?=
 =?utf-8?B?MGt5N2t2MnBDNXE3TVlDRWN0ajQ3dTQrTlVpbjZPdktZa21zNEU0azVVNTJk?=
 =?utf-8?B?TE9oeTdiWHd0eFZFV2RTS1FiUDVXdGtEWnlCc1lvdEhtWkZjL1BCckZmREtK?=
 =?utf-8?B?YWtNNjVUSkcrdDErc2xKUkpacGFnWEd1MjZ0dm1RTWZ2dWZOR2x1bTVOdVd3?=
 =?utf-8?B?TDVUVXBKVVRPT29rR0dFZVc0bVp4V1NHV0Vqc3Q2TjVaYVE4YlVBTElNV200?=
 =?utf-8?B?Z0dJbmlud1FKZDZYczRkNG1tMW90VkJFT1h5UitUam94UVVrYk9QV0g2Q2RK?=
 =?utf-8?B?YWY4bVVDWVIvZ2lpUmNCZk5PMFp6VWFFOENzZTdEcDQ1VlpDQ3UwdzBIZ0sz?=
 =?utf-8?B?MDFjbUliU1RpTFFHT3QyVGY1alc1cmpmZ3BDSWQ1bGxHY1FJNnhrRjdsVEFp?=
 =?utf-8?B?Wko0SWtvcTE4Mks1Z2hHdHp1M1VxVmo5MW83Z2hzSmNvVXU1Tm1YbGVxZm1k?=
 =?utf-8?B?UXJuNGJ6eDA3K1ZIbTFYVmdqbHJBdWNVMk1pTENsTDMvZ2xFditIV2Fzd01U?=
 =?utf-8?B?K1oyN0VLdUM5K1lrSVFwM1V5L1BuNG9xSHdiVmQvZ2xOZDNXekRKMXRiMmph?=
 =?utf-8?B?VFplYWUrWXc1QkdzUWtKMnMyT0g1V0ZBV1Ircmk0ZVVnN0U5RWQ1WGJoZlFM?=
 =?utf-8?B?b3d6UzdZbFNOZWxiYUNjYjhENm94dWY1cldQQmdmQ1pJckpwTldDM0szRVc4?=
 =?utf-8?B?WnJWVWpjSjFLUldYOWRnb2xuZHdpbjFHYnNLVHBaU0hnaDdTU09YUk05cFZE?=
 =?utf-8?B?d2o5VjdSNGhIUmNmbkNtMFM2TUE4QUFDU0orVSszQmJ3RTZCM29OMzM3ZStD?=
 =?utf-8?B?RnVCTWkzdmN5NGxMQ3NvcG1vamErVkRNZjB1KzZCYzJqaDdocVcvTWkvTHp1?=
 =?utf-8?B?WFE3QkdJSU1HbDk3MWlPaW5jeU5RZURWZVFaSGxkdENISFVKaGMzcHJldmxo?=
 =?utf-8?B?bGN6dWRvZHRkMTRvOUcrRnozdm95ZXVKR3MvUk1PNCtndklQREQxaWVoWktY?=
 =?utf-8?B?RUxjeTNtV3dZc1gydkFLcVZQWUxTRDJzMkMybkJMYkJNaStyL25YUDFYNktF?=
 =?utf-8?B?L29yNE5tZTYveEdFRitDemkyVTNla1k4NFVMOUtBc2ZZYXQ5Mk1iQktXcjha?=
 =?utf-8?B?VktuVzJGcytySTgxZW9KY2FwVytScFhrUzFZVDcvZWkycnA2UW4xb3VCV3VG?=
 =?utf-8?B?QWhMSDdVTjZiTzZPeUo2MXlxN0k3UHRqSHgvQkt3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AFDD583296C2249B1D26F9BA0644BB4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8e4042-75a9-4a22-f86a-08d8c44493d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 10:56:48.9394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iT5tgC00LrApr8M2L4e8lfFHGoV7Cv+S8HsN6zF0AkryGJ9L07SURZXKekTqq5r7w4iv6YYJ0FzuJkg4H768Mu5A/ibv2WYPg0WM/P/ScgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5688
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSmFuIDI4LCAyMDIxLCBhdCAxMDo1NiBQTSwgR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIEphbiAyOCwgMjAy
MSwgYXQgMTA6NDIgUE0sIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4g
d3JvdGU6DQo+PiANCj4+IA0KPj4gDQo+Pj4gT24gSmFuIDI4LCAyMDIxLCBhdCA2OjI2IFBNLCBF
bGxpb3R0IE1pdGNoZWxsIDxlaGVtK3hlbkBtNXAuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBU
aHUsIEphbiAyOCwgMjAyMSBhdCAxMToxOTo0MUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4gT24gMjcuMDEuMjAyMSAyMzoyOCwgRWxsaW90dCBNaXRjaGVsbCB3cm90ZToNCj4+Pj4+
IE9uIFdlZCwgSmFuIDI3LCAyMDIxIGF0IDA5OjAzOjMyUE0gKzAwMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6DQo+Pj4+Pj4gU28uPz8gV2hhdCAqc2hvdWxkKiBoYXBwZW4gaXMgdGhhdCBpZiBRRU1V
L09WTUYgZGlydGllcyBtb3JlIG1lbW9yeSB0aGFuDQo+Pj4+Pj4gZXhpc3RzIGluIHRoZSBQb0Qg
Y2FjaGUsIHRoZSBkb21haW4gZ2V0cyB0ZXJtaW5hdGVkLg0KPj4+Pj4+IA0KPj4+Pj4+IElycmVz
cGVjdGl2ZSwgWGVuL2RvbTAgZHlpbmcgaXNuJ3QgYW4gZXhwZWN0ZWQgY29uc2VxdWVuY2Ugb2Yg
YW55IG5vcm1hbA0KPj4+Pj4+IGFjdGlvbiBsaWtlIHRoaXMuDQo+Pj4+Pj4gDQo+Pj4+Pj4gRG8g
eW91IGhhdmUgYSBzZXJpYWwgbG9nIG9mIHRoZSBjcmFzaD8/PyBJZiBub3QsIGNhbiB5b3Ugc2V0
IHVwIGEgY3Jhc2gNCj4+Pj4+PiBrZXJuZWwgZW52aXJvbm1lbnQgdG8gY2FwdHVyZSB0aGUgbG9n
cywgb3IgYWx0ZXJuYXRpdmVseSByZXByb2R1Y2UgdGhlDQo+Pj4+Pj4gaXNzdWUgb24gYSBkaWZm
ZXJlbnQgYm94IHdoaWNoIGRvZXMgaGF2ZSBzZXJpYWw/DQo+Pj4+PiANCj4+Pj4+IE5vLCBJIGRv
bid0LiAgSSdtIHNldHVwIHRvIGRlYnVnIEFSTSBmYWlsdXJlcywgbm90IHg4NiBvbmVzLg0KPj4+
PiANCj4+Pj4gVGhlbiBhbHRlcm5hdGl2ZWx5IGNhbiB5b3UgYXQgbGVhc3QgZ2l2ZSBjb25kaXRp
b25zIHRoYXQgbmVlZCB0bw0KPj4+PiBiZSBtZXQgdG8gb2JzZXJ2ZSB0aGUgcHJvYmxlbSwgZm9y
IHNvbWVvbmUgdG8gcmVwcm8gYW5kIHRoZW4NCj4+Pj4gZGVidWc/IChUaGUgbGVzcyBjb21wbGV4
IHRoZSBiZXR0ZXIsIG9mIGNvdXJzZS4pDQo+Pj4gDQo+Pj4gTXVsdGlwbGUgcHJpb3IgbWVzc2Fn
ZXMgaGF2ZSBpbmNsdWRlZCBzdGF0ZW1lbnRzIG9mIHdoYXQgSSBiZWxpZXZlZCB0byBiZQ0KPj4+
IHRoZSBtaW5pbWFsIGNhc2UgdG8gcmVwcm9kdWNlLiAgUHJlc2VudGx5IEkgYmVsaWV2ZSB0aGUg
bWluaW1hbA0KPj4+IGNvbnN0cmFpbnRzIGFyZSwgbWF4bWVtID49IGhvc3QgbWVtb3J5LCBtZW1v
cnkgPCBmcmVlIFhlbiBtZW1vcnksIHR5cGUNCj4+PiBIVk0uICBBIG1pbmltYWwga3I0NWhtZS5j
ZmcgZmlsZToNCj4+PiANCj4+PiB0eXBlID0gImh2bSINCj4+PiBtZW1vcnkgPSAxMDI0DQo+Pj4g
bWF4bWVtID0gMTA3Mzc0MTgyNA0KPj4+IA0KPj4+IEkgc3VzcGVjdCBtYXhtZW0gPiBmcmVlIFhl
biBtZW1vcnkgbWF5IGJlIHN1ZmZpY2llbnQuICBUaGUgaW5zdGFuY2VzIEkNCj4+PiBjYW4gYmUg
Y2VydGFpbiBvZiBoYXZlIGJlZW4gbWF4bWVtID0gdG90YWwgaG9zdCBtZW1vcnkgKjcuDQo+PiAN
Cj4+IENhbiB5b3UgaW5jbHVkZSB5b3VyIFhlbiB2ZXJzaW9uIGFuZCBkb20wIGNvbW1hbmQtbGlu
ZT8NCj4+IA0KPj4gRm9yIG1lLCBkb21haW4gY3JlYXRpb24gZmFpbHMgd2l0aCBhbiBlcnJvciBs
aWtlIHRoaXM6DQo+PiANCj4+IHJvb3RAaW1tb3J0YWw6L2ltYWdlcyMgeGwgY3JlYXRlIGM2LTAx
LmNmZyBtYXhtZW09MTA3Mzc0MTgyNA0KPj4gUGFyc2luZyBjb25maWcgZnJvbSBjNi0wMS5jZmcN
Cj4+IHhjOiBlcnJvcjogcGFuaWM6IHhjX2RvbV9ib290LmM6MTIwOiB4Y19kb21fYm9vdF9tZW1f
aW5pdDogY2FuJ3QgYWxsb2NhdGUgbG93IG1lbW9yeSBmb3IgZG9tYWluOiBPdXQgb2YgbWVtb3J5
DQo+PiBsaWJ4bDogZXJyb3I6IGxpYnhsX2RvbS5jOjU5MzpsaWJ4bF9fYnVpbGRfZG9tOiB4Y19k
b21fYm9vdF9tZW1faW5pdCBmYWlsZWQ6IENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkNCj4+IGxpYnhs
OiBlcnJvcjogbGlieGxfY3JlYXRlLmM6MTU3Njpkb21jcmVhdGVfcmVidWlsZF9kb25lOiBEb21h
aW4gOTpjYW5ub3QgKHJlLSlidWlsZCBkb21haW46IC0zDQo+PiBsaWJ4bDogZXJyb3I6IGxpYnhs
X2RvbWFpbi5jOjExODI6bGlieGxfX2Rlc3Ryb3lfZG9taWQ6IERvbWFpbiA5Ok5vbi1leGlzdGFu
dCBkb21haW4NCj4+IGxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTEzNjpkb21haW5fZGVz
dHJveV9jYWxsYmFjazogRG9tYWluIDk6VW5hYmxlIHRvIGRlc3Ryb3kgZ3Vlc3QNCj4+IGxpYnhs
OiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTA2Mzpkb21haW5fZGVzdHJveV9jYjogRG9tYWluIDk6
RGVzdHJ1Y3Rpb24gb2YgZG9tYWluIGZhaWxlZA0KPj4gDQo+PiBUaGlzIGlzIG9uIHN0YWdpbmct
NC4xNCBmcm9tIGEgbW9udGggb3IgdHdvIGFnbyAoaS5lLiwgd2hhdCBJIGhhcHBlbmVkIHRvIGhh
dmUgb24gYSByYW5kb20gdGVzdCAgYm94KSwgYW5kIGBkb20wX21lbT0xMDI0TSxtYXg6MTAyNE1g
IGluIG15IGNvbW1hbmQtbGluZS4gIFRoYXQgcnVuZSB3aWxsIGdpdmUgZG9tMCBvbmx5IDFHaUIg
b2YgUkFNLCBidXQgYWxzbyBwcmV2ZW50IGl0IGZyb20gYXV0by1iYWxsb29uaW5nIGRvd24gdG8g
ZnJlZSB1cCBtZW1vcnkgZm9yIHRoZSBndWVzdC4NCj4gDQo+IEhtbSwgYnV0IHdpdGggdGhhdCBs
aW5lIHJlbW92ZWQsIEkgZ2V0IHRoaXM6DQo+IA0KPiByb290QGltbW9ydGFsOi9pbWFnZXMjIHhs
IGNyZWF0ZSBjNi0wMS5jZmcgbWF4bWVtPTEwNzM3NDE4MjQNCj4gUGFyc2luZyBjb25maWcgZnJv
bSBjNi0wMS5jZmcNCj4gbGlieGw6IGVycm9yOiBsaWJ4bF9tZW0uYzoyNzk6bGlieGxfc2V0X21l
bW9yeV90YXJnZXQ6IE5ldyB0YXJnZXQgMCBmb3IgZG9tMCBpcyBiZWxvdyB0aGUgbWluaW11bSB0
aHJlc2hvbGQNCj4gZmFpbGVkIHRvIGZyZWUgbWVtb3J5IGZvciB0aGUgZG9tYWluDQo+IA0KPiBN
YXliZSB0aGUgaXNzdWUgeW914oCZcmUgcHJvYmFibHkgZmFjaW5nIGlzIHRoYXQg4oCcbWluaW11
bSB0aHJlc2hvbGTigJ0gc2FmZXR5IGNhdGNoIGVpdGhlciBpc27igJl0IHRyaWdnZXJpbmcsIG9y
IGlzIHNldCBsb3cgZW5vdWdoIHRoYXQgeW91ciBkb20wIGlzIE9PTWluZyB0cnlpbmcgdG8gbWFr
ZSBlbm91Z2ggbWVtb3J5IGZvciB5b3VyIFZNPw0KDQpMb29rcyBsaWtlIExJQlhMX01JTl9ET00w
X01FTSBpcyBoYXJkLWNvZGVkIHRvIDEyOE1pQiwgd2hpY2ggaXMgbm90IGdvaW5nIHRvIGJlIGVu
b3VnaCBvbiBhIGxvdCBvZiBzeXN0ZW1zLiAgQXQgdmVyeSBsZWFzdCB0aGF0IHNob3VsZCBiZSBz
b21ldGhpbmcgdGhhdCBjYW4gYmUgc2V0IGluIGEgZ2xvYmFsIGNvbmZpZyBzb21ld2hlcmUuICBJ
ZGVhbGx5IHdl4oCZZCBoYXZlIGEgbW9yZSBzb3BoaXN0aWNhdGVkIHdheSBvZiBjYWxjdWxhdGlu
ZyB0aGUgbWluaW11bSB2YWx1ZSB0aGF0IHdvdWxkbuKAmXQgdHJpcCBzbyBlYXNpbHkuDQoNCkVs
bGlvdCwgYXMgYSBzaG9ydC10ZXJtIGZpeCwgSSBzdWdnZXN0IGNvbnNpZGVyaW5nIHNldHRpbmcg
YXNpZGUgYSBmaXhlZCBhbW91bnQgb2YgbWVtb3J5IGZvciBkb20wLCBhcyByZWNvbW1lbmRlZCBp
biBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fUHJvamVjdF9CZXN0X1ByYWN0
aWNlcy4NCg0KIC1HZW9yZ2UNCg0K

