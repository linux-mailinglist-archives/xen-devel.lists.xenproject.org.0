Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CB1332431
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 12:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95365.180033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaes-0000F8-7R; Tue, 09 Mar 2021 11:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95365.180033; Tue, 09 Mar 2021 11:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJaes-0000Ei-3j; Tue, 09 Mar 2021 11:36:14 +0000
Received: by outflank-mailman (input) for mailman id 95365;
 Tue, 09 Mar 2021 11:36:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qKHD=IH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lJaeq-0000Ed-NP
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 11:36:12 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bde09a5-40c4-4fad-a06d-f77291498dd8;
 Tue, 09 Mar 2021 11:36:11 +0000 (UTC)
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
X-Inumbo-ID: 1bde09a5-40c4-4fad-a06d-f77291498dd8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615289771;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BQa+/sW453AuTNDdYzeUGNI9zmj6jgy0kc3xvrcAsVQ=;
  b=Bu0rOVlTpq+JifIm/IG52cIDWkrNWFnfAytiMVifFaNoHk4sreP0sS+x
   QxF+HPEQTUlW3dIjKkBDK4eyclr0HYo2PSlZps1S6Y+IfmHLHjO1MUo9/
   spA5QoCtTiep5TZ0HhG769oIfTpiZo5W+MC9FxJ/VUE8pH1BgOnhfZwFi
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3eOlW1m6YgdrVKaAgstg6OCLcxsMEgqJCl3yYAGu48Uzr3L7MtjhpjrIAjJwZg2EqawUlhvuKA
 Uha4XgSFa7Lzqa6BJxmaVg2Dqg3JuIh+Vwjg02wanys7ul3cXMu5RhiXflQo3DzRy+Ej9flh0J
 0ibCyLeD57jw9l2Rr9AH1zr4uX7TL9HCg5q6PbAWjXNNAdI6kyDLwwzpQEN/G8QQwAjSr8eWVo
 IUGhmFwvgsQ4awzm71uszcmMB821FaP/eZLIcJ4YMWIUgiDdC9uuI9iRnZbltXo56WsU34SjeZ
 vLo=
X-SBRS: 5.2
X-MesageID: 38841902
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,234,1610427600"; 
   d="scan'208";a="38841902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyjllgFCWcwrNjNfX8DBtj5k4bQZIW07vGMv34gZzXc2AF7PAB5KOKOufSysMUg/9KgzGTWaJ4Q8K/LOh54qu5IPbYRhKHFW44eg+Dkb+C4A9Uro0X4kCfEB8XZpWOfx6TobdY2vnS0pdnlvdA8D74MhkdS4WUSt9Q4I8zp/YZ7PsGPpcILh6b6v3u4OjI+QTILwRKJBUo1jl2iaHgT14gTImgMDTDx/57K0xjCuHpZphxeKGwU08Zz0Kgh8a3h1DMAsew7oUQ5npwweHrG4DNOlsWeXQPW085VPEB1TI8qBSF452FWPrvq6sU84NctVfSxeogRYEMUy7AYjIPQMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQa+/sW453AuTNDdYzeUGNI9zmj6jgy0kc3xvrcAsVQ=;
 b=C91PDQk2K3QRK/QCCL++K/3tX3Fv0uuYXIIjiTqZtnP2/z9XgrDn+YIunm62IVkORREMMi4MljWBJQxe+UW3S/HK6/PbJ2jnXeKZWCse8vKzZJPWgPMCJasjOxklBe+2m0oFLUAyE5Z01IjWiK5xVMQ5vwFRI4Hzhc0W6Um6aJfM5V0BUoAMBzpCZI+b53/gBvTiQ/75tzy+NRIzQyjzjTS+bWjTlucVeHx4b7tkDxidjb4Fu9eRXyyGGXe1p+UCK+iwJrFv1t8Dsz2cJkzO4393/XI2mbYZUuewQW07itkiYlKIWBvcdfGIyYgJMElBgDKFV6lyQsUZvbC/ReVcPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQa+/sW453AuTNDdYzeUGNI9zmj6jgy0kc3xvrcAsVQ=;
 b=xkWnKJyJGVN9oQA4bwIagEzKZNeR2soCdaNZZ3L7/Pxr4ZvcgMw6BGr13ij9WEapkO0++rlauzPcPgUQKZAh8LxunjVAXQBlrjrHjfYpM943g6FU78bEQj38z+u3Lt+vL/tvY+9x1hLILe9+2TzOwYBe1jBuLRHJncw8VhfMDEQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Topic: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Index: AQHXBE6IzoDpW0Psi0SLnVWLvJvx9Kpam+MAgAAFtoCAAAB2AIAc3P2AgAQpHIA=
