Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E076B8C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:25:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr16M-0003Q6-Gm; Fri, 26 Jul 2019 14:21:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hr16K-0003Pw-PY
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:21:40 +0000
X-Inumbo-ID: ae57136c-afb0-11e9-8980-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.89]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ae57136c-afb0-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Utwq6FP1GHzDrTCZ6WOxhxeGJv0eQgaRDXkKQwHHcvZK9j+M+emopE030cxRNH+eLlisQyx6crIRW98THJ5SN2mXNKwO9GiEchsoqf44IkjOONRvojvKcGi7SAdAsCvBk84YPXqbbaRDNYkodPxBsrxGHPEcGEFRpeH59yq+RrVNcCCb51hOcHELbIShBAlIXMfSEvs7d3ahvDIV9CqcdoAQMkm628pd9n30s1l2WgJO0X/3v07BcWGiws8DTPrRodylv0/xcWZPvFpui/9r6MfcV5b9uzc8gDyA3hcMfMTx5bZqLcmEKv+zI8jyVXwsMYQ71pY0++dBo6xlMwQDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIw1/K2FFEOrIQdDl+XO3A41m1CGTvWulmuSuqe0QpU=;
 b=U+9/cLgw8SINN05+RHhExKHUATq+vssADqWWegvpTflZ5vPW3DrP5Qg+Ruwd4Frmjeml1VnU91bKKVaF3zwppvbdZHK40FLoEHsSzqfCyNVkiKMsPlA55WmmBvfC5W4kwK5a7tMPJlMctUD9if/UBVkuMRlScQPPXHk78+rh3IrK2/ZTpAXRzLvDN9Jb1gjPK22FtVywuT8Ut6lZ+n6JjP1Jn/SHepfevp4R8H/5Vc1+iesSAaumEAd5MYrveKw54L+xbYfAXDUbijJ0lKAuMxoxWCg9Ipgop+ZJQJT0PP+I4eDcA2Lmr9jA45McZ2uLbb9J1+5Cnn2k8q5D3lqfhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIw1/K2FFEOrIQdDl+XO3A41m1CGTvWulmuSuqe0QpU=;
 b=nGoWAtEHNkC6P7X2PdeR+rTdjeKk+jryeGPVxG7QPJwf4SVYIVC6Zlwu/zTOX1xNqMFL3k3B2LbqN1Bt2X8lXGK+RWn8GGa4z6d4j6msyOZAbXFwqAjV0o6+OMDZ4lEPkfZD754yWe7dL7tOv9RTyMauaONG+jCs7ibbqKOcYHCCAMNy/vtRZeM25ZPz/DU3sKnsPBlygegA3aQK73sCmfDINQRjrAVUww4LlKmkesyr9skdCZtDQl9hyj5kCIYRuPM72BTAhBmohJOKcaL7f+EsimthTruMDAr9u2B3847AE+aqAilVNXmDBiu3sHT1GMe7lPr53TsZAuNsY40e5g==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB5619.eurprd03.prod.outlook.com (10.255.182.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 14:21:37 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 14:21:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 7/7] xen/arm: types: Specify the zero padding in the
 definition of PRIregister
Thread-Index: AQHVQZ6lXvwm3o0b10iCA+aCZUR7cabc3XOAgAAItgCAABF2AA==
Date: Fri, 26 Jul 2019 14:21:37 +0000
Message-ID: <87d0hwj2q7.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-8-julien.grall@arm.com> <87imrphshw.fsf@epam.com>
 <b10a87d5-9fad-c051-774c-cd2d58fbc8dd@arm.com>
