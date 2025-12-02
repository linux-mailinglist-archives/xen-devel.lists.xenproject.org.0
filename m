Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51459C9B907
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 14:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176187.1500709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQQF3-00046c-8r; Tue, 02 Dec 2025 13:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176187.1500709; Tue, 02 Dec 2025 13:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQQF3-00044F-64; Tue, 02 Dec 2025 13:16:29 +0000
Received: by outflank-mailman (input) for mailman id 1176187;
 Tue, 02 Dec 2025 13:16:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YqM6=6I=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vQQF1-000449-M2
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 13:16:27 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 174e72dd-cf81-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 14:16:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7155.namprd03.prod.outlook.com (2603:10b6:806:359::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 13:16:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 13:16:16 +0000
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
X-Inumbo-ID: 174e72dd-cf81-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McADmejGljUx/jZ+vNblUVqz6eClilnfXTKDrs4R0e91PAPxjpw1UW3S6d6AAnQusPtlwQh10ky6P5CRcXv1nh5hIELywjvoJO5/fmHV2frBjfuVXecwkw+JVXr3t8pehwqwrgWsMRnJ0DpKJWCCNcPw4MsyzVSRSMkU6CAJW9mzthr0HE/x8C1a6PbgBQIATGXKL8/onG1suJAxs2XRa38bhwOT9kytY00SHHmpuZEdz+hPJ6k6vL2xdzerTxANak6jL+kqKf5IjkyVXAzYLxEj2bgtub5i+G+hI+q2u6vU3I9S5TcOF20SqC2v2C/FXfP8HvScjljMLHT8xLzWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK7yXRp7vkzg0WUZLiNa36Oa32vH2foT2YQxDmSDsVc=;
 b=bwPB62P8H5LI1yPryNNnT/qWLwtZnB6O6rc84HaYahgx8v0cFazoGGlU4GlnmgrU1xE1fA0eO8KhCuEQPYTs0KqUAIiN79DEYUFhidEhAI9WM1ZViJv1bIFhXwG/pdx9YUll3U7i18nH+0sDemyhRdguSEdTuNpzOm5HlMrpw7lUWdP7qqSxkl0ZHMekB9uXIQP6Zyc/ZcEqA0ngsTkSnljix/oVoOE1P5LQAPROQZOV3GasRKKQ4G5AhB3B7G7lETU8eiWFzABBfjXW9BAly+5FPEuUl/fg170mIPBerrvmswvaoibQbL1V9IRtvUI1gX0QFih8wF7B3mcBIFOYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK7yXRp7vkzg0WUZLiNa36Oa32vH2foT2YQxDmSDsVc=;
 b=AWcwGqSQ4cU1gxhsJ7MaQejhT7cbf7fnVY2/G1QPiOYyxiOp87aI+o9T1YGUfx0dq9uUs/q4cr1W7WW7nC6m5PqIVgecbR09jwSL2VWCBUVr/1iDLRjwYlaOIovU9qq15xD3VSv/T9xDCXoMlx2dN27k/KpjfTFmcP0YWpBY+Uo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <43d27d63-40e3-422f-b902-6b8203c18e98@citrix.com>
Date: Tue, 2 Dec 2025 13:16:13 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hvm: Unilaterally inject #UD for unknown VMExits
To: Jan Beulich <jbeulich@suse.com>
References: <20251128174735.1238055-1-andrew.cooper3@citrix.com>
 <796dccdb-0cc4-4904-b776-d651ebb012c2@suse.com>
 <331118cc-9c2d-49dc-aa5c-b6cd0d4e6021@citrix.com>
 <76873588-cb85-447a-a59f-392b05327cdb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <76873588-cb85-447a-a59f-392b05327cdb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0149.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: e00f7df3-8131-4ff8-6894-08de31a4f93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVdsd0JaYU01TXo2QUxNYUdwN00rN1ZlQ0wrb1d1U1FCREJ3Q0VBYWIySTV2?=
 =?utf-8?B?NnFPZHVvOGJmWmpDR1JReGdncGt0UlQ1S3Fkb216R3YwUks2ZTYxUmFBMWJl?=
 =?utf-8?B?aG9rVUdIaG8vL2RtNEh0V0RlUUFXN3NFLzZVYlBRUHRXWkljNHR5ZWl6RGM4?=
 =?utf-8?B?ckJSVjNtcXR6TEh0YTNOUHBkSnhnRW0vNjRkcHF4TmxJekhobmJuRGpPSGNF?=
 =?utf-8?B?NW94cjN1YVNqQlJYOUgyeU1UNCtDdys0WXMrRk93RjZGS1V6ZXp2Vi9VbU5M?=
 =?utf-8?B?NmNhUHhxTk13YkZzTlBQYlZwSW9vNDhSOGFTWFVBWE5tMmhSRndGKzdLaTRZ?=
 =?utf-8?B?TDlSaGhtdVM1OWpkeGZRdDNlVjE4RUxoNExoUnJqRDBFRS9iWmI4c3JmUXhO?=
 =?utf-8?B?SC94YlRlREFCZHJQdjJRM2xrL0taYkdyL2xVR01GcFJVRkRVY0kxaitVbXp0?=
 =?utf-8?B?SjBESW5JMUpvakgzUnNtcEJWSUtQaWV5bkl2T1R6NmVsYmE2WGhGQmFhTXE5?=
 =?utf-8?B?ZnFoV0tuSUZvWWRPUVFML3FXNUZ1V1ljWHJGQ2g3eG1qYUZNa3hYOU5DTjd1?=
 =?utf-8?B?bjVtYy9UYUpKazkxZkk5ckYrMVRhZU01OU5DN3F3aGplYmNWOXVHSXhOc2Nx?=
 =?utf-8?B?M0wwcE5lRGxCYW5zeDdEUEhyZDg2VE9JejBPZWQybTk5Zm11N0s2R2NjS1VC?=
 =?utf-8?B?dU1vVTBWbHZLNkVQS1djOStvUFBPOGtJK1J1ZHBvVnpHeEpOQUM5TG4wSEVO?=
 =?utf-8?B?cWJIWHhlTU5OTnZRZ1Y0K0U0bDBUQ1RTenU4Z1B3dmg3eVViWXovNFFHUnBG?=
 =?utf-8?B?ajMrRlNqQWROTnZQQ1JiOHBWZFNSWUNzaU5MaDJGYjIrUmVYajBrQnlBc1Vp?=
 =?utf-8?B?anBQYVo1S2R5MEhZRVhZK1hIc0JSdWJCVEk5aHFZVEJlM3Y3ZXdTNE5oZkRU?=
 =?utf-8?B?VmNEZFl3aUNVdFBSUjQ2U3F3Ti9odGw4VXRiK1ltTVkxTlMxLzZpdTg0Vk1C?=
 =?utf-8?B?MDJhUU5IbDZMM2w0RGw0N0wraW5QZXdQYzJ6cFlhdHdnMkJmR201UVFRNGE2?=
 =?utf-8?B?T1BvUlJrZ3I1TW9wRjJUNnZIS3I4QzdXT1ZuSnVOaVhvVk84akN0bGhoMVFY?=
 =?utf-8?B?NVpWMzRuYkwwM0RCNHV0V3VBV1BOZU4wbEVaSlhvTGFNendHK0ZqV0V4bFJz?=
 =?utf-8?B?dUpITUFuM1Z1TC94YmhDTXZEZmcrK0JCL3lwdTE2aWk5SlBTVDFQOFlGWmth?=
 =?utf-8?B?TlVLSk9McHRvMkRUZnV3VU1ZMktIcDkwbUZCS1Nmb0owWnFpTzhLWkY2aVhS?=
 =?utf-8?B?eUtLcTFmaExIVE1EMGs5NEovK1RVcHA0N2lQLysvNXhWbkE0SHpueE9hTnUr?=
 =?utf-8?B?YnFWVno3dVBwVnFpcUtQOVZzR0llZmxXYmlEckpWbUE5anNqRUNsbWUweDMv?=
 =?utf-8?B?QUdSV3BOMWJQV3BTYkloMkhwc1hDbzlWWkxxTDlJZUZ0MkhzbW1nVTBaL20w?=
 =?utf-8?B?VG5rS05oaG52TFY3NUZ3Y0dJaXdUZmlaajZVOXlKbTNVb2FsdHhjcFZBRDkz?=
 =?utf-8?B?cUJyeWpHditLTkR4SXB4bmZDb2phNm52aVJhaDhaSEZneXFMZ1NTU3ZpWDdT?=
 =?utf-8?B?RDFONlZXTWNYazU2YmsxZ205c2JhUWpjR1FaR1p1T3FIWUZ0aU1oaEs2YUgw?=
 =?utf-8?B?UUx3dVhWeGFzcHFBSnBMclEvb2VYTGR3YTB1aDZzc0VqZ3VnQStCZlFjVlV2?=
 =?utf-8?B?OTRIaDBqSEpvR2RwVWRBd0xtL2creGVZSTVYYVJJellvNDlCbnlBZG5wcUVh?=
 =?utf-8?B?QzBlV1d2WlZVSDROSlJIb2pKM09KZHl5SUVPMktYbGkxRXFBVCtHeFFSdFNW?=
 =?utf-8?B?cmJWZXpXcmdTaFFDaENseDc1VjVwUXV2bnRWWHBkTWJkU3BLQ3ZzNmhtdHZn?=
 =?utf-8?Q?BKRlRC3tPKLqVIh+nNHSdFM43C6jx3lc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDdxUjVwVmNJQnE4WGpJbFYyNG8rM0o4TS81M2tZVXo2c2JGZ2x5WkNDdDRN?=
 =?utf-8?B?cGRLUUdGcVZBektSL25PSXBTMEwydU01czQ1QkM4UWsrOVJxeXlLdkNraW9t?=
 =?utf-8?B?aFhqbHpja2dpVjAwQnloTDNsTWNVc1grUStzZkFYLzBvME0rSG55aktGdmV3?=
 =?utf-8?B?MW84NWs2cTJFbmdEVXVDeEcva1pRSW8zWCtIWjdaUmQ1MGFKWThEL1JqcHcr?=
 =?utf-8?B?Njl0Rmlwcy9VcFYyUFp6aHU5bzhmaGFFcTRLbUtRSVVram9hWkUvTGxxY0VJ?=
 =?utf-8?B?VGtkeUtkcnZIR0NycWxtQ0k5c01BVnlaQVluc1RVNFNKZlZlYkN4aGRHbmRp?=
 =?utf-8?B?Um5acm5kZVoyNk9NRHovTlBRTWpjRTR3NWR6ZXRhc0doR1JIeXAxOStidUtE?=
 =?utf-8?B?dnlCZFEwYk9kYXh5M3M0RUV4WTBweXQ3WlRmZlRZOVlJNkZaYlNWZEkwa2ZJ?=
 =?utf-8?B?YkZnMzd6ZVJNNm9xZkM4Y2lxckVveElrUzNJK0x2YkU2bVg3SnlxNlBVbW5B?=
 =?utf-8?B?aldMaHFNdkZ4c3VYYzhZMVhpSFNqUnNVZXFjSUJ1Z1BleE1CTmpwY0RvYzFp?=
 =?utf-8?B?MDhDVjVneUlTSi9oMG1XMERIdDlGQ3NGRzhsZHorOHNTZWlEVmM5UEw5a2Rx?=
 =?utf-8?B?b3p6akhKeFUxdXZwZ2xiUXN4bGRRYmMyNXNSb3Q1bDlnZG9mWTNoRTNMQ2d3?=
 =?utf-8?B?NGRiUFYyNVY0OVM3L3VrYTh0eVlGK0hBZURSbDZDWStDNUQybElBdTVYS0Ev?=
 =?utf-8?B?Q0ZpUmYvTFBiRmt2aXZOYkRxQUVkYnNaQUNXV0ZCOGptL054b2MzaGZ0RzJU?=
 =?utf-8?B?ZWV0QVZxN1VsLzQ5R1NqMVF3SEV4YWtWc0VFQ3FSa1ZEdld0MHlJdE9KRjFI?=
 =?utf-8?B?WHJibmlMTHJ1ZTNESVVNbU1FWkpUSEVLaGVKTkVCTGIwekhGR0tDV3ZNYStv?=
 =?utf-8?B?QWlTM0hQZFRJSlF6aE1LM0ZES2FSc2pvMzFLb2FBKzBpeVJjOTFwK3Q5NDhx?=
 =?utf-8?B?NXNQQkZhM25NbnhiK0hybHdzRUZtNWNmL2hmbDJYcjNEdmtSZjZxUkkwZ2FI?=
 =?utf-8?B?V3hKemVaMDAzUTZ6Uk5TWjJjc2QyeE5OR0J1b21UZ3Nxa2VmcmpXb0VldTlo?=
 =?utf-8?B?ZzZOTGwzbXJGTkNWRWRUOXdzRDgra0pCR3RWZ1Y0bVFQdzk1cUF4bWVRUnpi?=
 =?utf-8?B?ZS9NWDV6cGRsbitTbDVudjB6aHR6Q3JNcGcra0RLNlpjd3k0N3VuR3cxYW9h?=
 =?utf-8?B?TU1WcjBKUkxBNWVhc0ptWTR5Nk51WkxkcVI1eGV5cGRxMlRzTE1xQzVLbXVi?=
 =?utf-8?B?WTN3R2hnenQvY3VPNFpFbDZXdmVCOVp5V2ZIZXdKT3NabVpSd09PUHBRN01C?=
 =?utf-8?B?bDZ4SDZDZjFpSEl6M3NIV1FjN0duZW04Z3E5a3dGS2ZUbnlJb3ZHK3k5M2x3?=
 =?utf-8?B?SWFoTEVEdWs4NXJzbUlNV2RUSzg1SkJzZWZmU0NUWnduTW8yVENKaVR6bXFt?=
 =?utf-8?B?R1RKS2NnWkN2eUdRWm81Q1dFT3dIeW1DaENQTnRZMVhFcXd2VzNGRWtUNXAr?=
 =?utf-8?B?VGdoMmpPcnJaUVVaZ3dFZitxNlNQckQ2Q09JSytJWUdnd282TUVTVlN4b0x4?=
 =?utf-8?B?dnVuaHpVN3NHN2dBbTByaFRXRVJYUS9TK21ROE5Oa3F0aWVwQ2JkaThjR0Ir?=
 =?utf-8?B?NHZFL3RTam5ZUFI5N043L3pTOGx6ZVJQTXNObHRQUlVqL0lvY2NoTktKSjF5?=
 =?utf-8?B?clVxNUlRL3lJdFE0OGdQOHpVUzMwb0JsMWQxc29Mc2pvMGlkQ0tqRHJXOTRo?=
 =?utf-8?B?Ty9nb2ltdlZNNWtxL05teTF1eXZIRkpUYmR5MUFQb0wyMUtHZFMvblhwTWE1?=
 =?utf-8?B?RlJqaWxXazh0cllWaCtFNjc2eEE4VnVMVStJOTFwZkxRak5QVDhoZFZzeE41?=
 =?utf-8?B?aWdST1J2Q3ZqVHVxUWJmYjdjQVN5ZzlIaVNzWHp5YVV1Qmg5UEU0OXVYREdY?=
 =?utf-8?B?SkNjN2FDaDk4NUVMVVVwbnRTa2pPM3NQeTgvR3dLc3lsRkFQV3BLRThMUy85?=
 =?utf-8?B?TERnNHg5Uk5oMjRZcDA4Zkt6bTZkVUJtM1NiQVAwU1dpQjltd3gyQlpiVDVw?=
 =?utf-8?B?Qm51U0dESkZpdkM2UDNPYldiOS81M3FYMnpoL3hYd1MwbkZKYlp4eGZmNktq?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00f7df3-8131-4ff8-6894-08de31a4f93b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 13:16:15.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSvEHlE3z2HVw/JJC+j9TwEegyHTxZeVJt7xgaQ9aPSovSc2oAk0u+ZCB9qrlOtl+wzjnSmi84SPmS6jhehuhVQYOZYTOWDzquyo+JN8RJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7155

On 02/12/2025 8:33 am, Jan Beulich wrote:
> On 01.12.2025 17:36, Andrew Cooper wrote:
>> On 01/12/2025 9:02 am, Jan Beulich wrote:
>>> On 28.11.2025 18:47, Andrew Cooper wrote:
>>>> While we do this for unknown user mode exits, crashing for supervisor mode
>>>> exits is unhelpful.  Intel in particular expect the unknown case to be #UD
>>>> because they do introduce new instructions with new VMEXIT_* codes without
>>>> other enablement controls.  e.g. MSRLIST, USER_MSR, MSR_IMM, but AMD have
>>>> RDPRU and SKINIT as examples too.
>>> USER-MSR has MSR_USER_MSR_CTL, so doesn't fully fit here? (It's still not us
>>> to directly control exposure of the insns, but an OS would need to use the
>>> MSR to do so, and hence we need to properly handle writes to that MSR for
>>> the respective exits to become possible.)
>> Oh yes, and the #GP from failing the MSR_USER_MSR_CTL check take
>> priority over the intercept.
>>
>>> MSRLIST has a dedicated exec control, so whether the exits can occur is
>>> under our control.
>> Ah ok.
>>
>>
>>> RDPRU and SKINIT have dedicated intercepts, without use of which the
>>> respective exit can't occur aiui.
>> Correct, but note how we intercept them unconditionally?
>>
>> MONITOR, MWAIT and SKINIT are for Xen's safety, because otherwise the
>> instructions would execute normally in guest context.
>>
>> RDPRU is to block access to the perf counters, because a guest has no
>> legitimate use for them.
>>
>> There are no enablement controls for these instructions.  They're always
>> guest-available (on capable hardware) if not intercepted.
> For our purposes, the intercept is the enable 

