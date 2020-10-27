Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962929A887
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 10:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12730.32993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXLl8-0004xD-Sd; Tue, 27 Oct 2020 09:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12730.32993; Tue, 27 Oct 2020 09:59:18 +0000
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
	id 1kXLl8-0004wo-Oz; Tue, 27 Oct 2020 09:59:18 +0000
Received: by outflank-mailman (input) for mailman id 12730;
 Tue, 27 Oct 2020 09:59:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kXLl7-0004wj-BW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:59:17 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21ba9d9a-b6a2-4eb5-9b64-3a507a042dbf;
 Tue, 27 Oct 2020 09:59:16 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09R9twpK009217; Tue, 27 Oct 2020 09:59:10 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx0a-0039f301.pphosted.com with ESMTP id 34ddh2dbu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Oct 2020 09:59:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6323.eurprd03.prod.outlook.com (2603:10a6:20b:159::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 27 Oct
 2020 09:59:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 09:59:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kXLl7-0004wj-BW
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:59:17 +0000
X-Inumbo-ID: 21ba9d9a-b6a2-4eb5-9b64-3a507a042dbf
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 21ba9d9a-b6a2-4eb5-9b64-3a507a042dbf;
	Tue, 27 Oct 2020 09:59:16 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09R9twpK009217;
	Tue, 27 Oct 2020 09:59:10 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
	by mx0a-0039f301.pphosted.com with ESMTP id 34ddh2dbu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2020 09:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSjCH0CLlx0PRnyH0FkE5cz4kHpseMcJDYgwwhk3I0hF2pb31LDgcvmLk66iajH35DXifPOpozvAPgRM9EVwi74HsGNYmiSYmGrlEDHglrO+3xWLXBXr+ucO0upernZIq4pbSetnA2LRz+O756+Y2NlwyTbMnxAGy1u4hIb4A8qAPlowKZbD9DymtV3nL4KVFw0eIRC5KmYxmAaCO8SwqrqnuKtCcozHXarEbgVnEBhmMB9qqGmovF/aovnfcjPfjSLFutdg3moNqyWHiOSiM1X3IgX7uorXkLmld+9+y2MS9W3dAIqHed5VIspRK5I7w3fI7Qg7k/x8CRIkrY9ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfepSJ8iKy4SzAe8qRCLxQ8t3vxjdNyD8vio/vkrtAY=;
 b=l09II9CO3l71ISRxvitKrUXa0nt61P+3loN/9OytgvtCm6tag5YD3VcDvKac4XDxjlhxjgonMnEqSxAYx1Yr11eYBBrOxSgSseR6iBvv1r8k4t3cqQv6D3QXNrLXVbUFkoGha2cEVbPjQFSfDVmYxkUaCDIDbWNPe1xjGRKt4wd6c+dqlkI1ImjCIlUKdDdNguEbw58/VgVbYSEOoW08FgMHyUpjr3J5QpXZjXKVebF/tiN1Y8FsrGQ5R4PsU+1CWRB8SmlFjkqgMM9ps2pbcyILh5/uRLV2HGpZKqoO6p0YvY1kdBELJyHyj05pM+aHGFFHTl8ls3wX5iIylHpEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfepSJ8iKy4SzAe8qRCLxQ8t3vxjdNyD8vio/vkrtAY=;
 b=C+rhn56zw3cmD+L2BBYG6zbmhIV0xvTSQudUawV/opHOyNheBwzTHQKm+Q2XhlLvm74VXmEDKKKfafkh7ogqM7JwNIVUoZYtuueVuW3BsOwfabzTogghZBZVJnDY63pv3l66MBpu2eL/Sn8nSvTEReUL945Bqb+yBbc2kpuKjhiiySiwRCoeJJ2hQDn3qM//wYi6idrxlNFiLfRhBNgqzkfnNxRkm2wattTRgLhlrcVu2rfhGg1/2mh46FA/ddSa+0E3A45jk/9fSRfG6U/0bLsoBVIVuehQ99Z04gnUggHyAaePODFqEZUagGrvBlhMnba7pSWn2yY6STe41FG11w==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6323.eurprd03.prod.outlook.com (2603:10a6:20b:159::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 27 Oct
 2020 09:59:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 09:59:06 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Rahul Singh <Rahul.Singh@arm.com>
Subject: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
Thread-Topic: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
Thread-Index: AQHWrEfNmyZZUV4zgEum5lDBP9dPxg==
Date: Tue, 27 Oct 2020 09:59:05 +0000
Message-ID: <ad25a5ba-f44c-4e88-f3b0-e0baa5efc5f6@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffa43bb0-23dd-41e6-7605-08d87a5ef10c
x-ms-traffictypediagnostic: AM0PR03MB6323:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB6323D090A4B887880F22107DE7160@AM0PR03MB6323.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 75Zuaw7sBVer0PaOrcow+SnP07hPuukJvrtQVArIUdT2He5ysyhaAbnq2lz+ZgY7ce/Km7EQaYtee9mvxGKFwjb0nq9XZ2mySX4K/+kuwbsigPVnL7jK6EE9iAX5WtpXQgjZQ8of+bHCBORYh0vCQhuyr8RdEO1lQO4sydQw2G7CfJJFT7wV0Z8dvTFU586oWw+pybfvazQ1SmobTZXXqcgnWKwNrJMzMtTDQXz/xD1jRMH/TYFasvi/LakGmHYrReEwMUe6QpmmHI2m9KLiPND9Q4ZRoWFfXF3tUnzIr8/k+RT6FPy73o+kJiYNeEpV2g8qcl7jr/HCysgcB/zIWYs6yRFBz9qUIRVQyzWvjHqpVs4WQDbjVkLqVasC3xbM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(8936002)(7416002)(6486002)(316002)(8676002)(110136005)(76116006)(86362001)(66946007)(2906002)(6512007)(66446008)(36756003)(83380400001)(66556008)(71200400001)(5660300002)(66476007)(64756008)(2616005)(478600001)(31696002)(6506007)(186003)(31686004)(26005)(921003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Tg8tCN4r2BitwQ9QR2nNO+NMAtSSGJbyiP1oLvOGoMYOGAq7D8tsyg4zloGX0yu1gZ1KAGftjlGl+TyHOxObnCpO9ow4nf4mY8pjoe9O3fHN+lyXM9BzCySVgzeVtHAto79eXkIIKodSmgX30viheBQyG0mrhkRLQ3O5mOxOheGSnDQWdED4DQgQBk9okhc7JALuM2F6KheMm7kzE2EjWLotE2uz3HHxO8GyMyZMJDJ8bhBpUwWm0hB93TCHzv8ezI4BMwtSe+k6SvsWzgSAimfZU5tMK0+5m0RbZqt3YzoWN63/bMikSmrjeS/vbbOjf4hqEwcF5bCjcoQbt8dlEaM3zcyVtpgbW5QmBv0Rclr4OoQv3zVfIBQz4AIFRyR7zsQMVrMPFJL5wo8Ppwk3h9SGuTvFX1yLWDWwzX3bh603OAo6fCOesrkN3pYkKdrklB+SkLGQY0HLhIYUEHgNLs0wUOLaj/L7n80o8azH4MOguejeagE2D8B5ndJfbsrVaGAoBMHhJq/lcv9+0GHDW6leZg4Vhn9Qx6oE1hOaGREMrwHXG1NOkmh+KjnT7lglUtZTPfkuuAkCqZRnA6Wtx+UkwTH5LBIARyDN9y6q8eYyMr8a6zPUf7Q29uvRdmMcGas8Yu6e1tsdL0+Npp0DWA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1EE3E7AA0A8F049B3F471279A3639BB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa43bb0-23dd-41e6-7605-08d87a5ef10c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 09:59:05.4142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANkzO+5DBnfobqAEUldsuTqwRX3w68zo9FTkkLbJLdCCKVgHHRBWiqNtl+TkOaTC8ZSPZuyAoanalMWESMbOdDVwYZNbW7oEbdsYOBtfqPsElarh02O40aSprJErFIJx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6323
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-27_05:2020-10-26,2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 mlxlogscore=906 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270064

SGVsbG8sIGFsbCENCg0KV2hpbGUgd29ya2luZyBvbiBQQ0kgcGFzc3Rocm91Z2ggb24gQVJNIChw
YXJ0aWFsIFJGQyB3YXMgcHVibGlzaGVkIGJ5IEFSTQ0KZWFybGllciB0aGlzIHllYXIpIEkgdHJp
ZWQgdG8gaW1wbGVtZW50IHNvbWUgcmVsYXRlZCBjaGFuZ2VzIGluIHRoZSB0b29sc3RhY2suDQpP
bmUgb2YgdGhlIG9ic3RhY2xlcyBmb3IgQVJNIGlzIFBDSSBiYWNrZW5k4oCZcyByZWxhdGVkIGNv
ZGUgcHJlc2VuY2U6IEFSTSBpcw0KZ29pbmcgdG8gZnVsbHkgZW11bGF0ZSBhbiBFQ0FNIGhvc3Qg
YnJpZGdlIGluIFhlbiwgc28gbm8gUENJIGJhY2tlbmQvZnJvbnRlbmQNCnBhaXIgaXMgZ29pbmcg
dG8gYmUgdXNlZC4NCg0KSWYgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0IHRoZSBmdW5jdGlvbmFs
aXR5IHdoaWNoIGlzIGltcGxlbWVudGVkIGJ5IHRoZQ0KcGNpYmFjayBhbmQgdG9vbHN0YWNrIGFu
ZCB3aGljaCBpcyByZWxldmFudC9uZWVkZWQgZm9yIEFSTToNCg0KIMKgMS4gcGNpYmFjayBpcyB1
c2VkIGFzIGEgZGF0YWJhc2UgZm9yIGFzc2lnbmFibGUgUENJIGRldmljZXMsIGUuZy4geGwNCiDC
oMKgwqAgcGNpLWFzc2lnbmFibGUte2FkZHxyZW1vdmV8bGlzdH0gbWFuaXB1bGF0ZXMgdGhhdCBs
aXN0LiBTbywgd2hlbmV2ZXIgdGhlDQogwqDCoMKgIHRvb2xzdGFjayBuZWVkcyB0byBrbm93IHdo
aWNoIFBDSSBkZXZpY2VzIGNhbiBiZSBwYXNzZWQgdGhyb3VnaCBpdCByZWFkcw0KIMKgwqDCoCB0
aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVudHJpZXMgb2YgdGhlIHBjaWJhY2suDQoNCiDC
oDIuIHBjaWJhY2sgaXMgdXNlZCB0byBob2xkIHRoZSB1bmJvdW5kIFBDSSBkZXZpY2VzLCBlLmcu
IHdoZW4gcGFzc2luZyB0aHJvdWdoIGENCiDCoMKgwqAgUENJIGRldmljZSBpdCBuZWVkcyB0byBi
ZSB1bmJvdW5kIGZyb20gdGhlIHJlbGV2YW50IGRldmljZSBkcml2ZXIgYW5kIGJvdW5kDQogwqDC
oMKgIHRvIHBjaWJhY2sgKHN0cmljdGx5IHNwZWFraW5nIGl0IGlzIG5vdCByZXF1aXJlZCB0aGF0
IHRoZSBkZXZpY2UgaXMgYm91bmQgdG8NCiDCoMKgwqAgcGNpYmFjaywgYnV0IHBjaWJhY2sgaXMg
YWdhaW4gdXNlZCBhcyBhIGRhdGFiYXNlIG9mIHRoZSBwYXNzZWQgdGhyb3VnaCBQQ0kNCiDCoMKg
wqAgZGV2aWNlcywgc28gd2UgY2FuIHJlLWJpbmQgdGhlIGRldmljZXMgYmFjayB0byB0aGVpciBv
cmlnaW5hbCBkcml2ZXJzIHdoZW4NCiDCoMKgwqAgZ3Vlc3QgZG9tYWluIHNodXRzIGRvd24pDQoN
CiDCoDMuIHRvb2xzdGFjayBkZXBlbmRzIG9uIERvbWFpbi0wIGZvciBkaXNjb3ZlcmluZyBQQ0kg
ZGV2aWNlIHJlc291cmNlcyB3aGljaCBhcmUNCiDCoMKgwqAgdGhlbiBwZXJtaXR0ZWQgZm9yIHRo
ZSBndWVzdCBkb21haW4sIGUuZyBNTUlPIHJhbmdlcywgSVJRcy4gYXJlIHJlYWQgZnJvbQ0KIMKg
wqDCoCB0aGUgc3lzZnMNCg0KIMKgNC4gdG9vbHN0YWNrIGlzIHJlc3BvbnNpYmxlIGZvciByZXNl
dHRpbmcgUENJIGRldmljZXMgYmVpbmcgcGFzc2VkIHRocm91Z2ggdmlhDQogwqDCoMKgIHN5c2Zz
L3Jlc2V0IG9mIHRoZSBEb21haW4tMOKAmXMgUENJIGJ1cyBzdWJzeXN0ZW0NCg0KIMKgNS4gdG9v
bHN0YWNrIGlzIHJlc3BvbnNpYmxlIGZvciB0aGUgZGV2aWNlcyBhcmUgcGFzc2VkIHdpdGggYWxs
IHJlbGV2YW50DQogwqDCoMKgIGZ1bmN0aW9ucywgZS5nLiBzbyBmb3IgbXVsdGlmdW5jdGlvbiBk
ZXZpY2VzIGFsbCB0aGUgZnVuY3Rpb25zIGFyZSBwYXNzZWQgdG8NCiDCoMKgwqAgYSBkb21haW4g
YW5kIG5vIHBhcnRpYWwgcGFzc3Rocm91Z2ggaXMgZG9uZQ0KDQogwqA2LiB0b29sc3RhY2sgY2Fy
ZXMgYWJvdXQgU1ItSU9WIGRldmljZXMgKGFtIEkgY29ycmVjdCBoZXJlPykNCg0KDQpJIGhhdmUg
aW1wbGVtZW50ZWQgYSByZWFsbHkgZGlydHkgUE9DIGZvciB0aGF0IHdoaWNoIEkgd291bGQgbmVl
ZCB0byBjbGVhbiB1cA0KYmVmb3JlIHNob3dpbmcsIGJ1dCBiZWZvcmUgdGhhdCBJIHdvdWxkIGxp
a2UgdG8gZ2V0IHNvbWUgZmVlZGJhY2sgYW5kIGFkdmljZSBvbg0KaG93IHRvIHByb2NlZWQgd2l0
aCB0aGUgYWJvdmUuIEkgc3VnZ2VzdCB3ZToNCg0KIMKgMS4gTW92ZSBhbGwgcGNpYmFjayByZWxh
dGVkIGNvZGUgKHdoaWNoIHNlZW1zIHRvIGJlY29tZSB4ODYgY29kZSBvbmx5KSBpbnRvIGENCiDC
oMKgwqAgZGVkaWNhdGVkIGZpbGUsIHNvbWV0aGluZyBsaWtlIHRvb2xzL2xpYnhsL2xpYnhsX3Bj
aV94ODYuYw0KDQogwqAyLiBNYWtlIHRoZSBmdW5jdGlvbmFsaXR5IG5vdyBwcm92aWRlZCBieSBw
Y2liYWNrIGFyY2hpdGVjdHVyZSBkZXBlbmRlbnQsIHNvDQogwqDCoMKgIHRvb2xzL2xpYnhsL2xp
YnhsX3BjaS5jIGRlbGVnYXRlcyBhY3R1YWwgYXNzaWduYWJsZSBkZXZpY2UgbGlzdCBoYW5kbGlu
ZyB0bw0KIMKgwqDCoCB0aGF0IGFyY2ggY29kZSBhbmQgdXNlcyBzb21lIHNvcnQgb2Yg4oCcb3Bz
4oCdLCBlLmcuDQogwqDCoMKgIGFyY2gtPm9wcy5nZXRfYWxsX2Fzc2lnbmFibGUsIGFyY2gtPm9w
cy5hZGRfYXNzaWduYWJsZSBldGMuIChUaGlzIGNhbiBhbHNvDQogwqDCoMKgIGJlIGRvbmUgd2l0
aCDigJwjaWZkZWYgQ09ORklHX1BDSUJBQ0vigJ0sIGJ1dCBzZWVtcyB0byBiZSBub3QgY3V0ZSku
IEludHJvZHVjZQ0KIMKgwqDCoCB0b29scy9saWJ4bC9saWJ4bF9wY2lfYXJtLmMgdG8gcHJvdmlk
ZSBBUk0gaW1wbGVtZW50YXRpb24uDQoNCiDCoDMuIEFSTSBvbmx5OiBBcyB3ZSBkbyBub3QgaGF2
ZSBwY2liYWNrIG9uIEFSTSB3ZSBuZWVkIHRvIGhhdmUgc29tZSBzdG9yYWdlIGZvcg0KIMKgwqDC
oCBhc3NpZ25hYmxlIGRldmljZSBsaXN0OiBtb3ZlIHRoYXQgaW50byBYZW4gYnkgZXh0ZW5kaW5n
IHN0cnVjdCBwY2lfZGV2IHdpdGgNCiDCoMKgwqAg4oCcYm9vbCBhc3NpZ25lZOKAnSBhbmQgcHJv
dmlkaW5nIHN5c2N0bHMgZm9yIG1hbmlwdWxhdGluZyB0aGF0LCBlLmcuDQogwqDCoMKgIFhFTl9T
WVNDVExfcGNpX2RldmljZV97c2V0fGdldH1fYXNzaWduZWQsDQogwqDCoMKgIFhFTl9TWVNDVExf
cGNpX2RldmljZV9lbnVtX2Fzc2lnbmVkICh0byBlbnVtZXJhdGUvZ2V0IHRoZSBsaXN0IG9mDQog
wqDCoMKgIGFzc2lnbmVkL25vdC1hc3NpZ25lZCBQQ0kgZGV2aWNlcykuIENhbiB0aGlzIGFsc28g
YmUgaW50ZXJlc3RpbmcgZm9yIHg4Nj8gQXQNCiDCoMKgwqAgdGhlIG1vbWVudCBpdCBzZWVtcyB0
aGF0IHg4NiBkb2VzIHJlbHkgb24gcGNpYmFjayBwcmVzZW5jZSwgc28gcHJvYmFibHkgdGhpcw0K
IMKgwqDCoCBjaGFuZ2UgbWlnaHQgbm90IGJlIGludGVyZXN0aW5nIGZvciB4ODYgd29ybGQsIGJ1
dCBtYXkgYWxsb3cgc3RyaXBwaW5nDQogwqDCoMKgIHBjaWJhY2sgZnVuY3Rpb25hbGl0eSBhIGJp
dCBhbmQgbWFraW5nIHRoZSBjb2RlIGNvbW1vbiB0byBib3RoIEFSTSBhbmQgeDg2Lg0KDQogwqA0
LiBBUk0gb25seTogSXQgaXMgbm90IGNsZWFyIGhvdyB0byBoYW5kbGUgcmUtYmluZGluZyBvZiB0
aGUgUENJIGRyaXZlciBvbg0KIMKgwqDCoCBndWVzdCBzaHV0ZG93bjogd2UgbmVlZCB0byBzdG9y
ZSB0aGUgc3lzZnMgcGF0aCBvZiB0aGUgb3JpZ2luYWwgZHJpdmVyIHRoZQ0KIMKgwqDCoCBkZXZp
Y2Ugd2FzIGJvdW5kIHRvLiBEbyB3ZSBhbHNvIHdhbnQgdG8gc3RvcmUgdGhhdCBpbiBzdHJ1Y3Qg
cGNpX2Rldj8NCg0KIMKgNS4gQW4gYWx0ZXJuYXRpdmUgcm91dGUgZm9yIDMtNCBjb3VsZCBiZSB0
byBzdG9yZSB0aGF0IGRhdGEgaW4gWGVuU3RvcmUsIGUuZy4NCiDCoMKgwqAgTU1JT3MsIElSUSwg
YmluZCBzeXNmcyBwYXRoIGV0Yy4gVGhpcyB3b3VsZCByZXF1aXJlIG1vcmUgY29kZSBvbiBYZW4g
c2lkZSB0bw0KIMKgwqDCoCBhY2Nlc3MgWGVuU3RvcmUgYW5kIHdvbuKAmXQgd29yayBpZiBNTUlP
cy9JUlFzIGFyZSBwYXNzZWQgdmlhIGRldmljZSB0cmVlL0FDUEkNCiDCoMKgwqAgdGFibGVzIGJ5
IHRoZSBib290bG9hZGVycy4NCg0KDQpBbm90aGVyIGJpZyBxdWVzdGlvbiBpcyB3aXRoIHJlc3Bl
Y3QgdG8gRG9tYWluLTAgYW5kIFBDSSBidXMgc3lzZnMgdXNlLiBUaGUNCmV4aXN0aW5nIGNvZGUg
Zm9yIHF1ZXJ5aW5nIFBDSSBkZXZpY2UgcmVzb3VyY2VzL0lSUXMgYW5kIHJlc2V0dGluZyB0aG9z
ZSB2aWENCnN5c2ZzIG9mIERvbWFpbi0wIGlzIG1vcmUgdGhhbiBPSyBpZiBEb21haW4tMCBpcyBw
cmVzZW50IGFuZCBvd25zIFBDSSBIVy4gQnV0LA0KdGhlcmUgYXJlIGF0IGxlYXN0IHR3byBjYXNl
cyB3aGVuIHRoaXMgaXMgbm90IGdvaW5nIHRvIHdvcmsgb24gQVJNOiBEb20wbGVzcw0Kc2V0dXBz
IGFuZCB3aGVuIHRoZXJlIGlzIGEgaGFyZHdhcmUgZG9tYWluIG93bmluZyBQQ0kgZGV2aWNlcy4N
Cg0KSW4gb3VyIGNhc2Ugd2UgaGF2ZSBhIGRlZGljYXRlZCBndWVzdCB3aGljaCBpcyBhIHNvcnQg
b2YgaGFyZHdhcmUgZG9tYWluIChkcml2ZXINCmRvbWFpbiBEb21EKSB3aGljaCBvd25zIGFsbCB0
aGUgaGFyZHdhcmUgb2YgdGhlIHBsYXRmb3JtLCBzbyB3ZSBhcmUgaW50ZXJlc3RlZA0KaW4gaW1w
bGVtZW50aW5nIHNvbWV0aGluZyB0aGF0IGZpdHMgb3VyIGRlc2lnbiBhcyB3ZWxsOiBEb21EL2hh
cmR3YXJlIGRvbWFpbg0KbWFrZXMgaXQgbm90IHBvc3NpYmxlIHRvIGFjY2VzcyB0aGUgcmVsZXZh
bnQgUENJIGJ1cyBzeXNmcyBlbnRyaWVzIGZyb20gRG9tYWluLTANCmFzIHRob3NlIGxpdmUgaW4g
RG9tRC9od2RvbS4gVGhpcyBpcyBhbHNvIHRydWUgZm9yIERvbTBsZXNzIHNldHVwcyBhcyB0aGVy
ZSBpcw0Kbm8gZW50aXR5IHRoYXQgY2FuIHByb3ZpZGUgdGhlIHNhbWUuDQoNCkZvciB0aGF0IHJl
YXNvbiBpbiBteSBQT0MgSSBoYXZlIGludHJvZHVjZWQgdGhlIGZvbGxvd2luZzogZXh0ZW5kZWQg
c3RydWN0DQpwY2lfZGV2IHRvIGhvbGQgYW4gYXJyYXkgb2YgUENJIGRldmljZeKAmXMgTU1JTyBy
YW5nZXMgYW5kIElSUToNCg0KIMKgMS4gUHJvdmlkZSBpbnRlcm5hbCBBUEkgZm9yIGFjY2Vzc2lu
ZyB0aGUgYXJyYXkgb2YgTU1JTyByYW5nZXMgYW5kIElSUS4gVGhpcw0KIMKgwqDCoCBjYW4gYmUg
dXNlZCBpbiBib3RoIERvbTBsZXNzIGFuZCBEb21haW4tMCBzZXR1cHMgdG8gbWFuaXB1bGF0ZSB0
aGUgcmVsZXZhbnQNCiDCoMKgwqAgZGF0YS4gVGhlIGFjdHVhbCBkYXRhIGNhbiBiZSByZWFkIGZy
b20gYSBkZXZpY2UgdHJlZS9BQ1BJIHRhYmxlcyBpZg0KIMKgwqDCoCBlbnVtZXJhdGlvbiBpcyBk
b25lIGJ5IGJvb3Rsb2FkZXJzLg0KDQogwqAyLiBGb3IgRG9tYWluLTAvRG9tRCBzZXR1cCBhZGQg
UEhZU0RFVk9QX3BjaV9kZXZpY2Vfc2V0X3Jlc291cmNlcyBzbyBEb21haW4tMA0KIMKgwqDCoCBj
YW4gc2V0IHRoZSByZWxldmFudCByZXNvdXJjZXMgaW4gWGVuIHdoaWxlIGVudW1lcmF0aW5nIFBD
SSBkZXZpY2VzLiBUaGlzDQogwqDCoMKgIHJlcXVpcmVzIGEgY2hhbmdlIHRvIHRoZSBMaW51eCBr
ZXJuZWwgZHJpdmVyIHRvIHdvcmsgKEkgY2FuIHByb3ZpZGUgbW9yZQ0KIMKgwqDCoCBkZXRhaWxz
IGlmIG5lZWRlZCkuDQoNCiDCoDMuIEZvciB0aGUgcmVzZXR0aW5nIGRldmljZXMgd2UgbWF5IHdh
bnQgdG8gZG8gdGhhdCBmdW5jdGlvbmFsaXR5IG9uIFhlbiBzaWRlDQogwqDCoMKgIGFzIHdlbGwg
dmlhIGludHJvZHVjaW5nIFBIWVNERVZPUF9wY2lfZGV2aWNlX3Jlc2V0Lg0KDQoNCkkgY2FuIHBy
b2JhYmx5IGltcGxlbWVudCBhbiBSRkMgc2VyaWVzIHdpdGggYWxsIHRoZSBhYm92ZSBpZiB3ZSBh
Z3JlZSBvbiB0aGUNCmFwcHJvYWNoLiBDb21tZW50cyBhcmUgbW9yZSB0aGFuIHdlbGNvbWUuDQoN
ClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

