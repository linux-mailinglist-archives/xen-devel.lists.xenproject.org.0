Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88E856403
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 14:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681709.1060639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabTs-000878-9E; Thu, 15 Feb 2024 13:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681709.1060639; Thu, 15 Feb 2024 13:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabTs-00084H-5S; Thu, 15 Feb 2024 13:08:48 +0000
Received: by outflank-mailman (input) for mailman id 681709;
 Thu, 15 Feb 2024 13:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkTL=JY=epam.com=prvs=8775c89ca9=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rabTq-00083y-8V
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 13:08:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f32638-cc03-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 14:08:43 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41FCXna1020881; Thu, 15 Feb 2024 13:08:40 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3w9jqt03xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 13:08:40 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by VI0PR03MB10397.eurprd03.prod.outlook.com (2603:10a6:800:1b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 13:08:35 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167%4]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 13:08:34 +0000
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
X-Inumbo-ID: 57f32638-cc03-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKFD7ItsiQH7K0KwjtckM5PkY75Upx59C4EChvSknKpo4X6YsdhIy6ydpiUttT6GfeMSRMOQb5+jFTsuBfDqKCOUu8VL+VacnNpl1TBvR8hLqurQl/ByBm9rexAt+8GhkhU90oNscB25c/0UQh6rRozqFPmvQxkDZlXVebJW14cdpcvyXicfX3HVDk1rfRgfWYWZ+ifOWU6mjdrsswg7x6g8D3Gll810mqvD55SDmx2y7NCYB2QwNkLGyWzRG/JqIDbZlevFxVAxvBeX+A6e0HElzuAv6LUacojyubPFGqlpCdyHQFhKyJgthJ//ZgXU0eMjPwuCTRcr3Rdpr7qvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esFLRZ0NxMYwaOuMwp9NhK/tOhIteumlkqPY4MKo7dg=;
 b=P4krCnyOYxSSGGxfO0QBYAdsIvyNv7vYtMjcoxorx08CzSJ2vsWH62yJdj3sSHzuBMz89Bre+ulY98ZHXo4KhWAgB606YRZCmLG7USReqPQTtVm4+oMUkBGHmliCM/cLz8kdzC0r8913DjgLUGh4a5ycQP7add3vrlaqdQuDe6E5DYY9UROH8MAt5lbRZ5H93R37H382uTndYr8IfKdrUiXlX7XlZjupN20EA+aMCngEzF6U4LIDEBPnoi47uZXcXVoIcYKwE8KsqPhy1IZAOGnWNxDDeewHzXtPd+6foU7y8jpnrhQ/x9Mts9oagKclkAN3VLKtkVXrG0xCCVcFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esFLRZ0NxMYwaOuMwp9NhK/tOhIteumlkqPY4MKo7dg=;
 b=A0+60p3njLNRKE6444HZveonTaiQB6QrAztExHCv2r7K5H3ofUs56psFLwXrvB7F3Y/PnAwtd4IDsdr7nrTYHGjIHigp73jUMaQ84M2HAsubI2rsWGeB4NQihHz7OrccQUI8nxq1BkAazoGeeAMAl9Crx2qyNHXFttZlv95jOWH5qacKAGrQdqIDps3f1KIL5EAPlHZvX459dVm2CwOsnDOQh7Fbwk6fud71E5GpTgqwm+KRMYmYu7pH+CF8i8ZEwCn5KSz+69GAOuqlYlC0vc2Go+9I1yuYHp+j3XESP2stjcFzmGdSbcs67pj/gTmONYHaA0AMclcF4Hm96SriFA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
        Viresh Kumar
	<viresh.kumar@linaro.org>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH V2] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Topic: [PATCH V2] libxl: Add "grant_usage" parameter for virtio disk
 devices
Thread-Index: AQHaWPlfVfBPDqFzI0qC9ZNM13q/+7EIOn0AgAMzrQA=
Date: Thu, 15 Feb 2024 13:08:34 +0000
Message-ID: <49102cc3-9165-450a-9533-b4a2bbc012fd@epam.com>
References: <20240206123814.2308837-1-olekstysh@gmail.com>
 <a12d924d-b570-4795-8ed6-f62f3604c361@perard>
