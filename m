Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACBB4DD2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 14:31:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iACai-0000hd-Gp; Tue, 17 Sep 2019 12:28:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y27b=XM=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iACag-0000hJ-T2
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 12:28:19 +0000
X-Inumbo-ID: 9fe8720e-d946-11e9-b299-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fe8720e-d946-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 12:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE4QbRigmRT8LUOJaJu8J13H/paLjkFuhdZzPKKA4bwTUT52gaZt4EUKhOQQ8DRD8eJ+Q22BWeTC5MKei2hYdH1FmKrAtPBAXAOWgiNqnjM3ZUGS8YU8mzRc1BEY++nzPx8qThIG2aUDUeqChlrEVOiUgyZq73cMfMM9zDS9xip5NNAd9fnz35HVAbQ91v5xmTDRQM6kljffphK7yINGs0uNdGwhboaqFUgR9ZIZAKQIrSZ0JXeOhdED0MfOp4O/Z0eLyS3tvzJXHij2kfT8wfDJUpz2+dErG/fXnSy6WZj205LReM2t4kMj0DqwPwnoUGwfq+8aKnZ7SSvnG9fa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o7Bh78dtPimDuoWM0hhuDJlBFOq/WuhrAxRRz8grHA=;
 b=ZzMJHVWdtJUiuDtp7lPYwWNVBC/e4JI6Pq+pp641bXap+iUnhrXVTpm/rYHucsjdxa1PdaaqwXSV4QQXdIwxGKuVorUMqGNK66nJc4v7zGuY3Z5mkyiBgRvO6ZUU/uPDZJObw1ubPn4Andc9nbPQFiP7TSKsq/ASp/4bzl+e1ARNOxKrN9X6KwaqLNZiNf3K7LHQhXQgBSi+IkR1OuHCBnhe5XWIwXtCx71Wxfuy5GwO33JyPSu5GqAXcX/1n6F/lrNXlYobiT4t4xW7vDFDcnA50eQz88atTAzaT09YvczjAAHjZ/ziqQOmghhwHUyCGU1D+NedCeuIzPU14xJvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o7Bh78dtPimDuoWM0hhuDJlBFOq/WuhrAxRRz8grHA=;
 b=ncO6Lhc0inlJH3Ueax1GqY5EKGirVp66USjUTlX1WZyJcL2wtGG7ybRY0eG9wo0bIHl2akLLE7dJUboYEXMQ9vwyFiOI1W5+EhRvHv9bGiwJrf0o2Wo13NHRQoFe+fSuFo02WgduF9qlLpPeE1Y9wsHtypp0IL2nS1603G84dU0=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB3490.eurprd03.prod.outlook.com (52.133.63.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 12:28:13 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Tue, 17 Sep 2019
 12:28:12 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 1/5] xen/arm: optee: impose limit on shared buffer size
Thread-Index: AQHVWeNlCY0CqDi7zE2giEuaPhvOCqckA0sAgALr+QCAAZ6qAIAAA5eAgAABlACABf90AIABRMKAgAAbpoA=
Date: Tue, 17 Sep 2019 12:28:12 +0000
Message-ID: <87k1a75cpw.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-2-volodymyr_babchuk@epam.com>
 <45208af4-22b8-2870-f79d-a98960c4700d@arm.com> <87k1aefz3t.fsf@epam.com>
 <1cc4bd9c-44fc-0e6e-254c-c07f4b17ba4c@arm.com> <87h85hfgda.fsf@epam.com>
 <24f24620-99c9-d266-5691-4e1962d67b27@arm.com> <87d0g0feir.fsf@epam.com>
 <907b2436-6b46-59d2-e2b3-39c593e7af12@arm.com>
