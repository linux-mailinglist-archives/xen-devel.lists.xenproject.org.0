Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAEBC8FB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 15:36:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCku9-0001tb-7V; Tue, 24 Sep 2019 13:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iCku7-0001tW-4z
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 13:30:55 +0000
X-Inumbo-ID: 87dc21ea-decf-11e9-97fb-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::62f]) by localhost (Halon) with ESMTPS
 id 87dc21ea-decf-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 13:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9teLuU/pUcMOX4QqPYN3Vv6sKP8Q8bC0nXVUNj51NTdDf0TjSO87WrZ0YifA2IEDedgESMoYOeSN9r8kXIUnxXQJFI6IvHXRnLhTQDxp5sr2ZeJzuyOEIq11/CJH2QCkpFemdDBdtdciug244gOqxDLRPMvz0wC4yC8mgqXTOMmVfbCuYmAUB1NexAJtnXEv6vcJNUXFTFrOzpQg6gbrUOwX4wpqSICRJ514bJgjtalHw3L4Yz4+d+ZrtMe4s43hZTaIqC+7S/jEZICkE9M21EIiEgbEcOZeEpqTlDbboJuS8drvOj4lD8DxoRais9qqJO72/oFAm+PpFhznszzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTCftnCSKeWIE/9wCIBUfe1EqfVjk+qJELx3ZQKhp2o=;
 b=cHsgsKOSZicbGx+IVBUvrphj1sBJhMgAdk9DnMyeFuspYzCpjDAVhwIUizu24OChJPVEPpO7QUWONJU+klUeVqytz9ynM4zSPgrIHLg1wH5iAqkVOgslhvhLutPITtnDh50CyuP5bg/BJDnlwScKKw1x9h7TYPQTguOVyoBr4OMI6OIbqJTPbft5mV24XBkgxm3vbvY/wukpzB2omGFKUkZKtZsPBNXwlpLv5AKBIP3LA3iKS3ZwUfptj3byW6ySgFPnC1n5bhCx9jyDN+iv4dl4M6nelO2HGaNc6MfeplXp062uuCivCFmShlQ/j0d5FIqIoYOB/TAIm/bX97sUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTCftnCSKeWIE/9wCIBUfe1EqfVjk+qJELx3ZQKhp2o=;
 b=hYmJ4x+fN8erp6hhVn+P/pn62e7VCmsJZfgCNucpF5KFVMsZVDx/Ys4oPvk63xICaUs9aBZUSEacyTgY/+rZnnTFlpCL+oST8/QfVlnS0e0lQWX14htwYvjrNZBdAi5LKdQLTCKZqa+u9lNcYNvCn/tF3sbOdUiAyEbeMVcdew0=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB4438.eurprd03.prod.outlook.com (20.177.36.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 13:30:52 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 13:30:52 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 4/6] xen/arm: optee: handle shared buffer translation
 error
Thread-Index: AQHVblIEDLSpGG3MwUmqKYBWTkOKG6c5CdYAgAGyYoCAAAglAIAAF4+A
Date: Tue, 24 Sep 2019 13:30:51 +0000
Message-ID: <87blv9akj8.fsf@epam.com>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-5-volodymyr_babchuk@epam.com>
 <b6ddb159-463f-2e30-35b8-5aefae38b94f@arm.com> <87ef069b7w.fsf@epam.com>
 <de2f8861-8705-bd99-268b-2312dd50d84c@arm.com>
