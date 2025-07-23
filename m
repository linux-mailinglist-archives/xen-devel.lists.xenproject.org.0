Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB45CB0F434
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054025.1422832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZfz-0003t3-VN; Wed, 23 Jul 2025 13:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054025.1422832; Wed, 23 Jul 2025 13:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZfz-0003qA-Rw; Wed, 23 Jul 2025 13:38:31 +0000
Received: by outflank-mailman (input) for mailman id 1054025;
 Wed, 23 Jul 2025 13:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ueZfz-0003q4-18
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:38:31 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5028902c-67ca-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:38:27 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7075.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 13:38:25 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 13:38:25 +0000
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
X-Inumbo-ID: 5028902c-67ca-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkksleZq2CZvX2RX7r+EfssDPaY4TSENjxBFGknFqHuSt0lHuCH0oL8IiNvq0LToQwINU+T15F8TgEoWMjSqK5rEldLij6dINFZQpOhxOydmOtGnHWyp5kK/Nwsy4Xz+5WJu2/VCQsZ/oeQc81hwW43gtGV0G8CNg+t9bIipDvK3ZBEVO1kADh5ZWlzaAzV7Mc+lxMM2tyRePReJ8LONFSbz9HwFNil5/HlLDbmMxswIirdpjA6vtUVHrgUgTlAIAAq8NjSPIpPlBRuc6jHn4CvRP6zDlYNACrnGxKk4BvIj4jQoHpsuNuOcSgbuy6JQKjYYoUjPRx70h0VO97mTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi5pLcdNwWo+vXxySc8XmOlnqaVLrh8jXAt+OAPCS88=;
 b=nuhebRFIst7YS7qqr2Ga1R0Fw6JidQNR9J638PuGYsmKSqUqh46qhZU0G6tYdeGDA4AThLnXjWaRaGDAywtS3H4TtyKoIRaGsY+OMoN6TnaeHR5OVvaY9blxXX/l/xcbGFEti+rVdahFV9ZKhhJw7huCzKbzMgqaNF85hxVfexHDucrQDsujBmMu9CLGireZsFRL7AsSP3hFyXETUqXWGOjP4Z7stjj76QBQKC1D8SS7uz46zXYLm18U1xzSMQYk27YrCtx5NvUUFNY8t0AhQn0j1Cbt/ImVtuTp/zPR7s9zRDdmAIEw6SMzYagumNm1Tz0jF+qb9htdcaMM9RMoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi5pLcdNwWo+vXxySc8XmOlnqaVLrh8jXAt+OAPCS88=;
 b=K+N6WyOR/DLnP8maOoIJH6q7h9occ5OHuIrJDre0juq13Yvqhk0nWf4lLwvLyKEXzNOrxd7OT/EyGmZSgJ0epxo9k+C5jMGVsksxq+ixmE4LPyssSg02DbQBNZ7NKsOW+i7uxq4/moHXwU3yzb0QaQqpVB4tDz69L0cW8winRCSoGHodOJrfumkvjrPND+i474yCX8cr5why6tRW4why510d60Zn4O4TsLdC8xXMIB9K1m03lXw/+m+/Rnih99NgSXV+nsjiLS1KoR3gcfxRUYPnkijoIkqe1zb90yEntUlFVTSo7gbm8xRMoBKXq/1pfIHPn8YvBcFP/Xfal6xxNA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/eclair: monitor rules 11.6, 17.2, 18.3, 21.11,
 21.14-16
Thread-Topic: [PATCH] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
Thread-Index: AQHb+9XjRd4/gYe4O02P0LwT9W+DH7Q/tXOAgAABAAA=
Date: Wed, 23 Jul 2025 13:38:25 +0000
Message-ID: <3b2ff186-bd7c-4938-ad36-cebd465826c6@epam.com>
References:
 <2134a233586a6aeb5de740baf082ba87ecb212df.1753271488.git.dmytro_prokopchuk1@epam.com>
 <5017349a547a69b666234bdfe4713c96@bugseng.com>
