Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F4BC9B48
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 17:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140727.1475521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6sGO-0007xO-Fx; Thu, 09 Oct 2025 15:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140727.1475521; Thu, 09 Oct 2025 15:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6sGO-0007uH-CL; Thu, 09 Oct 2025 15:09:04 +0000
Received: by outflank-mailman (input) for mailman id 1140727;
 Thu, 09 Oct 2025 15:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZ0Z=4S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v6sGM-0007uB-Tu
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 15:09:03 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e11a34c7-a521-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 17:08:57 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM7PR03MB6264.eurprd03.prod.outlook.com (2603:10a6:20b:13d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 15:08:54 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 15:08:54 +0000
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
X-Inumbo-ID: e11a34c7-a521-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwXgqWwmlTo+90fCUr2BpyBvC6nZqUM8k5SyPsXsX92rRCZnf6dT62PBCJADmAn71PGVcQ5SHUWbWLfYtfDPfV9RmPEV09s76p+Ep9c1pVxMHkqyVpZ60hBxohj/iZK69eklVoVO7Yldpaze8yX0+MNTgZQ9SxGOtY4vDHVk/IiQ+P9JVmmvTyyW9otJxZWSMGl2RT7ZLh2qZad35VgmtrxHI63esWUwAyHOMvdRPu/R1gS0NR+0OLANTN6CzFQP9iLUVuuDH70/BnvkiwyR4XqxuOK5fU6PbIuyYqkvp6cct3RzaaMihIEpjeSu9LOInAYcG8Aul7U11n0y/9RkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+ZnWhBnPhoaERxLlSoey1UrdzaQnPrdVH0KYsdMm2w=;
 b=tk11aFrlag+/BLqTMKN9FV+rCM+dTmsiCqWNcEq6kP6MD24YlXAHPdPqn8vqF4LpE9iRn3KDwnQJObL3ZB0Jj3eL/bVvPFV8rDWQsnF6CwS/XOdH3dVZgXiEDC/PvHYf7RrhKFs7iHQ4j/BsWHifkqhF5rtAUKFLyZaMtsZU42wJ6XVTGf1vY8VDSaoExtbc6sAPw0rhJWuTtlQatkqIeqOxowJbv0Kpw251T3hve5M1U579WGZqrqZWpA8K+bnpfM9EIa1S2nalwPZrN4Y+g9De3nn9CqPrqv53VCAa2zm5bYNIk3ugPZwzZtIUezEqq23oNPWPPb4DHN3DuEA7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+ZnWhBnPhoaERxLlSoey1UrdzaQnPrdVH0KYsdMm2w=;
 b=ndXSUL0UL9rZcpPTppPp+RqCClRg5Rq+J4mrb/wyEtDVaZDqBf2JLL5K1EkhsQEReuyS8uQ0/ZS8SnaYHiXGiOMe896e3UvbxE/Qmc8ZbdGK4XcOp7w6C3NWskbPJac40P1UazFR4Oa3wHHT89e2UguoaPklzqw9s1nfyuY3Em7gFX2noBwfMw5lAlPdW3Z55F+6l1JZiQxrVBhm6Ww/klRfzc8qrw9QBenUe5YdEsHaUJcdMDOc6B8andMU/HHX/86Do4LC0TxHeRUDQHdvk7qL1DAohnurHujo8krFQnAiS2eRgkkzjIyjyf680HJbqv7pIxo9e0Ec50NeNLDhAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4477b803-4941-4032-be83-85cc126ceacb@epam.com>
Date: Thu, 9 Oct 2025 18:08:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 3/3] x86/vLAPIC: properly support the CMCI LVT
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <61a05ec1-aca7-4c3f-be6f-1bb053b2cd00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM7PR03MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: ff663ce3-5a0f-44f3-47a8-08de0745c34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmdBU1NwaE9jYXloM1FlUkVrQmY5WmkrQ3NaU1RhWGNlSEpWTDdERjZoWUlT?=
 =?utf-8?B?blYwWWZhL1pkNXZTay9wSzhuaHlHSnVvVWZwelgrMGlsbnJMd29lK1JuRlRX?=
 =?utf-8?B?WmxDL2ZsMGU3cG9OTGhHZFQ4TnFaNU1xdkgrZ1dVWTh4ZU9XVFY3dUFqemZV?=
 =?utf-8?B?K1RCbEZIdk10ZVAzVjBWSHEwQVZYVW1STXNQRnVSZ0RmMGxlL1VwRWJ1aTVM?=
 =?utf-8?B?bldpNTUzQnJNUTRZQU9aNFkxVGVITHdvOTJXRDRhZ1Q2SVBrSVZFZGJNa2Q5?=
 =?utf-8?B?bmRFUklqSmJFYXVyUE9MTVdTNXFYZm84KzI1U3d1Z2lNTlRKYnpWODlDektU?=
 =?utf-8?B?UE90cVdxbnNSV0pIbEpEdXNwbVBxc0tXM3d4UkYzbmM3ZHoyVlBCbnZkdGxR?=
 =?utf-8?B?cnZwMzFvNHVSaDBMMGhNeUorMzhLZk1HK0Y4OUdoOHAvZ05UdVhTU2JxQUI3?=
 =?utf-8?B?SmZNaEJ1Q3FlbFc1dnhUSFBZT1E4Q3VHeFVXeGwzejlhWmk1cmRLdkJQc010?=
 =?utf-8?B?dlliUEJOMW9LeU0zT3R4M21qMkhXMUVPTWdmSSt6aGxzSHd0aVZmUVM5UC9H?=
 =?utf-8?B?RUdsSHdpOGpmMzkzUUhjblF6ZEJUd1QvNEdHcWRBTEZjV05qbkJpNURzV1dG?=
 =?utf-8?B?SDNHOEtWTzhUdHRYSEdFZElkQWsxYXl6KzZoYkU3WWtvV0lmOW5Xbk5lSFBv?=
 =?utf-8?B?ZUhHT3pEcWxnc1FXNkNOZmZUYXR0SXJ4YWVZUFBGUXhyd2dZcXduNGZ3bnNV?=
 =?utf-8?B?d1pvNlNheGNvQ2IrV2MwNlphWFNXUWRrcXY0RVFDVE5xNW9wbnlmTm42SVdS?=
 =?utf-8?B?OURIYm5SUU9kRHQrZHhmcWF2Q0VqWWpua0h3cWF0c1JGNXFiZS95SDV1ckdJ?=
 =?utf-8?B?R3JpRkgvZ2lxOGU4bFpKN2hMU2FTYUk3VEczVVF2cFpLQmM3N015aWF1WEZT?=
 =?utf-8?B?MWsxODJDY1lZTzdyZUtIZE9zTmRCNmkvWkhGOXJzNjQ3aWR4eXRWRDBEVnpL?=
 =?utf-8?B?UTV6dzZqcXZuZUJXbnNtVjI1S1lRb3YzWDUvQmtVM0E5VWtkaml2MUhaLzdh?=
 =?utf-8?B?UGxPTEovdy91dVJRRUNKUis1QitFS25SOFBTOHJuM093VjIxWGRVbk52NjB5?=
 =?utf-8?B?NUxmYW1sbWZNUWZES0N4cEZyTzBITVlab1dybGRBUU5BOVdLVGhaQTh4bnhJ?=
 =?utf-8?B?MUx4NE1xRkJUR3F5UUhPWDVORjUyYTdCQzgvaWVWZGRXZU9iVnhHQldrdzVF?=
 =?utf-8?B?SWQ2T3hXMDBlUVBGWDVDU3JIdjczUWFxVTIwTzhPVzhQeDB0YVRXYjNwWjEz?=
 =?utf-8?B?Z1ZYc2lRL2t6Tjh2RkpqdUJyd2NFdms5WmtzNEV1UVU4WlAwbUdqU2pRWGt2?=
 =?utf-8?B?RG10cUVuYTI3Y21NeDhKaFVLOWpZMmwwQjJJenI5N2VMZ3lLeVloRk55TUk0?=
 =?utf-8?B?Ujl6WGRNS2YwNHZBZUgyZzdsQk5IeXdCV0V4U3lZTFFCN3paZVcrRW95aHJk?=
 =?utf-8?B?L1pmdEtzb2lOQ0FuSEt1YW5qdGtiQWRTRWpNK2JaWGR2WHN6NGdtSE5EcHRn?=
 =?utf-8?B?SXBiNG9PUjJ2ajNFQ1VUaGcwdzlNQk9EVVdLbTMzb1o2S1dvMWdQOEJFRFB2?=
 =?utf-8?B?SUlmVkk5a3k0blU1MGRTa3hvWDU2MTZhOVM1eEh4VWcrWUlILzVtTXpvSEEv?=
 =?utf-8?B?N3lXb2pxa1Vsb3hXZlhMSmdjcWNsYzlrVllHQUt4NlFhQzBxYzVNYlA2RU1U?=
 =?utf-8?B?dnJWVHBPY1duVmpQOTJMcWN5ajNhcVdLNkpYamNDYXlOeHBEYlIzdjFrOWYv?=
 =?utf-8?B?MnJudGVUYTVlcUlLK1o2UjFGVkZWV2c5THlyRTFDdnQ2emJFQlJZS2xQUU55?=
 =?utf-8?B?YjlpMC9rcVhxNDNPeDVIWU1XQWtJc2sweE5Pci94ZmdVdHMwVnVaeHBucmMv?=
 =?utf-8?Q?bxamJ1dqd5W6dUipbyp+Qmnc+UkPUF+Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1dQT3VjN09xZThLZWtsRnNnUkJRdVRkU2toTXpVWVc5Z2hJTUR4ZE5iUFNi?=
 =?utf-8?B?YU1oeGJpemdRalJZeitETnhFYUQzZkpzVHNQU203Wml2d2xtU3FaYmt6K1NT?=
 =?utf-8?B?T1NXUzI5R1prZWdYVWNkZFBNQ0pvWngyYXNHWkZHL0czSFA1RTlNakZ2aWxy?=
 =?utf-8?B?UU12d2UvRy9OYWNZMURrUzUzQW9VL1VRdG1ueEl6dUNib2pXY3I4VHBYY1I3?=
 =?utf-8?B?T0xXR2h0MVFWV0I0S243UXNvNkk3OUtJTVBnbjJBWk5DRGxrc1JDWnJRS2hR?=
 =?utf-8?B?dFcwaWlZcnkzdUhneDd5Qk9LdXlZTTV3T3d2SHJtRnA3aXQyTVR5UHYzRUxD?=
 =?utf-8?B?WlBSR1pNM0M0YjFJcGtjYW8wVDJGMUh4ZnB6UkRUNFJaMTdHM0NnYzZ1a3hG?=
 =?utf-8?B?cllQWC9yMExQOXppMDYzejhJYjZVZHY1Q3JXbVczTHNrSjgrMkhrMzN1bktE?=
 =?utf-8?B?VGpteVVrZ3kxTHVwMzN4K0F3ejBpdUY2b1JLd2Yxay9aa2JtenJHS3pHT1pN?=
 =?utf-8?B?M3ZTVy8zZEtKalVFbW0vYmdYeTk5OGFLeTZEMStkYjIwWHpUL2V1SkJ1Nit1?=
 =?utf-8?B?VTBsQTd1WG5vWS91UzQ0UEtaZlpuL1R3U1pBbndXWkZpODF1eFV6Q04yTzN1?=
 =?utf-8?B?YXd1eGhwOGNaRFJENXBPTlNja2hiSnNZM29oSGx4ZU1tdm5GcU1ZZm0vZmFK?=
 =?utf-8?B?S3ZsRng1SVN6Y0FBME1QcTgzZ3YzWlVHNk96K3UxR29YSk41SVNSVXdFdkxF?=
 =?utf-8?B?SU5UY3UzSGhlTjVNZ2lBemIxY0x4OVNTMkFxQWNndEVtMVFyczQzOG0xVU4v?=
 =?utf-8?B?NkhHYUg3ckpLL0F2NlcwRTlNdUJJbG5NZVcwdWk3bzV6TGxYWWtIYmxGODdU?=
 =?utf-8?B?Y2I5Z1lQdFJsaWVWMzBETFlzcWxqWXgwOUo0WjRQdFRmaG85eHdNZ3ZaTTE3?=
 =?utf-8?B?V251Y3ErMTRWZHNNVlhHVVh2bU41QWM5TEVJaU96TUJoZ3l1bjN1VUhGd1Vo?=
 =?utf-8?B?UnYrVVFvbmRqdnFZWVZucDdBZUdiUGUzTXJXc2NOZXJ2YVRMcmt3S3pTMG5H?=
 =?utf-8?B?Z3NOeWpGb1IxTXBZOTIvTWFGVCtGd3Nhb0h0T2VNWVhIVEVDZTdaVk93dXdV?=
 =?utf-8?B?VnRJUWxnVTJYTE5ZQVgyNVF2Z003QnF4eE00UDdhQlIvWVZtdE9CMVhXY210?=
 =?utf-8?B?cURMbzBrMzl2cG5zSW1PaHJEVUVNOFN2QnZTU0EyVWtXWUt4Rk9FZkVKcXdC?=
 =?utf-8?B?c1RCVHYvN1pKbDhRbSt6TkFTK2s1UVRDaTFMU2tzSU5xZllhRVI5Nk1zU0cw?=
 =?utf-8?B?RmRYbUJpc3YyR3NtSFl6U1N1c0VNTmYxSmZvbjVWell1bUZoeDdWcDNxdy9t?=
 =?utf-8?B?RVhZTWEwSVh0d21LYTlpMjRRNEVBTmIwdXRvRkRHbFQzTUZtOUI0UHhKbnVa?=
 =?utf-8?B?T0hXV0swVVNzS1phYjhudnd2VWJDc0NIamVUL2w5V2Q2RGZ5VitIMCtBdm1r?=
 =?utf-8?B?cmdtMEpJVitJL3N6TXZ1cllLTFM5VTNlTi9vNVBVbVpnVHJxaUdaa2h5U01J?=
 =?utf-8?B?aEtuaEd1UnduMzU4bVNjVEJVdGlGZGtZcTd4VjFCZW4raEZEZUFkRW9kOTUx?=
 =?utf-8?B?NG1rUlpEbXN0cEJwZ3U1M3kyRmZ1Q3h1YlRKOXNxcjF1VjJvVTh3RE9lRHp3?=
 =?utf-8?B?NzR6eHpmTnpFUitpL0J4VmJLK21TL096QVZ0bUplNEFmVEdKWjZaRFB0S2Zh?=
 =?utf-8?B?N2JXT1hKb2xZVERWVzY3VFI2SFdWVSszUDhSWkV1WnpKak9oQ2xPcVd6ZFlM?=
 =?utf-8?B?eE8wcWJxUUFCeWZYK0F2dnNlUSt4dU1ja1Baa0IyMWxYMVA0dHpHWHlBNWVh?=
 =?utf-8?B?R21hb0xiZ2RldnZnNWI5Ym1uVGJNMXE0aE9qUXRSUTFKS3dLNGw0N05ZMXRs?=
 =?utf-8?B?b3lRL2pSQ1J5Ri9LV0FOTnZlYVJEM2grUnZTbzRzZUkvaUZHS0R0eERzclQ2?=
 =?utf-8?B?UEtneVN6WTZ3MWYwV2pENkNsSTVmUGh6U3lNZ1NNMTFhZDI3eCttNVdtRWRN?=
 =?utf-8?B?YjZ5bkFKNXZPd1YrMFhERnZmRWhLSW5QWTQ0NjJmeHY2b2JUOXR4UGNTV2k3?=
 =?utf-8?B?ZG1ORnVIazc0dmFMS2tsTkxkbVZYbzdYcGp5R3lxU1JQL1VPVGpGbDdDam9x?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff663ce3-5a0f-44f3-47a8-08de0745c34d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:08:54.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19qvGu+bVBLxUg1XEdNlQyrjameiI/JMiAlkQG41AFcGHyPsk+JxnMFdVGbp38WL5BbvZIo7fPFQjuDu5kFDYDt2+8v0MQIhgr6kcUCvMFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6264

