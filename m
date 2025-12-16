Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA3CC57DC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 00:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188462.1509621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeZZ-0004fn-M5; Tue, 16 Dec 2025 23:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188462.1509621; Tue, 16 Dec 2025 23:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeZZ-0004dJ-JD; Tue, 16 Dec 2025 23:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1188462;
 Tue, 16 Dec 2025 23:35:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rmh=6W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vVeZY-0004dD-1p
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 23:35:16 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de5f4fd8-dad7-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 00:35:13 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PA4PR03MB7213.eurprd03.prod.outlook.com (2603:10a6:102:bf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 23:35:11 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9412.005; Tue, 16 Dec 2025
 23:35:11 +0000
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
X-Inumbo-ID: de5f4fd8-dad7-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cugX97zE6rqeh/eEdXtfwWaBFZm3aDDrJZkIWZhoVKcWtzlBcI+95PKGYnXfT+X/NgFL7Nhe5M6RPHXFqMlOHUwKwaN0FJ5TzSOtG29q9esph9woJDgPqDxfkRkfnke79jOZ8EsUEBlo3y4ujzWwY3pOoU4FtL/GEXf2yT7jMwzUrJ1wqYHp3/BBA4C0wbhO5m3kXK75iG8w9WtNI14IUSMC8Qi7bB9yShxebBIsyZjODX1mrC0/swpMbV2k5bH4nhW3IAdRDY/yHKz0pkGK7ltVeuRqYMB8LzYsDDv5Jzx8tdsP9nrvxlxf/1uyainQDYJ55as3YMl4x+y9qacU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQdTS6JMKkpn41Hf1ETPyl+Zj1/sWcgSUKk90kPBdU0=;
 b=vi4dSOSkdmANRz8lQjSE4KScJFKOcAE6he8AYQYqM6zoTrJku5mgTa4PlkaPd/U/NAd01fTM2szXrDEjENTceSafQCVFNlppTFglx8oan0euuxr4zEcAy4nsmvCDsif7OvQ1YQTgGoHuR6EdQpu1iuDuSmqtXdb+wzgvCwY4cTrHBdQg5VgSP+hfqE+91BlTqtcL1U0kTRgY+ZTJu823JRsEmUFzZbDt2GNK9D6cu6nwkPLP6adOdHPrulnNnlvRXbKmwjev7aNofnqXss1R3VyuRnGkh+MWBcBRNeNCGOvFY+bZDmW7DZSY3zWRuFkPnQZv86ob8xwgAGnZVnfUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQdTS6JMKkpn41Hf1ETPyl+Zj1/sWcgSUKk90kPBdU0=;
 b=QKRX8cQH/WwEVRtogA4Yd12XlM8cdl3x4Q5ZJB0KKDJV9Oe+0q3cHoXEpeasxA5Cjm4/Q3ttTc8vvR2Ktk403J9BxOsx6mntHW7qG+iG3S4TQP9Sf435ABGbhqEaDzs+H46NnbbIjcVMNDbrlflpcznEGONfewfIbtGGwXFr1xl3BU6RyyNJrEL2v89F8J/ajSqG1uozDf57DGFOf/5DAIHh5k+SCxLLjXGWbjGapV8vZ2lxlO0Rl28Fqu8l65b+F+FPkxQSYpuLuFQjjLMeHoknht3XIk7NWK/UKAX4YSjUrf06gUOkOA9xsrtMbzqw9xKlyXcmfKAjYvHC/N3DNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8ee2e801-9a3a-414d-9df9-113f419e02e9@epam.com>
Date: Wed, 17 Dec 2025 01:35:10 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Grygorii Strashko <grygorii_strashko@epam.com>
Subject: X86: build failure
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PA4PR03MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: dc01e662-53e3-42ae-3d3b-08de3cfbc147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG15R0FqK1BMb2xCU2RNK3g3Zm95T3VEY3M1NnhWSExFRGZmMytBNVJIb2s3?=
 =?utf-8?B?N3JRb29qS3Q2S3ZWVkJNUmpTVEVRWGNsMDJORldsRmVvWkptcVBFYUE1Vk5m?=
 =?utf-8?B?NGJpRXB5NGVIbFE5ekN0NUh0bXFKd0FndjBlNUNaOXRjN3ArczBJUENSU2Uz?=
 =?utf-8?B?bkNsSzF1ZlRmR25SbHpEMTNuQkxyOHRuMVNMZkI1ZnplcFBkcWMrQkdyQmNH?=
 =?utf-8?B?Wi91RmZlNGdUbTVZcmp4Q0dwRHhjekN1djdCcFhBdWpLNjJCQ25sK3E4UGMz?=
 =?utf-8?B?cVJmNDZQOFBmeFZVRlNRV1hsYUhHNkJEcE9ONktkRUVyUjdOUGxCbk5GRE5s?=
 =?utf-8?B?dUEwbTBndFhZNUx2M1RJZ0pRbnJ3SGowaTRZdTNKYWhoYXAwNWV0ejJmSDZE?=
 =?utf-8?B?R0JTYW9JeG92VFA1OEY4aGVuekJERjlkOFdXMjlvN3U4cXVZVFJzcytGeExj?=
 =?utf-8?B?bkN0RnpRay9zMUxkN0VDQzY0cTBqdWl3S3h2N0JiMUNlMlVIZ3E5SmpjN0pr?=
 =?utf-8?B?ZldNbEg4WGxOTUtRZ1RLSXZjQWtHbjBybC96TXRDQXZESCtJRCtRQjZqK0Er?=
 =?utf-8?B?TUMvS3BwajRXOS9ncTR2cERRbGYwcXAwd3J1SnBDWkMyV1diditJQ3VKcmNM?=
 =?utf-8?B?Vjkvek9XSC94bURJb1hONjE3by8vVlVnZ0hKT3M2OEpUTEpSWXlCWW1zTEFE?=
 =?utf-8?B?Ry9hRTBEUi9mdTJjV3ZXbXVRUVJ1VEYrc3loSkgrc096T2s5cEkwOTAvclZY?=
 =?utf-8?B?SHlBWEhXSVh0OWZzZ2VNVWRKNE93TCs4azFxbnVJbGRWV3d2MXpNQ3dhTEJM?=
 =?utf-8?B?ZmpLdFNTU280Q1J2NUl2elc4bm1LM1VNZmtzYzUzVW5XTlFjZW8xd2E3MitJ?=
 =?utf-8?B?VVc2WFpTeU9WUU9YS0piVTl1YXJ2c2wwcjZvaWw3MWlWMmJoNmF0R2RuVytt?=
 =?utf-8?B?ZjJwTGJjZDJYdjVBUnI1LzBTbnczeTVsVWduMlNjaUMzK1FoRUpDcEtDT1FV?=
 =?utf-8?B?VWxaLzQ0SjBnNTE0Unp6dFptZEJ1TUhrMm4xaUhyUlJJSDgzMks2d1llYTB1?=
 =?utf-8?B?NTNuUmx3TmsvZXM0ZTBuYm5vc1BhUXAyY1JkeFVQMG00aG1KM0lGTXBMUVJl?=
 =?utf-8?B?VlNkd0I4ajFQUFJTSzZuSmNKQWNqcUJ2bDViaHZPNnE4eUN1OXBCVGdCSStF?=
 =?utf-8?B?UGVidEJ0WEY5WTdaN24zS0NlYm5HajFscFJhZFYrQ2h4aXNvdjd6cDJjYzJm?=
 =?utf-8?B?aVRwU1ZzSmY3TVluZGxSTUlDKzhSR2lSakxXTU02MFJmTGxXYXNCSW5KRGVM?=
 =?utf-8?B?N096T1lvZWpORVhFbjRzcndRbjVET1VYMFdGZ2xFYk1KeXhSUnVCZ0RWeEQx?=
 =?utf-8?B?QWlLOXVZakJDK2haSnlNT1ZWSFV0bHI4Qjc0UUFNajFmOUlpU2N0a1JCbVc4?=
 =?utf-8?B?YWc0UHpsajZ5YjRLVGFJMEFVd0daM1JBUlgyTG45YXhETDZMcWRXb1pXQ2c0?=
 =?utf-8?B?Yk9Qb0x4WnYxWkR3RHNvOTVNN1BhSk01SGNKVlY0cEZRNVVDS0txT3I4dGFo?=
 =?utf-8?B?VXlnNklPSHFIc1ovdUpDbUtPSnByN1JkWG5LU3k3NUR5eXVJVWdMSFFtZm9L?=
 =?utf-8?B?TklCWVJwOWNpY2RrQk1xZHpVSEFMa012NGh4TDVjdHErZUVXSjZJU2NIMVZI?=
 =?utf-8?B?TnFhMWp2b2l1VnFOTjBJUm82NWNXTnNqdHJOWmYya2RvR1Y0M013bEtJd3Jm?=
 =?utf-8?B?U3J6dGRlWCs4K1hoV3FyQWhzME85WFloVFd2Y0MxdlppM204akN4OTZFSlpo?=
 =?utf-8?B?ZnV1eE9SSEdwTWpLYWVhTTdjUnhPMjNXS29pZHRjQTBEZzdlU1ZJRlVmVHNy?=
 =?utf-8?B?cWxoaW8zTlJTdnV3d3o4eEx5OXBpR1V3UjQ0Zkc3SmV0RUNwTW0reWtSbVlp?=
 =?utf-8?Q?xbaaBYO7MS/ZjZRlpyCcCADpHkVD3VtA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVhjQk9ob1lwSHZzQkZhS21uaitVRlRYOTVrdXJhWjM3SHRlbTh6bEd4S05u?=
 =?utf-8?B?QjY3REN2akN0QU5tSGs1WUNyVFdnZUwzcVlRQ2xCVkQrZ2gxQWxMWS82Zmxa?=
 =?utf-8?B?eS9FcHU5U1RQYnRITU9HT0daZk9LU0ZOM3VqdDZod3I0MThzM1JUemswUVIy?=
 =?utf-8?B?UGpuV2NlVVk3Mnk3ZzhyVFFqUTBKT3F3a2Jhd0srWDFSN1JFaVgxeUxITUlO?=
 =?utf-8?B?dEFzUWh0N3E1bHhZdzExSkxjMFZhNFZKZTRhUkZ6dGsxM1hPcGlDdEljcElp?=
 =?utf-8?B?K1hpQnlncXZTVnlSWEV1RlIzYkl4MW5WTkh0SFhEMkFrTzBnelhRYVUrb0Y0?=
 =?utf-8?B?WnNGVjVmR1BoTHVVcHhtZURDQStWQjBKU2w2VkZMM1FvUUJ1bUZaMCt2L0t0?=
 =?utf-8?B?Qm5UYjNLb016NnRzbXgyUjF1UVcvQ2tjR2NKbUVNeVdMUTNxSy9pb0dOUlFM?=
 =?utf-8?B?b0thSUhQcFIzWU1LSTZjM3FKbHlMQmcwNklhL3hieXVLZWljSVRscmFXTEhh?=
 =?utf-8?B?OE5UZzRaWGNESHZla0dqOFRKZkcxVU4rbG1pMDU1T0pOY1g4Q25lc3IxNmlP?=
 =?utf-8?B?OGl0OFFpQlNTWjhGVGV2UDRQMXJnUkdIckRvVDRzK3RxbS8vOGNjbWdGaGRx?=
 =?utf-8?B?L2xUaHk2eWNheGZYWi8vY3huTjFOZ0kvZEMwUXR0TWZNNkV0eCtvZTU5NnV6?=
 =?utf-8?B?VVYrUnRQbS9EL09tU1RqSjljOUVYcXVqR1VjTE85bFdpazQxaVpqUUNTZ1l1?=
 =?utf-8?B?YjlLYVphbHRyVXd0MjVwSTh6UlFnNG04Nlo4djdFbjNHbUVNVjFVSUQzeDU1?=
 =?utf-8?B?Ym5WUitOOENITG0zbXBsTlJscXNoU0tRNW5iL2dDQW12dmJqajU4d05aQUdI?=
 =?utf-8?B?Q3BQWUhnQlFOa0xDbUZyT3IrTTJIbDRjMDF3UTlET0E5VEhyVDFUb0tyMzVF?=
 =?utf-8?B?emtYNTJhNEluMXdGY3VqM1FBNWNhMEMwenVqZFNuamxVSGgrM3UyWi9XQnNr?=
 =?utf-8?B?SXFTMXA3cjQxVkpraVhwc3B6MDFZK2NkZjVtMXNDS2RRMTRIV0FNSzcyTVdP?=
 =?utf-8?B?MEVlY21jalZRRTJIRUpYbzdWZWRLb1Nva3dlSTVYV1FFWWFIR0FxdkdPMHIr?=
 =?utf-8?B?QVR1c1VKSnh5NzBqSTZ2TGhzbDk0Mm9VK28vTk9SWUZ3cldQaUtrZEpFYTl4?=
 =?utf-8?B?YnliK05BOXIrK3d6TFBnZVRBdkFUV1FPUmtZckxMWVJyNzAwUHdhSUJGTDdI?=
 =?utf-8?B?QnFGR2JFTXFsejY0L0ZPRTQ2UTlyOGtWTlZUT1BsVHN1aS85aXE2SGRwZmE2?=
 =?utf-8?B?cDUzWldDdjFDUHRKaUFvNDYyU3FnM1dRZzFWTXA2WFRDdllVS1VjTENqdmpP?=
 =?utf-8?B?TENUdHAyNlo2dkc2Z1lGTGdCMEtVbEtlQTVOSFV2WU1DcTNJQ3ZFd3hpekZV?=
 =?utf-8?B?THN2ZWd4RGJwMUZxRkQwODlJQTlEZWpaRW5iRjJrRTUyMDUwVzZ5YytMdnQw?=
 =?utf-8?B?TzVFNWFSNEFEVWRiV09sZHdoaGtuYVQ2a2ZXRU1FV1JWWFA5Y0F0akx1MHZ5?=
 =?utf-8?B?Skp6WnFGYXpaQ2cwdE0xaFVPelNOOC81bGMzVU9SVjVRNisxMDBybHFaWEJS?=
 =?utf-8?B?dHEwdWhpM2hROWVHbnNxL24wZXpFbmFLRVQ4aFAvVWtsYncxTWY4VkV5UWxO?=
 =?utf-8?B?U0dOc2RVQTVoOWtTZk1scjdjQWxGWHdXMDNGUEwzaTc4YjJwWnp5SWJxWk1s?=
 =?utf-8?B?ajJxbGg3Y3JCcmxtTUk4THFNVENOYjBVbThBL3JjalFVNkE2N0dEbEVrSmRk?=
 =?utf-8?B?U0s1bEowWkE5OGM3VUJMQmtQQlRFZjhWWWRmWmYzMjRUNWtkcTc1bnVjMmlH?=
 =?utf-8?B?MUxkUE5tc2g5bmZxek51enRnYnFGemNSTDVObnN0SWs2VXJVMUk0SnZFRzlW?=
 =?utf-8?B?SHhRUkpLd2FMMlNYRkpUd2RSTFJVemt6eVN6d2lJS1lpM1NUenNGbzBieDND?=
 =?utf-8?B?TEhPTlhtSGkvOG5MN3Z4SmhYdWp3c2x6K3dRTytFSXluODJPTGJQSEVPWWlF?=
 =?utf-8?B?Yi9OUSswWThheU9JS01ZOEhYYmJObjVrVWp0bGNreEptOTlYckErM3JOK2Zv?=
 =?utf-8?B?MUdWTmZIN3pzZ0UyUmNUdmpQNHJiRitBZXlVc2grWEt3WDRCR1RYYzB2R0Yz?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc01e662-53e3-42ae-3d3b-08de3cfbc147
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 23:35:11.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJQI3cxviB0fOFgf3K4mmjbPn0IeudsCmki59rhfMaCF8S2djhHs5qspFkanB6PphPqLyw0btYvTWv4K0V56Z1qrX8DarXjj4DPDvm57YYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7213

Hi All,

I experience build failure with following Kconfig combination:
  CONFIG_DEBUG=n and CONFIG_XEN_IBT=n

with gcc:
  gcc --version
  gcc (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0
  Copyright (C) 2021 Free Software Foundation, Inc.
  This is free software; see the source for copying conditions.  There is NO
  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Is this known issue?

====== log ===============
   CC      arch/x86/x86_emulate.o
In file included from arch/x86/x86_emulate.c:27:
arch/x86/x86_emulate/x86_emulate.c: In function ‘x86_emulate’:
arch/x86/x86_emulate/x86_emulate.c:70:36: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
    70 |     gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 : 0x8f; \
arch/x86/x86_emulate/x86_emulate.c:78:9: note: in expansion of macro ‘copy_VEX’
    78 |         copy_VEX(ptr, vex); \
       |         ^~~~~~~~
arch/x86/x86_emulate/x86_emulate.c:8140:13: note: in expansion of macro ‘copy_REX_VEX’
  8140 |             copy_REX_VEX(opc, rex_prefix, vex);
       |             ^~~~~~~~~~~~
In file included from arch/x86/x86_emulate/x86_emulate.c:11,
                  from arch/x86/x86_emulate.c:27:
arch/x86/x86_emulate/private.h:691:17: note: at offset [0, 4095] into destination object of size [0, 9223372036854775807] allocated by ‘map_domain_page’
   691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/x86_emulate/x86_emulate.c:60:21: note: in expansion of macro ‘get_stub’
    60 |     uint8_t *buf_ = get_stub(stub); \
       |                     ^~~~~~~~
arch/x86/x86_emulate/x86_emulate.c:3354:15: note: in expansion of macro ‘init_prefixes’
  3354 |         opc = init_prefixes(stub);
       |               ^~~~~~~~~~~~~
arch/x86/x86_emulate/private.h:691:17: note: at offset [1, 4096] into destination object of size [0, 9223372036854775807] allocated by ‘map_domain_page’
   691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/x86_emulate/x86_emulate.c:94:21: note: in expansion of macro ‘get_stub’
    94 |     uint8_t *buf_ = get_stub(stub); \
       |                     ^~~~~~~~
arch/x86/x86_emulate/x86_emulate.c:3402:15: note: in expansion of macro ‘init_evex’
  3402 |         opc = init_evex(stub);
[...]


-- 
Best regards,
-grygorii