In-Reply-To: <5017349a547a69b666234bdfe4713c96@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7075:EE_
x-ms-office365-filtering-correlation-id: 4dad867d-bf07-4948-34b4-08ddc9ee32f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aTJ3U2lGS1FtTkQvelRIMkY5aFNSOXBEQlgrUitFYzhENUhaL0tpbVh4MzBC?=
 =?utf-8?B?OEo1NkFTNDFWUW5hUTlZM1c0L1pSYzc2UnA2cUZ1MzhMZ0ZRcmc5UFV6eUFN?=
 =?utf-8?B?aXRKcUZmZWc0VUQ4SlAwY2drNXprWUIvNGhhcDN4YU1NVmNsRzZPY0Mvbk9a?=
 =?utf-8?B?bFRMcitpY1pYVkRXcHlzZys3RUo0eXVnQjF2T01NWjNoc1k5QlBHUzlHWDM2?=
 =?utf-8?B?V1F6RDJJVmx5dzRLQ0VpS0ptT2pBUVIrMHhTb2ZQTUpCTzRzb0tIeGltL1hs?=
 =?utf-8?B?UXBxSnZveDREQytpQTQvTk9kNkd2MjZNRTFCbTFVSmJoTmhQbktuWFFIQU92?=
 =?utf-8?B?bndzbzkrb1g1S2hhdXp1eVhYSlh6TU13cC9ZejRjSjlJSHFVNjE1SGhyWEFI?=
 =?utf-8?B?blg4Qkp3K2ovTWd6c000N0gxOUlCRVRHU2hkRm9xdTlac2t0a0I1S2VZbGp6?=
 =?utf-8?B?VTgxdUxQZlZUZTlGOGJJUnY5ejhwb1FISFlqUU8vTnJ2UklaTnNXQjVDRGxm?=
 =?utf-8?B?S0JOSm13ek9WdWZLNUJBbytjSnFubEYwbTBuR3o4Ui9ET1pKUE5xNE9wSFJY?=
 =?utf-8?B?K3Y1bzZiYzNkR3FaU3VDVEJMb0E4K3RBVVY4dlc3Y2UrUHJlcGpIbUVWeVo2?=
 =?utf-8?B?QTBHekZBQVZWVTV1UjVFcFFNR0lMcFhCRVZSbmFqQWNOY0ZSRDVoVGduaGZX?=
 =?utf-8?B?Y1hvSVdNTWtnWWw4cFozY2gvMkV4cTVQUjk5S0d5U3NHTUFtbnFaSE5qZFRZ?=
 =?utf-8?B?czllWDhGaGc5eGd3dy83MVpDTDFGN1JTeUxsbUxIdytkMkhUYU1EZGpCT2Vy?=
 =?utf-8?B?M0ZhdmlEa05WMEoxUkhEY1hkSGRDRUt3L0ozNDBHL2dnVVVnNzFZenczWVpM?=
 =?utf-8?B?blo0eTNOdVFsSksvdnpkV1V4UFo2NVYyTitQeTFQQThuVW14bklUL3Ayem52?=
 =?utf-8?B?cWNjVTZnQ2daTU81ZE1jWDdaMnY4Q3hTWDViTVN1NmZtK1ZQbFNaRmJJMmdH?=
 =?utf-8?B?eldZOVpMZlhnb2hWRkRmTFVxUjU4dWRQaDNtMW50WXVzV211dUY2OU9keDFI?=
 =?utf-8?B?M281VHk0TkRjYW95UllzOVQ0S1l2TTVnek12WGQrTWlHV3ltbnlwcUlodWtZ?=
 =?utf-8?B?YlBveGxuUkh1NGh1UVY2L21vZVVDcHFlZmgremZJamRSdDVwV1Y0ejVCZ2Nv?=
 =?utf-8?B?ZWEwNXJsTGRxN0tabWtWU1kvTnZZRlF5U2ZYQ3pVNGVmYmZrVkxFV3NQd3cy?=
 =?utf-8?B?YmN3cnZJQWVhSGZobjBhYnlEQitsMmFhSVhyb0QyUVdmYmhjZkVMVTM4aVA2?=
 =?utf-8?B?dGcrNFNTekd1Qk43QmZVaitZK1cvUFNWWDBwdFZWM0lIN2ZxeFcrMFY0ZEln?=
 =?utf-8?B?c1FyY21IeUJnWFJJeDNza2Y2aDZWOGFIVThmMzZ2aGZjbS9Pc3FGaWZ4ZHF5?=
 =?utf-8?B?STBPNzdUOEV2WWYxemg1ajVOa3JGdWJrZkRHRENyNVZZVG0vQ0c1MzJQR3FT?=
 =?utf-8?B?MnN6QkhvOU9kWTFLWW1KbWZCRklnaXRsRnV6aWF1MGJoaGo1bnlDVU0wMDhW?=
 =?utf-8?B?YzJlRDl3RDFBaHNpVC95N3lHbmxzaWo4M0JabUlBZmVDNTJiM2RHSkozamM1?=
 =?utf-8?B?VU5JVFliRGsxa1ZIU2hzYVh6aFFKWmFJbFMwZDdma2RnUkd2akNJUmtaTjJm?=
 =?utf-8?B?MWdTOUR6eWk3YjhteEVJR0VPUktyT2pEZktVZGJ5cFphUFc5Qi92S01vNUNV?=
 =?utf-8?B?NytBRzZNY2lFbkJxYnFuTDRqUUVCYXRZWU1SVEtSaXhuV3lDZ0xOMml2VHR1?=
 =?utf-8?B?MXZETHdwV2xVbllBTHZiREl0V2VRMGcvOVErZi9vakJDaTRjUE0xN0FCMkRU?=
 =?utf-8?B?Q0RpcFE1ODdBeTNNNm02UGRaSjdSNjAwZGExcW1SdmlsaThYcHcrckhIbVNm?=
 =?utf-8?Q?JZFNmgpgHZA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzJ1cDQ0eDZmR1Y0ODB0WDJORnRTeFp3aGRSQ25yZk5KN1hyWWg1YXlRN1c1?=
 =?utf-8?B?UGI5YXExSGl4Ynd2dm9uMDJ0UmJMMkU4SzZlNmdXYjZxZTNhZVgwTFF3bkFF?=
 =?utf-8?B?ZnoyUnpUajRTdFp2R3p2Wi9kd3FTSGdkdjFRS2VCdHVKT215UDRqTzBJZnN5?=
 =?utf-8?B?S3ZISko3T2xuUUZNbEwrSUxVK0Jzc3FjTFhmbW1DMGpYNU1Xc05idE51U0w1?=
 =?utf-8?B?N2h3ZzFLT1JaTVpjVFhPM0gzV3pqRVhYZ081enRYc1Qvc3ZTZ2FYOUVvYi9V?=
 =?utf-8?B?VmlaNzVNQUJjOFJxc3A2WkVuNGZ2VjFERmVpRGhvNmNaYS9MQ2plcU91VXVW?=
 =?utf-8?B?UEFoVk1zMFlYakkvVHpLQVhWNjdmOHNnckZYMVpJSXZ2cVArem9IdnY5Slc0?=
 =?utf-8?B?RGVMQ1NQZ1BjWjYrVWZQK2hYZGQ5cU9aYWtQTXNTc005QlVnNGoyMWxNNFdS?=
 =?utf-8?B?Zmsrand0SGpqUk9pQ3NmK29xSVFSenBUMXIyUGptemtpUGlMNUtmMk9wTkpr?=
 =?utf-8?B?eXEzb3FVQUZDVWFIRlU3NE5QYTYyeUozQjFpckl4TEpuRGJUSDFrcEdwZmVJ?=
 =?utf-8?B?dzVCbW9HTTVqa0lzZmU5bzZlaFVtVExOOEpMRGV1N0VWOFB4NWRmcnBNczZM?=
 =?utf-8?B?KzdqcS95S25QcXEvNDhEVXBGeCt5Uzg4VTgrV1VSYlhOcWdySk94bHpMc29J?=
 =?utf-8?B?RDN5OFBkMlYxeE5OdzhqOGQ3RzBqdnJsUEpuSlM0TC8wQTNMeVZINHArMzZY?=
 =?utf-8?B?RUVwRUQyOE5zNG1JUzBkWXo4VmFDc3JISmNXaVBTcW5JOHFVOVB6V1dDdFFm?=
 =?utf-8?B?MzB2L0JyMU1CNzBtVUZ2b2FHbWl2YmIrSDNZNkdiTTlTQ2VDZS9xanc5NHRH?=
 =?utf-8?B?TUl1bmJ5ekdQZkVMd3VzbENFQTg3dUlEWXlDSnI3YllMbjB2aG1QQWNrdnZ5?=
 =?utf-8?B?MkRUVXozZzJ4WHVlOGg1Nm5YQVZjektCaVVrVWFsN3grY0ZUV0QxQW41dVVl?=
 =?utf-8?B?eDVrM29FKzJDQmN1blREaGxWS1BrWWZkTDdudWNEUXkwUG9lekF4c0daY2Y0?=
 =?utf-8?B?Ty92a3AxaXZQYWlmcXFBSUFTRzB4Zzc1S2lyemhwcStuNXJKRndzSXA3R2Z5?=
 =?utf-8?B?R2NNdTBJbzd4MDRyRHlYTnpqUTNXR3NHOWRPcHRpcmRYY2kyODZHTERDRk1r?=
 =?utf-8?B?Z041d2ZBcHNNYUwyT3dxb0JNK3d6dzBRNmJEaTJzbTBMRDZwZW5RSk4vV1ky?=
 =?utf-8?B?bWNCUzNsSWtUd0hSZ0tmd053LzdDREdaN2RmTWl0YkNhN1FxVlgwMWVrT3J3?=
 =?utf-8?B?K0UwZjYyRksyREpBKytzUEJpUy8xTzZpRFIxN0FIWUU0UUV2dlpuSG4xSS9n?=
 =?utf-8?B?cXM1dDBhVVFUN1pPQ3ZmMGw4OWdXZ0pwdWorTTRDYmxOVFdiK2hyV3BvRDZH?=
 =?utf-8?B?UVdSNjlkU1NsZ2V2WTFrWE00NCtNUWs2NzVxWVpkM1ZuZlJrTXFNeVYyaXdm?=
 =?utf-8?B?bTdQQUdKRzhLOGU1Y1RjcklqTk91a1hhTXJhTjg3MjQzVCtGL29XSFRWTEE5?=
 =?utf-8?B?UDZIeVBaVmlzUDR3T3ZlU0t0SGZKT24wOVJObVdUd2hWMWdsQ0Q2NHk5a3dB?=
 =?utf-8?B?eStGUnMwYnUxbm95OFdkc2Z2UlNSN210d1pHZkJKKzlnektWU1RmWkNEMjJW?=
 =?utf-8?B?aWNXcDBVYVZpWWlqejBKS3RNdWRMRFBRZTJkY3pOYXBnRFBVZnovUnRGL1Vs?=
 =?utf-8?B?LzArUkxKdW1ENlJQcHNrcllaYmdMOEpEWlU0QlUwaytzUy85V1RxU3paUTQ2?=
 =?utf-8?B?RXA0cVRVa1RrZk5MSkdPQ0xkYXVZcWN6S0xpdVNURXUyVjk2bjQ5M09Rb1dE?=
 =?utf-8?B?aGsrWlRvMEtzNnhBazBEcS9kd3BTYTcvS2ZnUVBHeHRRdStiekhsZERCK0NU?=
 =?utf-8?B?VHAyZmF6QTNVb01rMW5ISFFxS0dWNG15WmtXZ2h5dkZlcW5qZitaRXFzeTJu?=
 =?utf-8?B?S3pkSElONnNjUm8xUW14N1Yrbmd6OVMzL3gvdWlhSjdUcmRYRk5mMDM0TGFM?=
 =?utf-8?B?VTZYa3JmWTJUaE1mRy9VSjVvb3FkVHRFeTdxTEVabXRDKzBBYnp6OG5ibTRo?=
 =?utf-8?B?Vi9OYmpWL2FJa1FOY1g3dmgrb1ZLRUxYc1RQMjdQcmJxb3hYTk1OL2NCSUtv?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E0F5EAE06418841A494869C345ADE95@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dad867d-bf07-4948-34b4-08ddc9ee32f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 13:38:25.0611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BG6sT+R30iXVsb35TdEG+CpzG2U/xd5DyRlxFtAtLtxzK3dMNhIHe94iLjU94tzIjv7kbewYebsmAk6ATVmIFg2NFXCOcbtv8LNt+/2CrTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7075