In-Reply-To: <de2f8861-8705-bd99-268b-2312dd50d84c@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0e1f1ed-7d7f-4348-5883-08d740f36b75
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB4438; 
x-ms-traffictypediagnostic: AM6PR03MB4438:|AM6PR03MB4438:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB443801F3F3476F7F208E82DDE6840@AM6PR03MB4438.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(199004)(189003)(66556008)(7736002)(25786009)(8936002)(6512007)(6436002)(26005)(91956017)(71200400001)(316002)(76116006)(3846002)(64756008)(446003)(229853002)(66446008)(76176011)(66946007)(478600001)(36756003)(71190400001)(6116002)(55236004)(80792005)(486006)(8676002)(11346002)(6486002)(66476007)(14454004)(6506007)(102836004)(66066001)(86362001)(6916009)(5660300002)(99286004)(53546011)(476003)(81166006)(81156014)(2616005)(54906003)(256004)(14444005)(186003)(2906002)(6246003)(4326008)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4438;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pCV0Ows0uPDqlEOYpa3BwYLAGzZfiohymgm8xjkcE8E417g/a3foxZfO1jcf/QYF9oEpxT0ATlFsfRVg6E/Q1rA+bMn3yyyt09NnY5esznaNqM8c780nRbbCe2SupBhRg556zqRVg267/RVML/tNKQH+/kSLtG3b8f1IRMreBGBizDJ3L/UtB5hMqlkl8sCDa5uKmrntTV7dL6JJiHU7txdvyiMMzqcWP7tSg+DaM7NurJMFSgVC9YLG7HG/S5+oB80S9/h3IiOIMDFvPx/o0MDkHNheJcbRZlL8PVg9GqYxsqTra240XLtc/OeYELJS5zkpKSCAWoMHCCnrnvq/Ea2VDKhiMGwuS0clvqT8DPLIPlpuEAkVr1MvmScvNHRVp26rGmwYYaSeB4KVuKyqWHXwOo8+rlvyqZsdVkYLsJ8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e1f1ed-7d7f-4348-5883-08d740f36b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 13:30:51.9104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4bmmhIJx4SrPkj67wpLMgiFtN+sfUVVSnlc/zJpyHVVYH1DNasuZdE8nPBSVIl4FmCk0NWKb0Uc3eRt1JxkvCOW874DT4tWIXWBCiR5JcrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4438
Subject: Re: [Xen-devel] [PATCH v2 4/6] xen/arm: optee: handle shared buffer
 translation error
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDI0LzA5LzIwMTkgMTI6MzcsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pgo+PiBIaSBKdWxpZW4sCj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6
Cj4+Cj4+PiBIaSwKPj4+Cj4+PiBPbiAxOC8wOS8yMDE5IDE5OjUxLCBWb2xvZHlteXIgQmFiY2h1
ayB3cm90ZToKPj4+PiArLyogSGFuZGxlcyByZXR1cm4gZnJvbSBYZW4taXNzdWVkIFJQQyAqLwo+
Pj4+ICtzdGF0aWMgdm9pZCBoYW5kbGVfeGVuX3JwY19yZXR1cm4oc3RydWN0IG9wdGVlX2RvbWFp
biAqY3R4LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgb3B0ZWVfc3RkX2NhbGwgKmNhbGwsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgc2htX3JwYyAqc2htX3JwYykKPj4+PiArewo+Pj4+ICsgICAg
Y2FsbC0+c3RhdGUgPSBPUFRFRV9DQUxMX05PUk1BTDsKPj4+PiArCj4+Pj4gKyAgICAvKgo+Pj4+
ICsgICAgICogUmlnaHQgbm93IHdlIGhhdmUgb25seSBvbmUgcmVhc29uIHRvIGJlIHRoZXJlIC0g
d2UgYXNrZWQgZ3Vlc3QKPj4+PiArICAgICAqIHRvIGZyZWUgc2hhcmVkIGJ1ZmZlciBhbmQgaXQg
ZGlkIGl0LiBOb3cgd2UgY2FuIHRlbGwgT1AtVEVFCj4+Pj4gKyAgICAgKiB0aGF0IGJ1ZmZlciBh
bGxvY2F0aW9uIGZhaWxlZC4gV2UgYXJlIG5vdCBzdG9yaW5nIGV4YWN0IGNvbW1hbmQKPj4+PiAr
ICAgICAqIHR5cGUsIG9ubHkgdHlwZSBvZiBSUEMgcmV0dXJuLiBTbywgdGhpcyBpcyB0aGUgb25s
eSBjaGVjayB3ZQo+Pj4+ICsgICAgICogY2FuIHBlcmZvcm0gdGhlcmUuCj4+Pj4gKyAgICAgKi8K
Pj4+PiArICAgIEFTU0VSVChjYWxsLT5ycGNfb3AgPT0gT1BURUVfU01DX1JQQ19GVU5DX0NNRCk7
Cj4+Pgo+Pj4gQXMgSSBwb2ludGVkIG91dCBpbiB2MSwgQVNTRVJUKCkgaXMgcHJvYmFibHkgdGhl
IGxlc3MgZGVzaXJhYmxlCj4+PiBzb2x1dGlvbiBoZXJlIGFzIHRoaXMgaXMgYW4gZXJyb3IgcGF0
aC4KPj4gTG9va3MgbGlrZSBJIG1pc3VuZGVyc3Rvb2QgeW91IDooCj4+Cj4+PiBDYW4geW91IGV4
cGxhaW4gd2h5IHlvdSBjaG9zZSB0aGF0IG92ZXIgdGhlIDMgc29sdXRpb25zIEkgc3VnZ2VzdGVk
Pwo+PiBJIHRoaW5rIEkgbmVlZCBzb21lIGNsYXJpZmljYXRpb24gdGhlcmUuIEFTU0VSVCgpIGlz
IGFkb3B0ZWQgd2F5IHRvIHRlbGwKPj4gYWJvdXQgaW52YXJpYW50LiBDbGVhcmx5LCB0aGlzIGlz
IHByb2dyYW1taW5nIGVycm9yIGlmIEFTU0VSVCgpIGZhaWxzLgo+Cj4gVGhhdCdzIGNvcnJlY3Qu
Cj4KPj4KPj4gQnV0IEkgdW5kZXJzdGFuZCwgdGhhdCBBU1NFUlQoKSBpcyBhdmFpbGFibGUgb25s
eSBpbiBkZWJ1ZyBidWlsZC4gU28sIGluCj4+IHJlbGVhc2UgaXQgd2lsbCBuZXZlciBmaXJlLiBB
cyB0aGlzIGlzIHZlcnkgdW5saWtlbHkgZXJyb3IgcGF0aCwgYnVnCj4+IHRoZXJlIGNhbiBsaXZl
IGZvcmV2ZXIuIE9rYXksIHNvIEFTU0VSVCgpIGlzIHRoZSBsZWFzdCBkZXNpcmFibGUgd2F5Lgo+
Cj4gVGhpcyBpcyBteSBjb25jZXJuLCBBU1NFUlQoKSBhcmUgZmluZSBpbiBwYXRoIHRoYXQgY2Fu
IGJlIGV4ZXJjaXNlZAo+IHF1aXRlIHdlbGwuIEJ5IGV4cGVyaWVuY2UsIGVycm9yIHBhdGggYXMg
bm90IHNvIHdlbGwgdGVzdGVkLCBzbyBhbnkKPiB2ZXJib3NpdHkgaW4gbm9uLWRlYnVnIGJ1aWxk
IGlzIGFsd2F5cyBoZWxwZnVsLgpZZXAsIEkgc2VlLgoKPj4KPj4gV2FybmluZyBpcyBub3QgZW5v
dWdoLCBhcyB3ZSBhcmUgYWxyZWFkeSBpbiBpbmNvcnJlY3Qgc3RhdGUuCj4gSW5jb3JyZWN0IHN0
YXRlIGZvciB3aG8/IFRoZSBndWVzdD8KWWVzLCBmb3IgdGhlIGN1cnJlbnQgY2FsbCBvZiB0aGUg
Y3VycmVudCBndWVzdC4gU3RhdGUgb2Ygb3RoZXIgY2FsbHMgYW5kCm90aGVyIGd1ZXN0cyBzaG91
bGQgbm90IGJlIGFmZmVjdGVkLiBCdXQgaXQgaXMgcG9zc2libGUgdGhhdCBvdXIgdmlldyBvZgpP
UC1URUUgc3RhdGUgZm9yIHRoYXQgZ3Vlc3QgaXMgbm90IGNvcnJlY3QgYWxzby4KCj4+Cj4+IFNv
LCBiZXN0IHdheSBpcyB0byBjcmFzaCBndWVzdCwgaXQgdGhpcyBjb3JyZWN0PyBJJ2xsIGRvIHRo
aXMgaW4gdGhlCj4+IG5leHQgdmVyc2lvbiB0aGVuLgo+Cj4gQSBydWxlIG9mIHRodW1iIGlzCj4g
ICAtIEJVR19PTiBjYW4gYmUgcmVwbGFjZWQgYnkgZG9tYWluX2NyYXNoKCkgYXMgdGhpcyBpcyBh
IGZhdGFsIGVycm9yCj4geW91IGNhbid0IHJlY292ZXIgKHRoZSBzY29wZSBkZXBlbmRzIG9uIHRo
ZSBmdW5jdGlvbiBjYWxsKS4KVGhpcyBzZWVtcyBjb3JyZWN0LgoKPgo+ICAgLSBBU1NFUlQoKSBj
YW4gYmUgcmVwbGFjZWQgYnkgV0FSTl9PTigpIGFzIHRoZSBmb3JtZXIgd2lsbCBiZSBhIE5PUAo+
IGluIG5vbi1kZWJ1ZyBidWlsZC4gSW4gYm90aCBjYXNlLCB0aGUgZXJyb3IgaXMgbm90IGZhdGFs
IGFuZCBjb250aW51ZQo+IHdpbGwgbm90IHJlc3VsdCBTbyBpdCBtZWFucyB0aGUgZXJyb3IgaXMg
bm90IGZhdGFsLgpJIGNhbid0IGFncmVlIHdpdGggdGhpcyBpbiBnZW5lcmFsLiBCdXQgbWF5YmUg
dGhpcyBtYWtlcyBzZW5zZSBmb3IgWGVuLgpBcyBJIHNhaWQsIGdlbmVyYWxseSBBU1NFUlQoKSBp
cyB1c2VkIHRvLCB3ZWxsLCBhc3NlcnQgdGhhdCBjb25kaXRpb24gaXMKdHJ1ZSBmb3IgYW55IGNv
cnJlY3Qgc3RhdGUgb2YgYSBwcm9ncmFtLiBTbyBpdCBjYW50JyBiZSByZXBsYWNlZCB3aXRoCldB
Uk5fT04oKS4gSWYgd2UgZGV0ZWN0ZWQgaW52YWxpZCBzdGF0ZSB3ZSBzaG91bGQgZWl0aGVyIHRy
eSB0byBjb3JyZWN0Cml0IChpZiBrbm93IGhvdykgb3IgdG8gaW1tZWRpYXRlbHkgc3RvcCB0aGUg
cHJvZ3JhbS4KCkJ1dCBJIGNhbiBzZWUsIHdoeSB0aGlzIGJlaGF2aW9yIGlzIG5vdCBkZXNpcmVk
IGZvcgpoeXBlcnZpc29yLiBFc3BlY2lhbGx5IGluIHByb2R1Y3Rpb24gdXNlLgoKPiBZb3UgdXNl
ZCBBU1NFUlQoKSBpbiB5b3VyIGNvZGUsIHNvIGl0IGZlZWxzIHRvIG1lIHRoYXQgV0FSTl9PTigp
IHdvdWxkCj4gYmUgYSBzdWl0YWJsZSByZXBsYWNlbWVudC4KV2VsbCwgaG9uZXN0bHkgSSBiZWxp
ZXZlIHRoYXQgaXQgaXMgYmV0dGVyIHRvIGNyYXNoIGd1ZXN0IHRvIHByZXZlbnQKYW55IGFkZGl0
aW9uYWwgaGFybS4gTG9vaywgd2UgYWxyZWFkeSBkZXRlY3RlZCB0aGF0IHNvbWV0aGluZyBpcyB3
cm9uZwp3aXRoIG1lZGlhdG9yIHN0YXRlIGZvciBjZXJ0YWluIGd1ZXN0LiBXZSBjYW4gcHJldGVu
ZCB0aGF0IGFsbCBpcyBmaW5lCmFuZCB0cnkgdG8gY29udGludWUgdGhlIGNhbGwuIEJ1dCB3aG8g
a25vd3Mgd2hpY2ggY29uc2VxdWVuY2VzIGl0IHdpbGwgaGF2ZT8KCj4gSG93ZXZlciwgaWYgdGhl
IHN0YXRlIGluY29uc2lzdGVuY3kgaXMgZm9yIFhlbiwgdGhlbiBkb21haW5fY3Jhc2goKSBpcwo+
IHRoZSBiZXN0LiBJZiB0aGlzIGlzIGZvciB0aGUgZ3Vlc3QsIHRoZW4gdGhpcyBpcyBub3QgcmVh
bGx5IG91cgo+IGJ1c2luZXNzIGFuZCBpdCBtYXkgYmUgYmVzdCB0byBsZXQgaGltIGNvbnRpbnVl
IGFzIGl0IGNvdWxkIHByb3ZpZGUKPiBtb3JlIGRlYnVnIChkb21haW5fY3Jhc2goKSB3aWxsIG9u
bHkgZHVtcCB0aGUgc3RhY2sgYW5kIHJlZ2lzdGVycykuCkknbSBsb29raW5nIGF0IHRoaXMgZnJv
bSBkaWZmZXJlbnQgcG9pbnQ6IHdlIHByb21pc2VkIHRvIHByb3ZpZGUgc29tZQpzZXJ2aWNlIGZv
ciBhIGd1ZXN0IGFuZCBzY3Jld2VkIHVwLiBJdCBpcyBub3QgZ3Vlc3QncyBmYXVsdC4gTm93IHdl
IGtub3cKdGhhdCB3ZSBjYW4ndCBwcm92aWRlIHJlbGlhYmxlIHNlcnZpY2UgZm9yIGEgZ3Vlc3Qg
YW55bW9yZS4gRnJvbQpzYWZldHkgcG9pbnQgb2YgdmlldyB3ZSBzaG91bGQgc2h1dCBkb3duIHRo
ZSBzZXJ2aWNlLiAoQnV0IHRoaXMgaXMgam9iCmZvciBhbm90aGVyIHBhdGNoKSBGb3Igbm93LCB3
ZSBhdCBsZWFzdCBzaG91bGQgY3Jhc2ggdGhlCmd1ZXN0LiBUaGlzIGlzIHRoZSBzYWZlc3Qgd2F5
LiBXaGF0IGRvIHlvdSB0aGluaz8KCi0tClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
