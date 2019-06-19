Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E474C05E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 19:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hden0-00081M-7p; Wed, 19 Jun 2019 17:54:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=33VD=US=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdemy-00080u-NE
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 17:54:28 +0000
X-Inumbo-ID: 47548714-92bb-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::617])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 47548714-92bb-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPusLnllTHuMAa/iQEdg0Y7S7nsjfP/cC41bm+NMPS0=;
 b=aBHGGwUlOj1rF8fXjoWI+f+L6CgNwmp5A5cakYNIoR2YG0vhZCK0K+2ooJI2p53oiTIDigj0+yspKA9LAadYKKqZFXju9PFAdIRMc5nXivFzAwZ/DMyW7H98YLchYMJC/pGvtToF/nm/i2KoI56hOB+eY7V2z5Ma/MVqOjUxRJmZFZrHWGtr0JqRU/zO31Xvhn0q47w3t1QiWr2KmfU7KYgKNqrxRZEtlEKSs597XLBkxMpzGbu0DK5v1ruPG9wkpHSuDkgl5IE/6FkEV7UH3tw5ckEdRWs2CnkF6YHcL3JI9SNfMMse5a6GNILOiLF8D+aJ1jSDm8/cDFXjF+TVpw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB6051.eurprd03.prod.outlook.com (10.255.31.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 17:54:24 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Wed, 19 Jun 2019
 17:54:24 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v7 4/5] xen/arm: optee: check if OP-TEE is
 virtualization-aware
Thread-Index: AQHVJsgHYgzSdRXgHUqfEmSdUVS6sg==
Date: Wed, 19 Jun 2019 17:54:24 +0000
Message-ID: <20190619175333.29938-5-volodymyr_babchuk@epam.com>
References: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190619175333.29938-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 007d3342-b0bc-45f1-0d4a-08d6f4df2a71
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6051; 
x-ms-traffictypediagnostic: AM0PR03MB6051:
x-microsoft-antispam-prvs: <AM0PR03MB60512CD9AB4D0BC93F33CC6BE6E50@AM0PR03MB6051.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(81156014)(186003)(3846002)(76116006)(26005)(6506007)(14454004)(72206003)(64756008)(6436002)(2616005)(1076003)(2351001)(54906003)(486006)(4326008)(5660300002)(36756003)(6486002)(80792005)(66556008)(8936002)(66446008)(55236004)(66946007)(446003)(71190400001)(476003)(102836004)(68736007)(66476007)(71200400001)(99286004)(53936002)(6512007)(76176011)(7736002)(86362001)(8676002)(25786009)(73956011)(305945005)(316002)(2501003)(66066001)(6116002)(478600001)(256004)(11346002)(2906002)(5640700003)(91956017)(81166006)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6051;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fGO9+JpDqjTI6AdVcOOoRBdF4JYg/WoiVqs1TL45U6hekXLAeVTBnzTAuPMIZ9peoq24QQB+6lLs8sJKIlJ5SMK5dh3ODSAXVGQE+dzYJjsBiSJK4JronsnYJUcNj5WW7JIWUMcHxNNSDxBvcaM8T2TIA9bgc14rNqpwSp4XfH+GE1B52DZKZ66zgDTYj7KapnR0EFF/Iws718qOBPO5BrNCxLFC+F054E3MIfgyj1cjkFlcbHJN5ykdLwdJubmWZkPZne5qRSqWMTK68jpQaEg6pfWY0ZG+V8hc1skoJmKjapBslDD859mRa1HRWmglaxJ3u/QYIjr2mNNwKUf8nBGixVtHPw1O9XzrqJm0eyAVs0tRfPCGlfAPQnG9oxEQyAE2fW3+H7ULFNRAgzTEls5RWJNODWlDB7WFw4rQjeA=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007d3342-b0bc-45f1-0d4a-08d6f4df2a71
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 17:54:24.5580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6051
Subject: [Xen-devel] [PATCH v7 4/5] xen/arm: optee: check if OP-TEE is
 virtualization-aware
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB3b3JrYXJvdW5kIGZvciBPUC1URUUgMy41LiBUaGlzIGlzIHRoZSBmaXJzdCBPUC1U
RUUgcmVsZWFzZQp3aGljaCBzdXBwb3J0cyB2aXJ0dWFsaXphdGlvbiwgYnV0IHRoZXJlIGlzIG5v
IHdheSB0byB0ZWxsIGlmCk9QLVRFRSB3YXMgYnVpbHQgd2l0aCB0aGF0IHN1cHBvcnQgZW5hYmxl
ZC4gV2UgY2FuIHByb2JlIGZvciBpdApieSBjYWxsaW5nIFNNQyB0aGF0IGlzIGF2YWlsYWJsZSBv
bmx5IHdoZW4gT1AtVEVFIGlzIGJ1aWx0IHdpdGgKdmlydHVhbGl6YXRpb24gc3VwcG9ydC4KClNp
Z25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNv
bT4KLS0tCiB4ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUv
b3B0ZWUuYyBiL3hlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYwppbmRleCAyOGQzNDM2MGZjLi4xNDM4
MWQ2YjJkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMKKysrIGIveGVuL2Fy
Y2gvYXJtL3RlZS9vcHRlZS5jCkBAIC0xNzIsNiArMTcyLDE2IEBAIHN0YXRpYyBib29sIG9wdGVl
X3Byb2JlKHZvaWQpCiAgICAgICAgIHJldHVybiBmYWxzZTsKICAgICB9CiAKKyAgICAvKgorICAg
ICAqIFdvcmthcm91bmQ6IE9QLVRFRSAzLjUgaGF2ZSBubyB3YXkgdG8gdGVsbCBpZiBpdCBpcyBi
dWlsZCB3aXRoCisgICAgICogdmlydHVhbGl6YXRpb24gc3VwcG9ydC4gQnV0IHdlIGNhbiBwcm9i
ZSBmb3IgT1BURUVfU01DX1ZNX0RFU1RST1lFRAorICAgICAqIGNhbGwuIEl0IHdpbGwgcmV0dXJu
IE9QVEVFX1NNQ19SRVRVUk5fVU5LTk9XTl9GVU5DVElPTiBpZgorICAgICAqIE9QLVRFRSBoYXZl
IG5vIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgZW5hYmxlZC4KKyAgICAgKi8KKyAgICBhcm1fc21j
Y2Nfc21jKE9QVEVFX1NNQ19WTV9ERVNUUk9ZRUQsIDAsIDAsIDAsIDAsIDAsIDAsIDAsICZyZXNw
KTsKKyAgICBpZiAoIHJlc3AuYTAgPT0gT1BURUVfU01DX1JFVFVSTl9VTktOT1dOX0ZVTkNUSU9O
ICkKKyAgICAgICAgcmV0dXJuIGZhbHNlOworCiAgICAgcmV0dXJuIHRydWU7CiB9CiAKLS0gCjIu
MjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
