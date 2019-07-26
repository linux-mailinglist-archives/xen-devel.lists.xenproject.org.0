Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2D276B13
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:07:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0r8-0001ol-WD; Fri, 26 Jul 2019 14:05:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcV=VX=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hr0r7-0001of-CQ
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:05:57 +0000
X-Inumbo-ID: 7c5da76f-afae-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::61f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c5da76f-afae-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1wpE23eeDyKFCaRwXTgIIt42gUG7YFK9OqVla258wx7vRhcFbh45LRAurWB5KVSn9W8JlvFswOj+OE0mg38tQKzmdOZjFSJ2wMVWm9Q4ykKh4OAmcUCvdnH5SgWGyyE7NU4SMeUBOhAIhsM6IwzJdMt3AQttFxnUEfH4yuiMfcm0OTjCeXpADhbYzd2v3L2bwEY8PdkpmYjc5AH3ySRilytL6GuEa54ZmRcHu63qhfNELU6bxGXZtnK3a7u5XjTWq2Jd6RQh6Z2um9hvo4jTQg7uE118ykFZx1k22/+fSbJueVmHg2ABT/vrp9iKaRUNTTEHbj6ozLc2cdjVeL1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O93MJu5U+Nim32bDVEwhMQNG+iWHugbtSSi7/zzfNiA=;
 b=YwJgEkSIZ1gAJw+8vGCPdYX5Mwx/nwQqG3VXQCmRuyiT4Y6N3tsV5v62vbWRAZeSyTWg41rjXkuhR9Usz4U8sWZFoDDCzCvRHUr+zEai6500ZToJ3pfLGYgtgHznUoY7XvUTKNhfPanrE/gbMlZaQXVo7THUSq4hqtzAOo+gO7Gnw0wSVNeZ8Q74sd1vgx/FzmWsFGMw4ych4orTb6j6B8gkppLw4HMst2YpZFZdD5G7iZ5402DXOe7vmkfsLnAmK7LMwMGSzJ6jU0GuqbmgdFNnsh+RgwT0tE20AkKyKPceIH9CXQAZXtm0v2VjtgmB0fyhrTTqnAsKx0NdWaLIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=epam.com;dmarc=pass action=none header.from=epam.com;dkim=pass
 header.d=epam.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O93MJu5U+Nim32bDVEwhMQNG+iWHugbtSSi7/zzfNiA=;
 b=RqK5OYKH94qCcLoBxBgcx+8bUvYiKzErM9ntnoO/4RhLPXOYxiNqAUnV8Hbt3LzsG4zT4nEZ6fhxrZ+E+Mwp15Lkl2Wdbof+TUYB08vCO38P/tn7BSPv4CGHr5HebGjSPXxcCbSfKdGwjErpk4ZSpl12C5SgZ0godCq7TpvlQu72YkrKc0HJ09DVoOyB3592Jn0BbckuECrm2WsdcDLMcEOzgNASV2+pZF1x7p0w2jN5yVjs8z4iUSY9RscD3NK1R7OYjpPVMyBcPKRi9TpcG7E2+kcdU0zJqn6L+WSe5GNLjCaSfM0jZi5LYlIwP8fedGjd3rdDm0q6YNUIpIyYJA==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6065.eurprd03.prod.outlook.com (10.255.29.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 14:05:54 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::e900:5b3d:d83:969c%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 14:05:54 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 3/7] xen/arm: Rework psr_mode_is_32bit()
Thread-Index: AQHVQZ6ijXP3wTXU302IoyTKXwcds6bc2NmAgAAKkQCAAA/SAA==
Date: Fri, 26 Jul 2019 14:05:54 +0000
Message-ID: <87ef2cj3gd.fsf@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-4-julien.grall@arm.com> <87o91hht9c.fsf@epam.com>
 <89065edf-d75c-81dd-0249-a5554feeab51@arm.com>