In-Reply-To: <907b2436-6b46-59d2-e2b3-39c593e7af12@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bd9d3f9-1380-4576-5a59-08d73b6a81fa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB3490; 
x-ms-traffictypediagnostic: AM0PR03MB3490:|AM0PR03MB3490:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB3490E15F8CAEEB8AAC7EE780E68F0@AM0PR03MB3490.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(52084003)(199004)(189003)(66446008)(80792005)(7736002)(476003)(305945005)(53546011)(5660300002)(6506007)(14454004)(71190400001)(25786009)(102836004)(478600001)(256004)(316002)(86362001)(14444005)(6916009)(6116002)(3846002)(4326008)(11346002)(6486002)(66476007)(66556008)(2616005)(91956017)(66066001)(486006)(446003)(66946007)(76116006)(6436002)(229853002)(76176011)(2906002)(55236004)(71200400001)(26005)(54906003)(81166006)(81156014)(8676002)(64756008)(8936002)(99286004)(186003)(36756003)(6512007)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3490;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /xZR8VIYy5d3kqJb8ubT8ve/9HHjGv/iMpOdQk3yHQROV14RD9DRowuqsDcXDNZoguOJGSyYqMiS/2oDa5tyueCU7iwRjIHFQ+ZMdkY41VQB9bNtFTL6Sn5egFBRQm79k5WiaG2zTmPr93lq000sWaerSTfA2GE0FmpqPsPsqUj8l4uYf5zSFVyPyTF0ClljdILhIS19A1v2oQjwQY3mOPPKHhUxh2pZpFtEzNo4uJtPXqM+J8U9+iCd73qgDWvJUTaR1PGsr/pbREX4nc5j1C52Qllzo/85BRiwS7drYbIiytTH2ViZNwTRUcHaQbv4d8Kis+ffiq6zb+NacHS2vF9+Y+1HX+bS9Dc9dqai1NNegHxXmEl/AUw562OIbGA4oqWV+N14SaOysO7+1w80io+KWee9mEAPYHdEPN3x4uY=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd9d3f9-1380-4576-5a59-08d73b6a81fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 12:28:12.7066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaS6JvQ5yR9eLM2TsMZAGBo7ZbkuBWP1q9AO2VQWmkNHzb4RKlX3yDIt/ReUfp/7PWor3nqW5O2DfItYza/ZRK2QC47mbVItjm5EIRGu/28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3490
Subject: Re: [Xen-devel] [PATCH 1/5] xen/arm: optee: impose limit on shared
 buffer size
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCgpKdWxpZW4gR3JhbGwgd3JpdGVzOgoKPiBIaSBWb2xvZHlteXIsCj4KPiBP
biA5LzE2LzE5IDQ6MjYgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pgo+PiBIaSBKdWxp
ZW4sCj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBIaSwKPj4+Cj4+PiBPbiA5LzEy
LzE5IDg6NDUgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4+Cj4+Pj4gSGkgSnVsaWVu
LAo+Pj4+Cj4+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+Pgo+Pj4+PiBIaSBWb2xvZHlteXIs
Cj4+Pj4+Cj4+Pj4+IE9uIDkvMTEvMTkgNzo0OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6
Cj4+Pj4+Pgo+Pj4+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+Pj4+Cj4+Pj4+Pj4gSGkgVm9s
b2R5bXlyLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gOC8yMy8xOSA3OjQ4IFBNLCBWb2xvZHlteXIgQmFi
Y2h1ayB3cm90ZToKPj4+Pj4+Pj4gV2Ugd2FudCB0byBsaW1pdCBudW1iZXIgb2YgY2FsbHMgdG8g
bG9va3VwX2FuZF9waW5fZ3Vlc3RfcmFtX2FkZHIoKQo+Pj4+Pj4+PiBwZXIgb25lIHJlcXVlc3Qu
IFRoZXJlIGFyZSB0d28gd2F5cyB0byBkbyB0aGlzOiBlaXRoZXIgcHJlZW1wdAo+Pj4+Pj4+PiB0
cmFuc2xhdGVfbm9uY29udGlnKCkgb3IgdG8gbGltaXQgc2l6ZSBvZiBvbmUgc2hhcmVkIGJ1ZmZl
ciBzaXplLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJdCBpcyBxdWl0ZSBoYXJkIHRvIHByZWVtcHQgdHJh
bnNsYXRlX25vbmNvbnRpZygpLCBiZWNhdXNlIGl0IGlzIGRlZXAKPj4+Pj4+Pj4gbmVzdGVkLiBT
byB3ZSBjaG9zZSBzZWNvbmQgb3B0aW9uLiBXZSB3aWxsIGFsbG93IDUxMiBwYWdlcyBwZXIgb25l
Cj4+Pj4+Pj4+IHNoYXJlZCBidWZmZXIuIFRoaXMgZG9lcyBub3QgaW50ZXJmZXJlIHdpdGggR1Ag
c3RhbmRhcmQsIGFzIGl0Cj4+Pj4+Pj4+IHJlcXVpcmVzIHRoYXQgc2l6ZSBsaW1pdCBmb3Igc2hh
cmVkIGJ1ZmZlciBzaG91bGQgYmUgYXQgbGVzdCA1MTJrQi4KPj4+Pj4+Pgo+Pj4+Pj4+IERvIHlv
dSBtZWFuICJsZWFzdCIgaW5zdGVhZCBvZiAibGVzdCI/Cj4+Pj4+PiBZZXMKPj4+Pj4+Cj4+Pj4+
Pj4gSWYgc28sIHdoeSA1MTIgcGFnZXMgKGkuZSAxTUIpCj4+IEkgaGF2ZSBtaXNzZWQgdGhhdCBl
YXJsaWVyLiBCdXQgNTEyIHBhZ2VzIGlzIDJNQiwgYWN0dWFsbHkuCj4+Cj4+Pj4+Pj4gaXMgcGxl
bnR5IGVub3VnaCBmb3IgbW9zdCBvZiB0aGUgdXNlIGNhc2VzPyBXaGF0IGRvZXMgInh0ZXN0IiBj
b25zaXN0Cj4+Pj4+Pj4gb24/Cj4+Pj4+PiBCaWdnZXIgYnVmZmVyIHh0ZXN0IHRyaWVzIHRvIGFs
bG9jYXRlIGlzIG1lcmUgMzJLQi4gSSBiZWxpZXZlIHRoYXQgMU1CCj4+Pj4+PiBpcyBlbm91Z2gg
Zm9yIHRoZSBtb3N0IGNhc2VzLCBiZWNhdXNlIE9QLVRFRSBpdHNlbGYgaGF2ZSBhIHZlcnkgbGlt
aXRlZAo+Pj4+Pj4gcmVzb3VyY2VzLiBCdXQgdGhpcyB2YWx1ZSBpcyBjaG9zZW4gYXJiaXRyYXJ5
Lgo+Pj4+Pgo+Pj4+PiBDb3VsZCB3ZSBwb3RlbnRpYWxseSByZWR1Y2UgdG8gbGV0IHNheSA1MTJL
QiAob3IgbWF5YmUgbG93ZXIpIGlmIHh0ZXN0Cj4+Pj4+IG9ubHkgYWxsb2NhdGUgMzJLQj8KPj4+
PiBQb3RlbnRpYWxseSAtIHllcy4gQnV0IG9ubHkgdG8gNTEyS0IgaWYgd2Ugd2FudCB0byBiZSBj
b21wYXRpYmxlIHdpdGgKPj4+PiB0aGUgR2xvYmFsIFBsYXRmb3JtIHNwZWNpZmljYXRpb24uIFdo
eSBhcmUgeW91IGFza2luZywgdGhvdWdoPwo+Pj4KPj4+IERvZXMgdGhlIEdsb2JhbCBQbGF0Zm9y
bSBzcGVjaWZpY2F0aW9uIGxpbWl0IHRvIDUxMktCPyBPciBpcyBpdCBhIG1pbmltdW0/Cj4+IEdQ
IFNwZWMgc2F5cywgdGhhdCBwbGF0Zm9ybSBzaG91bGQgYWxsb3cgKmF0IGxlc3QqIDUxMktCLiBV
cHBlciBsaW1pdCBpcwo+PiBub3Qgc2V0Lgo+Pgo+Pj4gQmVjYXVzZSwgdGhlIHNtYWxsZXIgdGhl
IGJ1ZmZlciBpcywgdGhlIGxlc3MgdGltZSBpdCB3aWxsIHRha2UgdG8KPj4+IHByb2Nlc3MgaW4g
dGhlIHdvcnN0IGNhc2UuIEFsc28sIGlmIHdlIGNhbiBoYXZlIGEgcmVhc29uIGZvciB0aGUgc2l6
ZQo+Pj4gKHlvdSBzZWVtIHRvIHN1Z2dlc3QgdGhlIHNwZWMgZGVmaW5lIGEgc2l6ZS4uLikgdGhl
biBpdCBpcyBtdWNoIGJldHRlcgo+Pj4gdGhhbiBhIHJhbmRvbSB2YWx1ZS4KPj4gSSBoYXZlIG5v
IHN0cm9uZyBhcmd1bWVudHMgaGVyZSwgYnV0IEkgd2FudCB0byBhbGxvdyB0aGUgYmlnZ2VzdCBz
aXplCj4+IHBvc3NpYmxlLiBJdCBzZWVtcywgdGhhdCA1MTIgcGFnZXMgaXMgdGhlIGFjY2VwdGVk
IGxpbWl0IGluIGh5cGVydmlzb3IKPj4gY29kZSAoYXQgbGVhc3QsIGluIHAybS5jKSwgc28gSSBj
aG9zZSB0aGlzIHZhbHVlLgo+Cj4gSWYgR1Agc3BlY2lmaWMgcmVxdWVzdCBhdCBsZWFzdCA1MTJL
QiwgdGhlbiBhbnkgcG9ydGFibGUgY29kZSBzaG91bGQKPiBiZSBhYmxlIHRvIGRlYWwgd2l0aCA1
MTJLQiwgcmlnaHQ/IFNvIHdoeSB3b3VsZCB5b3UgYWxsb3cgbW9yZT8gV2hhdAo+IGFyZSB0aGUg
Y29ucy9wcm9zPwpZZXMsIGFueSBwb3J0YWJsZSBjb2RlIHNob3VsZCB3b3JrIHdpdGggNTEyS0Iu
IEkgd2FudCB0byBhbGxvdyBiaWdnZXIKYnVmZmVycyBmb3IgdHdvIHJlYXNvbnM6IG9uIE9QLVRF
RSBpc3N1ZXMgdHJhY2tpbmcgcGVvcGxlIG9mdGVuIGFzayBob3cKdG8gaW5jcmVhc2UgdmFyaW91
cyBtZW1vcnkgbGltaXRzIGFjcm9zcyBPUC1URUUuIFNvLCBhcHBhcmVudGx5IHBlb3BsZQpzb21l
dGltZXMgd2FudHMgYmlnZ2VyIGJ1ZmZlcnMuIFNlY29uZCByZWFzb25zIGlzIHRoZSBub24tcG9y
dGFibGUKdGhpbmdzIGxpa2UgU2VjdXJlIERhdGEgUGF0aC4gRm9yIFNEUCBvbmUgd2FudHMgdG8g
cGFzcyBtZWRpYSAobGlrZQphdWRpbyBhbmQgdmlkZW8pIGRhdGEgdG8gYW5kIGZyb20gT1AtVEVF
LiBNZWRpYSByZXF1aXJlcyBiaWcgYnVmZmVycy4KCkFueXdheXMsIEkgY2FuIHNlZSB0aGF0IDUx
MiBwYWdlcyBhcmUgZXN0YWJsaXNoZWQgbGltaXQgaW4gdGhlIHAybQpjb2RlLiBTbywgd2h5IGRv
IHlvdSB3YW50IE9QLVRFRSBtZWRpYXRvciB0byBoYXZlIHNtYWxsZXIgbGltaXQ/CgpJIHdhbnQg
dG8gYmUgc3RyYWlnaHQgdGhlcmU6IDUxMktCIHdpbGwgbGlrZWx5IHdvcmsgZm9yIG1vc3Qgb2Yg
dGhlCnVzZXJzLiBCdXQgdGhlcmUgYXJlIGFsd2F5cyB1c2VycyB3aG8gd2FudCBtb3JlLiBTbyBJ
IHdvdWxkIGxpa2UgdG8gc2V0Cmxhcmdlc3QgcGxhdXNpYmxlIGxpbWl0IGp1c3QgaW4gY2FzZS4K
Ci0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
