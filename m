Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4718BBA7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:37:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxXsp-0002LL-6T; Tue, 13 Aug 2019 14:34:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FUCW=WJ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hxXsn-0002LG-JL
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:34:41 +0000
X-Inumbo-ID: 7aaee14c-bdd7-11e9-9881-27f0683acb12
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7aaee14c-bdd7-11e9-9881-27f0683acb12;
 Tue, 13 Aug 2019 14:34:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFO2p13bi7QVh6k8n2AUOy578Sm2dmFBYBfJpHja1sLUvfM06VpbndYz2CaisDFLtuF3qSDwKpXxSdGvvJKE7NGgS1HM5BNcWu8Qcx9FHc46KL6AgbvZre0Od9jFXSkCw2rHBvvNyyTKn7LNssb1J2s/43/zdOzPwDr/9Mw9BBt5J7iiFXd5Lb9Njy2DjPzd1U93tg86pl4fW4SOhlBav5sCNw17MgPdFLDFHTHonzyZfJSDDxOPIpdteaQIX+dVcOa8n2Evl7b/ar3Iw6JzHaqTGkXweCEpCjbM9Nn54umbcByN121ZQ4FpkDSO60YJtnkAc+nTn6MlgnKSc52+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A/hWZzefzlVqN2RH+GSwfskxqCCoWSZu205i/n4ML4=;
 b=BhKZ4aVaYfTRD1yo4PWINz0hEUZ7YYitJbh5GWCCuhIDnM84ttZu39ecVdvN2d9JD4str658xiPCCfp3mfopAq7teO+rlReZ76VZavR/NQs4nzpxYyK+o+OrzP0SjfRIv/EVzducvSI0DscaruyJwG5OkqQ3zzT1dAZs5O95iJ9dizi+VjJZVlBrWdpdT+qzXZxB6hEK3HOAIeYUuPoij3ACde36ZV/t35THS8ahuq89vjs9XLrh9wYlc3OujehkYkJywsk/PB0A4407epDnUCl8BkvemEKFmVyIVpWKELs1zj841tzR0Hvb/QyWTJBQmH78JHi2YcncBq/a/ZsmlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+A/hWZzefzlVqN2RH+GSwfskxqCCoWSZu205i/n4ML4=;
 b=QSc+j6EA3GL9kYy9v0v8Ejug1jKE8pxf3jivf/6N7tN28lCfvrsPrTQC0g6oLAH9z2vS625JPAlkxlD90cn2TVyrwewQ3+vsM9R6+XWtU/skAi3DuFq8G3ZPK2TjxfThdIcbWHIgzlXaNhSzfcF3wnxE3maqmiiyswpob0sHT1ca10HCW31r6YqYdON/PEj+Zx+YuBH1XhhlOMHXXPonm7yvLqgHmRJrBPqTP2wbQ8TSJo5h9VUI/dt1OrYtGy7LE785DRSN+TdX33tnLD+33ShouqG37uZ0FyTOSX+4kaHJTsKqTIr3Ox62fhfysJS6AT2G+OyRLJarASoQN7Y74A==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6145.eurprd03.prod.outlook.com (10.141.190.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Tue, 13 Aug 2019 14:34:37 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 14:34:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH v5 6/7] xen/arm: don't iomem_permit_access for
 reserved-memory regions
