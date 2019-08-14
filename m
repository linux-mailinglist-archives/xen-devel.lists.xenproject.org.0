Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8888D200
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 13:20:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxrIU-0002hf-S9; Wed, 14 Aug 2019 11:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nXkg=WK=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hxrIT-0002hX-7m
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 11:18:29 +0000
X-Inumbo-ID: 3cfacf10-be85-11e9-9944-5f2197a8c645
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cfacf10-be85-11e9-9944-5f2197a8c645;
 Wed, 14 Aug 2019 11:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+2eu+CCxve2AbmK5wTbBTQPi8Y8g1Xryodvc1PNIlCPvz0NbkNISsa3e6MWof+WTm2I3P8MU+/H55/Wc3VUJNlWyyVdVojFD/c5EnBxUh9ZSn823LJYV5b10AhMB6RtxUAvyU86Ky6sSZ3gfjSp2daSUAwxzZ6JL3hh//D7whs3OWCo6KEiCEVgqwMNPwjwHFlZpMAfhpoH6jGLeTPcCbUhueYHnPY+hM7ojgq/E7u3To5l0JrQLFqLIKdhk4Se0YJsP3IK24NSN0hgVDkHrMLcnLEWAAfPcY66vX/pg9ji6e6YjAfHXe8Spp6mpd4bJeqTjnU2hU+EKPwFOTKAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkmLbQghn3Gyi7LBDy/diK15uI5QYDWbp5MZQWgUNIM=;
 b=IL62nMA9YtEulbi26ll7zXVtMhf0ZGep9E2Wy3Xa/ErQOE3Vsd8mfrhCO34b5h39NhHne9zf/XPaK0l2trcOc0P7+GiGo4+s/MyOWsCcYgbxf4Oakdu0hAJ9kXBZd7T+LImrqlZTD5Bpapk86P6cOvxZ7EYXCbWoJBBPRBGKNQ3YK3jlBceX4Ck/8vrcxlZDW6oiwgqqJu3jCtwptXdbgefH9fS2NmLw6PlnxdF7rLQ1K6AS8w3T0SLE4kGYxBh5y4MgaAIElaQcnWke2m9gstOepqUGzAr9wGqx05P/QnOn+13EL5oO5kKHatqk0waKeRaodsQJ7CCgKUvlcipaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkmLbQghn3Gyi7LBDy/diK15uI5QYDWbp5MZQWgUNIM=;
 b=sPsZts2FcnwxCdq80CymHdgN05Cmmm/ag+TR4xg9e671yTzLea8ATak8ZaoztZl58KtJ5DnIhD+GbrNA9Z6372UlDGXPkeKJB1j81v98AjqinCMfR0J1L6iIJCsptmhQuyHTTgvpM3VysEMBxbMBjHNkJLvABc733HRhupjmxUBoQLkLtyxyuq3W6bfh/sXezRz7Tw9q3+hLjerL2ky/ujoJdDg81jfGC1pqZCMfq1WWcIgl2cxNt+PomJM/0jhNevbJrAUWNw6ZvLODVY2EF9BtTZ6H+I3LeDlGvBnwQ8MDh/y0czQxPpUsk5LNrKP1nuh5+Z6eamYD8Ge3bf7opA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4163.eurprd03.prod.outlook.com (20.177.41.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Wed, 14 Aug 2019 11:18:24 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 11:18:24 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH] xen/arm: traps: Remove all zero padding before
 PRIregister format