Hi Jan

On 08.10.25 15:09, Jan Beulich wrote:
> Rather than unconditionally accepting reads and writes while discarding
> the value written, make accesses properly conditional upon CMCI being
> exposed via MCG_CAP, and arrange to actually retain the value written.
> Also reflect the extra LVT in LVR.
> 
> Note that this doesn't change the status quo of us never delivering any
> interrupt through this LVT.
> 
> Fixes: 70173dbb9948 ("x86/HVM: fix miscellaneous aspects of x2APIC emulation")
> Fixes: 8d0a20587e4e ("x86/hvm: further restrict access to x2apic MSRs")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The Fixes: tags are referencing where the explicit mentioning of APIC_CMCI
> in what are now guest_{rd,wr}msr_x2apic() was introduced; the mis-handling
> really pre-dates that, though.
> 
> In principle the later assignment to "nr" in vlapic_do_init() could now be
> dropped again. I wasn't quite sure though whether that's a good idea.
> 
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -31,10 +31,13 @@
>   #include <public/hvm/ioreq.h>
>   #include <public/hvm/params.h>
>   
> -#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
> +#include <../cpu/mcheck/x86_mca.h> /* MCG_CMCI_P */

This include... You probably do not like it also
It is dependency outside HVM code.

I've been thinking about something like vlapic->caps which can be filed before vlapic_init()
or passed as parameter, but seems x86 toolstack is considered to be able overwrite anything,
including v->arch.vmce.

