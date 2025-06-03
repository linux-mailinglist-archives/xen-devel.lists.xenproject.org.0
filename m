Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4163ACCB19
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 18:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004672.1384391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUKh-00082T-PM; Tue, 03 Jun 2025 16:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004672.1384391; Tue, 03 Jun 2025 16:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUKh-00080y-Lh; Tue, 03 Jun 2025 16:17:47 +0000
Received: by outflank-mailman (input) for mailman id 1004672;
 Tue, 03 Jun 2025 16:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbA8=YS=oracle.com=ross.philipson@srs-se1.protection.inumbo.net>)
 id 1uMUKf-00080Z-GI
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:17:45 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46f8d9d8-4096-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 18:17:43 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553AElML028843;
 Tue, 3 Jun 2025 16:17:38 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8ga7g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Jun 2025 16:17:38 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 553FIu3E030602; Tue, 3 Jun 2025 16:17:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46yr79m17v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Jun 2025 16:17:37 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com (2603:10b6:8:f5::14) by
 PH7PR10MB7695.namprd10.prod.outlook.com (2603:10b6:510:2e5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.41; Tue, 3 Jun 2025 16:17:34 +0000
Received: from DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8]) by DS0PR10MB7224.namprd10.prod.outlook.com
 ([fe80::c57:383f:cfb2:47f8%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 16:17:33 +0000
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
X-Inumbo-ID: 46f8d9d8-4096-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Bvz81MBFxNDPQYEaUfkbYf5tO+1avxRcX3L+dkWTGJw=; b=
	PgNdm6V6I8DOYRXfHwYirxLZA8sMxxQ8mNWuMyXqWkkvnltMliylsBe+zA0miaDm
	rhYybDM4dzJXNm6DwAre1cL+ZCp9vWo1lUuqAxcmY27KCoDHr8slUdNGQUZOM97U
	u6vTRn+eZFVAHUpmQ1tooxWB+5a0rnYs4UP/n/EwSOb2aE6DiQteMQh8Lt4NGoHI
	wO7YeZe3nc/y9ovH6peAEtvHM+t0X2LUIDZYFMUyfURrCcnrfcUCpkbCy9zVwWZu
	2q8Fe2ombqyRUmOyDKdtFFDKEtxsNamN0gJ93sBXfdhqWHa8nSsbO+QrbeL+QBbE
	9JmTW4p2EdpW8trfXDBdxg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKQz2sNV1QvTJwsj7lUNz7dt+beIJ0TMjaDZa5Hx9cgqvdZuucO5yem8LjqnamD595bqRdHPZqbNNoe0DplIVsyE196gApp9H4NK5ieywUZnE2JcvXwm8nJDxka2JEscE7YNPYt28suJPs2hapjvgXFRRKohqIGxvVQ3Xcw9V1k4ixEgdZOru/hbeZIrtRTwVhuL0PxmS3h+6bhHIOzpIzmYQKnx93EaFwjIhyMDse0M9uFB39JIeaqXP7ByGm/GEX2oamBcR0lAbrvAihXVviDG6O+rfkdlik8Yvpmo5ghFE4iEYcRRjW5j7IyPXIulpkPv3N+6NWE7OezuVHA5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bvz81MBFxNDPQYEaUfkbYf5tO+1avxRcX3L+dkWTGJw=;
 b=qre0/3e84ghZpeGjNnAb6DuCR1yRsM2wOO/1qKRLprLNrHSyQPvgHmilmDGcVyGhcsK/IhJm/GDTp1aesdEGIQ4VwPw4k3NvijU1KWM+jJWRHByvamBXs5LVjUq1gPPMVTlTf1y3AWGRVfBVlW//6TPgd9lyaYygwBBdMI3YCqGoWLaN5+1ywbOPvbk7tqHsrcfbGA4IM0NUWNY3iNehKv6P3yaHXEl+p4KaktHPzHvXoKdsArCjmVUOTqubMKmKoRIhCTvANiQKKgUarKmwGQfuR/QhWs11v3QUkYndqu2ohrWVnRduBxdDkziIdoKC0wJkqGyzixHhZWxv+yt+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bvz81MBFxNDPQYEaUfkbYf5tO+1avxRcX3L+dkWTGJw=;
 b=hP/yJcaLFPjOdDbZHj7gVOYOIQdsNnckJ+0QOx0AisI0Wtub6e8AY1eivAaZFkvJeqDx2b2Wx01iHo1D6+dIpsW46TeWlaimvEuWi0sWyMW4kI5N+inDEuHJiUhFIXZLzG9Xj7pjObOAi3iup3z1s8cB+39tq7DSVTuSKBbrmng=
Message-ID: <5792bec7-cd2f-4d27-aa3b-f417b07c8ea8@oracle.com>
Date: Tue, 3 Jun 2025 09:17:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
 <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        trenchboot-devel@googlegroups.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: ross.philipson@oracle.com
In-Reply-To: <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0596.namprd03.prod.outlook.com
 (2603:10b6:408:10d::31) To DS0PR10MB7224.namprd10.prod.outlook.com
 (2603:10b6:8:f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7224:EE_|PH7PR10MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 85627626-9bb0-435f-fa71-08dda2ba2554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eG1MS2wwb3h3bnljaVVSZUhnTlVTU20wencxcFhpcnZsUHZvTmEwWUVWOWt3?=
 =?utf-8?B?bHlocUh1Vlh0aXBiS2VPWjYxWWRFemYxdzlCWTdGdGR1dC9tUFFITis3UElR?=
 =?utf-8?B?b0pYV2oxVHg5eXJtS2hVU1R1eVM3bG5nVFJwSlN2MTh5TUNwM0gwQXZ6YWd0?=
 =?utf-8?B?VlZ5Rno2YXRWYkRjdnBrSlpEMVJSazU2OEVyc2Y3anpDQXA5U0E3bi9wZCtS?=
 =?utf-8?B?WVVaWjVheUdISEFNTjVEeklyTSt5WEtaNmFYTEpySkpHdEFDckZZVE9ZVzQ0?=
 =?utf-8?B?YWMyVElCYUhZNTN5a1YvS0xiZHV5K25mOEVNa1pTM1NUaW8zbHRvQWxWdUI2?=
 =?utf-8?B?OTNWZ0F6bDBXeEwvMEFBMmNHbWp0VmIydXhBUzVtN1dxdWMzQ3BxUlA4UXFj?=
 =?utf-8?B?OTdhV3NUYkJyaWp1Q0dKUEhEaVNITTV4SmVYT1FBbEFLY3hWK3Ewd2U4VGVX?=
 =?utf-8?B?NUJPRTRkb29zQi8zSU1KMUJIQmhJNTNUQkJMd0lnRk5IdW5rV3QwaVlrVUcw?=
 =?utf-8?B?Yy9YYnRoOFpmTWpSTUVXM3A3NWlCbStwYUttM3VibkRsL1FyRzE2enlHeStX?=
 =?utf-8?B?REFEYnFsN0pYcHJFYzgwSnFWaElabkV2emdKaGVMemRjRUtWaDhxN0dsT0JZ?=
 =?utf-8?B?NlRQUFlOVllNaW9jU01iTmxWWStrazRERk5yY1A0MW1FTXFnWmpKbEtHQ0tY?=
 =?utf-8?B?aW9hSk1aY05DeXpFMGpRV1o2TDVHK1JWSTR3ckQ1NWpFYjF1aktZUUN3b2E4?=
 =?utf-8?B?VWp3bFN1WVg1YmwvUWxiVnZrWForMHRBZ2VtYmdqMDFWbmIwR2FjN2Uyb3M3?=
 =?utf-8?B?eW5mUmdBdzh3L1BlUmlmRnRScktJVFB6WjdPc3diNWpRci9TbXR3WXh5MlpH?=
 =?utf-8?B?VkZGeUJreGo4Wnp5RTBLblJPdzlZVHE5cXBNOHdIczJRYUFMMnR1Y09ILzJj?=
 =?utf-8?B?WlZCUHhWTEo0MWNzb1JFY3hEZ0l5eEVDM2U1OUVMNHRqUC9qN0t1WDkxUzVH?=
 =?utf-8?B?eTNYSDh6dDNDVE5RZ1F2d0pYSUkzUDZUNFozeUhmLyt4a2kzQjRibzFvNDJW?=
 =?utf-8?B?NG1qRUZIbS9pR1I1UUlUdkRNeVZ6TXVnd2FobmFwNUZheU9RTmVSU3ZNZFgz?=
 =?utf-8?B?L0JtN3lkVkdjL2NWQVVXR3NVc0hlRnNQS0FqZ1EvYWRNODBab3dQMFhNcCtk?=
 =?utf-8?B?SXlFak1LSUMvNVlLeDZxaFhEaUpSQ3p1dFFJV0l6YjFEWUFYTC9hNlNzS0xF?=
 =?utf-8?B?TzFnOW11MjJGM3Z0Tm0reEJNQ1lsSkRFVTJpeThLc2NLMXltL3ZQYWZrZFhY?=
 =?utf-8?B?NC8vMTZXWmdtZVRPYitqRWs4WFdFbXllQXcxWG9EMTNVUzVYaDhvcEx2MCtR?=
 =?utf-8?B?S2VjeDA0UjRUbk5kb2RvY3ZqcDVhdlZ2VzJzRTFZdnpzMWJEaTRPRHJKRTE3?=
 =?utf-8?B?N1o4YWdRQmRISGhqVWhrMEZqc0ovUXFkUTFFUVJlL1BTdS9xdmJqT2JTaVRu?=
 =?utf-8?B?Ly9FMkY0VjlJNWJyUUZmK2NRTTdOVG5rdlltNU1ST282SmdqZDJnL1d4ZUMw?=
 =?utf-8?B?MFhWU0U2UjY0M0tkOFA0WS9FajQ0bGVHNG9tVmg2QjR6R2NTQmNPUTF6Nksy?=
 =?utf-8?B?elBtT29wRDZ0eHhkcUpCdWd1cjNRemQ3dXljdTFZSG0ybmZOaTBaMW5kRlF0?=
 =?utf-8?B?M1lvVEo5cDkrZ25SNjFrUXhvUjNkQ2tVV2lnQkNOTWlaYjJNSU95b0dWRlhN?=
 =?utf-8?B?ZE5IamJyS1NvS1NXREp5dkpYckZ3VzF6TTJlNk85U0xhOGJRblpPWjRmUDIw?=
 =?utf-8?B?WVB6SUovWjFHNDBMaXRqM1BGa1ZLNDNyVDFBZEpFQTI3YllsekV6cnNIZkpT?=
 =?utf-8?B?bVRMSXcrYmNOVjVkMDdHd3I0UEJDU2YwRGVGSmh5b2FYNW5SRmxxdmpYL3FT?=
 =?utf-8?Q?CDKUH/lAQ2Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7224.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmJ5YjkrMWJmWlVCaU03TUdtR0pFRFFjMnhOTGxGWm9LMTVBN3BDWFFmQnpV?=
 =?utf-8?B?V3lWV044MzZXdmpSUWY3K2ZvWVJNWi8zNU93dzlsa3Job0RZaTZMSnhpeEQ0?=
 =?utf-8?B?N1RPMEdyRVlNQjRkam5QQXF6dVduNFF6WTl0ZSszSzhTSzhJcWlHaElPQ2RL?=
 =?utf-8?B?SkNJaHpXT1ZXRkRzU3RrQ2pUWXVxaDdKQnV4MGJ0ZlJUdW5YcDYxTW14R2tB?=
 =?utf-8?B?Ni9xT1JKNXZ4NXFKdUpPZndNdnJqeUEvNDBjQS8zQ2xsRDh2bGJ4TCswYzQ2?=
 =?utf-8?B?ejEvRGpBdlhBWEkvZk0xZ2tRTVFwbzRWNVc2eFVLdDI2eDFxU0ZXM2FxajRu?=
 =?utf-8?B?bjBjUE04dUE3SHBRV0xGM1RQNTl4Qk1SZm1PWnIwZ3FPNkNnM3FRTHdiNHpL?=
 =?utf-8?B?cGZMWnFLSGNUbjliN01NTDdzalNaVmxvS0VTQS9hWVlRVXpUUXlYMTNObnRx?=
 =?utf-8?B?R3RKcE1oY21OZVVMemdzODBTVTM3dks1UjEvSVA2VmMxTkFMQW5QdSttV1di?=
 =?utf-8?B?V0lzalhLZHIvbU5FU0xoNEFRQmU0U2VrYWd3VEdQTDEyUWJ4T2NxTFhGSHkw?=
 =?utf-8?B?OGl5bUtGUWF5aDM4dkk2ZFVjOFc0WEt4Z0NPNHlxMlNmbnQycGRwWUJxR2U1?=
 =?utf-8?B?SXhHQ3A0dU9aWkFOR2d3UFZxRmRTSXE3VnE3eFB1T0IvUUdPcnJ0Kzl5QTlq?=
 =?utf-8?B?UWs1ME9SZW05UGRzdHZjdlVabk9aeTFXNlE0U3FDUGJyeHRjUjJGMHFUejky?=
 =?utf-8?B?L0xONHVSQUpsV29aOHJoNkVuejNDK0ROd2x4SGlrTEM4VnZHd2JvMEpqWlNq?=
 =?utf-8?B?TUVUeE8yQXlySjFmdTN0MTdmSzhiSTAvTEZGWVZKWDFhdGdoNHF6cXZlbUh5?=
 =?utf-8?B?Y0xCWm1GNTZGSW5IWnJPQ0FEMUVRN01xYnpnS3RrdzZVOU11K2VCZndtRVMv?=
 =?utf-8?B?ZWI2dStvcWI0bENPNWZVMWRGVkZJK21wOHRuOG9DZjI3end3aVQ5TmxVS25Q?=
 =?utf-8?B?S1RCc0JFcXNxSjB0dFloN1ZQWmVkVmtRRkRNY296TzV6OVRKbHUzNFc4TDNw?=
 =?utf-8?B?QjRaVHF6MFczMG1IRHkxQ2pUNk03aTFtcUV5Y2daVTlGVGo1SExxQkxZQ0JZ?=
 =?utf-8?B?S056NUErc0pkMlJLY0dldGl2RTdPV1VQV2o5emFkanNPVzE1TkNkdkw4dDlk?=
 =?utf-8?B?UHhVK01qY1JCL25DdUNXRWovL1NvaTRna29vMVloOFNJZTUrd29TUzFpN0lz?=
 =?utf-8?B?eW1Xc2ZvNVVqdkpPZjM2MHQ0WjF3Y3E0RnVpMzhmbUh4cXpVVXg4R2xCSVhB?=
 =?utf-8?B?aTlDdmtpY2VNS1RyL0RGd0Z5bllHYnBtSktFS1BFYmJrVjkxdG16MFVnR2dJ?=
 =?utf-8?B?cGhtWW9tNzl3YVJOUkFPS0RCM3ZSZHcvS1VFTUhZSWhwSi9sdC9IYnYvWGJ6?=
 =?utf-8?B?TTRLZWRtdmdyRHA0V0NYdzhJTThxV2M4UCszakJ5MWhSMVdrOVVWTGJkVzZm?=
 =?utf-8?B?SnR0SDJOTTF1b3I3V3QxdjRraUVqYlo3aU5aVjNRaXc5c1J5VTIvdnhnNS9a?=
 =?utf-8?B?ajVtc1NMa0diY2MySDNaRUVLRU1NQ3BFL3ZMQUtQTThGVUE4dUtLNmcvUHc0?=
 =?utf-8?B?WFdIZ0lGUFJvY0xtNkMyMzF2S1Bmb0w2Y3d6WlFyTE0zSzdKcFhkcWxjUTZF?=
 =?utf-8?B?NmFJV3JWSlNUVExoalFkRk5wSCt5Y0l3TVc3WldicmgwZEsvdlFpTUJoenlG?=
 =?utf-8?B?dWlYdFdXNEZKZTBGcVA4RmFQY05ySkpMcU9DUEcxU2htZDEzaFBSS0tzYmIw?=
 =?utf-8?B?U20rUkJPcitsWm9mRmZwaG94Z2dPR0h1MWxnL3pWN1V5UVNBUVNzQmkvb1py?=
 =?utf-8?B?L0pDNjNCUzBKRURKZ0tXMGRoT3BNWTV5MzdnaDV0NmgvUkw4Ym5HSUd1RnZX?=
 =?utf-8?B?dW9WMTgxazFoQWFyOHhIcVVTYi8vclFJdkgyVnR3Nm4rMkIzbXE2UnMwb1hm?=
 =?utf-8?B?OHpiREZ5Mk94Y20xdFlDQ2FXbzBoS09kaEpGR09PUHNOQkMxaTRwVVg5UFNV?=
 =?utf-8?B?V0FoT2pNVjdKK3NzelpGY2RZcnRUV2U3Yk5DVWNpYTNnTHpOUjZob253TkRO?=
 =?utf-8?B?L0xLaDBIdllGRUh5QlZXd1Vsd1IvdXFQRFdqd1JsYzhQR1QrOHRGRzlWdnha?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OleufUSMA1XO/3rtuhFyUPkjqMUt/7BwtpmaG1x0yuxq51J8N+A4+tkyVDzorqepmHYmSV7kcqVJNPE//TLDdlr48LPHtX58Q/Nk1k4YvjmQgqmUQRU307EReCmLcqxGfiaUUZbriIBf+jS4Aja/edDlGy6o9lby0u2abYMB9sbk0qEb8zWuxPsThL9asWo11Z5VzDFKVC1N4I1frGfAlIb7mK5261nm0G6jFmmQ9LPxBPmr7/Mvf9B1EQ0op5UZKQqRQ4WY/zkDnt1J80r4ffuVzTYCqXk7c7myy6JR9NKb4MRP3+f0iLjHXEWRBsdt164KamihJOk4iiy7OoRb4fMdExGRTaYxiVvRNP0C/+Kp2gOFBu1u3jk9X0qIuk55pFFjuqKruIJfM0/wrZfCS/FmgjuTQm5nvBL9M4NVjaLu01KHt4omh9B4vDG7HT/3wRJtK78v6febJPxxgfeCZ7Pbg9S1Szcp/NXH00nX0eUG3tPAtT4hmCDhkvFW3kQPUGd0lSgMaNZEQcaB9pvPhDU/s9cY8Xuw3kspL1q+hKm0E4P1lO5Zz/IHuuHeT7gCZljdJ7kvMjZcKsLcw9Fv6nWIAbq623+Iw5dpJjnlB40=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85627626-9bb0-435f-fa71-08dda2ba2554
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7224.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 16:17:33.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp+WVr7sfHdChu8ZVs3qTywqCKEGXWNI5u8Dz6XrxN/tDn4a3y5nNYYBDwW651Gd86BKYSOuns35ngCyl2nCX1kev9PqISvm8qfu+g6wT7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7695
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030141
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE0MSBTYWx0ZWRfXwaYWXIqAmzMg LCI9fTeMfSY9KXCmCnl8cCf9mKZ8Gew9LQkQ7QmaOBa5EPwP38eEap0VOMQs2stvYcYumySc2cx 3/qkxe5Bi16rBRJlnmh/IjIyMXc44mDBC/lPiJ+5cOzIweGmC3xjDGACSl0AGiRaSErugXMJ0++
 gUHa2nPr9m5+lMhnGSjkxnbyDRfDZ2PhVU+SfYe0mIFTANiqWxEpq36/NuI2I8XoKcTxx2aIauM h9cByH+Rq41s3atQt4kr2zm6ULzennZD/tAayCtS4TE6sOppxhyJnrPqmsjlLgQsMXO81IgkwP0 6N6uRRYqR/8bLo2ZQ2qYJY7ZpiMk2qtJRTY0nNsrep3UT5/DheZEE0WQs8Q+Gs/MZw1WKpdifSZ
 jqTCZVlrN24bzcrb4Icz/FdANxxrj3rNQ3kWiR4sPcy8pmVSDmgV50u49Q+KUohve6yb99r3
X-Proofpoint-GUID: RoH5XLgP5PLOMhwntx6OBEZEyHaEUd07
X-Proofpoint-ORIG-GUID: RoH5XLgP5PLOMhwntx6OBEZEyHaEUd07
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683f2022 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=C_d68mY_AAAA:8 a=ybf3h8MS243WDXt1rIEA:9 a=QEXdDO2ut3YA:10 a=wASdygnoxNaGnvDdgHrj:22 cc=ntf awl=host:14714

On 5/30/25 6:17 AM, Sergii Dmytruk wrote:
> Make head.S invoke a C function to retrieve MBI and SLRT addresses in a
> platform-specific way.  This is also the place to perform sanity checks
> of DRTM.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>   xen/arch/x86/Makefile                |  1 +
>   xen/arch/x86/boot/Makefile           |  5 +++-
>   xen/arch/x86/boot/head.S             | 43 ++++++++++++++++++++++++++++
>   xen/arch/x86/boot/slaunch-early.c    | 41 ++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/intel-txt.h | 16 +++++++++++
>   xen/arch/x86/include/asm/slaunch.h   | 26 +++++++++++++++++
>   xen/arch/x86/slaunch.c               | 27 +++++++++++++++++
>   7 files changed, 158 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/x86/boot/slaunch-early.c
>   create mode 100644 xen/arch/x86/include/asm/slaunch.h
>   create mode 100644 xen/arch/x86/slaunch.c
> 
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index ce724a9daa..aa20eb42b5 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_COMPAT) += x86_64/physdev.o
>   obj-$(CONFIG_X86_PSR) += psr.o
>   obj-y += setup.o
>   obj-y += shutdown.o
> +obj-y += slaunch.o
>   obj-y += smp.o
>   obj-y += smpboot.o
>   obj-y += spec_ctrl.o
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index ff0d61d7ac..5471b966dd 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -5,6 +5,7 @@ obj-bin-y += $(obj64)
>   obj32 := cmdline.32.o
>   obj32 += reloc.32.o
>   obj32 += reloc-trampoline.32.o
> +obj32 += slaunch-early.32.o
>   
>   obj64 := reloc-trampoline.o
>   
> @@ -28,6 +29,8 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>   $(obj)/%.32.o: $(src)/%.c FORCE
>   	$(call if_changed_rule,cc_o_c)
>   
> +$(obj)/slaunch-early.32.o: XEN_CFLAGS += -D__EARLY_SLAUNCH__
> +
>   orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
>   LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>   LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
> @@ -81,7 +84,7 @@ cmd_combine = \
>                 --bin1      $(obj)/built-in-32.base.bin \
>                 --bin2      $(obj)/built-in-32.offset.bin \
>                 --map       $(obj)/built-in-32.base.map \
> -              --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
> +              --exports   cmdline_parse_early,reloc,reloc_trampoline32,slaunch_early_init \
>                 --output    $@
>   
>   targets += built-in-32.S
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index a69107bd81..b4cf423c80 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -472,6 +472,10 @@ __start:
>           /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
>           xor     %edx,%edx
>   
> +        /* Check for TrenchBoot slaunch bootloader. */
> +        cmp     $SLAUNCH_BOOTLOADER_MAGIC, %eax
> +        je      .Lslaunch_proto
> +
>           /* Check for Multiboot2 bootloader. */
>           cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
>           je      .Lmultiboot2_proto
> @@ -487,6 +491,45 @@ __start:
>           cmovnz  MB_mem_lower(%ebx),%edx
>           jmp     trampoline_bios_setup
>   
> +.Lslaunch_proto:
> +        /*
> +         * Upon reaching here, CPU state mostly matches the one setup by the
> +         * bootloader with ESP, ESI and EDX being clobbered above.
> +         */
> +
> +        /* Save information that TrenchBoot slaunch was used. */
> +        movb    $1, sym_esi(slaunch_active)
> +
> +        /*
> +         * Prepare space for output parameter of slaunch_early_init(), which is
> +         * a structure of two uint32_t fields.
> +         */
> +        sub     $8, %esp
> +
> +        push    %esp                             /* pointer to output structure */
> +        lea     sym_offs(__2M_rwdata_end), %ecx  /* end of target image */
> +        lea     sym_offs(_start), %edx           /* target base address */
> +        mov     %esi, %eax                       /* load base address */
> +        /*
> +         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx, ret/stk) using
> +         * fastcall calling convention.
> +         */
> +        call    slaunch_early_init
> +        add     $4, %esp                         /* pop the fourth parameter */
> +
> +        /* Move outputs of slaunch_early_init() from stack into registers. */
> +        pop     %eax  /* physical MBI address */
> +        pop     %edx  /* physical SLRT address */
> +
> +        /* Save physical address of SLRT for C code. */
> +        mov     %edx, sym_esi(slaunch_slrt)
> +
> +        /* Store MBI address in EBX where MB2 code expects it. */
> +        mov     %eax, %ebx
> +
> +        /* Move magic number expected by Multiboot 2 to EAX and fall through. */
> +        movl    $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
> +
>   .Lmultiboot2_proto:
>           /* Skip Multiboot2 information fixed part. */
>           lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%ebx),%ecx
> diff --git a/xen/arch/x86/boot/slaunch-early.c b/xen/arch/x86/boot/slaunch-early.c
> new file mode 100644
> index 0000000000..c9d364bcd5
> --- /dev/null
> +++ b/xen/arch/x86/boot/slaunch-early.c
> @@ -0,0 +1,41 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#include <xen/slr-table.h>
> +#include <xen/types.h>
> +#include <asm/intel-txt.h>
> +
> +struct early_init_results
> +{
> +    uint32_t mbi_pa;
> +    uint32_t slrt_pa;
> +} __packed;
> +
> +void asmlinkage slaunch_early_init(uint32_t load_base_addr,
> +                                   uint32_t tgt_base_addr,
> +                                   uint32_t tgt_end_addr,
> +                                   struct early_init_results *result)
> +{
> +    void *txt_heap;
> +    const struct txt_os_mle_data *os_mle;
> +    const struct slr_table *slrt;
> +    const struct slr_entry_intel_info *intel_info;
> +
> +    txt_heap = txt_init();
> +    os_mle = txt_os_mle_data_start(txt_heap);
> +
> +    result->slrt_pa = os_mle->slrt;
> +    result->mbi_pa = 0;
> +
> +    slrt = (const struct slr_table *)(uintptr_t)os_mle->slrt;
> +
> +    intel_info = (const struct slr_entry_intel_info *)
> +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
> +    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
> +        return;

Since these are the x86/TXT bits, it seems at this point, not finding 
the TXT info structure would be fatal, no?

> +
> +    result->mbi_pa = intel_info->boot_params_base;
> +}
> diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
> index cc2d312f4d..7658457e9d 100644
> --- a/xen/arch/x86/include/asm/intel-txt.h
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -292,6 +292,22 @@ static inline void *txt_sinit_mle_data_start(const void *heap)
>              sizeof(uint64_t);
>   }
>   
> +static inline void *txt_init(void)
> +{
> +    void *txt_heap;
> +
> +    /* Clear the TXT error register for a clean start of the day. */
> +    txt_write(TXTCR_ERRORCODE, 0);
> +
> +    txt_heap = _p(txt_read(TXTCR_HEAP_BASE));
> +
> +    if ( txt_os_mle_data_size(txt_heap) < sizeof(struct txt_os_mle_data) ||
> +         txt_os_sinit_data_size(txt_heap) < sizeof(struct txt_os_sinit_data) )
> +        txt_reset(SLAUNCH_ERROR_GENERIC);

I know the list of error codes pulled in are from the patches for Linux 
Secure Launch which seems right. The Xen work is free to add more 
specific error codes e.g. somewhere like here. We could even consider 
using regions in the vendor error code space for different things like 
generic errors vs architecture specific ones vs etc.

Thanks
Ross

> +
> +    return txt_heap;
> +}
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* X86_INTEL_TXT_H */
> diff --git a/xen/arch/x86/include/asm/slaunch.h b/xen/arch/x86/include/asm/slaunch.h
> new file mode 100644
> index 0000000000..df42defd92
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/slaunch.h
> @@ -0,0 +1,26 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#ifndef X86_SLAUNCH_H
> +#define X86_SLAUNCH_H
> +
> +#include <xen/types.h>
> +
> +/* Indicates an active Secure Launch boot. */
> +extern bool slaunch_active;
> +
> +/*
> + * Holds physical address of SLRT.  Use slaunch_get_slrt() to access SLRT
> + * instead of mapping where this points to.
> + */
> +extern uint32_t slaunch_slrt;
> +
> +/*
> + * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
> + */
> +struct slr_table *slaunch_get_slrt(void);
> +
> +#endif /* X86_SLAUNCH_H */
> diff --git a/xen/arch/x86/slaunch.c b/xen/arch/x86/slaunch.c
> new file mode 100644
> index 0000000000..a3e6ab8d71
> --- /dev/null
> +++ b/xen/arch/x86/slaunch.c
> @@ -0,0 +1,27 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#include <xen/compiler.h>
> +#include <xen/init.h>
> +#include <xen/macros.h>
> +#include <xen/types.h>
> +#include <asm/slaunch.h>
> +
> +/*
> + * These variables are assigned to by the code near Xen's entry point.
> + *
> + * slaunch_active is not __initdata to allow checking for an active Secure
> + * Launch boot.
> + */
> +bool slaunch_active;
> +uint32_t __initdata slaunch_slrt; /* physical address */
> +
> +/* Using slaunch_active in head.S assumes it's a single byte in size, so enforce
> + * this assumption. */
> +static void __maybe_unused compile_time_checks(void)
> +{
> +    BUILD_BUG_ON(sizeof(slaunch_active) != 1);
> +}