DQoNCk9uIDcvMjMvMjUgMTY6MzQsIE5pY29sYSBWZXRyaW5pIHdyb3RlOg0KPiBPbiAyMDI1LTA3
LTIzIDE1OjMwLCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBBZGQgTUlTUkEgQyBydWxl
cyB0byB0aGUgbW9uaXRvcmVkIHNldC4NCj4+IEFsbCB0aGVzZSBydWxlcyBhcmUgJ2FjY2VwdGVk
JyBmb3IgWEVOLCBoYXZlIHplcm8gb3IgZmV3IHZpb2xhdGlvbnMsDQo+PiBhbmQgc2hvdWxkIGJl
IGVuYWJsZWQgZm9yIHRoZSBFQ0xBSVIgc2Nhbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0
cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4gLS0tDQo+PiBU
ZXN0IENJOiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz8g
DQo+PiB1cmw9aHR0cHMlM0ElMkYlMkZnaXRsYWIuY29tJTJGeGVuLSANCj4+IHByb2plY3QlMkZw
ZW9wbGUlMkZkaW1hcHJrcDRrJTJGeGVuJTJGLSANCj4+ICUyRnBpcGVsaW5lcyUyRjE5NDM2MDcw
MjMmZGF0YT0wNSU3QzAyJTdDZG15dHJvX3Byb2tvcGNodWsxJTQwZXBhbS5jb20lN0M4NDJkZTA3
NmY1NjU0ZDZlZDk1MTA4ZGRjOWVkYjJkNCU3Q2I0MWI3MmQwNGU5ZjRjMjY4YTY5Zjk0OWYzNjdj
OTFkJTdDMSU3QzAlN0M2Mzg4ODg3NDQ5MzY1NjI2MDklN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4
ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpN
aUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPVh1
NGk4dkZIZFV5aVgwc2ZYdGRJdXdPUk9ySE80Uk1qNTg2MmZKY0ElMkJSRSUzRCZyZXNlcnZlZD0w
DQo+PiAtLS0NCj4+IMKgYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL21vbml0b3Jl
ZC5lY2wgfCA5ICsrKysrKysrLQ0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pg0KPiANCj4gSWYgc29tZSBoYXZlIHplcm8gdmlvbGF0aW9ucyB0
aGV5IHNob3VsZCBiZSB0YWdnZWQgYXMgImNsZWFuIiBpbiANCj4gdGFnZ2luZy5lY2wNClllcCwg
dGhlIG5leHQgcGF0Y2ggaXMgaW4gcHJvZ3Jlc3MuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2F1dG9t
YXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9tb25pdG9yZWQuZWNsIGIvIA0KPj4gYXV0b21h
dGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL21vbml0b3JlZC5lY2wNCj4+IGluZGV4IDAwYmZm
OWVkYmUuLjcyNjk4YjJlYjEgMTAwNjQ0DQo+PiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFs
eXNpcy9FQ0xBSVIvbW9uaXRvcmVkLmVjbA0KPj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5h
bHlzaXMvRUNMQUlSL21vbml0b3JlZC5lY2wNCj4+IEBAIC00NSw2ICs0NSw3IEBADQo+PiDCoC1l
bmFibGU9TUMzQTIuUjEwLjINCj4+IMKgLWVuYWJsZT1NQzNBMi5SMTEuMQ0KPj4gwqAtZW5hYmxl
PU1DM0EyLlIxMS4yDQo+PiArLWVuYWJsZT1NQzNBMi5SMTEuNg0KPj4gwqAtZW5hYmxlPU1DM0Ey
LlIxMS43DQo+PiDCoC1lbmFibGU9TUMzQTIuUjExLjgNCj4+IMKgLWVuYWJsZT1NQzNBMi5SMTEu
OQ0KPj4gQEAgLTYyLDEyICs2MywxNCBAQA0KPj4gwqAtZW5hYmxlPU1DM0EyLlIxNi42DQo+PiDC
oC1lbmFibGU9TUMzQTIuUjE2LjcNCj4+IMKgLWVuYWJsZT1NQzNBMi5SMTcuMQ0KPj4gKy1lbmFi
bGU9TUMzQTIuUjE3LjINCj4gDQo+IFRoaXMgbWlnaHQgbWFrZSBzZW5zZSBvbmx5IHRvIGF2b2lk
IGRpcmVjdGx5IHJlY3Vyc2l2ZSBmdW5jdGlvbnMgYmVpbmcgDQo+IGFjY2lkZW50YWxseSBpbnRy
b2R1Y2VkLiBXZSBhcmUgd29ya2luZyBhdCBpbXByb3ZpbmcgdGhlIGdyYW51bGFyaXR5IG9mIA0K
PiB0aGUgcmVwb3J0cyBmb3IgaW5kaXJlY3QgcmVjdXJzaW9uLCBidXQgdGhlIHJhdGlvbmFsZSBv
ZiB0aGUgYWRkaXRpb24gDQo+IHNob3VsZCB0byBiZSBtZW50aW9uZWQgaW4gdGhlIGRlc2NyaXB0
aW9uDQpUaGFua3MsIE5pY29sYS4gSSdsbCBhZGQgY29tbWVudC4NCj4gDQo+PiDCoC1lbmFibGU9
TUMzQTIuUjE3LjMNCj4+IMKgLWVuYWJsZT1NQzNBMi5SMTcuNA0KPj4gwqAtZW5hYmxlPU1DM0Ey
LlIxNy41DQo+PiDCoC1lbmFibGU9TUMzQTIuUjE3LjYNCj4+IMKgLWVuYWJsZT1NQzNBMi5SMTgu
MQ0KPj4gwqAtZW5hYmxlPU1DM0EyLlIxOC4yDQo+PiArLWVuYWJsZT1NQzNBMi5SMTguMw0KPj4g
wqAtZW5hYmxlPU1DM0EyLlIxOC42DQo+PiDCoC1lbmFibGU9TUMzQTIuUjE4LjgNCj4+IMKgLWVu
YWJsZT1NQzNBMi5SMTkuMQ0KPj4gQEAgLTgzLDE0ICs4NiwxOCBAQA0KPj4gwqAtZW5hYmxlPU1D
M0EyLlIyMC4xNA0KPj4gwqAtZW5hYmxlPU1DM0EyLlIyMS4zDQo+PiDCoC1lbmFibGU9TUMzQTIu
UjIxLjQNCj4+IC0tZW5hYmxlPU1DM0EyLlIyMS42DQo+PiDCoC1lbmFibGU9TUMzQTIuUjIxLjUN
Cj4+ICstZW5hYmxlPU1DM0EyLlIyMS42DQo+PiDCoC1lbmFibGU9TUMzQTIuUjIxLjcNCj4+IMKg
LWVuYWJsZT1NQzNBMi5SMjEuOA0KPj4gwqAtZW5hYmxlPU1DM0EyLlIyMS45DQo+PiDCoC1lbmFi
bGU9TUMzQTIuUjIxLjEwDQo+PiArLWVuYWJsZT1NQzNBMi5SMjEuMTENCj4+IMKgLWVuYWJsZT1N
QzNBMi5SMjEuMTINCj4+IMKgLWVuYWJsZT1NQzNBMi5SMjEuMTMNCj4+ICstZW5hYmxlPU1DM0Ey
LlIyMS4xNA0KPj4gKy1lbmFibGU9TUMzQTIuUjIxLjE1DQo+PiArLWVuYWJsZT1NQzNBMi5SMjEu
MTYNCj4+IMKgLWVuYWJsZT1NQzNBMi5SMjEuMTcNCj4+IMKgLWVuYWJsZT1NQzNBMi5SMjEuMTgN
Cj4+IMKgLWVuYWJsZT1NQzNBMi5SMjEuMTkNCj4gDQo=