In-Reply-To: <a12d924d-b570-4795-8ed6-f62f3604c361@perard>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|VI0PR03MB10397:EE_
x-ms-office365-filtering-correlation-id: 9c179d64-3b39-4374-834b-08dc2e273777
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HtmNpNkST8WaQeKCUQxvxMFddzcW/SlCJJMl7Hv0Ra0NTmi5+5B6cd1Z79P7VanS/DuPjSvIhUX5OYR4p0Ep2Sq6P7W9qCl6E1Usgdrm62TeuS8nUkgrmIaXOI2Lm1ZFjxtd8S46NB0dMvxn5wtwGp7Kpl3Qbhg9NDyu4CFY42dG28VfGZhHQ8n5aOEi5tVLCwYjyThhGmiFnBPDHPQvFy6AidJOpPYMHNXaRb7V8b1zbPY4MFLkB5yoq+sovreNfZOfMaMox2YiaP5exRpXMYnZvzMh6S60tr596S40XFMq7kxx24Lm+NdbCRu24egrTbvBPPDDxWyWxIjRYxaSTMrj0HF+RuZ+sSU0ArGheHBNqVz8yXi+4BWf3pd22243ilTfsWFAIOujLaW6uW2KNczeABYND+GZ8eGdavWn8KsZQqigW+evU3qfhhddhJBYLZ0fX1XbluOH2NMR++/LMAgI6ZCIGYGZLWE/Yovt/gWdZidStCdhnULAc/VBKYVitrxwBludUpe5HVi4QRs/wmMriQSJ09//VcUohnsN1HhLBltN2LOJtTZ2YCFpIZ+pohltZUfmI+zrd7/T4lFLjhmXcZVXMXob7nZJPczNiSs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(4326008)(38070700009)(6916009)(83380400001)(8676002)(66946007)(26005)(2616005)(41300700001)(76116006)(66556008)(6506007)(53546011)(66446008)(6512007)(66476007)(64756008)(8936002)(6486002)(71200400001)(54906003)(31696002)(966005)(316002)(122000001)(36756003)(38100700002)(86362001)(478600001)(2906002)(31686004)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?blFINDJ6K0g5NmtpRmhwY0pjaWdWUWxjNEhHdVlnUG5lTGJrSzhiejBwa2RF?=
 =?utf-8?B?c2hsUUZETkkrVitwaitIMmRLL3FmbjUwMFI0Y29IYUVUYnhoYitMeHlIajlB?=
 =?utf-8?B?Y25aLzF3NDJMNENFbEZGdWdTSjJMTzI4c2VaZStFL1JieElGR003NWw0a0hq?=
 =?utf-8?B?Mmg1d2tNc211ZDJVMm5ScUcvQWxSUVJGM0NBYzMxUitROG5vWS9Md1R0M0Q0?=
 =?utf-8?B?NVFVRGZOTHVZbVFBZ2t2SmFPNVp1ck1tL243NXlpQnl6ZWxSUEVSVVVrUEIv?=
 =?utf-8?B?VWZ2cGxWV2dhbmgvNW9Ia3RBL1FXak42SnNJQ011UGZXcmE3Zm1ZY2JudE45?=
 =?utf-8?B?LzhqOFVOQ0ZKSUJYZ3JlZjl2NlE0WjRHTFloTENxMEd4QXdqTGtoUy9tUHNp?=
 =?utf-8?B?amdYN0txUkNkTk9wVkkzaUlncTBXWllrNlF2WHlXTm9QVE15WENkRWY1Tk9Q?=
 =?utf-8?B?TjJxVFJuK0hDK3hCcHNEVXNSaUt3emlBYkZoMmVnNjNQa1oyK0wxSWtZSVNI?=
 =?utf-8?B?MFJ3M3MwYlNubXlYS1VqdjVJZjdNMWdsMGhHRkZ3Yk5PbGhkZHBicXBTNDNU?=
 =?utf-8?B?elRubWxlbklJdXBkSlJleTdCb3BVZlJXYVdiaEdIVjZ3SlZBZjFmR2w3L1Ax?=
 =?utf-8?B?d1VxS3ZJOUNva1BaK1krQlVVekpoYXJ2UkhGaU5aYi9ZU2pibHJjU0Z1dTRI?=
 =?utf-8?B?RUh2dUV4N05ybzhPZENVVWhFak9lWVd0N095UWp1Nk1mNmcvTmtaNlhSc0NY?=
 =?utf-8?B?ZXdLaVBDQzBhZEIyT29UYmNibXErYjNqdTNyZTg0alV0QXFDQUxQSWNNREE1?=
 =?utf-8?B?bkFXMVJvSjJXanVJRlpCdXNmZDZpTG4vT1Zsd3M4QzJPWlVNeVI2N0VGUllV?=
 =?utf-8?B?ekxNa0dOV0N4a2tRcW1nbkUvRENDejZoT1grU3JQVVRXNlJxYlQzUGIzNmZ3?=
 =?utf-8?B?SmxmSk9JbnRkQTEwUkdyc3hOWEUrMUxJcGVoTVhwQm1lVE1YY0JxV0V5eTBS?=
 =?utf-8?B?akd4V21ETlI3dDFuTWFVMHpXKzRYa3ZCbGpkZWJMMWthNDFYUlh5YWZmWTI0?=
 =?utf-8?B?VmRRV1c5UjhFNm9YUG8ranpuTEtRTlR6b1NlVkpnaXlETEhMNURJdUpoK0dp?=
 =?utf-8?B?ZWJpTFgzTHp3N3M5VWRNbWtOWmFDRXB5eXMzWndHRkV5NzU1UEVQOWZmZlNI?=
 =?utf-8?B?ZVA1cE0xSnVITFhDbi8wNUg0RmpJN1JBY3hWQ2JJSDBjWFBZMXRDQXFGRlI5?=
 =?utf-8?B?SkptOXN6MWc4ajRQOWhyZDQ2M2dUMSsrYXFJMFdnQ3NWcU9qWDBlcm55U3Ja?=
 =?utf-8?B?WmRiTWtpRkxXTTJlanJZR1RjNkpKbUJsMUhaeFU3eTNOKzlQYTBtODE2aEEr?=
 =?utf-8?B?dHpYNGFQUTgrdll3a2lZK3FNejlIUDJFVkpoUFdEakQxYjhFdjFMWkwvcWNI?=
 =?utf-8?B?QUU3RnhXdlgzb3A5NTdjZUFUdHIrT0ppNjdjb0E4RUo5M0xnYk91S0hpZ3lE?=
 =?utf-8?B?VXROL2Zhblgzdkd0REV0WnUvZUdwc0ZuZG1DQXJOU2JGSkgxcEJKMHAyWjNi?=
 =?utf-8?B?ZksyWlVNNkgzbFZueldwZ3dURE5XSllVc2lLbTkzYmhLQ0phRk5MWEl3VUNY?=
 =?utf-8?B?YnE2L3cyYnErazQvRUdvSmY5VlowUjd4a0c3OFRJTE5vaFdzcExVcEdDek0v?=
 =?utf-8?B?RVZ3NEMyRllodXFMc0NoU0Y3dDl5LzVKTkRpVVM1NFJKV3crT1REM0Q0Vndh?=
 =?utf-8?B?YkwzSWJxRVZEb2VqVEltNTFheVVaSkJoRGwvemlkelNFZW8rNW5yYThueGp0?=
 =?utf-8?B?K1FZNmJlRzhDdzAyamZFeTlYZlp0bW1vTkRMU0pSa2pubE9DOEtFQlBwUUl6?=
 =?utf-8?B?T012OFdDUEhibmtKRGlkQUdnU1VBWGhJNkd1MWVMSjJZSU9xem1sb0VMTjEy?=
 =?utf-8?B?Skh2WTlqcWhBSFN2YWg5RlJqYU5KSThnVTY1YjljTHd1R1c4Q3hGeElXYVA3?=
 =?utf-8?B?dUNxTkUzMDNxQllxYzRacmtXYVpFWVVVL1JhVW83MTQ5WGMxblhnZFFkV0Iv?=
 =?utf-8?B?R0Y2aUJQK3dNTzBRNWV0V0IreEVyUHROa25QMGxUdGJUOGk0NHJ5bGw1RGtS?=
 =?utf-8?B?VEt3NjkweHhQSGphWlE0LzA4VXdhMCtnSkZYNDQrZEJhWXBVSEJaamtIK0JZ?=
 =?utf-8?Q?rSA1U6CDuzuCcxQBvO8eCGo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4A710595B067745B1D92C9ED3AD2EAB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c179d64-3b39-4374-834b-08dc2e273777
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 13:08:34.8565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4wyxUVHeBNy7/IPRegjZrvuH6zLN/oQk6XkaIFizzeNUqCa6cWP767QJuy+e2ehlzaz9J3IETKVbi9R0iSXBZxADamkoSuH3kP6yD541ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10397
X-Proofpoint-GUID: TSFpLSy0wYxPIN-3iRpLTwdw37rzNTB-
X-Proofpoint-ORIG-GUID: TSFpLSy0wYxPIN-3iRpLTwdw37rzNTB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150105

