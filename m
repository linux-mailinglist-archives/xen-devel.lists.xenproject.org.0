Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A22AF3F5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:43:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24942.52442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrL4-0003SG-FN; Wed, 11 Nov 2020 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24942.52442; Wed, 11 Nov 2020 14:43:10 +0000
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
	id 1kcrL4-0003RH-Bq; Wed, 11 Nov 2020 14:43:10 +0000
Received: by outflank-mailman (input) for mailman id 24942;
 Wed, 11 Nov 2020 14:43:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kcrL2-0003QR-QU
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:43:08 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5a00dbc-5f87-4b7f-9eff-f674d25fc607;
 Wed, 11 Nov 2020 14:43:07 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABEfRjn032405; Wed, 11 Nov 2020 14:42:59 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 34rf80gmcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 14:42:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 14:42:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 14:42:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Pxcb=ER=epam.com=prvs=9584594409=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kcrL2-0003QR-QU
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:43:08 +0000
X-Inumbo-ID: b5a00dbc-5f87-4b7f-9eff-f674d25fc607
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b5a00dbc-5f87-4b7f-9eff-f674d25fc607;
	Wed, 11 Nov 2020 14:43:07 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ABEfRjn032405;
	Wed, 11 Nov 2020 14:42:59 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
	by mx0a-0039f301.pphosted.com with ESMTP id 34rf80gmcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2020 14:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5gKiV3f67by+uzKkzAM053lDP1BQSDnpHD+AD0zNqLVWCfgCcm7EU/sH+/sYpsKVfBNNc5fB8PGj1dFe1fqG2W6OY0LvHdpF3FuDARGKlrLUbTqJOTpbavMEFZpbz0DMt3moGLPGNn6Ji7HiSkBrjQD3i2vbJfk47nBxClVCuuJv5d1DHcKt9V96hgMOwFlZn/JsOYeocoyXsf48K5PEAcVXMWRDblpWpsc3K2gGdFae5uZsgEBg0Y2/e/6A7utdTVin9b/Fqi+An1BkvmvGskZJWXocOOS4PJ2DrKSKC3RwBYr2ANKTE1Ra+UPl59taxOVjJpnRg2qDtts8gwEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdpnGa4rbLp/JBpsamr4pRiPirSjNwVGSJB0QN2k7LU=;
 b=AXXLkO3L6U+JdWILxpe/jGU3OIO9tGNeYgiXlHOwhiHvUAx5+JJpcXHleM5Il8vB1WACuOAfZexEv0JaQuVkXE4fZJBRn6E3UfcurcOZwTkz20HyKv+gLSwvyYMwf8Vo2y2v5HntIjDyqDZT8z3hdg+erGdazqMcOKlu+7uhKmwc5N6K7Q4GREs2fKWttvnHOYv8FWY7CuS6y/tUKiIAE2yICNpvuyKfighT5GGYsaT/D545h6ZqY+7QwP/Zj6+IUmwZp61twxpj88+WaGEqlqzSqbitnJstGsRrhcu9Q+vK0ao++/fC23aVBSYcTUkio4hzmaeCB4zyVWNo6+bfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdpnGa4rbLp/JBpsamr4pRiPirSjNwVGSJB0QN2k7LU=;
 b=i5LUPrQOjONEKtt8ypDROljJULbI08J4vfn1wTJ2sg26+mjnPsVqDnIW9ldCye4Dc0NvTIajIXaOF7wWCdfzD2OGpzLTT+bjQLVl3QS23CDoU0bNrGX4xoJTnwnmWkWTyigxkPQ3ynOL/86yb5hjaQjj2mIDBGz8n7cAt6YGh+pxn6FkzJAtziaog8pwHTvoVRbUs5Y6MHL+QDyOvh/Hxw1R3/68vtRFWGwLULG+R3yURmq2oVufNwyvOAAbtktzuQ7J39bmjBFAh0HCEHuBC4xoYJdCRbznTxYb13Q2mFRpl1b6pfe+5FzriNX5dbm7aqtgyfIhf6NB/Aqin6d5Kw==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 11 Nov
 2020 14:42:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 14:42:56 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <andr2000@gmail.com>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH 03/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 03/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHWtpb07GsqhunhOkybCrJJI4gm+6nDA7cAgAAA/IA=
Date: Wed, 11 Nov 2020 14:42:56 +0000
Message-ID: <064408c9-6585-0aaf-aaed-f67910b27bf7@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-4-andr2000@gmail.com>
 <20201111143924.gxbi5oopfeammgti@Air-de-Roger>
