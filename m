Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9391C2AEF8D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 12:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24640.51986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcoFG-0006Dt-Vj; Wed, 11 Nov 2020 11:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24640.51986; Wed, 11 Nov 2020 11:24:58 +0000
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
	id 1kcoFG-0006DU-Rv; Wed, 11 Nov 2020 11:24:58 +0000
Received: by outflank-mailman (input) for mailman id 24640;
 Wed, 11 Nov 2020 11:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQiX=ER=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kcoFE-0006DP-MR
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:24:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97fcedf4-ba99-4046-9e0c-4a820942c744;
 Wed, 11 Nov 2020 11:24:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TQiX=ER=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
	id 1kcoFE-0006DP-MR
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 11:24:56 +0000
X-Inumbo-ID: 97fcedf4-ba99-4046-9e0c-4a820942c744
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 97fcedf4-ba99-4046-9e0c-4a820942c744;
	Wed, 11 Nov 2020 11:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605093896;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tnN7HrCCdRQHe2t+v+fKDZzXpzM3DS1XbhOKQxdhHTY=;
  b=RfBG30MU0S2VgEwd5efYL/Q9uC2CEz7L/ShnS7pnltKzCAp4krOCGJpR
   AyBVeOZ7HagMdYNN2pi3PG9yvUAuUKkWkk39c/HYa2YhDY1dgrTPCNp61
   jbab7QajL3rtXx05Kvha8hMP3LTLpb57IwAJ/HcRePDo0XcmFOKJnV4E9
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 57VZWVP9SY3bspiZszkhvaOBup+bkaOA77/RxrAET28+uw/oUnZQT/gY2igziH3k656OaMw6vM
 RS3z1Lx1xcPK79Qo0dc15k2IY36CG1YZ8a7U8IahpPEIIa//4YZthOZYbVX0Z/Aht1C4bVEtGt
 uAaNG8c8vUiEThtYrRtynsqoH1dS0wLk0a8IrLr5XBHhsBsmSKJyb4k4O+/2Dw5H6uxbB/Q6oI
 q0r9Paw2v2KqREH79i4T6gArdwCebg82kbjzPgeX5kfCo3aVcLujSUb2vh1svgZOMcf1sqCq3U
 DVw=
X-SBRS: None
X-MesageID: 30910178
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="30910178"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLn0EJ1r1YSRneRtCmi6WvAVOLdbQVkpduYjeCBhzx/V6Cd4ejYPvquyvz15uOoNJNu5Yz/r5DswwqeC2z4Q8nRzS1Fj8SPfJiK0R9OMd43HYjQ/y/Pc1jodeRYM9L8e8uIxnFlnKddbRshLLPZXHAo9DHh93Ge2o2oxI8OyDjbiibCaxG3bLqjGkm+wtJqxJY8eHjDrSDRFlh1qOxZG+2aNEzk/n+fXwEIuwCcO6uUOlLlkgeHthnLU+aZpmNFDTIHZpWxcXEeqXQ2AWhGZEsa7KVzATiKaRPNk7vU2lbCpaRKT1kiP4ONNtE6yoDEC5ZS+1ZUoRaesXT/PYZojlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnN7HrCCdRQHe2t+v+fKDZzXpzM3DS1XbhOKQxdhHTY=;
 b=NaHz7nZ4fBR3wbLR03B3tMjWoZVN9WG6wV0l0ChlcbpDfWHO+ClUsMCjboY2WBY4EUQfUqlWvKX2GoNuO0CpfHW64TyQuzLKG+uZnuUbFKqlyuTp/5tNFR5aztqkU0/4HfJbHxMB6XV6siQtxddLJfdcGwTRmuGZlZ4ocgXhzkLrYiXhWDB/I2/8So/RNvK0BOdsWAo7UuYotDFrrXoYuUxX11lSBTpWTw3j4ULQNr785JfO1bWBOJjIfXSw0SC6gT8n3sWGiGdyprl1tlcf8Z4oy+Y+4s4FWjB032hlrc+53JzyRuCfsF7M5wKX14+OuGPrNSAyJkXITpMlSc+2Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnN7HrCCdRQHe2t+v+fKDZzXpzM3DS1XbhOKQxdhHTY=;
 b=P10C9M3g5VIPNA96vFihcwVpfuY+R3TP9uVKPNBZ8mlpOO3Nio35bNRuDBXSbZGrlacOkV+I1FOJ9M4zn+yWYwefhH5hz6zF8Bd1dUdxNhjaHesWRFzmX4hbehXMHopiF3pjJV5CDy9kXAdL1EmMLtaSqj8LmFfU9wCFjFAsvw4=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs: fix documentation about default scheduler
