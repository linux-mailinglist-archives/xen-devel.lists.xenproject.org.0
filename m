Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0622B4132
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 11:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27831.56395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kebpz-0008Rv-Gk; Mon, 16 Nov 2020 10:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27831.56395; Mon, 16 Nov 2020 10:34:19 +0000
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
	id 1kebpz-0008RW-Db; Mon, 16 Nov 2020 10:34:19 +0000
Received: by outflank-mailman (input) for mailman id 27831;
 Mon, 16 Nov 2020 10:34:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8hTe=EW=epam.com=prvs=95896be81b=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kebpx-0008RR-EB
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 10:34:17 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adb109d3-a122-45a2-9ced-bbc8f7bd828e;
 Mon, 16 Nov 2020 10:34:16 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGATb8A013128; Mon, 16 Nov 2020 10:34:02 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 34t6j5415e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 10:34:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 10:33:53 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 10:33:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8hTe=EW=epam.com=prvs=95896be81b=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kebpx-0008RR-EB
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 10:34:17 +0000
X-Inumbo-ID: adb109d3-a122-45a2-9ced-bbc8f7bd828e
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id adb109d3-a122-45a2-9ced-bbc8f7bd828e;
	Mon, 16 Nov 2020 10:34:16 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AGATb8A013128;
	Mon, 16 Nov 2020 10:34:02 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
	by mx0b-0039f301.pphosted.com with ESMTP id 34t6j5415e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2020 10:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuJ7HV1T0cHcbLvMzLyCk/O8ZFitgpCJmmPggnotXGqfC8axrM/gQpolRoplmWkS/nqcTN23ameq+kGmDeGH+xz1c55dnIjeb7A9WHgnPaiiTMFpHvw1We8SOADET++Q57rGUGfXRnnGfwTnS1b2oE33NM9T5MLIn67OPd82c6JUkX5Tj4rWrRiQxQy7fDMRAYDSAlZS0e7HwcNMbJhr/R75vet/GnBfi8FWgT1eC5J1VcO/704ktTRgrhGrdtClY8+hA6CvNhqfcjmRrPT/72i4bEororjbgdPUlFt3dYZmlgNmeEYoLAaEhLDRjsL/ukZdCODyzBWqKz+pJRheEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYVC/6PQpUFtmn4wYSMOF5SxTM28JioaejaFgQ+u3is=;
 b=chQt2PV5CPqAn4BQWeisOnav/knwpvRnlnnTwizlP6cqY2AhN/bgTtTHq+aYs2ARfUyBUrky4a2AGZ0dWqHbFs8nQeqUmkjrTbUbDPV/g19/ZDbTwL65FmiaC2V7oyQKoqKB+SA+bIJXGSOLgbZHq5pzAipTWGvMNHIsnEem1XSQ6BFqDcNAQYWDJM5NV3WUtG4zLscxnMIi7viFBgngbgMPu9PoqXFn8M2RbguzcMWpGvVaLeQhdbQWalJitO0x2DLa4cadUBGduzLQcyXuASkLevEouM5EkFoCa6bZgJELotZX4NYQBFWHMav9EyDjaPPlQ5aHJdhwOLAU9cVVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYVC/6PQpUFtmn4wYSMOF5SxTM28JioaejaFgQ+u3is=;
 b=kTOPMutf0LAlVe33O9z4EDUrBgIXxcCGzVNzcEl4ZOwoonN1QocLkJ1OyN0avz3hAL1iLsAThm0FYGQkmNyaNUy71pERAPBO2rcXa9v9SjMgIFsGMBGxIdGlrpD5io5wUuJrESdNXXDLF4wTcoKQXpkyq3ccNTYO9bsvFdE3vG8m7gFqas0s0drBZg9HZZzcVRuGW3JxEv4cAS0dPsxgcXDG/sokpnEGYJ/GUAQNFBbQl/8h9J6ofrV2xFctW3VulkKFKmptBUuVEhAA4eVCR7EFFs+SNz77WDhPRovynurZ6JQenPyv6KUorFLNa9tQrBqHdyFFVSJszSaKFBG3gA==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6963.eurprd03.prod.outlook.com (2603:10a6:20b:2d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 10:33:53 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 10:33:53 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Christian Lindig <christian.lindig@citrix.com>,
        David Scott <dave@recoil.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>,
        Nick Rosbrook <rosbrookn@ainfosec.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 00/24] xl / libxl: named PCI pass-through devices
