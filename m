Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB6BC077F
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 09:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138561.1474236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61wI-0007iT-F9; Tue, 07 Oct 2025 07:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138561.1474236; Tue, 07 Oct 2025 07:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61wI-0007gM-AZ; Tue, 07 Oct 2025 07:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1138561;
 Tue, 07 Oct 2025 07:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v61wG-0007gB-Nd
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 07:16:48 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93adf4fc-a34d-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 09:16:43 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BY5PR03MB5109.namprd03.prod.outlook.com (2603:10b6:a03:1eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 07:16:36 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 07:16:36 +0000
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
X-Inumbo-ID: 93adf4fc-a34d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6syiERVYXl+MfdWBiKOCoOXrIvpUnAV5Mw2sSeDjz38/EdJKc6/E0EeDPh2rFNhflRcO/sB8W1Oyrr8LI1jvcYQ1zRfiGE06qFou9Izhxni2/aIoqR7URR8fyqLa+4bsoljCWwVcUucfotBBsMzy4fekNzTKtR7aTJ6Q3+AI5tn9WWBUr/R1wMKqauPrnLq5zNlFv6jZgUQEs1M0BVUlLwIzmcN7RyS+zwqrh/Tr6RAKVXnyl8sVQTnuOKVVfxCtkbiXKU/WtTXmqDEDj5BkyWph4rO0U/RUsWpuh3vbV1QpjvE/WHzcAJQWpjkGaFD/L5LCt4ilJ5HxiNNvtVvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/aOhYhsczh2SPcNmLu63CTZyXv4Gdv49lmN3F+z6WY=;
 b=jmn0p7M9SQm3Wy0yYsbGoxUdXmr/VA8QehVdab3l4uefWMA9xfQeA/pRPL6DhQYIroZ1hCEXa6k/ozbqLPGfXcL5qwu9PRP3yyE+u+f7oSgA4ioYPHNZabDMu/X5D5P+0caBTnCQ7v1B6UJmyAPj+tj0OVjrjfjUWPb3BFJFTl0e8aiJwb8Sp2uiU5sDWeWO9RwKAMToiojb12eLg16TN9x9J9c1UTpXkdXP4G7GfWrPrxxyFVUMcGhBda6yGUtruVVsq+DrxL9dBSdYn6NuwiAvlaZyFTviB8au/m5B/Uuvk36HNdNhGLwJzZ9+fzABFY4+uCGMAtxZSDqJtCVfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/aOhYhsczh2SPcNmLu63CTZyXv4Gdv49lmN3F+z6WY=;
 b=dU06f2XHQUl7HNKUWGppSv9RH9fvGlwtjEbGfTgdN73w2YI+leGHYSbotYCMcpINEsP7VNbxLH5zSik9D6UXIPIIuc21sSNvQDazEofzEyq+BwAMOTRpnksH0wY1Wb5AClHEgXXOoaVQUMdqY7V8ftsaQsSkarft2y/RyOpoc6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 7 Oct 2025 09:16:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	xen-devel@lists.xenproject.org,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
Message-ID: <aOS-T-LcuFsmdCOs@Mac.lan>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <DD60R7HDKJ23.1BYEORZH67NOS@amd.com>
 <aNvTwrcHsja65ndP@Mac.lan>
 <DDBAHJDFXN5L.2U4TFNVR6NLZ@amd.com>
 <7bb14669-f8c2-47d5-a3ba-048c0e45458e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bb14669-f8c2-47d5-a3ba-048c0e45458e@citrix.com>
X-ClientProxiedBy: MA3P292CA0013.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::6) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BY5PR03MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 073df094-2d4f-4280-f0df-08de05717320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUNhZStDY1ZYZC9VYnRKdjMrb1MrRzU1RlMwSFJ5L2M2WUQyQ3ltUHJvdWNF?=
 =?utf-8?B?NEIyNVlrdmtzaG9xb01DdnlWeG9tWHUyVVRhcCthVzgyT000R0plZnBMNFpH?=
 =?utf-8?B?T0Y3ZzFzU0oraEd0NVozaXNYbFZyRFVXa2lOM0xpYjRqRTVyM0hUQWpVKy9u?=
 =?utf-8?B?Uk5QSVc3VithWjJxMzZkczE2cDFkZjg1aWRTK1ZmWFZFbk9sMUlkZTNOWHFH?=
 =?utf-8?B?czBFTG1JcVNYYVdrOTRzVjlxRUJGZGFSNndoWHl1QjNDK1NLY1dTMzR1TjUy?=
 =?utf-8?B?TVNxNzcxMzJ5VTNEUXMvZUZpYmxCZ1BEaDhsTjhyRFhzc3Z1dGpyZlR6OEFO?=
 =?utf-8?B?cVlBdUhWMzA5M1U2cUVnaWtHUHFSS2ZrZU9rUW1zZi9MdW9mb2dobmY3Y3dT?=
 =?utf-8?B?TkY2NUh3Q3BpS2FUbG1UQnMxWEsvOXdYUUdnTnV1OGcvcy8xQkI1dXVrWHFN?=
 =?utf-8?B?QlVpZnJTb0xCWG1xQ0Fmcmp6ajIwVmlSVVVGRjVyMDNDeHowcFcxR2hrMTBG?=
 =?utf-8?B?bUpXUy8rOTREajgzNTI1dFE1TWZjamdNVDVmOFpqTnNLTkE2b1dtb3VEVVRK?=
 =?utf-8?B?SnllbWsxZUIwR1YzV1FnWm4xaFN5SEVqTElmK3pUWUowNm5QcmZRTjcwV2g3?=
 =?utf-8?B?WEF3MXU3U3RhbjZQTVRKSGx2MlVHUE5NOCtrdlpya1NpdVUwY2JDUWtEYzdi?=
 =?utf-8?B?ZkFKVXJvSFRqNXB6UDE4d0YwTXg2YWEwL2QxeE80d2x0OVk1OFV1TnQxbGM3?=
 =?utf-8?B?ZWgrR253SFR6bnhtV0ZMcE9FdVI1aCs3WCt4Q1VMcitHVkluSFR0bXhheFFj?=
 =?utf-8?B?M2djSFNmcXpWRUJqaVk3L1dJR2NDU3owT1M5Y01oSkc5WDZLNmx4Y3o1dUU5?=
 =?utf-8?B?ZG5DZm9od3F1a1VTaFAwMzZNWldhK0JPclJMdUJpN2hCa1YxdkthZHJLMDJr?=
 =?utf-8?B?THFCdmUyRy9rTTdENWIvV3FzVmZPWXJsR0ZCcXV5eXpqbElxZkVWN1RrSXRY?=
 =?utf-8?B?WXdlcXlUdTd1NDV2NmJrdzVVQzBMUVJTTE9JZVQ5ODNEVzNOTURJeFEvTk1s?=
 =?utf-8?B?czl4bGp3VmRMaVZzTEZPL3VtVlYwb0krcVlVdHkwaWhLbi9rTFYxcFhvMDVM?=
 =?utf-8?B?NGxFWVV5a2hqYm5zMnNnTlNiSFQyWFRDN1QwbzRBSGdLVHByTmhJQWlzYXFt?=
 =?utf-8?B?QU0wUGhiTDUrT3pkZjZlb2JTTGlVbjN6ZytLdXBZQWxaWW81dStJWWVJYmhl?=
 =?utf-8?B?TVBWL0lRYmR2L0xwVXJGQmdxUVVTVUtPZWlLZDdBbWdUOS81ZDRycUVsOTZU?=
 =?utf-8?B?K1ZGRk13Z3lJZlpsRng3c28zYmNOZGxkVkI2QTY0T1ZxL1NPak9qdW1wNWxU?=
 =?utf-8?B?eWFWaXQ4d216VElmRW0ra0RVVktRaVRaTUVYRnE5WXYyN3B1dW5OWlozUkww?=
 =?utf-8?B?emhzcCtYQUMzYU5ocExROXZ5MFpNQXJyblZTZG5Oem5PaXlXc0tFc05NSlRh?=
 =?utf-8?B?cFU4dWZWbUdRTnVnRWZoc04wK09JK3M0eUtQVitrZ2c0U1hTSENHblFLejhS?=
 =?utf-8?B?aWRRTnBOU1BWVC9XdVBMVXc0QkFGVjFQYXFxVDBsOW5Ca0JMbmgwK3pUc3BS?=
 =?utf-8?B?TXR4cktJVllHazNhV3lXZEo5UkZSWEEyZU1taTFYU1Joc1BoSEVxdXhsNGpl?=
 =?utf-8?B?cTVMQWJVM1VxZXlMUDNtWlpqNVJlbzlYNHh6TVEwbGtEVmJXQWV5ZnlFV2Vh?=
 =?utf-8?B?NWhaM0N2eXg2dHdaZC9GM2RZL2Q5bmorY3p4bGdzNlowbGRxQ0E3QWdDZU9h?=
 =?utf-8?B?NnMxQkNlS2VwdFdFb3p4UnFVNGhIQ2JSNjl2czdMSitsdGMwTUNWaTNtbUY1?=
 =?utf-8?B?RWFaMzA5WHg3dHNCallzc2diQkorTUJQa21MSHMzZHBNbU9VRkRJdElMclhX?=
 =?utf-8?Q?faZjfhLt9xFZZ5J70W47SUbtdXvDlPQh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHp0ZXk3Y1U4Q0NrbGU1MkVNOVhHcFE0ZHdwc1VEM0JIZWdaMnlCUGNmY1dk?=
 =?utf-8?B?QWN1ZjN6MC9oZHZyazhHaVVwUmlJT0FaR3VacWw5N1R4SW9XU241dWxzWStp?=
 =?utf-8?B?VlV3VDdYNUk1RXVCOFpqTld3dFBnL3krOXRWU2VsM1dXTnEwTDBFRmxJWmNU?=
 =?utf-8?B?eENHMDNxajBwTTl5eDlHMzk5RWpXcmlpYVR1dmpxV0w2L0lNVjRWUzUxMU9C?=
 =?utf-8?B?d3Z3Q0h6R3NZUkpxVXBZMGoxM0FERkJrNWloa0dLUFlSUDBlM0NKT1ZuYjkv?=
 =?utf-8?B?U1NkWGN1bjdyU1JHdEtwWHluRmFEVXpCYkJkaDNKU2paclkrT0VaMjByNDJC?=
 =?utf-8?B?aDI3b3V2RHdPKytNcmp5SkU5NVlqT2pFa3liVFp3Y2wzakF4K3hTckRKTXhq?=
 =?utf-8?B?R0ZxTEZOV1NHMGxZYkFjQloyREE4UGhCNERqUDNURnRYNG1JSi9RVSsvdERF?=
 =?utf-8?B?d3FjR2s5NUtmckJZajhRRHo1ZzVpanpGSzNUOVloOUVsRkMxQkhDb2MzRkZn?=
 =?utf-8?B?SFpYTHJ5T05rQ2JnaFh2aVY1TnVJajd2Tk1iVHY5YURSNnZWQzRZQlNwR3Rz?=
 =?utf-8?B?clVmQ0F5dnlLNkJFbW15Q0xsRE9YT3ozZ3NjQm9oMFBhYVhJT1dCK3JYNkk1?=
 =?utf-8?B?R240SGFDeVM2czcxZHJBQjRlM1J2RXFVYnpTSEhzUjlxMVpCSWl6T29ZR2lN?=
 =?utf-8?B?QmtDemd2dUZNeTZDcmZLanAyWXdhWGt3VWRTUUR2WDRKd0lvQ1JtMS95Y0ZU?=
 =?utf-8?B?ZWhndDVuVjZ4SXhteCtJMnFPTnJVam9IbUJCeUhjam5Pd2dJZVdnYkJQMGxQ?=
 =?utf-8?B?VldzOTVURFRuV0J3QXY0K1piTkJUUGo1Q3lsR3lwZWg0S1YyUTREM3U0YVoy?=
 =?utf-8?B?M1J6MTFJUStHQ0hyTk0wVXJlenU2N0dqWXhjcW5RenFjYWg1ZWNlVytjN0kv?=
 =?utf-8?B?TVNaeGdVQk9uVVVHcEJTWjQ3cmh5MVVWY0c4VFBZcEdjanpMNVdTWlF6czNw?=
 =?utf-8?B?Z3JIa29mN1R5WlZFZys0WWpBNnZJZ2drYVptWVpGTVNtNk5vbHBpRk81enJL?=
 =?utf-8?B?YW9PQXdIWmhTeHp0TitnemNkckx0REM5T256RnVVMmttejJUR3MxQUM2WFFm?=
 =?utf-8?B?dVZpUXp4UjMyZ0ZoaS9mcGdGeXZVQllmUXgzMi95YU1rZWlXZHhSeG5FTU9G?=
 =?utf-8?B?MFl4Yk5qdFZrQ2EzNmdKUWR1S3VaSFJSZy8rMEY3RTR0ckcvbXR5SlZFY3NK?=
 =?utf-8?B?cDVjcnRyajJnSmI3ZWRnd0EzbEVnTkJNSmNNN0JoMFZ1QlFPWEdURXlISlZE?=
 =?utf-8?B?Wk1lRUwzSEpVVUFTdzdnRGJFMkJpM3llTzZNYnZrWlo5V1V0T0ZMSWY3OXpl?=
 =?utf-8?B?M3hick9UaElieTlyRDA1ZXlLMzBaR1VjVVdQVG4yYmwwVlRCTnI5dUpiL01T?=
 =?utf-8?B?bTdQSndHQkpqVXdkV3AxN2ZPSVQ0SFNxY1FJdkd0cTRoMnVwNEFBcnZWM21z?=
 =?utf-8?B?eVRrOERPRG84WDlIdmhyK0NxejU5U0l1UDczVkhTQzZLWmg1ellyWGRIOTBH?=
 =?utf-8?B?dWRtQ2liNEVVQjVLTW9HZHEwWFRzYnh5TnpHODFpRlEranpHdWNNdTZUM0cv?=
 =?utf-8?B?QS90SnB5bmRITnJSVU9QaXFSRThuemlCbGNPdExNaUJGR2N3SWZBSGh3MjZs?=
 =?utf-8?B?SmNmZlozR2ViSlFyempadlNtWm5XdzlIN0UrR0VqT2RVQ1JHbDAzSFdORm1a?=
 =?utf-8?B?cmZLajhNc2pTN2k0VERXWjM5a2xvcmdxT3VxWkNrQ1o5OHNRT2hXYjI1ZWJQ?=
 =?utf-8?B?SXRiT0JqTGFSWkxxb3VCSDJySkhTaXdhVnIyc1BDa2taN3dqYnNrd3NaZWh1?=
 =?utf-8?B?RWdHRHlGSUJUZDZ1aVlBVEYwZ3loR3p3S0ZEMHFwMW9uRFhyUFlZWEFCeDJM?=
 =?utf-8?B?R3JMb095VEU0ZGkrT2JnVko0Y3FWclM3ZE52dEwvQ1NFZlJZOVUzeElOM25O?=
 =?utf-8?B?TDgvdVZjc1hvRHlYK0VmUlROaHpXQm5QNi9PZjF4NHZBbzVXT3VVOGZBdlNk?=
 =?utf-8?B?M0lUa0tSaHdPT05vcjZrZjgzK1VTYVpTTXZoZHUzVWJ6OExVRlgrbzdnbWhj?=
 =?utf-8?Q?/Vt8B+lcmPRdsYP08Go3iTqTx?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073df094-2d4f-4280-f0df-08de05717320
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:16:36.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL9LIRgvmW2727+/qumXmUASPRJMZDyOcHrhfnuc0tB9UtkzYbK/ni9BVd//4b6C2Q9sSq/7Qr7iWNzqqTeF0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5109

