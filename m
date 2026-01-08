Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB6D019CC
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 09:44:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197391.1514937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdldB-0005Mi-Fo; Thu, 08 Jan 2026 08:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197391.1514937; Thu, 08 Jan 2026 08:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdldB-0005KK-D6; Thu, 08 Jan 2026 08:44:33 +0000
Received: by outflank-mailman (input) for mailman id 1197391;
 Thu, 08 Jan 2026 08:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdld9-0005KE-DK
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 08:44:31 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3de155e5-ec6e-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 09:44:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7986.namprd03.prod.outlook.com (2603:10b6:303:276::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:44:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 08:44:24 +0000
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
X-Inumbo-ID: 3de155e5-ec6e-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0w+MygcQ2qEMoUH5VqsRzX0XkcxY3oQU5AoaYtdYH0jvhqNe7PLKj2ZXUqqQjcjmpN1Y/qOqxMhPQ3e4xoXl3u9oh6sW2Aw6MVsgkfDJqK6Sc0tTNoehGO63Uxg83Hq7UY1UdcY8l8hKAmAsYRycpSNmsseCXFnTxBwGHOWL3/CrFmK+5wbBZUQvbZrjatamivKWwbEGev+vvwKgbBz1rp7xLCTxbCmjwj/KY15OFnv1+ynSq7UfjenLrzKHolLQtdsxi2ZWF6ehRTZfQND0QOHsMeYze9nVpPrlRf2F76/Y72a1JbhLkk4OtxIm1DqDXnChth3Kf4pNa6wkbTxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/T2eOW4hlqGLEqSlp0gtgrihr4y8Frr47rfOGW+7P0=;
 b=BTP7rzXx39BumsZJiAPTBQt5bAUNT7n2yXn6uObscibVZlwIz7Juoscp2JVpVHrF691fOf40OMkFZCOzMxtRBmt/FS1RZUrHMaGREnzp9Yv2lhsE9KS4ym466UYGimJnd8b/7wuCUdlWmhpAjVVJf6THign+KQCLm/P6dWIm7bPZpelm5Zz6ho200H8dWmyf5VAzaMLy+Wd/iQ+jc6QQOtTELli95pZ22/FLMh/prEm4i73IcRlfbPrYJ4Rr1xcFTCuhx4C+PUKj2Zge5dfabVTYSk7H3xD0gUqmxIsCICwrQHuuaeOdgILZ3RwM7PM1bcjmxuEzlUlTqF1e8q4Opg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/T2eOW4hlqGLEqSlp0gtgrihr4y8Frr47rfOGW+7P0=;
 b=smfnYhBYBKVhWbWQ1L1FCcjM++IThXOjiy1XfJz5mhAOqbwXubPBWtQKwJFOtt5Tiul3Nx9vzAkjgR+Sm/q6Nl/9R/fDeOn9ybm0/DGuvdoU1zMioj/8bCU9G0F5c5bc+UwY8cloAeJkIGHJwcV+gEHBHUsOJFyYcJ+6dVfwVJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jan 2026 09:44:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen/mm: move adjustment of claimed pages counters on
 allocation
Message-ID: <aV9uZOXxv14w5CXv@Mac.lan>
References: <20260107175605.56617-1-roger.pau@citrix.com>
 <f6468868-5814-44ff-aeab-20bffb064ae8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6468868-5814-44ff-aeab-20bffb064ae8@suse.com>
X-ClientProxiedBy: PAZP264CA0015.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::20) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: efee16c7-036d-4c9c-78f6-08de4e922016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THRJajRQWDU0MWZONUhBd0R4Q0RUOWsyWDc3WUZJY1VDSHdWMzUvYVBiTmFI?=
 =?utf-8?B?WTBxMjREdUZVQmtYTUJZamxFWEQxS21HNUw1cFVDN0N6a09xOVdwc1BxUHcw?=
 =?utf-8?B?YmdySjl0aHJYOTR3REg4ZU5sa3RjcXNDWEVXZG55R3hHeHFQVngvM1FyM2ps?=
 =?utf-8?B?WnpWOWRUdWVnZlhiSGN6OTVSMXZVSGNEUWl0bXNnbiswNjJRUTRuVzA4citn?=
 =?utf-8?B?SUYvay9KTHJ0ajVYS3NmSk5xc0dRcXprZ3RKdGFFdE9mRnRXTlMxK2dIUkFK?=
 =?utf-8?B?VW9EMnhyMDBUaFkxakcrRUNDQ1BYQ3piNE5RQUFKeUNsYjZ5Q1ovajNYTWNj?=
 =?utf-8?B?ZGREc3QwMzU0U0paZlJjcXFpdkdUWGtjZitya2dhQ2hvclZmb0xrdVBIdjAz?=
 =?utf-8?B?Ums2R2NpSVROelM0NE1SQVFPUTh3ckJGRk15WlE2N210OFNsQW5aT29JWFhk?=
 =?utf-8?B?c2lDVzBERWdyQWJhbDVuZTN1S2tVSEVVUTdNeVBTakw1Y2Mxa0x3WlFmelox?=
 =?utf-8?B?dUM4ZkJPTkoyVGxWbDExbkJXNnFxZHJ1QlhERXAxdjdkTWRYTVViR2hXVzVy?=
 =?utf-8?B?amZ3eENkanlXQ3VkOHlKRXJBWFFNaVhtakdXdjdDZ05uQ3ZrYUNCeGgyS0Rr?=
 =?utf-8?B?MUlGTFZVa016Wng4WEN2ZWVnZWIydXhqcGM3RHprTXJiY2hBdUt1OWtkcGh2?=
 =?utf-8?B?Q2N2ZVVJbE52TWZQYjZ1L1VPcU1LaXFEeW1rTVVtZ2FpZ2RlWWdKZkI1ME1l?=
 =?utf-8?B?bEhqd0tGT0VPSm1sdDJScFVFVGt6ejF3Zk14YkdMVGJvR2EwSlNqbXpVWXov?=
 =?utf-8?B?MlNZaFFyZ3prb1NhTDEzUVRZZDRiclJjNXF2cjY0Z1RReFlFSy9iRTdhanBS?=
 =?utf-8?B?ZkttTXJld25pd2FGaHp6VzdscmpzOEt4bml5Uyt6Y29HZzIxczRIbkF4em4r?=
 =?utf-8?B?OGVoYTI0K0JkK2htcWR2L1ByemkxczRjbU9PbElrU1l0SlNJa1RnWE5xYUVC?=
 =?utf-8?B?S2p1d3pubFNaNklBVmdOY1ZkYjRYK1VMOTFuMlFSV2R4MXQwTEtOaENEdjdH?=
 =?utf-8?B?MEczaWtUQ2p6c1pNS2o2Y2xJVGdoZmxPUDRWdUN3cHlmbXcwWFJTd29EYzd2?=
 =?utf-8?B?a243cGc2SHdrWmZpN0ptSG9BSWVET0JDRGw4a1RkNUJoQkIzbkhPVVdRSmF1?=
 =?utf-8?B?b25tR3hhcTllZTg1VEcxSTJQcWJLcVRzakxUQ2hIb3IwOU44SC9WbWJuVklu?=
 =?utf-8?B?cFZXRzlmVXQxUVp4UlhyazZ4WHkyajBmZTJOdE9BTDhXY3ZCdVdZbStqM0FP?=
 =?utf-8?B?N0Q0NDkvMlJTUGNsUDhIZnl2QTJpdWVQcWVtQzUyOURwRWV1MDRUZHp3ZU8v?=
 =?utf-8?B?K2VYbFpRNXh0bVJLNkhSbUdUcEVzTHBDbWNkakVRYWJQT1ZwSFJPcGdqcWJh?=
 =?utf-8?B?RWtndFhDajJqaEhickRySmZmRWlzZDNLb0FKWVVQRXk0UGxEUmt5ZFh5L2Yz?=
 =?utf-8?B?NWh1VTFla21UN0ZwZ2EyelM0aW9uU1YvbXMxdnlacml5dTh6cnIxMXZOa0ts?=
 =?utf-8?B?d0Q3cXNvNXQrUG8xMk83a21IcjlVbXpGR1NwbDFMUFkyMklkZFNpcXJsdGNn?=
 =?utf-8?B?MTNMbXgwQm02djNmZ21IOXh1M0JDQ3pMNFBBRVNyd1NFeDZXa0JHeDNaOFZw?=
 =?utf-8?B?dzRvVjZMdXhiakZtaXBBWVRPcVlMK2lNb0oyb3llUUxxOHlzUHdMWTNwTWR6?=
 =?utf-8?B?ODIwY1BHQjk2M0V6YzRVS3VneXozMkVqVzByNXZ6eWYrbyszYzJPZVFyNmx3?=
 =?utf-8?B?M1Q5U2o2WTJZL1cvS0YxU1VkVzkySFowZ3lURFp6RUE1RG9Od1pKeWJodFRX?=
 =?utf-8?B?RTRkVHBGZ3NsTDZlcis5YXZ6N3VCZFZCNnpCTDZEMVl5bXEreU1udGt1U3Ex?=
 =?utf-8?Q?Wo7WnNa3LkEysA0l6Lx9qerYKP6n0dob?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFM2NXBNWEUrbUVPT1FiMi81b2EzQnRYYTJjMFB4dGQ0UDNCdXFFakNlTGdE?=
 =?utf-8?B?NnhRc25QNlpPVGxzYVhpRVE0UDFNSXZKeGY4SjR5MXZGMHdkQ0hXYXpWM0dq?=
 =?utf-8?B?TEpUait0S3lGdmo5c1hpVUpXK0JrQnQrUXhVMXpJWDFYS05tVHZ4Y01XcTBj?=
 =?utf-8?B?Y2xPUVV3a3FDTTBCU1k4QnMwU0liK0pkK0RUdVlFMG5uN0RTZ2pPMm8raEFL?=
 =?utf-8?B?STNPbzFaNmV0UExqRjBidTlNRDEyZnM3UDF6WVZlUmQvOUFhOFN2Mk5nVVFP?=
 =?utf-8?B?TGxDU21reGg5YmQ1SXludmxxVnBLcjlSK29YWDY2Vm5kNG8zMXNOZUQxUDA2?=
 =?utf-8?B?YXR6TS9TWDM2VVFvQ3U5WXZTTGpRUHA0MWZ5SkVXMlVyNHlXalluMkNkSHMw?=
 =?utf-8?B?M3R0dU1DSE1aWUJ0QXBuMmZCZFQwNlVsbGdwVlJCb2Z0cFJPSWpZVFVvSlN4?=
 =?utf-8?B?aldaUUxxQXRoMlBLZzRnb1VDclRoVGVJTWdTZGJzUVdRSWN3RWhsS21oR2xn?=
 =?utf-8?B?aTVMZ2Q4OXpFalhEUEszU3hBcUFUZDFFcGtFK3JkMW9VMHhpbndCbGRIYTln?=
 =?utf-8?B?L21aLzlST3lJMGtmWlpyWEI4SU45Z28yNmh4ZjFZTjdIVWY3Qy9Ka0dqYW1P?=
 =?utf-8?B?ZEN4REozMHUwWFVEVHR6SFdlN2hvbmE0OFFrakQzOVMxcFlEbnFFZ2l1eXJ3?=
 =?utf-8?B?WllJYVpzeURWMWZROGtqM0RxUDJQZlVkTkJha0h2VXQzUWdsUExBK3pEOXVo?=
 =?utf-8?B?SHdYaURnaGdKd2NTREIyK3hwUVlSSzk1OVA2L2YrU3I5aE1IeXdKMXByRWFZ?=
 =?utf-8?B?QjZBNzgvamVHTXExZXNiOU8wMTIrUHFJYmpacGZSZXBwelc5aTR5QU51RkRk?=
 =?utf-8?B?RHpVMURuY1l0dnlBTkNqSXBoZTZ4WFAzbWFZT1dUTDFrb3BWNWQvZStlTEhZ?=
 =?utf-8?B?NWppOTBYT01kSllNc0FNWk1URWQycUJIL3o1UlVnTXEydE9pQjYrQzNUT05H?=
 =?utf-8?B?bldNWHBON25icWpKdWVlSDhjVDBJSFhnRER4Z1NFUWY0U1cxTEd3b296a2hz?=
 =?utf-8?B?QUVKaW1mQmNMZWRnR3o2RHNiQzYyTi9yL0p4MVZIZEx6RjhvT1RsL2dNdzNW?=
 =?utf-8?B?K2hwR2JrM0pveWNWVTRPUXhheGtlOEhOcVR1azZ3Nll1RDFsa0Vkc0dQQUht?=
 =?utf-8?B?TE05UGFFR1V5Z2dNcmdLaFVtZC82LzNKVEZqb0czRVpWUXozeHJncEkvRnpJ?=
 =?utf-8?B?dk5pNFF2MEFmek1hdnpvaCtVYm1EeG55bmlFWTlSVGdsUkZPdjFKR1BtQmMz?=
 =?utf-8?B?VWZSeGJBanpTeWdENm5pL283YnRGcThqQW9HeXFmRUptSERHbWVWbWVNZlVU?=
 =?utf-8?B?SVZUWWc0cUdDV25nUklkeXdKRSt4SW0za1pMR2U5ZXJGVFFUN3lQNFlNbHRp?=
 =?utf-8?B?STBzcnBBVHlQMnZBcFdMWlAwbDJabGQzQ1dTZVo2aEN3K0lIQVNhQ04yVU9E?=
 =?utf-8?B?MW1rK1BlOHN3Ri9aZysvMzNpZGlIN3hDbG9ON3lGK0FiWFJ1ZnBqN2RrbGc0?=
 =?utf-8?B?T0JmL2hNVC9CN0ZSdGhlcmpoYWx6WEpMZGxIVmpHaUhRZXk0dXYzSW8yWkpE?=
 =?utf-8?B?Vm9LWTRrM3d6c2tndTNHckY5VFBiQ3UvRnNhMzM1QkpGamlXb0Q2MmxDZFlC?=
 =?utf-8?B?VXc2cW94N2N1YlNtSVh4UkFkWkVPMUdsL0hHd01Cek40SjQzTzcrZWc2YTN2?=
 =?utf-8?B?WnBVL0crTkVCeGxjODlZWHFkbGFIbmhseW5xRTBXOVZyNnM2U2EwaVduVmRi?=
 =?utf-8?B?WjdocXQxYy9maWx4YkhudlhQM3l4T2x2b1ZROEVET0UrR05rV1JPRjNORDVn?=
 =?utf-8?B?VGc4SlBWVU0rSVhiLzdrTmVJTU1zWFFJOC8xaHZ6V0pxSzd4S2tUWnhGS1JD?=
 =?utf-8?B?Zmx6UHFnSmJGZlB5cUZmZE5nR0NSSnplSUROc1p1NTRMa21LU0NqejE4bHhO?=
 =?utf-8?B?aEZINGRmUGNPTkErNXBKTDFDRDZkdzVndnB2MVg2bWFpVW13aEdaN3FKY1Jv?=
 =?utf-8?B?N3FCTW43N0xDOFZneDJpaThqckVBZXYyVW5kNitKNGoxMGMvdmxZbHArMUI0?=
 =?utf-8?B?REw3Q3ZwSUd1RGdWRCtHQ3FteVU5QXlaUGMxNHZERG1jeEp4RDdYbCtoNkpT?=
 =?utf-8?B?QnFPMnE4UzgvclppWWUvWDU2WWowVmJjRFhEMEpwdFZ3UFV3R3Fua3o2TWdv?=
 =?utf-8?B?SDVvUW15aGVXMXNlckhpV0RHLzlFbkVqVExBdlBGbUhDZlg0RS81QUhxKzMy?=
 =?utf-8?B?a29ZT2RaT0dnV3o1QTZBVE51NytpWUdUTDBUbWhJSFNtYUFibzZUUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efee16c7-036d-4c9c-78f6-08de4e922016
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:44:24.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YECqfVc8KZqEgQ2v5516m+QQzm90q57Z0Kzp6QDw1cS6YxcfRXRJg10T1iFbYTo6T5XJ9/YldckETK/kw8PPCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7986

