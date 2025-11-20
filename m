Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD31C75A53
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 18:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167688.1493930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM8Ps-0000cV-K7; Thu, 20 Nov 2025 17:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167688.1493930; Thu, 20 Nov 2025 17:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM8Ps-0000Zx-HL; Thu, 20 Nov 2025 17:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1167688;
 Thu, 20 Nov 2025 17:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM8Pr-0000Zr-40
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 17:25:55 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5c756e2-c635-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 18:25:50 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6561.namprd03.prod.outlook.com (2603:10b6:806:1c8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 17:25:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 17:25:46 +0000
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
X-Inumbo-ID: f5c756e2-c635-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTXbkG622osHGjre9W2cerNsYZHuOwFZpPUOr+FQv1GIGsCo3EFGTV8ts0O36/ckcLOTt3gO+HErzRLgDpDfmiv0TqOhA3sd19ScIUQ4ZaPIxqSnCp6q4q9+maCbgRC+0/G9Fw+de5dvzphHu2LD8oDOmDqJgsLTbk5gMqL1OGH5ZQ4j5Tu1PoJo3R5r9pXvLdZRRxSPVgnzwLdc0J5KkuOhtVkvyNhPCjITnJc+ZENSnojVPaZQbTETIJUeuG80iKVLdS7kLksKi35sjT24uYV6b/jEs4cWREQm+jUy0oeIpjY8UawmvZKT7n/p5EWBWoRAkCSsGnqxZ3OeCdbzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuzQ96nhcsDbqClxo6BgU2ke70aFBZ5VK6VHGKXUP6g=;
 b=ErBXuyTACY/wSpt0azg6BJNx19qZb7W+NWMKx3mBzrLJU3MgM89VMM7L7LVs1HickIt025CeJ3T2NROSeWL+j2uDGLQzcfrr0Kygr+o9GVf7vAzyKWgbFA8wujV8lyqxH6EwwUG1flgxkC7B+arahc919hhQH9nPAlQ0l9Yg0bKTmXzoORHoywbW8heBLxJ8ch+CoOf4ZmRXZh1OJFjFmz7Jvy/dYM4aix69iqbi3ZNSd8TGnBShUSF1+UTmerATPYWo5y2KQyMLN1v7Qck8xx4T8VNd+jjdAvu46d1t+AbXcjaEOrrBUZYfeMaCp9EkkkAqbKjgrPjKdXgB0l5OxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuzQ96nhcsDbqClxo6BgU2ke70aFBZ5VK6VHGKXUP6g=;
 b=ImOYZBj3MA5AwUO6mI71WnhOg8KRe9oe3K49v//F4c37X3eEncADtp/VoqrbJv7cerMl2JanA+G02EBr1MgAXM64nq0rfVrfeEGqsIf+OsKnp691WmMFR8rVCHceUUtaJCXL4b6K6gvxLZx9rZGKnY5VAMG6fd5EHGFXr0a8yM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8c55d065-c663-40ac-a2c5-f4c7d85971a1@citrix.com>
Date: Thu, 20 Nov 2025 17:25:43 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/MCE: restrict allocation of thermal and CMCI
 vector to BSP
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <638d0954-e889-41ee-b277-282f83170c69@suse.com>
 <ed2f44ce-b28d-482f-b6bb-5ef40149f2b2@citrix.com>
 <5a476cc5-0095-4783-bde9-c84f24740372@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <5a476cc5-0095-4783-bde9-c84f24740372@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0031.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::19)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ce761f-f1b8-4b16-e5aa-08de2859d745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVo0aWExNU5Zbi9Nb3BwSUJOd3FwVjhuSVgrbTRXS2VRUUJzV1dNZGwrZzBL?=
 =?utf-8?B?WExrMStSNUlRUXFMNU9veVIvcUZQbFA3bTJVUy9FcjdXVGFmdkZJeHpvQWc3?=
 =?utf-8?B?WG9GaTAzZmlCMmw5Z1p2N3J5eVFxVmwwUzl3R0t1TzZzRHN0NnhvK0dydVpw?=
 =?utf-8?B?QUVSOGdBN2RUSC8xZkhMVkdxa3N5WVQ4czczQVByVlAvbGZ1Rk9oU2tNWWhR?=
 =?utf-8?B?eVJKNFIrbXVUbXBmNE9vVlZQRkNjU2NuSWVjY2xJL1hTSWh6YW5sOWdvYXQ2?=
 =?utf-8?B?NHRydmdzZ1RSMzVKTTZuMzh3Y0Fkb05GOU9QOEJFWU4zcGlQbTczd3hiUmJq?=
 =?utf-8?B?TEtWRHRHUmszaW9lUUxCNEpjWGRNNEVhc1lOWUt6OVJFNEJaZDlKemFBa1hT?=
 =?utf-8?B?RUZUcG9YQlJxVVh3d1B3c3pMSFdYY3U1Tm9iTHlUcFlRREZsLzZ5Nk1kTHZ2?=
 =?utf-8?B?OHNmbU9TbWRnR05jY0dCbk5Db1l1QWtnRnhReXNQWHlrVzNqcFEzVU5FWFVD?=
 =?utf-8?B?ZmhzSFkxSXFsdDkxcWJFb1hnZUFNMzdkcWYzbDh2V2FiZWxLU1lhZUkwaXFP?=
 =?utf-8?B?d1dhMnBSTExDZExPc21XWFFuK1MyeWFxaG9EMnlER3B4cEtPQmlyVmF3WW13?=
 =?utf-8?B?RTlSbjBLVjNsalAvbDlRSG51UFkxUlZVQk5oRFAwT1Nldjh1U2JGaHlhRGRr?=
 =?utf-8?B?M0tOTkVGUVNPbGRlN05xTE13eWJha2JlbUpveXhMbUhSMDQ3R3N0TDV2a3dB?=
 =?utf-8?B?NEpJS0ZWeU5Cd0lJR25vZ2w4V0N3RkZUUjJIalYrNlVYMHRPMy9XekhaSWNO?=
 =?utf-8?B?bXFRYUM4azRtM1B1RVhQTzZGblRnNnZGZlpFWlhaRmNDR3dVWVhOaU1CRUwy?=
 =?utf-8?B?YTJsWW1ld01TTlR3SHozZnlpSittSmw2NVRBam50djZkNksvd2svcGQ3ekk4?=
 =?utf-8?B?SXhISjNURTRxTkE1MElyUlZSVGhGYzBER3JnYXJ6L2V2TjFBMExSUldXOTRl?=
 =?utf-8?B?d1dISHk1eHJzdVdiRjl3eWJRNUFxQWFWZDZLTVdPcVdXKzNqT0RrRXNlenNo?=
 =?utf-8?B?ZFh0MnpZcHhzVUxYSnczQWo3WEpNZzNaNkd0VGlKVGZRK0owekp3Mm5sQmU3?=
 =?utf-8?B?d1RKeDV3aWdjck9iU0FaZStmUG12am9KckdjbnluK0k5bTNMRkhrVDR1WHdQ?=
 =?utf-8?B?YTRCcFRuZDFPUEhvK3AyZ3k2QitRaUlrTnVaZjl5SENGME5OVFVoczlkRHZG?=
 =?utf-8?B?MURiZEExZnVOM0lDSFlEQzl5VVo4dGZaaFdQMzJLWFFZZ1MyVG5YMXdtM2Nr?=
 =?utf-8?B?MktyNkhKeldoRVQ2REplcnVCQWFmbHhoN3I4eitzR1Q3YWp3MWxQekNYZTZM?=
 =?utf-8?B?VDQ5b2o2M1dsVmVtKzNyNUIyMlJlRklEUmFydVB2MHZMNGI0TUp0ZHE3NDdn?=
 =?utf-8?B?emh5V0dWSnNlODcyQW4zMDA4MXBYbXdqZ003Tyt3N0JCNzhWWVJhd1lGWGhh?=
 =?utf-8?B?YjJXQ01mbE15V3MyTGdIdktodEJHbS9jaE5YcWFTS2xpazNGTnllTG5CUU5M?=
 =?utf-8?B?enNzSEVCaUpBSmRCM0RyekZ4bXppRlNNeTlENVN0MmJMVzhFQ1dHY1ZNR1hk?=
 =?utf-8?B?WEt0TEtoTm9PTFV0WEpKSTUzTG5OaWt0bFBwMVNENW8yNHloY21HclFtUi9x?=
 =?utf-8?B?V0VNbTZaTU02QzhDankyU05QM3VqSERpc1I2eGtRMU9NS0pnL2NDTG9LSDFC?=
 =?utf-8?B?b3VVNUVjMVBqVlZUN2MvYzhpNGEraElMbGVhZFhkdHd0UGhJWkJxWHZVSlla?=
 =?utf-8?B?aXJOUTlKbGt5RURPZlVaZGxGYm1jeGVqZGVCNVErTEhHNDlpMFRBUEc4S3RN?=
 =?utf-8?B?Y1N6YUQrV2UrRm1ZaXByOGxPekVMOWFwdTZzNUJETGVLTmJQU1ViZ3AweFdU?=
 =?utf-8?Q?f14BKlUL0faAVZcJbys30wNPrmVKHGCE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkRxdFpoVXFQSHZ0SGMrd0U0NEZCRlVKRGZCM1hsTzJrSjd2Z1N6MzIxcVMz?=
 =?utf-8?B?c2taNWRqaWhGQkdoZ2xsN29wZjA0YlJoUkhXcjRXYkovN2JVNHdMQTlvbHhK?=
 =?utf-8?B?S0xxK3phWUk4b3ptZnZKOFg0a2FPdGZrbGJsZFNPRCtYL04vR0x4WElQaHdC?=
 =?utf-8?B?R1dGZTk0aHo4R0l3S1JUUTVGN2hVZXZXTTRETHR3eWk5SmtMMEYyak9NOFZG?=
 =?utf-8?B?c1pFRGc3eE0zOXl0MjJEOUU1Mm9FRXJYRzNjY1BKdjhvazcwemhPcEs2MFpS?=
 =?utf-8?B?cjgvRHp5Ky9KdHRQbUxGVm1OUlhOWCs3c3JTMFdEbW5xN2xMOU55cDNmT3VU?=
 =?utf-8?B?dVRpMWRhL2x6b0U1WGJkMnZwS2orS3k2bEdNVGs4ZFN0bGVyMlpiR1A2MFc2?=
 =?utf-8?B?d2hYUVMwZE93SEt5NVRLZlZxU1BlaTZTcFBOWUNlMDc4bTVvRGpSd3dqb0NM?=
 =?utf-8?B?cUYzN0RZM0VRZHdteXVweVcrREcvNXhQSmU5TWZrOHdSdmNVNHZBdzVjYjhB?=
 =?utf-8?B?SXZaVTBjUzJhTnM2cldUc1dXWlFEbjFiVEg4ODdRQ0E2YlNhKzdscjUwZDU0?=
 =?utf-8?B?UXNOUi9FeTVDQW1CYVN4QytBclpxbm9EVGVQMFMwNDQrQmRxMmw5RU5yZlhV?=
 =?utf-8?B?ZStHaDFXaWJSWjM2dm4rR1FCU3JRY0JuVmxUa0p1LzJsb1RrOW1mNUNVMXhZ?=
 =?utf-8?B?a3djMDM0Mm5qekNqMHRvd1ZvUWozRmFzQkk1dENlNFNaMm1TM3AxcGUrWE5q?=
 =?utf-8?B?T1NtNWcrYzBORWdlN093M3NMbzhSa1VWMWNxK3lHL0JGSGxLR3l5Mmw3SzhL?=
 =?utf-8?B?dnlRU2dBcUFKUmJSV0o1L0ZXenhMdjY2S3hmcW9BdmlSZnRwRXRkQSt6RCtW?=
 =?utf-8?B?Q2xHTWFmUlpPb2ZRd1BYRm52TS9pUVNpUVV2M3VMNGh4dVlGZ09wbE9JMWVQ?=
 =?utf-8?B?RHRuQ1J5TFJEYWFiK21lODRDdjBqdGphMnV2cWhMZXNUVGNCN2cxczg0WkRF?=
 =?utf-8?B?T2EwTWR0UHZrUjhKRmErTGpxSXJvSXVIajhjL2dibm1RMVM3S0xlL3RHVmFa?=
 =?utf-8?B?UjFHeWlsTVFJQWVBMjR0NkhPTUd2QlFFeFl0UGg3bkQ1QjZpOWVPOXdFU3Fv?=
 =?utf-8?B?U2FJQTZwSHhyMmxWYWZIVkhqamxucFdtMUh3OU05RkNOZjdrZXFJRGc4N041?=
 =?utf-8?B?UTJXRGt3aitlOEZoRTJjTHZmb0hXMGVvbEVJR2ZvY2FwQjBpQkwyUjNidlNp?=
 =?utf-8?B?ZlRnc3VVbW9CUW1ZOTJtdUNxNE5wLzJ1eWJ5S0t1RU0rTE1pbTNOblBBWVRO?=
 =?utf-8?B?SDBpeUpLTmgwOTZzK0o0eUNkTS95UXg3VjVjOFdpOERNWXB4N0k4K0NzVHNi?=
 =?utf-8?B?NkN0TUFTSXdYNDk3ckc2MWk0cEwzK1VxWDREWWZRdlJQdXB2d0tNVGpaWXQr?=
 =?utf-8?B?K1dKTVQxUmNRWnd5aGxJdFUzMkxla0xDbS9oRnFLMmwvbHRsTHh1R1Y1SlNI?=
 =?utf-8?B?SWo3MGZYeUhnaG4vTWloaDI4a2xmS3dHdFBROFl3d0pKZlY5UCszdFBXODcz?=
 =?utf-8?B?MXRjQWR1U3ExeS80VnNIUWFTMGkzcnU1c3lGQWJNYU5pV29Rd0VyMi9CeEw5?=
 =?utf-8?B?a3NaZTB0dGxYTjNSVFdUekpqR3FpSnpIeEZsR096NW4wK2J2MWNNRmExdmV1?=
 =?utf-8?B?ejdxYW5zczY5SDVxYStjRTNyNE45Wlp4cWRjZUZvVUpURm9tcDRxZGxFN0VO?=
 =?utf-8?B?TEE5THdrQVpST2RVU1lDZGhHVlNUOHM2bUQ5WG5hZWFTMlJPMEtyOVh6alVx?=
 =?utf-8?B?c0M0OVR5YWVPb21GdlFSMTlwSU1CZHhIQlVUaW1HVTFjMTVRNTR6VlFHanJN?=
 =?utf-8?B?ZDNjeFM2TTlrcGJSbTZwVjMvOE9zY0RiN3lOeUZVZk9zbk5nY2RBeFU3Tnpr?=
 =?utf-8?B?RHNIM3FRZ2hXRWhkWW8yRnpWdmQzaDF1RXV1YzdpV0ZSVzBidEF0dXg3S28r?=
 =?utf-8?B?RTYwQ0NhNTFEUFQ4c2tXWE8zRUVickppeXFIRysrVVpSVEg1K09SeERwRkpP?=
 =?utf-8?B?N2V3WWhkTjlyM2VqSEJPbGcxVTBNNW5DTG4rQnRPbVRua1p0RmhEU08zUHNk?=
 =?utf-8?B?SGl3NzJwNXRDanBiMDl4UFhTUVRLTFVQbU1EZDUvVmpuOER0c1BUQTc0UzlY?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ce761f-f1b8-4b16-e5aa-08de2859d745
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:25:46.3589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgLiGbvsIjcN59FkonjDI/pt1ylmFOWXWp9z/SwSG9B31bhVUiWYQOoFcuC2o75m7GegPWtiBRKwG1k7GCJ4MREuezSbm9474O5SZnF/zkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6561

