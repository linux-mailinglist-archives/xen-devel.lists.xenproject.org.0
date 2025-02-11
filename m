Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0EA30F64
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 16:14:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885673.1295485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thry1-00087R-55; Tue, 11 Feb 2025 15:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885673.1295485; Tue, 11 Feb 2025 15:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thry1-00084r-2U; Tue, 11 Feb 2025 15:14:29 +0000
Received: by outflank-mailman (input) for mailman id 885673;
 Tue, 11 Feb 2025 15:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13Uh=VC=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1thrxz-00084Q-9E
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 15:14:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2613::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df15c211-e88a-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 16:14:22 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU7PR03MB10996.eurprd03.prod.outlook.com (2603:10a6:10:5b1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 11 Feb
 2025 15:14:18 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%7]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 15:14:18 +0000
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
X-Inumbo-ID: df15c211-e88a-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R33IvxjS6HQziYXUDc0ayjszOyeNRldkeoyPYDQmqCPTJRYNZaLiibwAXUa8gJCdO7slpm7HQYloWRWqcBpd0yk6NYNNZD3uMBKHmeFVwNVxq0bWZnl8zlbokUw96mrOFmrcbM/su8Wv/TXuGnr3J/+q+FTTEsTQL1P2NymHk9GYsR3kLm0zCNZoGnpePCB6f/QgklvHJ4L4xn1b5/NPAOzmo6mKc8fRFjaJU6K+DnEPYhjLGAaOoWONkXuqq5TSg0BjO+PrEJw3IogYmrRhVBYhlhcblFKxfWa0YvagTo7GxNX+l5lLPgbj3k6cB0vvJr4fr0z1LHhHFhvhJ24jfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq1PPGWo3WTS5hanvL/19/0BsAOccZqedVYvymPfnxs=;
 b=UebLA9LFDlUV3KoDyovlwnQ1VBXbmwKygY4Svu9FWyUAUIeBfyg9t7ly51syZ5BipS/m7rC/L2qDRzVSWMgpfZRDjJga/LRWR7Bkr1PCBwTftqLTSN/w49dMOLmIEcGg4oWKB+DGuAa6VAH1+AtwO6WHpqAXtjkS+p+rShXGJm2yujr3Bm71BDLEwCXFmHuuvyX/hITpXrwEI5ZeFHUXxd7SIDD1ZuGujhB8zYVLY0V1tMSMbRPDnJZgTB2g7SGTuRjg0K16fpAovSmMmWt/ZntSHkYi6U/P08SytKDwZG4ddCNdL66hIPvpdxcTUhG5cYbBAXy/Si6+6A2qm2lR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq1PPGWo3WTS5hanvL/19/0BsAOccZqedVYvymPfnxs=;
 b=MCi/mKhRJLcZYItX4FyhT9iYzgF/wdMKqZWWcedDS7jmGHpt5OqE8UuODDFAg2X2wMKuvDjCruinw6fbBqQNIR0klj15GJPEacxO1+PiAXBZ/ycse2FV683bzUu0tv7+4IpfRRdUcAS63g1xNGHGkFtnE7Hnpq/ccWGrRp1vxAPnm5AlH+csb4UPmfRygWYMTy6d/R4XmlZgdx5fH+Ps0jcHbBmpA3vdzLC8g8PjjdpF6CONVRj4IC+XPW7ic858K2+dvv6VfcrjHmksIuMJgIPGTMSEBUgx/3TbMBlQKrWiPSeP2/ojj7eioe+VVLgDS49tqstE7xUuzXyI0kHPXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <dece6a9e-21c6-4f2e-ba53-337c5855f88d@epam.com>
Date: Tue, 11 Feb 2025 17:14:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: optimize dt_device_for_passthrough()
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250211111853.2199764-1-grygorii_strashko@epam.com>
 <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
 <e1c5fcb3-4647-483f-b600-deae9f68da78@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <e1c5fcb3-4647-483f-b600-deae9f68da78@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU7PR03MB10996:EE_