On Mon, Oct 06, 2025 at 03:29:11PM +0100, Andrew Cooper wrote:
> On 06/10/2025 2:55 pm, Alejandro Vallejo wrote:
> > On Tue Sep 30, 2025 at 2:57 PM CEST, Roger Pau Monné wrote:
> >> On Tue, Sep 30, 2025 at 11:15:01AM +0200, Alejandro Vallejo wrote:
> >>> On Mon Sep 29, 2025 at 10:41 AM CEST, Roger Pau Monne wrote:
> >>>> I've had the luck to come across a PCI card that exposes a MSI-X capability
> >>>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
> >>>>
> >>>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
> >>>> still use the address of such empty BAR (0) and attempt to crave a hole in
> >>>> the p2m.  This leads to errors like the one below being reported by Xen:
> >>>>
> >>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
> >>>>
> >>>> And the device left unable to enable memory decoding due to the failure
> >>>> reported by vpci_make_msix_hole().
> >>>>
> >>>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
> >>>> tables are usable.  This requires checking that the BIR points to a
> >>>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
> >>>> target BAR.
> >>>>
> >>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
> >>>> EPYC 9965 processors.  The broken device is:
> >>>>
> >>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
> >>>>
> >>>> There are multiple of those integrated controllers in the system, all
> >>>> broken in the same way.
> >>>>
> >>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> ---
> >>>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>> Cc: Jan Beulich <jbeulich@suse.com>
> >>>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>>>
> >>>> While not strictly a bugfix, I consider this a worthy improvement so that
> >>>> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
> >>>> capabilities.  Hence I think this change should be considered for inclusion
> >>>> into 4.21.  There a risk of regressing on hardware that was already working
> >>>> with PVH, but given enough testing that should be minimal.
> >>>> ---
> >>>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
> >>>>  1 file changed, 45 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> >>>> index 54a5070733aa..8458955d5bbb 100644
> >>>> --- a/xen/drivers/vpci/msix.c
> >>>> +++ b/xen/drivers/vpci/msix.c
> >>>> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
> >>>>      if ( !msix )
> >>>>          return -ENOMEM;
> >>>>  
> >>>> +    msix->tables[VPCI_MSIX_TABLE] =
> >>>> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> >>>> +    msix->tables[VPCI_MSIX_PBA] =
> >>>> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
> >>>> +
> >>>> +    /* Check that the provided BAR is valid. */
> >>>> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> >>>> +    {
> >>>> +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
> >>>> +        const struct vpci_bar *bars = pdev->vpci->header.bars;
> >>>> +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
> >>>> +        unsigned int type;
> >>>> +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
> >>>> +        unsigned int size =
> >>>> +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
> >>>> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
> >>>> +
> >>>> +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
> >>>> +        {
> >>>> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
> >>>> +                   &pdev->sbdf, name, bir);
> >>> Would it be worth adding something here such that a device vendor testing their
> >>> hardware under Xen can trivially grep for device bugs?
> >>>
> >>> Something akin to "[Firmware bug]" on Linux, like "[Device bug]" or some such.
> >>>
> >>> It would also let anyone not very knowledgeable about PCI know that a device
> >>> they own is being unreasonable. Same below in the other XENLOG_ERR messages.
> >> We could add indeed.  I don't think we haven't done so in the past.
> >> If we go that route I would suggest that I add a:
> >>
> >> #define DEVICE_BUG_PREFIX "[Device bug] "
> >>
> >> in lib.h or similar, to make sure we use the same prefix uniformly.
> >> TBH
> 
> We have several FIRMWARE BUG's in Xen already, and several more that
> ought to move to this pattern.
> 
> Given that Linux has definitely been booted on this hardware, we should
> match whichever prefix they use for messages about this.

I don't think Linux prints any message about this, it simply ignores
the capability.

We have another instance of having to support buggy devices in vPCI:
when a device places registers in the same 4K page as the MSI-X vector
or PBA tables.  In that case the offending device was an Intel
Wireless card.

I'm happy to use "[Device Bug]", will adjust the patch this afternoon.

> What's unclear is whether AMD can even fix this with a firmware update. 
> I would have expected that the PCIe hardblock would have prevented
> making this mistake, but clearly not...

I didn't want to point fingers :), I have no idea if it can be fixed
in firmware.

Thanks, Roger.