Thread-Index: AQHVUoO4Ga3AElWC5UmG7XdiMzD9U6b6fvCA
Date: Wed, 14 Aug 2019 11:18:24 +0000
Message-ID: <877e7ggfls.fsf@epam.com>
References: <20190814093607.22927-1-julien.grall@arm.com>
In-Reply-To: <20190814093607.22927-1-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7590761c-c78d-4524-2073-08d720a91fa1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4163; 
x-ms-traffictypediagnostic: AM0PR03MB4163:|AM0PR03MB4163:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB41637A8D1A8E734520FFD9A2E6AD0@AM0PR03MB4163.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(486006)(478600001)(66556008)(99286004)(25786009)(476003)(54906003)(256004)(2616005)(6512007)(11346002)(4326008)(316002)(36756003)(6486002)(6436002)(71200400001)(71190400001)(446003)(2906002)(3846002)(6116002)(229853002)(8936002)(66066001)(6916009)(80792005)(26005)(6246003)(102836004)(186003)(6506007)(81156014)(76116006)(305945005)(76176011)(5660300002)(55236004)(53936002)(107886003)(7736002)(91956017)(8676002)(14454004)(66446008)(66946007)(66476007)(64756008)(81166006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4163;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h9Qr/nwjYn7b2H9wfLPhKWhAiU+eyfAHPbMzTo8s47FbkiRo6hxAJ0oOA3R3tWdf1PaOgdDQ50sudvc4LFwzRv+jPUMl+YCHh284is4GXF3ErDC0PZdb99pUZr5UDPsJoN/PV/KMd7QKiUsfPbyCWxz6H68t7t4Es7PhAqP/bcaTzYPsFjTXjdEVaJ4EtHxWz3+Vlvzywx+4R8T6Ot0pYBwaiN9XUhldLdZiyclq9X/B/uShYa7hftSbAHpCemMb515v0u054HM9XOFpMlGvMbvaYjQ1rlmUw8qIoFHpRR0duhbE5ozbns+tanAI9oab53c1D6FAgHsyy+W6dgAbSGcoXF7zCwbHGmQt4/X8/ABEQSZUEXXMDLHtEi2FrdwogQmY6rw0+SoQSByjjAEuo9SRYpXe2jWFVq5x1ID5wEg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7590761c-c78d-4524-2073-08d720a91fa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 11:18:24.7012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00nhCyaINtAUbcPhAALoKIGknaHUKKtqUtlnucDelTvlC+u/9V9fIVPpoaBB8gNO3rmYFsX18WqEArM4zP4a3QtmZORC1aVBA8luL4ZFTmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4163
Subject: Re: [Xen-devel] [PATCH] xen/arm: traps: Remove all zero padding
 before PRIregister format
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

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IENvbW1pdCBhZjE1NmZmMDg1ICJ4
ZW4vYXJtOiB0eXBlczogU3BlY2lmeSB0aGUgemVybyBwYWRkaW5nIGluIHRoZQo+IGRlZmluaXRp
b24gb2YgUFJJcmVnaXN0ZXIiIG1vdmVkIHRoZSB6ZXJvIHBhZGRpbmcgd2l0aGluIHRoZSBkZWZp
bml0aW9uCj4gb2YgUFJJcmVnaXN0ZXIuCj4KPiBIb3dldmVyLCBzb21lIG9mIHRoZSB1c2VycyBz
dGlsbCBoYWQgemVybyBwYWRkaW5nIGJlZm9yZSB3aGljaCByZXN1bHQKPiB0byBwcmludCB0ZW5z
IG9mIHplcm8gd2hlbiBkdW1waW5nIHRoZSBDUFUgc3RhdGUuCj4KPiBUbyBwcmV2ZW50IHRoaXMs
IHJlbW92ZSB0aGUgbGFzdCB1c2VycyBvZiB6ZXJvIHBhZGRpbmcgYmVmb3JlCj4gUFJJcmVnaXN0
ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15ci5iYWJjaHVrQGVwYW0u
Y29tPgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3RyYXBzLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gaW5kZXggZjA2MmFl
NmY2YS4uYTNiOTYxYmQwNiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ICsr
KyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gQEAgLTkzOCw3ICs5MzgsNyBAQCBzdGF0aWMgdm9p
ZCBfc2hvd19yZWdpc3RlcnMoY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gICAg
ICBwcmludGsoIiBUVEJSMF9FTDI6ICUwMTYiUFJJeDY0IlxuIiwgUkVBRF9TWVNSRUc2NChUVEJS
MF9FTDIpKTsKPiAgICAgIHByaW50aygiXG4iKTsKPiAgICAgIHByaW50aygiICAgRVNSX0VMMjog
JTA4IlBSSXgzMiJcbiIsIHJlZ3MtPmhzcik7Cj4gLSAgICBwcmludGsoIiBIUEZBUl9FTDI6ICUw
MTYiUFJJcmVnaXN0ZXIiXG4iLCBSRUFEX1NZU1JFRyhIUEZBUl9FTDIpKTsKPiArICAgIHByaW50
aygiIEhQRkFSX0VMMjogJSJQUklyZWdpc3RlciJcbiIsIFJFQURfU1lTUkVHKEhQRkFSX0VMMikp
Owo+ICAKPiAgI2lmZGVmIENPTkZJR19BUk1fMzIKPiAgICAgIHByaW50aygiICAgICBIREZBUjog
JTA4IlBSSXgzMiJcbiIsIFJFQURfQ1AzMihIREZBUikpOwo+IEBAIC0xNzU5LDcgKzE3NTksNyBA
QCB2b2lkIGR1bXBfZ3Vlc3RfczFfd2FsayhzdHJ1Y3QgZG9tYWluICpkLCB2YWRkcl90IGFkZHIp
Cj4gICAgICBtZm4gPSBnZm5fdG9fbWZuKGQsIGdhZGRyX3RvX2dmbih0dGJyMCkpOwo+ICAKPiAg
ICAgIHByaW50aygiZG9tJWQgVkEgMHglMDgiUFJJdmFkZHIiXG4iLCBkLT5kb21haW5faWQsIGFk
ZHIpOwo+IC0gICAgcHJpbnRrKCIgICAgVFRCQ1I6IDB4JTA4IlBSSXJlZ2lzdGVyIlxuIiwgdHRi
Y3IpOwo+ICsgICAgcHJpbnRrKCIgICAgVFRCQ1I6IDB4JSJQUklyZWdpc3RlciJcbiIsIHR0YmNy
KTsKPiAgICAgIHByaW50aygiICAgIFRUQlIwOiAweCUwMTYiUFJJeDY0IiA9IDB4JSJQUklwYWRk
ciJcbiIsCj4gICAgICAgICAgICAgdHRicjAsIG1mbl90b19tYWRkcihtZm4pKTsKCgotLSAKVm9s
b2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
