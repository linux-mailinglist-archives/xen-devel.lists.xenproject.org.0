Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5CC04B9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDonb-0001zb-PT; Fri, 27 Sep 2019 11:52:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDonZ-0001zO-Ug
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:52:33 +0000
X-Inumbo-ID: 4a1f2122-e11d-11e9-bf31-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::618]) by localhost (Halon) with ESMTPS
 id 4a1f2122-e11d-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 11:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqIDVgCcoc2uEhweRAzhfIuS+oPm1Lktr4U5CGbKUDEzZSiCdAjFzAFyisiguK2W6ExHaSy4UhI+ws4ARCSSCdU6ofl7DKv2POzhXwvfugUX7bRY/ONRzr6jTbjTOYndKJ2Z/bejYYf2rw7B8dxS6ITjFzcqPmjpTFKwr71ra6zrsAESoveyTwEV6u3ileBkQs3MRzNlhPFb80qj+A7ifKFvz1M7WeYrbiOtr+htNmCo4JAszcnoWJ0oSw6eZZE4cEToMyXrjmXHI7oAALTDTo6e4VrMn8++wzGicEk1sm3gss1UGKchfb/YIMF2acGMCJyHyP74/MAEim37QuCMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05Iu/RECcueJe7aAKqssiGqHRRkwkD2raUEd70FNwC4=;
 b=U8t5W9a26Cn4uOl4GA4B1DKFBW02J91IAap+TjA49+Zik0K/eGo2uvCtWrw2IbZ4XzIcjaUunQMy0QYqjIfH+D8UuAx3eNvXpgkoZTmX4azPjdUszpLNJ2txGc860tWzbI4t9mnUdVUbDks5TJzOXMxi9j6/jFgMd2vGySEN+wxupdKXZJE05L6MID8FtA5eugWM7Rayb/Td9UFvgrqVFVqnGZQmZnSxfADGaedHPJi7RuM0pXfdUFsjQW6WuzOZrgkys1vNwXoW8uERh4b8L6uQprIeBj6ZCiNkuXGVN45rdt6MiCFf9ysN5TAlZGduDJ+exHpKjrmbfJem6s9Rgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05Iu/RECcueJe7aAKqssiGqHRRkwkD2raUEd70FNwC4=;
 b=vNDf7JazeJ34ghaCkOsw0s7SJp34Up8OltvKVz9Vmc2VJpJp8yMYAoMxbItQYTCMGta3FJJAjCt3mkMXYtyCk1bjpJxkCNiEI6siM9qZQLoGQ88A0mP1Tmk8uAk9GSylqVm3fs/uF4Y80ObsdViVipNzcZgnZFWZKEP5bWTh3nU=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4066.eurprd03.prod.outlook.com (52.135.145.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 11:52:31 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 11:52:31 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 07/10] xen/arm: Allow insn.h to be called
 from assembly
