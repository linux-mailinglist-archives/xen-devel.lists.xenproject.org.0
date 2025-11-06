Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162DC3C277
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 16:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157059.1485980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2CQ-0005dT-Dr; Thu, 06 Nov 2025 15:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157059.1485980; Thu, 06 Nov 2025 15:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH2CQ-0005aW-Ak; Thu, 06 Nov 2025 15:46:58 +0000
Received: by outflank-mailman (input) for mailman id 1157059;
 Thu, 06 Nov 2025 15:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oVY=5O=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vH2CO-0005aQ-VE
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 15:46:57 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d10da985-bb27-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 16:46:53 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS8PR03MB6760.eurprd03.prod.outlook.com (2603:10a6:20b:294::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 15:46:51 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 15:46:51 +0000
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
X-Inumbo-ID: d10da985-bb27-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh+te1VdcD0cb9l4u12ekF8PgYZSEyVOlhSK1+Tq7bvkeg5UmKDmZKl1GwdPuo5cW2f9B56NqeZy+No3Tzlb7edp5mepKe16bulu2DUAq38qBsxsKZBEbXiIBX6x4NW6hmH/SXJ7lBGzc6nSmZT6dZK8PVVjrYKp0M22xZJ+Kh8o4mjybvr7xq0VhhZcFcM80+Q1yV6/44IIbdjGQZPhEjgOOx0d/uX39rI5ekjfE6P8Ep9HGIY0XevefgdfjbAi92+WxNGDubmkThOlRGqNoFEWZ437y999B3m95Gb4Y57fK5yGWTmdTEgpIeNRFsVap8y+/fLfYNmX/XHXrDkvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxG1DiFa6djj21dc9zlgpnIR6yeIssmXx38CcV7BASQ=;
 b=EYMmT4jcU4UaeDzAutX6xtRwo3L+yxdSuPZJC4B04P1+UIF+CF9d3BSFMfpm8ssQ6E1NNoMZe30G4ydqK7JUlj2T9Ag4AIJb8GOzDHoqER1Ze4i+C7nmJzsmBHVuao2C9ps5rLpsXquF/HsPlWd3vmirNGnP+hCaesPWhOtOe32D8euR6qjUbmT3C4IPDXMrTlZtxuQHeB1IkxFMvS6791uuOZ5E0G0K2TNWKLozn9D1IHfdpCR+1wDXhlRnjjil3Sdfq0bWtlD7250PK4YqXMdKfZ4M16DBivz4vbSj486KtpJoB3oLowEMDG3KVBKWKXp7qFv8T9aZNF+8Yu1PQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxG1DiFa6djj21dc9zlgpnIR6yeIssmXx38CcV7BASQ=;
 b=AR3b+peeZHyL1BXWcV4F0pHq2/iUm0fQPnFAmTQpJ+ge6EwIGHydmL9kAZyAI68d2hQaKSUleoBVTAv9DDkSOs65SdwdB6x7RmydC3ysX4zVtqZTIHqaFE/nBvv1i/hq5wFPDc6XZl+17IghPFaG3jX2SMqx0uxIgKsZHbpB/ivIxRbGTMtzP5VNm3rNdcrNQ3x4dzNu9g2PdQ6Ap8lgFOFe9V1mRSX2S89aO0u8P1iDpnUkqEi8qChI0D13bpJrkcqZo1phHvXgaCV+eRRMemqR6WNUIJ4qT7iXJ4heUEeLK90oCLNi8jQl2hIdx+lyhFQmwekhwAAygOGW8fcgwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8a2e96e4-90fa-4cbc-90db-931b98926842@epam.com>
Date: Thu, 6 Nov 2025 17:46:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/3] x86/hvm: move hvm_shadow_handle_cd() in vmx code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
 <20251029235448.602380-2-grygorii_strashko@epam.com>
 <308ecf14-e831-47f4-8c64-4005bb4dc857@suse.com>
 <6373016f-9558-4d73-918e-4251d16643ef@epam.com>
 <7f321809-5635-4993-b435-7707b21e6378@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <7f321809-5635-4993-b435-7707b21e6378@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS8PR03MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: a30c11a3-5d53-4750-4a85-08de1d4bb40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3VETkZ2ZnVJdlQrSGNwNmV3cTJtRlFubVBYblVoMy9LVFZkdUV2T0xiblZ1?=
 =?utf-8?B?SjVZa2dwbk1XUDh1Vmg0Y1pOWW9uakRwZVB2NlgwMWZqMHRJdlE4ZXQzMVFt?=
 =?utf-8?B?N0xIaFFHcGdrNXNmTDdIYjFLU2V3bVlkLzF1VVdRWHJkNWNtdWZ5MHV0Y0RD?=
 =?utf-8?B?T0lBNThkVldudlZjTDJnMWR6dlR4OW8xUnZwd1grSEVlTFJxV3U0WEM2S0ds?=
 =?utf-8?B?QWtpdEQ0ZFpLZkpWc2kvU285V1V0M01USEN3U3dibnQ3Y1ZqRTFIeEM5WmxD?=
 =?utf-8?B?V3BEbnIzTTdCODczakhNc09DRDIvM05xamVSbmx3U0lRaDd2czBUTTdFMG1r?=
 =?utf-8?B?TXdsWmwrM25mcnArMExiek4yTnhKYklreCt2RFZIYkF4UkVsTU9zOEhrLzF5?=
 =?utf-8?B?NG12V3MwaUJ4YWdHa0NNT3F2aDM3Y1o2WHdFQlc5c0g1YkpYakNRMHBYSlFG?=
 =?utf-8?B?aHYvYjRUVHk0T1Y3bE1Wak9acmEvYmhYVC9tOUtFWlNKSUY4NUVKaHN5VEpz?=
 =?utf-8?B?d0RQb2V6TXpWSHU4a3JHdDEzS0pVL1cwRGVESHZuU0xHUHlDek5rcHlzTkFk?=
 =?utf-8?B?aFR6ME94eXd4bGxESE1UU25GM3JzcHZCWWdSTG9aQXBXSXcrUGlicVhFS0pq?=
 =?utf-8?B?K0ZVKzNBL1BqUGZFU1pOTTlqUWZiRkozZVhSYTBZL1o0RFZwei9abnJOK0dS?=
 =?utf-8?B?dndPTjBPU2RwRDBjTXMxcm9USVlTYzZIL3cwU2hBaUsraGQ5eTlVSDgrT1Jr?=
 =?utf-8?B?OXM0K2xudklpUzhUQUdTYzN4UEN3aHNOcTB1NFRLMnNRL1RzRjFMNnMrNGp3?=
 =?utf-8?B?d2QxWEZ4Q1BVcmJUcTRPOVZnZlMwK2gyL0NQcEhrclFScFZzYUt1VnBQbHFK?=
 =?utf-8?B?RWlTT1A5Ty9zTnNZYTcwK05OME44NjVkeXYwNUgxQnl4K3VjcVdBNjNDZmx3?=
 =?utf-8?B?bEhmR01oMWxwRjZuOExlMDExOHR0Q2FPMWp6Q1NWMVFtYWlJTmxQYmJReTlv?=
 =?utf-8?B?eUxlNGxEeFdNZnNPR2FOYzlBOHpIQUZkWldQdzQxRkNaWUFLeVFra3FqZyt4?=
 =?utf-8?B?ck5vaUZZMXlMTXJEMEhnWHU0cSs5K0c1bHVnMUJOVG92Z2o3MUJVK2dOSzFV?=
 =?utf-8?B?T04wS1V3WFVSN2lpajJhK0pnSXpLMCs0ZDJWWllJWFBRWUwvd2k1Y3RkdzNk?=
 =?utf-8?B?bldwMVBRTnB2aEVIWVcxczNPcm12SnFlSFlUSlpJb3RoZU1Ha2U3bU4rOVdR?=
 =?utf-8?B?R2dOMnRkZTdYa3l6c1JvQ0dzWnRjSHlwWE1uTkRobkFTOUl1SUhNMHREYnRK?=
 =?utf-8?B?NHRJSlNRU3h2TmRMaGtuY0xtL2pBMXpMc1Bya0VkUzZKazJYYkJzNnQ2VnpC?=
 =?utf-8?B?VXk1cnlVd2Vwc2p5VlVybFdiVG5tSEZZcXM3TENvSDRkc1hzUjFhVGEvVGNY?=
 =?utf-8?B?THBFdk5XSnJUMXljQzBJTHdIOGJINDkrV2xNSVRVc3NmcVZxYjFyRkFyTVYv?=
 =?utf-8?B?S1lQZWZRR0NRMUEwVUZlSmZ4dmNaWG5HZFZKUUQ1QnhxVUxneFprdEJ5ZXpw?=
 =?utf-8?B?S2xQSTdHcG5CVmI1Z2FxSjBYUmpjcWZwNGpHYVVOWDZoeVA5VGVpVWVjS0tI?=
 =?utf-8?B?L20zMWVRL1Q2dWs0dkFTV0t0MDJ4ZjJtVWNOV0NNT3NSREZrSjZ3L3Z3Wk9V?=
 =?utf-8?B?WXlYbTAxdVdpdEUvWUpuQ2NuZnNkYXBFcGhhSCs2VE9ab2hDQThyZk9JbkN6?=
 =?utf-8?B?Wk93Q1g0cUN5RkY4ZGZQS2h6WEE1M2czR25DTVpFWEplZDl3KzlpUnR3ajVT?=
 =?utf-8?B?b1ZIK0RDTzNiTERTMytIdHNnQVZ6NGtuSnI4dnFiQTZZOHhhM1NNMitnRTdO?=
 =?utf-8?B?S1YvaUpWOUlBSFBMT21xc3BKRW5hOHpzeTFWbW53NGxXTjBhVlNZOUxqM08x?=
 =?utf-8?Q?Vf4O+YmloYtJ1RXdW/HU9LSo60eqlwDJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlVvR3p1djBaNnRuM0hyVCtEVGMzTFl1Q1dHbmd4WlFrRWxDZjlKK3BtNUR4?=
 =?utf-8?B?VlZ1QnN2MEh2S3RPeDk4emRaOFRmRm5CSWlxbjV6RVlmVm9hd2pUTDAvNU0y?=
 =?utf-8?B?d0xwSXpnN1JLUVhNZUpsRXMyZmxKMkhZTE1VV0syUklhOWFLaFY2aDY0b0p4?=
 =?utf-8?B?SWplS2h1dG5WU1VPVElaWW55NW5DVitTRGt3ZW1xTnRrTnFuUDgxWDJaYk13?=
 =?utf-8?B?NlpWcURZZWxwNHhsUXM1NXlsM2c1T3IwdFZndkhVUGlpcWtNU29tcFhmdHVH?=
 =?utf-8?B?N0ZSTkV6YWpIVmN6NGR4N010TXBSNHRvV0VtZlBVYUswV0RDK2RlUDZqYlVl?=
 =?utf-8?B?L1ZxQ0dxcWxDV0x4WVBraEhNZCtEZEx4bVB2akZaNmpQL1lpOVN1MnFqb0Jm?=
 =?utf-8?B?UGJtUEV0blZCZXRIRWFXK2taSkxsOGFnREsyOXlnSXBqczlrUm1NNkxtMFor?=
 =?utf-8?B?RFRkMDFKSjU0UWI0U00zbDYweXZSQlkzNXV6VWx0ZzFuY1A3N29pWWsxb1ZP?=
 =?utf-8?B?S3ZZbDVTeGZlTk1IN0x4Z1lBLzEzYTcwaUczbE9vUmtHNjArOHZuNVBJSzZz?=
 =?utf-8?B?U1dqT3Yva0Z1dXpVSC8wc1I2ellaVytkRk1KcFNpSSt2WDRuSG9ub3d3aU5P?=
 =?utf-8?B?d1lWMlBuNENoUXo1UEFJNkJndEVEVFRPWFFMb25tcjFTTCtHT3A2ZGNqZTJl?=
 =?utf-8?B?SzR1OG9hSXpLRUh6RFprMFBUUXRoT1d1R0lmV0dBQW1LZm8zUVUvOVZTZEV4?=
 =?utf-8?B?UjdpM2NPVTRnaVFUbStFVFp1eGpQTmppMWhKQy9iWEcraU9VU1RLVGRsS2dC?=
 =?utf-8?B?c1laTStoNWlsNk5FMGZYaXh4dVJMd3k1V0pOd0cyR0Y0Q0YvZDhnekdoYis5?=
 =?utf-8?B?VUJMSGJVcGR5aFE1RWJBSUNDL1ZaV1pXcWFvamZ1U2hHQjBNdmgwQXdBTnF1?=
 =?utf-8?B?bnNjNE5UQ1ZTNkl6YVRyMjlRZlZTMENiV0hsTy9EQTFzbjNTbVZUWWtuTGU2?=
 =?utf-8?B?Zlpoc1lpWUZSQWpaWURxSWV3ZktqcVdLS21oc1VySXE4cnRSMEZrRjNkV3Uz?=
 =?utf-8?B?bVpMYWY4QTBlZEtYYXVjL2k2MVBmN0JCWWJjN3lMN2xMR2dPMGFmNTEvTTNJ?=
 =?utf-8?B?SmpGTG9TYWIyalhkUGRtR2hEeW4rMGozMVNpM0F3UU15VlV0cllZQ3dNTXVy?=
 =?utf-8?B?UHFOTXI2R01DdkFaSjlGUm9jUEg5QlZISWd4WVdkUFVhaXluT0hLU2pXV0U1?=
 =?utf-8?B?cjQ3eDd3U2xrMEdzUEp3ZXgxVDVQNnN6UmhWY05KbXN3QjFCQU4zblRSZ2s1?=
 =?utf-8?B?aXMzNmV1Z01MbkhsdU01NlRRbjQ1OHp2VFJQYklNeEJueHBSM245Z3M5eHdG?=
 =?utf-8?B?Y0V0WmU5WGZsZ2hJaTFBOHdCVzMrSjJudUNCbU83RkNRcFhqVnJoWjlKWE1F?=
 =?utf-8?B?eVB2dDMyZzdYWkV1NHdNbDlaazh5VUN0VnVtc01qTjZZRmpiL2t2Mmt2eVl4?=
 =?utf-8?B?Sy9xTjdPdFdzSW5XSXVzRk1Mek5vRHF1MUVSaldxMTdWdlZpbitXd1lDTkRo?=
 =?utf-8?B?ZzhzZGxWWUtEMWp4dnZYeFFVRWJyVTBvdEpUQkhBNGZzUHBieER0TFFEeTFu?=
 =?utf-8?B?N3pFNDdMdHRHK1kyMld2M0VkNWl3cFFuaDlWWlRQMFFMRUduaXdLTW5ZZ0Rj?=
 =?utf-8?B?ekdJVHBEd3FwMTJJbm10NUM4cWh0Qng5VkpreW5tOXRSdUlHSjQrNitCRFl5?=
 =?utf-8?B?Wi9jb3VROWJuN3l0RENuSU1BUU1LN0FtRHFNZW16SndjOXVWUDVKb0M0aXBE?=
 =?utf-8?B?elFJekw1Y2hLSnhYeHV4SXZYWCswOTJ2VVlDVEY4ZkMxT2FUYW82VmdLeVRO?=
 =?utf-8?B?a3RZOFZkZ1N3ZXRwNEhwZGt4M3lWTGJsNHBEMU5GWFpzZ29oRUVDZzdjTy9L?=
 =?utf-8?B?cEdwcTJPWlBhUno3dkNBaWZjUXRJZFBSOXBDZ2lvRjM2K2QxMEZnMDZlUHJu?=
 =?utf-8?B?VUZFS0NQRGdWeTNmdHhxQ3BjVHRkNTR0TTFqT29RL3lZOU1GdXpYOXJzRDdQ?=
 =?utf-8?B?dktlOWlFeTNkbzAwV0VFMVJHNWhKWGRialN1U21oeXprNS8raFNIREhxdjE0?=
 =?utf-8?B?T1dhZEx4WkczU1ZzdSs3aFdJVitSbzAzTlo2RjVZMFp4NGw3dnU4SURnKzd3?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30c11a3-5d53-4750-4a85-08de1d4bb40f
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 15:46:51.5485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT3LzL6agc/CHC0STgASfRypU3KOOnT+nFxM4u86ZC9Q+2ha1ZrRKmfEScxKAvE6eX2l+pDY+Ionidr7ctMqkzZaGrvQRqhLe3dkPhFSl0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6760

