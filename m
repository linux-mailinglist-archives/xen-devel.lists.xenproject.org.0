Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D792AF1B9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 14:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24775.52193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpt6-00018G-GL; Wed, 11 Nov 2020 13:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24775.52193; Wed, 11 Nov 2020 13:10:12 +0000
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
	id 1kcpt6-00017t-Cb; Wed, 11 Nov 2020 13:10:12 +0000
Received: by outflank-mailman (input) for mailman id 24775;
 Wed, 11 Nov 2020 13:10:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kcpt4-00017o-Kp
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:10:10 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cdbdfe3-7850-435b-8dd9-6bdfdd72e5a9;
 Wed, 11 Nov 2020 13:10:09 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABD51YV020758; Wed, 11 Nov 2020 13:10:03 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf8089t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 13:10:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6851.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 13:10:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 13:10:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kcpt4-00017o-Kp
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 13:10:10 +0000
X-Inumbo-ID: 8cdbdfe3-7850-435b-8dd9-6bdfdd72e5a9
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8cdbdfe3-7850-435b-8dd9-6bdfdd72e5a9;
	Wed, 11 Nov 2020 13:10:09 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ABD51YV020758;
	Wed, 11 Nov 2020 13:10:03 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf8089t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2020 13:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdKxhatwjQbcs4qJUfqhmBwy1QdRQvXCiAgEvYD2t9qumg9x5SU8odIB0DWwpX0z19rIKJwWBVrS7KGaXeZuSytBQTWwTgQvenVXAF+65fWl7EeaK25ESuVJNIQJAXz2EK3o/dbMTO2kjdaUc0GnATisQYy8nFGWPhv8hQHlefa4ftgZIFV1bJPnKrAueWfDxyUQ0mJStFBBT5h2NfuhhpHPzwc4nPuG8ddnziWRb/UfR75ebBRHlSHer9smPWFp0qGWSJzhf8gER7a284hes9aDTKL9NpTBQvhDRRdVekOO1uA8bp2UR5WUX772XoKuS76RyppSFjNJM2SXcBoPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIDlB9PJGPtCwbyk43lUH/M8WeJL4oZx74brkwSsy7s=;
 b=Mqp1Db4p0wBO8BIxb4hqCt0Jf+9BUYVgE6h1K6jDjYelbs3wyXkwP/pSmnvTBVvT1FeuEpqyuVAbLTeoAEh/1ix6FuU/cUAuje4+rDnj0Q1Ez7NNTAmFQdFSPpG3FcwZ27QzSZnIWgRnX0u8zFlAml/azfYX8CXu+E8saiI2zaczNJ+rBjmEjrx18AdiHk2wknUo8i99bvB9fIZWJRvIWR6l1frFvHEWr7qalOkeeLESfd9C78t4DuM+CYLX/JBb0rJOk52U/9SGhTWAWtFot1arC+XhX7hHPmWB1e57JNUO327KqTNS1IKc5EV6HxBzMEWF6hSRbm97Zh7zh/bLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIDlB9PJGPtCwbyk43lUH/M8WeJL4oZx74brkwSsy7s=;
 b=E32vrHc1NsBI8nPB3G8T0cKMvWCYxSj+dLI8F3Jk5Q36/3/v+Ne7pwTgTBr47IgfcxAibcfBhRuQ6l+YdQMRs1yMLvC2KVtAs+Wp/4lGXwajMSzn7G0NpTcW4cHYqF54tKFo/HlZ+g4kV36Rd2zuhC+Pm6CVjlPU+PzCBRaywbwfRQtz3SDmIhMVDmLxlPOdtyEn8X/uqOSf4/hDg86KEoLvxpiJOdJO1KTBYBz2hfSED3kCfGD42Fi+Of5ChPTDZqlxKEO3nkeXQL8LLxAibhuwzMX3wzSrLV99fdYphIQalA0ViqCoTLf40ZfTHjAQ2iprYDGRc5atpRZeH/e0BQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6851.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 13:10:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 13:10:01 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [SUSPECTED SPAM][PATCH 01/10] pci/pvh: Allow PCI toolstack code
 run with PVH domains on ARM
Thread-Topic: [SUSPECTED SPAM][PATCH 01/10] pci/pvh: Allow PCI toolstack code
 run with PVH domains on ARM
Thread-Index: AQHWtpbtW65RafIiXE60uDMyi8KYhqnC4BMAgAAKqgA=
Date: Wed, 11 Nov 2020 13:10:01 +0000
Message-ID: <57fefaee-9684-4c67-662e-f4c57313886e@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-2-andr2000@gmail.com>
 <20201111123150.7lkabdo3wix7jkdk@Air-de-Roger>