In-Reply-To: <20201111143924.gxbi5oopfeammgti@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19105fac-a7b9-432d-136e-08d8865013e6
x-ms-traffictypediagnostic: AM0PR03MB6324:
x-microsoft-antispam-prvs: 
 <AM0PR03MB63243896545CB4B753D167BFE7E80@AM0PR03MB6324.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tuwur7I13BSHdukP1fXOOEDthyviXLxfCgzHWe9g0CMANWzIEZ/rSjqzMUfVE/ABWGnI7r0PIRQcTVXCJulg4d0So1QBABqJN8Vi5ZoBMI4bg8FOZeegjFGxGXTVlQCYqP0rC00pizuAp36l9m7lRSy9kh8uM34YTnH9NhbXyWeepi2JbiRdyTZ9/pymsyDIvy7EYGEzxe/dWnxIyX2feWFyYMuyzUAO3xVTAFh+rOgvLlFKTw3V7Xwl8BrKKORNHAcAg147TzhtfDv07H1xsKzFr5n1cSLrHpI3HzP95VYBKtYDDpXHrBtHCrN+LSUn0PB6E9qpMAIFi8DpMQamSX3QUWqaJhaECYx1z3Pn5dOwGU9OUepCGMuKxBp+fcwra8B5/8P8J1+qeXFP4UTL+A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(31696002)(83380400001)(6512007)(6486002)(86362001)(76116006)(66946007)(66476007)(66446008)(66556008)(91956017)(64756008)(5660300002)(2906002)(31686004)(186003)(8936002)(26005)(53546011)(6506007)(36756003)(7416002)(8676002)(2616005)(71200400001)(54906003)(110136005)(316002)(4326008)(966005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 f8U3XnUVIDyzee8PCXx6UnLMvn/7zPZk7h9Ygv2lL5+/tnmwD1us6lRwYxegMXaJBe/97m5EVV2NG+FduyhUyYakajirrnU2mATGG45r4PKi+BU54dHuCNXY0Ro0mMzh2+PSUtErDQ06Zg+NFvQFM0C3Ekh0yKuXFOGBq3sn0dj1mUO1tmb2mCXsvrQzaNTahpmUTrrQM+3XLqR/r5j6kuAzEzJ4WVGLY8EoVT0kyTyr0o3eElnWDAwTkh5sygjDiDhtiUZCP0VJ8bsEo4Ezr/1DJOqXABWM8tw2q98gdRi0FEryaL8j/K40e+1x02ky4AoTsEgJA1LTXye+C+l9Gv2EXZ9Nq4n63ddCT48xM8i5dLFcEQ8ejWAl4YnNKeYk8kkv9xN2Ta85SwP5784dZ8TIHK+nnkaD93nYGnxokR3iStMPqLwgHwnivnqMkRyUX8pIsAKueZUyymQpKu/fFKupMZKHAXKLYWseUcxxZ0ToF1sn1RThB24U+HCJgX/SkKM3eG9BmOVJ6pgn0t8WYvwiLrppbAHbCmpcpfP7+LlFIlQkLivsXa48g5QGBK6h+jYLAdcZs8fkmNyDuL4Fa3JAE03alFfpgT10+NgsWrJc5fOekJg9os0GCRZDqVHnrFpEy9NyjDYfvWa+ECr24Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB02184318E9C740A18F00BBB8AD8F47@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19105fac-a7b9-432d-136e-08d8865013e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 14:42:56.1648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVehEcMDumNMwfVu9mJ8mk8x4Y5/xjUlmae1zoGU5fquX/zyvX2X1hFVij88hbQKAkopp1DRz3B00/so2OZ+tawBUq3YGFXsIgE75dQ114hsNFtcQckyGFx/z6Cw5qll
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6324
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_07:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011110088

DQpPbiAxMS8xMS8yMCA0OjM5IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IE5vdiAwOSwgMjAyMCBhdCAwMjo1MDoyNFBNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBJbiBvcmRlciB2UENJIHRvIHdvcmsgaXQgbmVl
ZHMgYWxsIGFjY2VzcyB0byBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZQ0KPj4gYWNjZXNzIHRvIGJl
IHN5bmNocm9uaXplZCBhbW9uZyBhbGwgZW50aXRpZXMsIGUuZy4gaGFyZHdhcmUgZG9tYWluIGFu
ZA0KPj4gZ3Vlc3RzLiBGb3IgdGhhdCBpbXBsZW1lbnQgUENJIGhvc3QgYnJpZGdlIHNwZWNpZmlj
IGNhbGxiYWNrcyB0bw0KPj4gcHJvcGVscnkgc2V0dXAgdGhvc2UgcmFuZ2VzIGRlcGVuZGluZyBv
biBob3N0IGJyaWRnZSBpbXBsZW1lbnRhdGlvbi4NCj4+DQo+PiBUaGlzIGNhbGxiYWNrIGlzIG9w
dGlvbmFsIGFuZCBtYXkgbm90IGJlIHVzZWQgYnkgbm9uLUVDQU0gaG9zdCBicmlkZ2VzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gICB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1o
b3N0LWNvbW1vbi5jICB8IDE2ICsrKysrKysrKysrKysrKysNCj4+ICAgeGVuL2FyY2gvYXJtL3Bj
aS9wY2ktaG9zdC1nZW5lcmljLmMgfCAxNSArKysrKysrKysrKysrLS0NCj4+ICAgeGVuL2FyY2gv
YXJtL3ZwY2kuYyAgICAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKystDQo+IFNvIHRo
aXMgaXMgYmFzZWQgb24gdG9wIG9mIGFub3RoZXIgc2VyaWVzLCBtYXliZSBpdCB3b3VsZCBtYWtl
IHNlbnNlDQo+IHRvIHBvc3QgdGhvc2UgdG9nZXRoZXIsIG9yIGVsc2UgaXQncyBoYXJkIHRvIGdl
dCB0aGUgcmlnaHQgY29udGV4dC4NCg0KVGhpcyBpcyBiYXNlZCBvbiBBUk0ncyBQQ0kgcGFzc3Ro
cm91Z2ggUkZDIHNlcmllcyBbMV0NCg0KWW91IGNhbiBhbHNvIHNlZSB0aGUgd2hvbGUgcGljdHVy
ZSBhdCBbMl0NCg0KPg0KPj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3BjaS5oICAgICAgICAgICB8
ICA3ICsrKysrKysNCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0
LWNvbW1vbi5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYw0KPj4gaW5kZXgg
YjAxMWM3ZWZmM2M4Li5iODExODRkMzQ5ODAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
cGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0
LWNvbW1vbi5jDQo+PiBAQCAtMjE5LDYgKzIxOSwyMiBAQCBzdHJ1Y3QgZGV2aWNlICpwY2lfZmlu
ZF9ob3N0X2JyaWRnZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPj4gICAgICAgfQ0KPj4g
ICAgICAgcmV0dXJuIGR0X3RvX2RldihicmlkZ2UtPmR0X25vZGUpOw0KPj4gICB9DQo+PiArDQo+
PiAraW50IHBjaV9ob3N0X2l0ZXJhdGVfYnJpZGdlcyhzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICgqY2xiKShzdHJ1Y3QgZG9tYWluICpkLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGNpX2hv
c3RfYnJpZGdlICpicmlkZ2UpKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRn
ZSAqYnJpZGdlOw0KPj4gKyAgICBpbnQgZXJyOw0KPj4gKw0KPj4gKyAgICBsaXN0X2Zvcl9lYWNo
X2VudHJ5KCBicmlkZ2UsICZwY2lfaG9zdF9icmlkZ2VzLCBub2RlICkNCj4+ICsgICAgew0KPj4g
KyAgICAgICAgZXJyID0gY2xiKGQsIGJyaWRnZSk7DQo+PiArICAgICAgICBpZiAoIGVyciApDQo+
PiArICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4+ICsgICAgfQ0KPj4gKyAgICByZXR1cm4gMDsN
Cj4+ICt9DQo+PiAgIC8qDQo+PiAgICAqIExvY2FsIHZhcmlhYmxlczoNCj4+ICAgICogbW9kZTog
Qw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtZ2VuZXJpYy5jIGIv
eGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1nZW5lcmljLmMNCj4+IGluZGV4IDU0ZGQxMjNlOTVj
Ny4uNDY5ZGYzZGEwMTE2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9z
dC1nZW5lcmljLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtZ2VuZXJpYy5j
DQo+PiBAQCAtODUsMTIgKzg1LDIzIEBAIGludCBwY2lfZWNhbV9jb25maWdfcmVhZChzdHJ1Y3Qg
cGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsIHVpbnQzMl90IHNiZGYsDQo+PiAgICAgICByZXR1cm4g
MDsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgaW50IHBjaV9lY2FtX3JlZ2lzdGVyX21taW9f
aGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwNCj4gSSB0aGlu
ayB5b3UgY2FuIGFsc28gY29uc3RpZnkgYnJpZGdlIGhlcmUuDQpNYWtlcyBzZW5zZQ0KPg0KPiBU
aGFua3MsIFJvZ2VyLg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0KDQpbMV0gaHR0cHM6Ly93
d3cubWFpbC1hcmNoaXZlLmNvbS94ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcvbXNnODQ0
NTIuaHRtbA0KDQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL2FuZHIyMDAwL3hlbi90cmVlL3ZwY2lf
cmZjDQo=

