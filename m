Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE643E7DF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 20:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218211.378551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg9hX-0005YE-51; Thu, 28 Oct 2021 18:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218211.378551; Thu, 28 Oct 2021 18:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg9hX-0005VG-0K; Thu, 28 Oct 2021 18:00:31 +0000
Received: by outflank-mailman (input) for mailman id 218211;
 Thu, 28 Oct 2021 18:00:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg9hV-0005VA-HQ
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 18:00:29 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9759b898-ad4e-45fd-9941-b5b9141bb3bd;
 Thu, 28 Oct 2021 18:00:27 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SHwkQP032018; 
 Thu, 28 Oct 2021 18:00:25 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com with ESMTP id 3c00qxr09p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 18:00:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6066.eurprd03.prod.outlook.com (2603:10a6:208:165::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 18:00:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 18:00:22 +0000
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
X-Inumbo-ID: 9759b898-ad4e-45fd-9941-b5b9141bb3bd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1Y8EgoeCu24OTmpEfOPHEl1nPjrvA0v8M+ujpiXwC+4PlXETXq19Vj6Q3bk+AhRql/7PplPVvTuGRu5PDAPX2/E7Qw5xj/GyVrfErs7ypI9bBpXE0DwX5UIbi0QqpHbs7AeKH4inH8CqkUHuUenyUfwxLnwvAtOf3n4kol8SkRkndxV4kwPXcIlSdYUQMkBxAwq/KwvOA3dZyL5I5KXtjF0C4NMzyO9z1V3KGDcr6OZZ9VcJJVXjQH+GF2ZBbc9lYuRnALf0nP3EKD1gKURxNphnhiYoYyvdNGf89d34tuV32X32Wi/SbiyQS7Bf0f66no72Br68zoYowoWRHT7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpKiKheWiTfjBLTy5YHdUPBNxXxGmMNB11suL+eBGNc=;
 b=GhCS3WoeGNSiyHNH4Q8S+aaI6+WZue8MDfKi4ip+M8nvKFvZZyFf2vgsC1S8NYV5PUdDLf4iyINiDBTA2mUZCGQF2tWTlDYV5X4HljN/703qbUfeq+tjbxnAWbkPOHccBEJ8sO89GAyUISmHRfFMsDftI5Qt6+AYt+IZmRm6vG6S0xTf0jm4Nozcowhu39p0hGND4IsgjiSxTNBvbPVy6HP+vQjmmE53+Uo3WqGpqNGRjtJe0ROHgARqXhvSM2Jt4kU2OLsR52GHSFi+VGdBXAYmOqXEsI6jOL140u3y74U/7kBfGWte0ZvrMsgP4Q0cPgDkVcfYMQul8eKc3wiT7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpKiKheWiTfjBLTy5YHdUPBNxXxGmMNB11suL+eBGNc=;
 b=nBUL/AaHEnLOJ7qMSf9whciMBhKj2EUE5X4vftl1RdLgjQIOXfJksOQB3+VAXubOefQFRPDldXGyBo+N3bYGaYNTgq1SvP+eA0LrbzpihUiVCxdZgnv7/5L6rm/GyrJSLvTi8P2AO6Hl7MXCRSkPDJkKephs199GT2tu/XoYw1zd+OgHL69pgtOKemBfaEskBVWT8AHEgJz0dwU8Qw/11BYuNejbIJmstC5hW4bgboD3fovq6qxDCVBiAXjbJgADAz3Kfb8DxG9OAK0ykzD05d2cRIYrbnypbPCBjK4s5PnVxvFCns2EepsINydiZ/iM/1EaJA4PS7fsuIB978IF9Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: 
 AQHXyww6rKHs3LJru0q52eLUia+oNavnHBIAgAE3H4CAABSQgIAADtGAgAADkwCAABB5AIAAAiIAgAAofwA=
Date: Thu, 28 Oct 2021 18:00:22 +0000
Message-ID: <6aa95015-c2c1-e55a-5303-c82842c94438@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <65886734-7333-4469-fcc1-6916db708f13@xen.org>
 <b6bb02b6-6358-b5e0-1b80-7819aadabe10@epam.com>
 <6d8f1061-7aec-2c1a-aaf4-c30440c2797a@xen.org>
 <38da2edd-06a2-63d0-51ad-1284272c8da5@epam.com>
 <a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
In-Reply-To: <a74b52fb-6514-4187-17fe-b63236efa0ce@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d01cca99-1878-49d3-74aa-08d99a3ccfcb
x-ms-traffictypediagnostic: AM0PR03MB6066:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6066F3D0C662E65779424015E7869@AM0PR03MB6066.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u6b4ZltQIKcneB6nIWZ5gk29lw8QoeRh4IFzKBcELMyHjSyJpWEIeE7ScWvu2+tFdjRXzY+O7uImTVv69tqNeKt5VlN3u61oJ14OjxavXQ+/OFfmMVGEwuayEQrwUqrYQLIdXVZxWiyKvGFod5qt6KgUAcidwlv/X7rWcSaCsvBeIf8Ghv8ErypXAx7yzDZCtNtyrjQQB2xuoCquM79PuVrSgsXsCEZZ7qx0Wo+ZnpV0ovWX/C/mCfuI6qjr+lWRtdp+nQU5kDTOwcSd41zckKh7zdlSXCbA2900jLoJSC5PaGhI2qdt35FMvPf910Bp2j0EA2EkCenmbGjE5a6zHiBmH9FjdYD7+oJSUgvSy3n65Y9LV1qV6qcvSVqZKfcSkJayGNE93OvAreh4HfhzBMcYuyKjdbD8ASbLG5ErDufYtM8pV1HXAsKU+2YxL3Z1og6gNiDoOTOEtVNUX/pUhqViake2Q2RiK3gFbNOPsXQD8r3xwtA5gWDKyTZKsbxpWlcGddO2jUhMzQ0W6ljLdzI0L8hT5/rfZMZbZLFUI7qRVJr4MKLEJwnb8b5qtWSZr70Qs5O/mvaTOPr/Cicx7j5N0JPpsKPfCWRJGbG+HY0ErGsOy5K80uID2BdUxSRnFIqonRFDtueIROV5AFnFTcLuYIoV4I5EAsDiyFtCLh3XFatec2XwRmuuyHcp6LmMBLiq8mO8RTZ2kPxu6fh7kXPTXqv8KVPOLF7w9uAs1i0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(8936002)(8676002)(53546011)(6506007)(4744005)(6486002)(508600001)(6512007)(316002)(31696002)(2616005)(36756003)(2906002)(76116006)(38100700002)(110136005)(107886003)(64756008)(66476007)(66946007)(66556008)(31686004)(91956017)(4326008)(71200400001)(66446008)(86362001)(122000001)(26005)(38070700005)(186003)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RU1Da0JuRmtkdU9Dc0hQZVJwNENENndQc0xvVUpkTlN4NVNPRTJVSDhxYVpj?=
 =?utf-8?B?UGI0eHBQQmsweGsvdXJlalJSQTdMaTVKWExiN3U0SE0ySzdIdzV6VmpLcDh4?=
 =?utf-8?B?U2hMejEyYlJvRVlvWCtsd2dKN1FDekNCZEMxMisvRlFxbjlpdEgrV2UyNXdr?=
 =?utf-8?B?L2c1bjZ5WXhLRDg2QlZ3RS82MmdhTTVRVWtLTWdPWUxxZDNJTjBsT1JBbDVk?=
 =?utf-8?B?NENiZ3dmTVUydDUyRVAvRDVkcWxIdHA3elFhbm5lSTVockZSMkRSODIvYnhs?=
 =?utf-8?B?Q0lUZUl2YjRBU2ZwTUxNa1phY3VaSEExTnR1akg1SXorN3FjV3dnN29HUVMy?=
 =?utf-8?B?dXN0WmRPcG9GNGNTZGRBbmpjMllzeFdGUUQ4bUFkS3djY0lDVFJ1UVJBUTlW?=
 =?utf-8?B?R2tBT1JtSWorNkIrMndXbzEvQS9LaUV5amNzOENmZ0t1MjA3b29EaHkvd2lU?=
 =?utf-8?B?OUtPVTZWOGZwT2grMlV4Y2lnUlo1S2VMWXNjWDZPbTZMcUpZcm5XZU9MWjRS?=
 =?utf-8?B?blB3YmE5RGRzeExLdzUvYXg4N1hZL29oSnFHK3dCenA3NVpmRng0bmF0QmpQ?=
 =?utf-8?B?VCthM1BjaVg0MWhabytCamt0Q0xhdGtJOGpxYm9Wb0FYNTAzQk9OSm90QTY5?=
 =?utf-8?B?a0pTM0FPZFBiL2NFR1pSbFB2SWJlL2lDRitYQ3h3S3UwRTcyT2sxZVdxQnpO?=
 =?utf-8?B?K2VoMTBvRnpEU0pDTHNicmZFK2kxdUN6U3ZBcS8wYzFwT1pScy9qT2RObERq?=
 =?utf-8?B?enV2R3VVZXhsSmhQblpPaDRXTnlVeWNzZE9xQTRscnFHdmRsTmN6OFFmRWVl?=
 =?utf-8?B?ZUxDTXRUaGl3Q3dBbnE2OVlVeG9IbkpnOXhROThweVpwb2JwZXFsNU9iUzYv?=
 =?utf-8?B?Wm9xTGZnUjZvWVdmWS9SZzlBNndFTjBycTd2Z0tERnoxWGt6YjBVNEw2b1I4?=
 =?utf-8?B?MzZabXVrZ2pyaXZsYjk2bFBjZ2xsNjh3MUV1MVM1NWEwTXdaSmJRL0FXMmVZ?=
 =?utf-8?B?dGVnSVpWRkdZZ0tMcVJFeHQ1MUovWFd1RmlXQUthaTNYbGc1M2FEWUo2MWdm?=
 =?utf-8?B?L3Q0TjQwdkd6VWY4bFpuVGwxNHo5U2w2WGZSS1NJcGpBOURQSCs2VDM2NElx?=
 =?utf-8?B?ZWJnR3FxbmQvWVRld3RsY3hHV2JmamRJeHgxTXJxYkgxaDhtZDZub1gzajZl?=
 =?utf-8?B?dmNrbU5PSXRZcW1aSDBsTndudTQvUDMyRnpGcS92eXNtQ2wvNlYyOFgvRCts?=
 =?utf-8?B?WUp6Y29CcVk1NE9RbHJXOWF2dUdaYWZFNjhJYnROZFFzbUFrLzNONC8vOEZD?=
 =?utf-8?B?RnBOcEQxekc5NEhsYXRVWWkwaEVIQmR3NUo2aHIyNmZuSFQ4NFdtNGRFSlZS?=
 =?utf-8?B?NHZwSCtwVDZHc0dSMDlmSmNWU3VOYktEdEdlWUJncVFwMVREdnJCUDlvbjhP?=
 =?utf-8?B?ZmJ3TVZhN0ljUEJRa0NHYVFTWHFQRDQ3bk12dUtxVENyT3pSNjNydlNyMWh2?=
 =?utf-8?B?S1NPZmZKc0hoRThqcEtleUVsMjhRZjVpYkoyeU02UGEzNHBuaWtxcWFsZDJv?=
 =?utf-8?B?Q0lGOWdFOE5oSlczcVQzWVBES0NrWmtLL0dxaUQzY2ZOQUI0L3ZNRXBvc0ZG?=
 =?utf-8?B?Q2hiaXNpNGg2Nm9PaEsxbjRNTUpLd3ZnM0ovdnBUQ01FNUZsSEgwVVZJMjI5?=
 =?utf-8?B?c2NscVl6cEZUc2x1UndWSmVIaHRUbmpIZGJyeVlqZTIyVytCZDBPSVR3czQy?=
 =?utf-8?B?cVFkMk4vdEFiK0RuUG16Mmhnb0Jmd3hwZFpDOWh4ek5NWWJxL0hMd3kzS29p?=
 =?utf-8?B?TlFTK1duUjJPcktWbWxOeWVMdXNtbnFRMkg3MTA0SlFXM0plQ0tOdG56OU9s?=
 =?utf-8?B?dlptMzJiSG5ZcEFnNm8zQ3hUMzJGY0pickJBdklQN1dpdjU0OXBRcmN4UldS?=
 =?utf-8?B?MU9SbUhKUVAraTU1ZnVrRkRUakp2a2pmTGhRaW1jMWphQlBZcGlWd2swUDlI?=
 =?utf-8?B?Q2ZSMjJJUGZQYWZFMjVVY3llUEFuMEZsazhUcXdxb21DS0w2cVRtck9CL1FW?=
 =?utf-8?B?d1pBY1Y2TjZZZzhkL3pBaFV4azRWQjRTcEVpUm1KZmFObmxuclZPeWFsU0V3?=
 =?utf-8?B?U3IrdGx1YjFnejU3blVzMjVDbENscjgwZzNKUEdvZkJuK2g2U3pCcWptWmFp?=
 =?utf-8?B?TnJJOFpGcU5RaUNwVFNHZDJTVkhHQ082ZHBwU3BZMmxBWEhnUHphbnhJUEhO?=
 =?utf-8?B?TEVvWjltNWV6dG9jY0ttNk5QUUFINVVtSGdLaEtVU0hkMzNPc2JTQU0xZmQz?=
 =?utf-8?B?RzVrSUpZMldHR1BuZzZIb2FFNDBIdmZGVENoc3NEcDVUaS91RUpRdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6769B93C08F9D448D498DFF9A5D6242@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01cca99-1878-49d3-74aa-08d99a3ccfcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 18:00:22.3154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMk3O/4UmYFaWpLNDeP6PXsx15CWYH9WBsdhPXSW/74w0/pOJlqDng0huUjdpmZnkxD4B3BIbutbs9u2x9HFcluDbpwGOASZk1m9ljgjqfQpHf9vaWU48jUE+lYze4EC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6066
X-Proofpoint-ORIG-GUID: t5YNPLCNz7Z_fhFoiR5CgsKNtzihkq15
X-Proofpoint-GUID: t5YNPLCNz7Z_fhFoiR5CgsKNtzihkq15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280095

DQoNCk9uIDI4LjEwLjIxIDE4OjM1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpLA0KPg0KPiBP
biAyOC8xMC8yMDIxIDE2OjI3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IGJy
aWRnZSBhcyBwcml2YXRlIGFuZCB1c2luZyBpbmZvLT5ncGEgLSBHVUVTVF9WUENJX0VDQU1fQkFT
RS4uLg0KPj4gU28sIEkgd291bGQgc3RheSB3aXRoIHNpbXBsZXINCj4+DQo+PiDCoCDCoMKgwqAg
aWYgKCBicmlkZ2UgKQ0KPj4gwqAgwqDCoCDCoMKgwqAgew0KPj4gwqAgwqDCoCDCoMKgwqDCoMKg
wqDCoCBzYmRmLnNiZGYgPSBWUENJX0VDQU1fQkRGKGluZm8tPmdwYSAtIGJyaWRnZS0+Y2ZnLT5w
aHlzX2FkZHIpOw0KPj4gwqAgwqDCoCDCoMKgwqDCoMKgwqDCoCBzYmRmLnNlZyA9IGJyaWRnZS0+
c2VnbWVudDsNCj4+IMKgIMKgwqAgwqDCoMKgIH0NCj4+IMKgIMKgwqAgwqDCoMKgIGVsc2UNCj4+
IMKgIMKgwqAgwqDCoMKgwqDCoMKgwqAgc2JkZi5zYmRmID0gVlBDSV9FQ0FNX0JERihpbmZvLT5n
cGEgLSBHVUVTVF9WUENJX0VDQU1fQkFTRSk7DQo+DQo+IEkgYW0gZmluZSB3aXRoIHRoYXQgc28g
bG9uZyB0aGlzIGlzIHBhcnQgb2YgYW4gaGVscGVyIChtYXliZSB2cGNpX3NiZGZfZnJvbV9hZGRy
KCkpIHJhdGhlciB0aGFuIGR1cGxpY2F0ZWQuDQo+DQpPaywgSSB3aWxsIGltcGxlbWVudCBhIGhl
bHBlciB0aGVuOg0KcGNpX3NiZGZfdCB2cGNpX3NiZGZfZnJvbV9ncGEoY29uc3Qgc3RydWN0IHBj
aV9ob3N0X2JyaWRnZSAqYnJpZGdlLCBwYWRkcl90IGdwYSk7DQo+IENoZWVycywNCj4NClRoYW5r
IHlvdSwNCk9sZWtzYW5kcg==