Hi

On 30.10.25 14:47, Jan Beulich wrote:
> On 30.10.2025 13:28, Grygorii Strashko wrote:
>> On 30.10.25 13:08, Jan Beulich wrote:
>>> On 30.10.2025 00:54, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Functions:
>>>>    hvm_shadow_handle_cd()
>>>>    hvm_set_uc_mode()
>>>>    domain_exit_uc_mode()
>>>> are used only by Intel VMX code, so move them in VMX code.
>>>
>>> Nit: I think both in the title and here you mean "to" or "into".
>>>
>>>> While here:
>>>> - minor format change in domain_exit_uc_mode()
>>>> - s/(0/1)/(false/true) for bool types
>>>>
>>>> No functional changes.
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> You did read Andrew's request to also move the involved structure field(s),
>>> didn't you? Oh, wait - maybe that's going to be the subject of patch 3.
>>
>> yes. it is patch 3 - It is not small.
>> And I really wanted this patch to contain as less modifications as possible on
>> top of code moving.
> 
> I wonder what other x86 maintainers think here.
> 
>>> While
>>> often splitting steps helps, I'm not sure that's very useful here. You're
>>> touching again immediately what you just have moved, all to reach a single
>>> goal.
>>>
>>>> @@ -1421,6 +1422,64 @@ static void cf_check vmx_set_segment_register(
>>>>        vmx_vmcs_exit(v);
>>>>    }
>>>>    
>>>> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>>>> +static bool domain_exit_uc_mode(struct vcpu *v)
>>>> +{
>>>> +    struct domain *d = v->domain;
>>>> +    struct vcpu *vs;
>>>> +
>>>> +    for_each_vcpu(d, vs)
>>>> +    {
>>>> +        if ( (vs == v) || !vs->is_initialised )
>>>> +            continue;
>>>> +        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
>>>> +             mtrr_pat_not_equal(vs, v) )
>>>> +            return false;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
>>>> +{
>>>> +    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
>>>> +    shadow_blow_tables_per_domain(v->domain);
>>>> +}
>>>
>>> Similarly I wonder whether this function wouldn't better change to taking
>>> struct domain * right away. "v" itself is only ever used to get hold of
>>> its domain. At the call sites this will then make obvious that this is a
>>> domain-wide operation.
>>
>> Agree. but..
>> In this patch I wanted to minimize changes and do modifications step by step.
>>
>> I can add additional patch such as "rework struct domain access in cache disable mode code".
>> Will it work?

I'm planning to resend with:
- incorporating struct domain * as parameter in hvm_set_uc_mode()

>>
>>>
>>>> +static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
>>>> +{
>>>> +    if ( value & X86_CR0_CD )
>>>> +    {
>>>> +        /* Entering no fill cache mode. */
>>>> +        spin_lock(&v->domain->arch.hvm.uc_lock);
>>>> +        v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
>>>> +
>>>> +        if ( !v->domain->arch.hvm.is_in_uc_mode )
>>>> +        {
>>>> +            domain_pause_nosync(v->domain);
>>>> +
>>>> +            /* Flush physical caches. */
>>>> +            flush_all(FLUSH_CACHE_EVICT);
>>>> +            hvm_set_uc_mode(v, true);
>>>> +
>>>> +            domain_unpause(v->domain);
>>>> +        }
>>>> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
>>>> +    }
>>>> +    else if ( !(value & X86_CR0_CD) &&
>>>> +              (v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
>>>> +    {
>>>> +        /* Exit from no fill cache mode. */
>>>> +        spin_lock(&v->domain->arch.hvm.uc_lock);
>>>> +        v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
>>>> +
>>>> +        if ( domain_exit_uc_mode(v) )
>>>> +            hvm_set_uc_mode(v, false);
>>>> +
>>>> +        spin_unlock(&v->domain->arch.hvm.uc_lock);
>>>> +    }
>>>> +}
>>>
>>> This function, in turn, could do with a local struct domain *d.

- incorporating struct domain * as parameter local var

>>>
>>>>    static int cf_check vmx_set_guest_pat(struct vcpu *v, u64 gpat)
>>>>    {
>>>>        if ( !paging_mode_hap(v->domain) ||
>>>
>>> Why did you put the code above this function? It's solely a helper of
>>> vmx_handle_cd(), so would imo best be placed immediately ahead of that one.
>>
>> Right. Hence vmx_x_guest_pat() are also used by vmx_handle_cd() I decided to put before them.
> 
> The main purpose of vmx_set_guest_pat() is, however, its use as a hook function.
> It's merely an optimization that the function is called directly by VMX code.

- moving code before vmx_handle_cd().

> 
>>> Bottom line: The change could go in as is, but imo it would be nice if it
>>> was tidied some while moving.
>>
>> I'd be very much appreciated if this could happen.
> 
> "this" being what out of the two or more possible options? (I take it you mean
> "could go in as is", but that's guesswork.)

I'm not goint to squah rest of the series.

-- 
Best regards,
-grygorii