DQoNCk9uIDEzLjAyLjI0IDE0OjE0LCBBbnRob255IFBFUkFSRCB3cm90ZToNCg0KSGVsbG8gQW50
aG9ueQ0KDQo+IE9uIFR1ZSwgRmViIDA2LCAyMDI0IGF0IDAyOjM4OjE0UE0gKzAyMDAsIE9sZWtz
YW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9s
ZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IEFsbG93IGFkbWluaXN0cmF0b3Jz
IHRvIGNvbnRyb2wgd2hldGhlciBYZW4gZ3JhbnQgbWFwcGluZ3MgZm9yDQo+PiB0aGUgdmlydGlv
IGRpc2sgZGV2aWNlcyBzaG91bGQgYmUgdXNlZC4gQnkgZGVmYXVsdCAod2hlbiBuZXcNCj4+IHBh
cmFtZXRlciBpcyBub3Qgc3BlY2lmaWVkKSwgdGhlIGV4aXN0aW5nIGJlaGF2aW9yIGlzIHJldGFp
bmVkDQo+PiAod2UgZW5hYmxlIGdyYW50cyBpZiBiYWNrZW5kLWRvbWlkICE9IDApLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4NCj4+IC0tLQ0KPj4gSW4gYWRkaXRpb24gdG8gImxpYnhsOiBhcm06IEFkZCBn
cmFudF91c2FnZSBwYXJhbWV0ZXIgZm9yIHZpcnRpbyBkZXZpY2VzIg0KPj4gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS94ZW4tcHJvamVjdC94ZW4vY29tbWl0
L2MxNDI1NDA2NWZmNDgyNmUzNGY3MTRlMTc5MGVhYjUyMTczNjhjMzhfXzshIUdGXzI5ZGJjUUlV
QlBBITE3MnF0MzB1STdEcHNaY0stSXBadTI1Sm9RU2NQZUY3ZG9fTUQtS0VxSmxvOGdhSC1UVjFQ
X0gyQ1lmc0dJMGpfbDBHZFVQUE80Qmp5VUQyUTg2TGsySWxGNXpDaUZXTUF3JCBbZ2l0aHViWy5d
Y29tXQ0KPj4NCj4+IEkgd29uZGVyLCB3aGV0aGVyIEkgaGFkIHRvIGFsc28gaW5jbHVkZSBhdXRv
Z2VuZXJhdGVkIGNoYW5nZXMgdG86DQo+PiAgIC0gdG9vbHMvbGlicy91dGlsL2xpYnhsdV9kaXNr
X2wuYw0KPj4gICAtIHRvb2xzL2xpYnMvdXRpbC9saWJ4bHVfZGlza19sLmgNCj4gDQo+IFdlbGws
IHRoYXQgY291bGQgYmUgZG9uZSBvbiBjb21taXQuIFRoZSBjaGFuZ2VzIGFyZSBnb2luZyB0byBi
ZSBuZWVkZWQNCj4gdG8gYmUgY29tbWl0dGVkIGFzIHRoZXkgbWF5IG5vdCBiZSByZWdlbmVyYXRl
ZCB0byBpbmNsdWRlIHRoZSBuZXcgZmVhdHVyZQ0KPiBpbiBhIGJ1aWxkLg0KDQpUaGFua3MuIEFz
IFYzIGlzIG5lZWRlZCBhbnl3YXksIEkgd2lsbCBpbmNsdWRlIHRoZW0uDQoNCg0KPiANCj4+IC0t
LQ0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfZGlzay5jIGIvdG9vbHMv
bGlicy9saWdodC9saWJ4bF9kaXNrLmMNCj4+IGluZGV4IGVhMzYyM2RkNmYuLmVkMDJiNjU1YTMg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2Rpc2suYw0KPj4gKysrIGIv
dG9vbHMvbGlicy9saWdodC9saWJ4bF9kaXNrLmMNCj4+IEBAIC02MjMsNiArNjI4LDE1IEBAIHN0
YXRpYyBpbnQgbGlieGxfX2Rpc2tfZnJvbV94ZW5zdG9yZShsaWJ4bF9fZ2MgKmdjLCBjb25zdCBj
aGFyICpsaWJ4bF9wYXRoLA0KPj4gICAgICAgICAgICAgICBnb3RvIGNsZWFudXA7DQo+PiAgICAg
ICAgICAgfQ0KPj4gICAgICAgICAgIGRpc2stPmlycSA9IHN0cnRvdWwodG1wLCBOVUxMLCAxMCk7
DQo+PiArDQo+PiArICAgICAgICB0bXAgPSBsaWJ4bF9feHNfcmVhZChnYywgWEJUX05VTEwsDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHQ1NQUklOVEYoIiVzL2dyYW50X3VzYWdl
IiwgbGlieGxfcGF0aCkpOw0KPj4gKyAgICAgICAgaWYgKCF0bXApIHsNCj4+ICsgICAgICAgICAg
ICBMT0coREVCVUcsICJNaXNzaW5nIHhlbnN0b3JlIG5vZGUgJXMvZ3JhbnRfdXNhZ2UsIHVzaW5n
IGRlZmF1bHQgdmFsdWUiLCBsaWJ4bF9wYXRoKTsNCj4gDQo+IElzIHRoaXMgaW5mb3JtYXRpb24g
dXNlZnVsIGZvciBkZWJ1Z2dpbmc/DQo+IA0KPiBJdCBzaG91bGQgYmUgZWFzeSB0byBmaW5kIG91
dCBpZiB0aGUgZ3JhbnRfdXNhZ2Ugbm9kZSBpcyBwcmVzZW50IG9yIG5vdA0KPiBieSBsb29raW5n
IGF0IHhlbnN0b3JlLCBhbmQgSSBkb24ndCB0aGluayBsaWJ4bCBpcyBnb2luZyB0byBtYWtlIHVz
ZSBvZg0KPiB0aGF0IGluZm9ybWF0aW9uIGFmdGVyIHRoaXMgcG9pbnQsIHNvIEkgZG9uJ3QgdGhp
bmsgdGhhdCdzIGdvaW5nIHRvIGJlDQo+IHZlcnkgdXNlZnVsLg0KDQpJdCBpcyBub3QgdmVyeSB1
c2VmdWwsIHdpbGwgZHJvcCB0aGUgbG9nLg0KDQoNCj4gDQo+PiArICAgICAgICAgICAgbGlieGxf
ZGVmYm9vbF9zZXQoJmRpc2stPmdyYW50X3VzYWdlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRpc2stPmJhY2tlbmRfZG9taWQgIT0gTElCWExfVE9PTFNUQUNLX0RPTUlEKTsN
Cj4+ICsgICAgICAgIH0gZWxzZQ0KPj4gKyAgICAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0KCZk
aXNrLT5ncmFudF91c2FnZSwgc3RydG91bCh0bXAsIE5VTEwsIDApKTsNCj4gDQo+IFBlciBjb2Rp
bmcgc3R5bGUsIGl0J3MgYmV0dGVyIHRvIGhhdmUgYm90aCBzaWRlIG9mIGFuIGlmLi5lbHNlIHRv
IGhhdmUNCj4ge30tYmxvY2sgb3Igbm9uZSBvZiB0aGVtLiBTbyBjb3VsZCB5b3UgYWRkIGEge30g
YmxvY2sgaW4gdGhlIGVsc2UsIG9yDQo+IHJlbW92ZSB0aGUge30gZnJvbSB0aGUgdHJ1ZSBzaWRl
IGlmIHdlIHJlbW92ZSB0aGUgTE9HKCk/DQoNCg0KV2lsbCBkby4NCg0KPiANCj4gVGhhbmtzLA0K
PiA=

