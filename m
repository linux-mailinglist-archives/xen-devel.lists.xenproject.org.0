Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA9234453
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 12:53:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1SfI-0001g4-4p; Fri, 31 Jul 2020 10:53:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8Mk=BK=epam.com=prvs=64810d1384=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1k1SfG-0001fz-0Q
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 10:53:26 +0000
X-Inumbo-ID: 0e21b648-d31c-11ea-8e24-bc764e2007e4
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e21b648-d31c-11ea-8e24-bc764e2007e4;
 Fri, 31 Jul 2020 10:53:24 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VAoQCH014636; Fri, 31 Jul 2020 10:53:22 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0a-0039f301.pphosted.com with ESMTP id 32mghfr8g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 10:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avRRcM+kk3t+7Nz0AFApDfGx49v7ObILi84oYmh65Zx+x3X4gaVxWCtEDE29PJv9UPrGDW0HjcppVri6DagaK3+J/7LEKvYxEvJtr++tA6YvDODe9HniJ52KtyUgGvkb/VnX4Qk5Lr8Pd+fWjcDcrvKfU7kPtl2JVpfaF9uugSXJtqQfPq1hZtn21/SapwXJDPxcZwa4yAlylJHGMeJ7u2VVr4CjkJ/Nv1HO/fb3ppuvw2xbKryPvKKXAu5G+Rbm8OIVxtIjI1BjiDFyRZsgRIXAEhrhRIDwl9PHZglHAlg9QDazogV23XAeE5DA5D1/tIuQCy12G2lWyBi8I0bytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4V0IV66q0LxwRuSg5WihLuEtmMVIozIiJEPU5RVXV0=;
 b=BGm3Nl1eGWAKRTF8dN1hnC5FzIDgZLOXkGixBdQg3ak5s6RLK0uNSAZqa8MV/bSsAHNU6GILlnB+TgCTN3i03X3OJ8htNlZSTxL56IclRC65TCn5QulNG/EXr7DKEfWT/6xcrwZ2/Ko22C96Ufeo0ubN6Gd9Qaf8IZkhgUtZKLlEZac4hAef8TQcu3AlWuxUygoyYOMyAvocV7lAq/3lRiFgJLs4EsDcoW0lxd5bomJ/u7Kt9lFOtOLkugNmaxVkhmSDFv4BZ2pEEzwMBLomLmbUnVVYYL157Ldq0ELJubSyJUPNFHY0Sz3xDUOQrpisZ9u+neoYW4sbpikn+pztFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4V0IV66q0LxwRuSg5WihLuEtmMVIozIiJEPU5RVXV0=;
 b=1UDuG5YzE2qpCEUlqRqnI6YNF0znnzHc2qAyfDPnBilbBMqESWXkajzc/yvrANglpOqrrQWBgdNh7OPgeQBN12+be13GrTzfZy9bSOvT8dZnCHTmnUzxPUMf9F6hqVtF+y+4k6RZ4ZIE5F1NCG7qIY63tRAah4hKk29LcuFuduhb5l0lj7DZRJqubX5fFJyl4ABkCPy31ltMmpORNlGWgYBQkMlf7aGSVAuzttJEB4AkkecQC9mTsOUuNY8pqkMwenh/MZskgD2QFwiMk9CoxAY/Riy2TrVtRGQ3oz4eHKpuUg0au1hpt8BZWfWnDKPMBneR+KBPYiVVoYY4qHTCMw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3714.eurprd03.prod.outlook.com (2603:10a6:208:44::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 10:53:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 10:53:18 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "ian.jackson@citrix.com" <ian.jackson@citrix.com>,
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 2/2] libgnttab: Add support for Linux dma-buf offset
Thread-Topic: [PATCH 2/2] libgnttab: Add support for Linux dma-buf offset
Thread-Index: AQHWLoWvWdjq7ozlqkeaZNP0F/2zoKkh9IyA
Date: Fri, 31 Jul 2020 10:53:18 +0000
Message-ID: <ca641b0d-297d-1d1e-ecc7-0b35a2aa7c91@epam.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
 <20200520090425.28558-3-andr2000@gmail.com>
