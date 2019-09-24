Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A4DBCBA9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:39:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmsL-0000QI-RS; Tue, 24 Sep 2019 15:37:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mc7A=XT=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1iCmsK-0000QD-KY
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:37:12 +0000
X-Inumbo-ID: 2cb93836-dee1-11e9-8628-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::606]) by localhost (Halon) with ESMTPS
 id 2cb93836-dee1-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 15:37:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVDh3iHn8lowYrcTTaRQtQn7ploki44JjP45RfkywmwgVovD88OtbH0SwAkHLWIBJ9RU90mtN4NhS/ldPSvdOOFXpAuD6yqJAI6bXHiOwDbyrjT2c3fOry8VtZELeyloQ9VlaWmk3ifiwzVW5AbVebW7Um5hWUki4tzCCmzNR+jvsjiJfbz0CFcAi6VC15DSBaRyTPTgWfjarZzvfv632h0YzsV4gbzix/Qw9K85u35w0JI3JLVUdX+4S8VAAxUsCRLi1vyj9plT4CW9+YaSZAwk/00l4iEw74FCWqtPIqkNoYoq9tUePrG7nLpb7SzOvtMrT1ICxHOL98zdJax/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WMLXSiJZsR/83eDg1Rt31A5Lx/Eyr70b5XoEy1/rRU=;
 b=iJSXF+sqiIPKAnOJz/Vb6OszHDsKibUEPYX1nLE/KXVR+BXDxKWOCaZ4mUx+7yigIZRRAD8u4MblWTiWIJZ37CHKH0cdN146kwMnVO1RGKN4uRwvGp7HRpsLKWXeME3y3XZuXzEQ/CGnjXKPHx3iQZhucImFRNQs7qQikbjnyMvtQb7SE3Pvd2gT6lClSIYvm4TA9+TKSy6ZZ6II1+Cji9bAvcVnR60hSRdqRFidT3Q96mw5/9LEV+y0anfHqjsOp4aDkEuFTcWWYhbDTxN4KnEhNk3gwPSsz2DSJAzGkmfL95LiVl8aekQ9cRrCXe28rQushh8yUnQPvMYD3OP8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WMLXSiJZsR/83eDg1Rt31A5Lx/Eyr70b5XoEy1/rRU=;
 b=SVwQpMenKPjei+kNFHdnyF/PFN+jzbVDqETSpL0zqvcIX0BivZTHgm9WsF0W4laYQ+j2qmDQJhK5tVc98MsZD1e2TLAK4AGRqMUPfqg2Sg9uh9ktnW5VmsPKxvei62+Hp4jrjiB7uhnnOXxGiyRGqpUWC2coVWQ9pZ8R35p37s4=
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com (20.177.36.81) by
 AM6PR03MB5396.eurprd03.prod.outlook.com (10.255.99.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 15:37:10 +0000
Received: from AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17]) by AM6PR03MB4150.eurprd03.prod.outlook.com
 ([fe80::3523:ad12:6e5d:5f17%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:37:09 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH for-4.13 v2 2/2] docs: Replace all instance of ARM by Arm
Thread-Index: AQHVcuVPY9Nw118P80OwH+dGnLK0cqc66tKAgAAI24CAAAJigA==
Date: Tue, 24 Sep 2019 15:37:09 +0000
Message-ID: <875zlhaeoq.fsf@epam.com>
References: <20190924143515.8810-1-julien.grall@arm.com>
 <20190924143515.8810-3-julien.grall@arm.com> <877e5xagjs.fsf@epam.com>
 <ca85e985-e40e-e701-6fc4-efc541f2f00f@arm.com>
In-Reply-To: <ca85e985-e40e-e701-6fc4-efc541f2f00f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7e17240-5226-4b00-3247-08d741051043
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR03MB5396; 
x-ms-traffictypediagnostic: AM6PR03MB5396:|AM6PR03MB5396:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR03MB5396F649E58ADF7FC9A3BD8DE6840@AM6PR03MB5396.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(189003)(199004)(66556008)(80792005)(81156014)(8676002)(36756003)(7736002)(229853002)(4326008)(5660300002)(91956017)(64756008)(8936002)(6486002)(6246003)(66446008)(4744005)(478600001)(76116006)(66946007)(316002)(6436002)(54906003)(6512007)(81166006)(476003)(14454004)(25786009)(7416002)(26005)(2616005)(186003)(66476007)(71190400001)(305945005)(71200400001)(55236004)(486006)(102836004)(6916009)(99286004)(6116002)(446003)(2906002)(86362001)(11346002)(256004)(6506007)(53546011)(66066001)(76176011)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB5396;
 H:AM6PR03MB4150.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o63C0OvDWjcCFv/FEBVAAC4QE+6AWG8jc33ibuBqMzU2yHZObwe2BgKZ+EyGKD2OGvebSI3GIfaZxjQKIQMFlYy+z98YEso2NVOIwldtilg+6AQKYzLKeDVsnKHsy3b0mFSfCmkj2hPsucGLOGg6nD5morPqIvS47SOdL/2BS4EH7gdtkqxeoSYCAgLFud2jiDba2XFV+iUqX/pE1/Fs/asm03PkKMkJnYbNhD8953HbK7ywprB5ATTWqmybhtvgSGRJoiZLMy7BypJHuIG6AGpDz0OadxGJ28nGmJwKaKV7XoB9hTZCHbJHGX+FLJe3UuJ0Ar7NQLtnxAOwqJscMjLEZBmYPWXElBFUSETV6DIgT29UxAU/YefX4Ht6eT8aiq4e0QwGPabE5Ty2KgU8Ulq+qW9vc2gU6o9EWmwNnS8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e17240-5226-4b00-3247-08d741051043
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:37:09.8737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjhB3sj0aQR6JW2lmpXZlb6kt/6jH7o6ajq4IkiYCBJPD/lcapU9gDisq+WfPxEZk8NSt0hGkksLmEWMc65YCm6Jr/tg6TQqMKUZU6qBWL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5396
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/2] docs: Replace all instance
 of ARM by Arm
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gOS8yNC8xOSAzOjU2IFBNLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4KPj4+IFRoZSBk
b2N1bWVudGF0aW9uIGlzIHVzaW5nIGEgbWl4IG9mIEFSTSAob2xkKSBhbmQgQXJtIChuZXcpLiBU
byBzdGF5Cj4+PiBjb25zaXN0ZW50LCB1c2Ugb25seSB0aGUgbmV3IG5hbWUuCj4+Pgo+PiBIb25l
c3RseSwgdGhpcyByZW5hbWUgY29uZnVzZXMgbWUuIEkgdGhpbmssIHRoaXMgY29tbWl0IGlzIHRo
ZSBnb29kCj4+IHBsYWNlIHRvIGNsYXJpZnkgYSBjb3VwbGUgb2YgcXVlc3Rpb25zLgo+Cj4gSXQg
ZGlkIGNvbmZ1c2UgYSBsb3Qgd2hlbiB0aGUgcmVuYW1lIHdhcyBtYWRlIGJ5IEFybS4uLiBXaGF0
IEkgd2FudCB0bwo+IGF2b2lkIGlzIG1peGluZyB0aGUgYm90aCBpbiB0aGUgZG9jdW1lbnRhdGlv
biBhcyB0aGlzIG1ha2VzIHRoaW5ncwo+IG1vcmUgZGlmZmljdWx0IHRvIGZvbGxvdy4KPgo+IFRo
ZXJlIGFyZSBwcm9iYWJseSBtb3JlIHRvIHRpZHkgdXAsIGJ1dCB0aGVuIHlvdSBoYXZlIHRvIHN0
YXJ0IHNvbWV3aGVyZS4KClRoYW5rIHlvdSBmb3IgZXhwbGFuYXRpb24uIEp1c3QgaW4gY2FzZTog
SSBoYXZlIG5vdGhpbmcgYWdhaW5zdCB0aGlzCnBhcnRpY3VsYXIgcGF0Y2guIEkganVzdCB3YW50
ZWQgdG8gdW5kZXJzdGFuZCBob3cgdG8gdXNlIHRoaXMgbmFtZXMKY29ycmVjdGx5LgoKLS0KVm9s
b2R5bXlyIEJhYmNodWsgYXQgRVBBTQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
