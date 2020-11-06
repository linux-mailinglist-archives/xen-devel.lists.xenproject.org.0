Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D902A978B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 15:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20832.46864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2ds-0003fL-Dw; Fri, 06 Nov 2020 14:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20832.46864; Fri, 06 Nov 2020 14:23:04 +0000
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
	id 1kb2ds-0003ev-AL; Fri, 06 Nov 2020 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 20832;
 Fri, 06 Nov 2020 14:23:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqUO=EM=epam.com=prvs=9579144100=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kb2dr-0003eq-0V
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:23:03 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03e3aea9-09c6-4fab-ad29-38d5ee8443a3;
 Fri, 06 Nov 2020 14:23:01 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6EMKjg027857; Fri, 6 Nov 2020 14:22:56 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 34kc4uspt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 14:22:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4019.eurprd03.prod.outlook.com (2603:10a6:208:7b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 14:22:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 14:22:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BqUO=EM=epam.com=prvs=9579144100=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kb2dr-0003eq-0V
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:23:03 +0000
X-Inumbo-ID: 03e3aea9-09c6-4fab-ad29-38d5ee8443a3
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 03e3aea9-09c6-4fab-ad29-38d5ee8443a3;
	Fri, 06 Nov 2020 14:23:01 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A6EMKjg027857;
	Fri, 6 Nov 2020 14:22:56 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
	by mx0a-0039f301.pphosted.com with ESMTP id 34kc4uspt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2020 14:22:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ6dKe1VpuTJQokPTCDut2boh/ph5u/QXKFVxo6TPraCK95Csdca5AztNb4BdFxsMssV+4uk9nPey4OP93CE50CPWGZ7nkjv29VxpB72r2zt6wNG3m8yypkjwocuzwmfyDkfV4tNd9R4961+oNVk87pIjc91oebrfpXzwQYoerA3T6mS15q//Us2DjwrJo4Ob86e5etiDRu7vktJPuh2myNx2MKBuXnzftOyJKa448KJjwYM+1MM/UPaCmNBuQYxNahseUBNSYNO7FwBxqcV1Dea1C8RfkzYph0IXqSwwCsit5YICXFIVB5ToYgTKBkIAlkIFhvYLSFZ6T59KpE/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sOSLbgi+cq7B8/Xa791BEnTwhGiuy34F6AyaYsVc7E=;
 b=jwoLPbEbTlu51BamSj18a1TnUIl/saamN8H87EnV+K+tQeyhFbh+HgXj73AV4t1AlZsJMc0LHPYUbq5M4kTvUs6tyu8OeSFM+kV3NF2mciae1JUOgf/rh/O6MnOi7n7qlKxYHySp8lDQMAi8ZFBJUCabtuMs5AOPoExo+xJ4iDdMRuL7iaw/jVQsgDjj1ojrfYc6GYe9rfC+UndtDqVVrxCaArWAiSGh0oT7j+tbW4vtkGNxj67UaoyhvxITPfSlrMbrFxUoskQH23v3Xq1/wmH6jD+RSpf8dwG/0ZjXWdqRK3bbGzQEVxV1638vjWEhbjdme1+Q7tel1S3My10Mog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sOSLbgi+cq7B8/Xa791BEnTwhGiuy34F6AyaYsVc7E=;
 b=Nf7LBG5k49OzVfAGa6XGaRCydA/btLCJyl4YEd9v89YYYUpCc0U2bP7+eWpaa5qartwoslEWPppvf2n9kN6+d72DU6F8/zciqldDcLxnrjJTGAvIRYMLSZtSCZ548Mvl+mITjhG2N0Is1nJ31EC7tP+65Ye4Y+aHlcMT4kGgshwANvom8wd2RTGCoWEQRs4dCGzjfSHwCJnJe749dMPYD/q1DhMJkCH1TkMjr0f5ro+YR7Tzvz768xvm6FTcf1Cwl6tfOPvpzT1O7k+KnY9nJ/31smUt2UbYDfYISD12BBI3MrPsdug9s5VVuHScpVgGzE/yQyoupg2aS/0JCFpjdA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4019.eurprd03.prod.outlook.com (2603:10a6:208:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 14:22:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 14:22:52 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index: 
 AQHWrqmeCV4SGlhADU2GY14D47cn76mwZCkAgAP4JoCAAELzAIAABK0AgAZ074CAAAOBgIAAEDeAgAAGtIA=
Date: Fri, 6 Nov 2020 14:22:52 +0000
Message-ID: <d2eb2db3-7038-3850-310b-4676102e0a55@epam.com>
References: 
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
 <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
 <5F09F481-DC27-4FC3-8CE5-F4F97FDF6DF9@arm.com>
 <2f62f34b-f47d-3472-511f-a89ec1cd36c3@epam.com>
 <20FF6A26-41CF-4888-901A-0FF0ABCC6E64@arm.com>
In-Reply-To: <20FF6A26-41CF-4888-901A-0FF0ABCC6E64@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3bce93c-04db-48ca-83ef-08d8825f7240
x-ms-traffictypediagnostic: AM0PR03MB4019:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB401912A80304BDA9CE0AD6E8E7ED0@AM0PR03MB4019.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qsd25G5nLkFkU1ATfscr1tZE/Jsdpq2oTq5suNvZkjX3Rt9U6Pvm06DxuIO+Pw9nsI0pB+hgaSAqmdYBDayqz/BaM0Hkd9e2E5E9biLWcmx+1Jm8e02tACdtYWNuc/n46pbfEkckBJxGCBi4OVtGfMkVHOLyu1YBkqmzMUVhbTxpAF0/QSrdXYVUp9B/RnTLIwybIWwEmF/sEJk5vYoUop235k2QZbcUojOniFmlFBGYa+3AH2rCw2alYzP9wiKyMnGVTwlbApJ3kU+CKiq9b/e93znigeJLqvWmjHIQQbjnQkU4XDWPpr+vzvknSurPjG70pZyd5mz/dpQGNCDKNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(8676002)(4326008)(8936002)(107886003)(54906003)(2906002)(6512007)(2616005)(76116006)(66446008)(36756003)(66946007)(86362001)(5660300002)(66476007)(31686004)(71200400001)(91956017)(26005)(186003)(66556008)(6916009)(6486002)(53546011)(6506007)(64756008)(31696002)(83380400001)(316002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 sqDz/k8VAArfIUk+n65EgNw8UT6mdfKaJ2Whuv4d3UsfhKKIcWg4hV+qnypiDRDwUoRECc7e6uAVLa//mbW9WMT8IkwFovrkX4ENPwkxTKiQHO2yLCXScuMkhhRpNP5mP+67R5dLB+U1ShF63RdnIQFr/mt7yt09OMltvn04+J14a2F8e6ZLFTeAGOUgzszMwxU0h8R0tEDk77LW+HcE223eb3kPFfdD0krPrWlE3HXijCIAfLAfkA4Gmwe8ZhjfYu0F+ShsTyAYbmsH+gDvzclpooDaiN4M+Yzn1wBdbJ8/9KSoGxVbogN5XLjEWbtYwc0sU8NL/zwg7pUi46R8L3q+nE9BTwqD0pPZVTMGkg7C+nPwonsf8nf9/ICOqLZbcadWNPNV9g0MFBrXGaN/wLfluU3A5Z38nFRTVTU5m5wsSHwf+MZ+uUBea34J+0caJQ7+td2MXTvYQi5tqAasZfpm89rTLmb2QUibJoodSKYZrkeA86QGVXjrdJnZyyzSN5ViLHS8oOWEh0/OhRg39DvAalQC+iWmUz6zkkYixvmg6YfxEIBTm1zhzOVtORW61T1MyDgcX2ONjVpjUq0tU2+Xiq99sHc2KG0vQUuJ+q0rvato7TMvZXfiuauvx7/oV/JoR4JOBnShsBiDAyMl3g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B88B0A06719AE4FA7BE4EDAD4069E09@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bce93c-04db-48ca-83ef-08d8825f7240
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 14:22:52.2015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5EqoGLzuTgvKiucqkdoOhRqglAENGZbQ5MclIQAkP/yt5yoPpL6SC8CGDex4q2NMXPbgyf5oCBCrzIaAU+Bz7rDDloTHwURFGKWK8m228WP+FoG97piTPWRm06OJ2WRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4019
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_06:2020-11-05,2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060102

SGksIFJhaHVsIQ0KDQpPbiAxMS82LzIwIDM6NTggUE0sIFJhaHVsIFNpbmdoIHdyb3RlOg0KPiBI
ZWxsbyBPbGVrc2FuZHIsDQo+DQo+PiBPbiA2IE5vdiAyMDIwLCBhdCAxOjAwIHBtLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+IHdyb3Rl
Og0KPj4NCj4+IEhlbGxvLCBSYWh1bCENCj4+DQo+PiBPbiAxMS82LzIwIDI6NDggUE0sIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4+IEhlbGxvIE9sZWtzYW5kciwNCj4+Pg0KPj4+PiBPbiAyIE5vdiAy
MDIwLCBhdCAxMDoxMiBhbSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPE9sZWtzYW5kcl9BbmRy
dXNoY2hlbmtvQGVwYW0uY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gSGksDQo+Pj4+DQo+Pj4+IE9u
IDExLzIvMjAgMTE6NTUgQU0sIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBIaSwNCj4+
Pj4+DQo+Pj4+Pj4gT24gMiBOb3YgMjAyMCwgYXQgMDU6NTUsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxhbmRyMjAwMEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4+DQo+Pj4+Pj4gSGksIEp1bGll
biENCj4+Pj4+Pg0KPj4+Pj4+IE9uIDEwLzMwLzIwIDc6MTggUE0sIEp1bGllbiBHcmFsbCB3cm90
ZToNCj4+Pj4+Pj4gSGkgT2xla3NhbmRyLA0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiAzMC8xMC8yMDIw
IDEwOjQ0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+IE9uIDEwLzIw
LzIwIDY6MjUgUE0sIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4+IEFkZCBzdXBwb3J0IGZv
ciBBUk0gYXJjaGl0ZWN0ZWQgU01NVXYzIGltcGxlbWVudGF0aW9ucy4gSXQgaXMgYmFzZWQgb24N
Cj4+Pj4+Pj4+PiB0aGUgTGludXggU01NVXYzIGRyaXZlci4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+
IE1ham9yIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIExpbnV4IGRyaXZlciBhcmUgYXMgZm9sbG93
czoNCj4+Pj4+Pj4+PiAxLiBPbmx5IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMgc3VwcG9ydGVkIGFz
IGNvbXBhcmVkIHRvIHRoZSBMaW51eCBkcml2ZXINCj4+Pj4+Pj4+PiAgICAgICB0aGF0IHN1cHBv
cnRzIGJvdGggU3RhZ2UtMSBhbmQgU3RhZ2UtMiB0cmFuc2xhdGlvbnMuDQo+Pj4+Pj4+PiBGaXJz
dCBvZiBhbGwgdGhhbmsgeW91IGZvciB0aGUgZWZmb3J0cyENCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJ
IHRyaWVkIHRoZSBwYXRjaCB3aXRoIFFFTVUgYW5kIHdvdWxkIGxpa2UgdG8ga25vdyBpZiBteSB1
bmRlcnN0YW5kaW5nIGNvcnJlY3QNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiB0aGF0IHRoaXMgY29tYmlu
YXRpb24gd2lsbCBub3Qgd29yayBhcyBvZiBub3c6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gKFhFTikg
U01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IFNNTVV2MzogRFQgdmFsdWUgPSBldmVudHENCj4+Pj4+
Pj4+IChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHgxOTQwMDEwDQo+Pj4+Pj4+PiAo
WEVOKSBXYWxraW5nIEh5cGVydmlzb3IgVkEgMHg0MDAzMTAwMCBvbiBDUFUwIHZpYSBUVEJSIDB4
MDAwMDAwMDBiODQ2OTAwMA0KPj4+Pj4+Pj4gKFhFTikgMFRIWzB4MF0gPSAweDAwMDAwMDAwYjg0
NjhmN2YNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBbc25pcF0NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJZiB0
aGlzIGlzIGV4cGVjdGVkIHRoZW4gaXMgdGhlcmUgYW55IHBsYW4gdG8gbWFrZSBRRU1VIHdvcmsg
YXMgd2VsbD8NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJIHNlZSBbMV0gc2F5cyB0aGF0ICJPbmx5IHN0
YWdlIDEgYW5kIEFBcmNoNjQgUFRXIGFyZSBzdXBwb3J0ZWQuIiBvbiBRRU1VIHNpZGUuDQo+Pj4+
Pj4+IEp1c3QgZm9yIGNsYXJpY2F0aW9uLCB5b3UgYXJlIHRyeWluZyB0byBib290IFhlbiBvbiBR
RU1VLCByaWdodD8NCj4+Pj4+PiBFeGFjdGx5DQo+Pj4+Pj4+IFlvdSBtaWdodCBiZSBhYmxlIHRv
IHVzZSB0aGUgc3RhZ2UtMSBwYWdlLXRhYmxlcyB0byBpc29sYXRlIGVhY2ggZGV2aWNlIGluIFhl
bi4gSG93ZXZlciwgSSBkb24ndCB0aGluayB5b3Ugd2lsbCBiZSBhYmxlIHRvIHNoYXJlIHRoZSBQ
Mk0gYmVjYXVzZSB0aGUgcGFnZS10YWJsZXMgbGF5b3V0IGJldHdlZW4gc3RhZ2UtMSBhbmQgc3Rh
Z2UtMiBpcyBkaWZmZXJlbnQuDQo+Pj4+Pj4gU28sIGl0IGlzIGV2ZW4gbW9yZSB3b3JrIHRoZW4N
Cj4+Pj4+IE92ZXJhbGwgaXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHNwZW5kIHNvbWUgdGlt
ZSBhZGRpbmcgcHJvcGVyIHN1cHBvcnQgaW4gUWVtdSB0aGVuIHRyeWluZyB0byBtb2RpZnkgdGhl
IGRyaXZlciB0byBzdXBwb3J0IFFlbXUgcmlnaHQgbm93Lg0KPj4+Pj4NCj4+Pj4+Pj4+IFdlIGFy
ZSBpbnRlcmVzdGVkIGluIFFFTVUvU01NVXYzIGFzIGEgZmxleGlibGUgcGxhdGZvcm0gZm9yIFBD
SSBwYXNzdGhyb3VnaA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGltcGxlbWVudGF0aW9uLCBzbyBpdCBj
b3VsZCBhbGxvdyB0ZXN0aW5nIGRpZmZlcmVudCBzZXR1cHMgYW5kIGNvbmZpZ3VyYXRpb25zIHdp
dGggUUVNVS4NCj4+Pj4+Pj4gSSB3b3VsZCByZWNvbW1lbmQgdG8gZ2V0IHRoZSBTTU1VIHN1cHBv
cnRpbmcgc3VwcG9ydGluZyBzdGFnZS0yIHBhZ2UtdGFibGVzLg0KPj4+Pj4+IFlvdSBtZWFuIGlu
IFFFTVU/DQo+Pj4+PiBTZWUgYmVmb3JlLg0KPj4+Pj4NCj4+Pj4+Pj4gUmVnYXJkbGVzcyB0aGF0
LCBJIHRoaW5rIFhlbiBzaG91bGQgYmUgYWJsZSB0byBzYXkgdGhlIFNNTVUgaXMgbm90IHN1cHBv
cnRlZCByYXRoZXIgdGhhbiBjcmFzaGluZy4NCj4+Pj4+PiBZZXMsIHRoYXQgd291bGQgYmUgbmlj
ZQ0KPj4+Pj4gRnVsbHkgYWdyZWUgYW5kIHdlIHdpbGwgbG9vayBpbnRvIHRoYXQuDQo+Pj4+Pg0K
Pj4+Pj4gQW55dGhpbmcgeW91IGNvdWxkIHNoYXJlIHNvIHRoYXQgd2UgY291bGQgcXVpY2tseSBy
ZXByb2R1Y2UgeW91ciBzZXR1cCB3b3VsZCBiZSBtb3JlIHRoZW4gZ3JlYXQuDQo+Pj4+IE5vdGhp
bmcgc3BlY2lhbCwNCj4+Pj4NCj4+Pj4gcWVtdS9hYXJjaDY0LXNvZnRtbXUvcWVtdS1zeXN0ZW0t
YWFyY2g2NCAtbWFjaGluZSB0eXBlPXZpcnQgLW1hY2hpbmUgdmlydCxnaWMtdmVyc2lvbj0yIFwN
Cj4+Pj4NCj4+Pj4gLW1hY2hpbmUgdmlydHVhbGl6YXRpb249dHJ1ZSAtY3B1IGNvcnRleC1hNTcg
LXNtcCA0IC1tIDIwNDggLW5pYyB1c2VyLGhvc3Rmd2Q9dGNwOjEyNy4wLjAuMToyMjIyLToyMiBc
DQo+Pj4+DQo+Pj4+IC1ub2dyYXBoaWMgLXNlcmlhbCBtb246c3RkaW8gWy4uc25pcC4uXQ0KPj4+
Pg0KPj4+PiBJIGFsc28gc2V0IGlvbW11IHRvIHNtbXV2MyBpbiBteSB0ZXN0cywgUUVNVSBlbXVs
YXRvciB2ZXJzaW9uIDQuMi4xDQo+Pj4gSSBqdXN0IGNoZWNrZWQgYW5kIGNvbmZpcm1lZCB0aGF0
IFFFTVUgaXMgYm9vdGluZyB3aXRoIFhFTiBTTU1VdjMgcGF0Y2ggYW5kIFhFTiBpcyBhYmxlIHRv
IHNheSBTTU1VIHRyYW5zbGF0aW9uIGlzIG5vdCBzdXBwb3J0ZWQuIEFzIFhFTiBzdXBwb3J0cyBT
dGFnZS0yIHRyYW5zbGF0aW9uIGFuZCBRRU1VIHN1cHBvcnRzIFN0YWdlLTEgb25seS4NCj4+Pg0K
Pj4+DQo+Pj4gKFhFTikgU01NVXYzOiAvc21tdXYzQDkwNTAwMDA6IFNNTVV2MzogRFQgdmFsdWUg
PSBldmVudHENCj4+PiAoWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1MDAwMDogSURSMC5DT0hBQ0Mg
b3ZlcnJpZGRlbiBieSBGVyBjb25maWd1cmF0aW9uIChmYWxzZSkNCj4+PiAoWEVOKSBTTU1VdjM6
IC9zbW11djNAOTA1MDAwMDogbm8gdHJhbnNsYXRpb24gc3VwcG9ydCENCj4+PiAoWEVOKSBJL08g
dmlydHVhbGlzYXRpb24gZGlzYWJsZWQNCj4+Pg0KPj4+IE9ubHkgZGlmZmVyZW5jZSBJIG9ic2Vy
dmVkIGlzIHRoYXQgeW91IGhhdmUgdG8gYWRkIG9wdGlvbiAiLW1hY2hpbmUgdmlydCxpb21tdT1z
bW11djMg4oCcIHdoZW4gbGF1bmNoaW5nIHRoZSBRRU1VLg0KPj4gSSBkbyB1c2UgdGhlIG9wdGlv
bg0KPiBJIHVzZWQgIi1tYWNoaW5lIHZpcnQsaW9tbXU9c21tdXYzIOKAnCAgb3B0aW9uIHdoaWxl
IGNyZWF0aW5nIHRoZSB2aXJ0LWR0YiBhbmQgd2hpbGUgbGF1bmNoaW5nIHRoZSBRRU1VLg0KPiBJ
IGFsc28gb2JzZXJ2ZWQgdGhlIHNhbWUgZXJyb3Igd2hhdCB5b3Ugb2JzZXJ2ZWQgaWYgSSBhbSBu
b3QgdXNpbmcgdGhlICItbWFjaGluZSB2aXJ0LGlvbW11PXNtbXV2MyDigJwgb3B0aW9ucyB3aGVu
IGxhdW5jaGluZyB0aGUgUUVNVSBzbyBJIHRob3VnaHQgdGhpcyBtaWdodCBiZSBjYXNlIGZvciB5
b3UgYWxzbyBidXQgYW55d2F5cyB5b3UgaGF2ZSB1c2UgdGhlIG9wdGlvbnMgaXQgbWlnaHQgYmUg
b3RoZXIgaXNzdWUuDQoNCkhtLCBwcm9iYWJseSB0aGF0IHdhcyBvbiBteSBzaWRlIGFzIG5vdyBJ
IGNhbiBzZWU6DQoNCihYRU4pIFNNTVV2MzogL3NtbXV2M0A5MDUwMDAwOiBTTU1VdjM6IERUIHZh
bHVlID0gZXZlbnRxDQooWEVOKSBTTU1VdjM6IC9zbW11djNAOTA1MDAwMDogSURSMC5DT0hBQ0Mg
b3ZlcnJpZGRlbiBieSBGVyBjb25maWd1cmF0aW9uIChmYWxzZSkNCihYRU4pIFNNTVV2MzogL3Nt
bXV2M0A5MDUwMDAwOiBubyB0cmFuc2xhdGlvbiBzdXBwb3J0IQ0KKFhFTikgSS9PIHZpcnR1YWxp
c2F0aW9uIGRpc2FibGVkDQooWEVOKQ0KKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKg0KKFhFTikgUGFuaWMgb24gQ1BVIDA6DQooWEVOKSBDb3VsZG4ndCBjb25m
aWd1cmUgY29ycmVjdGx5IGFsbCB0aGUgSU9NTVVzLg0KKFhFTikgKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKg0KKFhFTikNCihYRU4pIE1hbnVhbCByZXNldCByZXF1aXJl
ZCAoJ25vcmVib290JyBzcGVjaWZpZWQpDQoNClNvLCBzb3JyeSBmb3IgdGhlIG5vaXNlLCBJIG1p
Z2h0IGhhdmUgbWlzY29uZmlndXJlZCBzb21ldGhpbmcgaXQgc2VlbXMNCg0KV2hlbiB5b3Ugc2F5
ICJYZW4gaXMgYm9vdGluZyIgZG8geW91IG1lYW4geW91IHNlZSB0aGUgc2FtZSBwYW5pYz8NCg0K
VGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg0KPg0KPj4+IFBsZWFzZSBsZXQgbWUga25vdyBpZiBp
dCBhbHNvIHdvcmtzIGZvciB5b3UuDQo+PiBXZWxsLCBJIHNob3VsZCBoYXZlIHJlcG9ydGVkIHRo
YXQgZWFybGllciB0aGF0IEkgZG8gbm90IHVzZSB0aGUgc3RhZ2luZyBYZW4gYXQgdGhlIG1vbWVu
dCwNCj4+DQo+PiBpdCBpcyA0LjE0LjAuIFNvLCBjYW4gdGhpcyBiZSBhIHByb2JsZW0gd2l0aCB0
aGF0IFhlbiB2ZXJzaW9uPw0KPiBJIGRvbuKAmXQgdGhpbmsgc28gdGhpcyBpcyB0aGUgcHJvYmxl
bSB3aXRoIHRoZSBYRU4gdmVyc2lvbi4NCj4+IEFueXdheXMsIGlmIGl0IHdvcmtzIHdpdGggdGhl
IHN0YWdpbmcgdGhlbiBldmVyeXRoaW5nIGxvb2tzIG9rDQo+Pg0KPj4gVGhhbmsgeW91LA0KPj4N
Cj4+IE9sZWtzYW5kcg0KPj4NCj4+Pj4+IFJlZ2FyZHMNCj4+Pj4+IEJlcnRyYW5kDQo+Pj4+Pg0K
Pj4+Pj4+PiBDaGVlcnMsDQo+Pj4+Pj4+DQo+Pj4+Pj4gVGhhbmsgeW91LA0KPj4+Pj4+DQo+Pj4+
Pj4gT2xla3NhbmRyDQo+IFJlZ2FyZHMsDQo+IFJhaHVs

