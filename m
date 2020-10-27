Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14429A59C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 08:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12655.32907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXJY0-0000F0-PO; Tue, 27 Oct 2020 07:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12655.32907; Tue, 27 Oct 2020 07:37:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXJY0-0000Ea-Ly; Tue, 27 Oct 2020 07:37:36 +0000
Received: by outflank-mailman (input) for mailman id 12655;
 Tue, 27 Oct 2020 07:37:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kXJXz-0000EV-3h
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 07:37:35 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92e0906f-5cb4-4d78-9ef4-558e3bf935ab;
 Tue, 27 Oct 2020 07:37:33 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09R7YQ6F005396; Tue, 27 Oct 2020 07:37:32 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 34dth23vd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Oct 2020 07:37:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 07:37:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 07:37:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kXJXz-0000EV-3h
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 07:37:35 +0000
X-Inumbo-ID: 92e0906f-5cb4-4d78-9ef4-558e3bf935ab
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 92e0906f-5cb4-4d78-9ef4-558e3bf935ab;
	Tue, 27 Oct 2020 07:37:33 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09R7YQ6F005396;
	Tue, 27 Oct 2020 07:37:32 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
	by mx0a-0039f301.pphosted.com with ESMTP id 34dth23vd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2020 07:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJC3k9WliAr73zaa4gdqjWKL07166ohLBj/H5SauDhb8F2LJtFDmmrLOOF9uBm/EqqnUs3eQ+/u5G+XbK19rtU6D4N3sF27eCt+VGRHYveymgNRYw+fHNHAHJK+lCVU/px5d35VC9BxADJwj6wFNNLru+i3/sEdHSStp8o4aJDtVi9ZoyE2Bzv42lKFrrQQt5jyT+Si5m3mzeChGhyZv3QjupnMv9EVWoVJLSFUVbh5wcAD8RwCL1k18b9VnxRgIApp27SN0hM3kleUEa4D8y8oI520RlTkbfSirI8Rpfd7VgjQ80XxGmZ1MS3MrTL2tU/bI4zPcsMfDbPg8TUQ/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ma5D9kE2vB48ZRnF982ee4/AEojb/VS+Y+GsInweVY=;
 b=FBKTLOy++lcQ2abp5Evw88TeGdZQNXWkH4Uxvs3rdS5tnsdDbgTx9Mdwfbuzzsm4no1t3VsGu8WIqNYGzVe6HHicxDP/ayDl12ao5mo1CnTfl09Sfgy/B88sICat72pQkiBZsVS7nEsmtOXy7bi1pL/WgRAmQu3W7Zxmrlt51wTfqMbCioNFbPBX3osb46EGBpdtpArKONLTWIL6JufXiDA0biY/b8EdOlAc/aW7SfJGCa4zVGVB8ubvSuCFyyqyHeLbrSnXRz9REIy3UJb+CkBFLjEekig4rQd9I3QMm8QJMPTSF3m54JqGIFAZ3dlj+A46W+MY0WtWLNAEII3ysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ma5D9kE2vB48ZRnF982ee4/AEojb/VS+Y+GsInweVY=;
 b=ToeAISEXYi3kujZkd035rHkDNoKE6FY4jPqHxzC1a9DG9BSEzvqaaMtZ5CFpEywWaBTLv2MIUuLlXI/dTeg5CYWWdNINh1jfDPvU7h4Bw2W1YS6LwnIzdLQYAawVrZLtoV+IS4mJBpZGY65DXOMmk3n9YOwqengGYdDqGvbqzSQaG+w5Tlu6c5aXhvOg9+T5CR+1w9OjgS4F1EN/2Ct8dr3KNe2+Qtqqqn/OWH0gj0IHrAjUdpvZaHqUglTq4O4Pi3O3xTaYkrGyn6wn0Nwp8RN50+K43NZehhhzomfCJM5UVVgRyxZsEh7nM+Gd/uyclN+LuiwIvJNjXEe5Qw/1gA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 07:37:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 07:37:29 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [bug report] ALSA: xen-front: Use Xen common shared buffer
 implementation