In-Reply-To: <b10a87d5-9fad-c051-774c-cd2d58fbc8dd@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c082349b-20ce-42a3-2679-08d711d491f8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB5619; 
x-ms-traffictypediagnostic: AM0PR03MB5619:|AM0PR03MB5619:
x-microsoft-antispam-prvs: <AM0PR03MB5619A1303F485406B17C33D5E6C00@AM0PR03MB5619.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(189003)(199004)(186003)(71190400001)(66446008)(6116002)(8676002)(64756008)(256004)(3846002)(76176011)(14454004)(71200400001)(6512007)(6916009)(86362001)(6486002)(478600001)(229853002)(5660300002)(6436002)(25786009)(305945005)(6506007)(99286004)(53936002)(446003)(54906003)(36756003)(7736002)(6246003)(2616005)(66066001)(53546011)(55236004)(80792005)(66946007)(76116006)(91956017)(476003)(4326008)(2906002)(81156014)(66556008)(68736007)(66476007)(81166006)(316002)(486006)(8936002)(11346002)(102836004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB5619;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HcMSh/sQMlD/AGrUp7Du1cOCM1Lv4YrCP9Hqk3ykehjHyB3oeq72TX3buSPY+K3aKqjtbAsWEmCBS8sy6BXEn6rzVFN8X0TwQFKzY/Iui2SQRDl6dC6JSZJ5rEUGJQ9VEdyvZuF7fhFdoHsD7NOXXXQnXXBadY7dmlhyfmfbGLWUauh2K+4i3PUhWj/TQV6+dLU1bQ2WcVt3Dk6OCxrkFqxVI5Sr7h07xQZaPD8XXn8RCC94r0SBMZ0eXsWPM1evgx2mT0MqBXd/K3M1wY0T3PAtdHXyAh/sIHaT5cHShbHZNaC9lijyr+mdHR3UpMnGJsODrANDHXZA4jbwVKFd8ve0cpfS2VvKm0c/NusNNTlzADA2smM8+aBskkbeLR/SSjzKwgAv0c0I5bzzpEQ5OGSdFn44/YGcufMNMdG4vag=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c082349b-20ce-42a3-2679-08d711d491f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 14:21:37.5522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5619
Subject: Re: [Xen-devel] [PATCH 7/7] xen/arm: types: Specify the zero
 padding in the definition of PRIregister
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMjYvMDcvMjAxOSAxMzo0NywgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBU
aGUgZGVmaW5pdGlvbiBvZiBQUklyZWdpc3RlciB2YXJpZXMgYmV0d2VlbiBBcm0zMiBhbmQgQXJt
NjQgKDMyLWJpdCB2cwo+Pj4gNjQtYml0KS4gSG93ZXZlciwgc29tZSBvZiB0aGUgdXNlcnMgdXNl
cyB0aGUgd3JvbmcgcGFkZGluZy4KPj4gdHlwZTogInVzZXJzIHVzZSIKPj4KPj4+IEZvciBtb3Jl
IGNvbnNpc3RlbmN5LCB0aGUgcGFkZGluZyBpcyBub3cgbW92ZWQgaW50byB0aGUgUFJJcmVnaXN0
ZXIgYW5kCj4+PiB2YXJpZXMgZGVwZW5kaW5nIG9uIHRoZSBhcmNoaXRlY3R1cmUuCj4+IEknbSBu
b3Qgc3VyZSB0aGlzIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4gVGhlcmUgYXJlIGxvdHMgb2Yg
Y29kZQo+PiAoZXNwZWNpYWxseSBpbiB2Z2ljKSB0aGF0IGRvZXMgbm90IHVzZSBwYWRkaW5nIGF0
IGFsbC4gTm93IGl0IHdpbGwgcHJpbnQKPj4gcGFkZGluZywgZXZlbiBpZiBvcmlnaW5hbCBhdXRo
b3IgZG9lcyBub3Qgd2FudGVkIHRvLiBBbmQsIGhvbmVzdGx5IGl0IGlzCj4+IGhhcmQgdG8gcGFy
c2UgMTUtMTYgemVyb2VzIGluIGEgcm93Lgo+Cj4gV2VsbCwgSSBhbSB1c3VhbGx5IHN0YXJ0aW5n
IHRvIHJlYWQgZnJvbSB0aGUgcmlnaHQgdG8gbGVmdC4gU28sIGZvcgo+IG1lLCAxNS0xNiB6ZXJv
ZXMgYXJlIGVhc3kgdG8gaWdub3JlIDspLgpBbmQgd2hhdCBpZiB0aGVyZSBvbmx5IG9uZSBiaXQg
c2V0IG9uIHBvc2l0aW9uIDMxIG9yIDM1PyA6KQpQZXJzb25hbGx5LCBJJ2QgbGlrZSB0byBzZWUg
c3VjaCBudW1iZXIgZ3JvdXBlZCBsaWtlICJGRURDQkE5OCA3NjU0MzIxMCIKQW55d2F5cywgdGhp
cyBpcyBtYXR0ZXIgb2YgcGVyc29uYWwgdGFzdGUuIEknbSBva2F5IHdpdGggcGFkZGluZy4KCj4+
Cj4+IEkgYW0gc3VnZ2VzdGluZyB0byBhZGQgYW5vdGhlciBtYWNybyBsaWtlIFBSSXJlZ2lzdGVy
X3BhZCBvciBzb21ldGhpbmcKPj4gbGlrZSB0aGF0Lgo+Cj4gTm8sIHdlIHNob3VsZCBwcmludCBy
ZWdpc3RlciB0aGUgc2FtZSB3YXkgZXZlcnl3aGVyZS4gSSBhbSBjbGVhcmx5IGFnYWluc3QKPiBw
cm92aWRpbmcgdHdvIGRpZmZlcmVudCBmb3JtYXRzIGhlcmUgZm9yIHRoZSBzYW1lIHR5cGUuIE90
aGVyd2lzZSB0aGlzCj4gd2lsbCBsZWFkIHRvIGVuZGxlc3MgZGViYXRlIG9uIHdoaWNoIG9uZSB5
b3Ugd2lsbCBjaG9zZSBpbiB0aGUgY29kZS4KT2theSB0aGVuLiBCdXQgYXQgbGVhc3QgeW91IHNo
b3VsZCBtZW50aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSwgdGhhdAp0aGlzIGNoYW5nZSB3aWxs
IGFmZmVjdCBvdGhlciBwcmludHMsIG5vdCBvbmx5IHRoZSBvbmVzIGluIHRoZSBkaWZmLgoKLS0g
ClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