Date: Tue, 9 Mar 2021 11:36:04 +0000
Message-ID: <F89758EE-0377-4F7C-9741-57364B7D4BCD@citrix.com>
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
 <c5eb64fc-a90b-6e28-bb0d-075e3a870299@xen.org>
 <E820CE9D-9671-4ED3-872E-3AECE21505AC@citrix.com>
 <E0E24EA5-CF14-45AA-8C0A-122F87051EC0@citrix.com>
 <9d63df30-6de7-4ea8-1e38-d70318b4b7bb@xen.org>
In-Reply-To: <9d63df30-6de7-4ea8-1e38-d70318b4b7bb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4fc6019-4bbe-4fe8-58bf-08d8e2ef861a
x-ms-traffictypediagnostic: PH0PR03MB5894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5894A027624F54EE370CABD699929@PH0PR03MB5894.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z8BzmIXeKNQhk9jc4CYCUlYOXyNPkYK7FeJDPT8IX0U1c1gcxPi7lf6MoyRL9GRbJjC0ICG2c6WCq9dPvXJrfni+i3KriGHLt+05RhfYCHh5JhYl0l+8wnJA9N/Y+caK7hoyNcOGNGhPcAZDB/lZ2liZ3lj5LAnaiSFcBOl2LLzPEdCG88nmmDRn8fjF40t1fRb9oxcPZs8QKp0NLlrFFiBMiAgzQ3Yjo0sMxXo4TcbEI9I0B0K0jdsKtmndOl1OkqLJIn1pyLEK44Z3L27jYtviKqtJwrxyRziDL4Fsxn7JTQN1fVmtjV0xp87j+E24BMagqXYUXpSMTSZFtQmcfY8Eyt/XHKB0uG4XD1TVBa33a7wTJ43fz2Czl/Wkim/Uwxtjcn8dEs2sXwXElcsgT0KOy3Cuze+8WiYqzR2lnXEu5tu7ZLNRX86UoGdiN4/c8N9yPfaCuZhOQbeteBLxVwvIRIXuW1013rTDSuso/HEmItXBtD4prk5w2VcpCytyFTD/nUuqo65UiGT/br9f0v1UzZVJyZ0tX59i5d7dMYvr3UlZaumOq7FJmi9w8zZBf4YMVo2+Pp66n8q17s1OXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(2906002)(66476007)(66556008)(66446008)(6512007)(64756008)(6486002)(6916009)(8936002)(5660300002)(6506007)(83380400001)(8676002)(86362001)(36756003)(186003)(91956017)(26005)(71200400001)(66946007)(478600001)(2616005)(76116006)(4326008)(54906003)(33656002)(316002)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Sy90bC94alFRaVYvQy9DaGhqUnYyYnlJMVJQc2lwTDcxcE5RNFVRVi9LVlYw?=
 =?utf-8?B?NnhDV3VtTnFlM3B1QXpEc2wvSGtDNmVYT2RuaGpJR3ZaOVUzLzVQQThDaEtH?=
 =?utf-8?B?Qk5tQW9KM29VN3ZrVkd4M3UySzh3WlM1WXhTRlh0QzJoMENKTmJIZ1FUd1Mv?=
 =?utf-8?B?UEgwNEN1NjRjQTJ3VXhQSWFQSEtGQlM3MzRyUlYxdDJ5WFgzSmdnQnE2ZHV1?=
 =?utf-8?B?YTZMZGlPTGJrT1UrTWgxV0hFK25WUzd3N2w5WlBMV0FXalZkaTdwNGY2TnFP?=
 =?utf-8?B?Wm42NjRvZTR1Q3NWSEVYTXhDSjhSWURTL1FickUydGZEa1F5dHc4ZnhTek90?=
 =?utf-8?B?VDlXR09GNXFWSG53YjRESHJQOVd0TFdSdHp1KzF4enNjUHEwdzlBcTA0QmZN?=
 =?utf-8?B?Ym5UY2kvRThOMG9KVm85Q1lrd3ZVUlpVV1l2R0UxVGlvQXc2Y3BWS2luYUlH?=
 =?utf-8?B?cmJiOEM4djhFc09sSUxUOUYyTU5KWGpYeVRvc2pyNW9TMFJXQ29WbkRncFVC?=
 =?utf-8?B?eTh3SGlNUm5ETERUQU5ZdzB3ajlEUmFESjdwYTdDWDc3TTNBRUZUSTc1VFRO?=
 =?utf-8?B?Y2VlWWtEdFgwWXJlUFV2OTVHUnA1SlZQelhsOVpxTklhUzBrZEJxRjVWR2U1?=
 =?utf-8?B?eFhOU2VjeG4wOTVBbFVtcVZWUk55cTZhWmg2TEhHTStZWnhHbExNU2x2NmYw?=
 =?utf-8?B?TlY1bDg5SkVvYXNvMHBZa0Z6V0M4MXFWVHJTK0RmWEZxdytwcjA2ZjAyY3Rp?=
 =?utf-8?B?TVU4aEhqa0NWdUF3cHFKUFRweW5kRTMrRVpaWFFVVU9ubUFSelBGNThOTWFi?=
 =?utf-8?B?aWNGbC9EOE1qRk5TeHFTaDBnQ3JRcytnN2U1RDZwYW16M3UrTWZvTmgxbW8r?=
 =?utf-8?B?R29qMTVla1gwamEveFlsNnpSUGlEUjRlWUNTdFNCZDVtTVJLQjl2TFloM2t6?=
 =?utf-8?B?ME9lcmkzb29jWXpIZXp3aSt5K0E0Y3hBMUFzaEdQRVdlTWN0SERDdHdnUVV2?=
 =?utf-8?B?RUZDTjZiWU1KZjlRR1dxS1QwREhVSmpCRUM4bFFmb2U3Wm44OWpCR0E4SVpo?=
 =?utf-8?B?b0FmT3U4K0plUkhvMHI4MDRzYk03aWhsUTl2M042cWt6SytYWkU3VW1jTzU0?=
 =?utf-8?B?enBSeWVtcStwUldSQU9reldPalRRUnpOQ3BrUldkb2ZTSjdOU2cxd1V2Q1Rl?=
 =?utf-8?B?TXJGRjFZODN5QVBSaERBSllFVXBvL3NHbWV6MmNSQjcyYis4Z0VGUmljSERG?=
 =?utf-8?B?MllOQTZhanRkVkVuMlRjMWt3bTF2dEVPSHdmSGRCMGJxRS9FZHBKV0NrNDVJ?=
 =?utf-8?B?akhyTERtRTRsVkRieGJqT1VuWFpMVHplamJXS2FWSkdFTmV6WlNsK0hTUkpP?=
 =?utf-8?B?OXNKWkFPSEIwZDFFTkx1RlcrMmlTd0lHbDd0eVdJMU56QmszVENTTVpJWXhU?=
 =?utf-8?B?d3B3dW90SXBZVFR3OGFUZlpYQUZrRHZvQ1ZZbnFYQVB4LzlMUmhGQ0xkOE94?=
 =?utf-8?B?NjNvUlk2NzdNdXNYbUw2KzAvRU0xZ0hqMU5sdUxoVXJoV01FTUtQVVdkN2h2?=
 =?utf-8?B?OE9MUHp6RU9tWThQWldORnl2U2h5WUZRL2JsNEJjaGhORnltMGwxVVhKM0NJ?=
 =?utf-8?B?MTFvNHk5UmtaRjByTTgxU0VDNS92cncveEZZUmJzbUNSTER3VFFhVzQ5bXhT?=
 =?utf-8?B?bHp5L05iRU5mdXU5bnF3UjEvek9MOWRqeHIwL0xhY3VQRmdHcjEzd1BnRzE4?=
 =?utf-8?B?bkcyYnhITTBPMmwvaW1kVHVsWC9IbzJaSFZSOFFQcVFlWHUxcGNMZW0wOGFK?=
 =?utf-8?B?cUtsQktySWJzNmNTdFZ5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EB3D734AC7DD74E9CB9CC76969E5076@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fc6019-4bbe-4fe8-58bf-08d8e2ef861a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 11:36:04.6346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6GyCSMe0ngOzKFfsSt/5AadSkBD+ZAkNlkz/VubTb3pBDOGCM1VKQ6XXtSicjJFRqqMeei9HArUd934+mnkjSoGv9aJr/TEPgIISA15KdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5894
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDYsIDIwMjEsIGF0IDg6MDMgUE0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgR2VvcmdlLA0KPiANCj4gT24gMTYvMDIvMjAyMSAxMTox
NywgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+PiBPbiBGZWIgMTYsIDIwMjEsIGF0IDExOjE2IEFN
LCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+IA0K
Pj4+IA0KPj4+IA0KPj4+PiBPbiBGZWIgMTYsIDIwMjEsIGF0IDEwOjU1IEFNLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IEhpIEdlb3JnZSwNCj4+Pj4g
DQo+Pj4+IE9uIDE2LzAyLzIwMjEgMTA6MjgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4+PiBE
b2N1bWVudCB0aGUgcHJvcGVydGllcyBvZiB0aGUgdmFyaW91cyBhbGxvY2F0b3JzIGFuZCBsYXkg
b3V0IGEgY2xlYXINCj4+Pj4+IHJ1YnJpYyBmb3Igd2hlbiB0byB1c2UgZWFjaC4NCj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4+
Pj4+IC0tLQ0KPj4+Pj4gVGhpcyBkb2MgaXMgbXkgdW5kZXJzdGFuZGluZyBvZiB0aGUgcHJvcGVy
dGllcyBvZiB0aGUgY3VycmVudA0KPj4+Pj4gYWxsb2NhdG9ycyAoYWxsb2NfeGVuaGVhcF9wYWdl
cywgeG1hbGxvYywgYW5kIHZtYWxsb2MpLCBhbmQgb2YgSmFuJ3MNCj4+Pj4+IHByb3Bvc2VkIG5l
dyB3cmFwcGVyLCB4dm1hbGxvYy4NCj4+Pj4+IHhtYWxsb2MsIHZtYWxsb2MsIGFuZCB4dm1hbGxv
YyB3ZXJlIGRlc2lnbmVkIG1vcmUgb3IgbGVzcyB0byBtaXJyb3INCj4+Pj4+IHNpbWlsYXIgZnVu
Y3Rpb25zIGluIExpbnV4IChrbWFsbG9jLCB2bWFsbG9jLCBhbmQga3ZtYWxsb2MNCj4+Pj4+IHJl
c3BlY3RpdmVseSkuDQo+Pj4+PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4NCj4+Pj4+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4+
PiBDQzogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+Pj4+IENDOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4+PiBDQzogSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4+Pj4+IC0tLQ0KPj4+Pj4gLi4uL21lbW9yeS1h
bGxvY2F0aW9uLWZ1bmN0aW9ucy5yc3QgICAgICAgICAgIHwgMTE4ICsrKysrKysrKysrKysrKysr
Kw0KPj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDExOCBpbnNlcnRpb25zKCspDQo+Pj4+PiBjcmVhdGUg
bW9kZSAxMDA2NDQgZG9jcy9oeXBlcnZpc29yLWd1aWRlL21lbW9yeS1hbGxvY2F0aW9uLWZ1bmN0
aW9ucy5yc3QNCj4+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL2h5cGVydmlzb3ItZ3VpZGUvbWVtb3J5
LWFsbG9jYXRpb24tZnVuY3Rpb25zLnJzdCBiL2RvY3MvaHlwZXJ2aXNvci1ndWlkZS9tZW1vcnkt
YWxsb2NhdGlvbi1mdW5jdGlvbnMucnN0DQo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+
Pj4gaW5kZXggMDAwMDAwMDAwMC4uMTVhYTJhMWE2NQ0KPj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+
Pj4gKysrIGIvZG9jcy9oeXBlcnZpc29yLWd1aWRlL21lbW9yeS1hbGxvY2F0aW9uLWZ1bmN0aW9u
cy5yc3QNCj4+Pj4+IEBAIC0wLDAgKzEsMTE4IEBADQo+Pj4+PiArLi4gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IENDLUJZLTQuMA0KPj4+Pj4gKw0KPj4+Pj4gK1hlbmhlYXAgbWVtb3J5IGFsbG9j
YXRpb24gZnVuY3Rpb25zDQo+Pj4+PiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0NCj4+Pj4+ICsNCj4+Pj4+ICtJbiBnZW5lcmFsIFhlbiBjb250YWlucyB0d28gcG9vbHMgKG9y
ICJoZWFwcyIpIG9mIG1lbW9yeTogdGhlICp4ZW4NCj4+Pj4+ICtoZWFwKiBhbmQgdGhlICpkb20g
aGVhcCouICBQbGVhc2Ugc2VlIHRoZSBjb21tZW50IGF0IHRoZSB0b3Agb2YNCj4+Pj4+ICtgYHhl
bi9jb21tb24vcGFnZV9hbGxvYy5jYGAgZm9yIHRoZSBjYW5vbmljYWwgZXhwbGFuYXRpb24uDQo+
Pj4+PiArDQo+Pj4+PiArVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgdGhlIHZhcmlvdXMgZnVuY3Rp
b25zIGF2YWlsYWJsZSB0byBhbGxvY2F0ZQ0KPj4+Pj4gK21lbW9yeSBmcm9tIHRoZSB4ZW4gaGVh
cDogdGhlaXIgcHJvcGVydGllcyBhbmQgcnVsZXMgZm9yIHdoZW4gdGhleSBzaG91bGQgYmUNCj4+
Pj4+ICt1c2VkLg0KPj4+Pj4gKw0KPj4+Pj4gKw0KPj4+Pj4gK1RMRFIgZ3VpZGVsaW5lcw0KPj4+
Pj4gKy0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4gKw0KPj4+Pj4gKyogQnkgZGVmYXVsdCwgYGB4dm1h
bGxvY2BgIChvciBpdHMgaGVscGVyIGNvZ25hdGVzKSBzaG91bGQgYmUgdXNlZA0KPj4+Pj4gKyAg
dW5sZXNzIHlvdSBrbm93IHlvdSBoYXZlIHNwZWNpZmljIHByb3BlcnRpZXMgdGhhdCBuZWVkIHRv
IGJlIG1ldC4NCj4+Pj4+ICsNCj4+Pj4+ICsqIElmIHlvdSBuZWVkIG1lbW9yeSB3aGljaCBuZWVk
cyB0byBiZSBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMsIGFuZCBtYXkNCj4+Pj4+ICsgIGJlIGxhcmdl
ciB0aGFuIGBgUEFHRV9TSVpFYGAuLi4NCj4+Pj4+ICsNCj4+Pj4+ICsgIC0gLi4uYW5kIGlzIG9y
ZGVyIDIsIHVzZSBgYGFsbG9jX3hlbmhlYXBfcGFnZXNgYC4NCj4+Pj4+ICsNCj4+Pj4+ICsgIC0g
Li4uYW5kIGlzIG5vdCBvcmRlciAyLCB1c2UgYGB4bWFsbG9jYGAgKG9yIGl0cyBoZWxwZXIgY29n
bmF0ZXMpLi4NCj4+Pj4+ICsNCj4+Pj4+ICsqIElmIHlvdSBkb24ndCBuZWVkIG1lbW9yeSB0byBi
ZSBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMsIGFuZCBrbm93IHRoZQ0KPj4+Pj4gKyAgYWxsb2NhdGlv
biB3aWxsIGFsd2F5cyBiZSBsYXJnZXIgdGhhbiBgYFBBR0VfU0laRWBgLCB5b3UgbWF5IHVzZQ0K
Pj4+Pj4gKyAgYGB2bWFsbG9jYGAgKG9yIG9uZSBvZiBpdHMgaGVscGVyIGNvZ25hdGVzKS4NCj4+
Pj4+ICsNCj4+Pj4+ICsqIElmIHlvdSBrbm93IHRoYXQgYWxsb2NhdGlvbiB3aWxsIGFsd2F5cyBi
ZSBsZXNzIHRoYW4gYGBQQUdFX1NJWkVgYCwNCj4+Pj4+ICsgIHlvdSBtYXkgdXNlIGBgeG1hbGxv
Y2BgLg0KPj4+PiANCj4+Pj4gQUZBSUNULCB0aGUgZGV0ZXJtaW5pbmcgZmFjdG9yIGlzIFBBR0Vf
U0laRS4gVGhpcyBpcyBhIHNpbmdsZSBpcyBhIHNpbmdsZSB2YWx1ZSBvbiB4ODYgKGUuZy4gNEtC
KSBidXQgb24gb3RoZXIgYXJjaGl0ZWN0dXJlIHRoaXMgbWF5IGJlIG11bHRpcGxlIHZhbHVlcy4N
Cj4+Pj4gDQo+Pj4+IEZvciBpbnN0YW5jZSwgb24gQXJtLCB0aGlzIGNvdWxkIGJlIDRLQiwgMTZL
QiwgNjRLQiAobm90ZSB0aGF0IG9ubHkgdGhlIGZvcm1lciBpcyBzbyBmYXIgc3VwcG9ydGVkIG9u
IFhlbikuDQo+Pj4+IA0KPj4+PiBGb3IgQXJtIGFuZCBjb21tb24gY29kZSwgaXQgZmVlbHMgdG8g
bWUgd2UgY2FuJ3QgbWFrZSBhIGNsZWFyIGRlY2lzaW9uIGJhc2VkIG9uIFBBR0VfU0laRS4gSW5z
dGVhZCwgSSBjb250aW51ZSB0byB0aGluayB0aGF0IHRoZSBkZWNpc2lvbiBzaG91bGQgb25seSBi
ZSBiYXNlZCBvbiBwaHlzaWNhbCB2cyB2aXJ0dWFsbHkgY29udGlndW91cy4NCj4+Pj4gDQo+Pj4+
IFdlIGNhbiB0aGVuIGFkZCBmdXJ0aGVyIHJ1bGVzIGZvciB4ODYgc3BlY2lmaWMgY29kZSBpZiB0
aGUgbWFpbnRhaW5lcnMgd2FudC4NCj4+PiANCj4+PiBTb3JyeSBteSBzZWNvbmQgbWFpbCB3YXMg
c29tZXdoYXQgZGVsYXllZCDigJQgbXkgaW50ZW50IHdhczogMSkgcG9zdCB0aGUgZG9jdW1lbnQg
SeKAmWQgYWdyZWVkIHRvIHdyaXRlLCAyKSBzYXkgd2h5IEkgdGhpbmsgdGhlIHByb3Bvc2FsIGlz
IGEgYmFkIGlkZWEuIDotKQ0KPiANCj4gTm8gd29ycnksIEkganVtcGVkIHRvbyBxdWlja2x5IGlu
IHRoZSBkaXNjdXNzaW9uIDopLg0KPiANCj4+PiANCj4+PiBSZSBwYWdlIHNpemUg4oCUIHRoZSB2
YXN0IG1ham9yaXR5IG9mIHRpbWUgd2XigJlyZSB0YWxraW5nIOKAnGtub3dpbmfigJ0gdGhhdCB0
aGUgc2l6ZSBpcyBsZXNzIHRoYW4gNGsuICBJZiB3ZeKAmXJlIGNvbmZpZGVudCB0aGF0IG5vIGFy
Y2hpdGVjdHVyZSB3aWxsIGV2ZXIgaGF2ZSBhIHBhZ2Ugc2l6ZSBsZXNzIHRoYW4gNGssIHRoZW4g
d2Uga25vdyB0aGF0IGFsbCBhbGxvY2F0aW9ucyBsZXNzIHRoYW4gNGsgd2lsbCBhbHdheXMgYmUg
bGVzcyB0aGFuIFBBR0VfU0laRS4gIE9idmlvdXNseSBsYXJnZXIgcGFnZSBzaXplcyB0aGVuIGJl
Y29tZXMgYW4gaXNzdWUuDQo+Pj4gDQo+Pj4gQnV0IGluIGFueSBjYXNlIOKAlCB1bmxlc3Mgd2Ug
aGF2ZSBCVUdfT04oc2l6ZSA+IFBBR0VfU0laRSksIHdl4oCZcmUgZ29pbmcgdG8gaGF2ZSB0byBo
YXZlIGEgZmFsbGJhY2ssIHdoaWNoIGlzIGdvaW5nIHRvIGNvc3Qgb25lIHByZWNpb3VzIGNvbmRp
dGlvbmFsLCBtYWtpbmcgdGhlIHdob2xlIGV4ZXJjaXNlIHBvaW50bGVzcy4NCj4+IEVyLCBqdXN0
IGluIGNhc2UgaXQgd2FzbuKAmXQgY2xlYXIg4oCUIEkgYWdyZWUgd2l0aCB0aGlzOg0KPj4+PiBJ
IGNvbnRpbnVlIHRvIHRoaW5rIHRoYXQgdGhlIGRlY2lzaW9uIHNob3VsZCBvbmx5IGJlIGJhc2Vk
IG9uIHBoeXNpY2FsIHZzIHZpcnR1YWxseSBjb250aWd1b3VzLg0KPiANCj4gV2UgaGF2ZSB0d28g
b3Bwb3NpdGUgcHJvcG9zYWwgd2l0aCBubyBjbGVhciB3YXkgdG8gcmVjb25jaWxpYXRlIHRoZW0u
IFNob3VsZCB3ZSByZXF1ZXN0IGEgdm90ZSBvbiB0aGUgdHdvIHByb3Bvc2Fscz8NCg0KTGV0IG1l
IHdyaXRlIHVwIGFuIGFsdGVybmF0ZSBwcm9wb3NhbCB3aXRoIEphbuKAmXMgZmVlZGJhY2s7IHRo
ZW4gaWYgaGUgc3RpbGwgdGhpbmtzIGhpcyB3YXkgaXMgYmV0dGVyIHdlIGNhbiB2b3RlLg0KDQog
LUdlb3JnZQ==

