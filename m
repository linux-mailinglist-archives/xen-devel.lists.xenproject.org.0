Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0C257FA3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 19:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCndl-0000Yl-MI; Mon, 31 Aug 2020 17:30:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdQD=CJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kCndk-0000Yg-GB
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 17:30:44 +0000
X-Inumbo-ID: 1783ed5c-bcb0-4a51-baac-a02d627295c4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1783ed5c-bcb0-4a51-baac-a02d627295c4;
 Mon, 31 Aug 2020 17:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598895042;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xWW2mS9H6XxzctpOrRTjLv6IyOQu9xAlXX3z1zPHF64=;
 b=g6s0H5/BO0xJz5kWqlYDzbxBeJiQ2UhfjC8arfPgy5gcgtiOickaoWe1
 58ehvqVgSqeUK8VUaNQhGsbFX7OxcAJPNex6YJ2eph0VDvHC2U31bvLf0
 bsn7z4JFB4gRUs6okLANVaGUEl/wPaKocabpnPGcdT51EWmadqvoLVt2S 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: pvaf1+/FkIHFfPGkDbQv/yJVttyTZTErccOOxL3DScvukcadMdi5/xxugGfhVCbAvyFIMa5TuH
 pqVk/gUIWcxkqhTCtwVrO2kyqR6ovCFJ+oVRa+v959iQz6dw9lMq7HkbkZHLF+M9UYFmX79yma
 Z+0gShqqCw55O0dZEdxkKnip8vM6mcUKmyRz6yoPDFk7jeY28BtKn8K7J14Dt+5ehFXD4yjJuJ
 yx94U2j3J6QNOOOOtkiDiSomer4zVptNx39U3Bwd1Q4uxP2DNSb16H4WzmWxhZjd2iay5H0ae8
 6yc=
X-SBRS: 2.7
X-MesageID: 26624382
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,376,1592884800"; d="scan'208";a="26624382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzvuLTVEk8unGcqudJyJ7v+jfDq0NS2aCHf283uYGkgCUPiQKiX2ga0vAMTLuXObjs/ouUyw1xpbRN81BN71Wy4BfyjcnhVmMqwWLLRbkrKop7HbCfNhGh6MoMBQGwxoeSkka5d91+/6IyjSjJa39hEEtNg8huLbLQ5ZWOeOHW4OkNxWEqCXJZU4PIe2LfjQo+9wnACpN4BNIY4aefRuM1MNhMt04HXjjaC+/fSX5gnrxod79/vGftbx02j0T1anZPK2lVUQNqtTtorSqgDa/hZC/0H/P1TXmayi9An2C8AEEqyLuv3wZo7yeZEvclA3cvmJAcVJYA8Qw/RylvktUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWW2mS9H6XxzctpOrRTjLv6IyOQu9xAlXX3z1zPHF64=;
 b=fhQ8Bq3M36wLjd0QtgL61hK4NF5Ic5mti+ka5DxwGbaWl8J1b28sn2fKYkJEumKqw4TZqLl/SH5Edud05aOdu/bgdQ73H4vFklu3OzEoHqhrYNYPWvYMTzSjh+J3u/QWZ0mzLb03YPCUHflE52oisp4NVqDZx+sHjJZc7qejHqwNJtCJ1fYlFYDVIQTQ+6vcmDcgmJpaq27mvLaErLeUlSWhNvmhI63CX+6lGZuTz3zevPYSewOn8cfV7jDjcxCeRJO5uGKZ7ga6NJcXW2GHs8PY1WWc4Fs/QHTIXdMr0CWTllCmNyUn3GUvMopRsCLOl/cM3vqeGyg2rbBUp4Nj7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWW2mS9H6XxzctpOrRTjLv6IyOQu9xAlXX3z1zPHF64=;
 b=QNw2dGuo/Oxq1PV2Q+ngZORqPKIdNU0D5dPR+oFl1h0CFHvVU+cuyZwLNibsyHNpofeTF2SNOa2aOgyKL5DnRRNxNboETbWOXgHdBeqkIjhlSaGGeSt5e0dk3cbnutOrXDEsqrOcXYOYPOuchA2ymYtOiAWJwKEF1VmdpzvyyXI=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, "rosbrookn@ainfosec.com" <rosbrookn@ainfosec.com>