In-Reply-To: <20201111123150.7lkabdo3wix7jkdk@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d498b15a-0e77-4e9a-b5f6-08d8864318fa
x-ms-traffictypediagnostic: AM9PR03MB6851:
x-microsoft-antispam-prvs: 
 <AM9PR03MB6851069DCBF8751A2F4A2414E7E80@AM9PR03MB6851.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pWtFbRP7ZlntdVvSVjCIMPHCLUcltTZFE5u3TrphO8AsGXsAGs1ZEH17nBVZdC7CrCoSPZEukYTjdcZ17ZQW09O2vqQ+RCehxULjIhhk8L+gg6CgQGtkpFDy9TuBzimEuUIqizWG51ermSZYeX2vX6ZhvykcG131xrIC5KoxbyrQqEPss4JGSTbvQyjrpELuAeyyoa9aarVpbFQHODHNXX4qHjVeT1DdAQ84bj9qRcuqsY1zt9w90xZUHfXwXs4K/Uc9Morp3wZQYW7BZ42RZ67Q1BhNMGox+Q1maNg6TJSO3SFbD4awy3uJilNE6OROh36jvm+hcwkzkbMQcUO2N23j1oa9OdMUwyoin4Bnb3krnO9Ubr9b5S2BqMXTXEbCj75windFoyfyz5MAkizYhw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(66446008)(66476007)(86362001)(478600001)(31686004)(53546011)(2906002)(26005)(316002)(83380400001)(66946007)(36756003)(64756008)(6506007)(7416002)(4326008)(6512007)(8936002)(5660300002)(71200400001)(8676002)(76116006)(54906003)(2616005)(66556008)(91956017)(186003)(6486002)(6916009)(966005)(31696002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 3XlwRl8tQgjwPb2Wg/DARkWayD6AVuTSVwb3oCpgKaHUUZCjEybTCyZ0yyeZ8ugB8rHafYF8CnZ66QwVky1Cw0j5GUfETFuILIdQ6+UQwCAISMcXn7etEI9ErBI/VkA8S0L8ea4+ZOzWrpcznW8oDyV2O/rw0mlxhyOR7pByfErTbhwzeN/yNkOfCEGFo4kFAI4x/03o84FASS7C49EG66c8eUqc6I4SlzILrmNU0rMuJrVI746YCplCposXsZfvgda6Jdo0xEJ5UrIUUDziJiZbZRfGs2l1hPSni9c+a2c5fPmXcqjEdvWfHUh9WRsWVnh12ZlJdk6OKSyZEN0XcOv0vGOFwSk0CrzCKdlN+qAjHLOSkSRxIdow8l7r/jHi4OAwqD/5yFMJ3T3pJ1smT1UE6ODP/ugchdBz4o/Eu12lLnaZXpRmHbnWtqkAgdU5xZfFgjq8e9DYP5peuaCsqCgMuxYVMo6LB3yanyVVKXNqRcS+dmWC9s+S8TQGT+8iQLw6MKqJI2augNuq8XYR3b8QWrJ0NlNSlzW17l4WoI4fjbb8kzpGRDhLOO49sBzh3HaDT3O6RdpuHSOY+COktukgpu5U7l95lFQp1W2EmQtA6bSF72aSW2t32BH5hDxfJzwSYWkk4qaoql3zV16h/w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A68B4FC0FCBC424097840CFD1A57D24B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d498b15a-0e77-4e9a-b5f6-08d8864318fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 13:10:01.1306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TbpSoITRLHCdCkkYnhDBbGtxHMtGvinUF1scyb6GumoOMkpd5C+Yy8S8giebpFqYS/U/bTX25GX5KJqEoe62RwApXrXfWSLoOI776tXwOw1zGbcfLw3HF9IdfsXj+aWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6851
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_06:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110076

DQpPbiAxMS8xMS8yMCAyOjMxIFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IE5vdiAwOSwgMjAyMCBhdCAwMjo1MDoyMlBNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBBY2NvcmRpbmcgdG8gaHR0cHM6Ly93aWtpLnhl
bnByb2plY3Qub3JnL3dpa2kvTGludXhfUFZIOg0KPj4NCj4+IEl0ZW1zIG5vdCBzdXBwb3J0ZWQg
YnkgUFZIDQo+PiAgIC0gUENJIHBhc3MgdGhyb3VnaCAoYXMgb2YgWGVuIDQuMTApDQo+Pg0KPj4g
QWxsb3cgcnVubmluZyBQQ0kgcmVtb3ZlIGNvZGUgb24gQVJNIGFuZCBkbyBub3QgYXNzZXJ0IGZv
ciBQVkggZG9tYWlucy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiAtLS0NCj4+ICAgdG9v
bHMvbGlieGwvTWFrZWZpbGUgICAgfCA0ICsrKysNCj4+ICAgdG9vbHMvbGlieGwvbGlieGxfcGNp
LmMgfCA0ICsrKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvTWFrZWZpbGUgYi90b29s
cy9saWJ4bC9NYWtlZmlsZQ0KPj4gaW5kZXggMjQxZGE3ZmZmNmY0Li5mMzgwNmFhZmNiNGUgMTAw
NjQ0DQo+PiAtLS0gYS90b29scy9saWJ4bC9NYWtlZmlsZQ0KPj4gKysrIGIvdG9vbHMvbGlieGwv
TWFrZWZpbGUNCj4+IEBAIC0xMzAsNiArMTMwLDEwIEBAIGVuZGlmDQo+PiAgIA0KPj4gICBMSUJY
TF9MSUJTICs9IC1seWFqbA0KPj4gICANCj4+ICtpZmVxICgkKENPTkZJR19BUk0pLHkpDQo+PiAr
Q0ZBTEdTICs9IC1EQ09ORklHX0FSTQ0KPj4gK2VuZGlmDQo+PiArDQo+PiAgIExJQlhMX09CSlMg
PSBmbGV4YXJyYXkubyBsaWJ4bC5vIGxpYnhsX2NyZWF0ZS5vIGxpYnhsX2RtLm8gbGlieGxfcGNp
Lm8gXA0KPj4gICAJCQlsaWJ4bF9kb20ubyBsaWJ4bF9leGVjLm8gbGlieGxfeHNoZWxwLm8gbGli
eGxfZGV2aWNlLm8gXA0KPj4gICAJCQlsaWJ4bF9pbnRlcm5hbC5vIGxpYnhsX3V0aWxzLm8gbGli
eGxfdXVpZC5vIFwNCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9wY2kuYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX3BjaS5jDQo+PiBpbmRleCBiYzU4NDNiMTM3MDEuLmI5M2NmOTc2NjQy
YiAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jDQo+PiArKysgYi90b29s
cy9saWJ4bC9saWJ4bF9wY2kuYw0KPj4gQEAgLTE5MTUsOCArMTkxNSwxMCBAQCBzdGF0aWMgdm9p
ZCBkb19wY2lfcmVtb3ZlKGxpYnhsX19lZ2MgKmVnYywgdWludDMyX3QgZG9taWQsDQo+PiAgICAg
ICAgICAgICAgIGdvdG8gb3V0X2ZhaWw7DQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgfSBlbHNl
IHsNCj4+ICsgICAgICAgIC8qIFBDSSBwYXNzdGhyb3VnaCBjYW4gYWxzbyBydW4gb24gQVJNIFBW
SCAqLw0KPj4gKyNpZm5kZWYgQ09ORklHX0FSTQ0KPj4gICAgICAgICAgIGFzc2VydCh0eXBlID09
IExJQlhMX0RPTUFJTl9UWVBFX1BWKTsNCj4+IC0NCj4+ICsjZW5kaWYNCj4gSSB3b3VsZCBqdXN0
IHJlbW92ZSB0aGUgYXNzZXJ0IG5vdyBpZiB0aGlzIGlzIHRvIGJlIHVzZWQgYnkgQXJtIGFuZA0K
PiB5b3UgZG9uJ3QgbmVlZCB0byBmb3JrIHRoZSBmaWxlIGZvciBBcm0uDQoNClNvdW5kcyBnb29k
LCBJIHdpbGwgZHJvcCB0aGVuDQoNCkJ1dCB3aGF0IHdvdWxkIGJlIHRoZSByaWdodCBleHBsYW5h
dGlvbiB0aGVuPyBJIG1lYW4gd2h5IHRoZXJlIHdhcyBhbiBBU1NFUlQNCg0KYW5kIG5vdyBpdCBp
cyBzYWZlIChmb3IgeDg2KSB0byByZW1vdmUgdGhhdD8NCg0KPg0KPiBSb2dlci4NCg0KVGhhbmsg
eW91LA0KDQpPbGVrc2FuZHINCg==

