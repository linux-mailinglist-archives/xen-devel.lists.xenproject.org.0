Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F103905EC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 18:34:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyf9b-0000sK-Ae; Fri, 16 Aug 2019 16:32:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1kBP=WM=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hyf9Z-0000sD-Mt
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 16:32:37 +0000
X-Inumbo-ID: 74ae8496-c043-11e9-a661-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74ae8496-c043-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 16:32:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjYQFlUxVLQrMvI1FgaFAFvQLOtKNpcUR7hMqXNeK5iXhDpf+MnRrJePZZ9t26RbnJlcjBK7wynjkYmk1rUubbBBE8FXwYNif4ixDfJdgCJRS6OovwwctCHI5FHSVNZ/kI64doAfYrrxJS+2q/A1m4IDVx+tnmBJ9H02d6VDgdvyKJ0a42g1cyR35bu5Fi4AK7ySDXvBSjjPbFkSyhU7SojhrQ86Q9gdQ1GDwJN4VOB8xt4j961mBuTEjTdgskaK7w3b5avBsvTc+eXVyZ3RrmFqmAHnxav1pFO2f+5J2Em+gSCFyB/ED0EFE7E8FBU7G2BFTreEF6jtYcHLapiK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX2IyShBtQM44HbPDeMqzujlcxddYxR5LhHfM6Q6D30=;
 b=iU4EIfmcBi90ko7crN3yC27CXF8bcYxwU0h0JR3XNz9mgX80AZlH8sd9sTYyDVccbnxHe6X1FC94RVE6cg8begDogZ7txJH+9jPi629SMuJLjCw7bvQkUc4s6IvYhb1fG/pSpObEUkMbdKP6uGZ1wmudcvIyGJ48BImyui4SE/Ve6G9SXg5CBUd3obP4xt4RolToLa6C0Wp+DjEWqZfikv+9DVvK7JIr6MyWH3elKXmLzR9h9YMXw4cSQ8aK2iUw/SKgSn9rhFlELB9XxDOkxgvmTs3VwWsG6b+/KHPjodXiexlu7JJVesz/KrCVFfVdHARpmZyz7dyfE4FYow9blw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX2IyShBtQM44HbPDeMqzujlcxddYxR5LhHfM6Q6D30=;
 b=Y3HcE9F6IjRv981+cCJGLnlIa8rSk0A6OKh//VXKgAAAXJwu/G0VQ5mPpomR+VsumAgqupZXodvUDCxRzkKxixJx+yh+ODfkkqhQXD1aqdKCY8A1PplP2sS4xMprx21PPRppH0AlIvdPR98hvauMh1f/Vl2R2/9EYBe09bbOOO/ijQevwXteTOUZ24mBBnlKrxwgtzCabpB8W84ZlK0b7N0IPr2xO3TD7gsnV+T06U+SWUkdSr8EAl5kbLSgoLZErx2/Pf25uxGznCio05VYi73GB5ckF6Tur1+/A8XezqW6XmjFHA/1ibgu11YFDB4LraZrqRMpNDP/Ekfd2ECV5w==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0SPR01MB14.eurprd03.prod.outlook.com (52.134.87.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 16:32:35 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 16:32:35 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/arm: domain_build: Print the correct domain in
 initrd_load()
