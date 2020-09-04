Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50825DC8C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 16:58:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kED9c-0005ME-4a; Fri, 04 Sep 2020 14:57:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V0SP=CN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kED9a-0005M9-1C
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 14:57:26 +0000
X-Inumbo-ID: f0c5a70e-72c9-43e1-a936-166daea98545
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0c5a70e-72c9-43e1-a936-166daea98545;
 Fri, 04 Sep 2020 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599231444;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BV2byaCTwexqkeSlxRJwku7ZKKhtUPCnd6fJyurco0Y=;
 b=FioCXmQbuV92W1mBNe9HsmlljM2qNY1aoXHkPuGV1JRjmwmXCjvt6wwP
 75PbLv+lZ4nid9qvgalosOaWz9uCd9iNviSNkAL/PPZ0Vp9L0YbrsQoDq
 p5nZnLLJ/kb8lyECUvZH94rAw6J004SOzuK69Il0B7F4WbykrnJWWp3tO s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: GV2reJ0t3zg6LiTfO05SiMe+BqGxDhkoLR2bpyhSZITqn26AQQM6knry0cz4OWCbdB5ksKzUjj
 kKbUVrHO0wf9t3sl2cYczx5jmFlDGerpNVzU2w7Eq3VhsXVgS1FAyKsKqMPOYDBDyO79JfPrLF
 CmQPYUEKcY1T8A9FGqFb9t712nBlVRPajVpABClH8VfpvhyeYpO6VWSY/T/0YDEkxvQjmBrP5m
 rUzo40qcnm8+6ngaLkoz4D316TxCW+DAPdn/HnCrUopPs6l7cPUTdQ2eqtnKaS46fXyZto3tsY
 2cg=
X-SBRS: 2.7
X-MesageID: 26143329
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26143329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr5ayc+IhQkKHGCOA6kTgytvYjUZ2wtXVBUc2eRNafhPY8PLoU9OGOfKn8zZiALvQcmEOcdZhMtWfmSmTpz5THU2yNwmfph/HXDTbDzMW8xMUHU6NskKBEghdDeEz6eb5d629hKy/wVMJeQqvCz29F2fsiRA0o3h9DhJLNWFu4lA1YBk2rpl64Gy02nCVIe1xeHjsEsZgamjv9/gpi8c/GUZ6mqJKtvHhR/iZYm79gOsHNCUaX4Q80IlkCT0PoZ8o2kfs/d7rlg+39kh2X4dQJLVgN/8VRTsnzQUPezTUmkpVdWce3oP/uhCLavA6ESbf+xfTjyLijUWsemhsSZ+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV2byaCTwexqkeSlxRJwku7ZKKhtUPCnd6fJyurco0Y=;
 b=XBJyfvToKeG9aBVT8VtI8HMRqfHxxz4VVakKbUIbPiFVQB52SyqSuDUQvyalltohg0znBYZsqApxx/DxlzgcbJ7Gx4XHzAoq+qbPnF0hesH2fqMJp0iq0sf8dXB+BYcSY0NTVyqoAXDFq6g+ZexZIMc6MkEM0IcOH00N+ps50JJHLpTOXxmcioi3mddUT9AG4BuWMwoQkq4r4/txy0hzO5oUtRRrBwwNxIVOG8PHMuxyrt6mq1+uAKjOczGON8DV33Pkm7xMVBcbQbk/oEtbFrIDoVn9ia+0nYCyvd2CufIfSPPEg5VBA/dP3mgbL/mz92Xeqjol9OL2bJ1vO61bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV2byaCTwexqkeSlxRJwku7ZKKhtUPCnd6fJyurco0Y=;
 b=e/NbnMuYPh3uJBe2P8wPWHG/++yNltH9BLKRUcs7xOLUEvKCYcmsL0lAe6+u/Y8pN4v2EDiqsMjtl3RH5utkyst70QxWT33SmV4lZq/Gt9VsuzvUe6En3bOO1Tgc2qB7xwzu2KmJ82w5XGekADStIeXWMCp37u+N6C7KqruZVpg=