Subject: Re: Golang design session follow-up
Thread-Topic: Golang design session follow-up
Thread-Index: AQHWXvbkqZX3isiLZUWTcowoxjQWaKlN6fcAgAA0ZICABGBsAIAAPCoA
Date: Mon, 31 Aug 2020 17:30:38 +0000
Message-ID: <663C7F38-63D2-4C47-A9BA-0964D89B745A@citrix.com>
References: <20200721003548.GA9581@six>
 <639307EB-23A4-4D76-8BDB-7F2FA4F149D1@citrix.com>
 <317B0F11-2FD0-4B74-B148-C726037DFB7A@citrix.com>
 <20200831135516.GA277956@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <20200831135516.GA277956@FED-nrosbr-BE.crux.rad.ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b394e396-5997-4dc1-ee7f-08d84dd39459
x-ms-traffictypediagnostic: BYAPR03MB3703:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB3703774D0CC0495C8016B7A099510@BYAPR03MB3703.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U93Sy05qFnmjBVr6NJUe9x9wa9AsA3dshwK2hjcR9A5Ug9W3Bk5qcvNCFTt7oxmegg4xYc4wpWYwTUtEIH6kL6G3jg7ZTloOHkNgdhp5pYV76Uxbpo0z/UpiMYBIhSnnN7Y6/L2+L+zSs5VQTkvPlcbWuoonJnXy+X3X9GcTcSaoPW43hSe9ZXfOXGWWHdZxMnltBgHVsuYEZGF07Upy0V5mkUB7JTj8e3McEzDLKJUwF1S8havQyk6390ubGn714IaYD1wrMbbtsPsSUx5xDiqdzRfSVhZe7L+0k4Of50F9Jc/5YmZn4rvHSh5Qj42HUb0V9sRWCgt1q8RqU8aJ0mKprLxbNEANSZ4OkhqFOWpduvzGLkpVpmMjIslpDVPoH8FmgTQAp3f1dN1H3gyPkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(54906003)(316002)(66556008)(66476007)(64756008)(66446008)(53546011)(6506007)(2616005)(8676002)(186003)(83380400001)(26005)(36756003)(86362001)(8936002)(478600001)(4326008)(2906002)(6486002)(71200400001)(6512007)(91956017)(966005)(6916009)(66946007)(5660300002)(76116006)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 6+cFHYTIGxWl10hWK0w6WiBsjN897GhBQ229tcgbhzUwiJ+yT3g+nkqDtKZxf6hyi/393JCJXr/5e1pFVlpakS6bf32DmZfDopai5XrWMjf67A++lEl3ipXqHkpMx9V0pxLHhc/fzurMQzHiAyMRq1roLNri2FKaKxi63TplrsQQWS2HtObHrTZ132qhB0bjDirliyM/Y7zpfn4FURFsqLOLcVfXtL54r4uSFKlO/BHXpY9hsEFe1BjKT7kYDwAgObeAL9VwoXxzOpM1+v/h+etyLIpuTrqV+j5EZJA/0yYRlwybmzRzCVnLgN648Zqap1fGSsMKEDlGK4zrVhN4TS/ZnH1sAH8V6Sa0OEqClu94Aqk41OZjgMZE83K9r0gOz4oYtxzO5eWyniIuXa4w7X7tpJhPLC0dX+ztDC1IlVJzP2mnNDuIpQURgpuVn4yb+/2E0F7+lMBtj5IrPf80IRoVslIhlmoRPTXlNTemiPdg12gFVR6fITyaJcPtS7WAezeYlGjIftdDe+kbUaGW8XoU3q0l5NYXdR1RjGML0nb17krWw/bNaz87t/x6T2yJnrwQu8DPOrDpVOZ+2NJrrPZ8iZMcniYjehK60dlqAPmfHhz7gRZVN/F33nqAl57RHkY4T2kbtwyqfIDqXTx1Jg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <E87EAAF6C5D9A145A94C9534E017633D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b394e396-5997-4dc1-ee7f-08d84dd39459
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 17:30:39.3696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BUzFObyEoVhDp/FYjd5VvQHlWeAJJywNSH8hQZmGQG+lqrmUR+aHbpPYUAi6cTWR5txjhxtCM9TYJlxpXCOXqtTsHK1AE/6pnsuITASNXgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3703
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

