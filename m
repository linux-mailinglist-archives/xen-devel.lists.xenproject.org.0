Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB581D893E
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 22:36:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jamUf-00065j-Gq; Mon, 18 May 2020 20:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDU1=7A=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jamUe-00065c-MH
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 20:36:12 +0000
X-Inumbo-ID: 3563b08a-9947-11ea-a89a-12813bfff9fa
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3563b08a-9947-11ea-a89a-12813bfff9fa;
 Mon, 18 May 2020 20:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdYx+gfyM/FEpXd3AKqZafCUUn+j1r6IUAgSXeg0oMhfc959lJAjTD/RmqM77WoiDUIylxN7KkuAVpwdZs4cAlDI5N37EXRz0r6tvBnMUL4v+wN1NeN6yY5A1qUh6iLTTRbUjlJ/ELSkqE0LGZcQfeoNLLettQwwwm7adLBcSmaY9bRr8YS8oFW7MWlOaWioOd9IRvZ/gzI46Mf8S9iFQL7imdmELv8d2A+rL7HJ41ybP06BJEWQvQhoEdayA2TOIEUpk6Q9QJFLBVqC/q/pItYTX5ZMymqIQ/CBAz7KTBXZvGIWEJ3I2BLRrVFsUMW/54zgV729sxnEl9DulXC/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJnt6gnt51F/31z+7R1URZkHQnPNV1KHLm19piMf+c0=;
 b=Cvec6Zu8PLZ7JrLIKCTT6JOcyCEr1egTWhaPSOh8y508WybppQS3vMeEbeo85qSFFQVNjUKi6A8ktZuZW5sw/4Y8XHQEF+HXFHODntUzg63r9EC7NJX0r8lW0z1fRYP4ye3Cqi3b99vjLZM48a/Ix/QERoQai+Vws6k4XshuzXv5D2VahWFoeTPpbqdOrFDfUm+24Cc5+kz47DW0U04P26v6sSmJozmPkCg8nanRuVbdBhkNppjqiSq160EQgYT8spZC7ud1qHJbgUDzmrrAO9OnpdSWHy4aEqh33Dgz7v6imt07TG6NSkyLse2+kN9S75u9Ts1ViCamHqYoMJvQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJnt6gnt51F/31z+7R1URZkHQnPNV1KHLm19piMf+c0=;
 b=qW9fMKki+C2q/S/X1stHHD4Owr94h5frK75AvVJmr4nsgerqDXI+mQjkjXtX0wD8SPcl/iv5kAkMnZYwpYpOqZas+CpIOFpbsmKjWKguDYHlCS5sg+QITqNDlzJvLRc44bCqiVbSQuCknwsQspLWFm9f+gr9uyQSCnpHiLSnhLU=
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB3280.eurprd03.prod.outlook.com
 (2603:10a6:803:21::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 20:36:08 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 20:36:08 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "julien@xen.org" <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.14 3/3] xen/arm: plat: Allocate as much as possible
 memory below 1GB for dom0 for RPI
Thread-Topic: [PATCH for-4.14 3/3] xen/arm: plat: Allocate as much as possible
 memory below 1GB for dom0 for RPI