On Thu, Jan 08, 2026 at 09:24:51AM +0100, Jan Beulich wrote:
> On 07.01.2026 18:56, Roger Pau Monne wrote:
> > The current logic splits the update of the amount of available memory in
> > the system (total_avail_pages) and pending claims into two separately
> > locked regions.  This leads to a window between counters adjustments where
> > the result of total_avail_pages - outstanding_claims doesn't reflect the
> > real amount of free memory available, and can return a negative value due
> > to total_avail_pages having been updated ahead of outstanding_claims.
> > 
> > Fix by adjusting outstanding_claims and d->outstanding_pages in the same
> > place where total_avail_pages is updated.  Note that accesses to
> > d->outstanding_pages is protected by the global heap_lock, just like
> > total_avail_pages or outstanding_claims.  Add a comment to the field
> > declaration, and also adjust the comment at the top of
> > domain_set_outstanding_pages() to be clearer in that regard.
> > 
> > Note that failures in assign_pages() causes the claimed amount that has
> > been allocated to be lost, as the amount is not added back to the domain
> > quota once pages are freed.  Given the intended usage of claims is limited
> > to initial physmap populate, and the current failure paths in
> > assign_pages() would lead to the domain being destroyed anyway, don't
> > add extra logic to recover the claimed amount on failure - it's just adding
> > complexity for no real benefit.
> > 
> > Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - Revert back to the approach in v1.
> 
> You didn't fully go back to v1. While ...
> 
> > @@ -548,9 +524,10 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
> >      unsigned long claim, avail_pages;
> >  
> >      /*
> > -     * take the domain's page_alloc_lock, else all d->tot_page adjustments
> > -     * must always take the global heap_lock rather than only in the much
> > -     * rarer case that d->outstanding_pages is non-zero
> > +     * Two locks are needed here:
> > +     *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
> > +     *  - heap_lock: protects accesses to d->outstanding_pages, total_avail_pages
> > +     *    and outstanding_claims.
> >       */
> >      nrspin_lock(&d->page_alloc_lock);
> >      spin_lock(&heap_lock);
> 
> ... the comment improvement is of course okay to keep, ...
> 
> > @@ -999,7 +976,7 @@ static struct page_info *alloc_heap_pages(
> >  {
> >      nodeid_t node;
> >      unsigned int i, buddy_order, zone, first_dirty;
> > -    unsigned long request = 1UL << order;
> > +    unsigned int request = 1UL << order;
> 
> ... this I'm less certain about (and if it was to be kept, it should also
> become 1U). For one, this bounds check:
> 
>     if ( (outstanding_claims + request > total_avail_pages) &&
> 
> ends up still being okay (perhaps except on Arm32, but the wrapping issue
> there is pre-existing, albeit possibly benign due to other constraints),
> but just because outstanding_claims is "long" (and it's unclear to me why
> it isn't "unsigned long").
> 
> And then, what exactly is it that you want the more narrow type for (the
> description says nothing in that regard)? The other relevant uses of the
> variable are
> 
>     avail[node][zone] -= request;
>     total_avail_pages -= request;
> 
> where both avail[][] and total_avail_pages are (unsigned) long (again
> unclear to me why for total_avail_pages it's plain long).
> 
> Oh, wait, it is ...
> 
> > @@ -1071,6 +1050,30 @@ static struct page_info *alloc_heap_pages(
> >      total_avail_pages -= request;
> >      ASSERT(total_avail_pages >= 0);
> >  
> > +    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
> > +    {
> > +        /*
> > +         * Adjust claims in the same locked region where total_avail_pages is
> > +         * adjusted, not doing so would lead to a window where the amount of
> > +         * free memory (avail - claimed) would be incorrect.
> > +         *
> > +         * Note that by adjusting the claimed amount here it's possible for
> > +         * pages to fail to be assigned to the claiming domain while already
> > +         * having been subtracted from d->outstanding_pages.  Such claimed
> > +         * amount is then lost, as the pages that fail to be assigned to the
> > +         * domain are freed without replenishing the claim.  This is fine given
> > +         * claims are only to be used during physmap population as part of
> > +         * domain build, and any failure in assign_pages() there will result in
> > +         * the domain being destroyed before creation is finished.  Losing part
> > +         * of the claim makes no difference.
> > +         */
> > +        unsigned int outstanding = min(d->outstanding_pages, request);
> 
> ... the desire to avoid use of min_t() here which wants "request" to be
> "unsigned int". At some point we'll want to change the struct domain fields
> to unsigned long anyway, at which point the above would need adjustment. It's
> well possible that such an adjustment would end up being to then use min_t().
> Imo we'd be better off using e.g.
> 
>         unsigned int outstanding = min(d->outstanding_pages + 0UL, request);
> 
> or even
> 
>         typeof(d->outstanding_pages) outstanding =
>             min(d->outstanding_pages + 0UL, request);
> 
> right away. In the latter case the decl wouldn't even need touching when the
> struct domain fields are promoted.

My preference would be:

unsigned long outstanding = min(d->outstanding_pages + 0UL, request);

If that's fine with you.

> > +        BUG_ON(outstanding > d->outstanding_pages);
> 
> Unlike in v1, where the min() was different, this is now dead code.

Oh, I need to adjust this so it's outstanding > outstanding_claims
instead.

Thanks, Roger.