X-MS-Office365-Filtering-Correlation-Id: 590e18bf-3b38-4bb7-b816-08dd4aaec0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGs0anl3NURNUVh6ZjdmYkdDTithSGVXNVpTVlJFRTU5NXVUQXkzcU43Zkp0?=
 =?utf-8?B?S2lVVytIMkNnZjFhdjhHSFBNN3lDRjZ0SGw4WUphN3VqL2ZYTDFTMVpwVXgr?=
 =?utf-8?B?QlNKRzFJeWJRdSt5SDkzcUtGK0cxc29sd1hLUWJPNDFmdHI0Yng1U1haUWJl?=
 =?utf-8?B?R0VPbzBRRHZLTGF0N3FJY1V0NlhBTGhwbU1PNlZjaVZkYzBWL3V2bjUrWWV6?=
 =?utf-8?B?UUdGU3h0czV0UithUlhmSEJ1cjZqU2NLTnpSdDFnRHhkdUxVaUJjd1d1em0x?=
 =?utf-8?B?eXk5Vmkyam4zc1FNY3VROFAwelpDU2ZDNGxHRjNLY0lWcmdYUjVFWkJEZ3Zr?=
 =?utf-8?B?S21iNFYwNWZKMEpGbWlIbzNMckJmZmR5am42bi9jR0oydzh4SjBPUWFsWitx?=
 =?utf-8?B?alhpSFNwOTFKdzNDb2N2OURrTzUra1gwQTFOMjA3L0FlelJodnhJOTVPRUlp?=
 =?utf-8?B?SE4rVzE3MmNmQ0ZEU2QvUitJdWUzV1pRVC9tR3I1ZWJ2bytrWmdoZ0w2SUlF?=
 =?utf-8?B?L3JIZlRFWDJrZURSOXJiVDZFRmI3aTU1VzJha1IxUkVvUFZEdk03UTRMS3hn?=
 =?utf-8?B?SGpveFYxM3BmclBWdS9rdXpPdXZacDZxK1ZJNGc1c0ZNcjhiTEhvVm8zeGlY?=
 =?utf-8?B?ZVZmdmkvTlp0ZTBqdGxnbngrRmpVTHFuM3Rqakh2MFloTkVCQ3N1S2ZLcWIw?=
 =?utf-8?B?QkNHN2M2MnVWZitnSzFrM1lucGlqc0NPSFp0ZTJ6NEtWVGxCN3FNLzZXSndS?=
 =?utf-8?B?L2p1U3d5QXVobUpCQmcrOFVUWFg5UWo0NUJSK29HMlpmR0FMcTZWOG83ZEVM?=
 =?utf-8?B?ZWQrODJzMy91WEx1TXZGR3Q4N09hNGc5YWJSZkZZVEhnUFpjSFdnS2hEWTVz?=
 =?utf-8?B?Ym9TUmxzaTEvZTNWMmJGNkI1cDJmY3NPNncvdW02Y0wvNVdwL2tPWGxIdnN0?=
 =?utf-8?B?VjN3bDR3SllNVGZkUEk2SWZLOC8xbzVsN0JJVlAyNHRWSmpLVW5EQ3hMMXUy?=
 =?utf-8?B?SHNCdmp1RE9Rbzg0RlRweUFNek0xdmFKOElPOGhFRmVoNUt3eG9LaHUyT3ZD?=
 =?utf-8?B?NWxKOGwrUitwT3dzSndySlNHbExYZGNPRzRoazI1TmUvcVBrSCszRlN5dEI5?=
 =?utf-8?B?TzVPVjdrVE1LelJaZ1pJa3Z5NWN5QWFLeDZoL01oRXZkZm1VTG0xWWhmOVd3?=
 =?utf-8?B?bUYzSVZKOUF1YjEzaS9pbkdMclZ4OENDMmFiSkMvaFhKOHhreUdYUzByL2xY?=
 =?utf-8?B?K3MxemJxdVIrYVRiVzRXc05QZU9Nc3NvOFVBN0ZlS0tTUlpxZThQK0ZEbWdp?=
 =?utf-8?B?dXFoSktoNnZwS1VMYmJWYVAvekdpTkRsUmErL1kvOGZUYUlRb0ZPMlBna3lE?=
 =?utf-8?B?dktHMDFGcHR2RU83TEZMUHNadVQ0aVhQQ1kyRVdqWXY0RXhpK2YrTW5nWmlh?=
 =?utf-8?B?UDhoYk5GN3ZZMXRrSmVmc3A0andCSFQyTFB3YWR1QmVqNlltZDQxaC9vL215?=
 =?utf-8?B?NEgvMDN3cWlraUpuOVBZazBtZDhjM2pnU1NSUi9LaWdhdGJJejZvbVVmdGg5?=
 =?utf-8?B?ZUxZU1pUSHNwRTZoNnZaVXlxQ0x5Uytta2dxeittWHNqVkRXSWVSYXorYnY0?=
 =?utf-8?B?aGRUT2RZM3VXck01eHVMNkFLaFJpY2ZoZy9sYkNERllwNXVGaTBDdkZtVXhL?=
 =?utf-8?B?S0ZrcThCSXRVaTY3RElvYlRzQUoweXZPN0FTaEJONmsvbThkeGdOelduRG9x?=
 =?utf-8?B?bmZld0E3TG1zZW5mWld4NUV5amovRmJmMG5mR2ZDeit6RVdDUTRsRTNwUlpS?=
 =?utf-8?B?TWdHazVaRE9CeWRVOVVvU2kwdnJrbU1hMnQ1blNXdFUrS0JCWDM4cTNyU1B6?=
 =?utf-8?Q?G6UJPk61DJvpD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ynd2OVV4bThFWUQwUEtjcDM2blFwdUVYZmFuandiSGxob2RWNU5iRXNLZTEy?=
 =?utf-8?B?ZWNoSFAzUVo0M1pua2MvRUd1bnNRUGptMXIzZWVPT0hxdzJDSVUrSHozTEEz?=
 =?utf-8?B?WkxCWWlBbFE4ZWttODN6bVhQSE1CaW1YMnFQdzh2U3dONDVJUndaajlpYTh1?=
 =?utf-8?B?ZDFLd1JFeGlRcXZLOTRyRVpKOVRYZzV6UWZxWGhHMnVaRnR5RVVWcnFQWGw4?=
 =?utf-8?B?QklIbFhKbHFtSkVHS3BOZ2t1MVhnWWZVTmFrcXFvTnVFRk85OTI0QlV5UHp3?=
 =?utf-8?B?cTNEcVlCZFZwa2V6d3ZXSmVJQUVSQXFHbGwwaytrRlk2WXhuWUt5SGZZNm5h?=
 =?utf-8?B?RzdoY21WejNxSjcxR0xUQ3c3dWVYTU9kZG9zcW16Wks4azJzWi93cUhxK2VS?=
 =?utf-8?B?RUhMNy91b3BpMmozbHBJRFJ4L3QrcGNoZUIwNzhWcXFvZkVTRXR5VktBQXFN?=
 =?utf-8?B?QVFzWUFQYVBkRlY3SnJtWXloTlJjNThlc1cycHdPcjBtRmIzRXdRUUpGYitV?=
 =?utf-8?B?Z2RndlR2Vi83ZitTc1h6VG4xb2FLb1g0SUVERlBRU29JNmE0VHBmQjVZMVUw?=
 =?utf-8?B?UE4rTXJrVDdwTWZoN0ljMHg1NGNHSTlHRExySjZyUExobW53Yy9vbDdNbzQz?=
 =?utf-8?B?WlQ2dFV0Vjlnc085aDBLQjNaUU1reG9jT05JY0RPTEFRb3NnczdiTk04SzdD?=
 =?utf-8?B?YmQ4bVBhN21XeWtnZDd4ZVgybXR5b0dxVTRuL0xnanB4K3hpVHFsTTJmZkY4?=
 =?utf-8?B?M0lPMXMwYy9qa1ZHaXR4NmhTSFc4eEJ4c3FIQ3kzS0FSdmp4eUlzRDV0RzR2?=
 =?utf-8?B?a0RXdzlKRTBCN0Z1bXZzeHp3UVY5Lzg3M2l6UkpZMVBqK0M2eGVBaFdKY3c2?=
 =?utf-8?B?d2NhakI0OG52QndPV1VwWHh0bGZJL1dKblB6dFA4RXczOXNwVkVtVDYybGFx?=
 =?utf-8?B?Mm9KWXhLUFdJbnJ3aHVzNW1ZdVE2YXRodjRlN0hXS3lNSUlEYVZzalRWZHlJ?=
 =?utf-8?B?UzJLQnVBbGxSWVhRWDF6d08zMnEyZVlkRGdnNXBWQ1RnOTBYd3lSZllBSEZR?=
 =?utf-8?B?NkpDUXVoS1pGVGJoS3BZcU9PZ3dzNHhBWFNqM2g5ZSs2OUNIeXc3emkyc2Ix?=
 =?utf-8?B?TFViZUR6Nit1dTBrRUxmellHS2oyRVViZTk4NWt5SFlsTVUzbnlYcCthdmYy?=
 =?utf-8?B?SUFtNGovcHVKcVRES2JiaVhYU3hnVnZNUlRUTDVrQ2JUeW1FdEN6Zk8xcVNG?=
 =?utf-8?B?MEh4UWZ3QWkrUmU1Tkx0TzYrY0NIYXNRcWo0U2h0NmVXQmtMYlh1ZjFLcUsv?=
 =?utf-8?B?by8wZEFkamp4Y1puTExBT3lCeEd5TUxFOVZUbjNrM3FVVGFtM0tOd0E4ME0x?=
 =?utf-8?B?eUptTG9GMzBBTkFlUTNjQXN2VkRuWjkxMFFsM3E4OGdJT1FnQmtTRUZwczIw?=
 =?utf-8?B?ekYzdTkzRXpJTHQvWmltMjdMZlJUdXdiMGlObEx5OGhhQkJDTCtWWk94eWV5?=
 =?utf-8?B?NG8xM2VLVkRVN2dBSWdsczJRNlpZbVlqVUo2L1F3TTE2eUt4Vk1oOGlxbGg2?=
 =?utf-8?B?SHlYQmFIOGdBV0ZndWdiOVZGeTZ6aDhoQmRIYWVzTjgxdGxUOUFCUmtWVElR?=
 =?utf-8?B?eXd1QVZVT05qNWZvMkFtMTJmU0VPNWxnSjR5NS9VYTJqZTl0YTJzTzZ1aUor?=
 =?utf-8?B?NXAyV1IzN2NTYzRxc25KSWhET1cxY3lxNTNFSTZLcWw5UlZpV2dJZ0tYYjlk?=
 =?utf-8?B?Z0JIWjZ6OCt4N0FPME1SYnNlSFN0R2cwVG1HSTVDTURNSGNxeENmeEFvY0dZ?=
 =?utf-8?B?VTdDSlFYeXVZdWdISFlnMTZFZUNYbjlzR2Z2ekRpUzFpNlI1TWE4RndXYnRo?=
 =?utf-8?B?Z0QzWVJGWHZubXVYL29TS1NGWlR0VmNzUm82UzlSK2ZSbFg2aXFUY2NVdEhk?=
 =?utf-8?B?QmZEbGs5OWRyRXNUejBVTXFXV3YrcTYxVkRCWlJkM3ZmQ0dESjR1cStPSjZG?=
 =?utf-8?B?Sndsa2JmVGdjcVoycG1ycURJNDBtWU81NXJtRlBuY3ZPVG9GT2gxQ3lVNVdn?=
 =?utf-8?B?Uy9mRThzWG5WVEt2ZUlkblNSckREMGhzNDZhRDdsZ1h1M3cvSzdCZHRkSnZY?=
 =?utf-8?B?NXVNU3ZzMjZBRDJRV0ZqWHgyQXFwOFlKanU1NFZQWDR4KzJHQWpsWDg4MndR?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590e18bf-3b38-4bb7-b816-08dd4aaec0f7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:14:18.0245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YYkCSWqEop+jpLvdcfDHFBSzEGjZV6VQVsYpUqwuB8Sus2A1CU4+D7lRBrexOevTwUoWw/9onHnhJMheFLiLxbFy6By7vwDj17xfvGj5dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR03MB10996



