Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E266CB31D0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 15:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182961.1505759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTKug-0007Tc-44; Wed, 10 Dec 2025 14:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182961.1505759; Wed, 10 Dec 2025 14:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTKug-0007RB-0n; Wed, 10 Dec 2025 14:11:30 +0000
Received: by outflank-mailman (input) for mailman id 1182961;
 Wed, 10 Dec 2025 14:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyob=6Q=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTKuf-0007R5-1x
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 14:11:29 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d703717-d5d2-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 15:11:27 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB7702.namprd03.prod.outlook.com (2603:10b6:8:1ff::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 14:11:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 14:11:24 +0000
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
X-Inumbo-ID: 1d703717-d5d2-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKDANIqQ28gxSxb9EuLjb4Pe1EkKtCtS+7e0F7PmgZk251nAXQFh/Hw0wpnFt4EQVJq2S0koZtOE+IA8YbjNOgN/IJ8td/Mg4smDc5NyO+K6X8RKXx6kdwp9JGL1JLUgnZYoWGRoB2IF02E1zZp0FzanHJFd/tJ2AU8DrlWa8NjfsR5yZ0BQHGYbUPy5ZZODhRO1OXvtIwPdTZae2ass287wM+at/Szz4xBDh0uvzGcwHC94CzoDRjJjjIBLz8zazWGCUfP2KcRlBH++ZXLcwqtZCG7Z4YClPOMIuv+/WYTKJplWPR++zEiiZizcQyPrJHZez6VUPqeIff+dF/7V/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieVQDxq3ykTC6nVlq4XdavazXhKlRmYDsgQ/M6GyeFA=;
 b=laYgLtnd8E92Z/QilVLArvj4Xv+raSLmylE6j4H1D7U4ocbqQsN6pmsX3+UMe06A33gD041sEIUpOUpMJeEz0nHLNVpSE2n2QHXLMz78au+LJD84zxauD4PgZNjpKNAHuVBl1a9S17CeOE1Tb++ERMnyiWZy+jscqMmgic60KClArR4NksmjejluNcgN0HR3+QGD+avCxlrwVV6omCDt2SaLwc33Sgds6SyHUKXNX+8xIyfJ1CN4E6ir4grHV3WFQaZpu11LjtVZ7BIgFoeNsCMdSLshe9HD3C37+j3Ruu95EwpultQ9J1GNNrjnOkyNZhJbhcUgHRe2Pi3dcsXpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieVQDxq3ykTC6nVlq4XdavazXhKlRmYDsgQ/M6GyeFA=;
 b=dkUJxwHtd5T+Ng8XSsYX6rRLKBTdk37T1XCKGtcdwOyK7DcDXcarcwgg5wIN7ItwPOpUT5o4wZKCCBZUyFP8HIW8YYBINDsA4Tvg0nGXcqtoCeSYfobiX37uJqdv4pgQVMfuSxvzjet+4wS16785lc7nE/eCQ0rR3bfcN7trJ9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ad7daa54-0529-4e14-9eff-32d42a24f9e3@citrix.com>
Date: Wed, 10 Dec 2025 14:11:20 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 6/6] x86/cpufreq: use host CPU policy in HWP driver
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <bacee005-8ba3-468e-8de4-681af1cc4856@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bacee005-8ba3-468e-8de4-681af1cc4856@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0262.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 14272ec2-d065-4d84-0bd3-08de37f60048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1hUVkdxSFBOb1NJTzcxTUpTRXh4NWFNaXN3Um0xL0xmd3FENUxoZ05VZmZk?=
 =?utf-8?B?VkFYbk5zcTlrN3N4STlpQ2Z2V1R3OGRGSzA2WUE1MUpOS2ZPR2daaDBKUVFL?=
 =?utf-8?B?bnBCbEZGbm5uS0VUUU5UbGgyaGhSTi9IYWpvaVpsblNFV3pKZ1MreEJUVnJD?=
 =?utf-8?B?VUlpa1FvTnR5bUs2NVRlNGZuWVRGdXdnSklSY21jTTJDTzRiKzFtVUJkQ29s?=
 =?utf-8?B?ZmlOK293cjlLNjdTam9tWW9kTTFIckY5NzBWUnBORURHTWFQQzR0c2xMR2JC?=
 =?utf-8?B?YVMyS2pHMldBbWpZcFBoNXJKUzdNalNjOWw4WTRPaUtxTDZrTEtTdTV3TlV1?=
 =?utf-8?B?OFJGRG0wQW1rczNnZ2pDbXlVWWgwTzZUbVdFUURORVVtak9iZTBKc1NNdytJ?=
 =?utf-8?B?NzRUTmdQUWxrTFpUcHBkMW5wdFZ4eDQvYWYxVEVNMGJCZmErYWxyRlNCVndH?=
 =?utf-8?B?SldQMjZaTWdISEdhMlZtQWlDa0psakRqdTM3TGZTS2c2MWlDT1VlY1ppODVI?=
 =?utf-8?B?T0VTYUhsZ1VDK0dwYTViaXpoVEp0RUpnak9ubVk0ZHNGN25vK3dFcFYyQ050?=
 =?utf-8?B?Q1N3MEc3K09wNG5BMlBwalpGS0VRbXo5RkNmZjBGMW5ES2ZSL1VXNjZqOHlX?=
 =?utf-8?B?ZHlMYmROSGZ4WDdxc2lSeUNKampjOFlWOUk1SDA1UlFXNHovVisrRTFEdzZF?=
 =?utf-8?B?cUg4Tm5GaWg2YzdMUTNTTnFhQ1pYTUxYaWpQcmE4VEJXOHJuRGs4R25PL3hm?=
 =?utf-8?B?THVUTmEyUXg5ZE9KWDc1RzM0UjZOWEw5WTZ4NmN0Zndtb1RHRzVqeC9HSXhY?=
 =?utf-8?B?SElSdkpzK2lWL09QSEZWSEpHNGc4SkQ4eXpJSmpLbDJrbGVkR1Y0aUJ0Nk9L?=
 =?utf-8?B?T2FFTEU1YkJpRDk0Yzl2WXppWGY4U1NBME9ZY0t1WGZKcklTYjRNM0ZWRjJ3?=
 =?utf-8?B?TjcvNUd3SjdRWWFrSGo5SEtuWlBnWlAwaTNCTXpwK2FGT3dvekhrQlhqT25I?=
 =?utf-8?B?bUczNElmbDBWaXhQQXN0VDNhVFlhM3Rzejk5YngzUlkwQVpQQ2UvYkVINDFr?=
 =?utf-8?B?bWZqbno5VGFiMEV5OGVpZmoySnFXeEVvazYxWDNrQWk2TW5QSHJzY0xuRHYr?=
 =?utf-8?B?MVJDYkV5dmlBdG50MEhmalFIcDVCalVCM3dyeTB3ZWxCQXlaY1ZST3lFRjc3?=
 =?utf-8?B?NmFwMnYzbjV0cTRmTy9zamJITWkyb2lnVFhpcTF2VU1HOTlqV2NIZEdwZ3Iz?=
 =?utf-8?B?aElPTXNZUzVwUjZQMTRpYjlWQnZvQmRVRG92NmdDa0tXRVMzK29mY2lTK1JF?=
 =?utf-8?B?eHZBaEtacnlkREE2RlFmOXE2dGdIYVdsZXNYMURXVFduZVRXQW1zcjZZQmZ2?=
 =?utf-8?B?TFdISVJTSFVQd2EwU1M0RlNENjNMZ0J1SDNlNytIYWNSUSsvZGtxdlJQOG12?=
 =?utf-8?B?ZG1iRlFHVkhhWnZheVZxQkNCZFZhRFYrWWZOL1VqZnhLbUx2cE5rbDUxWWZx?=
 =?utf-8?B?L0hOL0laWXRxL2tnOGt2cDJHYzYwQ0c5SHFSY2xVclo5VUxlNHY0RDF2YU5Z?=
 =?utf-8?B?NUsyeWhWSzBYY2xzcUlQQTVLVHNtbUZ5S2d6SmEyS2RveDE1TFBrN1BlUThk?=
 =?utf-8?B?SmZMbWVpSVhOaWErZGZQL25Ba1d4Y2dnQy9hMWdYSHBnalpTWGM3cHFGZUpy?=
 =?utf-8?B?U2xsQXFlRGs4N2tLUG5BMG1ncXkvUCsyNmxEbDFqcWpKZitHaTllRG1IMjZU?=
 =?utf-8?B?b1Fqb1ovblJYanFZdmg1NEs1YndNVDZPOHhhWHRDcGhnaU5FZkNpOE5kempi?=
 =?utf-8?B?dC9DU0RiL0JOK0ZhR3ZyVXNPSk9xTVB4OVllZXBzSkRWTUtpT3ZWc01QUFVx?=
 =?utf-8?B?MGd6Q1VNS2RwMy92d1lNNHVZRHZHdlA2Y3NXbFFHRUxKWVJSWlg5UTBKQjRB?=
 =?utf-8?Q?mflgltr9kcWkJwOs8Ioa+Mf1Qj7wFPam?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkY1YktUVEpwYnJkbVNTZjZwS3hkeXduM1BQVUt6LzE4WUllSE1DRE02bjZi?=
 =?utf-8?B?cUhrQVNzTVpJV2p1amJOUHdSeU9sb1M2ZlEzREFxSzBwcGtFMTJpNCtna1cz?=
 =?utf-8?B?SEc5VUNiUTlPYkJwWkVpc0JZK1A1S1R4QUxkeUZhTHgyZUFTQjlCY1A2cEZZ?=
 =?utf-8?B?WVFHVHR6d3JVa0N5MVljU2RGTDEzV3pGSncrRWR2c0pIVWNJanpNMXRjcGJy?=
 =?utf-8?B?S0U4aXJFVkpESjA1d1RKbWhudGFobEQ0TDBDNEdYRmtSOUUvd2IzKzlRazh2?=
 =?utf-8?B?NThMamFNS3dYeitCODZtZ2x5TXNQUE5naEg0YnAwVVlHUkpXVjVIdjg0YzRs?=
 =?utf-8?B?WWhsU28zcnl1VWUwN3B3UW45eHJrSkIzVmp3L0xQejJLRGRvMW1ITlZKNUxk?=
 =?utf-8?B?Y3R1NlJ3cnRIdHprcGh1NmthbUpTams1YVhYQ3lLRVJPVFgwZGRpVXFPYmxH?=
 =?utf-8?B?SXZCcWZnV083Mjd4VG1WWnZOL0pvbnR0cnRwNjJtbmk1YkdFSkFXektnSWwv?=
 =?utf-8?B?MUFwVUNQSkdRRmVkSVB0c3ZYQVdITHNiYVhqL29tbmxza2gycDdRN0xsOWRL?=
 =?utf-8?B?TVJrUExZcGszZXFVWmc3dFNZWnVqNFd6MzUvY0srMTYxMDRWOGdjV09ESUMy?=
 =?utf-8?B?SElmcDkwbUxjNFFxdW9vc0hoM05YbnoyUyt4eC9EYXEybFJwUUFvZlNGOGc0?=
 =?utf-8?B?YlNiejRqV1Z2Q3pQZlowdllpNG5STm9kejB1NjlETlIwbllTWVpWUlFFbGpH?=
 =?utf-8?B?dmZOZkwvWmpUdSs3TkVLdzY3ZTF4aEwvdncyMFdnWC85UEhQZC9jbCtLSkQr?=
 =?utf-8?B?T0RqZHJvTnhmMXZNbkNlR3U0bm00cG8yTVV2ck53eGUrY3NTRUFWa1RpbXBy?=
 =?utf-8?B?RWlpdHBPQ3Z2RUlMdTArdUU0SzRSWVc4NHZ5bGtLUTNLWmRXeWlkWFFWaVFU?=
 =?utf-8?B?WDUxcldhQzN5MFpDSVZUSFV0RjJwcytMcWl6ZUVzKzZDYUtHSlFaNVFmOTBE?=
 =?utf-8?B?UVBCSzRTdU41YU0xMXBvL2hJcktMNytLcU5pVzcxYWdqekhRM0FxNkhKVEVE?=
 =?utf-8?B?R1g4SWFqQW9DZTZJVmdZdVY4NDFucEttSVlBYnVNQ0VGc1FjK2ZsY3F2TFA3?=
 =?utf-8?B?aUYreEx2RmIwNjNKU2JvcFdVeXRDSTUwdDBqRVNPRUljaytOVk1HcmFHcEhs?=
 =?utf-8?B?R3RKeVZGMyswVTd5VHdrc21heHQvWk4xYzJhVjYyaWdueDdTU3VDcjA0ZTRZ?=
 =?utf-8?B?WThnNlJPUjljTEFhTjd0clZSMFd5WWt6b1RPUWlDTnZJMFRlS255RVovY3gr?=
 =?utf-8?B?SmRYdnZTRVpXcFJuaHk5Wi9LN3hjNHU4WUYrY21OdFJVL21rVElYUHZlcW43?=
 =?utf-8?B?SmtlaDhIZU9xN29MaE9ZSGd6Vm1oemFqcUR5MFNWYkErZW91WHRHelIxUU9n?=
 =?utf-8?B?V1dZUkdrbVJmQ1dYVFYrdmtqTWRqKzhEVVpuWmMwUWZqbksrTUlPbnF5eWtD?=
 =?utf-8?B?NG14MnVEMFhvT01CdG93Q2hWcTFQb3dIYUZwU2hoenZHS3B4ektNMWczTFM0?=
 =?utf-8?B?dDZMRVZyY0NoSWpJM1JPSU5TNDc4ZzErdjZkR3lhL0svZHRjVzdZdHlyeGMw?=
 =?utf-8?B?M3lJNEU4ZmxOTjdEaHNqbHZSQmZNaTBuV1h1SWlTSnZEMHNxS0pTeHJ6ZnBE?=
 =?utf-8?B?cjRpdnl1MjAyRUQ4WWlvdXVmdTdWdEVLakM5VDQza2tyMkhDTUtyS0hTVng1?=
 =?utf-8?B?ZWdFNE03T0c3ZGp5ZjlvNlJoM3RpTktBTVpTbjYvSDl2amdYdFpMdTYyZHpT?=
 =?utf-8?B?NExJNUtqTG1GRzNtM3ArZEZwaGlRVUpwai9JR05NekZ3L3pFcHBHSC96dlVu?=
 =?utf-8?B?VHpFV28ycDZvQ0hrWkwxVE1vY2xpSnVlcHhRTTBUVFNiZTNOVFdhMFlhb29B?=
 =?utf-8?B?N1hXWFFhVy9NNTMyLzhSczhqd3ptZFByVWpSUk5LL21VSU1YUzQ1NnhQeTNE?=
 =?utf-8?B?ZnlmUjNrNFJBTWZydUVzMFdlMG42MnFMdUdpeXJkdWszRzE5blV1SkxoUCsw?=
 =?utf-8?B?Ky9lamV5MzU3UzNKOWh4L2FwUUd5bkpiRGVmTHdCTlViS1M5Q3N1S21ybVZF?=
 =?utf-8?B?UTNTNTNpT1V5V0llcmpxT1ZpVStWTnY4RFZhdGpKd2Y3VFhRbVE5Tk1DY0NL?=
 =?utf-8?B?UWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14272ec2-d065-4d84-0bd3-08de37f60048
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 14:11:23.9993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtgX1F2Fq5aa9TwYb/e5M3EZKh970U4HoyMu/wRXr/bYaaQBT4scRQRkXyh9ExaOVGGkCvHm/8L7y2VV7oeSKP6yBzJci3437AjWqeVmm1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7702

