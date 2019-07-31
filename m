Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65937CAE8
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 19:51:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hssjH-0008E9-JE; Wed, 31 Jul 2019 17:49:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bdxT=V4=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hssjF-0008E4-Lf
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 17:49:33 +0000
X-Inumbo-ID: 8b289886-b3bb-11e9-9ac4-3b1d5f4a8e2d
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b289886-b3bb-11e9-9ac4-3b1d5f4a8e2d;
 Wed, 31 Jul 2019 17:49:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq+1Keyxx3x+QOzxG2T/JLd2J4i1ClBINEAFzt4zkxlDXYFnpJ9adX06HA3nhYcgJZHBwCGtmmjLb2kGPUYePuCVVYNzjyB5m4Hk8GUas35WMb+hFjmqrk4F30wM6RodX0YvBOlO1mNtfXi5ERkNWCcd1FpTTZEWLO7Nk05CqXZ4EPiW4yBmJcIYUIe3qQdUONgshMDEz150nkqFBwjibTeb9NuQ1S7OS3e3CzsTCb1dXxPUemedw6KHW2xU4A1MdjJH0oh++Py/9NFlhBYuz59wzQ+6IVjsNUnQVsGBNI0McO5bjQ7tsy9QtPMpXe+3oSyE+XeftierNyKhyhKLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJZBu9TEKKOSz16w29S6v06FCaZN/s8/SVXRIR4ioJo=;
 b=TKOeCMrktUi0xd7+HvWWXUzHdIAri2dV077R2Al0Vx4QujQKDilC1kL3aLp1YErFUFvjVQtvm+eYjy+XzdeI/LcNGwSrzLejcTXHIV5Q1wr4RQPGMqfDQm2FJjqAlILhEGTRTgX0gwKTSSoA6UGT2+VyjLIy48ng2x3fRTUdqBLCYpDC1W+es8bthRH6wrUA6bS9Y9GU95122qIC8Q2o7udEIwvlGbgDRc4BfiZ2OBqefqrbDpQ3UB2XDWvu0vaY3MrOoLTJEHRLboj1cKQQPxkJExTU2D7h+9Wpq+dzNetTMx2w/Pd1uyERHJbAXJafEuJKLZyRTm6aT3lCDomnDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJZBu9TEKKOSz16w29S6v06FCaZN/s8/SVXRIR4ioJo=;
 b=HstzU2h/yaUvV7Wdi9tAbC8TZPu1sbDH/kHEQsgafTij7AHQQHMj6hs/NonspXGCmfQBdM6T9f25C0YVVAmyUpQ1ue2ER1fBB7jt1WreoAgXI9phTiALjNAZvLATI9mNnJvVf8uBzDFMibj9/lYLxj33nq7FX3CSm25cdf5ye8pnGOEDOWv9OAjpo9F+pvbq1sTEeyT3EXSIzbLckmDGe8awvSM4pzJ8JAlc37C7uffFp14SVoKQaTvqGkWRMQuwIBu48JCbj5mZxcRJklpg46rz/ZMuzuZ0UcTbsSxhPnhOMZ17Pk7kPO4Ne80lDdzj/Mb9BelNlfYRi1wp/JBVdg==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6164.eurprd03.prod.outlook.com (10.141.190.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 31 Jul 2019 17:49:27 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 17:49:27 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] CODING_STYLE: clarify function argument indentation
Thread-Index: AQHVR7xxvb8iYZ/UOE68NI2ovvNVU6bk70gAgAAR1QA=
Date: Wed, 31 Jul 2019 17:49:27 +0000
Message-ID: <874l32hz6h.fsf@epam.com>
References: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
 <bb494090-f6d4-8f19-5784-8f8b20cbafdd@citrix.com>
