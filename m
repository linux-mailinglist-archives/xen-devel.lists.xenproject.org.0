Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE00E14DD96
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:07:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBO8-0005Eo-1w; Thu, 30 Jan 2020 15:05:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7qPw=3T=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1ixBO6-0005Eg-Hf
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 15:05:46 +0000
X-Inumbo-ID: fd6914ca-4371-11ea-b211-bc764e2007e4
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::61f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd6914ca-4371-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 15:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kANK8Eh++UfJsA2sa6NWmfAzTzQEyYnz89U33W3C6a3DWNz5qcoFY7DNd+llFYeBNxHr2eg1N1QwUPlngpyKZRgmVKKIPakcNVnAseEekD/eXeFxBhFtIN2hnEDgWpnSrW9V/cisVUkcwziknh2tyiqylCss0pCgy/UpVhDSs/SPUT5q1B6PmqEjz6i9kJeUhrICxzzTaglQhl7X7sKZ8hMqUg1/i5Q8MnMZQ6nZyVYDwI2BKllmXoPRbkTAKa64zBORf4mxwxLKrqFLlqGkFAitBzDCPZT19MmxUDD1WyIuTRje2nw7ruc29g0bwvUsXyaDf4FB1C9awKBJM9lu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw3Ijzentq43ukfviPkxnvC6jAs9ateRdmCpBvgXcVY=;
 b=PJpeZQBb5Mi/JqYL/aeX7DmTgMQOSF/dsMdEs2KVgAqf60/URmLkZ8ikL5/QR/U5f9uFCi6OfESunCVLXVNfJzZ7i/bFd2gx61pPTjzYoN7DOw/gaDAP1oerBzMERkr/wGE2d7Bta6L58M5GQpB9SA1JJILIBvyz4TAf+719/8wtRqtRvHCvZzhdfQCazm3xSAjt2OS/X2fVyUK5B9QxnAuTYlhNBQtwnpK3Qq1nM/X10VVeAkmer5ycU3zm8SK8bRGfDiddRocmpEJuletQYmcErPe6fq4Ff7/0deUz5pvsCulgWeGpHqYrLpnArTx8E9LLqoN2mmgWqy8qismSwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw3Ijzentq43ukfviPkxnvC6jAs9ateRdmCpBvgXcVY=;
 b=m1I1dYGkKZCpXNpdLloJWC/uRtpuhy21FCu5AUEfnZyguhHTWBxWIE50tdBACvt6BBfnUpSmxvAuckf3BvqHyEm7EXoMUIcZKOQUItpjsdltJePzu2gRjkWR11LI+TZhE0LPpxgyav54mXT5zxUsssOjirlDFpHR6AsIZpmebEU=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3652.eurprd03.prod.outlook.com (52.134.81.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Thu, 30 Jan 2020 15:05:44 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::c5e7:7740:4cd5:77c1%5]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 15:05:44 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr <olekstysh@gmail.com>
Thread-Topic: [PATCH] iommu/arm: Don't allow the same micro-TLB to be shared
 between domains
Thread-Index: AQHV1rQn7uvWmtBMUUCKekbfSzRsQagBzvuAgAF4XICAAAi8gA==
Date: Thu, 30 Jan 2020 15:05:43 +0000
Message-ID: <8736bxougo.fsf@epam.com>
References: <1580309714-21912-1-git-send-email-olekstysh@gmail.com>
 <874kwep7pe.fsf@epam.com> <b3cf0ae9-d9ea-5a8a-0f2d-36f158aa680b@gmail.com>