Thread-Topic: [bug report] ALSA: xen-front: Use Xen common shared buffer
 implementation
Thread-Index: AQHWp5gCAaSbdhOl50Ol8t4K8ZvWE6mrGNoA
Date: Tue, 27 Oct 2020 07:37:29 +0000
Message-ID: <df832bf9-8caa-0be6-f3bf-17c593d1fb1a@epam.com>
References: <20201021105023.GA957589@mwanda>
In-Reply-To: <20201021105023.GA957589@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ca7944d-3869-4fdb-57ac-08d87a4b2887
x-ms-traffictypediagnostic: AM4PR0301MB2195:
x-microsoft-antispam-prvs: 
 <AM4PR0301MB2195EDC4BFA8A239B200AB5BE7160@AM4PR0301MB2195.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Q4SqmmpOprbbEFsj64SD6xrBX51/4G6yOnj1K7v0akju+81qjcnoMoTB3Pvm0zZVWnMYwXMDGa7lZngvRnhegulKZqPuxRyeP3wRjbPA9YxAkKKk7Ujjsprba1YQ/301fOANcIkEziTdTsUxIB9E0zh5JU47rZNEUFr4MdAfeA3mKupoWeDfXXdCD9UwWLy+4tMBC52MwlK4yUJGFYFAsBbjXZUyq8yItMF8jB0/ZSuXNB+yixpoB0lFWSUtQETpmNm+nqHtAn9dpk/Q982AZYGWpzmjTAQgY4l60FmZh2mz1DN2+AfjUT2hnUNuCONt+Nx5k5y9CVylx+b4vZH3qQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(31686004)(31696002)(2616005)(2906002)(8936002)(6916009)(83380400001)(76116006)(26005)(71200400001)(86362001)(478600001)(66556008)(66446008)(36756003)(6506007)(66946007)(6486002)(64756008)(66476007)(8676002)(186003)(4326008)(316002)(6512007)(53546011)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 t7dd0ReOxXHaWvYazm1W/+oBAOwETkoMuKxauWW+fEh0ECxqqELw2gi5/KQPEaAT77AjUCpZYVWeOqAwL6K5Z0H4DmQ8FdEq/a6L7gKgATKpYJgUJPcr5NFhhfbePhQ82g0Q5weuEkz4I31pwVPWMjnlaWavE84lDgYTi4kc2JOsD7Zf+aoV2lPZFWFwlMJ1l2FnDntHeJSFznP6TRBecBsPX7/PJw1OI77roqAgBh1Y5lMtI8qfprW898W9IGvl2om0Zz709bt2NE4bkgAk4+4UFZJuMc9hlWCYrZCi61gQhptowuRvLaUEW2S7yXQbHVNN5T4X9Ht56qhOrgGBYtFZZVDkqpb8greWaTCSq8OLxvm7oMMstlm/FOuDDBIOBbgVQoiVoSS8YIIL15O9nKjxFtvoWpvR40wwVbAgCBA0OY8dNC2ERfNic9DgvkIy0xDeDEriDY1Qu3JF970P2NFgECI0coUA2bqkCMOi/xba4SiRwdlhu140F8eA6iZ8Sn9pb4jkTi2igKffAWA3xBbybaLCWTP+1zC2TzrMGqjwPgOSstQdysr8tsxBOCdLDQKPXtNLzPNPEV9kslgdXCx6qNLLmxN+0Jtr92oYW84iLFgKAUdRmzdEZxy7zUBq0S8F58kLn3p3QRlHnMUnqg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C8C16C32BC12D43946ACDCE2E7715AE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca7944d-3869-4fdb-57ac-08d87a4b2887
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 07:37:29.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ElH/bzRdy3Ho2yDu9T/CXFTMHOit+Vmd0PnuevHYjh37xZESI6AIWwq7mbe7iBM5f5tzBJxp0mI1T7SwRK8BFyL2ixbEjgz8ysA39ms1gGWCiyLMMcsKcA9aDtV7abZt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2195
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-27_03:2020-10-26,2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=790 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010270049