In-Reply-To: <bb494090-f6d4-8f19-5784-8f8b20cbafdd@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 631be3f9-0db7-4ed0-509f-08d715df6ec7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6164; 
x-ms-traffictypediagnostic: AM0PR03MB6164:|AM0PR03MB6164:
x-microsoft-antispam-prvs: <AM0PR03MB6164C707DFE69D43C4811AF6E6DF0@AM0PR03MB6164.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(189003)(199004)(52314003)(64756008)(66446008)(66556008)(66476007)(478600001)(66946007)(91956017)(186003)(446003)(102836004)(26005)(66066001)(256004)(14444005)(6116002)(486006)(5660300002)(76116006)(68736007)(11346002)(76176011)(25786009)(86362001)(71190400001)(71200400001)(3846002)(55236004)(14454004)(80792005)(7736002)(2906002)(53546011)(8676002)(6486002)(4326008)(53936002)(54906003)(316002)(81166006)(81156014)(7416002)(305945005)(476003)(6916009)(6506007)(2616005)(99286004)(36756003)(229853002)(6512007)(6436002)(6246003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6164;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KJHMaffjDmc0RNFo504G5IceugVTvY+6FyZY1xkGNUP67b7NQcc72bWeZ/kqmnp07eQkW7iaMTvCfWtV1N6SqyXqcUbORD5B7Bznb6gETk2M5xklgXUa80WTeP3KD4f9f/FEH7WapdbzospKUXz2frH1mHeGGB+lIOom65i83eOhCGLgcoHty0i+J8S/NUPG2xpiCzd3GtbyHhBlLhjHbacC6BI5lgWu9s45Z5ud8vhQ3B7XeQ3BhS8aSS9aKX3ByqNiFAZu7lbmZGpGXCTP1IRZgLJLjrFOOA/NNlvb6NUloEiSfqreG96fSjlACRFtF/74cwyTBUq6wYyGShfH+Q/VtJ9j420ZxtC9nUCN/IAX1zJtcEUWI7nDb3Ny8qCmzQBYnxs2+Jcn2T5oyloutkWL5ruzxtBFJKJRr6VP1LY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 631be3f9-0db7-4ed0-509f-08d715df6ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 17:49:27.5211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6164
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: clarify function argument
 indentation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEFuZHJldywKCkFuZHJldyBDb29wZXIgd3JpdGVzOgoKPiBPbiAzMS8wNy8yMDE5IDE3OjI0
LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gVGhlcmUgYXJlIGNvZGluZyBzdHlsZSBydWxl
cyB0aGF0IGFyZSB3aWRlbHkgYWNjZXB0ZWQgYnkgY29tbXVuaXR5LAo+PiBidXQgbmV3ZXIgd2Vy
ZSBmb3JtYWxpemVkIGluIHRoZSBkb2N1bWVudC4gTm90YWJsZSBleGFtcGxlIGlzIHRoZQo+PiBx
dWVzdGlvbiBvbiBob3cgZnVuY3Rpb24gYXJndW1lbnRzIGFuZCBwYXJhbWV0ZXJzIHNob3VsZCBi
ZSBpbmRlbnRlZAo+PiB3aGVuIHRoZXkgZG8gbm90IGZpdCBpbnRvIG9uZSBsaW5lLgo+Pgo+PiBU
aGlzIHF1ZXN0aW9uIHdhcyByYWlzZWQgbXVsdGlwbGUgdGltZXMgbGF0ZWx5LCBtb3N0bHkgYmVj
YXVzZSBvZgo+PiBvbmdvaW5nIGVmZm9ydHMgdG8gY3JlYXRlIFhlbiBjb2Rpbmcgc3R5bGUgZm9y
bWF0dGluZyB0b29sIGFuZCBiZWNhdXNlCj4+IG9mIG5ldyBjb21tdW5pdHkgbWVtYmVycywgd2hv
IGFyZSBub3QgYXdhcmUgb2Ygc3VjaCB1bndyaXR0ZW4gcnVsZXMuCj4+Cj4+IEFjdHVhbGx5LCB0
aGlzIHJ1bGUgaXMgYWxyZWFkeSBpbXBsaWNpdGx5IGRlZmluZWQgaW4gdGhlIGRvY3VtZW50IGJ5
Cj4+IGRlZmluaW5nIGVtYWNzIGNvZGluZyBzdHlsZTogJ2MtZmlsZS1zdHlsZTogIkJTRCInLiBJ
biB0aGlzIG1vZGUgZW1hY3MKPj4gbGluZXMgdXAgZnVuY3Rpb24gYXJndW1lbnRzIHVuZGVyIHRo
ZSBmaXJzdCBhcmd1bWVudC4gTmF0dXJhbGx5LCBtb3N0Cj4+IG9mIFhlbiBjb2RlIGlzIHdyaXR0
ZW4gaW4gdGhpcyBzdHlsZS4KPj4KPj4gU28sIGxldHMgc3RhdGUgdGhlIG9idmlvdXMgYW5kIGZp
eCB0aGlzIHJ1bGUgZXhwbGljaXRseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJh
YmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgo+PiAtLS0KPj4gIENPRElOR19TVFlM
RSB8IDE0ICsrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvQ09ESU5HX1NUWUxFIGIvQ09ESU5HX1NUWUxFCj4+IGluZGV4
IDZjYzViNzc0Y2YuLjY0NzkyMTVhMTUgMTAwNjQ0Cj4+IC0tLSBhL0NPRElOR19TVFlMRQo+PiAr
KysgYi9DT0RJTkdfU1RZTEUKPj4gQEAgLTUzLDYgKzUzLDIwIEBAIExpbmUgTGVuZ3RoCj4+ICBM
aW5lcyBzaG91bGQgYmUgbGVzcyB0aGFuIDgwIGNoYXJhY3RlcnMgaW4gbGVuZ3RoLiAgTG9uZyBs
aW5lcyBzaG91bGQKPj4gIGJlIHNwbGl0IGF0IHNlbnNpYmxlIHBsYWNlcyBhbmQgdGhlIHRyYWls
aW5nIHBvcnRpb25zIGluZGVudGVkLgo+Pgo+PiArRm9yIG11bHRpbGluZSBmdW5jdGlvbiBkZWNs
YXJhdGlvbiBhbmQgY2FsbCBlYWNoIG5ldyBsaW5lIHNob3VsZCBiZQo+PiArYWxpZ25lZCB3aXRo
IHRoZSBmaXJzdCB0aGUgcGFyYW1ldGVyIG9yIGFyZ3VtZW50LiBlLmcuOgo+PiArCj4+ICt2b2lk
IG15X2Z1bmN0aW9uX3dpdGhfbG9uZ19uYW1lKHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lICpz
dHJ1Y3QxLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVuZ3Ro
eV9zdHJ1Y3RfbmFtZSAqc3RydWN0MiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGxlbmd0aHlfc3RydWN0X25hbWUgKnN0cnVjdDMpOwo+PiArCj4+ICtvcgo+PiAr
Cj4+ICtmdW5jdGlvbl93aXRoX3NvX21hbnlfcGFyYW1zKHdvcmR5X3BhcmFtZXRlcjEsIHdvcmR5
X3BhcmFtZXRlcjIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdvcmR5X3BhcmFt
ZXRlcjMsIHdvcmR5X3BhcmFtZXRlcjQpOwo+PiArCj4+ICtUaGUgc2FtZSBhcHBsaWVzIGZvciBt
YWNyb3MuCj4KPiBGb3IgdmVyeSB3b3JkeSBmdW5jdGlvbnMsIG9yIG9uZXMgd2l0aCBzaWxseSBx
dWFudGl0aWVzIG9mIHBhcmFtZXRlcnMsCj4gdGhlIGZvbGxvd2luZyBpcyBhbHNvIGFjY2VwdGFi
bGUKPgo+IHZvaWQgbXlfZnVuY3Rpb25fd2l0aF9sb25nX2FuZF9zaWxseV9uYW1lKAo+ICBzdHJ1
Y3QgbGVuZ3RoeV9zdHJ1Y3RfbmFtZSAqc3RydWN0MSwgdW5zaWduZWQgaW50IHdvbWJsZSwgdW5z
aWduZWQKPiBpbnQgd2hhdHNpdCwKPiAgc3RydWN0IGxlbmd0aHlfc3RydWN0X25hbWUgKnN0cnVj
dDIsIGJvb2wgeWVzLCBib29sIG5vLCBib29sIG1heWJlLAo+ICBib29sIGZpbGVfbm90X2ZvdW5k
LCBzdHJ1Y3QgbGVuZ3RoeV9zdHJ1Y3RfbmFtZSAqc3RydWN0Mywgc3RydWN0Cj4gbGVuZ3RoeV9z
dHJ1Y3RfbmFtZSAqc3RydWN0NCk7Cj4KPiB3aGljaCB5b3Ugd2lsbCBmaW5kIGluIGEgZmV3IHBs
YWNlcyB0aHJvdWdob3V0IHRoZSBjb2RlLCBiZWNhdXNlIHRoZQo+IGFib3ZlIGRvZXNuJ3Qgd2Fz
dGUgZW5vdWdoIHZlcnRpY2FsIHNwYWNlIHRvIGZpdCBzZXZlcmFsIGZ1bmN0aW9ucyBpbiwKPiBh
bmQgcHVzaCBhbGwgdGhlIHJlbGV2YW50IGRldGFpbHMgdG8gdGhlIFJIUy4KRXhjdXNlIG1lLCB3
aGF0IGl0IFJIUz8KCj4KPiBQZXIgdGhlIGFib3ZlIHJ1bGVzLCB0aGUgcmVzdWx0IHdvdWxkIGJl
IHRoaXM6Cj4KPiB2b2lkIG15X2Z1bmN0aW9uX3dpdGhfbG9uZ19hbmRfc2lsbHlfbmFtZShzdHJ1
Y3QgbGVuZ3RoeV9zdHJ1Y3RfbmFtZQo+ICpzdHJ1Y3QxLAo+ICB1bnNpZ25lZCBpbnQgd29tYmxl
LAo+ICB1bnNpZ25lZCBpbnQgd2hhdHNpdCwKPiAgc3RydWN0IGxlbmd0aHlfc3RydWN0X25hbWUK
PiAqc3RydWN0MiwKPiAgYm9vbCB5ZXMsIGJvb2wgbm8sIGJvb2wgbWF5YmUsCj4gIGJvb2wgZmls
ZV9ub3RfZm91bmQsCj4gIHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lCj4gKnN0cnVjdDMsCj4g
IHN0cnVjdCBsZW5ndGh5X3N0cnVjdF9uYW1lCj4gKnN0cnVjdDQpOwo+Cj4gT2YgY291cnNlLCB0
aGlzIGlzIGFsc28gYSBzaWduIHRoYXQgbWF5YmUgdGhlIGZ1bmN0aW9uIHNpZ25hdHVyZSB3YW50
cwo+IGNoYW5naW5nIGFueXdheSwgYnV0IHRoYXQgbWF5IG5vdCBiZSBwb3NzaWJsZS9zZW5zaWJs
ZSBhdCB0aGUgdGltZS4KPgo+IEFzIHdpdGggZXZlcnl0aGluZywgdGhlIGNvZGluZyBzdHlsZSBp
cyBhIHNldCBvZiBndWlkZWxpbmVzIHdoaWNoIGFyZQo+IGFwcGxpY2FibGUgdG8gOTglIG9mIGNh
c2VzLCBidXQgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGFyZW4ndAo+IGFwcHJvcHJpYXRlLCBhbmQg
Y29tbW9uIHNlbnNlIGlzIHRoZSBvbmx5IHJlYXNvbmFibGUgZGVjaWRpbmcgZmFjdG9yLgoKSSB0
b3RhbGx5IGFncmVlIHdpdGggeW91LiBQcm9iYWJseSB3ZSBzaG91bGQgZWl0aGVyIGFkZCBhIGdl
bmVyaWMgY2xhdXNlCmxpa2UgIlRoaXMgY29kaW5nIHN0eWxlIHJ1bGVzIG1heSBiZSB2aW9sYXRl
ZCBpZiB0aGV5IHByb2R1Y2Ugd2VpcmQKcmVzdWx0cyIuCgpPciB3ZSBjYW4gYWRkIGNsYXJpZmlj
YXRpb24gdG8gdGhpcyBwYXJ0aWN1bGFyIHJ1bGU6ICJEbyBub3QgYnJlYWsKcGFyYW1ldGVyIGRl
ZmluaXRpb24gdG8gbXVsdGlwbGUgbGluZXMuIElmIHBhcmFtZXRlcnMgYXJlIHRvbyBsb25nLApk
ZWNyZWFzZSBpbmRlbnRhdGlvbiwgYnV0IHRyeSB0byBsaW5lIHRoZW0gdXAuIGUuZy46Cgp2b2lk
IG15X2Z1bmN0aW9uX3dpdGhfbG9uZ19hbmRfc2lsbHlfbmFtZSgKICAgICAgICBzdHJ1Y3QgbGVu
Z3RoeV9zdHJ1Y3RfbmFtZSAqc3RydWN0MSwKICAgICAgICB1bnNpZ25lZCBpbnQgd29tYmxlLAog
ICAgICAgIHVuc2lnbmVkIGludCB3aGF0c2l0LAogICAgICAgIHN0cnVjdCBsZW5ndGh5X3N0cnVj
dF9uYW1lICpzdHJ1Y3QyLAogICAgICAgIGJvb2wgeWVzLCBib29sIG5vLCBib29sIG1heWJlLAog
ICAgICAgIGJvb2wgZmlsZV9ub3RfZm91bmQsCiAgICAgICAgc3RydWN0IGxlbmd0aHlfc3RydWN0
X25hbWUgKnN0cnVjdDMsCiAgICAgICAgc3RydWN0IGxlbmd0aHlfc3RydWN0X25hbWUgKnN0cnVj
dDQpOwoiCgpXaGF0IGRvIHlvdSB0aGluaz8KClByb2JsZW0gaXMgdGhhdCBkb2N1bWVudCB3aWxs
IGJsb3cgdXAgcXVpY2tseSBpZiB3ZSdsbCB0cnkgdG8gY292ZXIgYWxsCmNvcm5lciBjYXNlcy4g
U28gcGVyc29uYWxseSBJIHN0aWNrIHRvICJnZW5lcmljIHJ1bGVzICsgY29tbW9uIHNlbnNlIgph
cHByb2FjaC4KCi0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
