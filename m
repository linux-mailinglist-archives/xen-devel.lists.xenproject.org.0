Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F62AEE8F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 11:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24600.51926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcn7J-0007vl-Ew; Wed, 11 Nov 2020 10:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24600.51926; Wed, 11 Nov 2020 10:12:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcn7J-0007vM-Bt; Wed, 11 Nov 2020 10:12:41 +0000
Received: by outflank-mailman (input) for mailman id 24600;
 Wed, 11 Nov 2020 10:12:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQiX=ER=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kcn7H-0007vH-8i
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:12:39 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d0cdd09-96b4-48b0-b930-45a64c7c7dbf;
 Wed, 11 Nov 2020 10:12:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TQiX=ER=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kcn7H-0007vH-8i
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:12:39 +0000
X-Inumbo-ID: 7d0cdd09-96b4-48b0-b930-45a64c7c7dbf
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7d0cdd09-96b4-48b0-b930-45a64c7c7dbf;
	Wed, 11 Nov 2020 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605089553;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nzeKJm5vfRcS4dUFNR5EwXhpyFRAMD5LO0ZM1LgeYmg=;
  b=hH+6dynciQYXeYvjvdFSmlKjfg8z2Uslo+7mjf6fKd2NXWpjqIrc+PcV
   djHJCMmgEqFx69h+fySvafb2Coqn+e4XRvw1brKVyQ07N4k3NY/niETGP
   qLaiB/OW1M4sKcaBnXn0RTzQ41FtDvxFM4gQ8s5GjBxZkIk24rqTITX5U
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: p3Dwa8KDl9lOfTDLWNthFNjxV7oSt5Tj+/+8eD2hOKQb6IZ2qfJiU1K3tzWupcUWH1F+2x9pPU
 T0Ju46dFZOV5aYqWtbugZq2rFBPugsQK6iYB/1v/9Az9b2IoXoVC0oIpnnaMvVLg5ISptgk4SH
 nPz4+9CzkgAXeNLz2lEiY26+GpuG9nGd2P0tqq+X6VORGd6btk2f0UleH6acUDfM4KSliYTFZ+
 TNTs8PxBIuPRbmn2sKok9z1f1rT0HucJ9DiEn5SxtbndXJc4SzVgCUhnvWVuShJI5d97t8UYst
 TZc=
X-SBRS: None
X-MesageID: 32053252
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="32053252"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Am87dsUPgFD/FbLPdQEJj2hLs3+74IQOOKCcexNY7Rzclh/JWV7zlFtY8xPi98DwVS7PlFb/lKoi/5hk7XljEBhYQwRTqobwx/SWsmAXKyYvIsvONwHqMYJrEQDRl57e7eVpCiFsrTDxI5Va6eNagDML86bM6NzuEtPd13Z9nW/WBMM78qUYeX4cNuKXA1W2qWWWYQpVHI63s8Wft4lAhKXhIIBgWB29zckAuYXplI4jQO7kl3uMhtfAN/rsCpNZLankS+5n3iPdTMXJIpBJ1eQMNz6gyorUG/HEDORKFcX8kDwWvoJz1tcg6sAkaPq9RqSGxAxxSkHB8BRZRSGE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzeKJm5vfRcS4dUFNR5EwXhpyFRAMD5LO0ZM1LgeYmg=;
 b=I+2AaU2hooyM3qrPRj8GfhO6QOwLkOjSOF1I8/iMTu0OptKtlx7hY3+p38Oo512DeBc81GUXmbw7Y8Uruzv/1otG7JL5h8XJIesDSlgfsjDOGdHAAteR3QqxQ/qkbzZQV08ZFl3DuDwC8tmSxxIzHPOzq0bHrfa9SPOczfHiroCn+dF0aw/7KEtGk/vTctpsFWfFFxX1/qH8bzzi9szr9hyk5UzRqdfF50uFHsd711+Bn/Ft9XxpZ4RpF1Vo0/WcAEwKhVIkctXCebGWpvkuRxvpqxvrKfK+PRYvCL/FKL/phtMAQh2pfwE/RoYU9rRWImoU076Eg+tD7NempxtlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzeKJm5vfRcS4dUFNR5EwXhpyFRAMD5LO0ZM1LgeYmg=;
 b=QFxyJfeR5t9cPQh6P52Qg/W47luB/zsDcmd6M30yTIzKdRjy/CI/N9AGIn/cIq9i0cGr5WXHXa8DC/9G3b5ao6xJzrrt5YQAVtKVvkmNRaOSc2owvdbqsXSD8HhQjo00QU1tzSs+GC8fS5XxcIvVM5HLzPrEVD8Svv4kYYsNeww=
