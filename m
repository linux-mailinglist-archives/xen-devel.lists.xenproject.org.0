Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13299B14E7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 21:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8V2G-0007IG-A1; Thu, 12 Sep 2019 19:45:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONwL=XH=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1i8V2E-0007IB-TV
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 19:45:43 +0000
X-Inumbo-ID: e64df192-d595-11e9-95a5-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e64df192-d595-11e9-95a5-12813bfff9fa;
 Thu, 12 Sep 2019 19:45:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxIPApDPNgcGk0V8aloZzOF7adwGve1S0v5WmUUHDmGdNpPZARbsEla0OUMlP0Ee5ir6+p4aaquu08r0qg5kwsUbwpaR1ct+vUkQosPNL55ByBvhzOTtF7+qoKAplKKagWbezTU1ep/KdrSyfrSS9sNYCVi5jf8C075hk0FIfGMY4FLYl4t62n2YYThXaHKLEhAOdrM3oKwXb3FO3KFA7MiIziS3QRLckdk61Q6z2VUVB087rL2afSD3qhiam12VTeXbVF94IH77r53EQ9b+iDYnb99Y935mdzv9W4u0/eg8IJsQl8ryVoP2IsWTEGURYunl12qXSWKnDFpitMJuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMF8/yqAgNKK8lpp5ACJ2dT+nyeP7xGSo+hBj88AKfg=;
 b=DeRj11IuQelYuBH6qRgyq5Wzqof4FCUba3TSZkhIUqgAX14Uvl0OrIduiYf59bSE4ztZwAcQ6YHVG0kBmVur2L0E2RynspAIv/DQnqcSbsizqAbUP8V1jvcK+AqIiMIeLCA5TBvwxNzLlEOaMIiXQYBMJSuIpLVYljzY+2FAFkHwLN+Px7RJkojWCC3MzX9Xf8hfHjZq5RQTq0SyBdJ6vB3j7fbqkskFD+XDRYrHOujeRoguvjm1YL+blgk2QIwIhuvyZk0XiJ7UEh+nXm/n17n+lAbYapLcXBqkarwH7eHCWioqYRZ90YQGt6SxJ0off8OG/9WqsRk+jmydqPAmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMF8/yqAgNKK8lpp5ACJ2dT+nyeP7xGSo+hBj88AKfg=;
 b=cBMp14GAPaqYrCTRQFRjWWiEcCEGz68IlxPlf+ApuiqMNv/5hfCvXNUgsbaatSHY35ky2h3GNo/KlKrnqLiS9oZXqS6ZbLmd17Wu/N+iGF/G8tMXMMyhkXtp+60W0xGGoH5ARv+0KmoZZ+Whe1fB8lbUW3Y5tA/OFyqYfAnyFCI=
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.177.40.10) by
 AM0PR03MB6035.eurprd03.prod.outlook.com (10.255.30.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 19:45:37 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::71e3:834d:5708:5a0a%5]) with mapi id 15.20.2199.015; Thu, 12 Sep 2019
 19:45:37 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 1/5] xen/arm: optee: impose limit on shared buffer size
Thread-Index: AQHVWeNlCY0CqDi7zE2giEuaPhvOCqckA0sAgALr+QCAAZ6qAIAAA5eA
Date: Thu, 12 Sep 2019 19:45:37 +0000
Message-ID: <87h85hfgda.fsf@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-2-volodymyr_babchuk@epam.com>
 <45208af4-22b8-2870-f79d-a98960c4700d@arm.com> <87k1aefz3t.fsf@epam.com>
 <1cc4bd9c-44fc-0e6e-254c-c07f4b17ba4c@arm.com>