SGVsbG8sIERhbiENCg0KT24gMTAvMjEvMjAgMTo1MCBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToN
Cj4gSGVsbG8gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28sDQo+DQo+IFRoZSBwYXRjaCA1OGY5ZDgw
NmQxNmE6ICJBTFNBOiB4ZW4tZnJvbnQ6IFVzZSBYZW4gY29tbW9uIHNoYXJlZA0KPiBidWZmZXIg
aW1wbGVtZW50YXRpb24iIGZyb20gTm92IDMwLCAyMDE4LCBsZWFkcyB0byB0aGUgZm9sbG93aW5n
DQo+IHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+DQo+ICAgICAgc291bmQveGVuL3hlbl9zbmRf
ZnJvbnRfYWxzYS5jOjQ5NSBhbHNhX2h3X3BhcmFtcygpDQo+ICAgICAgd2FybjogJ3N0cmVhbS0+
c2hidWYuZGlyZWN0b3J5JyBkb3VibGUgZnJlZWQNCj4gICAgICBzb3VuZC94ZW4veGVuX3NuZF9m
cm9udF9hbHNhLmM6NDk1IGFsc2FfaHdfcGFyYW1zKCkNCj4gICAgICB3YXJuOiAnc3RyZWFtLT5z
aGJ1Zi5ncmVmcycgZG91YmxlIGZyZWVkDQo+DQo+IHNvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fs
c2EuYw0KPiAgICAgNDYxICBzdGF0aWMgaW50IGFsc2FfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNt
X3N1YnN0cmVhbSAqc3Vic3RyZWFtLA0KPiAgICAgNDYyICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBzbmRfcGNtX2h3X3BhcmFtcyAqcGFyYW1zKQ0KPiAgICAgNDYzICB7DQo+ICAg
ICA0NjQgICAgICAgICAgc3RydWN0IHhlbl9zbmRfZnJvbnRfcGNtX3N0cmVhbV9pbmZvICpzdHJl
YW0gPSBzdHJlYW1fZ2V0KHN1YnN0cmVhbSk7DQo+ICAgICA0NjUgICAgICAgICAgc3RydWN0IHhl
bl9zbmRfZnJvbnRfaW5mbyAqZnJvbnRfaW5mbyA9IHN0cmVhbS0+ZnJvbnRfaW5mbzsNCj4gICAg
IDQ2NiAgICAgICAgICBzdHJ1Y3QgeGVuX2Zyb250X3BnZGlyX3NoYnVmX2NmZyBidWZfY2ZnOw0K
PiAgICAgNDY3ICAgICAgICAgIGludCByZXQ7DQo+ICAgICA0NjgNCj4gICAgIDQ2OSAgICAgICAg
ICAvKg0KPiAgICAgNDcwICAgICAgICAgICAqIFRoaXMgY2FsbGJhY2sgbWF5IGJlIGNhbGxlZCBt
dWx0aXBsZSB0aW1lcywNCj4gICAgIDQ3MSAgICAgICAgICAgKiBzbyBmcmVlIHRoZSBwcmV2aW91
c2x5IGFsbG9jYXRlZCBzaGFyZWQgYnVmZmVyIGlmIGFueS4NCj4gICAgIDQ3MiAgICAgICAgICAg
Ki8NCj4gICAgIDQ3MyAgICAgICAgICBzdHJlYW1fZnJlZShzdHJlYW0pOw0KPiAgICAgICAgICAg
ICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl4NCj4gVGhpcyBpcyBmcmVlZCBoZXJlLg0KPg0KPiAg
ICAgNDc0ICAgICAgICAgIHJldCA9IHNoYnVmX3NldHVwX2JhY2tzdG9yZShzdHJlYW0sIHBhcmFt
c19idWZmZXJfYnl0ZXMocGFyYW1zKSk7DQo+ICAgICA0NzUgICAgICAgICAgaWYgKHJldCA8IDAp
DQo+ICAgICA0NzYgICAgICAgICAgICAgICAgICBnb3RvIGZhaWw7DQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBeXl5eXl5eXl5eDQo+IFRoaXMgbGVhZHMgdG8gc29tZSBkb3VibGUgZnJlZXMu
ICBQcm9iYWJseSBtb3JlIGRvdWJsZSBmcmVlcyB0aGFuIFNtYXRjaA0KPiBpcyBkZXRlY3Rpbmcu
DQo+DQo+ICAgICA0NzcNCj4gICAgIDQ3OCAgICAgICAgICBtZW1zZXQoJmJ1Zl9jZmcsIDAsIHNp
emVvZihidWZfY2ZnKSk7DQo+ICAgICA0NzkgICAgICAgICAgYnVmX2NmZy54Yl9kZXYgPSBmcm9u
dF9pbmZvLT54Yl9kZXY7DQo+ICAgICA0ODAgICAgICAgICAgYnVmX2NmZy5wZ2RpciA9ICZzdHJl
YW0tPnNoYnVmOw0KPiAgICAgNDgxICAgICAgICAgIGJ1Zl9jZmcubnVtX3BhZ2VzID0gc3RyZWFt
LT5udW1fcGFnZXM7DQo+ICAgICA0ODIgICAgICAgICAgYnVmX2NmZy5wYWdlcyA9IHN0cmVhbS0+
cGFnZXM7DQo+ICAgICA0ODMNCj4gICAgIDQ4NCAgICAgICAgICByZXQgPSB4ZW5fZnJvbnRfcGdk
aXJfc2hidWZfYWxsb2MoJmJ1Zl9jZmcpOw0KPiAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+IFRoaXMgaXMgd2hlcmUgInN0cmVh
bS0+c2hidWYuZGlyZWN0b3J5IiBpcyByZS1hbGxvY2F0ZWQgb24gdGhlIHN1Y2Nlc3MNCj4gcGF0
aC4NCj4NCj4gICAgIDQ4NSAgICAgICAgICBpZiAocmV0IDwgMCkNCj4gICAgIDQ4NiAgICAgICAg
ICAgICAgICAgIGdvdG8gZmFpbDsNCj4gICAgIDQ4Nw0KPiAgICAgNDg4ICAgICAgICAgIHJldCA9
IHhlbl9mcm9udF9wZ2Rpcl9zaGJ1Zl9tYXAoJnN0cmVhbS0+c2hidWYpOw0KPiAgICAgNDg5ICAg
ICAgICAgIGlmIChyZXQgPCAwKQ0KPiAgICAgNDkwICAgICAgICAgICAgICAgICAgZ290byBmYWls
Ow0KPiAgICAgNDkxDQo+ICAgICA0OTIgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICA0OTMNCj4g
ICAgIDQ5NCAgZmFpbDoNCj4gICAgIDQ5NSAgICAgICAgICBzdHJlYW1fZnJlZShzdHJlYW0pOw0K
PiAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+IERvdWJsZSBmcmVlLg0K
Pg0KPiAgICAgNDk2ICAgICAgICAgIGRldl9lcnIoJmZyb250X2luZm8tPnhiX2Rldi0+ZGV2LA0K
PiAgICAgNDk3ICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byBhbGxvY2F0ZSBidWZmZXJzIGZv
ciBzdHJlYW0gd2l0aCBpbmRleCAlZFxuIiwNCj4gICAgIDQ5OCAgICAgICAgICAgICAgICAgIHN0
cmVhbS0+aW5kZXgpOw0KPiAgICAgNDk5ICAgICAgICAgIHJldHVybiByZXQ7DQo+ICAgICA1MDAg
IH0NCj4NCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KDQpUaGFuayB5b3UgZm9yIHJlcG9y
dGluZyB0aGlzLA0KDQpJJ2xsIHRyeSB0byBsb29rIGF0IGl0IGNsb3NlbHkgYW5kIHByZXBhcmUg
YSBwYXRjaC4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

