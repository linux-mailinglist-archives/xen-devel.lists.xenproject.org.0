Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE245C9D1C9
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 22:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176374.1500875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQY8a-0005CH-Lm; Tue, 02 Dec 2025 21:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176374.1500875; Tue, 02 Dec 2025 21:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQY8a-00059H-It; Tue, 02 Dec 2025 21:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1176374;
 Tue, 02 Dec 2025 21:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WL05=6I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQY8Z-00059B-5E
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 21:42:19 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5744e3b-cfc7-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 22:42:16 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by GV1PR03MB10518.eurprd03.prod.outlook.com (2603:10a6:150:164::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 21:42:12 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:42:10 +0000
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
X-Inumbo-ID: c5744e3b-cfc7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Le0uCPt3eUvM1HAPfvwGoVsXsn0KQUmNunWF0FkZnLgxMlWBmzuKtp50zeE1HXsLPr5pKVW0V3OkuQ3hJRu1gpO002G8253uJa6HUWH0jw0onNiUnCDqYsCXScP/CrPMzTKrQZehvL8YL3DOvxIphVkCY795w/UwXVnjfRV4riNY4DSwdxLSF01lW9icOZFiZOyXACMLcR75+WXlGlifCDu2Nl3kuhXvG9RGqMjgoJ9s2aG8GPBpWyBrZn+r9EukiQJZN7uvOY0+KhmaOMWdDjOrEGIY7rkvjrzrxNBLJjprMTzS9qWYag5ZueoaZpNLk6u3YD3elBzHBpek2VZqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl11NCIGAD5Yo+640t3InN51CUL5wLKMWZYnexmF/tA=;
 b=rwWoEinPJMUyeLWEVQ6ae961rMNJ9VoLHHtjo3TJcHUbSxTz7ZKxLoJnUntzdRWxu00Qf2XgLszvJ+JCie1Lkqi/mG+zJ5XxMojHr6AfOHhivTbb97u/08DzzWyamOzgVVYy9HKnbSW4WLpVTirslvRqKSKkV5ZUE6dnL/rHqo8ahlcafFbeW3bzKlHl2oxB+XLNu0pvZPKT50LJHpRGvaoG6lMqjF2U0R7SaiRkPp/1vEA5MgDksgZhNpzMTBiUY3g37GBuHvUeohg4E9wEBEMjIWRDnAd1+cx16yJaEn2pdXVpvv8ExWlbtn9Vrff10zFgrwtN2MW9CDLFwA6lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl11NCIGAD5Yo+640t3InN51CUL5wLKMWZYnexmF/tA=;
 b=mDZQE60hu+npLYuhVe4bJ2f2S/7aeyaXPIy2ByDev3jhk22GYOgE/KbAkGkr4Z52uIdV3jiWPe12AkQ2yUpnkjY51PDhhZYK6+NhWdEmMWAKTlWCH/Y86nOKPFRoPSOdbpVFyPMR22OuzDjMG+y7ttDnOm6oo05sOhd/7/P/sZCFSv9rvouwJKupX67BV2G7miokYh2f4CDVvUw9oqr1rESByECidoR9wtbgpo2euIvU5N7TDCcCEKgpm1BeARu2BEeWGt1WevTDZMvo4FiNYVMkmN4ah/0o47/SCAPK99Shi/cUumYXG3IL+vEQzQBPG9ub5wBzs4haQGIOjvHjzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f8ef4286-dd9e-4213-b186-c0aedcdb74f8@epam.com>
Date: Tue, 2 Dec 2025 23:42:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/arm: restrict cpu_up_send_sgi() to arm32
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250911081213.1323594-1-grygorii_strashko@epam.com>
 <705d4436-2263-462b-a582-5f0092821959@xen.org>
 <alpine.DEB.2.22.394.2509121512450.628111@ubuntu-linux-20-04-desktop>
 <A139EB0F-3966-409B-90D5-4A12684E81EB@arm.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <A139EB0F-3966-409B-90D5-4A12684E81EB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|GV1PR03MB10518:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef83816-f4f6-46ca-f398-08de31eba49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmZYSHpPTDhnaHhjM1Q2V1BWRUMvQ3kzbWY1SGRQeUlIL3V2UHVkTE0zRjB1?=
 =?utf-8?B?NHRJVnFOOUY0d0RydGpMeEpOcERBTTZ5T2NGQU54c2pzeXRHU3ZRbFZ5YXM3?=
 =?utf-8?B?dlI5RlVZTVpJMGlZWmJWbWdadHQ0azQyVjYrczJKTGpRZWdZNFkybHAxTG8z?=
 =?utf-8?B?UVBpdlRTTHpNMVZLb0prT2tTc2phNzFSbVJRL05KTHYzRDZJT01FQ3VqZ1RF?=
 =?utf-8?B?YlBBTmQ0WVE5TlpJaE44NiswaTIxaHZnYXdOUWtiMU5oVFFzUG0xSzhVRnFu?=
 =?utf-8?B?L01mVmN1Rm1HOUVrUk9OcEl5ZWxzTlZxQzYrc2FacFVWY1hINWx3a0dFUE5K?=
 =?utf-8?B?NFVDUnVFTm9naDBCcncrS0lGRjN0UFkzVFhGb2trNGpFSndhcG5KUzZORm1O?=
 =?utf-8?B?aTQzdzJQamRKOU9yVFRIVnkrSElTOHU4ZTc2dUFYMThPekdzV0V4TXJXTFN0?=
 =?utf-8?B?eVBqZGxHbmxkLzYvUFlnMElkRFVwczljZGRaRkFtSUlUbDRRUWw1K0J3MWJv?=
 =?utf-8?B?Y0VMRndrMjg1WXhWaG1PcWZiWStOdkNyekVXbDRNZVl1U290RDdueFkwckls?=
 =?utf-8?B?VmFsMjBSM3Z0a1Y2bXlwRzJxSEpSeU9jSExSb0xTaXVGRzlRbll2WUdHUVVB?=
 =?utf-8?B?WjRCeGdjTmNPNGRCQjAwRitQVzN4RTJuTlNqQUkwZDl1MUpxblNFa0craVV4?=
 =?utf-8?B?VWxST0p0NUs5dlBQbnR0WE9sUlNaWWtkenFzQVoyc3dwWGk4OFJydDJkbXNT?=
 =?utf-8?B?Y082M0I1VUx4OCtLSEMyNDlqU2d2V3JjM2ZsM2NETGlZNkZJZEJiZW16RWln?=
 =?utf-8?B?YWxZV1EyOVY0NkJrb3l4U1VBRThyK24vYjdyR0ZZVHNmaFV5MThGNVV6WnJn?=
 =?utf-8?B?SjBrdTBRR05ZbkU0OTFSMXlQMy9oL2ZneDhRSjUxUy9VRnM5TlNHMEZiOUlC?=
 =?utf-8?B?QTU4RlFkSVMybHZ3cjh6b3dKR2hhWFpaTGh4eldFU2lTcEwvbnN1UTZPZ2dU?=
 =?utf-8?B?N1JjV3RjMDVBNkc4MThzUEk2ampEVENGdWl6UzU0QmVrOHJvbFJNRXhqZThL?=
 =?utf-8?B?ZXhPVFZzVGIwQmdINkMwN0c5RzkrVWx1VFV0YjQ3aG5TNGNGK2M5OXFlaXhE?=
 =?utf-8?B?NjBvVjllakxRMzgvb2Z2MlpwWEErZElkSG1OTm16WUE0a00xOHRKT1dNQmVC?=
 =?utf-8?B?MzBWT0NvT2dEdlRxSFExd25KaEwwY25DZmVqQWRtN0ZidTJVNGNPOTVhamE2?=
 =?utf-8?B?WjgwZ3VRRlhoNWs0Q1p5MVp0bjhUSzBuNzkzSkxJYk96NVNrZjJ3M3hDenB6?=
 =?utf-8?B?eTgwVmNrRDRabk1QOFZYa0RCZThtV25VSGoxdkF1MjhyTkRnekJmNkdhN0RP?=
 =?utf-8?B?S2U1ODFMdEhWWU9xM3RWdktRSnAzdlJ6UGYxN0EvUWw4MkcrL3ZsaDJUald5?=
 =?utf-8?B?eHh6THkxSHJxMmg2R0p0ejhqWE40YmlXekcvZjhoTW1tZ1JqNFZuWEVrWDNZ?=
 =?utf-8?B?djVubFhGM1hQdVd3M25ieXQ2SGRIZHlrM2Y1eFVZUTBUTVJ6eUgvNWFiSzQ0?=
 =?utf-8?B?Nkg5cnArTWRYdDhveXZGMHdQanRNZ3dXOHdKRElTWmxXay9tNktXbWlGUjVk?=
 =?utf-8?B?N1RqVG1FYWNwbGFweEU1TnVjVDZxbGlxRm5LbkdLWFY2Qkt1ZlZQRjRLb2t5?=
 =?utf-8?B?TWxrbWpNcjhDWUhHQzE1OG9mbmNEdzIvYmMwSDFXaXNyK05SaXJadldVZ3pt?=
 =?utf-8?B?U2M4T3hCMkYwbXBrczRjZm9uTzd6VjZtR2tvbFp4Y2dCVXNpS3NrTlpXdXQx?=
 =?utf-8?B?ZnpaeXU4LzNnZGt2a0RjS2VxazlWclgvejBuYmFHNHh5RWdFbUFHZC9LS3Nq?=
 =?utf-8?B?VW9LSUs2NW55WUxVSXlQZ2VRakROZ0JRQ3VrdkJ5UEdwOFZLYThrakVCaWM3?=
 =?utf-8?Q?FBLBQMMbWYhQdzQ6/oqQBc4ubCzgNUar?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlFhN3FENjFxMzJJd0kxc2gzN2VaMUk4akF1TmpCWFVVQ0NPZXdNdUg1elVX?=
 =?utf-8?B?VThuRHo0NERKTkhqZktJdklLZWRib3JWVEFyZWFEWDd3eTZyN3k0MGIxc2J1?=
 =?utf-8?B?QkpZL1lrZy8yN3BjY3I3VWU0UnpldzBLRkRobVJEVHFSbzI0VjdVaWtuTUox?=
 =?utf-8?B?NkNhWFBDMjdBNlFjd2ZQb3NUYWFMS1NWenRKSXpkQjFWUkl0RzNjYTJjakFn?=
 =?utf-8?B?L2lUajFrOUFBTHE3NHcwUGNORnJNZ0VFWVRQbTRqYTFyY0h1T3lWSEkxQWtq?=
 =?utf-8?B?eE1XVXBmYlczUVN5WEVabFNCWElEbzRrT1RvQWYyQVhTY1o1NllxVk1YbTRY?=
 =?utf-8?B?eWFTMVRVS0RXWWs2U01FeUVXZFcwNFBhcUQ4SFFNYko2WnpNaGd2LzIvZWVs?=
 =?utf-8?B?T3pZdDluZTNRWG1XVDhXUm1CVGptWU5za0R3Z2hpRVFGbXdHQldDa04rQ0NG?=
 =?utf-8?B?d0dOMVREUTRyTDdrMjdsSGk3aEhTT3d4MFViaTl4SUE1RHhtWnBJKzNWTENW?=
 =?utf-8?B?czZrREtjZlljZTJxM1dnRC9tRTZ3NEY0RzZjRjFVK3piR2lpa3dTVDhJV1dM?=
 =?utf-8?B?dDBHbUpaTk5IbmI2blB4aVFpTElScXRyNTVKWTd2V1o3b0hOTnRpNlB5ZmZP?=
 =?utf-8?B?WkZPQ1dRQmErdmJDdWJDeVF0N2tNejlicmMxdjlwYmx3ZTMxRnZ6dzBlYU9N?=
 =?utf-8?B?S0JvcWlkRWdOQy82eGF4RlI5cyt1ejd2K3dxQWhUajR2S2UxNEdWR3h0cG40?=
 =?utf-8?B?alRSeU04TGlKNmdlVWNIREtZVzZod2oyUVpaaDdzdHZDcGNFazN6aFlrVTNG?=
 =?utf-8?B?NG9vNTMwQ1VGcEIvL2NtUjY1bEVnaXNOamRZdFduNnlTRUhUSEtnaTk2QXl4?=
 =?utf-8?B?S3NMQjMwWmJTTmxGNS8xU0MyTmkyVWVrMWhGQlZBak1BRXN1OGFXN3RYOG4x?=
 =?utf-8?B?WHV6OXVKZHRWR3dwSFA0VEhIczg1ZzFDM3A3NW9zbTFmLy9oT2U4Zm1DcGJS?=
 =?utf-8?B?RW1GT1FlTFpzNzlDU2JxSEJOMFVwU3pQMEpvNlErVWltTVV5L0xWWWlVSjFu?=
 =?utf-8?B?ZmxzM0d0VlRFR1FEUlMrcTBrTWJOMWVLdlVYTTh1VXRWWDVkdjFXREh1dEE4?=
 =?utf-8?B?b0hWa0Q1QkV4UGVoMzNIZjdCQy9rRmhzelVhelJIa2hxRUkvWi96b3MvMFQy?=
 =?utf-8?B?aEwvdU1GS3lZMVZmK050QVptRFFCaU8vYXUydmhpYzZmZ21WRkFmeHJNbElK?=
 =?utf-8?B?U05XeVk5L1RWVEVJYkJkRXFXNGlWVDh6QmhmdG83SFYyTkRDM0hySWJzcHI0?=
 =?utf-8?B?dytpV0hib2F0b1IxbW1KTkl2L1RFdVQ3UjVWWW4rOUpFVjhPeUlaSUtNODYv?=
 =?utf-8?B?Yk0raDU2ME1PZU1kaG4raXZ2czV5Sk41VVRVbk45bmhnTTF1M2Zha2kzcXpp?=
 =?utf-8?B?UklmSUJoM3hZbHM2QUxSSHlDUFZLMHA5QXB4d2M1WWd6NUdpNi9idmxCZURs?=
 =?utf-8?B?bjVxV1lpbGhxQXZDSHJ4QU1pbGw1NmN0eWExRk9IMDVaUDRQWUYvQWNqaDVS?=
 =?utf-8?B?aFJEeFgrS0tGbm5wcVNMbkxZbTJJRzlQd3FKdXZBMkpwN3hrZUVoT2ExNjk0?=
 =?utf-8?B?dnNROWt3VXFvTGY3MDNiQk9haXJ2N250cGNQYkt3YlY0MWdmRXBZYW5YMFRV?=
 =?utf-8?B?SGpJakdOZDQxUDJWbHIwN0hwblUzSDl3R2dTUmpBZHY2S1lTb05qUHd4K1ZV?=
 =?utf-8?B?V0FUd01XU21lblM1Q21sR05hRS9JT1I1QjJVNC85K2Q4RUFjU3lzMjRNTEI3?=
 =?utf-8?B?ZVQxMEhQcnhzVkErend4Qm8ybTcvWXNuYW9rdHQrUmZhVzRXb1Fjc3FCT29R?=
 =?utf-8?B?RmNzNDlhbVB2NHkyd2xOcWEvNTN6K0hJcDFqNnIrbVBXZnJ3Zk45aU91UHlH?=
 =?utf-8?B?NTFXdXoxb3hPaUhmcDdWVlJubmIzd2FaT1N5dDl3Y3ozdVpWNUNCQnZlWDZH?=
 =?utf-8?B?Yk9NWkdBUE5TNkV6NTlXbDZXMnhjQUtBZmc0dy9STlc0WjR4S2N5ZkN3MVJL?=
 =?utf-8?B?bkJSUW5RcnZsdjFXU1VJZWUxR3pWWkhkWGtTZ2l6SnFZdTVqSVdOZDhDNUFh?=
 =?utf-8?B?M1JNWlhLSG1Mdy9VbnpxdHFnN09wRktxWnNvVjBPUVBqMUVOZ2x4NWhtY3pw?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef83816-f4f6-46ca-f398-08de31eba49a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:42:10.5550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuLvfl3poyqAaqAIAxTmVN2I1SXlS59eJsCdAD1OXe74DJPB28mx4OgjBpJGu8zBPlQ0JpnQZXQ3vtRcnflk8gjQOIrYeM/2zGrqKqeOKGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10518

Hi, all

On 22.09.25 12:48, Bertrand Marquis wrote:
> Hi,
> 
>> On 13 Sep 2025, at 00:12, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Fri, 12 Sep 2025, Julien Grall wrote:
>>> Hi Grygorii,
>>>
>>> On 11/09/2025 09:12, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Restrict cpu_up_send_sgi() function to arm32 code as it's used by arm32
>>>> platforms only and unreachable on arm64 (Misra rule 2.1).
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---> Logically cpu_up_send_sgi() should be moved in arm32, but source is
>>>> "GPL-2.0-or-later" while possible destination is "GPL-2.0-only", so put it
>>>> under ifdef for now.
>>>
>>> :(. I don't know if we will ever solve this license mess... Looking at the
>>> list of platform using cpu_up_send_sgi(), all the platforms are 10+ years old
>>> and to be honest except maybe the rcar2 development platforms. I doubt there
>>> are anyone using them.
>>>
>>> So I would be tempted to get rid of them and mandate PSCI when booting on Xen.
>>>
>>> Bertrand, Michal, Stefano any thoughts?
>>
>> I am OK with that.
> 
> I am OK with that to.

I'd like to clarify if this patch as is will be merged as is?
or expected to be superseded by clean up series?


> 
>>
>>
>>> Meanwhile for this patch:
>>>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> 

-- 
Best regards,
-grygorii


