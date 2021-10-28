Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D843DFC8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 13:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217880.378097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3Jo-00085H-Io; Thu, 28 Oct 2021 11:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217880.378097; Thu, 28 Oct 2021 11:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3Jo-000820-F8; Thu, 28 Oct 2021 11:11:36 +0000
Received: by outflank-mailman (input) for mailman id 217880;
 Thu, 28 Oct 2021 11:11:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg3Jm-00081u-4P
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 11:11:34 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c897fe9f-6d2f-415e-8c99-2ce44c5ac7b5;
 Thu, 28 Oct 2021 11:11:31 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 19SB8Edp019805;
 Thu, 28 Oct 2021 11:11:30 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bytqh80ej-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 11:11:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6770.eurprd03.prod.outlook.com (2603:10a6:20b:283::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 11:11:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 11:11:23 +0000
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
X-Inumbo-ID: c897fe9f-6d2f-415e-8c99-2ce44c5ac7b5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUKor2PbqwFUAxx/qSeU2GU4e2b9wjBVOx0GkS+yLAMsoOTdfl79R6CopafoKVarqjDU2KDTN3lILG7vjxzWee1jSiLQ2LyJXr0AY+qXxL7G63SXJgbW/x6Bvyp9+Fm/10CqxsN5jbdh5x348N9NE9lyd7vus6JR+WDxWDvhVGdkKdnD6gZUqA0jpFTUG5z5Jmt8iVuoTnr5nWAQtnJOd15sUbsc+d2BMELdZ0k9Egvfu9OClxbJ0Uf6lYRK7LLTJkyKiyhabpTfJ9PB4cCfDCHOGyZJhU+GWc8yrZTx1ASUF1S8QbvuEDCn1IwnU1xn90v0mEsM9AM8sx6esfsd2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XE1DNF78RLY3YWtWlW6oEyxJ3XO2LTZWjFEO7rBssQ=;
 b=ahs4uOpnD8trXqZFFKtVhCk7DRKgewpx4DZXVIkaD+F6y335DR2uU+ILBYF+mIp4ItF4AR3sBhXrcZp38qti9HCl1yrHu0QB3L2z3xRTxLn1PP2NxmTg44IF7FyeuyR/WBZATbDSCBCme3i4j9isACndWZD2gv6sdWGnq4rqcPvXedNVZyHvYxc1q4hOVrIk75KSYzERfv2H/QX2BFE6mPscRInmB/bZ4BmkA81hXopSX+K4LDQrqZM7CjuYFfXBXNetJY1RkuVX92Mbgqad89fduqxrubdrK0PwphF68QdqQInGeS0CDzZoa+ejFvNnSQOzer/vSfyVGpMdLUJGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XE1DNF78RLY3YWtWlW6oEyxJ3XO2LTZWjFEO7rBssQ=;
 b=fYW7GwTPXyZIc3hx3ndg3FtOsMkFIwX5R+gQ5qLMpzCqI5kvNWTG5Gs4NjMvd3hCOOz1Wxu53jYIrvHWATbRXCHDMo+7MD+saqz9Rul/V+NgIizglRpZARaSacDHAYewKV3UJK+f1negmLLiut1ofvpsbqk9fsExKIlqTirTfufKKqdB8oDYzwrPihfZtGbkw5aP3712OczQV+0tmU7N8Q5rgKDA5B3uOAAO2hJp03115AWA0ZNygwY88cnn6Rkwowy7XurAiS3cD1DTAPLW3Y5Qa7eSJo0AlyxypDCRVLCwCfg4SsXGYX1bk7evoaPQckfQj0Y9rL4I9EM9gAdWVg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
Thread-Topic: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
Thread-Index: 
 AQHXyw3lMiQK+jRYtUWdkzZ53OfPJavnJMeAgABhyQCAALX3gIAAA8+AgAAAg4CAAAIfAA==
Date: Thu, 28 Oct 2021 11:11:23 +0000
Message-ID: <dc8c8794-b896-dbc3-1fe5-f4b8c84b4f96@epam.com>
References: <20211027083730.1406947-1-andr2000@gmail.com>
 <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
 <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s>
 <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
 <1bb4f2d7-958f-4408-c04e-88d9b580d2a2@epam.com>
 <3c6efc32-3e3f-6a26-952c-6347501b8a78@xen.org>
In-Reply-To: <3c6efc32-3e3f-6a26-952c-6347501b8a78@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2aa34b9-a030-4dee-8d14-08d99a03ad58
x-ms-traffictypediagnostic: AM9PR03MB6770:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6770A14F425F9744671849A7E7869@AM9PR03MB6770.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u6qzlkgpQCOcZho2wePUWkKBx+r4PiqfogFTYNSLFXw04IwM4sPAlLN0ZWmqM6vaIvmgZNNQPvbZIDSNV+pC24nPaF/6PIsl9ek2dDw/JSQktHkJ+QWLXOhyFkj7pGu98LV/L0dcMGTjcpOREYtqRxe5HTrcHOrgwjMtSR34pn3ver1TfdgYWBhU0lweMk/9GJ5FFV7/7Q2SsM4hnRsdLmyarL27C8mqeJQK6ro5+O99w7jgW+xPDEsfi6ZC66Il/YKbfUjTcOneM2ZBlm31p/4XR/DUoEnZlQNzY3/AIq/qSo0EqQnael+nxOjeNi+n8JG8jGQng3sYrKIJbAEKudWwFplz63LiJUuFgwhviERb4Ic+FvaScIyebMG2qJKGRzizHVMG2Dadc7MuKvnCjrJgdmQu/7+y/iG4JQZyOfh87QcsO4SnBfQyJOpPPZgIhlfUHMKG46WXwTmbH65qW8huOXYa0lXfDbWF3GIxPTjfy/s93TI9HNxQ7Swl7uz6v7f20rG7Ughg/087Errxo/0ZKObW6GpnUysW+OxjiUrGynv6AES3CU4hI82VuFzVxl4/H+sbdmjgR2JRnB02Yddnlm9UT+sf4Bv2Q448ExEBSCIHTQHkW4bMWGZ+cTZPLHb9VMgpoNMIxn82OGTOyuhu/zuOmHemfsSNe8L0mJWBE2k0zMj9z2Ge8VDbaffQfwcujTFjSwxuONMHQlHvuGpRyemGy/cUBSe0NJJQdliLJK/GqhtDkZTUt69KuLIQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(6506007)(53546011)(316002)(54906003)(508600001)(64756008)(5660300002)(6512007)(66446008)(71200400001)(83380400001)(8936002)(8676002)(186003)(26005)(76116006)(55236004)(91956017)(4326008)(110136005)(38070700005)(122000001)(38100700002)(2616005)(66476007)(6486002)(2906002)(66946007)(31686004)(31696002)(66556008)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RGNsZXlEdkFsZ1NEMWhSOEhTMUJuUENOUVNMTkl1OXlXbExGazFsaUlEa0Z2?=
 =?utf-8?B?NUpHV2xVbFJkNkk5aDhVQklQRkhVRThEd1BMZXM1V2lWQmYrS0FsVWwzenVE?=
 =?utf-8?B?TkhsOUdTWEUwNGN5MVdMNkUxVGhIM1VMbUh0VE5HVWFGWWxGS0hpRkFEZVQy?=
 =?utf-8?B?VXhkazBXMGpEUm5jNmJIc0NoVzdKZDZOMmV6K05OOG9wUHpUUENEVkJ2TmIx?=
 =?utf-8?B?UlJYMk02QllBbjNQTUIwTExxVmJoTnM4V1V4M2ZRTU0xVGJoMTF1ZGlwZ3dS?=
 =?utf-8?B?WTUxT1llVG9uaFVPRURKUHM2blpMQUxUSm4xa1hvbVVzaU5TQXpldThLOTRN?=
 =?utf-8?B?a2VVeGFzTmNXc1FMTzJPWkJZVm80NXhkcUF1S0pJV0FVZGsrLy94c3BIbEMw?=
 =?utf-8?B?dnRRZmhlUHRadFZmWVZoWktvQVRWS1R3QXRhS1A2cWdsTTJMaklqcDZyVE4v?=
 =?utf-8?B?VlBOUWNnRHo1VjN1bUtPVnp3b1ZacC9HYStCWkMrZERYNkFwcXZna2J6T3dh?=
 =?utf-8?B?OCtzaWR5Rmh4WmE1LzlVR1FLTUtCOEZDVTBLVDlvWDRDcTU5NU1oajNKeFgv?=
 =?utf-8?B?cExFcGVEUmRKWW1zUDdnMGNkZG9adlFiRmNkQ2NZekxnVlUxTFYxM2FCem5a?=
 =?utf-8?B?b1BDQWJPR3ZGSmtYMG50Vm03bE93R1N2QjF0WXpmT0VobTdUcStVTjZPdzJ2?=
 =?utf-8?B?Z2VrZTZPdmZ1c3YvemNRZXpQcDQ1Z05iTEx5MWxKZEN5aDlmV1N5QTlFQVRP?=
 =?utf-8?B?S3hUNk1jZ1JmZzJaMXFxMWZhWDlqMjYxUDFHajJWM0h3eUUwOWlvYUxpbWI4?=
 =?utf-8?B?dXNZaE9hWHVVTkFNVUFpb0RHVzVQdUtXSnFDWVJwRWpRa3NUMEFGa3BEcDlw?=
 =?utf-8?B?OVRvbzZtRkUyWnNIdUlsd1RsakJQNzNOOXZiUXl3SGcxSUZualVYT3NzbklF?=
 =?utf-8?B?aXdWeWVkOExPZy9JVmh5WXR6M2Y5ZUV5UHZKbDB4VlVKa3o3dlFkcVV6dDJL?=
 =?utf-8?B?ZlRZbEVRLy9MdmVERndwRVRkWUtObE9wb2w0U3owdlFsSzcvWkdUNkFLQTAx?=
 =?utf-8?B?T3luU0dhRXRYNjNUcUdZRVRFbnE3anJqSU9iWXZoUngxQTRuVDFUa3p1MVUw?=
 =?utf-8?B?dzVKSUdTc24yS1RhcXFnUkRudDhsRFlvby9wSUQvNW9QVHNMaGtLTnZPNkVm?=
 =?utf-8?B?bjBtd2ZaNlFlSDRIbW1HK1lVeTFLL3pnWmZGcGlBek9BTTFrOHB0UElMTjB4?=
 =?utf-8?B?N1cra3JtRXBiMFZwTHZEREExSVZrOTBVbHlPZWVBQzliSUJwdndlNWxpTzEz?=
 =?utf-8?B?bUNZTm5mVmFsbWw3NUd3cGJNZWcrRXpvNDJLTlVDMzRDOEtQTjlXT0JZSmVv?=
 =?utf-8?B?bHVCS0VvOTZqdTA5ZEszYW5EUGY1Y1ZPTnVpdUN5MXhVcHNjeEJJaDYvbnBM?=
 =?utf-8?B?bE5ZTzZ3QTlXNmhTVnl4K0RTcTFrbTFRQnFtNlN6eVIraGFCditrYk82K2dV?=
 =?utf-8?B?anVQNENSVElnMSsweE1FVXpPQTVBd2tFK09rRHJ0RndCMmNUNVdqWHVUNzQr?=
 =?utf-8?B?R3N2b0RVZGZ2MEZ4Ri9FckZ6ZmFFNjZUaGoxN2VlNVF3UUxoUFBrVGxDblA5?=
 =?utf-8?B?SGdvSlpocUVyUzFKSHB2MXkrSXhhbDZGTUxVUHpVRnJ3STdSRHZ0RVd3TGov?=
 =?utf-8?B?VDR2aUdCV1p5Y0x6ZFZDS1FQMDl4MDhDdGdnejMyamlsMnZEeFJPQnhFNE04?=
 =?utf-8?B?Z0s5bWJnbnpYV2pQRG8zVkE4TlhoazlxbXlPWFNGem1zU1IyV0FPaTFhZTJh?=
 =?utf-8?B?cDVRajN1Rjk3aDArYmtQWkZYMkdONi9uUTJMSExyeUwvSW04eXNIaElqK2dB?=
 =?utf-8?B?Vml6SjJGNXUvZi90MzBpNzZIQWdubHJNaWQ0Y2JQRC94bk1HbEIyZVRGczlS?=
 =?utf-8?B?QTFGU1FzYXdwbEVFK1pLN3Y4Z0o0WTBzREFMS242VW9sVUFQSm9NTnpxdXRm?=
 =?utf-8?B?SlJ6NkU1YjNDTTZJV0VTbkJSZ0dSUytlTXJSazZFdEVHUThVR0M3Uy9sdFpz?=
 =?utf-8?B?c211bFJydTVvS3VORUxMQjEwL3BkMGJOczZ1WWtoWmNlZjBaQjFhcWx5LzI4?=
 =?utf-8?B?S3RSWmtMaW5kQUMzVVd2c1RZbERwNXd4RjlBZFBlaklRVC91OExSVkpLTjRF?=
 =?utf-8?B?SkRaK3dLbFprdk5tVU9oVkcwYXdKelR6SW1DS2R2cGdLcGNmZUVPY3BSbnFQ?=
 =?utf-8?B?TVcyKzNITE5uT3hFc0IwajJHNEV0KzhsVDdBSG1uc3JBTnVZczNYcWxqTVhh?=
 =?utf-8?B?TzhVWEI0VTlCUzE2bWlPQXdNTDNCMW5VWjNSWm03UWNuS0xCT2VvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <362DFFD03B6A644E83CC02FD9C3DD261@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2aa34b9-a030-4dee-8d14-08d99a03ad58
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 11:11:23.1933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qzob6TeBZGUhmSZAnoV5arp/nl5i5ZbZAR2DN2NGbqIdKJIjYD0JxsYxVo98WT4mqwpX93Vs1N1WlQAVgVlcERlNetG0ged1gOgCIGJpNjwPHz+nR/Gcz/mfjgVLQf2J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6770
X-Proofpoint-GUID: ygs0qeRy_AhW2ATu_9PTQmN3mtqpF9lD
X-Proofpoint-ORIG-GUID: ygs0qeRy_AhW2ATu_9PTQmN3mtqpF9lD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=461 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280062

DQoNCk9uIDI4LjEwLjIxIDE0OjAzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+DQo+DQo+IE9uIDI4
LzEwLzIwMjEgMTI6MDEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gSGksIEp1
bGllbiENCj4+DQo+PiBbc25pcF0NCj4+IE9uIDI4LjEwLjIxIDEzOjQ4LCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQo+Pj4gSGkgU3RlZmFubywNCj4+Pg0KPj4+IExvb2tpbmcgYXQgbGludXgvYXJjaC9h
cm02NC9ib290L2R0cy8sIHRoZXJlIGFyZSBhIGZldyBEZXZpY2UtVHJlZSB0aGF0IGNvbnRhaW4g
dGhlIHByb3BlcnR5ICJsaW51eCxwY2ktZG9tYWluIi4gQWxsIG9mIHRoZW0gc2VlbXMgdG8gYWxz
byBhZGQgaXQgZm9yIGRpc2FibGVkIGhvc3RicmlkZ2VzLg0KPj4+DQo+Pj4gSG93ZXZlciwgSSBh
bSB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IGl0IGlzIG1vcmUgY29tbW9uIHRvIGhhdmUgYSBE
ZXZpZGUtVHJlZSB3aXRob3V0IGFueSBwcm9wZXJ0eSAibGludXgscGNpLWRvbWFpbiIuIFdoZW4g
UENJIHN1cHBvcnQgaXMgZW5hYmxlZCwgWGVuIHdpbGwgZ2VuZXJhdGUgdGhlIGRvbWFpbiBJRCBm
b3IgdGhlIGhvc3RicmlkZ2UgYW5kIHdyaXRlIGl0IHRvIHRoZSBEVC4NCj4+Pg0KPj4+IFRoaXMg
ZG9lc24ndCB3b3JrIGZvciBkaXNhYmxlZCBob3N0YnJpZGdlIGFuZCBJIHRoaW5rIHRoaXMgaXMg
T2xla3NhbmRyJ3MgcHJvYmxlbS4gQE9sZWtzYW5kciBjYW4geW91IGNvbmZpcm0gaXQ/DQo+PiBZ
ZXMsIHdoYXQgSSBoYXZlIGlzIGEgZGlzYWJsZWQgbm9kZSB3aXRob3V0ICJsaW51eCxwY2ktZG9t
YWluIg0KPg0KPiBKdXN0IHRvIGNvbmZpcm0sIGlzIGl0IHRoZSBzYW1lIGZvciBlbmFibGVkIGhv
c3RicmlkZ2VzPw0KTm9uZSBvZiB0aGUgYnJpZGdlcyBoYXZlICJsaW51eCxwY2ktZG9tYWluIiBp
biBteSBkZXZpY2UgdHJlZXMNCj4NCj4gQ2hlZXJzLA0KPg0K

