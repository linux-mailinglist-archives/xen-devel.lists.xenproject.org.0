Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3FCB388B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 17:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183079.1505864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNTC-00068R-91; Wed, 10 Dec 2025 16:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183079.1505864; Wed, 10 Dec 2025 16:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTNTC-00066Z-5m; Wed, 10 Dec 2025 16:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1183079;
 Wed, 10 Dec 2025 16:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyob=6Q=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTNTA-00066S-4Z
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 16:55:16 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe9e4892-d5e8-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 17:55:14 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6439.namprd03.prod.outlook.com (2603:10b6:a03:38d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 16:55:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 16:55:08 +0000
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
X-Inumbo-ID: fe9e4892-d5e8-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMJT93tjh6kxGaWoCQ2Bz6l4grSC5QWWrdL/I5krRjGlae2QXMafJtq3q/apGQfOpXQWfzD0zAWsvVoNm5LdFIFd+4g7s8rDXqaODb0RCS/B/FjrWRokjY/KJiuJv4Ec4AaqwBqpR2/cs7JJzAzaE3dZnXTIRQ54TeGbbs/xMq4YOFbJxfRkztqqzay1v4b3k5vdvTFV0UoHkvuA7L95lU795p9KWykCc341s1cLxsb28rkbdW2u7iQHDVNxm7GiueZT4xXT8CIoDJhr+gZgziPA7j61PCw07uImfGUeEEV+r9yor9iqQdWxzAH4tbuicODch31qLxIE2t2UO0WTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqQtY9W6SglSmgHSsZ6M6LmLzBE6/OPcVrYp5Oli1MA=;
 b=R//KKTFvCoED8awZKXp3k1a5a+HquHy3RGZxnmke474FV0qYvQhQNrwbxFcDSIAEJlQFDsUgyWJ4FunYVh8ZadzT34iw7Fr7Rpyl7cnIqDd7rTVzQoBwlxnOcu8SIb7PnJr/1xIjfuQ5mLt5e5qNrCxPug0K6gzh7VKc46nSLG11tzFHZuB/HAwcjRIvNyJrnKsigImhmUEmtlohYq66hUHkaxy/AGcI6YDsfHvxa1Zs5U1erX723a4miGpF3Gv9j8MMKh8mUpw7ppmZ4XT1spqZP4Bmd8jpYdrTOnJMTKYKzdy9v3exb6gAeYaCPhFUnp5yG4woSM0EujykxJseUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqQtY9W6SglSmgHSsZ6M6LmLzBE6/OPcVrYp5Oli1MA=;
 b=PM97IAAo93MqhEQKuX+ziVKz4mTHTFvH4tIwcYrDtBZ/RB5yWXvZ/DyAtacThJv8flHL+L/l1nrwPjO16OZ4iF+v2kgKlrbFQAHfeuE8lYkf71PlfdljPvkq0wNZSVBScvw9xv+Ud1y45kUtuotJXg5WjxWpabsU0hwg0n7hf6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
Date: Wed, 10 Dec 2025 16:55:03 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Subject: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251209214728.278949-3-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::32) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b62c92c-098a-4c4b-f97e-08de380cdff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHpHNWJYcFlyZHJTZHhtK3Y1cno5TDFjN0Nlck4rcDVYQ3RVSWYxak5uWEJi?=
 =?utf-8?B?Sm9mRng4QmpFZFlNOGxaaEpkU2VPSHlDNGhkZ0M0QWZNZlZ6R2ZiNWsrK2g1?=
 =?utf-8?B?TlVpeG4wcFl4UVdWYnFMY25lZ0FTZVZCa1g0ak1TcFh5SEhIaFhxMVJXYlBw?=
 =?utf-8?B?N3ZuVnc5OGVPUEE5MUtUVEdsQytSU2x6MXZkUFRFS2FESGs2T1FBUE5xQXJU?=
 =?utf-8?B?WTl1S0FHTzlENlFyR3BpTXd2QmVadkRLczQxOTFqRlBMK0lVNzNCUDRVQlRH?=
 =?utf-8?B?TGVPTmo4V2NKQVZ1cnM0UVFpT3lCTCt1Y0lKbGQ5MFBSbUl6QjVodnJiZGtM?=
 =?utf-8?B?V2VDVG5tMVVQNWRBSDZUYkV4a0h6KysrYnViRjNOcXRIUTcyN2ZkYjU0bEJi?=
 =?utf-8?B?L280TVp0WmNCR09PSFVJdHBITXZVQi9vS2R3SmdHRTF0SEVtSXd3T1pjald3?=
 =?utf-8?B?SlgxQ1NOaFJFeFZ4c2hCbTgyc3hvejZnVGZXcjJKSTFHSFhIY2oraGdEd0lu?=
 =?utf-8?B?L2NNZXg3ZUJRTCtwTVZCV3Qvb3E4VmJGQ1BrQ1I0dVFpMUpaVnNUZUFvSDd2?=
 =?utf-8?B?SjJzSDRyR2VYenZ4cUsxSFBMMWNRWVNaVXR5UUpnSTl2Vk1mZ21oQ2hnV2l5?=
 =?utf-8?B?bFRvSDVsOHhMWElQWUdDMDZCZmJCbVpNa3NydnF2NFNLbjFmUy9CM1drTjVK?=
 =?utf-8?B?L0o3UjYrSmwzQ3BHQWNKUUk1akI3VktJbitBSW9OTytrK2pFY3E1Y2tnZFl0?=
 =?utf-8?B?dXI2TXVkbkllc3RQcVI2K2FjUHBUMHVGekZDZktPdzk2Q3BHdTJpc1BjWG0x?=
 =?utf-8?B?L2ErMTF1bDE4b2hvQTJhcXJkSFc0WkhGUlZYM01KcTkxaDN0a3M5SUNsY0dV?=
 =?utf-8?B?ZlMvMEZvUXo3aVZaU2tsNmwwTWY4UVArSzBqbU1LZzJzSHRkay9FUWJaZFV5?=
 =?utf-8?B?T08vSEZvbHBBUVN1SFN1MEEzejV6d2hXZm80aEFmNExQc3RFUVo0ODRQc0Nu?=
 =?utf-8?B?QmVYZGNTRjJRQnhEZGwyOVRzS2FTbzRvQWk3UzlOWTNOUFdrbmVXYThHT2Zp?=
 =?utf-8?B?MEZFYis1ZjhKZE9iUFRhOW5jdHJXTUJ2cWdnbUdkNENJVnFGMzRpNFZqREw0?=
 =?utf-8?B?TFYwREZqZ0ZmNmhraE41MVdWVkVzMG4zb3BTRzNEd2poQjU2WDFRZ2lGTW5s?=
 =?utf-8?B?OFo0d1IxNExiSG5FMlBvb0E1WjgxNkY2RzR4cDFyQW5kTFgxK1hRNk15RUcz?=
 =?utf-8?B?YUxUaXRHMVM3eUJNSjVLUkFPQlV4dnRqakVwTVhsRWd2NnlTeEhQUFNQU1Ez?=
 =?utf-8?B?NnovamxDeFNZbjlrZXorOVB0enVOaDlabnBkR2NIOEY4TGtzSFNBY1ZhaWda?=
 =?utf-8?B?MnNBbFpCZlVKUWVJYjYzRDlLM1U3QTNXOUU4Wk95elZENFkxSHY2bWdLZjFk?=
 =?utf-8?B?NkxoRnJjUnJUWmQwb3BSeTEwYzZMNzMvbXpmc2NqelhWZWl1NnZ6MFIzcjlT?=
 =?utf-8?B?Yi83bVliN1MwaEhmQityNEx3V0RZZklWMzFvbGVZZkxtbWp4dXJ2SG5kQkJV?=
 =?utf-8?B?Q093cFg3NDlJZDdWem5oL2EyVVQvWFhQWTNPV25EZmZkcTdrb1gvUjJ4Ukpv?=
 =?utf-8?B?TXlvNU9QTXRLbEgzVWUzSGxHTlMzK21VRXpGTWx6VTExMmtCNFhwS2JsTFY5?=
 =?utf-8?B?TFZqcXZJN3NnVTFzZmVrVnM0TlBUUTErNnBZVGsraTBBaUdGZURnQ3YySHll?=
 =?utf-8?B?UGh3cW9XbUNWNGREZjUyTHBPMFk3NmV6Nm5aaXJkTm1abEU1a04xNm5PbjZq?=
 =?utf-8?B?TGh2K2RaT0w3UzZzWFk1bUFndDRtVU1aZi80eFNvdzdOV1UzYVc0aHZ3MkJ3?=
 =?utf-8?B?Yk50YjFXSVFpdU9HZ2FMMk5SYnlvUGc0eVR4Qm4yMVhrMXhqNVRsdE03T0ts?=
 =?utf-8?Q?vVjaqE0vwdc7+yY8o3b4uGRzCjV8JQrw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UytyYmZCWi9ZSVdTQXZXN1oxSmFMMW9oWGs3emdHbVovUzA3N3ZaU0l4dW4r?=
 =?utf-8?B?dGJKcmQrNllEQkVmckVKa2hFY1hmWlVMOWpBb05xbjZPNW41cDZ5MERYRzBn?=
 =?utf-8?B?VTRobnlDallha0JySjRVaG1IZUtDYmwrVWVrYUhESWFoZExyWVY4SXFPS1BQ?=
 =?utf-8?B?aUlud05yemFBRS9WWXlXVkFubXJ2NU5EM1pkZUFqdzBDYjJHZG9UN0liY05q?=
 =?utf-8?B?cUlUeXZhWTFCWS9xVUtkbXgxL2ZYTng5aFdRMVp3Y3E2bjF2Y1VqRDFqd3Fn?=
 =?utf-8?B?U0pHQk1QM2pFWXQ3VkpjbGJGLzB6elI5WURobWZLUERmbVVqVVJzT2tWVS9p?=
 =?utf-8?B?V05aK01OcFg2Zlo2elFDYkx4aTY2T2JEZG9iY0NjTjNTR3g2RWV3bHJ1MGJB?=
 =?utf-8?B?QjNZYjZYVEo3T3AzanpaelhZbFQ5WkJVOGJ5NHJTRE01WmF5YUhLRVJ4bVBG?=
 =?utf-8?B?dHVsQXJvR3hKK0E1UXRsenI5TDB4NHlvTjRiOTJaRHR0NldJS1FNMlVoWFRB?=
 =?utf-8?B?b1NDSngwL3JKamRXRDJKUTVUZGk5TWE0ajdzOG9yKzVIK1BVbFF2MkxWR3JH?=
 =?utf-8?B?Y2FVOVk4cGNBMkNRLzRxZitHa05TaEJVSmZTby9maTBjT3R4Tmo4aVVLc3Y5?=
 =?utf-8?B?d05EVWVZd0NlRTdlZWRRNzlEWk4yQWpJbjU1QVZtZjhJSzlNN0RqcFp6TW1t?=
 =?utf-8?B?Q04xQkxOWWVuK3FuTnhXVXU3Si91MDFCVFc2YmUvOTF0Z0s4QUQraTBaTFFU?=
 =?utf-8?B?T0J6cG0rYy9Dbk5uWk9zQmZjRVU1ZkFiZWxndXRZWG82UmFtL3IxS1Y5WGFG?=
 =?utf-8?B?alBTVzV5Tk5DNDBVeHZWSXVQT1VENUJlWTlXRkZIUTdMallMemY4OXB4b2Vq?=
 =?utf-8?B?SUdsenV1Qm1sVnA0RlVWM2NNdHhRNC8vbGEzeGNxZWdUT056SDY5czhDSnQr?=
 =?utf-8?B?eFpRWXZsbVlFZkl3N2ZmYW5EbDl2OGhucTdWU2o2QnBaUHcyWjcxQTZJTk9U?=
 =?utf-8?B?QWRWUGFtTEFKSzBXbHp3Qk1vR2pzQ3hHdytyT2Y3YXgvb2xNNExndkE2VDR3?=
 =?utf-8?B?WVJJSWVNT2FWeW9Xbmk4RTNDRkkwb3lPenNINzZpcGQwUmhWQ3pzcW9jcWZN?=
 =?utf-8?B?c1o3aGVYUmw5cmRyR3lLbjBVaGJrRWkycUd5ajRkbUwzUjlvdFByWTFWVzZL?=
 =?utf-8?B?aXp0TUVXZWw0am45aVhGYlZjMHlyWHIxL2Rkd1k4Vjc4T2poZXdQOWRZSzY4?=
 =?utf-8?B?LzJhSm55Sk1JWUdKY3FGY0c0MUJtUk9MZlpOTm9oMjgzcHRzcy9JTElVU0ow?=
 =?utf-8?B?SkxRZVl2Qm16aHYxU2Y1T2lCS2xEZGsxZU4xK2JacDVJanQ5MysvUHYvS29T?=
 =?utf-8?B?L3JyN2lvN3AwZkZLY0xKeFB1bklBVFc0aFlHbzIyWXd1YkpGekhwUlNlS2x3?=
 =?utf-8?B?d0Z2VXBIUjZNdll0MGl1SjdWcGs0LzNuWjBPZ0ZkZkdieklVZUlEQkJrMjVS?=
 =?utf-8?B?d21MMUhzOGJCMVcxZDNnRWloZjg2eFdBRVE1NS9id3c4WjZ6UjZDRThIUGR5?=
 =?utf-8?B?cUxBa2I1bUFLOTNieHRnZHNhMVZEcklrL2toeW5tdjFSK3hNU0dDK0piaU9R?=
 =?utf-8?B?Mkk4MkNFSCt5dnZwZk1QOExsWXJqV2lWblF4MnBtZ2dSbnVyL3RUNDhqdTFp?=
 =?utf-8?B?NTNPQlJYVnlwY0g3MmRJTm83T3pQZVZnNStlbjQ3OG9uQjJGS0MyVGdTUlFn?=
 =?utf-8?B?bUh5ZzZ4enlxZkRYd085R3B0UmhuK1p1czlsdTJwdXFpOXZaR0xzRHU5S3d5?=
 =?utf-8?B?bGl5MFVkQnkwMzNiRFErOThvNW9xWVBVbDQ0QWhnSWU1dFZRQjdJcms3TWxF?=
 =?utf-8?B?R1B4V25IOVNQTmdDTFlveEtQNjVDVHdtY2NRbWRjQk5nRUlCZ29LNHRZbjBU?=
 =?utf-8?B?anVlQlppMy8rVXN1QmNXRDdhelhmZnJnNEI3Y2pNblBMZk1VWTBMaXgyTHlV?=
 =?utf-8?B?ZkNYTFBBaVQ4Zkl5RFg3ODI5TERIV1RPOVJSamJRQm0yeHRRSDQvZUQ0VndH?=
 =?utf-8?B?dWMreXZFZURMeS9vcXh2UnJKTVN3bnhuUEJYTmp4ZDZGVTB4a0YxZk4yVUZB?=
 =?utf-8?B?ek1lVXorTllNL1ZBS3hjM1prRW56ckNqbXd4MkNFbjFVVTBRaFN2dFF6Skdp?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b62c92c-098a-4c4b-f97e-08de380cdff3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 16:55:08.1940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PBAmSqpJXJ3nUeS+GcqzVMmaE9EKeOUYSrJBCVEFbZKAHyUeJcF8hLnFwuOaw45RHOEfAhMmY3DVIaH8kgJaozsTyc9SZo1lC/4mhwNciA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6439

On 09/12/2025 9:47 pm, Jason Andryuk wrote:
>         . = ALIGN(4);
>         __alt_instructions = .;
> -       *(.altinstructions)
> +       KEEP(*(.altinstructions))
>         __alt_instructions_end = .;

Thinking about this, what we need is for there to be a reference tied to
the source location, referencing the replacement metadata and
replacement instructions.

Looking at https://maskray.me/blog/2021-02-28-linker-garbage-collection
might be able to do this with .reloc of type none.  In fact,
BFD_RELOC_NONE seems to have been invented for precisely this purpose.

This means that if and only if the source function gets included, so
does the metadata and replacement.

~Andrew