Thread-Index: AQHVU4+AjqXYjsQ3PUyruzKYldcey6b9+UyA
Date: Fri, 16 Aug 2019 16:32:35 +0000
Message-ID: <87y2ztf4v0.fsf@epam.com>
References: <20190815173258.20752-1-julien.grall@arm.com>
In-Reply-To: <20190815173258.20752-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6d88180-5240-4cd3-c6ad-08d72267586c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0SPR01MB14; 
x-ms-traffictypediagnostic: AM0SPR01MB14:|AM0SPR01MB14:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0SPR01MB149D15DA922787600308A1E6AF0@AM0SPR01MB14.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(189003)(199004)(91956017)(64756008)(66946007)(66476007)(2616005)(81166006)(6486002)(66556008)(66446008)(8676002)(54906003)(14454004)(6436002)(81156014)(66066001)(486006)(71200400001)(6916009)(71190400001)(2906002)(8936002)(76116006)(86362001)(256004)(229853002)(6512007)(5660300002)(55236004)(80792005)(26005)(478600001)(102836004)(186003)(6246003)(6506007)(4326008)(53936002)(7736002)(305945005)(107886003)(446003)(99286004)(6116002)(11346002)(3846002)(25786009)(76176011)(476003)(316002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0SPR01MB14;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f3qqrX6yhbwu6o2783LgFeQcqzCthHEUqJv31JEwXsl6/SB+EDT7FKYgU/11I5oRao7CdTy0d21bu3Cmlm1Wv+DrOkT0CYUhEiDORz6IIfvtquympYlQZWjQiDKNcYlBA79m14ieQY6+05bO94X1j9yLWNObyIX+URfRNfRDy0VzMAcEKI+emQTPuGKBmKCNZJDak1LqHnYhrsxOu5NHceYFm46Y4XfMjIUpcQwvoi74vOFDwQtdwf/W6eGRcDT2lXOl1B/71KexsH92zOpvZHmyK8E4NWiDpT0jubEsGaYzI+L0upU1pdtSn2hFKZzQ+yU36uS23AI/0cfVecyee1/0vAoSSavaCgSTu60VTt7NyDF4GQ8mbBZjDX8U8FZqPIJxElocstDK6jSiowapYHPY4ba3sVwqFN5BJzN7JyI=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d88180-5240-4cd3-c6ad-08d72267586c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 16:32:35.5785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zS5WhjDgItg9UdzASUNMqCIMhYROoHEnfm8MZ9Um/CKJoJHmlBxW+hB0rIJq+VnLWbXfd0wQ48L59vMwShcfFPnJDBCZQU4BvR+3C3U/a4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB14
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct
 domain in initrd_load()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IGluaXRyZF9sb2FkKCkgY2FuIGJlIGNhbGxlZCBieSBv
dGhlciBkb21haW4gdGhhbiBkb20wLiBUbyBhdm9pZAo+IGNvbmZ1c2lvbiBpbiB0aGUgbG9nLCBw
cmludCB0aGUgY29ycmVjdCBkb21haW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZv
bG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKQnV0IHdoeSBkaWRuJ3QgeW91IGdhdGhlcmVkIGFs
bCB0aG9zZSBwYXRjaGVzIGludG8gb25lIHBhdGNoIHNlcmllcz8KPiAtLS0KPiAgeGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggMTI2Mzc0ZjYw
My4uMzMxNzEwODFlYSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMTgxOCw4ICsxODE4LDgg
QEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRyZF9sb2FkKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2lu
Zm8pCj4gICAgICBwYWRkciA9IG1vZC0+c3RhcnQ7Cj4gICAgICBsZW4gPSBtb2QtPnNpemU7Cj4g
IAo+IC0gICAgcHJpbnRrKCJMb2FkaW5nIGRvbTAgaW5pdHJkIGZyb20gJSJQUklwYWRkciIgdG8g
MHglIlBSSXBhZGRyIi0weCUiUFJJcGFkZHIiXG4iLAo+IC0gICAgICAgICAgIHBhZGRyLCBsb2Fk
X2FkZHIsIGxvYWRfYWRkciArIGxlbik7Cj4gKyAgICBwcmludGsoIkxvYWRpbmcgJXBkIGluaXRy
ZCBmcm9tICUiUFJJcGFkZHIiIHRvIDB4JSJQUklwYWRkciItMHglIlBSSXBhZGRyIlxuIiwKPiAr
ICAgICAgICAgICBraW5mby0+ZCwgcGFkZHIsIGxvYWRfYWRkciwgbG9hZF9hZGRyICsgbGVuKTsK
PiAgCj4gICAgICAvKiBGaXggdXAgbGludXgsaW5pdHJkLXN0YXJ0IGFuZCBsaW51eCxpbml0cmQt
ZW5kIGluIC9jaG9zZW4gKi8KPiAgICAgIG5vZGUgPSBmZHRfcGF0aF9vZmZzZXQoa2luZm8tPmZk
dCwgIi9jaG9zZW4iKTsKCgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
