Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB16C58641
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 16:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161779.1489635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZGj-0007HB-JU; Thu, 13 Nov 2025 15:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161779.1489635; Thu, 13 Nov 2025 15:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZGj-0007Fk-Gg; Thu, 13 Nov 2025 15:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1161779;
 Thu, 13 Nov 2025 15:29:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJZGh-0007Fe-4o
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 15:29:51 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96b94411-c0a5-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 16:29:49 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7286.namprd03.prod.outlook.com (2603:10b6:a03:524::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 15:29:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 15:29:44 +0000
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
X-Inumbo-ID: 96b94411-c0a5-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4qR2MAE8tWg23wKt3rMXhv7gIGwnNAxUuf6HQb2lg0U4btsc7LA9/PuX1/8vDGcWTLuqep6y0ZqMMuBjaDSYvxoF8ssFudrXF5XGAqj8UAwA/URE1kjsxkvsA4CAK5/Yum7z17PNEwa6Y7y3pclqO0eb5H5E9c6uZpXKe2Iyo2YYpM0ImN+PrDg5LdzDZQ3O+foe/AjU21M+4j/nOFBB2MifLr9g4NoLHi5oiFxSV2flgfKQ0VXMxtws9kD6fveX3zN1aMpfDrICkH/SDsM1MEvNZBl7RlOUYp8h2u1q6KM3StlW20AWA0vjs/u5KEG2X7dX0AFCWs2gCm1pLoPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjSL2wYW0tdDQHPfur07g+wi4Bm1dMv+Y+7iAA1LYfc=;
 b=nJizZ0uYghuvTWqDbvjkS5Glr5EiLX4axFgDxM7OoiLeOfBouu9UklRZ2Jf+g5jPJv83hKbWhm9KXONXdiSuvqGgstEDrtvDqKym+siwkwqsCmi0F2xHW1a3EBidmdXE1hJ8fNY73SUFgjeKxW8r9mpMyrj7VdG+rpbs3VYCWuRgv1Ce1eJVbzok92iAn6nsbiIWkP+/wW20mKOtDP+eO3PnSNGg/rebm6pgjeroqtZ3j7NXXyVWSOgun8qlZqD4SgpHBXenhjl7S9n2XjG1F8xq7Bvg+bXQPH4qvWYL7SXLTk8+nxNw6MdOmbTg6W1Qkv4gt7KBV0V1Tdc6swjxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjSL2wYW0tdDQHPfur07g+wi4Bm1dMv+Y+7iAA1LYfc=;
 b=KALOtLBJE2nwTT6Rfz1WoJ7anLUYffUf9YePlilOM+bczJ4ztFDhaFA3oDTrdT6uDGuCuKwThkPTglUdf4rQ62wOyVCoX80T+1eyvw6ABG6D5covUhUoykDurOof3lKvhpfrDnyRusxt/cuTK6wR0ayB7bkHcl6ZNp4K/XXzUP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8dc4473e-d83e-4577-ab79-663638afb1f4@citrix.com>
Date: Thu, 13 Nov 2025 15:29:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86: "brk" allocator
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0307.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cdfae7a-e0d9-47ee-a05e-08de22c978ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2xuTWRLR1JLRzJzMTc1SVkyZk5pWXlYditrNUJDQktaSmNwZ2J4bHQyK3BP?=
 =?utf-8?B?dERHVGpCa0gvd2U0NWVUR2lzeXdvdWVFeGp3UEZVS2JwS09BZGlkMnNnVUw0?=
 =?utf-8?B?OWVNeFQwRVFmOTMxaTJJeWt0RS9YNVlQYXNsQWlrcVdOZ1pmckJsbGJrREZ5?=
 =?utf-8?B?MTFTOTE0QTZsMC93M0hXL29jR3FZbHl5S3FMQzU5QmQwTWlWMVIvczh1VlA1?=
 =?utf-8?B?V2lKeTAvSUtQMWhicy9aaGt3NkxGRCt3MHlkb09CeURUOTRIMmtRbDFlb1lj?=
 =?utf-8?B?UHhjck5Mb2RFRVdJTHF6WnN0NkNnUWR2c0VUbEVlQ0tBcGtvNUJMajRneGl0?=
 =?utf-8?B?ejR3cXIrV1pyOHYrVTZVUTRXckxsbThhWU55dTd4V1d4WUxJaDA4VHZTVjRQ?=
 =?utf-8?B?S1BOM3JwQmk3SDZlRHVnalV5SG8wNlFCc0Vhd2NOR1VzZEpUMm5zenRJTk1v?=
 =?utf-8?B?RUY1RnM0SXBKY1Q5clluU1BSUzZFdnpBTzR5d2I3YUhKclpUdEhLRHN5RlE1?=
 =?utf-8?B?SEd2SzEvdnFxSnZtSGN2Y2xmVkxPN09Rb1NzcEFwWHpqRmFhb3VhaE5wTWx5?=
 =?utf-8?B?WkV5a1V0YkFPcDdUSGRKeVU2eENFdS93NHF3VUVmYzRUMVNBanZVdzlEY0J2?=
 =?utf-8?B?ZVhadWpVUXBBY3kvZWJsUXp3YStOQkp3NEpFU2trYVUzcjJCUXdickdmSTFi?=
 =?utf-8?B?bVFXRVhvdEs4aVNycm95NGFONDl2MjFEbnVmcWNqeHlzNFlsblZLWitidjRx?=
 =?utf-8?B?SHNEeExVcm4xTzhSZzdWaFhvazVNQ05yZ25qcUFaaCtiTUpCVUJFZWxPVnE3?=
 =?utf-8?B?azV0OWdYeXpONUVGeHNZMytiVUxFSFkwLzBiWnNEeXgvcFl0VEZjTHBzNlB4?=
 =?utf-8?B?dDkrdHhJcnhtLzY0bTNucUY3NWhjTDM0VG9MVTd6ZGZwSTZpQ3AxU09ja1d6?=
 =?utf-8?B?eGkvVk9ML2drQ1BWeEZVU1B0ekJ5SjdCVUR2VTVoL2JkS2VSRGVxZ0JVYTdr?=
 =?utf-8?B?Z3dwT0RBcDdsQWVTdXBGaGtUbUlRVlh5TjJKUWFpaFBYanROcW9Jejl1a3Zk?=
 =?utf-8?B?dHh5UlI3N1o3V1dnZWRvYjhYR1A3d0xCV1ZxZjc3TkRMRGNNV1FpVDQ4c1NS?=
 =?utf-8?B?bVNyVmV3R0VSZ0podGpaR2drbHRRcmdxUFpyS0lsYUQrRHZnYXBRYm82VjY5?=
 =?utf-8?B?cWg5bnZ1VCtONTUreE40b0UrVWI2ZjVaY1ZadHNKN2tHcHlnTDFya29DaWVr?=
 =?utf-8?B?RXArdzl6eEIrTzVsTzdvaUx6b3ZVQmhLNVhLay9aZXBhWThWUkVrajRaSExN?=
 =?utf-8?B?Vm1zNFdVZUdkRStBSmtrWVU2b21SUWhGcWtGdlJmWVdHeUxscktIRCtYTEZx?=
 =?utf-8?B?MUhTSWNLbkNWa29WWTR4ZCtUSlkxZEFNZHpuMHEzK1pBbU9QRXYvNlluNDJz?=
 =?utf-8?B?ZE1CRmZJODJ6UFRSN2lablNZNkwzNlRTWWQvalRWK0RoUVZjTzBiZ0Jkcmlh?=
 =?utf-8?B?SDNVRjRCZ1pJeVZvd3B0SzBkNVphYjBPZ3dxUFBSbU1kMksrblFiY25oWmZw?=
 =?utf-8?B?TTgrVEtzMjNrSDgzL29Cdkd1UmJIR0ZKekN1c24vbVduUFBwVHlQb2VkNGp0?=
 =?utf-8?B?bnNaNERkV2FyOE8zcjc0VXlNR2I3ai9scFFkcU51WmdKcFpGMzlFR0RGeVdn?=
 =?utf-8?B?TmhreVp0L2g3ZnhXb1RNZGxVOXJyYStTZnFqMEVsTmNVUDN3RDBvWWxmNldK?=
 =?utf-8?B?bXNxVkpIWDZUSXVlZ1RmOXZML3lBUUczU1FqTCtVeXNpdVdqano0Umpyc1I3?=
 =?utf-8?B?bjMxUjkyUWtmSmVoN2pCYUEzZGQrY29SWFlHWmp0QkZDYXNQVFJWR244Zkk5?=
 =?utf-8?B?cnNBNStRMTU2YlkzL1FQMnZsZVVRZUZxc2NZbDBCcElIdzhhZ2RVV1N1TjhU?=
 =?utf-8?Q?48nIdrvFteLF2KKlRXT55dD0KUrBBQKD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnJFY09KalM4YmoyYzdwV2RGYTBtQ0EvbDJtaDhrODJJVmlDSy9YZHB6cGJR?=
 =?utf-8?B?VnFGYThZT1NUT1JMODhHM3FWaUFsU2pjNURTYTc4WVNscFNQa2JiUlpxYXNE?=
 =?utf-8?B?citWTEJrMEYyeEpvUC81bmVOcjVYZmVJdk5QWlhEbWxxYVJORlJYMVdXWnBC?=
 =?utf-8?B?aHBxNVYra1RLMVVPMXRpTXB6Z29rQTRJdjFxWnNXWUtROXJZeWpGMTZYTExr?=
 =?utf-8?B?VHVVNUVNbnBCckxNd0xMNXB4akEza1FuWE9lU0RoTjZwN2tqa3JWaUFYOEJi?=
 =?utf-8?B?eUQ4dEZuc3NQMEJlNURlTUNXY3lRWmFDM2kxYmpIczZoNnY3WHRCSkhoWVB6?=
 =?utf-8?B?ZFRXWm9BeFRqeVlOMXNtNkJhVWJ3bHpoMVI2TDBUMzljRzBhSWNyKzdZbkNo?=
 =?utf-8?B?dTU5Ly9WZHN2VVVSZGVRcDhlSmtaTFV3V1l4Wlp0L3psa24vNmdYRHFIcjZk?=
 =?utf-8?B?ck9FL2I3eTlYTmZic1lMN0JISnpDZkluRjJMRmVVM1VqUVVhSWtWV3Q1Yllw?=
 =?utf-8?B?c0pRSlE0MDE5VkxhTXFVVEZmaTJBNWd6ejBFTkw0eEJiS3JSS0xBT1A5OTJW?=
 =?utf-8?B?MUtCVGZlQ2hGcWpxVUQ3TFlSSzV1SXIrTTR5OFRiMXAxUEl1NDFldWJZZ2dE?=
 =?utf-8?B?aEZmL2dkVW41UHh6RlRtOEswajBRUldmTVdzZ2lRdHl4bTAxaDQzVlhFWnBU?=
 =?utf-8?B?WnYwV2JTTmtNT0FDYUg1L2g4ejQ1a0NQZWJiOVhSaSt1TXg4MWYyaWhjOU1S?=
 =?utf-8?B?ZXlab0FnWVdZTW5rUEJNVEFDK1QyUWo3azgxMG5RL2tDbzE0NUpDMWVPUWZP?=
 =?utf-8?B?UDZsV1pRMFZSYkREV3VCSmZoeHlTSXJiZGp6bVBLOUlnYVR3TzRFMG9UODhY?=
 =?utf-8?B?ejhzaTZUenUrS0s4MFRKYUtmVTEwT05BK3E3ZmdKWGEveGtZNVV3ekJRK2Zr?=
 =?utf-8?B?UHFWcUZGOCtRVkJIQTN6R1p0SDdKSmp0ckxZVldwd3hFZVU2VzdZRWtMMXNC?=
 =?utf-8?B?cGtDU1NxcXA5RUg0SFhwdG56T05QSUc0S1lLUGlOWW5ackEvckMyRlNDNTF4?=
 =?utf-8?B?bmFQUkRla3pBSFF5ZUFhbWIzSHBRbG51dG9JVzN5Vml6djVIdEpGcjBpRmFM?=
 =?utf-8?B?OHV1MFdUUXp5T1dKZ3NCZ1FvMmRzWFVaVU5heTdZRkZMRk9FMXh5aGZ5eTlG?=
 =?utf-8?B?aWpsaGpkQzJwbG82M1ZYN0IvZXUvdlBIb0hGZDhFQmM0dEU5RGEyL1dweitS?=
 =?utf-8?B?R2VOOEpPSEo3K1l6WWp5ZEwxL2hIVjBDRkU3QjZraG01LzV3cE8rTXZLWjJ5?=
 =?utf-8?B?NjBsdm9RY3d3TVhxa09uU2JVd0V6TWNWT0hTcTdoYlgwaHB0aVdlRzdYZ2RX?=
 =?utf-8?B?NzE2c3hPRmtJYnpSRGlrN1lvUlI2Q2NiMEdnblJ6ZkxwTU90WlVHMnlSUDk2?=
 =?utf-8?B?a1pJdFhsYXU5a1RyaWZpS3JGY05lcEVMVjJUL0g2N0tqWFh3VUd2UVdVOWZ5?=
 =?utf-8?B?cEpsVUxLQTQ3aXhKdVpEWVFYYW5BWWlFOVI1QXNDRDlCMmNOL1BXYzF4ck95?=
 =?utf-8?B?cmZkbkU5NVN2dmh5TkZ4UVV2Y0lMemM2eHB1UVJJMm1DV2tzcVRjOGF2dDNS?=
 =?utf-8?B?S2RYYlNGZ29zaEFVcCtlaFNlMDVRc25xWTdnMTh6cWthQVlkdEtlTjdFcU1M?=
 =?utf-8?B?aWtpT1JCdHMycGFGOXNSQ0NiMkpBaXRDN1JQbzBkRHlUV3BVejdzNXRvaUdN?=
 =?utf-8?B?bGJlLzhnc1RydzJ4Zi8zenVzSlZyMkhkUGRpMGRjMlhXZHNLUnUvYWRJV3ZQ?=
 =?utf-8?B?YnBPRHJ2cFplcFZTSnJzL2RVWHVFSzdYR2hHR2M0U1hxbWlRemlmWXJPQmla?=
 =?utf-8?B?bTk3aUNnWU15bnVXWjdTSEpaOW5JYUdob1FzNXg2UUFyQUpROVM5S0tLZjlU?=
 =?utf-8?B?ekJPRjdRL0lWTlY4RGJ1WHhSRFg2anlLc21GaWtJZVNEQ3Mwb1Ewdjd6Z0dQ?=
 =?utf-8?B?U09jMFpYTndjaEFhSmdzSlRLaHR5bjNxRHJhSTh2QmhVaW9UOEhMUVM4YVdx?=
 =?utf-8?B?WWhFLzJ4aHY4cG9ZMHhmMFEzTWtXZGRqelc0S0pHQUdKNTF3WVRIVzZGYzQv?=
 =?utf-8?B?dXd6ZXdKUDR4QVZNeUV1ajcxZEVTamVnV01jRElxbXB2ZiszY2JROUN2YVRN?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdfae7a-e0d9-47ee-a05e-08de22c978ba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:29:44.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EeJxsWtvT8wggsaEBKQSCQgmMINBAYE5dliGUq/tDFSMOVXF96NXss5ZWAdLCrOZPsgMWvVObBxphXO7wWrslMF61vomP5k3ZABIJpFpxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7286

On 13/11/2025 11:06 am, Jan Beulich wrote:
> Derive for our purposes something similar to what Linux has been having for
> a long while.
>
> 1: x86: introduce "brk" allocator
> 2: x86/EFI: replace ebmalloc()
> 3: xhci-dbc: use brk_alloc()
>
> To reduce padding holes, .bss.page_aligned and per-CPU data may want moving
> immediately ahead of __brk_start[]. Albeit then the tail of per-CPU data will
> all be padding space; sadly the TSS wants/needs page-aligning for XPTI
> purposes.

I've not done this yet, but I was intending to make the TSSes be
dynamically allocated, so they (along with the IDTs) can be omitted
entirely under FRED.

The VT-x tr limit bug/misfeature complicates this somewhat, hence why
I've left this out of the FRED basic support, but it can be addressed by
pointing HOST_TR_BASE at a singleton TSS.

~Andrew