On 24/11/2025 12:25 pm, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time. This way two of the
> static booleans can also go away.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Introduce cpu_has_*.
>
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -18,9 +18,6 @@
>  
>  static bool __ro_after_init hwp_in_use;
>  
> -static bool __ro_after_init feature_hwp_notification;
> -static bool __ro_after_init feature_hwp_activity_window;
> -
>  static bool __read_mostly feature_hdc;
>  
>  static bool __ro_after_init opt_cpufreq_hdc = true;
> @@ -165,8 +162,6 @@ bool hwp_active(void)
>  
>  static bool __init hwp_available(void)
>  {
> -    unsigned int eax;
> -
>      if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
>      {
>          hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
> @@ -183,29 +178,22 @@ static bool __init hwp_available(void)
>          return false;
>      }
>  
> -    eax = cpuid_eax(CPUID_PM_LEAF);
> -
>      hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
> -                !!(eax & CPUID6_EAX_HWP),
> -                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
> -                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
> -                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE),
> -                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
> -                !!(eax & CPUID6_EAX_HWP_PECI));
> +                cpu_has_hwp, cpu_has_hwp_notification,
> +                cpu_has_hwp_activity_window, cpu_has_hwp_epp,
> +                cpu_has_hwp_plr, cpu_has_hwp_peci);
>  
> -    if ( !(eax & CPUID6_EAX_HWP) )
> +    if ( !cpu_has_hwp )
>          return false;
>  
> -    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
> +    if ( !cpu_has_hwp_epp )
>      {
>          hwp_verbose("disabled: No energy/performance preference available");
>  
>          return false;
>      }
>  
> -    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
> -    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
> -    feature_hdc                 = eax & CPUID6_EAX_HDC;
> +    feature_hdc = cpu_has_hdc;
>  
>      hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
>                  feature_hdc ? "" : "not ",
> @@ -213,7 +201,7 @@ static bool __init hwp_available(void)
>                              : "");
>  
>      hwp_verbose("HW_FEEDBACK %ssupported\n",
> -                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
> +                cpu_has_hw_feedback ? "" : "not ");
>  
>      hwp_in_use = true;
>  
> @@ -226,7 +214,8 @@ static int cf_check hwp_cpufreq_verify(s
>  {
>      struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
>  
> -    if ( !feature_hwp_activity_window && data->activity_window )
> +    if ( !cpu_has_hwp_activity_window &&
> +         data->activity_window )
>      {
>          hwp_verbose("HWP activity window not supported\n");
>  
> @@ -268,7 +257,7 @@ static int cf_check hwp_cpufreq_target(s
>      hwp_req.max_perf = data->maximum;
>      hwp_req.desired = data->desired;
>      hwp_req.energy_perf = data->energy_perf;
> -    if ( feature_hwp_activity_window )
> +    if ( cpu_has_hwp_activity_window )
>          hwp_req.activity_window = data->activity_window;
>  
>      if ( hwp_req.raw == data->curr_req.raw )
> @@ -365,7 +354,7 @@ static void cf_check hwp_init_msrs(void
>      }
>  
>      /* Ensure we don't generate interrupts */
> -    if ( feature_hwp_notification )
> +    if ( cpu_has_hwp_notification )
>          wrmsr_safe(MSR_HWP_INTERRUPT, 0);
>  
>      if ( !(val & PM_ENABLE_HWP_ENABLE) )
> @@ -537,7 +526,8 @@ int get_hwp_para(unsigned int cpu,
>          return -ENODATA;
>  
>      cppc_para->features         =
> -        (feature_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
> +        (cpu_has_hwp_activity_window
> +         ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
>      cppc_para->lowest           = data->hw.lowest;
>      cppc_para->lowest_nonlinear = data->hw.most_efficient;
>      cppc_para->nominal          = data->hw.guaranteed;
> @@ -585,7 +575,7 @@ int set_hwp_para(struct cpufreq_policy *
>  
>      /* Clear out activity window if lacking HW supported. */
>      if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> -         !feature_hwp_activity_window )
> +         !cpu_has_hwp_activity_window )
>      {
>          set_cppc->set_params &= ~XEN_SYSCTL_CPPC_SET_ACT_WINDOW;
>          cleared_act_window = true;
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -115,14 +115,6 @@ static inline bool boot_cpu_has(unsigned
>  }
>  
>  #define CPUID_PM_LEAF                                6
> -#define CPUID6_EAX_HWP                               BIT(7, U)
> -#define CPUID6_EAX_HWP_NOTIFICATION                  BIT(8, U)
> -#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               BIT(9, U)
> -#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE BIT(10, U)
> -#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         BIT(11, U)
> -#define CPUID6_EAX_HDC                               BIT(13, U)
> -#define CPUID6_EAX_HWP_PECI                          BIT(16, U)
> -#define CPUID6_EAX_HW_FEEDBACK                       BIT(19, U)
>  
>  /* CPUID level 0x00000001.edx */
>  #define cpu_has_fpu             1
> @@ -179,6 +171,14 @@ static inline bool boot_cpu_has(unsigned
>  /* CPUID level 0x00000006.eax */
>  #define cpu_has_turbo           host_cpu_policy.basic.turbo
>  #define cpu_has_arat            host_cpu_policy.basic.arat
> +#define cpu_has_hwp             host_cpu_policy.basic.hwp
> +#define cpu_has_hwp_notification host_cpu_policy.basic.hwp_notification
> +#define cpu_has_hwp_activity_window host_cpu_policy.basic.hwp_activity_window
> +#define cpu_has_hwp_epp        host_cpu_policy.basic.hwp_epp
> +#define cpu_has_hwp_plr        host_cpu_policy.basic.hwp_plr
> +#define cpu_has_hdc            host_cpu_policy.basic.hdc
> +#define cpu_has_hwp_peci       host_cpu_policy.basic.hwp_peci
> +#define cpu_has_hw_feedback    host_cpu_policy.basic.hw_feedback
>  

The indentation of these final 5 is one-too-few spaces.

I can't help but feel that notification could be shortened to notify. 
Except upon looking in the SDM, it's named HWP_INTERRUPT because it
enumerates MSR_HWP_INTERRUPT.

Similarly, HWP_PLR is really HWP_REQUEST_PKG because it enumerates
MSR_HWP_REQUEST_PKG.

ACTIVITY_WINDOW and EPP are wonky because they're out of order WRT
PLR/REQUEST_PKG.  It clearly means they all came in together, but have
SKU controls.

But I digress.  ACTIVITY_WINDOW can probably be shortened to just
WINDOW, and that fixes the two egregiously long ones.

~Andrew