On 20/11/2025 12:11 pm, Jan Beulich wrote:
> On 20.11.2025 12:51, Andrew Cooper wrote:
>> On 19/11/2025 10:50 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>>> @@ -110,13 +110,13 @@ static void __init mcheck_intel_therm_in
>>>  }
>>>  
>>>  /* P4/Xeon Thermal regulation detect and init */
>>> -static void intel_init_thermal(struct cpuinfo_x86 *c)
>>> +static void intel_init_thermal(const struct cpuinfo_x86 *c, bool bsp)
>>>  {
>>>      uint64_t msr_content;
>>>      uint32_t val;
>>>      int tm2 = 0;
>>>      unsigned int cpu = smp_processor_id();
>>> -    static uint8_t thermal_apic_vector;
>>> +    static uint8_t __ro_after_init thermal_apic_vector;
>>>  
>>>      if ( !intel_thermal_supported(c) )
>>>          return; /* -ENODEV */
>>> @@ -160,7 +160,8 @@ static void intel_init_thermal(struct cp
>>>          return; /* -EBUSY */
>>>      }
>>>  
>>> -    alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
>>> +    if ( bsp )
>>> +        alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
>> We really don't want both c and bsp passed in.  That can only go wrong.
>>
>> Furthermore, this function has 2 other examples generating bsp locally.
>>
>> The function is in desperate need of cleanup (MSRs, variable and
>> constant names), but right now this makes it worse.
>>
>> Please either use c == &boot_cpu_data, and I'll do some cleanup later,
>> or generate bsp = c == &boot_cpu_data and fix up all users in the function.
> No, throughout mce/ this won't work as long as acpi/power.c:enter_state() has
>
>     mcheck_init(&boot_cpu_data, false);

How's not not already broken then?  As said, intel_init_thermal() is
already using c == &boot_cpu_data.

This patch introduces a conflicting idea of bsp in this function, and
that's what I really want to avoid.

This looks like it wants splitting properly as {bsp,percpu}_init_$FOO()
like we have elsewhere.

~Andrew