Thread-Topic: [PATCH] docs: fix documentation about default scheduler
Thread-Index: AQHWt5KEiHxEu0uY0Eat6hiwYn2hl6nCtyuAgAAQI4CAAAQVgA==
Date: Wed, 11 Nov 2020 11:24:50 +0000
Message-ID: <19A67843-4667-46EB-8F11-109D8989BB71@citrix.com>
References: <20201110185129.5951-1-roger.pau@citrix.com>
 <9A8ADF64-4D76-4BEE-8E1C-4E23E77B9112@citrix.com>
 <e24211db-7ab5-d950-df56-669b90fda041@citrix.com>
In-Reply-To: <e24211db-7ab5-d950-df56-669b90fda041@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60cb569a-d1f0-42a7-77e0-08d8863467d0
x-ms-traffictypediagnostic: SJ0PR03MB5536:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB5536A4BB2705A4CE95C4F26699E80@SJ0PR03MB5536.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6zxWIz3b1SJMDFrw62XGDDdiIQ45R/rY7QFa2m1YCFqVOEzzbXv5rkJbqJmfUzEZInRuUYMKuBYvNTvsTM7uBxGG3vZFPHBjMY+KxYpeNjkOej6qgF9IHxomY/ZIlM5ujr/2ORnCh46rb/C/IpbVmTYydbJnOFvs6ZsEhBlne9hC/3x+Zd0fyblEnQfsnbM/W/Eq5Fhk4os/a7HCyRuIvLb6sehE5tplt3kWOdD7JGULMGfHiH5GvP32rmm6b2F5qUtfKBHRfBU2exZTFAFBOoEqMp657j6WhudonjAfOYlQgfZMwC9+pbZgwApZywCjE7Etji1OtvViTxWh/qv/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4229.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(478600001)(6486002)(86362001)(66574015)(71200400001)(2616005)(83380400001)(37006003)(36756003)(6512007)(316002)(53546011)(2906002)(6506007)(8936002)(8676002)(4326008)(6862004)(54906003)(26005)(186003)(55236004)(66946007)(76116006)(91956017)(66446008)(5660300002)(33656002)(66556008)(64756008)(66476007)(6636002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: t9qDSUoxlUMHHwxYlyLyWbjZxES9QHM5JP++pnVfwDehYXSVyPjySwSqpsVH9QhM4y2KqKVmzp31IpB8kYzAe3G+iULFcEJfnmJJk09eaAV0fejjzQCMidgHkPo9xVS3bGxvdgkzsu9hRiLa5AT/R1HwG++JlNEfnxM8/9teBf4G/3dzoZCGitwg+8jHGTUQn0ZTMksUm5IhQfAdAQstxzKvS/SOFYimwtpFnMnyM+b45wBiuSyt7A/bhPG5YXSWhBYS3ak/+rmwSK0fRcSzNrVcDKWSHX4yFVGjYDKYjcFovdwmpgI80fzOxyfyrHsVZLZuqRBdfQPH72whVuDvBSZnHhwspg/4/9YNmIZtUxPFx/cicx78EDJWnaoHzTurY0lBOZ0W2LH7y+rtI2Qyqy0M+f3d7tJQ8rMn6LfjZ86iktFzYFcqmyXifTWEr2sW7C/nZMjzj8hDeewihlF0ubfg7/Ec2TbTppXvUxzLkPlkjmKDif1tXqflVEMmrQ7tdCWVRCZg+9FNDzJAYLfbswe4Ow71uSS6RXr74I6lVxfzGiN2p7RDn8nBJeJtMPrqqpI5vO/+cXEmNnDmW0bvjzX4008XPmYmKANfyE0TVku129PauIZNnzgXvelpUmqyE9ZfcS9MFDkiteshiaqk1lKvbrYtZV88/3CB4CajBOBPk9XFMuagrpQA36qOUOwjfUDsIA3CmxGUONPvTDdfrTyZAREjGKcj7tef5ztDcM37S9NqdAv1BA91Yi2F0bzOhdSG06SJrsf5zopA5PJAjb5M5XqCoCzUohMXbHfdELcQSY61nJwXe6KHjBa0uM4AFWaImiZY2mOW2/80Ab+uUqWbN8RXDlU6MI+BcVrQWCbxjsV3opDxN3ThpjWydZBtu1hY2PsLDNFwzCmPgMHv5g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <366EFE78D0368F43B97EB7A3B09690FB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cb569a-d1f0-42a7-77e0-08d8863467d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 11:24:51.0162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: reC1OQ8GzK4220emLYkAMRhucYLsq8nrwllfa+flCvtAvJuvO+VVFwTqqlCu6dSJv3MkpJbShTufCDz+3gMXUFcvmHnw+h0u+laQd4igJYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTm92IDExLCAyMDIwLCBhdCAxMToxMCBBTSwgQW5kcmV3IENvb3BlciA8QW5kcmV3
LkNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxMS8xMS8yMDIwIDEwOjEyLCBH
ZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gDQo+Pj4gT24gTm92IDEwLCAyMDIwLCBhdCA2OjUxIFBN
LCBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+
PiBGaXggdGhlIGNvbW1hbmQgbGluZSBkb2N1bWVudCB0byBhY2NvdW50IGZvciB0aGUgZGVmYXVs
dCBzY2hlZHVsZXIgbm90DQo+Pj4gYmVpbmcgY3JlZGl0IGFueW1vcmUgbGlrZWx5LCBhbmQgdGhl
IGZhY3QgdGhhdCBpdCdzIHNlbGVjdGFibGUgZnJvbQ0KPj4+IEtjb25maWcgYW5kIHRodXMgZGlm
ZmVyZW50IGJ1aWxkcyBjb3VsZCBlbmQgdXAgd2l0aCBkaWZmZXJlbnQgZGVmYXVsdA0KPj4+IHNj
aGVkdWxlcnMuDQo+Pj4gDQo+Pj4gRml4ZXM6IGRhZmQ5MzZkZGRiZCAoJ01ha2UgY3JlZGl0MiB0
aGUgZGVmYXVsdCBzY2hlZHVsZXInKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IENoYW5nZXMgc2luY2UgdjE6
DQo+Pj4gLSBQb2ludCB0aGF0IHRoZSBkZWZhdWx0IHNjaGVkdWxlciBpcyBiZWluZyBzZWxlY3Rl
ZCBieSBLY29uZmlnLA0KPj4+ICBkb24ndCBtZW50aW9uIHRoZSBkZWZhdWx0IEtjb25maWcgc2Vs
ZWN0aW9uLg0KPj4+IC0tLQ0KPj4+IGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8
IDIgKy0NCj4+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9j
IGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+Pj4gaW5kZXggNGFlOTM5MWZj
ZC4uZWIxZGIyNWY5MiAxMDA2NDQNCj4+PiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGlu
ZS5wYW5kb2MNCj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4+
PiBAQCAtMTg3Niw3ICsxODc2LDcgQEAgd2l0aCByZWFkIGFuZCB3cml0ZSBwZXJtaXNzaW9ucy4N
Cj4+PiAjIyMgc2NoZWQNCj4+Pj4gYD0gY3JlZGl0IHwgY3JlZGl0MiB8IGFyaW5jNjUzIHwgcnRk
cyB8IG51bGxgDQo+Pj4gLT4gRGVmYXVsdDogYHNjaGVkPWNyZWRpdGANCj4+PiArPiBEZWZhdWx0
OiBzZWxlY3RhYmxlIHZpYSBLY29uZmlnLiAgRGVwZW5kcyBvbiBlbmFibGVkIHNjaGVkdWxlcnMu
DQo+PiBTb3JyeSBmb3Igbm90IHdlaWdoaW5nIGluIGVhcmxpZXI7IGJ1dCB0aGlzIGJhc2ljYWxs
eSBtYWtlcyB0aGlzIGRvY3VtZW50YXRpb24gdXNlbGVzcy4NCj4gDQo+IE5vLiAgSXQgaXMgdGhl
IG9ubHkgaGFsZiB1c2VhYmxlIHZlcnNpb24sIGJ5IGJlaW5nIHRoZSBvbmx5IHZlcnNpb24NCj4g
d2hpY2ggaXNuJ3QgbWlzbGVhZGluZy4NCg0KVGhlIHZlcnNpb24gaW4gdGhpcyBwYXRjaCBlc3Nl
bnRpYWxseSBzYXlzIOKAnFRoaXMgaGFzIHNvbWUgb3B0aW9ucywgaXQgYWxzbyBoYXMgYSBkZWZh
dWx0LCBidXQgd2XigJlyZSBub3QgZ29pbmcgdG8gdGVsbCB5b3UgYW55IG9mIHRoZW0sIG5vciB3
aGF0IHlvdXIgZGVmYXVsdCBtb3N0IGxpa2VseSBpcy4gIEdvIHJlYWQgS0NvbmZpZyB0byBmaW5k
IG91dC7igJ0gIFRoaXMgaXMgaXMgY29tcGxldGVseSB1c2VsZXNzIHRvIHRoZSBwZXJzb24gdHJ5
aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGUgZGVmYXVsdCBpcyBhbmQgd2hhdCBwb3RlbnRpYWwg
YWx0ZXJuYXRlIHZhbHVlcyB0aGV5IGNhbiBwdXQgaGVyZS4NCg0KVGhlIHZhc3QgbWFqb3JpdHkg
b2YgcGVvcGxlIHdobyBzZWFyY2ggZm9yIHRoaXMgb24gdGhlIGludGVybmV0IHdpbGwgaGF2ZSB0
aGF0IGxpc3Qgb2Ygb3B0aW9ucywgYW5kIGhhdmUgY3JlZGl0Mj1kZWZhdWx0LiAgQXMgbG9uZyBh
cyB3ZSB0ZWxsIHRoZW0gdGhhdCBhIGxvY2FsIGNvbmZpZ3VyYXRpb24gY2FuIG92ZXJyaWRlIHRo
ZSBhdmFpbGFibGUgb3B0aW9ucyBhbmQgdGhlIGRlZmF1bHQsIHBlb3BsZSBhcmUgc21hcnQgZW5v
dWdoIHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGVpciBzeXN0ZW0gaXMgZG9pbmcuDQoNCj4gSXQgd291
bGQgaG93ZXZlciBiZSBmYXIgYmV0dGVyIHRvIG5hbWUgdGhlIENPTkZJR18gdmFyaWFibGUgKHdl
IGRvDQo+IGVsc2V3aGVyZSBpbiB0aGlzIGRvYykgaW4gcXVlc3Rpb24gc28gcGVvcGxlIGNhbiBh
Y3R1YWxseSBmaWd1cmUgb3V0DQo+IHdoYXQgdGhleSd2ZSBnb3QgaW4gZnJvbnQgb2YgdGhlbS4N
Cg0KU29tZXRoaW5nIGxpa2UgdGhhdCB3b3VsZCBiZSBldmVuIGJldHRlciwgaWYgUm9nZXIgKG9y
IHNvbWVvbmUpIHdhbnRzIHRvIHdyaXRlIGl0IHVwLg0KDQogLUdlb3JnZQ==