In-Reply-To: <1cc4bd9c-44fc-0e6e-254c-c07f4b17ba4c@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 064e8a02-9241-4313-7348-08d737b9c924
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB6035; 
x-ms-traffictypediagnostic: AM0PR03MB6035:|AM0PR03MB6035:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB603560CDB407B1A8B9D0C66EE6B00@AM0PR03MB6035.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(52084003)(199004)(189003)(76176011)(6486002)(2906002)(99286004)(25786009)(2616005)(186003)(256004)(4326008)(14444005)(80792005)(66446008)(66556008)(64756008)(66476007)(305945005)(476003)(91956017)(76116006)(6916009)(6436002)(6506007)(66946007)(55236004)(102836004)(53546011)(14454004)(36756003)(5660300002)(486006)(6116002)(7736002)(26005)(66066001)(478600001)(3846002)(53936002)(229853002)(11346002)(71200400001)(71190400001)(446003)(6512007)(8676002)(81156014)(81166006)(6246003)(316002)(86362001)(54906003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6035;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wZbd9uSXFeLhePF/YT+Js+z0WK3JtViZjWEJ8+0i7InKa57gWE5LlQwB74UwaO52iAQ6buDfahy7VSG/qk6EpPYsZwbnjLAeLRcMN1SIbRTh2F98sldZ0fomu933K3HUmq0KS+2LUiBn/WbT+I78h3APripzIbSJH1e8mVset4lsMHNk8vCyNISZHZ60OTjR2WXF9efbINC9a7U2gXkhLAtUQdzzW2rK2QzmDonGTNus05TDlFt1X7Z3UGWi1ZKUSQNzZlCmYspwc2gHUjKKFR6RzaWlyvdwkHKW4mLr2jI1dWBbXpY6WwvOpf2FxvYMlZPdLvJ9ki9KSnVO1YaH2yEzPSOQnnUUPYbG0beBhT44VBy5T5CL3F/BQImtm+7DkmnGJHjaWWDGpHd2NfHexDlFRjrrlVvJrJRsIQiymz8=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064e8a02-9241-4313-7348-08d737b9c924
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 19:45:37.7732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+cz86u+RPWtGHqF0BJTEd9PDb9RCU3mblfg6l7wWPavpmfAPFHWtSNmpRRhKRbih0YdaylwEjKc43OlpIgwLAbPFqFeTCr/s9Z8MgosIy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6035
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

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9u
IDkvMTEvMTkgNzo0OCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Cj4+IEp1bGllbiBH
cmFsbCB3cml0ZXM6Cj4+Cj4+PiBIaSBWb2xvZHlteXIsCj4+Pgo+Pj4gT24gOC8yMy8xOSA3OjQ4
IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+PiBXZSB3YW50IHRvIGxpbWl0IG51bWJl
ciBvZiBjYWxscyB0byBsb29rdXBfYW5kX3Bpbl9ndWVzdF9yYW1fYWRkcigpCj4+Pj4gcGVyIG9u
ZSByZXF1ZXN0LiBUaGVyZSBhcmUgdHdvIHdheXMgdG8gZG8gdGhpczogZWl0aGVyIHByZWVtcHQK
Pj4+PiB0cmFuc2xhdGVfbm9uY29udGlnKCkgb3IgdG8gbGltaXQgc2l6ZSBvZiBvbmUgc2hhcmVk
IGJ1ZmZlciBzaXplLgo+Pj4+Cj4+Pj4gSXQgaXMgcXVpdGUgaGFyZCB0byBwcmVlbXB0IHRyYW5z
bGF0ZV9ub25jb250aWcoKSwgYmVjYXVzZSBpdCBpcyBkZWVwCj4+Pj4gbmVzdGVkLiBTbyB3ZSBj
aG9zZSBzZWNvbmQgb3B0aW9uLiBXZSB3aWxsIGFsbG93IDUxMiBwYWdlcyBwZXIgb25lCj4+Pj4g
c2hhcmVkIGJ1ZmZlci4gVGhpcyBkb2VzIG5vdCBpbnRlcmZlcmUgd2l0aCBHUCBzdGFuZGFyZCwg
YXMgaXQKPj4+PiByZXF1aXJlcyB0aGF0IHNpemUgbGltaXQgZm9yIHNoYXJlZCBidWZmZXIgc2hv
dWxkIGJlIGF0IGxlc3QgNTEya0IuCj4+Pgo+Pj4gRG8geW91IG1lYW4gImxlYXN0IiBpbnN0ZWFk
IG9mICJsZXN0Ij8KPj4gWWVzCj4+Cj4+PiBJZiBzbywgd2h5IDUxMiBwYWdlcyAoaS5lIDFNQikK
Pj4+IGlzIHBsZW50eSBlbm91Z2ggZm9yIG1vc3Qgb2YgdGhlIHVzZSBjYXNlcz8gV2hhdCBkb2Vz
ICJ4dGVzdCIgY29uc2lzdAo+Pj4gb24/Cj4+IEJpZ2dlciBidWZmZXIgeHRlc3QgdHJpZXMgdG8g
YWxsb2NhdGUgaXMgbWVyZSAzMktCLiBJIGJlbGlldmUgdGhhdCAxTUIKPj4gaXMgZW5vdWdoIGZv
ciB0aGUgbW9zdCBjYXNlcywgYmVjYXVzZSBPUC1URUUgaXRzZWxmIGhhdmUgYSB2ZXJ5IGxpbWl0
ZWQKPj4gcmVzb3VyY2VzLiBCdXQgdGhpcyB2YWx1ZSBpcyBjaG9zZW4gYXJiaXRyYXJ5Lgo+Cj4g
Q291bGQgd2UgcG90ZW50aWFsbHkgcmVkdWNlIHRvIGxldCBzYXkgNTEyS0IgKG9yIG1heWJlIGxv
d2VyKSBpZiB4dGVzdAo+IG9ubHkgYWxsb2NhdGUgMzJLQj8KUG90ZW50aWFsbHkgLSB5ZXMuIEJ1
dCBvbmx5IHRvIDUxMktCIGlmIHdlIHdhbnQgdG8gYmUgY29tcGF0aWJsZSB3aXRoCnRoZSBHbG9i
YWwgUGxhdGZvcm0gc3BlY2lmaWNhdGlvbi4gV2h5IGFyZSB5b3UgYXNraW5nLCB0aG91Z2g/CgoK
LS0gClZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