Thread-Index: AQHVUV1R4cCemTtGPUudkUSUkscveab5JbyA
Date: Tue, 13 Aug 2019 14:34:37 +0000
Message-ID: <87blwtgmma.fsf@epam.com>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-6-sstabellini@kernel.org>
In-Reply-To: <20190812222844.9636-6-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f9d3b84-fc12-4f99-7ca7-08d71ffb5e7b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6145; 
x-ms-traffictypediagnostic: AM0PR03MB6145:|AM0PR03MB6145:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB61459A3DE3DB3126375F57BCE6D20@AM0PR03MB6145.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(66066001)(66446008)(14444005)(4326008)(316002)(256004)(91956017)(66946007)(66556008)(64756008)(186003)(66476007)(6506007)(71200400001)(6486002)(71190400001)(55236004)(76116006)(7736002)(26005)(305945005)(53936002)(54906003)(80792005)(486006)(76176011)(6512007)(3846002)(6116002)(14454004)(478600001)(86362001)(6246003)(6916009)(81166006)(81156014)(36756003)(446003)(11346002)(8936002)(25786009)(99286004)(229853002)(2906002)(2616005)(6436002)(476003)(8676002)(5660300002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6145;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3UnNwRD4CbeLSLE81HgzjDpfmLFrNfkmj/fj9oRHBZCDUX0yzb3V30S+n8d/CN83Xvu45bEM8z2m2jPojAXa1eaiYe2WQjGOF3HOJ2VsQlcWi/v4x1Zh4ZDln4pU09aWv8qzcnox8s86WbsgULhYPhkM5aCBuhB1Hxxdsmo8TkdJeitVv1fEboyaPVxDVy4s8m3Wr3aI/kOT5Q7cxZWivp81jc5+WD7y7n/WkJo/TZ6JaKk+XI3VQNhj9tkxDIRyMllo0I7bavzKb2oumJOLJfQ4HOeFn72A7Y+Pfsnx6AN4p6vJnyMPb2zwsF0Fa7bWsdR6Rr5xc1VYna/k35jS4aCSdYRQAZLDd7bogr34hkJ9YU2DjNDzxnHnPgFIvT5onVqk2pgyJUvr4vSSdCX8ghKOrKmuXIVAMImHLUbKZ+M=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9d3b84-fc12-4f99-7ca7-08d71ffb5e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 14:34:37.7060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLQNFPVeB2kd0VlfnNeBazNxgxSF/w1So/ZKvwFDTW3lWV5zkq4dwa1ATXCs6liWuf6CSylQxjojDyX23cFwDZcQQVK1Vm/7c18j8cs2yMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6145
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cgo+IERvbid0IGFsbG93IHJlc2VydmVkLW1lbW9y
eSByZWdpb25zIHRvIGJlIHJlbWFwcGVkIGludG8gYW55IHVucHJpdmlsZWdlZAo+IGd1ZXN0cywg
dW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJlIHByb3Blcmx5IHN1cHBvcnRlZCBpbiBY
ZW4uIEZvcgo+IG5vdywgZG8gbm90IGNhbGwgaW9tZW1fcGVybWl0X2FjY2VzcyBvbiB0aGVtLCBi
ZWNhdXNlIGdpdmluZwo+IGlvbWVtX3Blcm1pdF9hY2Nlc3MgdG8gZG9tMCBtZWFucyB0aGF0IHRo
ZSB0b29sc3RhY2sgd2lsbCBiZSBhYmxlIHRvCj4gYXNzaWduIHRoZSByZWdpb24gdG8gYSBkb21V
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbngu
Y29tPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2NToKPiAtIGZpeCBjaGVjayBjb25kaXRpb24KPiAt
IHVzZSBzdHJuaWNtcAo+IC0gcmV0dXJuIGVycm9yCj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdl
Cj4KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gY29tcGFyZSB0aGUgcGFyZW50IG5hbWUgd2l0aCByZXNl
cnZlZC1tZW1vcnkKPiAtIHVzZSBkdF9ub2RlX2NtcAo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIG5l
dyBwYXRjaAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyNCArKysrKysr
KysrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggNGM4NDA0MTU1YS4uZTBjMGMw
MWM4OCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMTE1NSwxNSArMTE1NSwyMyBAQCBzdGF0
aWMgaW50IF9faW5pdCBtYXBfcmFuZ2VfdG9fZG9tYWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vf
bm9kZSAqZGV2LAo+ICAgICAgYm9vbCBuZWVkX21hcHBpbmcgPSAhZHRfZGV2aWNlX2Zvcl9wYXNz
dGhyb3VnaChkZXYpOwo+ICAgICAgaW50IHJlczsKPiAgCj4gLSAgICByZXMgPSBpb21lbV9wZXJt
aXRfYWNjZXNzKGQsIHBhZGRyX3RvX3BmbihhZGRyKSwKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEpKSk7Cj4gLSAg
ICBpZiAoIHJlcyApCj4gKyAgICAvKgo+ICsgICAgICogRG9uJ3QgZ2l2ZSBpb21lbSBwZXJtaXNz
aW9ucyBmb3IgcmVzZXJ2ZWQtbWVtb3J5IHJhbmdlcyB0byBkb21Vcwo+ICsgICAgICogdW50aWwg
cmVzZXJ2ZWQtbWVtb3J5IHN1cHBvcnQgaXMgY29tcGxldGUuCj4gKyAgICAgKi8KPiArICAgIGlm
ICggc3RybmljbXAoZHRfbm9kZV9mdWxsX25hbWUoZGV2KSwgIi9yZXNlcnZlZC1tZW1vcnkiLAo+
ICsgICAgICAgICBzdHJsZW4oIi9yZXNlcnZlZC1tZW1vcnkiKSkgIT0gMCApCldoeSBhcmUgeW91
IHVzaW5nIHN0cm5pY21wIHRoZXJlPyBXaXRoIHN1Y2ggdXNhZ2UgaXQgaXMgdGhlIHNhbWUgYXMK
c3RyY2FzZWNtcCgpLiBCdXQsIGlmIHlvdSB3YW50IHRvIGZpbmQgIi9yZXNlcnZlZC1tZW1vcnki
IGFueXdoZXJlIGluCmR0X25vZGVfZnVsbF9uYW1lKGRldiksIHRoZW4geW91IHByb2JhYmx5IHdh
bnQgdG8gdXNlIHN0cmNhc2VzdHIoKQoKCj4gICAgICB7Cj4gLSAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgIlVuYWJsZSB0byBwZXJtaXQgdG8gZG9tJWQgYWNjZXNzIHRvIgo+IC0gICAgICAgICAg
ICAgICAiIDB4JSJQUkl4NjQiIC0gMHglIlBSSXg2NCJcbiIsCj4gLSAgICAgICAgICAgICAgIGQt
PmRvbWFpbl9pZCwKPiAtICAgICAgICAgICAgICAgYWRkciAmIFBBR0VfTUFTSywgUEFHRV9BTElH
TihhZGRyICsgbGVuKSAtIDEpOwo+IC0gICAgICAgIHJldHVybiByZXM7Cj4gKyAgICAgICAgcmVz
ID0gaW9tZW1fcGVybWl0X2FjY2VzcyhkLCBwYWRkcl90b19wZm4oYWRkciksCj4gKyAgICAgICAg
ICAgICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKPiArICAg
ICAgICBpZiAoIHJlcyApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9H
X0VSUiAiVW5hYmxlIHRvIHBlcm1pdCB0byBkb20lZCBhY2Nlc3MgdG8iCj4gKyAgICAgICAgICAg
ICAgICAgICAgIiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4iLAo+ICsgICAgICAgICAgICAg
ICAgICAgIGQtPmRvbWFpbl9pZCwKPiArICAgICAgICAgICAgICAgICAgICBhZGRyICYgUEFHRV9N
QVNLLCBQQUdFX0FMSUdOKGFkZHIgKyBsZW4pIC0gMSk7Cj4gKyAgICAgICAgICAgIHJldHVybiBy
ZXM7Cj4gKyAgICAgICAgfQo+ICAgICAgfQo+ICAKPiAgICAgIGlmICggbmVlZF9tYXBwaW5nICkK
CgotLSAKVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