From: George Dunlap <George.Dunlap@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs: fix documentation about default scheduler
Thread-Topic: [PATCH] docs: fix documentation about default scheduler
Thread-Index: AQHWt5KEiHxEu0uY0Eat6hiwYn2hl6nCtyuA
Date: Wed, 11 Nov 2020 10:12:28 +0000
Message-ID: <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
References: <20201110185129.5951-1-roger.pau@citrix.com>
In-Reply-To: <20201110185129.5951-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0064d171-0e17-4545-b450-08d8862a4bcf
x-ms-traffictypediagnostic: BY5PR03MB5094:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR03MB509473581C7C1EEB1D7D482399E80@BY5PR03MB5094.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KcnNhK4wtpaKDLnN31usdp3t1WO67K7zfi+csm7dh2cJVPl2lW9E10xV2HsIoGbAJWnm/E+D94ms8Y4gziEx8kDQQV+YdXt/Olk9LvX38koTx9c8ZAHlEGaOBbVPfnBgzssn23zRYuo6Z+z3iWRfYkT1jd7tDppoI/Dt8AXHjKUY6AMD/fSWFq31iJ0aUOlzkLLFpSgkbH+b/Qg87+cr1xRkTsgsZNEbGJZYS8GPSc3V01Ms+cIZTrUERx0+1JLXvyxFG8535U99aSjWidxtFNtEfJVbifuwnosZGsAszfPeP6yDh29DL5q5jWMPssR8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(26005)(2616005)(36756003)(186003)(6506007)(55236004)(6636002)(4326008)(71200400001)(66476007)(6486002)(2906002)(6512007)(83380400001)(37006003)(6862004)(66446008)(66556008)(66946007)(316002)(64756008)(76116006)(91956017)(5660300002)(53546011)(33656002)(86362001)(8676002)(8936002)(478600001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: c09hj9OIEvuleHOfVTibLH6ESsEo9HjG8bwQxYainXgSSnyEvzWVLV5OW29bPJUpbKwaCV89njKV6CotNSr0VfIy96tRgcEG4KtjizEhHzmKft6Z7krgZKhC4XwXrsEkrTjg8RZ9V8UPwCRlHlbmpr4DuthMsA2TOVf/QcTVlbN7UaD9sy21TwYvX+r4y9l7gk2Q61wprW51ngUO+lQAYXjetWh4qAzwUqX4iwZEew+Lby8pvWrdzCGEfNi1aGEoiXfxX2xn/3xJVVFyKRXi5ufX7kZ5nFskpOVBAJWirkOkEdvADMJBBsdXMOm3hkkXT87gIVRwwxB6gwYZJOEpxkYQMMtabGcb0egGix373n61Nk9Vb5CsyAAkIfeaZ3FfjKxo4ups/NQ8pZHJu2XFFJauoTzBpYQBJ1RvhtEgd3n/CVHAtCAo3FIVI30fsG8TpywpLRZFchS0CNnySg8CItejfY3vDCcZqDPJiuX/eqe5uyK7GeuXY0mSw+5SsfodhqYf2Shntc0rfafj00bkjs1N8rErsYrOiKW5osDl5tN42RPdLU2847gq5hokuzTN/W+12WHc3crczwHt43VvliFWf11VJAXMgZurL96fzamwUaxu/6zTYVC4QmOqKoXHAQCb1+b5+kzoF1RSimDfmZyQEbqki8H7iKMB4FDiK5ln7UaOxDuOCtd85MiCVC3PZTupDLn/otn42GBYxP5vB/8sIkpAaIj1C6VHzDIpO7T2PLx8W39T3T0typRYGXJ3XTzwoc1ro+lrVL7XcIzGZ+siL1zuoSWQCvajidajDasyar0CErAr0uuQfyu3Dm8qVQE6mnuDkM3pBhDC0QtASOFuOms3G4ZguVC8J+FO+CgQC7PiAg6Y//LpU+3/RHkydenONP4rkwVXVny/L1yLCQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <803934165E1AE24A8802D9AA795B6A3B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0064d171-0e17-4545-b450-08d8862a4bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 10:12:29.0027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDYT2qKcyc+3VkMseT4MdAAhgmB04JKK0nTQV5QWIaN0OQktvRz9HMzTTVldVlXR7cN4S1CgYwyI91okchyIhqBQAS5iVHPzw1k4oxHIJlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5094
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTm92IDEwLCAyMDIwLCBhdCA2OjUxIFBNLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEZpeCB0aGUgY29tbWFuZCBsaW5lIGRvY3Vt
ZW50IHRvIGFjY291bnQgZm9yIHRoZSBkZWZhdWx0IHNjaGVkdWxlciBub3QNCj4gYmVpbmcgY3Jl
ZGl0IGFueW1vcmUgbGlrZWx5LCBhbmQgdGhlIGZhY3QgdGhhdCBpdCdzIHNlbGVjdGFibGUgZnJv
bQ0KPiBLY29uZmlnIGFuZCB0aHVzIGRpZmZlcmVudCBidWlsZHMgY291bGQgZW5kIHVwIHdpdGgg
ZGlmZmVyZW50IGRlZmF1bHQNCj4gc2NoZWR1bGVycy4NCj4gDQo+IEZpeGVzOiBkYWZkOTM2ZGRk
YmQgKCdNYWtlIGNyZWRpdDIgdGhlIGRlZmF1bHQgc2NoZWR1bGVyJykNCj4gU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDaGFu
Z2VzIHNpbmNlIHYxOg0KPiAtIFBvaW50IHRoYXQgdGhlIGRlZmF1bHQgc2NoZWR1bGVyIGlzIGJl
aW5nIHNlbGVjdGVkIGJ5IEtjb25maWcsDQo+ICAgZG9uJ3QgbWVudGlvbiB0aGUgZGVmYXVsdCBL
Y29uZmlnIHNlbGVjdGlvbi4NCj4gLS0tDQo+IGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBh
bmRvYyB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9j
IGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+IGluZGV4IDRhZTkzOTFmY2Qu
LmViMWRiMjVmOTIgMTAwNjQ0DQo+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBh
bmRvYw0KPiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4gQEAgLTE4
NzYsNyArMTg3Niw3IEBAIHdpdGggcmVhZCBhbmQgd3JpdGUgcGVybWlzc2lvbnMuDQo+ICMjIyBz
Y2hlZA0KPj4gYD0gY3JlZGl0IHwgY3JlZGl0MiB8IGFyaW5jNjUzIHwgcnRkcyB8IG51bGxgDQo+
IA0KPiAtPiBEZWZhdWx0OiBgc2NoZWQ9Y3JlZGl0YA0KPiArPiBEZWZhdWx0OiBzZWxlY3RhYmxl
IHZpYSBLY29uZmlnLiAgRGVwZW5kcyBvbiBlbmFibGVkIHNjaGVkdWxlcnMuDQoNClNvcnJ5IGZv
ciBub3Qgd2VpZ2hpbmcgaW4gZWFybGllcjsgYnV0IHRoaXMgYmFzaWNhbGx5IG1ha2VzIHRoaXMg
ZG9jdW1lbnRhdGlvbiB1c2VsZXNzLg0KDQpJ4oCZZCByYXRoZXIgc2F5Og0KDQrigJQ+OA0KDQo9
IGNyZWRpdCB8IGNyZWRpdDIg4oCmDQoNCkRlZmF1bHQ6IHNjaGVkPWNyZWRpdDINCg0KTkIgdGhh
dCBkZWZhdWx0IHNjaGVkdWxlciBhbmQgc2NoZWR1bGVycyBhdmFpbGFibGUgY2FuIGJlIG1vZGlm
aWVkIHZpYSBLY29uZmlnLg0KDQo4PC0tLS0NCg0KIC1HZW9yZ2U=