In-Reply-To: <b3cf0ae9-d9ea-5a8a-0f2d-36f158aa680b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0f004b3-cd3c-45a5-0c72-08d7a595e117
x-ms-traffictypediagnostic: AM0PR03MB3652:|AM0PR03MB3652:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB36525D7F021CF22FF733483CE6040@AM0PR03MB3652.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(81166006)(81156014)(66946007)(5660300002)(6916009)(76116006)(8676002)(8936002)(6506007)(55236004)(478600001)(66446008)(64756008)(316002)(66476007)(36756003)(66556008)(86362001)(2906002)(6512007)(2616005)(26005)(54906003)(6486002)(4326008)(71200400001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3652;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i24Hk7d3ZA1sdUOxPF8bYcm6p02K9YmmD3WBw3tHGcboUiMnq5Dv5DkHP0IBGmxxCtz/jW7aOcrHOPAnmm726G/+Hlk/iJMHHdQvjq5FChZwHcrGN6IHsW9FuZebHJQFQLQIS9DKyzb3xm4pji2kWbOtr7XrUzLPMVCAk/1azEZEnobMd4gvHvTPJwGstK+WwWTBLRjUeyDcsAx1RQENHigCWeV7g/BJlK6Y4EqkMnEj/UjQWwfSXopcrkL3O4xKLn8aUSOrt9UejtCWW0pBHtRBrBgZU0Oa10tr+XbLb1Ehlk7zW4Pf+pgWeSgqJzI8LK6Kn6DaVqwPeeJ1bmVEj4t1OamI6hboFji2Mlm5rKmvfAHXsyDw2zJ9gR2VjSY1PnMUO2qfM5cW9LUDws0Xj85oLHynzSR3e3N8TD2jYmpPCkWuk540STKqwYbwbgzW
x-ms-exchange-antispam-messagedata: TQVLsu6w3cy/t88Awo9ajlyTj7hgUIu/z7G/sOuzy+vzQxiGUsYysAWCKs5cTUnJgI9kuJy94XV5H6ialeMt8btlYVnskWBkp48CcrY9q5AyGcZeghJx2Iwxmr8cXvZ56OZYwhSABqrTSzZi9Y/7Bg==
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f004b3-cd3c-45a5-0c72-08d7a595e117
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 15:05:44.0279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vG6CzZKpdLYXhhqjDsWQ7nzZU//UYfE2Za0cXcqdI74rKsC7r9p8WgXq5UsjPAuZjXPx3yZtudx/1f2UIkdTtbeWFrOwDPw3FamH3y7fNak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3652
Subject: Re: [Xen-devel] [PATCH] iommu/arm: Don't allow the same micro-TLB
 to be shared between domains
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIE9sZWtzYW5kciwKCk9sZWtzYW5kciB3cml0ZXM6CgpbLi4uXQoKPj4+ICsKPj4+ICsgICAg
LyoKPj4+ICsgICAgICogV2UgbmVlZCB0byBwcmV2ZW50IHRoZSB1c2UgY2FzZXMgd2hlcmUgZGV2
aWNlcyB3aGljaCB1c2UgdGhlIHNhbWUKPj4+ICsgICAgICogbWljcm8tVExCIGFyZSBhc3NpZ25l
ZCB0byBkaWZmZXJlbnQgWGVuIGRvbWFpbnMgKG1pY3JvLVRMQiBjYW5ub3QgYmUKPj4+ICsgICAg
ICogc2hhcmVkIGJldHdlZW4gbXVsdGlwbGUgWGVuIGRvbWFpbnMsIHNpbmNlIGl0IHBvaW50cyB0
byB0aGUgY29udGV4dCBiYW5rCj4+PiArICAgICAqIHRvIHVzZSBmb3IgdGhlIHBhZ2Ugd2Fsayku
Cj4+PiArICAgICAqIEFzIGVhY2ggWGVuIGRvbWFpbiB1c2VzIGluZGl2aWR1YWwgY29udGV4dCBi
YW5rIHBvaW50ZWQgYnkgY29udGV4dF9pZCwKPj4+ICsgICAgICogd2UgY2FuIHBvdGVudGlhbGx5
IHJlY29nbml6ZSB0aGF0IHVzZSBjYXNlIGJ5IGNvbXBhcmluZyBjdXJyZW50IGFuZCBuZXcKPj4+
ICsgICAgICogY29udGV4dF9pZCBmb3IgYWxyZWFkeSBlbmFibGVkIG1pY3JvLVRMQiBhbmQgcHJl
dmVudCBkaWZmZXJlbnQgY29udGV4dAo+Pj4gKyAgICAgKiBiYW5rIGZyb20gYmVpbmcgc2V0Lgo+
Pj4gKyAgICAgKi8KPj4+ICsgICAgZGF0YSA9IGlwbW11X3JlYWQobW11LCBJTVVDVFIodXRsYikp
Owo+PiBJIGNhbiBzZWUgdGhhdCB0aGlzIGNvZGUgaXMgbm90IGNvdmVyZWQgYnkgc3BpbmxvY2su
IFNvLCBJIGJlbGlldmUsCj4+IHRoZXJlIGNhbiBiZSBhIHJhY2UgY29tZGl0aW9uLCB3aGVuIHRo
aXMgcmVnaXN0ZXIgaXMgYmVpbmcgcmVhZCBvbiB0d28KPj4gQ1BVcyBzaW11bHRhbmVvdXNseS4K
Pgo+IEkgZG9uJ3QgdGhpbmssIGlwbW11X2Fzc2lnbihkZWFzc2lnbilfZGV2aWNlIGNhbGxiYWNr
cyB0YWtlIGEKPiBzcGlubG9jaywgc28gdGhlIG1pY3JvLVRMQiBtYW5hZ2VtZW50IHJvdXRpbmVz
IGluc2lkZQo+IGFyZSBwcm90ZWN0ZWQuClllYWgsIHlvdSBhcmUgcmlnaHQuIFNvbWVob3cgSSBt
aXNzZWQgdGhpcyB3aGVuIGNoZWNrZWQgdGhlIGNvZGUgeWVzdGVyZGF5LgoKPgo+PiAgICAgLyog
RGlzYWJsZSBNTVUgdHJhbnNsYXRpb24gZm9yIHRoZSBtaWNyby1UTEIuICovCj4+IEBAIC02NzEs
NyArNjk4LDEyIEBAIHN0YXRpYyBpbnQgaXBtbXVfYXR0YWNoX2RldmljZShzdHJ1Y3QgaXBtbXVf
dm1zYV9kb21haW4gKmRvbWFpbiwKPj4gICAgICAgICAgIGRldl9pbmZvKGRldiwgIlJldXNpbmcg
SVBNTVUgY29udGV4dCAldVxuIiwgZG9tYWluLT5jb250ZXh0X2lkKTsKPj4gICAgICAgICBmb3Ig
KCBpID0gMDsgaSA8IGZ3c3BlYy0+bnVtX2lkczsgKytpICkKPj4gLSAgICAgICAgaXBtbXVfdXRs
Yl9lbmFibGUoZG9tYWluLCBmd3NwZWMtPmlkc1tpXSk7Cj4+ICsgICAgewo+PiArICAgICAgICBp
bnQgcmV0ID0gaXBtbXVfdXRsYl9lbmFibGUoZG9tYWluLCBmd3NwZWMtPmlkc1tpXSk7Cj4+ICsK
Pj4gKyAgICAgICAgaWYgKCByZXQgKQo+PiArICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gSSBj
YW4ndCBzZWUgZXJyb3IgcGF0aCB3aGVyZSBpcG1tdV91dGxiX2Rpc2FibGUoKSB3b3VsZCBiZSBj
YWxsZWQgZm9yCj4+IGFscmVhZHkgZW5hYmxlIHVUTEJzLiBJcyB0aGlzIG5vcm1hbD8KPgo+IEdv
b2QgcXVlc3Rpb24uIEluZGVlZCwgd2UgbmVlZCB0byByZXN0b3JlIHByZXZpb3VzIHN0YXRlIGlu
IGNhc2Ugb2YgZXJyb3IuCj4KPgo+IEkgd2lsbCBhZGQgdGhlIGZvbGxvd2luZzoKPgo+IGRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jCj4gYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jCj4gaW5kZXggYzIxZDJkNy4uNDEx
ZmMwZiAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1z
YS5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYwo+IEBA
IC03MDIsNyArNzAyLDEyIEBAIHN0YXRpYyBpbnQgaXBtbXVfYXR0YWNoX2RldmljZShzdHJ1Y3QK
PiBpcG1tdV92bXNhX2RvbWFpbiAqZG9tYWluLAo+ICAgICAgICAgIGludCByZXQgPSBpcG1tdV91
dGxiX2VuYWJsZShkb21haW4sIGZ3c3BlYy0+aWRzW2ldKTsKPgo+ICAgICAgICAgIGlmICggcmV0
ICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHdoaWxlICggaS0tICkKWW91IHdpbGwgY2Fs
bAo+ICsgICAgICAgICAgICAgICAgaXBtbXVfdXRsYl9kaXNhYmxlKGRvbWFpbiwgZndzcGVjLT5p
ZHNbaV0pOwpmb3IgdVRMQiB0aGF0IGNhdXNlZCB0aGUgZXJyb3IuIExpa2VseSwgdGhpcyB1VExC
IHJpZ2h0IG5vdyBpcyBhc3NpZ25lZApmb3IgYW5vdGhlciBkb21haW4uIFNvLCB5b3Ugd2lsbCBk
aXNhYmxlIGFjdGl2ZSB1VExCIHdoaWNoIGJlbG9uZ3MgdG8KdGhhdCBkb21haW4uIAoKPiArCj4g
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICAgfQo+ICAgICAgfQo+Cj4gICAgICBy
ZXR1cm4gMDsKCgotLQpWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
