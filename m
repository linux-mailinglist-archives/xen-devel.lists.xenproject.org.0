Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A930A56D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 11:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79728.145151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WYG-00050l-EQ; Mon, 01 Feb 2021 10:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79728.145151; Mon, 01 Feb 2021 10:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6WYG-00050L-Ah; Mon, 01 Feb 2021 10:35:24 +0000
Received: by outflank-mailman (input) for mailman id 79728;
 Mon, 01 Feb 2021 10:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcwM=HD=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1l6WYD-00050G-W2
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 10:35:22 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 937708e5-1cc5-4d43-baf3-c15752ee3ce5;
 Mon, 01 Feb 2021 10:35:20 +0000 (UTC)
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
X-Inumbo-ID: 937708e5-1cc5-4d43-baf3-c15752ee3ce5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612175720;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w1rzNtUr0SMeVPcp8/AcCHbGnGHGvDcSbttKrJJDaWw=;
  b=GK1nJg4/KVDlFjFMVytexOF9XZG6FV7v61LD7lTMkY6OlDOpCZzWXMNj
   Tk7TlKZFU+uXA86HEr+hojRB3GJHwS0w50yJ9pjunWl9UxxKPyioGmMHH
   LeDaQb46JB1ZSjR2tH3bomtQ4pBXIUEUs6084r+vlBwf8t9AWsOdlsgWd
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dtPK9egNufoCR5qvjktNyvRstJT78xV6UtI6PTXjDlDWiUAycvD1bd+Qq7A/bhImqT1WOOTC00
 FuXuYR+II/DO+nt9S6Tbr/j3TRmi3Ed7obk7sUC6AHGMu0HCM7CAOYr00+B8EM28tDuZQv9bFX
 VvTNl7Y0V/0+T6hD+kk2xet0cGeH3QVYfoCS28OOdLsKDxDK7G2wNE0SZz8hotYPLMOs8tvQUM
 w3Fie6z17heWhScVQnZYeozd/pGRrgOYm7/LYqVdqvAVtx/lbsu6IS/nWZmEQREu2nyL9+fKRm
 o2U=
X-SBRS: 5.2
X-MesageID: 37590542
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="37590542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKOWYMgYyngDrb3BPCQD0KIojPzC4T5d9ENaOXHOGgbP1KmRHsW1oJXv1gBDBoJ62xBED7Xi5iGkDtEgt0j7bTTAflxg04T6iE4utDTAeY6aRhia/4Wu8GfE7ujLvi2L24NGLqt2/PMRmOjnQTXwrHMzqmfpQuiSCDJ1f7G1pT6wNXlE4EqW7wB8UM6JmIZU2ex9evCizL/66fkkXBaAOBL8svsJN75HHvdSYSf7RbgnpXsCv5EBi+1xYFiCkW/slMr84GL72iuqQJ3/Gv78H8uXa0JQw1iw8qYLq/GF4RYJ7gBoBovQmNzZSAa+gCe8zeKEw3O53KlAEZ7iEb1maQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1rzNtUr0SMeVPcp8/AcCHbGnGHGvDcSbttKrJJDaWw=;
 b=OZaTaUhLF+Wo0kKT8ojMnOcIJoMjGpFG9M0ie2RwXmwIe6ndXlqXtR6LKJKNhMKEbJZCYxnpMxctcNPLS4haGqj/gEi2i1DGlH2ATWGL8016ITMfTP2SBPWI1QlxEzoy+2J85ffuxX9R/L/nlR+FCGxReG9gz/+ZuTrDvpu5PO4LJUKyLFJPPWKrjbzfipScVMGQkMc+/VH1lBHBWyCWoWao0TpSQzmf1p/M7Ml7IG94jEe6PmPGdtxC/pHA98GMtfosF7JXEkjcpAUb0sZ4OFyf4vTL8JT/FHe8/5h2YM4/C8ncz1hhRpo42YiT651/We7x1HLLV2JqEe+X2lVWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1rzNtUr0SMeVPcp8/AcCHbGnGHGvDcSbttKrJJDaWw=;
 b=H9OUx1TGcGNOk+BrjcXgQwuKYqTcn3Cr1d0FdyOxTXyohjkKgqxYTedSVHoBoCG3QG86cXllpNzA6YWL4V2B4EsjTCKV+ePl15EjAkY+EoVuvT3ZAxkpgqM851USsu/sj2aXnPDip5MOqIQf7xzSrjNqzQGVF+9PugALjsKiL/M=