On 11.02.25 14:32, Julien Grall wrote:
> 
> 
> On 11/02/2025 11:57, Orzel, Michal wrote:
>> On 11/02/2025 12:18, Grygorii Strashko wrote:
>>>
>>>
>>> The dt_device_for_passthrough() is called many times during Xen
>>> initialization and Dom0 creation. On every call it traverses struct
>>> dt_device_node properties list and compares compares properties name with
>> double "compares"

10x

>>
>>> "xen,passthrough" which is runtime overhead. This can be optimized by
>> Are you sure? Looking at the calls, it's almost only used at boot except for dt
>> overlay.
>>
>>> marking dt_device_node as passthrough while unflattening DT.
>>>
>>> This patch introduced new struct dt_device_node property "is_passthrough"
>>> which is filled if "xen,passthrough" property is present while unflattening
>>> DT and dt_device_for_passthrough() just return it's value.
>> In the past we were skeptical about adding new fields to the dt_device_node
>> structure for use cases like this one. I would say this optimization is not
>> worth it. Also, why would you optimize dt_device_for_passthrough but not
>> e.g. dt_device_is_available.
> 
> So we are trading speed with memory usage. It looks like we may be using a padding, although I didn't check whether the existing structure could be packed...

Actually I see it consumes nothing due to alignments:
- before sizeof(dt_device_node)=144
- after sizeof(dt_device_node)=144