Thread-Topic: [PATCH v2 00/24] xl / libxl: named PCI pass-through devices
Thread-Index: AQHWvAP66Z/45wYQrE+vwtERf0Yb4Q==
Date: Mon, 16 Nov 2020 10:33:53 +0000
Message-ID: <f8393cbe-d32f-9b45-049f-ec67a73e7c15@epam.com>
References: <20201110175147.7067-1-paul@xen.org>
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.245.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fde2f51-6e61-4334-88a7-08d88a1b1d48
x-ms-traffictypediagnostic: AM9PR03MB6963:
x-microsoft-antispam-prvs: 
 <AM9PR03MB69636DAD1356A2826F42552EE7E30@AM9PR03MB6963.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dQSgUyNsJdGMcBUByTnt0fF6bP/umJzBSl8gCqdSrb2SxoLN1iV4kV1vziRn0L7aSXZ9ekn/4Iwnvu4gNqjR2d3wxEP7P25ApQyLnpcGn2ZkdMudVpD0bwtuFScZz3ABW7F+aB4Ms8JwRTR7gX295BdWvDDuE3lscbc4y3pDNFkXS6odBfrWEejI63Acalm9d9x9O5sYVVMPYdw62ywd5+SHkVe6kbn38mqUT7OL0RqyhlyWZLn7EPMasIFUcqO0S4yjC/oW1ZTKUhH6vXQJr8WTljmAlhTIW/dPZLqI/iARAIOXlzF56XKgMVgDv3rB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(31696002)(8936002)(71200400001)(36756003)(6486002)(53546011)(6512007)(6506007)(2906002)(478600001)(86362001)(55236004)(26005)(186003)(66556008)(66476007)(66446008)(64756008)(5660300002)(7416002)(83380400001)(66946007)(31686004)(2616005)(91956017)(8676002)(76116006)(316002)(110136005)(54906003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 0J756hYtO39B2/S8sxV2NGJ5RoFkaCCNa0bIQ/oLZSTz7GWD1KzUZTiAO6aDsWMSDPDIPFq0su0/ZkHyWPat5s4zDH4JoyGp8f9vbKWLQVJuEr9pDeC+2tfrpOPyTcaNQ6eoYHVV0ISGWdVhONjJAY2eiEnIrDnior8a+AgmCOQ8ncwqUH88brg2A7CsTdIhk1OLG3bSQPjxyfttZAidz76i0jeOy9lrx20zkTVkqXzM6wi/gcJotdMpmIJDEQ/JCD5FuoYs1azryQ5wcRjSYf3mfZjk8hGRFGDdrpgSUS/f0BWqE64w9VQfxD9jSx05MV6CMwrX83448d6/bUy5JVNBN6qrlvKxgL0g99ho7Zl5wM3qVyMyZN0te36ky5a3XFduwLMKMQlFN7QCt9170QTmHVOGCxJ7PRKDVPxpS+XWR5Y8lOPOBgHCJyzLpB+/X4QrZC1FVY80zGO60B97IuuMGNcLtK1ALAL8igWsrZPcRH9DszzdfNImOzKf3gZZ0K6aXNSJGfha6OMEmYT9VQpWeIZz8F4V7cuIf3lNlDbMUBSvwkCZSZ2l90HezgCmcPhpkE9cn5ANCIjujybn9xL5tKz6/WATKaNR/UVUDd0n/nxT8heU/AzW9crh7T/6sRCrOvCDr4erWHL76BRPQQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7083A4CCC881454695A492DCC1814056@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fde2f51-6e61-4334-88a7-08d88a1b1d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 10:33:53.1404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ifKa++EZXOy+svftZDQzOFJfo+fID5SifUuMaBy3a9v2b4z7eUF2oYynHbiaZLINkGS927s/0tQMStqMbw6vqCwWiXL4K2d2C8xTFDYuuFBASHFXe5N/UfU5DvO0NwhS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6963
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-16_03:2020-11-13,2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1 phishscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160061

SGksIFBhdWwhDQoNCk9uIDExLzEwLzIwIDc6NTEgUE0sIFBhdWwgRHVycmFudCB3cm90ZToNCj4g
RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KPg0KPiBQYXVsIER1cnJh
bnQgKDI0KToNCj4gICAgeGwgLyBsaWJ4bDogcy9wY2lkZXYvcGNpIGFuZCByZW1vdmUgREVGSU5F
X0RFVklDRV9UWVBFX1NUUlVDVF9YDQo+ICAgIGxpYnhsOiB1c2UgTElCWExfREVGSU5FX0RFVklD
RV9MSVNUIGZvciBwY2kgZGV2aWNlcw0KPiAgICBsaWJ4bDogdXNlIExJQlhMX0RFRklORV9ERVZJ
Q0VfTElTVCBmb3IgbmljIGRldmljZXMNCj4gICAgbGlieGw6IHMvZGV0YXRjaGVkL2RldGFjaGVk
IGluIGxpYnhsX3BjaS5jDQo+ICAgIGxpYnhsOiByZW1vdmUgZXh0cmFuZW91cyBhcmd1bWVudHMg
dG8gZG9fcGNpX3JlbW92ZSgpIGluIGxpYnhsX3BjaS5jDQo+ICAgIGxpYnhsOiBzdG9wIHVzaW5n
IGFvZGV2LT5kZXZpY2VfY29uZmlnIGluIGxpYnhsX19kZXZpY2VfcGNpX2FkZCgpLi4uDQo+ICAg
IGxpYnhsOiBnZW5lcmFsaXNlICdkcml2ZXJfcGF0aCcgeGVuc3RvcmUgYWNjZXNzIGZ1bmN0aW9u
cyBpbg0KPiAgICAgIGxpYnhsX3BjaS5jDQo+ICAgIGxpYnhsOiByZW1vdmUgdW5uZWNlc3Nhcnkg
Y2hlY2sgZnJvbSBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQoKQ0KPiAgICBsaWJ4bDogcmVtb3ZlIGdl
dF9hbGxfYXNzaWduZWRfZGV2aWNlcygpIGZyb20gbGlieGxfcGNpLmMNCj4gICAgbGlieGw6IG1h
a2Ugc3VyZSBjYWxsZXJzIG9mIGxpYnhsX2RldmljZV9wY2lfbGlzdCgpIGZyZWUgdGhlIGxpc3QN
Cj4gICAgICBhZnRlciB1c2UNCj4gICAgbGlieGw6IGFkZCBsaWJ4bF9kZXZpY2VfcGNpX2Fzc2ln
bmFibGVfbGlzdF9mcmVlKCkuLi4NCj4gICAgbGlieGw6IHVzZSBDT01QQVJFX1BDSSgpIG1hY3Jv
IGlzX3BjaV9pbl9hcnJheSgpLi4uDQo+ICAgIGxpYnhsOiBhZGQvcmVjb3ZlciAncmRtX3BvbGlj
eScgdG8vZnJvbSBQQ0kgYmFja2VuZCBpbiB4ZW5zdG9yZQ0KPiAgICBsaWJ4bDogTWFrZSBzdXJl
IGRldmljZXMgYWRkZWQgYnkgcGNpLWF0dGFjaCBhcmUgcmVmbGVjdGVkIGluIHRoZQ0KPiAgICAg
IGNvbmZpZw0KPiAgICBkb2NzL21hbjogZXh0cmFjdCBkb2N1bWVudGF0aW9uIG9mIFBDSV9TUEVD
X1NUUklORyBmcm9tIHRoZSB4bC5jZmcNCj4gICAgICBtYW5wYWdlLi4uDQo+ICAgIGRvY3MvbWFu
OiBpbXByb3ZlIGRvY3VtZW50YXRpb24gb2YgUENJX1NQRUNfU1RSSU5HLi4uDQo+ICAgIGRvY3Mv
bWFuOiBmaXggeGwoMSkgZG9jdW1lbnRhdGlvbiBmb3IgJ3BjaScgb3BlcmF0aW9ucw0KPiAgICBs
aWJ4bDogaW50cm9kdWNlICdsaWJ4bF9wY2lfYmRmJyBpbiB0aGUgaWRsLi4uDQo+ICAgIGxpYnhs
dTogaW50cm9kdWNlIHhsdV9wY2lfcGFyc2Vfc3BlY19zdHJpbmcoKQ0KPiAgICBsaWJ4bDogbW9k
aWZ5DQo+ICAgICAgbGlieGxfZGV2aWNlX3BjaV9hc3NpZ25hYmxlX2FkZC9yZW1vdmUvbGlzdC9s
aXN0X2ZyZWUoKS4uLg0KPiAgICBkb2NzL21hbjogbW9kaWZ5IHhsKDEpIGluIHByZXBhcmF0aW9u
IGZvciBuYW1pbmcgb2YgYXNzaWduYWJsZSBkZXZpY2VzDQo+ICAgIHhsIC8gbGlieGw6IHN1cHBv
cnQgbmFtaW5nIG9mIGFzc2lnbmFibGUgZGV2aWNlcw0KPiAgICBkb2NzL21hbjogbW9kaWZ5IHhs
LXBjaS1jb25maWd1cmF0aW9uKDUpIHRvIGFkZCAnbmFtZScgZmllbGQgdG8NCj4gICAgICBQQ0lf
U1BFQ19TVFJJTkcNCj4gICAgeGwgLyBsaWJ4bDogc3VwcG9ydCAneGwgcGNpLWF0dGFjaC9kZXRh
Y2gnIGJ5IG5hbWUNCj4NCj4gICBkb2NzL21hbi94bC1wY2ktY29uZmlndXJhdGlvbi41LnBvZCAg
fCAgMjE4ICsrKysrKw0KPiAgIGRvY3MvbWFuL3hsLjEucG9kLmluICAgICAgICAgICAgICAgICB8
ICAgMzkgKy0NCj4gICBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gICAgICAgICAgICAgfCAgIDY4
ICstDQo+ICAgdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvIHwgICA3NyArLQ0K
PiAgIHRvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4uZ28gICB8ICAgIDggKy0NCj4gICB0
b29scy9pbmNsdWRlL2xpYnhsLmggICAgICAgICAgICAgICAgfCAgIDY3ICstDQo+ICAgdG9vbHMv
aW5jbHVkZS9saWJ4bHV0aWwuaCAgICAgICAgICAgIHwgICAgOCArLQ0KPiAgIHRvb2xzL2xpYnMv
bGlnaHQvbGlieGxfY3JlYXRlLmMgICAgICB8ICAgIDYgKy0NCj4gICB0b29scy9saWJzL2xpZ2h0
L2xpYnhsX2RtLmMgICAgICAgICAgfCAgIDE4ICstDQo+ICAgdG9vbHMvbGlicy9saWdodC9saWJ4
bF9pbnRlcm5hbC5oICAgIHwgICA1MyArLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfbmlj
LmMgICAgICAgICB8ICAgMTkgKy0NCj4gICB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jICAg
ICAgICAgfCAxMDMwICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgdG9vbHMvbGlicy9s
aWdodC9saWJ4bF90eXBlcy5pZGwgICAgIHwgICAxOSArLQ0KPiAgIHRvb2xzL2xpYnMvdXRpbC9s
aWJ4bHVfcGNpLmMgICAgICAgICB8ICAzNzkgKysrKystLS0tLQ0KPiAgIHRvb2xzL29jYW1sL2xp
YnMveGwveGVubGlnaHRfc3R1YnMuYyB8ICAgMTkgKy0NCj4gICB0b29scy94bC94bF9jbWR0YWJs
ZS5jICAgICAgICAgICAgICAgfCAgIDE2ICstDQo+ICAgdG9vbHMveGwveGxfcGFyc2UuYyAgICAg
ICAgICAgICAgICAgIHwgICAyOCArLQ0KPiAgIHRvb2xzL3hsL3hsX3BjaS5jICAgICAgICAgICAg
ICAgICAgICB8ICAxNTkgKystLQ0KPiAgIHRvb2xzL3hsL3hsX3N4cC5jICAgICAgICAgICAgICAg
ICAgICB8ICAgMTIgKy0NCj4gICAxOSBmaWxlcyBjaGFuZ2VkLCAxMzA4IGluc2VydGlvbnMoKyks
IDkzNSBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9tYW4veGwtcGNp
LWNvbmZpZ3VyYXRpb24uNS5wb2QNCg0KUGF0Y2hlcyAxLTE4Og0KDQpSZXZpZXdlZC1ieTogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0K
DQooSSdsbCBwcm9iYWJseSByZXZpZXcgbW9yZSBsYXRlciBhcyB0aW1lIGFsbG93cykuDQoNCg0K
SSB3b3VsZCBsaWtlIHRvIGFzayB0aGUgcmVzcGVjdGl2ZSBtYWludGFpbmVycyB0byBsb29rIGF0
IHRoaXMgc2VyaWVzIGFzLCBpbiB0aGUgbGlnaHQgb2YgdGhlDQoNCnVwY29taW5nIGNoYW5nZXMg
Zm9yIEFSTSBQQ0kgcGFzc3Rocm91Z2gsIHRoZXNlIGNoYW5nZXMgZ3JlYXRseSBoZWxwIGluIGFk
YXB0aW5nIHRoZQ0KDQpjb2RlIGZvciBBUk0NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg0K
PiAtLS0NCj4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0K
PiBDYzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPiBD
YzogRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz4NCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4gQ2M6IElhbiBKYWNrc29uIDxpd2pAeGVucHJvamVj
dC5vcmc+DQo+IENjOiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPg0KPiBD
YzogV2VpIExpdSA8d2xAeGVuLm9yZz4=