In-Reply-To: <20200520090425.28558-3-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b50ade6-1c22-48e4-c7df-08d8353fef30
x-ms-traffictypediagnostic: AM0PR03MB3714:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB3714456D406D36CD321E569EE74E0@AM0PR03MB3714.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2evGiuokImme1kSJzNyytP3gjUObEGDJdwYBRRpInXZdB1K8ikpC++2kE3wyHMx/acKS5DDKUbd37qJeyj02TidEu9Orvjix6iH/rcdR0qWXRJLI21/y7YJnAS0avvcxdC+/r03I2QZnnnUFqgHTQFscSvYO64QnJGDplbPDHjb69iMWZWP6g1UcKVEotRWlwalKIQHRUiu2uDf+4X8aK5cTd49xVTpaTu0khLCE0+WMvaZCkMTmi4ha9Oo5WmezAsCSnMLW57Ty3lGLB/oeCZylHnGxGgQekEXMmeozBS3PZ0+/fro1s2ExN8DcaIEOX1U4U+6lMHgKZo3GTIQSMHJXNwjbp3L1isYHlLky3hMpiXKujswwLx2sykntA91b3tzg26B7ksVmlO4YrkyjfOYuFFGwA3wmAhtjgc4E93oJHgsnXW5f8h636Mvfo3uGm3pmUEX4B0I6JTatA3gZYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(4326008)(8676002)(6512007)(30864003)(26005)(5660300002)(31696002)(71200400001)(186003)(86362001)(316002)(31686004)(107886003)(66446008)(64756008)(66556008)(110136005)(2906002)(66476007)(53546011)(6506007)(966005)(76116006)(91956017)(478600001)(8936002)(6486002)(54906003)(66946007)(2616005)(36756003)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 90KXslE73fsBTMLzOPMIhoRS9k2m46Emc7slAhuangujhYTZiidRcGnFqV1bkQS8hQyuhfDHMhpO3/xcdmP82+8H4iKpgPUOkDGWStG1JXQcR4WK3KpLPh5KaQdVZUtQsS8J6Boy4xPyFnHoUTPVHDYLQAmetkEe+k0UPbqzilNtnbJZE/ZZ6+19oL5dVnFsxu2kL61lbsOyKDodH0S+TeClE6Yvt+GNycZJlq5yFJmgTj0yYRu98Xet/UhhFc7kxQaOUuXHR7xOZcX7xNvqccZtk1WkknHVkaStwzc0gWBxxk2yblEUYEyE1wO2hjPg/M8Y3dyZwzTB11c/8U6hUHKU8vPIBpzE0zTxHykC8t6aGM3dIWw6fn5InYodAZZ0RL9OkZrcU0Yg0G7mrD0I6NbDMepB5JhZvJSA3mvkxivRuQuBl65wj0S9FiKO70c/YGJy4o9DLD3Aodn+xo62ndGoW4BOt0SMfbC6cdoGbeH3aH7GmmNqClV9G1Ovcs+xwoJcElbsR3wXdepuPMgpDfUokt1AejORRH0Ebxrg7xHB0KWvi+ZAmlepJxo2V+JY2Lei/lZOwUakpqYNq+qvYHmMOVKtK35Daq0A414yAM95pb6tFwecS0jlqR0D7c6j5d3xcI36dOQ8P+vux1Q4Ig==
Content-Type: text/plain; charset="utf-8"
Content-ID: <40357C1CF16E52419EE1EB1C48D94D61@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b50ade6-1c22-48e4-c7df-08d8353fef30
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 10:53:18.3814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+7eFr6oSatm54ktjX4aJFGpsueAQ0Atsb7dcN10i1eEr0yUD2yYEU4nT4T4+TbqqWo2ecXj0a8t0T3FyltPtAk0tqPi7+LHoiUpL8VqU3x2NKLQ2wvQYRnDInjTWKSO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3714
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_04:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007310082
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
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sIElhbiwgV2VpIQ0KDQpJbml0aWFsbHkgSSBoYXZlIHNlbnQgdGhpcyBwYXRjaCBhcyBh
IHBhcnQgb2YgdGhlIHNlcmllcyBmb3IgdGhlIGRpc3BsYXkgcHJvdG9jb2wgY2hhbmdlcywNCg0K
YnV0IGxhdGVyIGRlY2lkZWQgdG8gc3BsaXQuIEF0IHRoZSBtb21lbnQgdGhlIHByb3RvY29sIGNo
YW5nZXMgYXJlIGFscmVhZHkNCg0KYWNjZXB0ZWQsIGJ1dCB0aGlzIHBhcnQgaXMgc3RpbGwgbWlz
c2luZyBmZWVkYmFjayBhbmQgaXMgc3RpbGwgd2FudGVkLg0KDQpJIHdvdWxkIHJlYWxseSBhcHBy
ZWNpYXRlIGlmIHlvdSBjb3VsZCBoYXZlIGEgbG9vayBhdCB0aGUgY2hhbmdlIGJlbG93Lg0KDQpU
aGFuayB5b3UgaW4gYWR2YW5jZSwNCg0KT2xla3NhbmRyIEFuZHJ1c2hjaGVua28NCg0KT24gNS8y
MC8yMCAxMjowNCBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+IEZyb206IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4NCj4gQWRkIHZlcnNpb24gMiBvZiB0aGUgZG1hLWJ1ZiBpb2N0bHMgd2hpY2ggYWRkcyBkYXRh
X29mcyBwYXJhbWV0ZXIuDQo+DQo+IGRtYS1idWYgaXMgYmFja2VkIGJ5IGEgc2NhdHRlci1nYXRo
ZXIgdGFibGUgYW5kIGhhcyBvZmZzZXQgcGFyYW1ldGVyDQo+IHdoaWNoIHRlbGxzIHdoZXJlIHRo
ZSBhY3R1YWwgZGF0YSBzdGFydHMuIFJlbGV2YW50IGlvY3RscyBhcmUgZXh0ZW5kZWQNCj4gdG8g
c3VwcG9ydCB0aGF0IG9mZnNldDoNCj4gICAgLSB3aGVuIGRtYS1idWYgaXMgY3JlYXRlZCAoZXhw
b3J0ZWQpIGZyb20gZ3JhbnQgcmVmZXJlbmNlcyB0aGVuDQo+ICAgICAgZGF0YV9vZnMgaXMgdXNl
ZCB0byBzZXQgdGhlIG9mZnNldCBmaWVsZCBpbiB0aGUgc2NhdHRlciBsaXN0DQo+ICAgICAgb2Yg
dGhlIG5ldyBkbWEtYnVmDQo+ICAgIC0gd2hlbiBkbWEtYnVmIGlzIGltcG9ydGVkIGFuZCBncmFu
dCByZWZlcmVuY2VzIHByb3ZpZGVkIHRoZW4NCj4gICAgICBkYXRhX29mcyBpcyB1c2VkIHRvIHJl
cG9ydCB0aGF0IG9mZnNldCB0byB1c2VyLXNwYWNlDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4g
LS0tDQo+ICAgdG9vbHMvaW5jbHVkZS94ZW4tc3lzL0xpbnV4L2dudGRldi5oICB8IDUzICsrKysr
KysrKysrKysrKysrDQo+ICAgdG9vbHMvbGlicy9nbnR0YWIvTWFrZWZpbGUgICAgICAgICAgICB8
ICAyICstDQo+ICAgdG9vbHMvbGlicy9nbnR0YWIvZnJlZWJzZC5jICAgICAgICAgICB8IDE1ICsr
KysrDQo+ICAgdG9vbHMvbGlicy9nbnR0YWIvZ250dGFiX2NvcmUuYyAgICAgICB8IDE3ICsrKysr
Kw0KPiAgIHRvb2xzL2xpYnMvZ250dGFiL2luY2x1ZGUveGVuZ250dGFiLmggfCAxMyArKysrDQo+
ICAgdG9vbHMvbGlicy9nbnR0YWIvbGlieGVuZ250dGFiLm1hcCAgICB8ICA2ICsrDQo+ICAgdG9v
bHMvbGlicy9nbnR0YWIvbGludXguYyAgICAgICAgICAgICB8IDg2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiAgIHRvb2xzL2xpYnMvZ250dGFiL21pbmlvcy5jICAgICAgICAgICAgfCAx
NSArKysrKw0KPiAgIHRvb2xzL2xpYnMvZ250dGFiL3ByaXZhdGUuaCAgICAgICAgICAgfCAgOSAr
KysNCj4gICA5IGZpbGVzIGNoYW5nZWQsIDIxNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+DQo+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL3hlbi1zeXMvTGludXgvZ250ZGV2Lmgg
Yi90b29scy9pbmNsdWRlL3hlbi1zeXMvTGludXgvZ250ZGV2LmgNCj4gaW5kZXggZDE2MDc2MDQ0
YzcxLi4wYzQzMzkzY2JlZTUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2luY2x1ZGUveGVuLXN5cy9M
aW51eC9nbnRkZXYuaA0KPiArKysgYi90b29scy9pbmNsdWRlL3hlbi1zeXMvTGludXgvZ250ZGV2
LmgNCj4gQEAgLTI3NCw0ICsyNzQsNTcgQEAgc3RydWN0IGlvY3RsX2dudGRldl9kbWFidWZfaW1w
X3JlbGVhc2Ugew0KPiAgICAgICB1aW50MzJfdCByZXNlcnZlZDsNCj4gICB9Ow0KPiAgIA0KPiAr
LyoNCj4gKyAqIFZlcnNpb24gMiBvZiB0aGUgaW9jdGxzIGFkZHMgQGRhdGFfb2ZzIHBhcmFtZXRl
ci4NCj4gKyAqDQo+ICsgKiBkbWEtYnVmIGlzIGJhY2tlZCBieSBhIHNjYXR0ZXItZ2F0aGVyIHRh
YmxlIGFuZCBoYXMgb2Zmc2V0DQo+ICsgKiBwYXJhbWV0ZXIgd2hpY2ggdGVsbHMgd2hlcmUgdGhl
IGFjdHVhbCBkYXRhIHN0YXJ0cy4NCj4gKyAqIFJlbGV2YW50IGlvY3RscyBhcmUgZXh0ZW5kZWQg
dG8gc3VwcG9ydCB0aGF0IG9mZnNldDoNCj4gKyAqICAgLSB3aGVuIGRtYS1idWYgaXMgY3JlYXRl
ZCAoZXhwb3J0ZWQpIGZyb20gZ3JhbnQgcmVmZXJlbmNlcyB0aGVuDQo+ICsgKiAgICAgQGRhdGFf
b2ZzIGlzIHVzZWQgdG8gc2V0IHRoZSBvZmZzZXQgZmllbGQgaW4gdGhlIHNjYXR0ZXIgbGlzdA0K
PiArICogICAgIG9mIHRoZSBuZXcgZG1hLWJ1Zg0KPiArICogICAtIHdoZW4gZG1hLWJ1ZiBpcyBp
bXBvcnRlZCBhbmQgZ3JhbnQgcmVmZXJlbmNlcyBhcmUgcHJvdmlkZWQgdGhlbg0KPiArICogICAg
IEBkYXRhX29mcyBpcyB1c2VkIHRvIHJlcG9ydCB0aGF0IG9mZnNldCB0byB1c2VyLXNwYWNlDQo+
ICsgKi8NCj4gKyNkZWZpbmUgSU9DVExfR05UREVWX0RNQUJVRl9FWFBfRlJPTV9SRUZTX1YyIFwN
Cj4gKyAgICBfSU9DKF9JT0NfTk9ORSwgJ0cnLCAxMywgXA0KPiArICAgICAgICAgc2l6ZW9mKHN0
cnVjdCBpb2N0bF9nbnRkZXZfZG1hYnVmX2V4cF9mcm9tX3JlZnNfdjIpKQ0KPiArc3RydWN0IGlv
Y3RsX2dudGRldl9kbWFidWZfZXhwX2Zyb21fcmVmc192MiB7DQo+ICsgICAgLyogSU4gcGFyYW1l
dGVycy4gKi8NCj4gKyAgICAvKiBTcGVjaWZpYyBvcHRpb25zIGZvciB0aGlzIGRtYS1idWY6IHNl
ZSBHTlRERVZfRE1BX0ZMQUdfWFhYLiAqLw0KPiArICAgIHVpbnQzMl90IGZsYWdzOw0KPiArICAg
IC8qIE51bWJlciBvZiBncmFudCByZWZlcmVuY2VzIGluIEByZWZzIGFycmF5LiAqLw0KPiArICAg
IHVpbnQzMl90IGNvdW50Ow0KPiArICAgIC8qIE9mZnNldCBvZiB0aGUgZGF0YSBpbiB0aGUgZG1h
LWJ1Zi4gKi8NCj4gKyAgICB1aW50MzJfdCBkYXRhX29mczsNCj4gKyAgICAvKiBPVVQgcGFyYW1l
dGVycy4gKi8NCj4gKyAgICAvKiBGaWxlIGRlc2NyaXB0b3Igb2YgdGhlIGRtYS1idWYuICovDQo+
ICsgICAgdWludDMyX3QgZmQ7DQo+ICsgICAgLyogVGhlIGRvbWFpbiBJRCBvZiB0aGUgZ3JhbnQg
cmVmZXJlbmNlcyB0byBiZSBtYXBwZWQuICovDQo+ICsgICAgdWludDMyX3QgZG9taWQ7DQo+ICsg
ICAgLyogVmFyaWFibGUgSU4gcGFyYW1ldGVyLiAqLw0KPiArICAgIC8qIEFycmF5IG9mIGdyYW50
IHJlZmVyZW5jZXMgb2Ygc2l6ZSBAY291bnQuICovDQo+ICsgICAgdWludDMyX3QgcmVmc1sxXTsN
Cj4gK307DQo+ICsNCj4gKyNkZWZpbmUgSU9DVExfR05UREVWX0RNQUJVRl9JTVBfVE9fUkVGU19W
MiBcDQo+ICsgICAgX0lPQyhfSU9DX05PTkUsICdHJywgMTQsIFwNCj4gKyAgICAgICAgIHNpemVv
ZihzdHJ1Y3QgaW9jdGxfZ250ZGV2X2RtYWJ1Zl9pbXBfdG9fcmVmc192MikpDQo+ICtzdHJ1Y3Qg
aW9jdGxfZ250ZGV2X2RtYWJ1Zl9pbXBfdG9fcmVmc192MiB7DQo+ICsgICAgLyogSU4gcGFyYW1l
dGVycy4gKi8NCj4gKyAgICAvKiBGaWxlIGRlc2NyaXB0b3Igb2YgdGhlIGRtYS1idWYuICovDQo+
ICsgICAgdWludDMyX3QgZmQ7DQo+ICsgICAgLyogTnVtYmVyIG9mIGdyYW50IHJlZmVyZW5jZXMg
aW4gQHJlZnMgYXJyYXkuICovDQo+ICsgICAgdWludDMyX3QgY291bnQ7DQo+ICsgICAgLyogVGhl
IGRvbWFpbiBJRCBmb3Igd2hpY2ggcmVmZXJlbmNlcyB0byBiZSBncmFudGVkLiAqLw0KPiArICAg
IHVpbnQzMl90IGRvbWlkOw0KPiArICAgIC8qIFJlc2VydmVkIC0gbXVzdCBiZSB6ZXJvLiAqLw0K
PiArICAgIHVpbnQzMl90IHJlc2VydmVkOw0KPiArICAgIC8qIE9VVCBwYXJhbWV0ZXJzLiAqLw0K
PiArICAgIC8qIE9mZnNldCBvZiB0aGUgZGF0YSBpbiB0aGUgZG1hLWJ1Zi4gKi8NCj4gKyAgICB1
aW50MzJfdCBkYXRhX29mczsNCj4gKyAgICAvKiBBcnJheSBvZiBncmFudCByZWZlcmVuY2VzIG9m
IHNpemUgQGNvdW50LiAqLw0KPiArICAgIHVpbnQzMl90IHJlZnNbMV07DQo+ICt9Ow0KPiArDQo+
ICAgI2VuZGlmIC8qIF9fTElOVVhfUFVCTElDX0dOVERFVl9IX18gKi8NCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL2xpYnMvZ250dGFiL01ha2VmaWxlIGIvdG9vbHMvbGlicy9nbnR0YWIvTWFrZWZpbGUN
Cj4gaW5kZXggMmRhOGZiYmI3ZjZmLi41ZWUyZDk2NTIxNGYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L2xpYnMvZ250dGFiL01ha2VmaWxlDQo+ICsrKyBiL3Rvb2xzL2xpYnMvZ250dGFiL01ha2VmaWxl
DQo+IEBAIC0yLDcgKzIsNyBAQCBYRU5fUk9PVCA9ICQoQ1VSRElSKS8uLi8uLi8uLg0KPiAgIGlu
Y2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvUnVsZXMubWsNCj4gICANCj4gICBNQUpPUiAgICA9IDEN
Cj4gLU1JTk9SICAgID0gMg0KPiArTUlOT1IgICAgPSAzDQo+ICAgTElCTkFNRSAgOj0gZ250dGFi
DQo+ICAgVVNFTElCUyAgOj0gdG9vbGxvZyB0b29sY29yZQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlicy9nbnR0YWIvZnJlZWJzZC5jIGIvdG9vbHMvbGlicy9nbnR0YWIvZnJlZWJzZC5j
DQo+IGluZGV4IDg4NmI1ODgzMDNhMC4uYmFmMGY2MGFhNGQzIDEwMDY0NA0KPiAtLS0gYS90b29s
cy9saWJzL2dudHRhYi9mcmVlYnNkLmMNCj4gKysrIGIvdG9vbHMvbGlicy9nbnR0YWIvZnJlZWJz
ZC5jDQo+IEBAIC0zMTksNiArMzE5LDE0IEBAIGludCBvc2RlcF9nbnR0YWJfZG1hYnVmX2V4cF9m
cm9tX3JlZnMoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50MzJfdCBkb21pZCwNCj4gICAgICAg
YWJvcnQoKTsNCj4gICB9DQo+ICAgDQo+ICtpbnQgb3NkZXBfZ250dGFiX2RtYWJ1Zl9leHBfZnJv
bV9yZWZzX3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMyX3QgZG9taWQsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGZsYWdzLCB1aW50
MzJfdCBjb3VudCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3QgdWludDMyX3QgKnJlZnMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90ICpkbWFidWZfZmQsIHVpbnQzMl90IGRhdGFfb2ZzKQ0KPiArew0K
PiArICAgIGFib3J0KCk7DQo+ICt9DQo+ICsNCj4gICBpbnQgb3NkZXBfZ250dGFiX2RtYWJ1Zl9l
eHBfd2FpdF9yZWxlYXNlZCh4ZW5nbnR0YWJfaGFuZGxlICp4Z3QsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZmQsIHVpbnQzMl90IHdhaXRf
dG9fbXMpDQo+ICAgew0KPiBAQCAtMzMxLDYgKzMzOSwxMyBAQCBpbnQgb3NkZXBfZ250dGFiX2Rt
YWJ1Zl9pbXBfdG9fcmVmcyh4ZW5nbnR0YWJfaGFuZGxlICp4Z3QsIHVpbnQzMl90IGRvbWlkLA0K
PiAgICAgICBhYm9ydCgpOw0KPiAgIH0NCj4gICANCj4gK2ludCBvc2RlcF9nbnR0YWJfZG1hYnVm
X2ltcF90b19yZWZzX3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMyX3QgZG9taWQsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBmZCwgdWlu
dDMyX3QgY291bnQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MzJfdCAqcmVmcywgdWludDMyX3QgKmRhdGFfb2ZzKQ0KPiArew0KPiArICAgIGFib3J0KCk7
DQo+ICt9DQo+ICsNCj4gICBpbnQgb3NkZXBfZ250dGFiX2RtYWJ1Zl9pbXBfcmVsZWFzZSh4ZW5n
bnR0YWJfaGFuZGxlICp4Z3QsIHVpbnQzMl90IGZkKQ0KPiAgIHsNCj4gICAgICAgYWJvcnQoKTsN
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvZ250dGFiL2dudHRhYl9jb3JlLmMgYi90b29scy9s
aWJzL2dudHRhYi9nbnR0YWJfY29yZS5jDQo+IGluZGV4IDkyZTcyMjhhMjY3MS4uM2FmM2NlYzgw
MDQ1IDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2dudHRhYi9nbnR0YWJfY29yZS5jDQo+ICsr
KyBiL3Rvb2xzL2xpYnMvZ250dGFiL2dudHRhYl9jb3JlLmMNCj4gQEAgLTE0NCw2ICsxNDQsMTUg
QEAgaW50IHhlbmdudHRhYl9kbWFidWZfZXhwX2Zyb21fcmVmcyh4ZW5nbnR0YWJfaGFuZGxlICp4
Z3QsIHVpbnQzMl90IGRvbWlkLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZnMsIGZkKTsNCj4gICB9DQo+ICAgDQo+ICtpbnQgeGVuZ250dGFiX2Rt
YWJ1Zl9leHBfZnJvbV9yZWZzX3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMyX3QgZG9t
aWQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGZs
YWdzLCB1aW50MzJfdCBjb3VudCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3QgdWludDMyX3QgKnJlZnMsIHVpbnQzMl90ICpmZCwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZGF0YV9vZnMpDQo+ICt7DQo+ICsg
ICAgcmV0dXJuIG9zZGVwX2dudHRhYl9kbWFidWZfZXhwX2Zyb21fcmVmc192Mih4Z3QsIGRvbWlk
LCBmbGFncywgY291bnQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWZzLCBmZCwgZGF0YV9vZnMpOw0KPiArfQ0KPiArDQo+ICAgaW50IHhlbmdu
dHRhYl9kbWFidWZfZXhwX3dhaXRfcmVsZWFzZWQoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50
MzJfdCBmZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50
MzJfdCB3YWl0X3RvX21zKQ0KPiAgIHsNCj4gQEAgLTE1Niw2ICsxNjUsMTQgQEAgaW50IHhlbmdu
dHRhYl9kbWFidWZfaW1wX3RvX3JlZnMoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50MzJfdCBk
b21pZCwNCj4gICAgICAgcmV0dXJuIG9zZGVwX2dudHRhYl9kbWFidWZfaW1wX3RvX3JlZnMoeGd0
LCBkb21pZCwgZmQsIGNvdW50LCByZWZzKTsNCj4gICB9DQo+ICAgDQo+ICtpbnQgeGVuZ250dGFi
X2RtYWJ1Zl9pbXBfdG9fcmVmc192Mih4ZW5nbnR0YWJfaGFuZGxlICp4Z3QsIHVpbnQzMl90IGRv
bWlkLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZmQs
IHVpbnQzMl90IGNvdW50LCB1aW50MzJfdCAqcmVmcywNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQzMl90ICpkYXRhX29mcykNCj4gK3sNCj4gKyAgICByZXR1cm4g
b3NkZXBfZ250dGFiX2RtYWJ1Zl9pbXBfdG9fcmVmc192Mih4Z3QsIGRvbWlkLCBmZCwgY291bnQs
IHJlZnMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZGF0YV9vZnMpOw0KPiArfQ0KPiArDQo+ICAgaW50IHhlbmdudHRhYl9kbWFidWZfaW1wX3JlbGVh
c2UoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50MzJfdCBmZCkNCj4gICB7DQo+ICAgICAgIHJl
dHVybiBvc2RlcF9nbnR0YWJfZG1hYnVmX2ltcF9yZWxlYXNlKHhndCwgZmQpOw0KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlicy9nbnR0YWIvaW5jbHVkZS94ZW5nbnR0YWIuaCBiL3Rvb2xzL2xpYnMv
Z250dGFiL2luY2x1ZGUveGVuZ250dGFiLmgNCj4gaW5kZXggMTExZmM4OGNhZWIzLi4wOTU2YmQ5
MWUwZGYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvZ250dGFiL2luY2x1ZGUveGVuZ250dGFi
LmgNCj4gKysrIGIvdG9vbHMvbGlicy9nbnR0YWIvaW5jbHVkZS94ZW5nbnR0YWIuaA0KPiBAQCAt
MzIyLDEyICszMjIsMTkgQEAgaW50IHhlbmdudHRhYl9ncmFudF9jb3B5KHhlbmdudHRhYl9oYW5k
bGUgKnhndCwNCj4gICAgKiBSZXR1cm5zIDAgaWYgZG1hLWJ1ZiB3YXMgc3VjY2Vzc2Z1bGx5IGNy
ZWF0ZWQgYW5kIHRoZSBjb3JyZXNwb25kaW5nDQo+ICAgICogZG1hLWJ1ZidzIGZpbGUgZGVzY3Jp
cHRvciBpcyByZXR1cm5lZCBpbiBAZmQuDQo+ICAgICoNCj4gKyAqIFZlcnNpb24gMiBhbHNvIGFj
Y2VwdHMgQGRhdGFfb2ZzIG9mZnNldCBvZiB0aGUgZGF0YSBpbiB0aGUgYnVmZmVyLg0KPiArICoN
Cj4gICAgKiBbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJj
ZS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZG1hLWJ1Zi5yc3QNCj4gICAgKi8NCj4gICBpbnQg
eGVuZ250dGFiX2RtYWJ1Zl9leHBfZnJvbV9yZWZzKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWlu
dDMyX3QgZG9taWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50
MzJfdCBmbGFncywgdWludDMyX3QgY291bnQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCB1aW50MzJfdCAqcmVmcywgdWludDMyX3QgKmZkKTsNCj4gICANCj4g
K2ludCB4ZW5nbnR0YWJfZG1hYnVmX2V4cF9mcm9tX3JlZnNfdjIoeGVuZ250dGFiX2hhbmRsZSAq
eGd0LCB1aW50MzJfdCBkb21pZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDMyX3QgZmxhZ3MsIHVpbnQzMl90IGNvdW50LA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50MzJfdCAqcmVmcywgdWludDMyX3QgKmZk
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkYXRh
X29mcyk7DQo+ICsNCj4gICAvKg0KPiAgICAqIFRoaXMgd2lsbCBibG9jayB1bnRpbCB0aGUgZG1h
LWJ1ZiB3aXRoIHRoZSBmaWxlIGRlc2NyaXB0b3IgQGZkIGlzDQo+ICAgICogcmVsZWFzZWQuIFRo
aXMgaXMgb25seSB2YWxpZCBmb3IgYnVmZmVycyBjcmVhdGVkIHdpdGgNCj4gQEAgLTM0NSwxMCAr
MzUyLDE2IEBAIGludCB4ZW5nbnR0YWJfZG1hYnVmX2V4cF93YWl0X3JlbGVhc2VkKHhlbmdudHRh
Yl9oYW5kbGUgKnhndCwgdWludDMyX3QgZmQsDQo+ICAgLyoNCj4gICAgKiBJbXBvcnQgYSBkbWEt
YnVmIHdpdGggZmlsZSBkZXNjcmlwdG9yIEBmZCBhbmQgZXhwb3J0IGdyYW50ZWQgcmVmZXJlbmNl
cw0KPiAgICAqIHRvIHRoZSBwYWdlcyBvZiB0aGF0IGRtYS1idWYgaW50byBhcnJheSBAcmVmcyBv
ZiBzaXplIEBjb3VudC4NCj4gKyAqDQo+ICsgKiBWZXJzaW9uIDIgYWxzbyBwcm92aWRlcyBAZGF0
YV9vZnMgb2Zmc2V0IG9mIHRoZSBkYXRhIGluIHRoZSBidWZmZXIuDQo+ICAgICovDQo+ICAgaW50
IHhlbmdudHRhYl9kbWFidWZfaW1wX3RvX3JlZnMoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50
MzJfdCBkb21pZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJf
dCBmZCwgdWludDMyX3QgY291bnQsIHVpbnQzMl90ICpyZWZzKTsNCj4gICANCj4gK2ludCB4ZW5n
bnR0YWJfZG1hYnVmX2ltcF90b19yZWZzX3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMy
X3QgZG9taWQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJf
dCBmZCwgdWludDMyX3QgY291bnQsIHVpbnQzMl90ICpyZWZzLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgKmRhdGFfb2ZzKTsNCj4gKw0KPiAgIC8qDQo+
ICAgICogVGhpcyB3aWxsIGNsb3NlIGFsbCByZWZlcmVuY2VzIHRvIGFuIGltcG9ydGVkIGJ1ZmZl
ciwgc28gaXQgY2FuIGJlDQo+ICAgICogcmVsZWFzZWQgYnkgdGhlIG93bmVyLiBUaGlzIGlzIG9u
bHkgdmFsaWQgZm9yIGJ1ZmZlcnMgY3JlYXRlZCB3aXRoDQo+IGRpZmYgLS1naXQgYS90b29scy9s
aWJzL2dudHRhYi9saWJ4ZW5nbnR0YWIubWFwIGIvdG9vbHMvbGlicy9nbnR0YWIvbGlieGVuZ250
dGFiLm1hcA0KPiBpbmRleCBkMmE5YjdlMThiZWEuLmRkZjc3ZTA2NGIwOCAxMDA2NDQNCj4gLS0t
IGEvdG9vbHMvbGlicy9nbnR0YWIvbGlieGVuZ250dGFiLm1hcA0KPiArKysgYi90b29scy9saWJz
L2dudHRhYi9saWJ4ZW5nbnR0YWIubWFwDQo+IEBAIC0zNiwzICszNiw5IEBAIFZFUlNfMS4yIHsN
Cj4gICAJCXhlbmdudHRhYl9kbWFidWZfaW1wX3RvX3JlZnM7DQo+ICAgCQl4ZW5nbnR0YWJfZG1h
YnVmX2ltcF9yZWxlYXNlOw0KPiAgIH0gVkVSU18xLjE7DQo+ICsNCj4gK1ZFUlNfMS4zIHsNCj4g
KyAgICBnbG9iYWw6DQo+ICsJCXhlbmdudHRhYl9kbWFidWZfZXhwX2Zyb21fcmVmc192MjsNCj4g
KwkJeGVuZ250dGFiX2RtYWJ1Zl9pbXBfdG9fcmVmc192MjsNCj4gK30gVkVSU18xLjI7DQo+IGRp
ZmYgLS1naXQgYS90b29scy9saWJzL2dudHRhYi9saW51eC5jIGIvdG9vbHMvbGlicy9nbnR0YWIv
bGludXguYw0KPiBpbmRleCBhMDFiYjZjNjk4YzYuLjc1ZTI0OWZiMzIwMiAxMDA2NDQNCj4gLS0t
IGEvdG9vbHMvbGlicy9nbnR0YWIvbGludXguYw0KPiArKysgYi90b29scy9saWJzL2dudHRhYi9s
aW51eC5jDQo+IEBAIC0zNTIsNiArMzUyLDUxIEBAIG91dDoNCj4gICAgICAgcmV0dXJuIHJjOw0K
PiAgIH0NCj4gICANCj4gK2ludCBvc2RlcF9nbnR0YWJfZG1hYnVmX2V4cF9mcm9tX3JlZnNfdjIo
eGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50MzJfdCBkb21pZCwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZmxhZ3MsIHVpbnQzMl90IGNvdW50
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50
MzJfdCAqcmVmcywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgKmRtYWJ1Zl9mZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDMyX3QgZGF0YV9vZnMpDQo+ICt7DQo+ICsgICAgc3RydWN0IGlvY3RsX2du
dGRldl9kbWFidWZfZXhwX2Zyb21fcmVmc192MiAqZnJvbV9yZWZzX3YyID0gTlVMTDsNCj4gKyAg
ICBpbnQgcmMgPSAtMTsNCj4gKw0KPiArICAgIGlmICggIWNvdW50ICkNCj4gKyAgICB7DQo+ICsg
ICAgICAgIGVycm5vID0gRUlOVkFMOw0KPiArICAgICAgICBnb3RvIG91dDsNCj4gKyAgICB9DQo+
ICsNCj4gKyAgICBmcm9tX3JlZnNfdjIgPSBtYWxsb2Moc2l6ZW9mKCpmcm9tX3JlZnNfdjIpICsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgKGNvdW50IC0gMSkgKiBzaXplb2YoZnJvbV9y
ZWZzX3YyLT5yZWZzWzBdKSk7DQo+ICsgICAgaWYgKCAhZnJvbV9yZWZzX3YyICkNCj4gKyAgICB7
DQo+ICsgICAgICAgIGVycm5vID0gRU5PTUVNOw0KPiArICAgICAgICBnb3RvIG91dDsNCj4gKyAg
ICB9DQo+ICsNCj4gKyAgICBmcm9tX3JlZnNfdjItPmZsYWdzID0gZmxhZ3M7DQo+ICsgICAgZnJv
bV9yZWZzX3YyLT5jb3VudCA9IGNvdW50Ow0KPiArICAgIGZyb21fcmVmc192Mi0+ZG9taWQgPSBk
b21pZDsNCj4gKyAgICBmcm9tX3JlZnNfdjItPmRhdGFfb2ZzID0gZGF0YV9vZnM7DQo+ICsNCj4g
KyAgICBtZW1jcHkoZnJvbV9yZWZzX3YyLT5yZWZzLCByZWZzLCBjb3VudCAqIHNpemVvZihmcm9t
X3JlZnNfdjItPnJlZnNbMF0pKTsNCj4gKw0KPiArICAgIGlmICggKHJjID0gaW9jdGwoeGd0LT5m
ZCwgSU9DVExfR05UREVWX0RNQUJVRl9FWFBfRlJPTV9SRUZTX1YyLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgZnJvbV9yZWZzX3YyKSkgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgR1RFUlJPUih4
Z3QtPmxvZ2dlciwgImlvY3RsIERNQUJVRl9FWFBfRlJPTV9SRUZTX1YyIGZhaWxlZCIpOw0KPiAr
ICAgICAgICBnb3RvIG91dDsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICAqZG1hYnVmX2ZkID0gZnJv
bV9yZWZzX3YyLT5mZDsNCj4gKyAgICByYyA9IDA7DQo+ICsNCj4gK291dDoNCj4gKyAgICBmcmVl
KGZyb21fcmVmc192Mik7DQo+ICsgICAgcmV0dXJuIHJjOw0KPiArfQ0KPiArDQo+ICAgaW50IG9z
ZGVwX2dudHRhYl9kbWFidWZfZXhwX3dhaXRfcmVsZWFzZWQoeGVuZ250dGFiX2hhbmRsZSAqeGd0
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IGZkLCB1aW50MzJfdCB3YWl0X3RvX21zKQ0KPiAgIHsNCj4gQEAgLTQxMyw2ICs0NTgsNDcgQEAg
b3V0Og0KPiAgICAgICByZXR1cm4gcmM7DQo+ICAgfQ0KPiAgIA0KPiAraW50IG9zZGVwX2dudHRh
Yl9kbWFidWZfaW1wX3RvX3JlZnNfdjIoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50MzJfdCBk
b21pZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IGZkLCB1aW50MzJfdCBjb3VudCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90ICpyZWZzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDMyX3QgKmRhdGFfb2ZzKQ0KPiArew0KPiArICAgIHN0cnVjdCBpb2N0bF9n
bnRkZXZfZG1hYnVmX2ltcF90b19yZWZzX3YyICp0b19yZWZzX3YyID0gTlVMTDsNCj4gKyAgICBp
bnQgcmMgPSAtMTsNCj4gKw0KPiArICAgIGlmICggIWNvdW50ICkNCj4gKyAgICB7DQo+ICsgICAg
ICAgIGVycm5vID0gRUlOVkFMOw0KPiArICAgICAgICBnb3RvIG91dDsNCj4gKyAgICB9DQo+ICsN
Cj4gKyAgICB0b19yZWZzX3YyID0gbWFsbG9jKHNpemVvZigqdG9fcmVmc192MikgKw0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgKGNvdW50IC0gMSkgKiBzaXplb2YodG9fcmVmc192Mi0+cmVm
c1swXSkpOw0KPiArICAgIGlmICggIXRvX3JlZnNfdjIgKQ0KPiArICAgIHsNCj4gKyAgICAgICAg
ZXJybm8gPSBFTk9NRU07DQo+ICsgICAgICAgIGdvdG8gb3V0Ow0KPiArICAgIH0NCj4gKw0KPiAr
ICAgIHRvX3JlZnNfdjItPmZkID0gZmQ7DQo+ICsgICAgdG9fcmVmc192Mi0+Y291bnQgPSBjb3Vu
dDsNCj4gKyAgICB0b19yZWZzX3YyLT5kb21pZCA9IGRvbWlkOw0KPiArDQo+ICsgICAgaWYgKCAo
cmMgPSBpb2N0bCh4Z3QtPmZkLCBJT0NUTF9HTlRERVZfRE1BQlVGX0lNUF9UT19SRUZTX1YyLCB0
b19yZWZzX3YyKSkgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgR1RFUlJPUih4Z3QtPmxvZ2dlciwg
ImlvY3RsIERNQUJVRl9JTVBfVE9fUkVGU19WMiBmYWlsZWQiKTsNCj4gKyAgICAgICAgZ290byBv
dXQ7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgbWVtY3B5KHJlZnMsIHRvX3JlZnNfdjItPnJlZnMs
IGNvdW50ICogc2l6ZW9mKCpyZWZzKSk7DQo+ICsgICAgKmRhdGFfb2ZzID0gdG9fcmVmc192Mi0+
ZGF0YV9vZnM7DQo+ICsgICAgcmMgPSAwOw0KPiArDQo+ICtvdXQ6DQo+ICsgICAgZnJlZSh0b19y
ZWZzX3YyKTsNCj4gKyAgICByZXR1cm4gcmM7DQo+ICt9DQo+ICsNCj4gICBpbnQgb3NkZXBfZ250
dGFiX2RtYWJ1Zl9pbXBfcmVsZWFzZSh4ZW5nbnR0YWJfaGFuZGxlICp4Z3QsIHVpbnQzMl90IGZk
KQ0KPiAgIHsNCj4gICAgICAgc3RydWN0IGlvY3RsX2dudGRldl9kbWFidWZfaW1wX3JlbGVhc2Ug
cmVsZWFzZTsNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvZ250dGFiL21pbmlvcy5jIGIvdG9v
bHMvbGlicy9nbnR0YWIvbWluaW9zLmMNCj4gaW5kZXggZjc4Y2FhZGQzMDQzLi4yOTg0MTZiMmE5
OGQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYnMvZ250dGFiL21pbmlvcy5jDQo+ICsrKyBiL3Rv
b2xzL2xpYnMvZ250dGFiL21pbmlvcy5jDQo+IEBAIC0xMjAsNiArMTIwLDE0IEBAIGludCBvc2Rl
cF9nbnR0YWJfZG1hYnVmX2V4cF9mcm9tX3JlZnMoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50
MzJfdCBkb21pZCwNCj4gICAgICAgcmV0dXJuIC0xOw0KPiAgIH0NCj4gICANCj4gK2ludCBvc2Rl
cF9nbnR0YWJfZG1hYnVmX2V4cF9mcm9tX3JlZnNfdjIoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1
aW50MzJfdCBkb21pZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgZmxhZ3MsIHVpbnQzMl90IGNvdW50LA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50MzJfdCAqcmVmcywgdWludDMyX3QgKmZk
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBk
YXRhX29mcykNCj4gK3sNCj4gKyAgICByZXR1cm4gLTE7DQo+ICt9DQo+ICsNCj4gICBpbnQgb3Nk
ZXBfZ250dGFiX2RtYWJ1Zl9leHBfd2FpdF9yZWxlYXNlZCh4ZW5nbnR0YWJfaGFuZGxlICp4Z3Qs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
ZmQsIHVpbnQzMl90IHdhaXRfdG9fbXMpDQo+ICAgew0KPiBAQCAtMTMzLDYgKzE0MSwxMyBAQCBp
bnQgb3NkZXBfZ250dGFiX2RtYWJ1Zl9pbXBfdG9fcmVmcyh4ZW5nbnR0YWJfaGFuZGxlICp4Z3Qs
IHVpbnQzMl90IGRvbWlkLA0KPiAgICAgICByZXR1cm4gLTE7DQo+ICAgfQ0KPiAgIA0KPiAraW50
IG9zZGVwX2dudHRhYl9kbWFidWZfaW1wX3RvX3JlZnNfdjIoeGVuZ250dGFiX2hhbmRsZSAqeGd0
LCB1aW50MzJfdCBkb21pZCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGZkLCB1aW50MzJfdCBjb3VudCwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICpyZWZzLCB1aW50MzJfdCAqZGF0YV9vZnMpDQo+
ICt7DQo+ICsgICAgcmV0dXJuIC0xOw0KPiArfQ0KPiArDQo+ICAgaW50IG9zZGVwX2dudHRhYl9k
bWFidWZfaW1wX3JlbGVhc2UoeGVuZ250dGFiX2hhbmRsZSAqeGd0LCB1aW50MzJfdCBmZCkNCj4g
ICB7DQo+ICAgICAgIHJldHVybiAtMTsNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvZ250dGFi
L3ByaXZhdGUuaCBiL3Rvb2xzL2xpYnMvZ250dGFiL3ByaXZhdGUuaA0KPiBpbmRleCBjNWUyMzYz
OWIxNDEuLjA3MjcxNjM3ZjYwOSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlicy9nbnR0YWIvcHJp
dmF0ZS5oDQo+ICsrKyBiL3Rvb2xzL2xpYnMvZ250dGFiL3ByaXZhdGUuaA0KPiBAQCAtMzksNiAr
MzksMTEgQEAgaW50IG9zZGVwX2dudHRhYl9kbWFidWZfZXhwX2Zyb21fcmVmcyh4ZW5nbnR0YWJf
aGFuZGxlICp4Z3QsIHVpbnQzMl90IGRvbWlkLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgZmxhZ3MsIHVpbnQzMl90IGNvdW50LA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDMyX3QgKnJlZnMsIHVp
bnQzMl90ICpmZCk7DQo+ICAgDQo+ICtpbnQgb3NkZXBfZ250dGFiX2RtYWJ1Zl9leHBfZnJvbV9y
ZWZzX3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMyX3QgZG9taWQsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGZsYWdzLCB1aW50MzJf
dCBjb3VudCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgdWludDMyX3QgKnJlZnMsIHVpbnQzMl90ICpmZCwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZGF0YV9vZnMpOw0KPiArDQo+ICAgaW50IG9z
ZGVwX2dudHRhYl9kbWFidWZfZXhwX3dhaXRfcmVsZWFzZWQoeGVuZ250dGFiX2hhbmRsZSAqeGd0
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IGZkLCB1aW50MzJfdCB3YWl0X3RvX21zKTsNCj4gICANCj4gQEAgLTQ2LDYgKzUxLDEwIEBAIGlu
dCBvc2RlcF9nbnR0YWJfZG1hYnVmX2ltcF90b19yZWZzKHhlbmdudHRhYl9oYW5kbGUgKnhndCwg
dWludDMyX3QgZG9taWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgZmQsIHVpbnQzMl90IGNvdW50LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90ICpyZWZzKTsNCj4gICANCj4gK2ludCBvc2RlcF9nbnR0YWJf
ZG1hYnVmX2ltcF90b19yZWZzX3YyKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWludDMyX3QgZG9t
aWQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBm
ZCwgdWludDMyX3QgY291bnQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50MzJfdCAqcmVmcywgdWludDMyX3QgKmRhdGFfb2ZzKTsNCj4gKw0KPiAgIGludCBv
c2RlcF9nbnR0YWJfZG1hYnVmX2ltcF9yZWxlYXNlKHhlbmdudHRhYl9oYW5kbGUgKnhndCwgdWlu
dDMyX3QgZmQpOw0KPiAgIA0KPiAgIGludCBvc2RlcF9nbnRzaHJfb3Blbih4ZW5nbnRzaHJfaGFu
ZGxlICp4Z3MpOw==