Thread-Index: AQHWLQfDNIfgFSjSGUyub+p/1yhn8KiuTdqA
Date: Mon, 18 May 2020 20:36:08 +0000
Message-ID: <bc9a1121a7484ef484c30869793698f912987d23.camel@epam.com>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-4-julien@xen.org>
In-Reply-To: <20200518113008.15422-4-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 897fff7b-34a7-4823-22e1-08d7fb6b1863
x-ms-traffictypediagnostic: VI1PR0302MB3280:
x-microsoft-antispam-prvs: <VI1PR0302MB328039A09F93A5C9004EA84EE6B80@VI1PR0302MB3280.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yKp16Pr/QKernNFeHu3uf+Yi+iS7KbUX2l/VxVElnf9L7bUJwgwYyfgf80WYj/DlhktHL0MlgyKhJ3TJ2L6g6EzHcfVOVJ+BWTgvAv2zMJoyFCrIs/r0Qp8/Gf2dmIibePG96qbs2OjdtNoJmDh+AbqgLTlzE0dPtgBlIDRoGznREuK6sqE95udl06Xo6oCwO1GT+pbOcC7XuFwUTLniTBu4ddhI9p1p1L7Pz0tycJl91oL5CGijVF+jqFINvBf646/gZZmCDtpgrSh1gz+AR90TpaQzLjQjKsyUdh0eM2TuZ9R3JBg5pgXm7XPHaOBzZnm+tUTwo4J9GByARPt1VYhGl39CFh167q68ubZAbhvwhYgi3PCZkgXaUMNVjIh+BQKCIfPgddlmTiwEKs3h0Rb0ei0wKTuhXTuGJZNe+64LcmLBGwN7ix8Jyx8QV+6i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2906002)(86362001)(6486002)(186003)(26005)(64756008)(66556008)(76116006)(91956017)(66446008)(66946007)(2616005)(66476007)(71200400001)(316002)(55236004)(5660300002)(6506007)(4326008)(54906003)(110136005)(8676002)(36756003)(6512007)(8936002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 86Q/ey93VcyDN/YU6B9R0AUC5t9LY73gsjd7dfNTJPUWtpoItnT3sww1W2AHR83MWGtL7fL7M0iM2RvQ+5q9VQsPZqtsw3RvztNJu2PYFKOWaFrugXsv0TpoagYXtXvJyp0I/SoBiRAF7HkkOBLQWvGPg0qPapFOktqt/rEqHpVRRHO586+OvR29ODdN6zkleoFv22d/dQwl08PW/86YOCcku/rFsIHk0+vCmXHA2fxfqSsOH9GaQShjgJSVn3Amv/zOjlYctJGxBKhmk7Eppu3bDzsiURpeS3yjUjXYT0FyTb4EIaq29x/NiZapWS8xty32kPIJXNLiEQvHb85FUmJARDjDNjN1elHH8wFC6ISsVnI+u1D4DIG7jCb2Soog/P7kyzdnY1lc1kiw61XeXaeZ8XTRfRs1Y9ZCOycjpk9WQT2/7H7B3lQ/E1IzLhTt7yTyuH0DIX0bbjNBlVBLdT5DW5xah65TCWCORvZtxd8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <88EC96D3B51CF44BB642111FF3E9F8D1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897fff7b-34a7-4823-22e1-08d7fb6b1863
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 20:36:08.4157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3BcWM4g9M53PIlDQjvxVTozi69RzMzgjnw+wquklLk6CTws8VdC/dkpXyU2HLhrcQlCOkfojch3Fy9c2zpZYDe17K8kQqOokHp5BUv4SUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3280
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "jgrall@amazon.com" <jgrall@amazon.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "roman@zededa.com" <roman@zededa.com>, "minyard@acm.org" <minyard@acm.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQpPbiBNb24sIDIwMjAtMDUtMTggYXQgMTI6MzAgKzAxMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToNCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4g
DQo+IFRoZSByYXNwYmVycnkgUEkgNCBoYXMgZGV2aWNlcyB0aGF0IGNhbiBvbmx5IERNQSBpbnRv
IHRoZSBmaXJzdCBHQiBvZg0KPiB0aGUgUkFNLiBUaGVyZWZvcmUgd2Ugd2FudCBhbGxvY2F0ZSBh
cyBtdWNoIGFzIHBvc3NpYmxlIG1lbW9yeSBiZWxvdyAxR0INCj4gZm9yIGRvbTAuDQo+IA0KPiBV
c2UgdGhlIHJlY2VudGx5IGludHJvZHVjZWQgZG1hX2JpdHNpemUgZmllbGQgdG8gc3BlY2lmeSB0
aGUgRE1BIHdpZHRoDQo+IHN1cHBvcnRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+IFJlcG9ydGVkLWJ5OiBDb3JleSBNaW55YXJkIDxt
aW55YXJkQGFjbS5vcmc+DQo+IC0tLQ0KPiAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9icmNtLXJh
c3BiZXJyeS1waS5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4g
DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBp
LmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMNCj4gaW5kZXgg
YjY5N2ZhMmM2YzBlLi5hZDU0ODM0MzdiMzEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvYnJjbS1yYXNwYmVycnktcGkuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMNCj4gQEAgLTQzLDYgKzQzLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggcnBpNF9ibGFja2xpc3RfZGV2W10gX19pbml0Y29uc3Qg
PQ0KPiAgUExBVEZPUk1fU1RBUlQocnBpNCwgIlJhc3BiZXJyeSBQaSA0IikNCj4gICAgICAuY29t
cGF0aWJsZSAgICAgPSBycGk0X2R0X2NvbXBhdCwNCj4gICAgICAuYmxhY2tsaXN0X2RldiAgPSBy
cGk0X2JsYWNrbGlzdF9kZXYsDQo+ICsgICAgLmRtYV9iaXRzaXplICAgID0gMTAsDQoNCkknbSBj
b25mdXNlZC4gU2hvdWxkIGl0IGJlIDMwPw0KDQo+ICBQTEFURk9STV9FTkQNCj4gIA0KPiAgLyoN
Cg==

