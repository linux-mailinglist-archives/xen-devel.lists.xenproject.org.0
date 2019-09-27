Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD9C0471
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoWU-0007Yr-PF; Fri, 27 Sep 2019 11:34:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myEs=XW=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iDoWT-0007Ym-3S
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:34:53 +0000
X-Inumbo-ID: d14335ce-e11a-11e9-9675-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.49]) by localhost (Halon) with ESMTPS
 id d14335ce-e11a-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 11:34:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RN4lTm8QMgCNIb7S7ZpG2gBh980gkzcXSD1gFb6mheweVJvMX48TI28XV1OYrIbb4LhEYPF/VebtgkXKDl4yOd7V+up66f/8DbEsKwCISGumH5J9F1ZrxMJ9fOv9HnDHIyT0d1BwUuTlXQbfC4cdLYiSdrjqfVQW7V7Z6oV3rs1fpwQZWjfUPkPUvQfMtjArjRrmbY2pRY2dmVveL9SE7bxKAyNwqu7jaoe3cP4Uowe54r3mXfBnu4Vjqtib6ZMtmRDXtPH5ZmqYmesdHrdF2rQ5UKD/UK3+ZBU6vzJhGqRt4zHfKnYVVP45ecTJJeN3kVCvPHT5ZEszKNOwWmaXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI1PrZI+/DNaI7edEnigVi/MM8I8OeB3T54IIzRuQLU=;
 b=Uvq4t8LBXW/LgQU4NPZC941RPoWFxQLFWdSSYC1C17yj3vIwi7fw4+788izUJdtHD9pKyTey2NlQq61ttha5iAkwqWEEmxRqjMXf4eocRQVBlUf4THI5mQME+MHxz7iAd7QqQKnX2Wrm1VcKkwSfUXXCPJVc+87Mo8vOkMltB9brS5JBt/kaNGEBLV3fdgBiwhk8P2IB13enwSEelZ6B7Uu+n7sMbuho1yXXL5eLSfKXCT0hkyBs61hq+ye0CZH5YJKGOf98ZCYBUPoEbjZuQiwAEvkGmK1KU9fpPqUfdfxRjh8IhTUu6bkdAfvwhkoErEqD3jMXLVu3yktg9syQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI1PrZI+/DNaI7edEnigVi/MM8I8OeB3T54IIzRuQLU=;
 b=VNub4LIGwP/iVztTONP6lR+a2G/TVqMAJBd7OQxTfvJwH3KA67qRJLEz1TmerkFPdv9eVaNFMFqnc/fRTsS3lC3SOIGMhpuDQSCJpv+X8t2/EVXHnA6ePKnZH7eIHx1YmCxvxjUBVjmDR4AKLqhaQQFNr3pduyrMUubitTdazNU=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB4276.eurprd03.prod.outlook.com (20.176.214.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Fri, 27 Sep 2019 11:34:49 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Fri, 27 Sep 2019
 11:34:49 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH RFC for-4.13 01/10] xen/arm64: entry: Introduce a macro
 to generate guest vector and use it
Thread-Index: AQHVdJmTOhlxjUvhM0qBqTuTWi5ee6c/Ze8A
Date: Fri, 27 Sep 2019 11:34:49 +0000
Message-ID: <874l0y9dlz.fsf@epam.com>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-2-julien.grall@arm.com>
In-Reply-To: <20190926183808.11630-2-julien.grall@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34867103-207c-413f-9de8-08d7433eb4bb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR03MB4276; 
x-ms-traffictypediagnostic: AM0PR03MB4276:|AM0PR03MB4276:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB4276D9AEA4B4CCB475778F76E6810@AM0PR03MB4276.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(186003)(71200400001)(71190400001)(305945005)(4326008)(76176011)(6512007)(6506007)(2616005)(476003)(5660300002)(6436002)(6486002)(55236004)(14444005)(6116002)(81156014)(256004)(486006)(25786009)(36756003)(107886003)(99286004)(54906003)(14454004)(102836004)(3846002)(76116006)(80792005)(8676002)(81166006)(66066001)(66946007)(86362001)(66556008)(66476007)(66446008)(446003)(7736002)(2906002)(6246003)(26005)(6916009)(11346002)(8936002)(229853002)(478600001)(64756008)(316002)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4276;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XC+pa+e5baVQc+z2zsV/66mxwl6TFe3t4Y58J93KkZ64xKHkEing85uZBMLAzy0+BIEFLecg/Ve7ieMvHe3Ipo7uZVLNexQ2nJE3x9ibmsGPZnPnuAeAt03C5rOfii1vNEQTEXAkFeda+n9PkD8id8b7Dmp3DDXXdlKOv5nQLeni8d7t614n97otGS83a41NeeLVsWvdLmPCdwGu47sS+b8uu9Ra6mXv7GT1uBDpJcOmsHRp7FXHBkPdb1rJh6PSGzPjl4hrlX/JZ+uUZpWOf1U4Xd/AZ2Fv79OkuOXCFpEBJzsTvjy8dk50IlHNUYUrjVvkGaxeoSaSWDBjFsdXaLZLOLL8q0RPJDtoDp7y2SeP9m8SQ+4KmhOL3vB9/DDswhSIXBxiBlmdtXb+wyn3ILMkmycO+q9YyW3fp2JzXU8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34867103-207c-413f-9de8-08d7433eb4bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 11:34:49.4552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEKOVeNW3z4bi2gfpxgAaolKi5N+7yedCUBvya3CulRwnvvx/AxapGc23GnAbfKzQevAlmHlJb84ZcLAFmXTE+uU+hGD04FMZ2q6KXU4HY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4276
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 01/10] xen/arm64: entry:
 Introduce a macro to generate guest vector and use it
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

CkhlbGxvIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE1vc3Qgb2YgdGhlIGd1ZXN0
IHZlY3RvcnMgYXJlIHVzaW5nIHRoZSBzYW1lIHBhdHRlcm4uIFRoaXMgbWFrZXMgZmFpcmx5Cj4g
dGVkaW91cyB0byBhbHRlciB0aGUgcGF0dGVybiBhbmQgcmlzayBpbnRyb2R1Y2luZyBtaXN0YWtl
cyB3aGVuIHVwZGF0aW5nCj4gZWFjaCBwYXRoLgo+Cj4gQSBuZXcgbWFjcm8gaXMgaW50cm9kdWNl
ZCB0byBnZW5lcmF0ZSB0aGUgZ3Vlc3QgdmVjdG9ycyBhbmQgbm93IHVzZSBpdAo+IGluIHRoZSBv
bmUgdGhhdCB1c2UgdGhlIG9wZW4tY29kZSB2ZXJzaW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBC
YWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KCi0tIApWb2xvZHlteXIgQmFiY2h1
ayBhdCBFUEFNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