DQoNCj4gT24gQXVnIDMxLCAyMDIwLCBhdCAyOjU1IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgQXVnIDI4LCAyMDIwIGF0IDA3OjA1
OjA4UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIEF1ZyAy
OCwgMjAyMCwgYXQgNDo1NyBQTSwgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+Pj4gT24gSnVsIDIxLCAyMDIwLCBhdCAx
OjM1IEFNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90ZToNCj4+Pj4g
DQo+Pj4+ICMgTG9uZy10ZXJtIGhvbWUgb2YgdGhlIHBhY2thZ2UNCj4+Pj4gDQo+Pj4+ICBJYW46
IEF1dG9nZW5lcmF0ZWQgc3R1ZmYgaXMgYmVjb21pbmcgbW9yZSBhbm5veWluZy4NCj4+Pj4gDQo+
Pj4+ICBEZWxldGUgYWxsIHRoZSBsaWJ4bCBhdXRvLWdlbmVyYXRlZCBzdHVmZiBmcm9tIHN0YWdp
bmcgJiBtYXN0ZXIsIGFuZCBoYXZlICJvdXRwdXQgYnJhbmNoIi4NCj4+Pj4gDQo+Pj4+ICBUaGUg
cmVhc29uIHdlIGhhdmUgdGhlc2UgaW4tdHJlZSBpcyB0aGF0IG90aGVyd2lzZSB5b3UgY2FuJ3Qg
YnVpbGQgKmZyb20gZ2l0KiBpZiB5b3UgZG9uJ3QgDQo+Pj4+ICBoYXZlIG5ldyBlbm91Z2ggdmVy
c2lvbnMgb2YgdGhlIHJpZ2h0IHRvb2xzLg0KPj4+PiANCj4+Pj4gIERpc3RyaWJ1dGlvbjogTWFr
ZSBhIHJlcG8gb24geGVuYml0cyENCj4+PiANCj4+PiBTbyB0aGlua2luZyBhYm91dCB0aGlzOiAN
Cj4+PiANCj4+PiBUaGUgZmlyc3QgcGxhbiBJIGhhZCB3YXMgdG8gaGF2ZSBhIHNjcmlwdCBpbiB0
b29scy9nb2xhbmcveGVubGlnaHQgKGFuZC9vciB0aGUgTWFrZWZpbGUpLCB3aGljaCB3b3VsZCBi
ZSBoYW5kZWQgYSBkaXJlY3RvcnksIGFuZCB3b3VsZCB0aGVuOg0KPj4+IA0KPj4+IDEuIFN5bmMg
c3RhdGljIGZpbGVzIGZyb20gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0IGludG8gdGhhdCBkaXJlY3Rv
cnkNCj4+PiANCj4+PiAyLiBSdW4gZ2VuZ290eXBlcy5weSwgaGF2aW5nIHRoZSByZXN1bHRpbmcg
Z2VuZXJhdGVkIGZpbGVzIHB1dCBpbnRvIHRoYXQgZGlyZWN0b3J5DQo+Pj4gDQo+Pj4gMy4gUnVu
IGBnaXQgZGlmZmAgaW4gdGhlIHRhcmdldCBkaXJlY3Rvcnk7IGlmIHRoZXJlIGFyZSBhbnkgY2hh
bmdlcywgdGhlbiBhdXRvbWF0aWNhbGx5IHJ1biBgZ2l0IGNvbW1pdGAgdG8gY2hlY2sgaW4gdGhl
IGNoYW5nZXMuDQo+Pj4gDQo+Pj4gVGhhdCB3YXkgeW91IGNvdWxkIGp1c3Qgc2V0IHVwIGEgY3Jv
biBqb2IgdG8gc3luYyB0aGluZ3Mgb3ZlciBvbiBhIHJlZ3VsYXIgYmFzaXMuDQo+Pj4gDQo+Pj4g
VGhpbmtpbmcgYWJvdXQgR1BMIGNvbnNpZGVyYXRpb25zLCBob3dldmVyLCB5b3XigJlkIGFsc28g
d2FudCB0byBpbmNsdWRlIGxpYnhsX3R5cGVzLmlkbCBhbmQgaWRsLnB5LiAgQW5kIHRoZW4gb2Yg
Y291cnNlLCB5b3Ugc2hvdWxkIGFsc28gaW5jbHVkZSBhIHdheSB0byBidWlsZCB0aGUgZ2VuZXJh
dGVkIGNvZGUgZnJvbSB0aG9zZSB0d28uDQo+Pj4gDQo+Pj4gQXQgd2hpY2ggcG9pbnTigKYgd291
bGQgaXQgbWFrZSBzZW5zZSB0byBqdXN0IG1vdmUgdGhlIHBhY2thZ2Ugb3V0IHRvIGl0cyBzZXBh
cmF0ZSByZXBvIGVudGlyZWx5PyAgSS5lLiwgaGF2ZSBhY3R1YWwgZGV2ZWxvcG1lbnQgaGFwcGVu
IGluIHRoZSByZXBvIHdoaWNoIGVuZHMgdXAgYmVpbmcgY2xvbmVkIGluIHRoZSBlbmQ/DQo+Pj4g
DQo+Pj4gT2J2aW91c2x5IHRoZXJlIGFyZSBuaWNlIHRoaW5ncyBhYm91dCBoYXZpbmcgdGhlIGNv
ZGUgaW4gdGhlIHNhbWUgcmVwbzsgYnV0IHRoZXJl4oCZcyBhbHNvIHNvbWV0aGluZyBzYXRpc2Z5
aW5nIGFib3V0IGJlaW5nIGEgZnVsbCBkb3duc3RyZWFtLg0KPj4+IA0KPj4+IEkgd2FzIGFjdHVh
bGx5IHRoaW5raW5nIGl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gcHV0IHRoZSByZXBvIGF0IGh0dHBz
Oi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9nby14ZW5saWdodCAsIHRvIHRyeSBvdXQgdGhhdCBh
cyBhIGRldmVsb3BtZW50IG1vZGVsLg0KPiBXb3VsZCB0aGF0IG1lYW4gY29tcGxldGVseSBtb3Zp
bmcgb2ZmIG9mIHhlbi1kZXZlbCBmb3IgZGV2ZWxvcG1lbnQ/IEkgY2FuJ3QgDQo+IHRoaW5rIG9m
IGEgaHVnZSByZWFzb24gd2h5IHdlIHdvdWxkbid0IGJlIGFibGUgdG8gZG8gdGhpcyBpZiB3ZSB3
YW50ZWQuDQoNCkkgbWVhbiBvYnZpb3VzbHkgdGhlIGNoYW5nZXMgdG8gbGlieGxfdHlwZXMuaWRs
IGFuZCBpZGwucHkgd291bGQgaGF2ZSB0byBoYXBwZW4gb24geGVuLWRldmVsOyBidXQgeWVhaCwg
Y2hhbmdlcyB0byB0aGUgZXh0ZXJuYWwgcmVwbyB3b3VsZCBoYXBwZW4gd2l0aGluIGdpdGxhYi4N
Cg0KPj4gDQo+PiBJ4oCZdmUgcHV0IGEgc29ydCBvZiBkcmFmdCBtb2R1bGUgdXAgYXQgaHR0cHM6
Ly9naXRsYWIuY29tL21hcnR5cm9zL2dvLXhlbiA7IHlvdSBjYW4gdGVzdCBpdCBieSBhZGRpbmcg
dGhlICJnaXRsYWIuY29tL3hlbi1wcm9qZWN0L2dvLXhlbi94ZW5saWdodOKAnSBwYWNrYWdlLCBi
dXQgYWRkaW5nIHRoZSBmb2xsb3dpbmcgbGluZSB0byB0aGUgZ28ubW9kIG9mIHRoZSB0ZXN0IHBy
b2dyYW06DQo+IEkgaGF2ZSBhIGNvdXBsZSBvZiBwYXRjaGVzIEkgd2FzIGdvaW5nIHRvIHNlbmQg
b3V0IG9uIHhlbi1kZXZlbCB0b2RheS4gSSANCj4gY291bGQgUFIgdGhlbSB0byB0aGlzIHJlcG8g
aW5zdGVhZCAob3IgaW4gYWRkaXRpb24pIGlmIHlvdSB3YW50IHRvIHRyeSBvdXQgDQo+IHRoZSBn
aXRsYWIgd29ya2Zsb3cuIA0KDQpZZWFoLCB3ZSBjb3VsZCBnaXZlIHRoYXQgYSB0cnkuDQoNCiAt
R2Vvcmdl