From: George Dunlap <George.Dunlap@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
 <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Topic: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Thread-Index: AQHWgqFQhHT7mTtQgECZKsLV4pzAaalYRMuAgAAGaQCAAAHFAIAAANWAgAAA5YCAABBzgA==
Date: Fri, 4 Sep 2020 14:57:19 +0000
Message-ID: <C0139E9F-774B-4EB6-95A8-28E69ADB8F9A@citrix.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
 <e0c040bd-8b85-8dc9-37ee-04dd83adf072@suse.com>
 <6D291A71-A0A6-401E-B9F6-BF6F992E60DF@arm.com>
 <48BB5235-F9FD-4E81-8CAE-59BEFB24DDC0@arm.com>
 <E40FED16-38FB-443A-B1B4-8B0444829A06@citrix.com>
 <C8F498B4-3184-4230-A5E4-13B7EABAE3A7@arm.com>
In-Reply-To: <C8F498B4-3184-4230-A5E4-13B7EABAE3A7@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28e57668-a31f-43e0-f420-08d850e2d29a
x-ms-traffictypediagnostic: BYAPR03MB3576:
x-microsoft-antispam-prvs: <BYAPR03MB3576F7236B45DC228AF3F9E9992D0@BYAPR03MB3576.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4HXuewZEG8JGSrdOdoAqH8hQPws/iQM3OoWNj9ssGn/5Ekv8pRQwHTPvTPBatGvq1RpJe+zyMHOifcwjBlT23OiLhdEUEDYCR2glYmhGV+4fY6q+jmmv9whnWGkC4Wu+ypF3DMIUICEIzUYI58ruloLpYoiLbHOICeyHg9ZDxwwfNOegEdCxKjUzPVzbLfy2uSbQHim9hXvuk5Zw6nYT1y4T4yRAqD0+izb0hhzDqSLTwHUW7F5yVnA+/fYtb635TuLlUwduw3mowJy9VDamWIFeuzPoq6IpFeVBrbI+QcUErcJrAhRVV61ld5wlbZfm+miJ2CaI9gWTOo5Jh3dM+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(6486002)(4326008)(6916009)(6512007)(6506007)(186003)(26005)(66556008)(316002)(66946007)(53546011)(54906003)(33656002)(5660300002)(55236004)(86362001)(2616005)(8676002)(66476007)(36756003)(478600001)(76116006)(91956017)(8936002)(71200400001)(2906002)(66446008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cXhjZ9npUReTIOJLK93uOWVJ9fbK25PKXI0cijY1mzphFYu5DFwVQhnCoG9ZLUgOLC5PaA1khEiwZC8Oh94wbhyNKLFXoKi1w04dD0Ho9798lOE7M3ZDtgrr/LgfRvEccaEdoxlroHc58LpnvJBPh7HC6xyblwOGzh/piEtowGmuSz5dmSUPSc9yE6bYtUmXmjf5tEMFFaqQmWqMeYqdE+UsGRwUXsfcMd0Hh8WfhKlSFIv+/wLTUswEaaNLNqgmELyshaRpoPeN6DAN+W+2CUgSFZLDx94e3zCeA1pvm4QGmeqxNZGbxsOM4a80Lr0SzETbz3sBWtV9Ol7ZOXYPMBIxqJhN0WuQL7BSrPTzTaS9h1Ye2RRXynASGGjPymPGwRUi4r2wMycw7QuCGhohMYJ74P0/3qt1sEEz2+7Q7qrLwUqxs/6FnWfqD8dKKA9phqthyohbGcFZfvfbtil5U1KB9xZd6dM1Rp71p+Ms15Awt5dyTVNOTraEA9xRwEvBsZIHnbbYow7vY5SCEBZ2rAoWh/RxZD16TyafR/BdPyNwOS+QNJX0VwR34/U/vsrJBH3C+gVZT4Fp4Y8GfRHMjbnBPKvohoXhJjB5QqmSmp3Jd7JlSCUtzwhAy1iusFXAwIb8y6duuv2zQVAo+jZ1XQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <13EE8E6B1BB76E4785F1BA3961649048@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e57668-a31f-43e0-f420-08d850e2d29a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 14:57:19.7477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjKBE/qoOJlfvjYXfWQigj+oQ6VEQyvMmlIyc/dH/vkiZx0dVUkLvsAMpUC52ZVduXjkJPgZLOsUCnqYyYCPU6z1aVYa4CcTJ9qEkTs+cjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3576
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gU2VwIDQsIDIwMjAsIGF0IDExOjU2IEFNLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gNCBTZXAgMjAy
MCwgYXQgMTE6NTIsIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+PiANCj4+IA0KPj4gDQo+Pj4gT24gU2VwIDQsIDIwMjAsIGF0IDExOjQ5IEFNLCBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+
PiANCj4+Pj4gSSB0cmllZCB0byBhZGQgYSBjb21tZW50IGFuZCB0aGF0IGlzIHdvcmtpbmcgd2Vs
bA0KPj4+PiANCj4+Pj4gUmVtYXJrcyBmcm9tIG15IHNpZGU6DQo+Pj4+IC0gSG93IGNhbiBpIGFj
ay90ZXN0L3JlamVjdCBvbiB0aGlzID8NCj4+PiANCj4+PiBhbnN3ZXIgbXlzZWxmIGFzIGkgZm91
bmQgdGhlIHRodW1icyB1cCB0aGF0IGkgaGF2ZSB0byBjbGljayA6LSkNCj4+IA0KPj4gSSBoYXZl
IGEgYnV0dG9uIHRoYXQgc2F5cyDigJxBcHByb3Zl4oCdIOKAlCBkbyB5b3Ugbm90IGhhdmUgdGhh
dD8gIFBlcmhhcHMgeW91IGRvbuKAmXQgaGF2ZSB0aGUgcmVxdWlzaXRlIHBlcm1pc3Npb25zLg0K
Pj4gDQo+PiBCdXQgSSB0aGluayBhZGRpbmcg4oCcUmV2aWV3ZWQtYnnigJ0gaW4gYSBjb21tZW50
IHdvdWxkIHdvcmsganVzdCBhcyB3ZWxsLg0KPiANCj4gV2hlbiB5b3UgYWRkIGEgY29tbWVudCBh
dCB0aGUgZW5kIHlvdSBjYW4gc2F5IOKAnEZpbmlzaCByZXZpZXfigJ0sIG1heWJlIHRoYXQgb25l
IGlzIHRoZSDigJxSZXZpZXdlZC1ieeKAnS4NCj4gV2UgbWlnaHQgbmVlZCB0byBjaGVjayBpZiBn
aXRsYWIgaXMgbm90IGFkZGluZyB0aG9zZSBhdXRvbWF0aWNhbGx5IHNvbWVob3cuDQoNCkF0IHRo
ZSBtb21lbnQgd2XigJlyZSBub3QgZ29pbmcgdG8gdXNlIHRoZSBnaXRsYWIgbWVyZ2UgZnVuY3Rp
b25hbGl0eS4gIEZ1bmRhbWVudGFsbHkgdGhlcmUgaGFzIHRvIGJlIG9uZSDigJxjYW5vbmljYWwg
dmVyc2lvbuKAnSwgYW5kIGF0IHRoZSBtb21lbnQgdGhhdOKAmXMgdGhlIHhlbi5naXQgb24geGVu
Yml0cy4gIENvbW1pdHRlcnMgd2lsbCBoYXZlIHRvIGRvIGEgbWFudWFsIHB1bGwgJiBwdXNoLCBh
ZGRpbmcgdGFncyBtYW51YWxseSAoYXMgdGhleSBkbyBub3cgZm9yIHRoZSBtYWlsaW5nIGxpc3Qp
Lg0KDQogLUdlb3JnZQ==