But it could be made bool is_passthrough:1; together with other bools, and probably moved at the end of struct dt_device_node.

By the way, below diff can save 8 bytes on arm64 per struct dt_device_node.

> 
>>
>> You can check with other Arm maintainers.
> 
> Before forging an opinion, I'd like to see some numbers showing the performance improvement. Also, is this impacting only boot?

Sry, indeed only boot, need to be more specific.

My DT: ~700 nodes
Number of calls till the end of create_dom0():
(XEN) =============== dt_device_for_passthrough=2684 dt_device_is_available=1429.

I've enabled console_timestamps=boot and did 5 boots and calculated average - it gives ~20 microseconds improvement.


> 
> Also, I agree with Michal, if this is a concern for dt_device_device_for_passthrough(). Then it would be a concern for a few others calls using dt_find_property(). Are you going to modify all of them?

I follow the rule one patch one functional change. Regarding further optimization - I think only generic properties can be optimized and personally I see now only "xen,passthrough" and may be "status".

Ok. 20 microseconds. it's probably more like a measurement error margin.
Please advice if i should continue or drop?

Thank you for you comments.
-grygorii


---
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 96001d5b7843..0448cc297445 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -81,8 +81,8 @@ struct dt_property {
  struct dt_device_node {
      const char *name;
      const char *type;
-    dt_phandle phandle;
      char *full_name;
+    dt_phandle phandle;
      domid_t used_by; /* By default it's used by dom0 */
  
      struct dt_property *properties;