From: George Dunlap <George.Dunlap@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Topic: [PATCH] x86/pod: Do not fragment PoD memory allocations
Thread-Index: AQHW8qXhfghyfjZCb0iw2DUJHGLmxKo4G2OAgACDU4CAASMUgIAAcJSAgAELJICAAK7PgIAADiAAgAAXqgCAAMbHgIAAiAKAgABHgwCABGvygIABEjOA
Date: Mon, 1 Feb 2021 10:35:15 +0000
Message-ID: <E8806231-28EE-4618-B6A5-1B50813BF4B1@citrix.com>
References: <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
 <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
 <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
 <DC18947E-BC67-4BF8-A889-04B812DACACC@citrix.com>
 <YBbzXQt2GBAvpvgQ@mattapan.m5p.com>
In-Reply-To: <YBbzXQt2GBAvpvgQ@mattapan.m5p.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7b9d2f6-9dc6-4384-0b29-08d8c69d101d
x-ms-traffictypediagnostic: PH0PR03MB5733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5733E5DBD471418CA769B6EB99B69@PH0PR03MB5733.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QQzwEbzhlVvZSQyTnTyq0KACD37SeFhz0fCOYogi+hY8+u+Nnc+51mGttErtFO28WwOoW/OJ19QnE3NnpRfnwqC8bc5r+63mN52L3bmw3YueFIQuvQ/H4+qCNjNMmG5aRF4GgNVgJ4AYAZgYOZtDiheiPkzCM4kvsXcabseC9zdTjft7PApSuwsU0kxHcGudkVWTeGYee09NzeOKzRoA3qvokzFUehGZWeyJYRMI/6EGUU057+9sYv5deheN53595YXDkv7PH2jDmZP+WngMGpVx2BZZ6UOyCPJT5sVrGHSfrqVNzvHFf4QCi9hMxEVNcyX4aQdfnsaaPpdJ0+H5vofC+mAtVLqsv7lBvA7fmj7ftaL6c9mLYsC2mKgsfZxvcNK9/6uDSJBKu3zNOxyvZU8H7zw4P8O57ZwDeRLhpTOep4MuX6l1NH9Xq0ed0/vRdpYEIaeFah0TqZCYcxnB+Iucd+syxx0Z9dfEQeE8yCssam75zjpTPm32ut/xA+kpzfKxeyPgKA++c1aQtQWRFoLjuz4SfnLG7r+eg2R/uAWEFuwyisMLtvravWzId6VhGaQDPQxMYEP33IOgRjyANQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(316002)(71200400001)(36756003)(6486002)(6512007)(83380400001)(33656002)(54906003)(478600001)(8936002)(107886003)(76116006)(6506007)(26005)(5660300002)(66446008)(86362001)(2906002)(4326008)(53546011)(66556008)(64756008)(186003)(91956017)(2616005)(8676002)(66946007)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?L2pXYU5RZWhqaEtiSzFacHJJcnp0dHRXemc3STVhcEVJaWEwczVaZ3JmTmdG?=
 =?utf-8?B?UGZ0QUUreXJ3ZUNUd1BIZSszdVFjTGQ5ZEN3ZHd2RHNTR255MStqanBMVTc5?=
 =?utf-8?B?ZkRqRWd5RjV4V1NHWDAwSllncUtDelp5cUxNUlU4dFdsS1BXcnI4dzM3czhZ?=
 =?utf-8?B?ektoaDlaemtJeE4zK2JDNXppZFQ0cnFVRjVBU0s0TWwvWnVCYzJkalhsZ29t?=
 =?utf-8?B?blBhd2IxYzE1ZkIyRzV2S1Riai9pby9CREtNUFBOWjVXVitaemw5Q0NSc3Vq?=
 =?utf-8?B?YnNBaWxSdm8rYUJkck42bE4yWnFJeWxpV3FGZDhTUkhPMUJWOHlqc2pKRXh5?=
 =?utf-8?B?bGZ2UWVOV0thVnRLQTB5QkIrY1cySWkyY0ZFYW13U25MWVZlSFFqSDBvc3Iw?=
 =?utf-8?B?RDJ5MG9UNTVRbExObnMxN3RwZFBVakJaQ0JPWnNsNUZ4UXBBL25zU1ZiaVl0?=
 =?utf-8?B?TTRNMEEwOWZNLzhjNHhTaENuOFF6Mkc4S0ZPQmZpRC8rVEdMWERFV010N21C?=
 =?utf-8?B?bjlhQzZ5Rm04V2YvWmNBeXlEZUFRcjdnTVQ0cjdhUDVBNmdGbGdwQWh3Uml0?=
 =?utf-8?B?N281U0ZoVUVUYVJTQ1docFBnY2xJZnQzeTVrcllRZ2tTVWZocjBVR3ZhdG9E?=
 =?utf-8?B?aWlvODYwdDFBL1ZCelBZMFJtallrLzAxakd3VGRMamVibUZRMFJqWDRMWW81?=
 =?utf-8?B?amlXd3BKa3A4R05vTDBwVmR5R09ML08zU2tsWk5ld2hKZHdWY05jcU55Y3Bx?=
 =?utf-8?B?QVhwSElYQWZZS0lHcEVUMnFXQmYwSE15N1JLTkNDVGFrYVBtRUg3cEpHSXMr?=
 =?utf-8?B?OGxXSkdKcmxuRjNTNkc4VExiUEZHMVA5K1o4ZTJwVjZNcGFia2J2M1RWUENy?=
 =?utf-8?B?enlJSW9oSlZkam02MEZGUnVncHF3QWtJU1M1ZWRZRWxpVkhFaVhTVmluWU9I?=
 =?utf-8?B?aU5nWkV5TVFoSVRhRG1BRGlUK0o0Vytka3hCUks5dGVqOTJKa01UdDZ3bjFO?=
 =?utf-8?B?d2oxc25md2tjSU9tQVM1QTRQNnF5R1RKUEZlT2U3RDlncHBPQ2RKcUhHWUYx?=
 =?utf-8?B?THcyL25pUjM4THphR3hSSE1yNjlXaGJkWTdVRTltTTVldXRObUFmMEVvV3l3?=
 =?utf-8?B?SnppY2RkdW9lZ0p5cnhja2dpbEJ4KzBScS9WNVlIY1VDQU5CVXF0WTQrVEJ0?=
 =?utf-8?B?MHN5WWxaSTRWa25ac0tsR2U2S0c3RnF5RzJ2TW1EOWl0UE9SMWNpZzlBcWxv?=
 =?utf-8?B?SGZZdmV0dk1WTjJpRVQveEpSWllqM2VUSzg4MFZpdXNhaHpxQ2RsclNSQUR1?=
 =?utf-8?B?VjZxQ0lZT1phQ2MvK2JDdVRpc1JMcW1pOVF3cWU4Z0VFbFNQT09DTjdrUVhn?=
 =?utf-8?B?dVhycFlLeURzNVZUTEpJb2lCc2xFMjhsaXRKOGEvS014YzU0Q0RiR2dacFAx?=
 =?utf-8?B?UDlqbDhhZHpUM0lRNEg5N0NQcERtVGQ0WVhxOU1nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1D5F62EF48C814CADB5422F09948623@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b9d2f6-9dc6-4384-0b29-08d8c69d101d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 10:35:15.3666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFtR9eFM4yQCYQBZC97esXlaIcYfV79T103OfZKj5izDfIqIRX7mvrNmK2zBW62kn5fQkDv3P9WDnpx52q7IpqzwHuGnzjMvHj95qrQmK4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5733