In-Reply-To: <89065edf-d75c-81dd-0249-a5554feeab51@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 187e2434-726e-46e2-365b-08d711d2601b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6065; 
x-ms-traffictypediagnostic: AM0PR03MB6065:|AM0PR03MB6065:
x-microsoft-antispam-prvs: <AM0PR03MB606528728626A798024CB3F9E6C00@AM0PR03MB6065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(199004)(189003)(5660300002)(71190400001)(8936002)(229853002)(91956017)(26005)(86362001)(6512007)(476003)(66476007)(66556008)(478600001)(6916009)(71200400001)(76116006)(2906002)(446003)(55236004)(80792005)(25786009)(64756008)(4326008)(6436002)(36756003)(8676002)(81156014)(81166006)(66066001)(6246003)(6116002)(99286004)(14444005)(6486002)(14454004)(256004)(53936002)(7736002)(305945005)(68736007)(3846002)(54906003)(486006)(186003)(76176011)(6506007)(66946007)(66446008)(102836004)(2616005)(11346002)(53546011)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6065;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mDWYCxfQDlHq0vyewJYxmqtI6BYVzKjr7NRhcDUhIc8xSDIoZLd1tVB/6RdUASjIfJl8o74+/xF3Y99PIL3Cw3qpwS+/xmqBQxYmwLLgAE9iZo6jJf7BSVjdVbmzw11E95IoY7tD4cakwQHUnvVZc+FfHMdGeQn9wGo1F5JN0wGm0kIeaxXS+txLc1FuiaK1qS/QfKKM1pDhp0Gyk4FTk+ylnOfJQmESBfYhL3j2KqtBqF7ihqpsuYsPbaDrBGv4SAQvd57Khw0HaRYzTLniEPqcZrK8qCF7kc6wLcknpCcf9IC26l8Syawoa7sBqwKkL8RD0/KWgz7kBk6nWWXYL4KLe4dpRR7VrpHowql51bC2XGjZM6q/uFEJ014d6LMT9+vgkf2m2Ywt4sBIdRPbYsRxmCPkipy3g5irN5E2iS0=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187e2434-726e-46e2-365b-08d711d2601b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 14:05:54.8055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6065
Subject: Re: [Xen-devel] [PATCH 3/7] xen/arm: Rework psr_mode_is_32bit()
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

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMjYvMDcvMjAxOSAxMzozMSwgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Cj4+PiBw
c3JfbW9kZV9pc18zMmJpdCgpIHByb3RvdHlwZSBkb2VzIG5vdCBtYXRjaCB0aGUgcmVzdCBvZiB0
aGUgaGVscGVycyBmb3IKPj4+IHRoZSBwcm9jZXNzIHN0YXRlLiBMb29raW5nIGF0IHRoZSBjYWxs
ZXJzLCBtb3N0IG9mIHRoZW0gd2lsbCBhY2Nlc3MKPj4+IHN0cnVjdCBjcHVfdXNlcl9yZWdzIGp1
c3QgZm9yIGNhbGxpbmcgcHNyX21vZGVfaXNfMzJiaXQoKS4KPj4+Cj4+PiBUaGUgbWFjcm8gaXMg
bm93IHJld29ya2VkIHRvIHRha2UgYSBzdHJ1Y3QgY3B1X3VzZXJfcmVncyBpbiBwYXJhbWV0ZXIu
Cj4+PiBBdCB0aGUgc2FtZSB0aW1lIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHN3aXRjaCB0byBh
IHN0YXRpYyBpbmxpbmUKPj4+IGhlbHBlci4KPj4gSSdtIGEgYml0IGNvbmNlcm5lZCBhYm91dCBu
YW1pbmcgbm93LiBBcyBwc3JfbW9kZV9pc18zMmJpdCgpIGlzIG5vdyBoYXZlCj4+IG5vIHBzciBw
YXJhbWV0ZXIsIGFuZCBBUk0gQVJNIHVzZXMgdGVybSAic3RhdGUiIGluc3RlYWQgb2YgIm1vZGUi
LCBtYXliZQo+PiBpdCBpcyB3b3J0aCB0byByZW5hbWUgdGhpcyBoZWxwZXIgdG8gc29tZXRoaW5n
IGxpa2UgImlzXzMyYml0X3N0YXRlIj8KPgo+IEl0IHJlYWxseSBkZXBlbmRzIGhvdyB5b3Ugc2Vl
IGl0LiBUaGUgYml0IGlzIHBhcnQgb2YgdGhlICJtb2RlIiBmaWVsZCwKPiBzbyB0ZWNobmljYWxs
eSB3ZSBhcmUgY2hlY2tpbmcgd2hldGhlciB0aGUgbW9kZSBjb3JyZXNwb25kcyB0byBhCj4gMzIt
Yml0IG9uZSBvciBub3QuIFRoaXMgaXMgYWxzbyBpbmxpbmUgd2l0aCB0aGUgcmVzdCBvZiB0aGUg
aGVscGVycwo+IHdpdGhpbiB0aGlzIGhlYWRlci4KPgo+IEkgd291bGQgYmUgd2lsbGluZyB0byBj
b25zaWRlciByZW5hbWluZyB0aGUgaGVscGVyIHRvIHJlZ3NfbW9kZV9pc18zMmJpdCgpLgpJJ20g
ZmluZSB3aXRoIHRoaXMgbmFtZS4KCi0tIApWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
