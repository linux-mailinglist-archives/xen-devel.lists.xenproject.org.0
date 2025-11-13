Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09620C59CF9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 20:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162088.1489873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJdCH-0004de-Q4; Thu, 13 Nov 2025 19:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162088.1489873; Thu, 13 Nov 2025 19:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJdCH-0004b1-MO; Thu, 13 Nov 2025 19:41:33 +0000
Received: by outflank-mailman (input) for mailman id 1162088;
 Thu, 13 Nov 2025 19:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJdCF-0004as-Ln
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 19:41:31 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be1af50e-c0c8-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 20:41:27 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6990.namprd03.prod.outlook.com (2603:10b6:303:1b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:41:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 19:41:23 +0000
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
X-Inumbo-ID: be1af50e-c0c8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoxYjJhgMOvLCVOgLOlboHqT/bAdefHvU+FWT6IExYkwE40zty85sJaGWpD5E70P+4jQV1R8U9xdTz8bdbETGOu1D0v1wvxAvsyyF7H6YuIetDA+xId5jZJU+CPXSMQJnKy3nEWAyVG0g+TjIMQrXYZ0xhi8gUtQMDu/LmACzvYskBVNp6T1FUjjpsu9dNwoxYf5n3ssCxyVcoUaIy4XlV1kfxpM8AEHbduwZFGtfMzKEIVJeBHWC75+Pw+6SeEyYYhqMwgtfBEXCV6F2VrvsHiAKKRBK4fPXR36FKUTHnVYvRjCcCo9/v82wvWQl4P0B0aqxwtzqCfATTEo5p5bvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9jckqquql43oSFg1P7lULuQw6lRNfcvKyEb4bMI478=;
 b=SfWCVcPopyHMonbl50yCBKlzN3JCLTHAXAidkSp51bc8UtdXI17kx3pCmtZrSE2j8qVZ0Y+WAYUXUhV05TIXKsMPdaaQAIYo6IPNxrV5HLR9hZ6oPzcJyfsU4UEXzbIjhcU7EbTQoT6GmEfM+LpPx+ECJuNopFYROTPGpogXDprOlb4hNhrwK57HidaEr0aiaiVQGaT2W307Vy7GVf0IOvO5JBDaIhABzp5jBBPFAlgMJEnBuuW5ltUv5rCrVPPJ8bD8DSIQOk4A5IPM9GjY9yLhqtmtUqYy3aRQ+IiJS88y8Nu3oN4WLtrbphjTDT6d/21HYQ1LfE08VWsTZr/gcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9jckqquql43oSFg1P7lULuQw6lRNfcvKyEb4bMI478=;
 b=eNhmNcO8fYbiOXs/zEa63KoCddNxr7+3FHOYO4DR05vgRKpWdqAIQ7e0dfsAtMCLCY0H1C/IYLfEpN++iIM53hYf1q8hJoVlzw3xZYfS4YzfXVY/gvx8VvqvsjrlWTZz24a1GqtEPE47uGLt0MNnuONRUGLPS6DgiQgHO1GMx8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a3bbc769-7d37-413a-a06b-9b88bf77e753@citrix.com>
Date: Thu, 13 Nov 2025 19:41:20 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] build: add new make pattern for making file from
 file.src
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-3-jgross@suse.com>
 <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f5934f86-7a93-4184-a807-86fc6e18157a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: b40019ae-9dd1-483f-3eb0-08de22eca074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVp2NW4wanNMMmJVQ0trc3MraG1lOEFWdzFETUdIcGswMlZMbkgvOVF5RllO?=
 =?utf-8?B?OGw0dzAxckdDclRPLzRCTVRiS1N0ci9TbHJOampERmZLeERabnhPakNYNTNm?=
 =?utf-8?B?b1JaNjdkcFN6cmVkMnNORVFJQi9RY0FTK2x4eFM5N3h1OVlwK1VyMVhmVWU0?=
 =?utf-8?B?VVdaamhPVktWSWljWWNlTUlxMXZENFV5Q3hjbVA3OEV2QzZSVTRNeUVzR3NC?=
 =?utf-8?B?MEhDQURGK0l4dEhXM1hHcTBsSGFyK3ZmanMrUnZ0REV6K0p3L0xuREJ4TmxJ?=
 =?utf-8?B?NmhwS0U0WVRMRzA2ZE1PcDZqWUswRzNvQTczR0pHODNyemo0cEdJVTFXTkVT?=
 =?utf-8?B?bmE5Sk03NS9oSHhaRkJUbCt5c1c5WU5FZlNnWVM1V0UxanJ3Z3hWN2lDVmRn?=
 =?utf-8?B?Nit1bkx1OFJlUExZQmV5bmJoUVpXcExFMWZtUDRRSlBaREdJcEFKSnZCb0xD?=
 =?utf-8?B?bkhJM2wxa0hCZEQ0clpYakoyVjMzNmdtdTJETFBXZTF0ajloV1hwaVZrYW4r?=
 =?utf-8?B?RjFYN3FzSUFrU3FURkNZZWdGRHlJcXBBWWVSUXF0VHFwVkhsS2l5SDN1RCsx?=
 =?utf-8?B?cEpJNk1Hd0hMWFJpTloxTStyaHVEdkt4UGRFRHNQUXpQdmV2S0duYnBXL200?=
 =?utf-8?B?TlUyTlZ3ZHhFeFN1eWxsQTkycDFIUU5nNmNOUlVCUEQwYytsckxDdWlrRjdX?=
 =?utf-8?B?MDlHMktUeVdSSTVQeFpXbWUxclNxRjBCalc0OUQxYVRLYkFjZGlpV2FpWVFm?=
 =?utf-8?B?N1BsTmd6Y1B0R05CbEtiZ1FZeDJRS0ZKdUpwQnZhbXNlMHc2MEJ1bFduemJB?=
 =?utf-8?B?SkhpdkhHY0ZDK1ByUUlYcE8xa1RCZlFTTzJrYkpkZUFYeHpISkJScHpudURL?=
 =?utf-8?B?bVhGNVJ4MDhLNUlnaURMaDM3UTdpVlNtUXhBSjNCc0xQNkNmSk1iMFY4Mk9D?=
 =?utf-8?B?cXNmQUpyUFc1eXQxc3BGSURlUFM5eldCK1M4WHFRWnZ4WXlrZVVhQ3NobkVa?=
 =?utf-8?B?T3dMdUdRZTYxNXhUb3EvT3lPOVVjWXYxRlErZHVEN0NuUXJMSkhnV3kvTFFQ?=
 =?utf-8?B?U3BJZWo4RThsTGdzSlVnRm9MMEphVGRQc1hsMGFxdEcyNVJ0NmhlQ0orWklx?=
 =?utf-8?B?cWRFZ054Tml6L2JXRWZ5bGVVa1RoNkNiTVlUQUtTL0txa1ZucUZIMEdBaDk3?=
 =?utf-8?B?RVpVN3lLSUM0NHM1SDVadE5nTWNQZW5nU2RWQzFRYTRLWnlhak5pWmpIbVBp?=
 =?utf-8?B?aVlSVHJKYlF4eEpqSm1nVmZGVlR5bnZhL1BPZk9vQ3hqUHEvTGRnRTV5WEdJ?=
 =?utf-8?B?aDgzZ3hzOFVaczFtalo3b1l2d29MSTRkVEZVMTY3cDJSOUQyTGFtUVZaU2Vl?=
 =?utf-8?B?WGViQ21hOS83Q3k2NGpaTlBxa29qelJqd3kvUThmZDcrd3hHbCs5R1dNUEx4?=
 =?utf-8?B?U3N3UFZFQS96VkF2OEJvN2JaOEorQjJPcmx4clRlQ0NpU21rRHlEeTdXRkNs?=
 =?utf-8?B?azlONmt0bFF1L25YQXhmNllteGtoRDdhNHZaRFhPaUNkS1ZVQU9vazM1bys2?=
 =?utf-8?B?KzRqbDVXT2lYcWd3bU4zNWVrVkZ6OHJVM2I3ellkWmp2a2pvRmpBTXZKWHdy?=
 =?utf-8?B?Y3lkemM0VnM0SmhJaHNkTWxobjlxS3pRNFJRVDhWeVc1VXpqWWVUZDI1ZGpr?=
 =?utf-8?B?b3hFRHBDSmNjelBBQ0pXL2NPTjVUOW1NVVZKd3ZoUkF1VVIxRUoxN3hYR051?=
 =?utf-8?B?cnNua3V5cjlqTnlsRk1Ub1Exd2VTcDJVSm1tUnJISkQ2OVZJSjNjaVdncjBS?=
 =?utf-8?B?N3RsWkppSkw5SDloWGVPRDA4UHpWK1o1VmowSDhaODhpNWNUOXRiaVRXNDFX?=
 =?utf-8?B?bkIzVTZUUzg5SkVSMFplbzd1M2lpTGpITU8yMklmRmVCditsWUJuZy8yeFlJ?=
 =?utf-8?Q?R/E5V1raQ6kWCJLVHsP8aw2eO+sn64tT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STlMNHV5R0dCS096L2V6U1FzZ3IxQVArNm9BbHp3SEorQ0ZPWnFoalR1aUZU?=
 =?utf-8?B?RktvVFRJdm0rK3RvbGJBem8rVVpwYXppNFBnVy9vaWpBUURjTmhJRTJ6L3hX?=
 =?utf-8?B?THQ4VGVJYnI2R09iTWp5cmRqc2I5OFA2dTRSNWxsR013ZDVBMkt5YWhweWFP?=
 =?utf-8?B?NytKc0xtdEtTdXpzVEd5MVNyVVUvWjNRMmhvUjRVWFpwZy9TTHIwREs5RHJr?=
 =?utf-8?B?MlovbUN6a002VWVROThhM1ovV0wxaUFkbG1KNHFYM0k0RytoZktXTkY2cndT?=
 =?utf-8?B?dVl4RnZlbCtpdVN1djZxY2JaOVNSZnJuOWdwOFRzZWRZeTlpRVlGVk5xS2Vl?=
 =?utf-8?B?dWdnOVNMSGhCdEc2TzJya0xLTy9HYjBLSVRadVdKSWQ1M3Y1ZkUyY3NzUWFY?=
 =?utf-8?B?dGVrM083bXZtU3dabXd3QW1STWVWZ0ZWdmFPOTd6cXJ4dis0RzlxcTYzWU96?=
 =?utf-8?B?Z0NoalU2cjdMVkNkZUpHNm1XSGZLMXp0NXczazR6V0gvMXkxSzRtV3RHM2xk?=
 =?utf-8?B?TVBPVVdIWXlTZDFoZXIvYU1oVWp0M1oraU9YZ3pjWWtMS0RobWpTb2dMTUlp?=
 =?utf-8?B?ME1WQkU5ZEg0UE5nNElwa1o5d0NXcW1XQzBvaEdINUJFT080emoyMHVTVkM4?=
 =?utf-8?B?Q1R2bmRWaW1QMk9qeS9mR0JpNWJndTFaLzYzTEhydFVtUk5aSTNmYkR2ZTQv?=
 =?utf-8?B?L0RhaUJibkNLaCtrbTFwYk55Z1RKaTJHY3FFS091ZEJqbzhodmN1a3YzKy8x?=
 =?utf-8?B?YkNXK2hVUEVzeFVuTzFjc0JiNTZTMVA0NXRYS0p5NlY5V3N2MnJCbzU4Y3ha?=
 =?utf-8?B?ak9nQUJkSy81dzA1ZUFDNUo1UUtac3V6ejRDMGZHVXgvZ1Fza1RlTDZVeEZX?=
 =?utf-8?B?NEVjeGhSQ0VRRHlNMXhON2d6cFZyWHd3STRuMzk3UGZBNW1WQlUrZTVlNFFN?=
 =?utf-8?B?cG5icE05NkMvNWliU2xWd3RDNUo4Y2dHVjZoMk45dGdrWnFUbFlQUVdSMEVz?=
 =?utf-8?B?Q1l4Vnk5bThZaHN3Zk80aUMrL0x2YWNlbTNGcWNnckZxM2VLK2JVWXQzUFk2?=
 =?utf-8?B?Qk1CN1BrQThtTFM3ZmkybU9CVDRVSkdoay94Z3VvVEFwT3c5MGlQTGhnUWYv?=
 =?utf-8?B?VS9mOHR1ZWVBWm1FSGNnaU9uRHYrVFcrN0xYcU1jRjJkbGZYSytYTzNNbXli?=
 =?utf-8?B?MURyOStpTWUzMlZvSmNKOVc3aUsvdC8zQmUyVXJuSEdKOTlZZjF2QUxHVHJz?=
 =?utf-8?B?UTl0Z0FRRUZiaU95QzRJQzViZjZ3K3k5Nlk3dVEyT3J5MDFSUEZFTjZWc3ZE?=
 =?utf-8?B?bHBzQVhFWUltZkt2ZHdmand5UjJsVDV6ck9tTElGNEhGTjhQSDg4bEZySlho?=
 =?utf-8?B?c01lQmxIWWRQaGlacGFOQm1UMSs0UlArdWN5MnMwUkxaRVNtTEFoM2ZIc04y?=
 =?utf-8?B?NzNhbGs3blRHa0lSZm54RFZPTHEzZklXcmp2UDdCcGs0V1ZiRTRjTWM2cmhK?=
 =?utf-8?B?Ulk4Y0dST2R4YktEeFpMUnN4WXRUYVhGcWtQb1dvYlpRdUZCbU5CVUR4a281?=
 =?utf-8?B?WWhWWVlneGpHRW90ZHBxOWR4a1IvSE1lZjlNRDF3bnBHbE0vQVZRcmM5WXVj?=
 =?utf-8?B?b2dCTGo0UTRIVDZIeUFCRWRFcjVJNmV4cGU5M2VNR3dtODlONzZkVEVOQzE2?=
 =?utf-8?B?ZU40VzVrZlljeFZsK1dJNFBISFR0Y2lIS3NNaSs3ZE5waG1ZTW9mbXVFUDlq?=
 =?utf-8?B?aC9ybmE2MWtTVzROVmRMdytnT05GRDlTTVRXMFBKWDk3SC9QdzgyMHp3c1hv?=
 =?utf-8?B?cFVmV3ZROERINzVYdnIxbGRrTUlBbFRBZzljS2FTdXV1cVhPOUUvZmtjQzV3?=
 =?utf-8?B?VGdWbE9rWThuZDRHQklkMWd4SllSanJDanJuMTExRVZKcHhTQmgrK0pYVldJ?=
 =?utf-8?B?V08wV0Z1R3llbGNBTzEwRnY0OTVKMTNOeFFmWnhZOHkzejcvYytYSFB0TGpo?=
 =?utf-8?B?MFR1Q284NTh5ZTl6bGVrY0tMK25EU3NKRnhJdDhhSzErKzlCTWlqRzJhRm9F?=
 =?utf-8?B?NGxaejROQ1hjWCtraTVmU056Y3E5Q1FrZEExejhBaWJYTSs0eWxoUnJKamxU?=
 =?utf-8?B?bHpKcGVrK1FvOTRjaW04OS9pNDY4Z3Y5UnpEd2VhOFdGSno1VWp6Umo3cGhF?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40019ae-9dd1-483f-3eb0-08de22eca074
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:41:23.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8PCZv/40BEVXUfcj1SxHIYKj2ItzBog9YyDrbApiZuG+Khc6j9GQSUDnxajIWBlrLlP8zgFDjVgcXLM/bYEeHSqn//cubYZFAl4rqYPBGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6990

On 13/11/2025 4:49 pm, Jan Beulich wrote:
> On 11.11.2025 17:19, Juergen Gross wrote:
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -159,6 +159,20 @@ define move-if-changed
>>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>  endef
>>  
>> +PATH_FILES := Paths
>> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>> +
>> +include $(INC_FILES)
>> +
>> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))
>> +
>> +define apply-build-vars
>> +	sed $(foreach v, $(BUILD_MAKE_VARS), -e 's#@$(v)@#$($(v))#g') <$< >$@
>> +endef
>> +
>> +%:: %.src
>> +	$(apply-build-vars)
> I'm not convinced of having this here, rather than in less central places (say
> under tools/ and docs/). I'm also not sure I really understand why it needs to
> be .src - can't we stick to .in, enumerating the specific files that want
> generating this way (thus avoiding accidental attempts to re-generate files
> which need generating a different way)?
>
> Also - why the double colon here?
>
> (Maybe I figure answers to these questions as I look at subsequent patches.)

I too am wondering about .src vs .in.

.in is a well known naming scheme, and the exact point in the build
where it's generated isn't of interest IMO.  I've not come across .src
before, as far as I'm aware.

Is it going to cause a problem to keep all these files named .in ?

~Andrew