X-OriginatorOrg: citrix.com

DQoNCj4gT24gSmFuIDMxLCAyMDIxLCBhdCA2OjEzIFBNLCBFbGxpb3R0IE1pdGNoZWxsIDxlaGVt
K3hlbkBtNXAuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgSmFuIDI4LCAyMDIxIGF0IDEwOjQy
OjI3UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiANCj4+PiBPbiBKYW4gMjgsIDIw
MjEsIGF0IDY6MjYgUE0sIEVsbGlvdHQgTWl0Y2hlbGwgPGVoZW0reGVuQG01cC5jb20+IHdyb3Rl
Og0KPj4+IHR5cGUgPSAiaHZtIg0KPj4+IG1lbW9yeSA9IDEwMjQNCj4+PiBtYXhtZW0gPSAxMDcz
NzQxODI0DQo+Pj4gDQo+Pj4gSSBzdXNwZWN0IG1heG1lbSA+IGZyZWUgWGVuIG1lbW9yeSBtYXkg
YmUgc3VmZmljaWVudC4gIFRoZSBpbnN0YW5jZXMgSQ0KPj4+IGNhbiBiZSBjZXJ0YWluIG9mIGhh
dmUgYmVlbiBtYXhtZW0gPSB0b3RhbCBob3N0IG1lbW9yeSAqNy4NCj4+IA0KPj4gQ2FuIHlvdSBp
bmNsdWRlIHlvdXIgWGVuIHZlcnNpb24gYW5kIGRvbTAgY29tbWFuZC1saW5lPw0KPiANCj4+IFRo
aXMgaXMgb24gc3RhZ2luZy00LjE0IGZyb20gYSBtb250aCBvciB0d28gYWdvIChpLmUuLCB3aGF0
IEkgaGFwcGVuZWQgdG8gaGF2ZSBvbiBhIHJhbmRvbSB0ZXN0ICBib3gpLCBhbmQgYGRvbTBfbWVt
PTEwMjRNLG1heDoxMDI0TWAgaW4gbXkgY29tbWFuZC1saW5lLiAgVGhhdCBydW5lIHdpbGwgZ2l2
ZSBkb20wIG9ubHkgMUdpQiBvZiBSQU0sIGJ1dCBhbHNvIHByZXZlbnQgaXQgZnJvbSBhdXRvLWJh
bGxvb25pbmcgZG93biB0byBmcmVlIHVwIG1lbW9yeSBmb3IgdGhlIGd1ZXN0Lg0KPj4gDQo+IA0K
PiBBcyB0aGlzIGlzIGEgc2VydmVyLCBub3QgYSBkZXZlbG9wbWVudCB0YXJnZXQsIERlYmlhbidz
IGJ1aWxkIG9mIDQuMTEgaXMNCj4gaW4gdXNlLiAgWW91ciBkb21haW4gMCBtZW1vcnkgYWxsb2Nh
dGlvbiBpcyBleHRyZW1lbHkgZ2VuZXJvdXMgY29tcGFyZWQNCj4gdG8gbWluZS4gIE9uZSB0aGlu
ZyB3aGljaCBpcyBvbiB0aGUgY29tbWFuZC1saW5lIHRob3VnaCBpcw0KPiAid2F0Y2hkb2c9dHJ1
ZSIuDQoNCnN0YWdpbmctNC4xNCBpcyBqdXN0IHRoZSBzdGFibGUgNC4xNCBicmFuY2ggd2hpY2gg
b3VyIENJIGxvb3AgdGVzdHMgYmVmb3JlIHB1c2hpbmcgdG8gc3RhYmxlLTQuMTQsIHdoaWNoIGlz
IGVzc2VudGlhbGx5IHRhZ2dlZCAzIHRpbWVzIGEgeWVhciBmb3IgcG9pbnQgcmVsZWFzZXMuICBJ
dOKAmXMgcXVpdGUgc3RhYmxlLiAgSeKAmWxsIGdpdmUgNC4xMSBhIHRyeSBpZiBJIGdldCBhIGNo
YW5jZS4NCg0KSXTigJlzIG5vdCBjbGVhciBmcm9tIHlvdXIgcmVzcG9uc2Ug4oCUIGFyZSB5b3Ug
YWxsb2NhdGluZyBhIGZpeGVkIGFtb3VudCB0byBkb20wPyAgSG93IG11Y2ggaXMgaXQ/ICBJbiBm
YWN0LCBwcm9iYWJseSB0aGUgc2ltcGxlc3QgdGhpbmcgdG8gZG8gd291bGQgYmUgdG8gYXR0YWNo
IHRoZSBvdXRwdXQgb2YgYHhsIGluZm9gIGFuZCBgeGwgZG1lc2dgOyB0aGF0IHdpbGwgc2F2ZSBh
IGxvdCBvZiBwb3RlbnRpYWwgZnV0dXJlIGJhY2stYW5kLWZvcnRoLg0KDQoxR2lCIGlzbuKAmXQg
cGFydGljdWxhcmx5IGdlbmVyb3VzIGlmIHlvdeKAmXJlIHJ1bm5pbmcgYSBsYXJnZSBudW1iZXIg
b2YgZ3Vlc3RzLiAgTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IFhlblNlcnZlciBub3cgZGVmYXVs
dHMgdG8gNEdpQiBvZiBSQU0gZm9yIGRvbTAuDQoNCj4gSSd2ZSBnb3QgMyBjYW5kaWRhdGVzIHdo
aWNoIHByZXNlbnRseSBjb25jZXJuIG1lOmJsZToNCj4gDQo+IDE+IFRoZXJlIGlzIGEgbGltaXRl
ZCByYW5nZSBvZiBtYXhtZW0gdmFsdWVzIHdoZXJlIHRoaXMgb2NjdXJzLiAgUGVyaGFwcw0KPiAx
VEIgaXMgdG9vIGhpZ2ggb24geW91ciBtYWNoaW5lIGZvciB0aGUgcHJvYmxlbSB0byByZXByb2R1
Y2UuICBBcw0KPiBwcmV2aW91c2x5IHN0YXRlZCBteSBzYW1wbGUgY29uZmlndXJhdGlvbiBoYXMg
bWF4bWVtIGJlaW5nIHJvdWdobHkgNw0KPiB0aW1lcyBhY3R1YWwgbWFjaGluZSBtZW1vcnkuDQoN
CkluIGZhY3QgSSBkaWQgYSBudW1iZXIgb2YgYmluYXJ5LXNlYXJjaC1zdHlsZSBleHBlcmltZW50
cyB0byB0cnkgdG8gZmluZCBvdXQgYm91bmRhcnkgYmVoYXZpb3IuICBJIGRvbuKAmXQgdGhpbmsg
SSBkaWQgN3ggbWVtb3J5LCBidXQgSSBjZXJ0YWlubHkgZGlkIDJ4IG9yIDN4IGhvc3QgbWVtb3J5
LCBhbmQgdGhlIGV4YWN0IG51bWJlciB5b3UgZ2F2ZSB0aGF0IGNhdXNlZCB5b3UgcHJvYmxlbXMu
ICBJbiBhbGwgY2FzZXMgZm9yIG1lLCBpdCBlaXRoZXIgd29ya2VkIG9yIGZhaWxlZCB3aXRoIGEg
Y3J5cHRpYyBlcnJvciBtZXNzYWdlICh0aGUgc3BlY2lmaWMgbWVzc2FnZSBkZXBlbmRpbmcgb24g
d2hldGhlciBJIGhhZCBmaXhlZCBkb20wIG1lbW9yeSBvciBhdXRvYmFsbG9vbmVkIG1lbW9yeSku
DQoNCj4gMj4gQmV0d2VlbiBpc3N1aW5nIHRoZSBgeGwgY3JlYXRlYCBjb21tYW5kIGFuZCB0aGUg
bWFjaGluZSByZWJvb3RpbmcgYQ0KPiBmZXcgbW9tZW50cyBvZiBzbG93IHJlc3BvbnNlIGhhdmUg
YmVlbiBvYnNlcnZlZC4gIFBlcmhhcHMgdGhlIG1lbW9yeQ0KPiBhbGxvY2F0b3IgbG9vcCBpcyBo
b2dnaW5nIHByb2Nlc3NvciBjb3JlcyBsb25nIGVub3VnaCBmb3IgdGhlIHdhdGNoZG9nIHRvDQo+
IHRyaWdnZXI/DQoNCkkgZG9u4oCZdCBrbm93IHRoZSBiYWxsb29uIGRyaXZlciB2ZXJ5IHdlbGws
IGJ1dCBJ4oCZZCBob3BlIGl0IHlpZWxkZWQgcHJldHR5IHJlZ3VsYXJseS4gIEl0IHNlZW1zIG1v
cmUgbGlrZWx5IHRvIG1lIHRoYXQgeW91ciBkb20wIGlzIHN3YXBwaW5nIGR1ZSB0byBsb3cgbWVt
b3J5IC8gc3RydWdnbGluZyB3aXRoIGhhdmluZyB0byB3b3JrIHdpdGggbm8gZmlsZSBjYWNoZS4g
IE9yIHRoZSBPT00ga2lsbGVyIGlzIGRvaW5nIGl0cyBjYWxjdWxhdGlvbiB0cnlpbmcgdG8gZmln
dXJlIG91dCB3aGljaCBwcm9jZXNzIHRvIHNob290PyAgDQoNCj4gMz4gUGVyaGFwcyBvbmUgb2Yg
dGhlIHBhdGNoZXMgb24gRGViaWFuIGJyb2tlIHRoaW5ncz8gIFRoaXMgc2VlbXMNCj4gdW5saWtl
bHkgc2luY2UgbmVhcmx5IGFsbCBvZiBEZWJpYW4ncyBwYXRjaGVzIGFyZSBlaXRoZXIgc3RyaWN0
bHkgZm9yDQo+IHBhY2thZ2luZyBvciBlbHNlIHBpY2tzIGZyb20gWGVuJ3MgbWFpbiBicmFuY2gs
IGJ1dCB0aGlzIGlzIGNlcnRhaW5seQ0KPiBwb3NzaWJsZS4NCg0KSW5kZWVkLCBJ4oCZZCBjb25z
aWRlciB0aGF0IHVubGlrZWx5LiAgU29tZSB0aGluZ3MgSeKAmWQgY29uc2lkZXIgbW9yZSBsaWtl
bHkgdG8gY2F1c2UgdGhlIGRpZmZlcmVuY2U6DQoNCjEuIFRoZSBhbW91bnQgb2YgaG9zdCBtZW1v
cnkgKG15IHRlc3QgYm94IGhhZCBvbmx5IDZHaUIpDQoNCjIuIFRoZSBhbW91bnQgb2YgbWVtb3J5
IGFzc2lnbmVkIHRvIGRvbTAgDQoNCjMuIFRoZSBudW1iZXIgb2Ygb3RoZXIgVk1zIHJ1bm5pbmcg
aW4gdGhlIGJhY2tncm91bmQNCg0KNC4gQSBkaWZmZXJlbmNlIGluIHRoZSB2ZXJzaW9uIG9mIExp
bnV4IChJ4oCZbSBhbHNvIHJ1bm5pbmcgRGViaWFuLCBidXQgZGViYW4tdGVzdGluZykNCg0KNS4g
QSBidWcgaW4gNC4xMSB0aGF0IHdhcyBmaXhlZCBieSA0LjE0Lg0KDQpJZiB5b3XigJlyZSBhbHJl
YWR5IGFsbG9jYXRpbmcgYSBmaXhlZCBhbW91bnQgb2YgbWVtb3J5IHRvIGRvbTAsIGJ1dCBpdOKA
mXMgc2lnbmlmaWNhbnRseSBsZXNzIHRoYW4gMUdpQiwgdGhlIGZpcnN0IHRoaW5nIEnigJlkIHRy
eSBpcyBpbmNyZWFzaW5nIHRoYXQgdG8gMUdpQi4gIEFsc28gbWFrZSBzdXJlIHRoYXQgeW914oCZ
cmUgc3BlY2lmeWluZyBhIOKAmG1heOKAmSBmb3IgZG9tMCBtZW1vcnk6IElmIHlvdSBzaW1wbHkg
cHV0IGBkb20wX21lbT1YYCwgZG9tMCB3aWxsIHN0YXJ0IHdpdGggWCBhbW91bnQgb2YgbWVtb3J5
LCBidXQgYWxsb2NhdGUgZW5vdWdoIGZyYW1lIHRhYmxlcyBzdWNoIHRoYXQgaXQgY291bGQgYmFs
bG9vbiB1cCB0byB0aGUgZnVsbCBob3N0IG1lbW9yeSBpZiByZXF1ZXN0ZWQuICAoQW5kIGZyYW1l
IHRhYmxlcyBhcmUgbm90IGZyZWUuKSAgYGRvbTBfbWVtPVgsbWF4PVhgIHdpbGwgY2F1c2UgZG9t
MCB0byBvbmx5IG1ha2UgZnJhbWUgdGFibGVzIGZvciBYIG1lbW9yeS4gIChBdCBsZWFzdCwgc28g
SeKAmW0gZ3Vlc3Npbmc7IEkgaGF2ZW7igJl0IGNoZWNrZWQuKQ0KDQpJZiB0aGF0IGRvZXNu4oCZ
dCB3b3JrLCBwbGVhc2UgaW5jbHVkZSB0aGUgb3V0cHV0IG9mIGB4bCBpbmZvYCBhbmQgYHhsIGRt
ZXNnYDsgdGhhdCB3aWxsIGdpdmUgdXMgYSBsb3QgbW9yZSBpbmZvcm1hdGlvbiB0byB3b3JrIHdp
dGguDQoNClBlYWNlLA0KIC1HZW9yZ2U=