No - very critically not.

If we were to not intercept SKINIT, the guest could INIT the logical
processor (into a weird protected mode, rather than real mode), and
reset the DRTM PCRs in the TPM.

This is an example of a capability which *should* have had an enable
(FamFh Rev F and G and Fam10h Rev B had SVM but not SKINIT) but didn't.

It is always available in guest mode on capable hardware, and Xen *must*
intercept SKINIT to keep control of the system.

The absence of an enable should also have had a CVE but I can't locate one.

It turns out to be the same for MONITOR, which appeared in Fam10h Rev B
and has no enable.

So actually, AMD is full of examples where we ought to have a CPU
support policy...


> (i.e. we disable their use
> by injecting #UD if the intercept triggers). IOW I think those are
> slightly different in any event, in not really being "unknown". I don't
> mind their mentioning, but I think the distinction wants to at least be
> expressed somehow.
>
>>>> @@ -3083,8 +3067,13 @@ void asmlinkage svm_vmexit_handler(void)
>>>>          gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
>>>>                  "exitinfo1 %#"PRIx64", exitinfo2 %#"PRIx64"\n",
>>>>                  exit_reason, vmcb->exitinfo1, vmcb->exitinfo2);
>>>> -    crash_or_fault:
>>>> -        svm_crash_or_fault(v);
>>>> +        fallthrough;
>>>> +    case VMEXIT_MONITOR:
>>>> +    case VMEXIT_MWAIT:
>>>> +    case VMEXIT_SKINIT:
>>>> +    case VMEXIT_RDPRU:
>>>> +    inject_ud:
>>>> +        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>>>>          break;
>>>>      }
>>>>  
>>> Should this be brought more in line with respective VMX code (kept) below,
>>> in never bypassing the gprintk() by any of the case labels? Basically
>>> meaning that the case labels you move could simply be dropped for the time
>>> being (or else, like the INVCPID one visible in context below, would want
>>> re-inserting a few lines earlier).
>> As said, they're all reachable by guests on capable hardware.
>>
>> I could add a /* Not implemented for guests */ if that would make it
>> clearer?
> Yes, ideally with "yet" also added - recall I've been sitting on an RDPRU
> emulator patch, awaiting you to fulfill your promise of sorting the CPUID
> side of things there.
>
>> But, we don't want the printk().  We know the labels are reachable, and
>> #UD is the right action.
> Hmm, yes, with what you have said further up I think I agree. Yet then my
> question goes the other way around: Do we want the log message for the
> (at least) two known exits in VMX, which are grouped with the default:
> label?

The preemption timer and INVPCID?

Those have explicit enables and are either not configured (preemption
timer, and INVPCID with Shadow), or enabled and not intercepted (INVPCID
on capable hardware and with HAP).

Getting the VMExit is either a configuration error in Xen, or a
hardware/VMM violation of the VT-x spec.

I suppose we probably want to make those into explicit domain crashes.

> IOW I'm still puzzled by the asymmetry between SVM and VMX in this regard.

VT-x and SVM are different in almost every regard.  I find it surprising
how well they mange to approximate a working system given the differences.

~Andrew