Thread-Index: AQHVdJmUb6JbeQtE50WfKaLczja0p6c/auEA
Date: Fri, 27 Sep 2019 11:52:31 +0000
Message-ID: <87wodu7y81.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-8-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-8-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9808a80c-1603-454a-fd58-08d743412dee
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4066; 
x-ms-traffictypediagnostic: AM0PR03MB4066:|AM0PR03MB4066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB40668CA90812588D2BF86DC4E6810@AM0PR03MB4066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(199004)(189003)(186003)(71200400001)(486006)(76176011)(91956017)(55236004)(6506007)(25786009)(14454004)(36756003)(102836004)(2906002)(6916009)(66446008)(66066001)(66556008)(476003)(66476007)(80792005)(64756008)(11346002)(316002)(7736002)(446003)(305945005)(2616005)(99286004)(81156014)(8676002)(81166006)(26005)(6116002)(3846002)(54906003)(76116006)(478600001)(86362001)(66946007)(6436002)(6486002)(6246003)(107886003)(4326008)(6512007)(8936002)(5660300002)(71190400001)(256004)(229853002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4066;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0hsTjJ1LcJi7IDEdBDfsvpaCRR8itEfJlgPv0T3K060IEKtuBxciL+fk6crqkpQyWD2LGxty1MSWkHYvU6xYiziBkOdyOPD+ok2KDTzsgXsxilw+LmvSA2JwndjPkGKHEaeHB3leOeBt4E0xowArgo8k4WY9/0eqt0pR+zAHqvsf8h179S1dudBkc1b/t4bQdxK7GazlTtiFOGBgrUuX4y5qICfg9cGyvgtUIoDYH0STqzSG98q/1vq+/VXTKY33F/N1jVu+SRYQtK86U2InIxnFv/+sxWx83J7W5hL+77Td8J/NusxoxVHfx609tj7qe5HvPRrXINg0uv+hU9hbDS7ahCZ/aaydnB3pbXCLRkfS4bexk4kNGDeaIqBE+eA20XKhPVmxKDNDorwMpe703vYDdc9FhxtplITFF5Bf6Q8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9808a80c-1603-454a-fd58-08d743412dee
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 11:52:31.7667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwG4OIV5m19XDMLHqPm5fgEwSTb6L9Tc3tIQ9eK6+A0yi2b//WIV2dIcOWZqlRMY6fgBxWHCt+E7LXqUBWiV37FwbEdp+buOxOyu069qfPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4066
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 07/10] xen/arm: Allow insn.h to
 be called from assembly
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEEgZm9sbG93LXVwIHBhdGNoIHdpbGwgcmVxdWlyZSB0
byBpbmNsdWRlIGluc24uaCBmcm9tIGFzc2VtYmx5IGNvZGUuIFNvCj4gd2VlIG5lZWQgdG8gcHJv
dGVjdCBhbnkgQy1zcGVjaWZpYyBkZWZpbml0aW9uIHRvIGF2b2lkIGNvbXBpbGF0aW9uCj4gZXJy
b3Igd2hlbiB1c2VkIGluIGFzc2VtYmx5IGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNo
dWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNt
LWFybS9pbnNuLmggfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vaW5zbi5oCj4gaW5kZXggMTkyNzcyMTJlMS4uMDAzOTFmODNmOSAxMDA2NDQK
PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2luc24uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vaW5zbi5oCj4gQEAgLTEsOCArMSwxNCBAQAo+ICAjaWZuZGVmIF9fQVJDSF9BUk1fSU5T
Tgo+ICAjZGVmaW5lIF9fQVJDSF9BUk1fSU5TTgo+ICAKPiArI2lmbmRlZiBfX0FTU0VNQkxZX18K
PiArCj4gICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiAgCj4gKy8qCj4gKyAqIEF0IHRoZSBtb21l
bnQsIGFyY2gtc3BlY2lmaWMgaGVhZGVycyBjb250YWluIG9ubHkgZGVmaW5pdGlvbiBmb3IgQwo+
ICsgKiBjb2RlLgo+ICsgKi8KPiAgI2lmIGRlZmluZWQoQ09ORklHX0FSTV82NCkKPiAgIyBpbmNs
dWRlIDxhc20vYXJtNjQvaW5zbi5oPgo+ICAjZWxpZiBkZWZpbmVkKENPTkZJR19BUk1fMzIpCj4g
QEAgLTExLDYgKzE3LDggQEAKPiAgIyBlcnJvciAidW5rbm93biBBUk0gdmFyaWFudCIKPiAgI2Vu
ZGlmCj4gIAo+ICsjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCj4gKwo+ICAvKiBPbiBBUk0zMiw2
NCBpbnN0cnVjdGlvbnMgYXJlIGFsd2F5cyA0IGJ5dGVzIGxvbmcuICovCj4gICNkZWZpbmUgQVJD
SF9QQVRDSF9JTlNOX1NJWkUgNAoKCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