Seems, no better options here.

> +
> +#define LVT_BIAS(reg)                   (((reg) - APIC_CMCI) >> 4)
>   
>   #define LVTS \
> -    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
> +    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR), \
> +    LVT(CMCI),
>   
>   static const unsigned int lvt_reg[] = {
>   #define LVT(which) APIC_ ## which
> @@ -57,6 +60,7 @@ static const unsigned int lvt_valid[] =
>   #define LVT0_VALID    LINT_MASK
>   #define LVT1_VALID    LINT_MASK
>   #define LVTERR_VALID  LVT_MASK
> +#define CMCI_VALID    (LVT_MASK | APIC_DM_MASK)
>   #define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
>       LVTS
>   #undef LVT
> @@ -697,8 +701,17 @@ int guest_rdmsr_x2apic(const struct vcpu
>           return X86EMUL_EXCEPTION;
>   
>       offset = reg << 4;
> -    if ( offset == APIC_ICR )
> +    switch ( offset )
> +    {
> +    case APIC_ICR:
>           high = (uint64_t)vlapic_read_aligned(vlapic, APIC_ICR2) << 32;
> +        break;
> +
> +    case APIC_CMCI:
> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )

Could it be done using wrapper, like vmce_has_cmci()?
As this is Intel specific it's candidate to be opt-out eventually.

> +            return X86EMUL_EXCEPTION;
> +        break;
> +    }
>   
>       *val = high | vlapic_read_aligned(vlapic, offset);
>   
> @@ -868,6 +881,10 @@ void vlapic_reg_write(struct vcpu *v, un
>           vlapic_set_reg(vlapic, APIC_ICR2, val & 0xff000000U);
>           break;
>   
> +    case APIC_CMCI:         /* LVT CMCI */
> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
> +            break;
> +        fallthrough;
>       case APIC_LVTT:         /* LVT Timer Reg */
>           if ( vlapic_lvtt_tdt(vlapic) !=
>                ((val & APIC_TIMER_MODE_MASK) == APIC_TIMER_MODE_TSC_DEADLINE) )
> @@ -1024,9 +1041,12 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
>               return X86EMUL_EXCEPTION;
>           break;
>   
> +    case APIC_CMCI:
> +        if ( !(v->arch.vmce.mcg_cap & MCG_CMCI_P) )
> +            return X86EMUL_EXCEPTION;
> +        fallthrough;
>       case APIC_LVTTHMR:
>       case APIC_LVTPC:
> -    case APIC_CMCI:
>           if ( val & ~(LVT_MASK | APIC_DM_MASK) )
>               return X86EMUL_EXCEPTION;
>           break;
> @@ -1438,7 +1458,9 @@ static void vlapic_do_init(struct vlapic
>       if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
>           return;
>   
> -    vlapic_set_reg(vlapic, APIC_LVR, 0x00050014);
> +    nr = 6 + !!(vlapic_vcpu(vlapic)->arch.vmce.mcg_cap & MCG_CMCI_P);
> +    vlapic_set_reg(vlapic, APIC_LVR,
> +                   0x00000014 | MASK_INSR(nr - 1, APIC_LVR_MAXLVT_MASK));
>   
>       for ( i = 0; i < 8; i++ )
>       {
> --- a/xen/arch/x86/include/asm/apicdef.h
> +++ b/xen/arch/x86/include/asm/apicdef.h
> @@ -15,7 +15,10 @@
>   #define			GET_xAPIC_ID(x)		(((x)>>24)&0xFFu)
>   #define			SET_xAPIC_ID(x)		(((x)<<24))
>   #define		APIC_LVR	0x30
> -#define			APIC_LVR_MASK		0xFF00FF
> +#define			APIC_LVR_VERSION_MASK	0xff
> +#define			APIC_LVR_MAXLVT_MASK	0xff0000
> +#define			APIC_LVR_MASK		(APIC_LVR_VERSION_MASK | \
> +						 APIC_LVR_MAXLVT_MASK)
>   #define			APIC_LVR_DIRECTED_EOI	(1 << 24)
>   #define			GET_APIC_VERSION(x)	((x)&0xFF)
>   #define			GET_APIC_MAXLVT(x)	(((x)>>16)&0xFF)
> 

-- 
Best regards,
-grygorii


