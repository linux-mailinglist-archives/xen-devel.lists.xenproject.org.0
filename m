Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sONnLBHyiWnGEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:41:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20691110B08
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:41:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225501.1532018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSRj-0004ex-Ce; Mon, 09 Feb 2026 14:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225501.1532018; Mon, 09 Feb 2026 14:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSRj-0004cN-A0; Mon, 09 Feb 2026 14:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1225501;
 Mon, 09 Feb 2026 14:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJZC=AN=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpSRh-0004cH-Lr
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:41:01 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 590a2291-05c5-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:41:00 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6641.namprd03.prod.outlook.com (2603:10b6:806:1cc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Mon, 9 Feb
 2026 14:40:55 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:40:55 +0000
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
X-Inumbo-ID: 590a2291-05c5-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nnyf2ogBZH3Y7/qcnevx6p9v+z4gWTNF4cgQTfBDrGYB87j13PRXpHRmLrarpnZEvt13Ti/W0RvXkUlea3PYHk2kGJpuBOs10s7Y1Zcxr3LbraHUnA3eh4Yjmr01i+BieGzbpRgywcsv4ydkDikLaPwRcI73I82XEXUwFnVoGT7Wo9ya8CQWqDPXOQ7gdKNu5wl7BLSQZZX+DCv0nEuJpfWiIod5PeCJN5qxZz9h38z8Be9SAvBPQvTWby/jAfVnn1KC8ppPCBxNFZVredA/3WLXRlCeUHok6Z5oYVf0X/kyby/54e1MSdjbJEQPCZrVXolmIz/R8NVvjosdan4qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vnjWHHeT8/l+RzwQ5S+oy92xbLdGrhmy1Q8HLAPSz0=;
 b=rZPtZRoCWFr/GMJW3hYbPp0DdvofySgUMtHjuFm2jk7gRiQmZ+QvPK65tL/jWvs7peJeMUzv4cenVypueqkaRn1WH8esJEOOsxydEHa4VXpbltUPE+dus5+LJqa+rlBbkoPT/8j6Q1ntwilySYle31NQo8znGA4wd3tYzHxpnr4SY0LxaizrWsjVJZlTnTWqXxdi3dJYbDz/yRG3WM3NwvuaYrtTjIoS50rVxoeY3rFlNaXEmcz/HUakbPrpvRa+2xgqkhJEq6R8bP0KUa4MKgfCwnylvD8eyEYv0UzgSQxIG0RlPJ8TkKFR6GvZEt2mLtiFqW9t5lJe75gXDQicgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vnjWHHeT8/l+RzwQ5S+oy92xbLdGrhmy1Q8HLAPSz0=;
 b=qI3iZL9edog19y/R0ur2zFbpUjriJyTNuv/rVMDcdBCBeXspJ2wYDIPvrWyG1sCnxQLHRK+HVa+8CyY8FBplMYaokAqmIen7OcqMC0mbDTCvx72LoPjvsMfi/IRg/uaYC10yI/ggUtTqa2wDG+wsKXlC+eQxQZWTEhtjkIFasNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/hvm: short-circuit HVM shadow guest creation earlier
Date: Mon,  9 Feb 2026 15:40:49 +0100
Message-ID: <20260209144049.86535-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0034.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: d06f133b-5f66-4b91-01f1-08de67e93af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aExTdEZPMjFDdmgyWDF4Rm9SQWJZR1g3TGlyUDUvWjZZOEJib3NJVHdFdDlt?=
 =?utf-8?B?QzdtRGhnV0piWklBVDd2OWVFUlpMRnJ6a0lJMmpwaXc0T0ltVks5TmUva2Np?=
 =?utf-8?B?amZaS093ZnNhaFNKQ3pjTmdrNTFlK1FzdjFFaC9XVklZMEpJQVpWT1pvOG1r?=
 =?utf-8?B?ZGFOU0xYNE5yZFIvL205U084VjdvY0FDRFlTejFvRFk2Z29GcGJjcHBYMkdR?=
 =?utf-8?B?Vml3V3gwRmszcHhRQklseUhVS3FDM3FIcW1IaXVrNjRGVm9nY2VpSERtcFph?=
 =?utf-8?B?OTJzcVV0clFpLzRtMlVBZ2lydTNpclh5clg5TzR0b0lDR0tVTHU5LzBjdDFN?=
 =?utf-8?B?UGxNS3BZUGZ1ZTNyeGN0WFRxL2pPTklZN0NUNHhCY2lYU1EvNGhFZWQ0RzJt?=
 =?utf-8?B?MnZBSlBJQjNLMy85UDlXSUVFd3FESkhrRXpUZ285SlNpUlVsb1V0dFRkaGN3?=
 =?utf-8?B?NGNmb2JKRDFLWjZFSjFqWis2OG92RlZMb1I2ZVZtU081NGx2MUhoRFBaMllE?=
 =?utf-8?B?VXR4TnBGcy9CRmNTS0Fsdm1iUlJUUXNWRXgrdGdtK052ZGpYYWkwTmZKd3JP?=
 =?utf-8?B?dFJUUEZqSkN3Qm9ZMEdPZ1htTnV1enRjcG1zK3RselZOSDl5Vkt2TUN5U1d6?=
 =?utf-8?B?anFvZUJHWEpvWUdUN1BWOTlsTXlVbU9LcC9iVmZQTm1xbjhQWVgzMFozdjZ5?=
 =?utf-8?B?TkQraHpOMzQ0cVllVGZDb3dnYTE0K1ZJcXl4VVVJZ0g5ekFvZTJ3QjBIbkoz?=
 =?utf-8?B?UktLemsyM0pZYk1pSkNkR1ZoOFNscmh3SmtTQjBtR0s3LzhBZklYSXZ6a0pR?=
 =?utf-8?B?bWV5VjJWUmpQaE42cCs2RXJZRmtGbERJOHloZWhJMjAwUnRIRDlTN0U2WE9r?=
 =?utf-8?B?ZFZSOUlxZDdWR3lJQW5kSE03My9jRzR3cysyNmo1dUpUcDJ4cGJXK0Z3Vmg5?=
 =?utf-8?B?K3Vwc0hKSy9Kdm44amQvWUlaMXVscjkvUXNhdC8rUklDNlZwNVJtTFdlSHpE?=
 =?utf-8?B?RDZpWDkvaU8zUzMxTjVKMFpmRHhlcHNyNm95QnJpazdacEVQN2VRU3RhYmlX?=
 =?utf-8?B?RmFtTmxPUFRiQUdoQ2JNMFJwM1doeE91TG1FSXBGemVhK2dMdVJJRnBJVnZ2?=
 =?utf-8?B?NGhCU2ZhVkJBd0hKV0hBenQzS1BWbk40NGRjUFVBdldqWmoxclhKd3IzbTgv?=
 =?utf-8?B?b2VkbGlQY2xVb0pvS2t6K0Rhc0hsVGp0NXF6VmhQWUdUSGtwNk5nQzVNYWo3?=
 =?utf-8?B?cW1wVmFtekJnaUJqSVFuLzhZN3Q5cE5TUEpaSkx6UE5rZFkxSC9Wd0JhZzJj?=
 =?utf-8?B?dEIzblJIZi9Gd1Q3Tnd4emplRE5CL2s0ZWhrdm11SFlGNlYwK0NmNTNtQXdD?=
 =?utf-8?B?NDdpUDJ2SW5Ia2xvRUdPVFV3UGVUV3ozK2MrUjFSczVNM2xVbkgvOTB4YzJ6?=
 =?utf-8?B?am5IbitjYlN5TVJoNU8zVExQU0xkOUQ3MWRocFUrUEE1Yi83Q3VaVjBvVUNI?=
 =?utf-8?B?SW1qR1F4WTVxY0FHcjRveEkvOXdtVVN0a2ZPRkJCNVI4RW5lS2ZUUkNnMnhX?=
 =?utf-8?B?UW1jQzBLS21jNURsWktDOWE4dEdKUW9XcC9KU3M2VVo2VWpTVkFkU0hXUEM3?=
 =?utf-8?B?MlpXT0dVWE1wb2xpNS9lY3ZITjdvdDNuN1N2bzZCUWhrYTN3MmV3ME9Xc3Ft?=
 =?utf-8?B?QlRiTCtTc01SSFMxYm56d2FSeHVscDJhbk4zQ1BXV1dzM1FSSzFJNUxGQjF1?=
 =?utf-8?B?TDJ0UFlPaVBnWDhGMTlkOTRsSGZGV1IwMEIxSTVFSVZrMVVqam4xVDl6bGtm?=
 =?utf-8?B?c1VOM0NUQkhrVE9hd1F1bWZlVS94ajRSTW0zVzYyaWJlQjZRakdrZmhkR1pF?=
 =?utf-8?B?cGZTcCtWUjdwRDlYZGp2OTVBc0dkY0pHblZFZGROeVYyZGFKQzFBWmxGUnpW?=
 =?utf-8?B?RkZzK2xvVHlJczNHQjBZVTlNRjFxQTNnRVlGOWxtL2E5NC9zRXdhbHFBMlk0?=
 =?utf-8?B?OWwzcUNRVHl2eVEreE9uVGVUQTZ6Qk1hUEFJd2NGSzMwS1BzK3VTNHU4bmpt?=
 =?utf-8?B?RHhGUlVHaTNaOWdCM2d5ZlRob1BCdnVvN1VTK0JKSHRjbnowZ25BbXo1ZG14?=
 =?utf-8?Q?B+nM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnBMbFg1c2dOVnZrcjE1MmRaQ0Fob2dRcDFjLzFhUnpENWh1SWRMMnNiR1lE?=
 =?utf-8?B?cURzSjVkaWdSa2ZZSHQweEdmbmNyenR1S3VzUFRVaTRiNm5aZkluVEV6Tjhm?=
 =?utf-8?B?ejU5VHVyT2plL3NsWVJxRXlMVUxvbHhock1qZlJCZXVRSlRrbTlncFpnbUVX?=
 =?utf-8?B?V3dvcHhkNG0rS2R1NjB4Um04ZUkvY212OXJDS3VnekZaSFYyUTE2ZEtMNnFa?=
 =?utf-8?B?L212TzZFVHdLNzFsT3R4WEVQRnVNQTZqOWNIc2hacmQyZXJxb3ZjN01BeGp6?=
 =?utf-8?B?S0QzTDJxS3d0cGtnUXdRUHBYNzJiVEhOU1BPQmdUSzJoM0ZlM3BmMEhwb1Vi?=
 =?utf-8?B?QWg4M05oemZYbGZMeGsyOTNmVmx0N3JzRUk1VWFEQTZoQ2lrZjhvT1JoQUgx?=
 =?utf-8?B?aXdiakp6VnBjZEh2dFAwWG9IR1h3QjVsYWRmaWNhZlB4aklxSnRtWWx2Yk9w?=
 =?utf-8?B?bW55clloQ05mT1U1WldBMlZuZitZbHRCaUtIVUo2clgzSk9kVHk2ekp4SzRl?=
 =?utf-8?B?SUI4dUEwbkZwYWFFSWZheGRFSkM0OVlNN1RncVJrc0Q0M0pSWEs4aG1LMFFh?=
 =?utf-8?B?RXFrZVljNTJSRVNrdlpTVnRmNG0ydUdUWkJjNkNVSjZSQ2hyNGg4UVRmcDMr?=
 =?utf-8?B?U3R5dC9rb1VFOUtkdEtCZVFiaVRXRGhZclFhdTUvNGtmNlB6NXNnUE1qeHJG?=
 =?utf-8?B?bUNmSE1LRFRkQmFUZGJ2N3VXQ1hmZENvaHliNnZYaVNKd0F4QmxFWlYyUjlq?=
 =?utf-8?B?WEVKanFtNVZhK2Z6SHgrMlJNY1lxcElpYkZrN2U0WWdIZ3BVNjZYbXlpbFJz?=
 =?utf-8?B?MENuaEhUczhHa0JqUGZLLy9TZXl6R041TVdKeDJEVmxLSlVPU2hmUmcycUVG?=
 =?utf-8?B?eXMzS3E3b09oMnZaUkRsN3c4N2owVS9XQkRBQis2ODJON1hXaUhBajVWOGNj?=
 =?utf-8?B?L05jY3BlcStiYVFjeHcrcmhLQlYyUjVna2dBNEpHeGpyWVc2cUlVNlh2WmZo?=
 =?utf-8?B?UTNsMWFzdzYzb3hWUGx4cTFJMlUwRzQ4VnF5WUpyakhTWlFxdm43cTcyeHlk?=
 =?utf-8?B?VjEzMStObDJLNFRkaVpBMHRuRFB6WmZQRzdoamU1VlJJZHo2NGx5SGlWVllR?=
 =?utf-8?B?UUFpY1Fac0xOd0ROZWJUOHpQa0JBbWhDWXNialFuYzZ2dCt0NjdUa0E4TDJa?=
 =?utf-8?B?UHpIL1FEcXdrdkhNc1hseUxTcXFRZEptOXBXTFNFc1RwdlpzK1A1dnFqZDFQ?=
 =?utf-8?B?cDB5eDBPVThiTnp3VHRFcElkOTNlVlM5RkFSNks0L0pRd0poWG9FTXQvQk5Q?=
 =?utf-8?B?UjlhU0RwWTVXaDFtWGJzd2hTMzN1ejBmMklxMk45MGxpZzJJTENHZHB4bU9G?=
 =?utf-8?B?bFBCVjUrTG9RR0dGZ0d0bUY5MWlzT0NJMUh6bXZBNmZaZko3U3V2Y25mNzFT?=
 =?utf-8?B?Umx6NTJtYU1DcFV6RWxPL1FXYXFoZHhEZlJVSFA5N1lwaVdnNmpLZEgrdWhT?=
 =?utf-8?B?WHNnb1J2VEwzQjlnWEVxcGRxem1KQVRqd1BNZ21hOWJGUDJqOElvZDNNaXB0?=
 =?utf-8?B?NmYxcEdBL2d6elpOZDBXN043YWp4d252aHNqRE9xT2Z5N0c5aHhUWGYydVV1?=
 =?utf-8?B?RlFDUG5uNXg4dVZLcXlFQW1rcDFmakxRU2J4cWphcmluTHBLZ1EwQWRKTzdx?=
 =?utf-8?B?MnB4dC84OW9Ka0lXaThDZEV2NjhnRnBmQ2R2b0s1c1ZnOGxYbEFBZHJ3RGg4?=
 =?utf-8?B?V1NGbHJVeDNEWWRxc2VwWllUcnBtakx6UjZGdVFBYmtqcHU0K0J0Wnh1Mk05?=
 =?utf-8?B?M2NVY1h6NjFiYnU0UWRsU0NpdGpTSGp2Z3BTSmZVcEwxZjJmNDFZZ1RBSlh0?=
 =?utf-8?B?TTFObm9LcmpMdmNRcVY2TTBzcURWdVRiYXVqWmpIMnUwU1IwQlg5NlN2MDd6?=
 =?utf-8?B?UzlqOTZ1WGtzT0U2ekUrdXBJZUlvN2xuMmpJbjAwTTBQTnYwS0VBREloTDFz?=
 =?utf-8?B?RFA1b1IyV0Y3dnlPSXc1eG5XaGtNOE9HR2NiMmlvMG9BK1haazF4cXAxQkFM?=
 =?utf-8?B?OEtjSmF1Mnd2VXExT29RRm5HZGE5cTZxSytYV2RueDVmL2NpZ3p6RUQ5T2FZ?=
 =?utf-8?B?WHVvcFlaL3hHSnVISHhoWXM0dFIydGhicmN0SWZJLy9ScWZTMUhWRkhoODc4?=
 =?utf-8?B?YlQ4TFVuYUdNOWtPWHA2OW9zbkhWSFB3bjNPREtYc0hkbDVXZkJadzZCbWlz?=
 =?utf-8?B?cFY0MEN6eU1ZU00zb0Fub3V3azlXMGtCd3BaZXlzdkh5R3NubjFtMStkb3pC?=
 =?utf-8?B?QVU1dTVveVRaSE1QKzRIZW05WTB3L0V2QlFmV0hsSGJJeUZlQU1ldz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d06f133b-5f66-4b91-01f1-08de67e93af0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:40:54.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dE+mzXXY63wYduUxX4UPoT2Fg3MrfVgIiRNF81n//5Fr1jC/+hLbu32tV6VF9nuA3yMo8oRowg+ufw9HQb/fEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6641
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 20691110B08
X-Rspamd-Action: no action

If shadow paging has been compiled out short circuit the creation of HVM
guests that attempt to use shadow paging at arch_sanitise_domain_config().
There's no need to further build the domain when creation is doomed to fail
later on.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8b2f33f1a06c..8eb1509782ef 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -627,6 +627,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( hvm && !hap && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
+    {
+        dprintk(XENLOG_INFO, "Shadow paging requested but not available\n");
+        return -EINVAL;
+    }
+
     if ( !hvm )
         /*
          * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear
-- 
2.51.0


