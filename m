Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897962B1D9F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26581.55049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdaJs-0003U5-Be; Fri, 13 Nov 2020 14:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26581.55049; Fri, 13 Nov 2020 14:44:56 +0000
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
	id 1kdaJs-0003Tf-8I; Fri, 13 Nov 2020 14:44:56 +0000
Received: by outflank-mailman (input) for mailman id 26581;
 Fri, 13 Nov 2020 14:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdaJq-0003Ta-PJ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:44:54 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24f7ee39-91c5-4c64-af4b-2bb0c7f0e12b;
 Fri, 13 Nov 2020 14:44:53 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADEdVdp031666; Fri, 13 Nov 2020 14:44:44 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80gf2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 14:44:44 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4455.eurprd03.prod.outlook.com (2603:10a6:20b:6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 14:44:37 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 14:44:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdaJq-0003Ta-PJ
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:44:54 +0000
X-Inumbo-ID: 24f7ee39-91c5-4c64-af4b-2bb0c7f0e12b
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 24f7ee39-91c5-4c64-af4b-2bb0c7f0e12b;
	Fri, 13 Nov 2020 14:44:53 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADEdVdp031666;
	Fri, 13 Nov 2020 14:44:44 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80gf2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 14:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGd0aPV2ssbZijkhZ17ix36yn/zvit3dkh+h8DMXeECmnBvjAaogWfdWwv/vfwU0Ho5BDB6iodiCVtB8YMXDZaaPOojy8bROCm0YdquNC7+ciNiALFU2dFSTn4te4Hdr/MnxuWFRta/TAdNisSDfeHTxoPMeB8nmz0kteGxjFf5bVSLbM8ZOFov2S6lG3wYTTJ7ysD6DYbmHKHLw8UM37Ht83AyWPa5QnStj1efA7Fe9Co7FHGBuKuOjxyt7kqPLY4umYkkd6KgqMJXr+089wu4Yv4QELR4hZxxzjF0PUhXJlRmxsRnDdHAX029rolJ+181umobwOSYaVNw5yQoFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//Pb7et+hrB3O4MpPjTBOlxfuZMFLE6UQeq4Idjerxw=;
 b=UJh4mMFOEtv+2z2h2uZlaRCJG8X6ivcUVYAPRYu4LGkijKxvO6RfFYiC7WPrNy5XD7tx6iG+8+r0s3Bnx2hdgGFakNdpPDfJjHHwAYFQfWxIcMnzn4lMilOHKlEtzBVMg+tDrhqOJLMQzNwWkrCf+vGY20L+ZSGyeON22iJ7eSCHYb/aLEmh7SqnzimWmVklz+xii702rnB0GpKKoFo/hYSdt0sYTPqbxqknsrtHSt/KXWWmeGZKHsvQ1BB6sPaidbYgbnIyodXP4mFyJy9LAxG/iIJwx0bxo0fwMJo8hyouyWWpIlWJ5GklTGnLHhKOylCP5nFzkC5FpQPWgVht9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//Pb7et+hrB3O4MpPjTBOlxfuZMFLE6UQeq4Idjerxw=;
 b=bTNgD0jjhxKihGlwlhBpMBO9kKc1IgesWkxcLciycW0ekC4647kOg7fLOxrEKlx579x8L08S0j2xG/Em/3u7h92VkNmZHD5L6zDvQIxJuIkmHIBOS12lEjMetrIZDrCFNqcoTVhyEQUTwNoFX8oP8OuMn1dPHObGybFT6Gy4EUZnHvaX48BUxll5gcV010tKHasV00yqx2MbrDFR2OZ0OqxUsvRkCRNxHGkm01Wn/ylF7U5IWMm79oEcbeIIfi7RQHKB97C7nHho2iumvBryhtoP7i+0Bd27JcVeMSNkxdJK8HgZ5h6HY4OCHTxoXAOeb81NbJFlJYVL393MTZIsYA==
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4455.eurprd03.prod.outlook.com (2603:10a6:20b:6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 14:44:37 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 14:44:37 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Topic: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Index: 
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgCAAAlOAIAAEnYAgAAcfoCAAAKRAIAAAYQAgAABxIA=
Date: Fri, 13 Nov 2020 14:44:37 +0000
Message-ID: <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
 <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
 <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
In-Reply-To: <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01e89503-2cec-49a9-a7f2-08d887e2a551
x-ms-traffictypediagnostic: AM6PR03MB4455:
x-microsoft-antispam-prvs: 
 <AM6PR03MB4455FEEE41EE2D3187AA495DE7E60@AM6PR03MB4455.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G+RSvHJrDIFqqvu9V32xiGifnElufPc3abk0QLikPr2+K0PNhEcBSzuheQ4CHFw0mH/05QQQjA2m3Wso8L3Ex3GPzjS/BwhBCZ/OHzt5f1VcjMnRcsIVkxATUJxHYGTlIoyfccAfUq8KmKSoAe3Z3gepkbzOLl5RPN/4x6McR8GG/NN7KP+ujb5yVBtfhkfOcs97oG8AsuPa9ueASiFzCOa31sc/+mzKr6bbgyYXXVyg4fY9gmcUvJ9HHlpsDVvZgDB4BRpGiiO63NOhzvDWqyzheSSkxgJb6wzIt8LWi5RY/ffuNj34MGh5POzh2AMfjYTfQpDD1ltyH7bReN+wYw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(2616005)(316002)(8936002)(71200400001)(64756008)(478600001)(8676002)(91956017)(2906002)(66446008)(6916009)(54906003)(5660300002)(66476007)(4326008)(7416002)(6512007)(76116006)(36756003)(31696002)(66946007)(31686004)(83380400001)(66556008)(86362001)(6506007)(53546011)(186003)(26005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 L2ix6Lf2+2lBH6vc8DqwLTOq43mzvtUkBnUEaauHP38BeKebVKJUFvIzbmBFrJhxfzRA2O38upIZRqSzhH3BSXpT79rmJ0mt7ZkaiwKOWrd+gEfzMTH2tGYMndo4hbBEmMZmkI1ySlek8pXz+HgwzNvIPJxSGueknyx1rZjvwN5MeXuOjsZ2TWcIyofdW1nGphqzhIt1GWCtqiMrB5FuZvTyKXE+hQEwAPyaZkkl6XpdS3ECsVxTz/XSOYULVWIIDG9UMqhmOm7D0xbOva6Jij2a5L/SvWkNJA4inOExrr72oYq+9p8fBxaDiECcsnuOiuAYe/L9IjrAen0pMryaM5zoh19HQ/+6AFT0qlcpyeJyUmSZvQMWglTqcKIq+j2Df1TrIkJlci52pMYq4fu+u7wr0uN5DWI7RwoXDFmR5L/bbiTaxcGOsOVZDkKRGvGXeJGyD01+bMVJqe+YIw7v8I8wQSiyETyv9IvSp0PUY5D27TPmSrZFPBvsqirTnQhbKu2WmWEb8MrIt/0jxeBmtdP0GtmgisJwU52fsPe+4rq/yQED3jxwJkSPDfVB7D7i8pRj/qPQJ+x8uneO320Xn0SPe8o/GtdX++0ucOloM+3Nuanpli3FMNav7mWeCdL9pZXj6ibNMh0Weoa5DPsWoA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <207339E9C85A12479BD223E744C137A2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e89503-2cec-49a9-a7f2-08d887e2a551
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 14:44:37.8437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xv0VDUfpzkY6RfpplHXgfwT9ukUjgVavV0QJv0Pt7sHOICxk4Q8UllvjymlD2GhDg/GEXZM4VA0sH4vrdJDSFBgQS8SprWJsNj0T7v44Lde1rfZyE5mx0Q4qFGlK8W8l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4455
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_10:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130092

DQpPbiAxMS8xMy8yMCA0OjM4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMTEuMjAy
MCAxNTozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMS8xMy8yMCA0
OjIzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMy4xMS4yMDIwIDEzOjQxLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTEvMTMvMjAgMTozNSBQTSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxMy4xMS4yMDIwIDEyOjAyLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxMS8xMy8yMCAxMjo1MCBQTSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDEzLjExLjIwMjAgMTE6NDYsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMTEvMTMvMjAgMTI6MjUgUE0sIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIDEzLjExLjIwMjAgMDc6MzIsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4+PiBJJ2xsIHRyeSB0byByZXBsYWNlIGlzX2hhcmR3YXJl
X2RvbWFpbiB3aXRoIHNvbWV0aGluZyBsaWtlOg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiArLyoN
Cj4+Pj4+Pj4+Pj4gKyAqIERldGVjdCB3aGV0aGVyIHBoeXNpY2FsIFBDSSBkZXZpY2VzIGluIHRo
aXMgc2VnbWVudCBiZWxvbmcNCj4+Pj4+Pj4+Pj4gKyAqIHRvIHRoZSBkb21haW4gZ2l2ZW4sIGUu
Zy4gb24geDg2IGFsbCBQQ0kgZGV2aWNlcyBsaXZlIGluIGh3ZG9tLA0KPj4+Pj4+Pj4+PiArICog
YnV0IGluIGNhc2Ugb2YgQVJNIHRoaXMgbWlnaHQgbm90IGJlIHRoZSBjYXNlOiB0aG9zZSBtYXkg
YWxzbw0KPj4+Pj4+Pj4+PiArICogbGl2ZSBpbiBkcml2ZXIgZG9tYWlucyBvciBldmVuIFhlbiBp
dHNlbGYuDQo+Pj4+Pj4+Pj4+ICsgKi8NCj4+Pj4+Pj4+Pj4gK2Jvb2wgcGNpX2lzX2hhcmR3YXJl
X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnKQ0KPj4+Pj4+Pj4+PiArew0KPj4+Pj4+
Pj4+PiArI2lmZGVmIENPTkZJR19YODYNCj4+Pj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gaXNfaGFy
ZHdhcmVfZG9tYWluKGQpOw0KPj4+Pj4+Pj4+PiArI2VsaWYgQ09ORklHX0FSTQ0KPj4+Pj4+Pj4+
PiArwqDCoMKgIHJldHVybiBwY2lfaXNfb3duZXJfZG9tYWluKGQsIHNlZyk7DQo+Pj4+Pj4+Pj4+
ICsjZWxzZQ0KPj4+Pj4+Pj4+PiArI2Vycm9yICJVbnN1cHBvcnRlZCBhcmNoaXRlY3R1cmUiDQo+
Pj4+Pj4+Pj4+ICsjZW5kaWYNCj4+Pj4+Pj4+Pj4gK30NCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+
PiArLyoNCj4+Pj4+Pj4+Pj4gKyAqIEdldCBkb21haW4gd2hpY2ggb3ducyB0aGlzIHNlZ21lbnQ6
IGZvciB4ODYgdGhpcyBpcyBhbHdheXMgaGFyZHdhcmUNCj4+Pj4+Pj4+Pj4gKyAqIGRvbWFpbiBh
bmQgZm9yIEFSTSB0aGlzIGNhbiBiZSBkaWZmZXJlbnQuDQo+Pj4+Pj4+Pj4+ICsgKi8NCj4+Pj4+
Pj4+Pj4gK3N0cnVjdCBkb21haW4gKnBjaV9nZXRfaGFyZHdhcmVfZG9tYWluKHUxNiBzZWcpDQo+
Pj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX1g4Ng0KPj4+Pj4+Pj4+PiAr
wqDCoMKgIHJldHVybiBoYXJkd2FyZV9kb21haW47DQo+Pj4+Pj4+Pj4+ICsjZWxpZiBDT05GSUdf
QVJNDQo+Pj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIHBjaV9nZXRfb3duZXJfZG9tYWluKHNlZyk7
DQo+Pj4+Pj4+Pj4+ICsjZWxzZQ0KPj4+Pj4+Pj4+PiArI2Vycm9yICJVbnN1cHBvcnRlZCBhcmNo
aXRlY3R1cmUiDQo+Pj4+Pj4+Pj4+ICsjZW5kaWYNCj4+Pj4+Pj4+Pj4gK30NCj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4gVGhpcyBpcyB3aGF0IEkgdXNlIHRvIHByb3Blcmx5IGRldGVjdCB0aGUgZG9t
YWluIHRoYXQgcmVhbGx5IG93bnMgcGh5c2ljYWwgaG9zdCBicmlkZ2UNCj4+Pj4+Pj4+PiBJIGNv
bnNpZGVyIHRoaXMgcHJvYmxlbWF0aWMuIFdlIHNob3VsZCB0cnkgdG8gbm90IGxldCBBcm0ncyBh
bmQgeDg2J2VzDQo+Pj4+Pj4+Pj4gUENJIGltcGxlbWVudGF0aW9ucyBkaXZlcmdlIHRvbyBtdWNo
LCBpLmUuIGF0IGxlYXN0IHRoZSB1bmRlcmx5aW5nIGJhc2ljDQo+Pj4+Pj4+Pj4gbW9kZWwgd291
bGQgYmV0dGVyIGJlIHNpbWlsYXIuIEZvciBleGFtcGxlLCBpZiBlbnRpcmUgc2VnbWVudHMgY2Fu
IGJlDQo+Pj4+Pj4+Pj4gYXNzaWduZWQgdG8gYSBkcml2ZXIgZG9tYWluIG9uIEFybSwgd2h5IHNo
b3VsZCB0aGUgc2FtZSBub3QgYmUgcG9zc2libGUNCj4+Pj4+Pj4+PiBvbiB4ODY/DQo+Pj4+Pj4+
PiBHb29kIHF1ZXN0aW9uLCBwcm9iYWJseSBpbiB0aGlzIGNhc2UgeDg2ID09IEFSTSBhbmQgSSBj
YW4gdXNlDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gcGNpX2lzX293bmVyX2RvbWFpbiBmb3IgYm90aCBh
cmNoaXRlY3R1cmVzIGluc3RlYWQgb2YgdXNpbmcgaXNfaGFyZHdhcmVfZG9tYWluIGZvciB4ODYN
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gRnVydGhlcm1vcmUgSSdtIHN1c3BpY2lvdXMgYWJvdXQgc2Vn
bWVudHMgYmVpbmcgdGhlIHJpZ2h0IGdyYW51bGFyaXR5DQo+Pj4+Pj4+Pj4gaGVyZS4gT24gaWE2
NCBtdWx0aXBsZSBob3N0IGJyaWRnZXMgY291bGQgKGFuZCB0eXBpY2FsbHkgd291bGQpIGxpdmUN
Cj4+Pj4+Pj4+PiBvbiBzZWdtZW50IDAuIElpcmMgSSBoYWQgb25jZSBzZWVuIG91dHB1dCBmcm9t
IGFuIHg4NiBzeXN0ZW0gd2hpY2ggd2FzDQo+Pj4+Pj4+Pj4gYXBwYXJlbnRseSBsYWlkIG91dCBz
aW1pbGFybHkuIFRoZXJlZm9yZSwganVzdCBsaWtlIGZvciBNQ0ZHLCBJIHRoaW5rDQo+Pj4+Pj4+
Pj4gdGhlIGdyYW51bGFyaXR5IHdhbnRzIHRvIGJlIGJ1cyByYW5nZXMgd2l0aGluIGEgc2VnbWVu
dC4NCj4+Pj4+Pj4+IENhbiB5b3UgcGxlYXNlIHN1Z2dlc3Qgc29tZXRoaW5nIHdlIGNhbiB1c2Ug
YXMgYSBoaW50IGZvciBzdWNoIGEgZGV0ZWN0aW9uIGxvZ2ljPw0KPj4+Pj4+PiBUaGUgdW5kZXJs
eWluZyBpbmZvcm1hdGlvbiBjb21lcyBmcm9tIEFDUEkgdGFibGVzLCBpaXJjLiBJIGRvbid0DQo+
Pj4+Pj4+IHJlY2FsbCB0aGUgZGV0YWlscywgdGhvdWdoIC0gc29ycnkuDQo+Pj4+Pj4gT2ssIHNv
IHNlZyArIGJ1cyBzaG91bGQgYmUgZW5vdWdoIGZvciBib3RoIEFSTSBhbmQgWGVuIHRoZW4sIHJp
Z2h0Pw0KPj4+Pj4+DQo+Pj4+Pj4gcGNpX2dldF9oYXJkd2FyZV9kb21haW4odTE2IHNlZywgdTgg
YnVzKQ0KPj4+Pj4gV2hldGhlciBhbiBpbmRpdmlkdWFsIGJ1cyBudW1iZXIgY2FuIHN1aXRhYmxl
IGV4cHJlc3MgdGhpbmdzIEkgY2FuJ3QNCj4+Pj4+IHRlbGw7IEkgZGlkIHNheSBidXMgcmFuZ2Us
IGJ1dCBvZiBjb3Vyc2UgaWYgeW91IGNhcmUgYWJvdXQganVzdA0KPj4+Pj4gaW5kaXZpZHVhbCBk
ZXZpY2VzLCB0aGVuIGEgc2luZ2xlIGJ1cyBudW1iZXIgd2lsbCBvZiBjb3Vyc2UgZG8uDQo+Pj4+
IEkgY2FuIGltcGxlbWVudCB0aGUgbG9va3VwIHdoZXRoZXIgYSBQQ0kgaG9zdCBicmlkZ2Ugb3du
ZWQgYnkgYSBwYXJ0aWN1bGFyDQo+Pj4+DQo+Pj4+IGRvbWFpbiB3aXRoIHNvbWV0aGluZyBsaWtl
Og0KPj4+Pg0KPj4+PiBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UgPSBwY2lfZmluZF9o
b3N0X2JyaWRnZShzZWcsIGJ1cyk7DQo+Pj4+DQo+Pj4+IHJldHVybiBicmlkZ2UtPmR0X25vZGUt
PnVzZWRfYnkgPT0gZC0+ZG9tYWluX2lkOw0KPj4+Pg0KPj4+PiBDb3VsZCB5b3UgcGxlYXNlIGdp
dmUgbWUgYSBoaW50IGhvdyB0aGlzIGNhbiBiZSBkb25lIG9uIHg4Nj8NCj4+PiBCcmlkZ2VzIGNh
bid0IGJlIGFzc2lnbmVkIHRvIG90aGVyIHRoYW4gdGhlIGhhcmR3YXJlIGRvbWFpbiByaWdodA0K
Pj4+IG5vdy4NCj4+IFNvLCBJIGNhbiBwcm9iYWJseSB0aGVuIGhhdmUgcGNpX2dldF9oYXJkd2Fy
ZV9kb21haW4gaW1wbGVtZW50ZWQNCj4+DQo+PiBieSBib3RoIEFSTSBhbmQgeDg2IGluIHRoZWly
IGFyY2ggc3BlY2lmaWMgY29kZS4gQW5kIGZvciB4ODYgZm9yIG5vdw0KPj4NCj4+IGl0IGNhbiBz
aW1wbHkgYmUgYSB3cmFwcGVyIGZvciBpc19oYXJkd2FyZV9kb21haW4/DQo+ICJnZXQiIGNhbid0
IGJlIGEgd3JhcHBlciBmb3IgImlzIg0KU3VyZSwgcy9nZXQvaXMNCj4gLCBidXQgSSB0aGluayBJ
IGdldCB3aGF0IHlvdSdyZQ0KPiBzYXlpbmcuIEJ1dCBubywgcHJlZmVyYWJseSBJIHdvdWxkIG5v
dCBzZWUgeW91IGRvIHRoaXMgKGhlbmNlIG15DQo+IGVhcmxpZXIgY29tbWVudCkuIEkgc3RpbGwg
dGhpbmsgeW91IGNvdWxkIHVzZSB0aGUgb3duZXIgb2YgdGhlDQo+IHJlc3BlY3RpdmUgZGV2aWNl
OyBJIG1heSBiZSBtaXN0YWtlbiwgYnV0IGlpcmMgd2UgZG8gYXNzaWduDQo+IGJyaWRnZXMgdG8g
RG9tMCwgc28gZGVyaXZpbmcgZnJvbSB0aGF0IHdvdWxkIGJlIGJldHRlciB0aGFuDQo+IGhhcmR3
aXJpbmcgdG8gaXNfaGFyZHdhcmVfZG9tYWluKCkuDQpPaywgSSdsbCB0cnkgdG8gZmlndXJlIG91
dCBob3cgdG8gZG8gdGhhdA0KPg0KPj4+ICAgIEVhcmxpZXIgb24gSSBkaWRuJ3Qgc2F5IHlvdSBz
aG91bGQgZ2V0IHRoaXMgdG8gd29yaywgb25seQ0KPj4+IHRoYXQgSSB0aGluayB0aGUgZ2VuZXJh
bCBsb2dpYyBhcm91bmQgd2hhdCB5b3UgYWRkIHNob3VsZG4ndCBtYWtlDQo+Pj4gdGhpbmdzIG1v
cmUgYXJjaCBzcGVjaWZpYyB0aGFuIHRoZXkgcmVhbGx5IHNob3VsZCBiZS4gVGhhdCBzYWlkLA0K
Pj4+IHNvbWV0aGluZyBzaW1pbGFyIHRvIHRoZSBhYm92ZSBzaG91bGQgc3RpbGwgYmUgZG9hYmxl
IG9uIHg4NiwNCj4+PiB1dGlsaXppbmcgc3RydWN0IHBjaV9zZWcncyBidXMyYnJpZGdlW10uIFRo
ZXJlIG91Z2h0IHRvIGJlDQo+Pj4gREVWX1RZUEVfUENJX0hPU1RfQlJJREdFIGVudHJpZXMgdGhl
cmUsIGFsYmVpdCBhIG51bWJlciBvZiB0aGVtDQo+Pj4gKHByb3ZpZGVkIGJ5IHRoZSBDUFVzIHRo
ZW1zZWx2ZXMgcmF0aGVyIHRoYW4gdGhlIGNoaXBzZXQpIGFyZW4ndA0KPj4+IHJlYWxseSBob3N0
IGJyaWRnZXMgZm9yIHRoZSBwdXJwb3NlcyB5b3UncmUgYWZ0ZXIuDQo+PiBZb3UgbWVhbiBJIGNh
biBzdGlsbCB1c2UgREVWX1RZUEVfUENJX0hPU1RfQlJJREdFIGFzIGEgbWFya2VyDQo+Pg0KPj4g
d2hpbGUgdHJ5aW5nIHRvIGRldGVjdCB3aGF0IEkgbmVlZD8NCj4gSSdtIGFmcmFpZCBJIGRvbid0
IHVuZGVyc3RhbmQgd2hhdCBtYXJrZXIgeW91J3JlIHRoaW5raW5nIGFib3V0DQo+IGhlcmUuDQoN
CkkgbWVhbiB0aGF0IHdoZW4gSSBnbyBvdmVyIGJ1czJicmlkZ2UgZW50cmllcywgc2hvdWxkIEkg
b25seSB3b3JrIHdpdGgNCg0KdGhvc2Ugd2hvIGhhdmUgREVWX1RZUEVfUENJX0hPU1RfQlJJREdF
Pw0KDQo+DQo+IEphbg==

