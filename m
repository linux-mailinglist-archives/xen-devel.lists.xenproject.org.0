Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A736A5C492
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908272.1315408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1B3-0004qz-UQ; Tue, 11 Mar 2025 15:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908272.1315408; Tue, 11 Mar 2025 15:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1B3-0004pf-Qh; Tue, 11 Mar 2025 15:05:53 +0000
Received: by outflank-mailman (input) for mailman id 908272;
 Tue, 11 Mar 2025 15:05:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0SOU=V6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ts1B2-0004pZ-93
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:05:52 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f1b6d83-fe8a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 16:05:47 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DBBPR03MB6796.eurprd03.prod.outlook.com (2603:10a6:10:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 15:05:44 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 15:05:44 +0000
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
X-Inumbo-ID: 4f1b6d83-fe8a-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiUdQ9j7eC85jweYi978E0DtBOIuCQFbptqGKGSB9K14WFsEwRzI9vlB1plGzugQ9gbB+w/raWgcmJMwbkQdLHVTlK8ITZrQ8eTv2n6C8TfqfakQAXVcO5ovyAu3LD276H+nQDXbM4IP/WghHVejhuX3ayMOM257E96Xi2Y7hzMA9M0aHPcYjfyaehkLPZFPPHVZorC+++nVks3+dbP3gG5h27aZYn4C/zAphNgNyZgLKFrGaNWREcu2BibHNdFJBAxKO+qls7865Sv7tjCZGvovuRfd9m+jNQFapJlWMO3a7ztQyOdpCsuU3pVsMwGfrwPYh8hrw1nQVZZGm0+kUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0NUy53ZdaNsOaVAHtjmaOVQnvnKBmP4ygnw/1fyCB0=;
 b=fPmlRPTIjs48uklu1a70CQtR41gAk0XJyRb0qS5fOIWBe8EJodHTdL3ykv5rKr8RYfYu0iRbkR0XOL97g6+GRqt2b0ucfdBWFgR9PyaQfUqVM8+VPNI5ClnMFCLsyDJ/mh7ntsvUo40rupQllbXP7YMz0BzOeLh7CnFg26Q+HehaA9yBP1queMaVCSxJVcheC7vLpOoR4MtzHn36OIwSHReWvfkHigYGWcrHSY+8zQZ3ahDbUp+53nVh6s0Kq7I9JRgZvfSD0MylO5AMhGF+Y0RIqv+aJz7pKHpy6wbnY+urp3RIlMAbyoBobVZsinFI57+Oq+f9lwysg0bsi7AYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0NUy53ZdaNsOaVAHtjmaOVQnvnKBmP4ygnw/1fyCB0=;
 b=LoP7kLbp7VKwR3OLZpmOtJEuWcSswQdKuTSgQlkZ5yHI5WssiQ15uWBB2lk997PbirPggF5Zqd15cXjgxQdrErFTSAV1A1GUUQOpJqm80u+miEuKpl0zJzpb2wTicHonfHVZD5nHBxYp7+xBE9yDJERjYfonuvjCpBr3ksC2NSTFmjwq9xw58JdFJRDv/UKmpZ8WNlkEtd6n47568dNq7QaMDOMIaDEihVcoS5METs81uwuaOo6sB+bBj/w0b+cRl/92QhDF8K+xVkIvOVmxGEZ1A/Lpol7Dp5hWQqmgGs33dHrioX6kFtW9Biv+Rtx/YgnbTj+A4pA3z1UtR+UjEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <8c7b7186-c5eb-4ec7-a2b2-fdad76aacf9d@epam.com>
Date: Tue, 11 Mar 2025 17:05:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] xen/arm: allow PCI host bridge to have private
 data
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
 <cd3bd35a570064e1b03054bab73e29aa1578bd24.1741596512.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <cd3bd35a570064e1b03054bab73e29aa1578bd24.1741596512.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DBBPR03MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: c0238d91-4d95-4b74-63ce-08dd60ae3232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEZ2Vm9YYyt6cFFOV0tlT3dmWVFNMmhLNjdCdVU2MExOODRKQmhxWjRXakZ2?=
 =?utf-8?B?OEMvbDFMWXVmM0Zub21TYkRQVmMrK1hFdzNtYk9iMGVsOUhRMk5rU24rSUVl?=
 =?utf-8?B?Mmg2eWx2U0hROFlQeWhRT1JUV2hBc2U5eU5zdUZsVXl5UVlUcDN0NUxjcVFQ?=
 =?utf-8?B?N1pFNUh0emVwS01qQncxVTVNU0R5KzlHNDNRQ2FaYUd5REYzMy9NVmZ3UEFS?=
 =?utf-8?B?RUNSZVl6dFA4K3JNMmJ5c0tzanBBS3ROL2REUFdNa2czMnFNcFJ0M2R0Ykw4?=
 =?utf-8?B?SGFzRGk0TmF2VzdyTS9vekJFYVF4amEzR0lUYnNRQ1pqOWkyZSt1Wit0R1Jm?=
 =?utf-8?B?QURqeXhPbjcvdDZxclZ4eE0wMS91R25LWTNETW4yTnF0bUhxQzQxSUdCT1Nk?=
 =?utf-8?B?OTlxNy9BRXRQampyUFEwSDc5anlZNjMwaXBKa3ZRM2wwQmd5OWVrMXJFL3gw?=
 =?utf-8?B?Y2tsNkdCUEt1bDA0bVpuRTBwV1VpTUs3Q01FcDUzVlJDbUNmQnQ5K2dianN4?=
 =?utf-8?B?TXorOTQ3MmZyRm11TXNReXluczFhOTJFZmZZU2cyZEQxdHdiTzhLRXg4SEhO?=
 =?utf-8?B?K1poQ05SVjRZS054WGZJRVNSN1RuT2NzZE5JQ1NEVndTVHVlazhsWTlSMjBu?=
 =?utf-8?B?ZWpjQjhpT3dSREZlSUVuQkZGODNlNTRoakUxMmJjeUltTjc3ZnpidjZDU2tM?=
 =?utf-8?B?Y2JUUjlnT0hGZFpocDRzOGNRSUlJdElQMGxzZG12TGk0MUhGRFpBY2dIS2xU?=
 =?utf-8?B?ZlVSN0xSeWo0K2d2UCtaUVE4NVJadENKTXhYSDJSM0E5NTRORnpIUmE4QW9w?=
 =?utf-8?B?SExiSWNCa3J0SmhvYVU5dEpaV2hOK0xoYktLNm9mTHpuM2RlaFJHaER4T09M?=
 =?utf-8?B?MENpUHBWdk10SlhjdDlqUTdSWDA2aWxXbU1EdHVyNEhkUmd4RG5XQ1NwTlZh?=
 =?utf-8?B?L1k1aE4raUIvS09iQ3ZFQ293UVRSODlvSjRmWGhtbmlwdkZmWnBLKzdHU3U3?=
 =?utf-8?B?cEpVc3VRSVppTjFTQWVVN0lHcGI5TkwvY0N0K3V5a29TL2RCUkRaRWlBeWgv?=
 =?utf-8?B?UDVrcXdwaFhRK1NiK0R1UjB4VVlJbGlRUnRiY21wNmdLWFF6VXBZMGhNbVNr?=
 =?utf-8?B?RE5RUmJnSXpsaVhZQVZRNFMwSDB4NWw3NEt5R3ZPWGpFTDljN2UxaG1pS3Bi?=
 =?utf-8?B?ZHJjTkRBV1czRHZwREJFUmIzYjI2OE90ZU5neWdhM2FUUjNZMkZaclRUK0FY?=
 =?utf-8?B?c2liRGRxbm0xZnhwWjV6RkpEekZpOHF5c05ZUUZYM1MzWXhtalF6Rk5PcjJ2?=
 =?utf-8?B?bW5hdHhhVkxLWW4zZFdKbXRzbGE5WGJyTnZCQTc0Y2dkdEh0aThrUXV6WmhR?=
 =?utf-8?B?R0pHOGp6enUreHE0eFJBYlhtWm5WY0dSR0NLenRhbXk5b1JvWmdUckpXZ0Z2?=
 =?utf-8?B?KzY5L2xBRTZZYnA0Z2xYVjg5RE0yRVAxaW1pb0VMZC9zVkNRcHJ0MTNFL0NM?=
 =?utf-8?B?azNwS3JaZVhRdlJ1NVNUYWlpWXVCcDFQR1pOYW5UQTZPVHJ0RkRVd0lYRzRr?=
 =?utf-8?B?b24vcVFhbmV3R0Yvc1pXTnZaZ1BlUDdHcnBhZUllWnltL0V1dmNlbldQdFdy?=
 =?utf-8?B?UFI4aEtUS0JmdHlZVGkxakxzZHgzRjRYRUhXeHk3VGdJVXpHeWtxU0RhaDc2?=
 =?utf-8?B?ZlV6Tzh6VHVEdm1uQXpOTXNFWEZOUVd1YjRsdEJ4RWFCZ1hKODgxTkRPWTZL?=
 =?utf-8?B?My8vUUFabUhWWkE3Y010YUtEZW1FZnViMWNtRERGZUlwemM5VlFPRFZud0JH?=
 =?utf-8?B?YkY0ZXliai8xTnlzM1U2aTJ2NWJpRlFpM1F3T0JRTkhVZmFyL2JHOVVMWkFD?=
 =?utf-8?Q?XVdCo3Vi4zNDM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekpBbDJyRHhIWWpjRkh6SDZhaUlLbHNTSHhLWlc0UEl5VHNUYUQvMnllSkQ3?=
 =?utf-8?B?VkM0bDhZcVdoOFhreUdtQXhaUDU0WGMvc3FkRXc3L2tBUC9rS00zN2hnRXJl?=
 =?utf-8?B?cW8yMmFYNjJmeExPQTYzUjNxN3oyNWNEb2MwcmRXNmtiY1NzUXMxSmVFMlpp?=
 =?utf-8?B?ZzdoSHpVeCtpQ2JmYk1DelhSNyt6QW5aSG5VRHVjeDU5U3FoNklIZUs4QnZl?=
 =?utf-8?B?L0dOWHJEYis2ZGF2bExKdUpYaWlXL0wzdEN3ZmNhNlZFT0JlTFdFcHgySWh0?=
 =?utf-8?B?SnF3d2pIeGs4YkxROGNPM0JtZlpWbG1UUTUwZHh4UTd3ZzVlMUV0azcxSnpa?=
 =?utf-8?B?c3pvemZOeklOQUJTNlJqQ1VCR1hkaTFxSFFRN0pBQ0tmUUJ0QmpxNitrc1BJ?=
 =?utf-8?B?OE44UExQWm9aNHZxYVpib3A0d0VEb2s4S0MvWnRwWTdTR3pZMDRHQlRzdndo?=
 =?utf-8?B?QWIwcWxaUXljSExIemFlVXhoQ1hHQU4vdEpqeU9jQmV6Q2dabHRrb3FPZTJv?=
 =?utf-8?B?MEdsQi94SEhmZEtQV0puKzhkWHJRVnZwcmtrT2RsRlR3TUZTQlE4bENWN05X?=
 =?utf-8?B?OStVKzR5TEZVdjdTd1BkWlYzbUpQbUZ0RW5YWUxhbWFJdllYdXNwWVA5RFVx?=
 =?utf-8?B?ZVBCWmxobnh6bnYwR2w4YWcvM1VhdDFIVkk2eHFhY0IyZjhvZTluK2lIOXY3?=
 =?utf-8?B?VXpwQnphWjZmenBCVlFDVjd3aE1tUjI2cEk2ajFnYnhaUUlKTjluaVk5ZGVH?=
 =?utf-8?B?N3NKNXhzTHQrbWx3K3pydy84RWZ0TU9tV3hNYUNPU2ErVHJ1anRJZHU3aVpv?=
 =?utf-8?B?SkE5QTNoelVDK3A3eVhoOUJyR1V3SUN2NHdObGNka0h0aUxpRnh3N0NSUFRs?=
 =?utf-8?B?blpKazF5ZnZLTndiZmhMUTFyU2h0eWM4a3d3dkVpek5vdFdBdDRGTlJ6VVZV?=
 =?utf-8?B?a1NyS2dSNVNGOE11dE1IYk80Wk53cTJnM3ovMk1ySDNmVzlBemFaYnJOb095?=
 =?utf-8?B?TlNXbFptZGZOUkpkeFk5NDc3SGJMczJtdUhkdXU1S2RzdGRwQjBsUGhEVWZq?=
 =?utf-8?B?NWJ6dHJ4dzQ5Ykx2WjlVdXQxUXoxUXZYYzN4d1VQcVJaYXhoWUhtYm4wcmx5?=
 =?utf-8?B?Ry9ZN0ZTcGdGeEIwaVpNb0cxVzVMNHI2VnlBNzZoZHZJVmVnSmpDSURKTkQ4?=
 =?utf-8?B?WE5xVFYyOWtyZUNENlFKS3FhV2xIQmNKQkZnSFYrNThzZE9HYzVOOXdObUtY?=
 =?utf-8?B?VWJlUC8rNlB6dG95NERkb2cwdENHSm1EMDhvQUhzTXFuSzc5VU05UFpXVjVu?=
 =?utf-8?B?NUk3QnZleXpQVWRQb2pDU2xXYnlVSGgrdjNpUWJYa3NUZ0U1ME44bnhZVTBZ?=
 =?utf-8?B?V0MvZGZManIvR2VGR21OWEo1Q0NGam5iZFNaaE1HRjhtZnp0ZUM2OGVjYU5F?=
 =?utf-8?B?dDQ5eW1OSy9YandEZ2dFY3M1TmMxZVYraW9hbWtMWnVMTXJDS0NHYlJ2NTJo?=
 =?utf-8?B?Nm0yQ1ZPUW44OVBubzY5ZzdOOU1lejJ4VEdia3RwR0hxblZ3Z09qWlFNQUg2?=
 =?utf-8?B?OGExaUM3TXBqS0J4bGtYOTBuWHdMRmRkc3JYNlpEMDRPTWNlbGxHQ1RiajRt?=
 =?utf-8?B?MHVWWE05cUNJUnFRNDJUdFBTTStIU0tMc09tTzZTODZoMnNXcHVvYm1LYzVn?=
 =?utf-8?B?NGg2WFhSSUw4anh2VG1MMms3REhXcFdVNkRSZ1BxSld4V1o5dDhVRWFQNkFF?=
 =?utf-8?B?US82NUdiMGtlYkFySUNwVnRwWWYzdXMvVDdqY1orYU9NQUlMZW5FU2dmNXhP?=
 =?utf-8?B?WDVTYUVWZ1IyMWFJN28rbEZvUTg4S3JIME52Mld2bktJK1NVNFNpSUZEcE9G?=
 =?utf-8?B?YnAwc3dOdDBiR1dZNExzSkc3NFlJOFR0dkwybXhmV2Z4L3JnWkU2dkt4cUsr?=
 =?utf-8?B?dUJENCtNRHRJV0V5Q3NjQXB5YUJPaFFPSXdvRCswc21iZ2JEdk1ndVdVYXlZ?=
 =?utf-8?B?Wlk1NFNRTUU2SWlkbmhWNzJSNG5MeE55VkZ3THYwOE1OM3FYLzNQd3RMWjdF?=
 =?utf-8?B?S3hlQ0RqVERoaHNablNmWFdYUk9MNStSbU5RcnFDUGJ0eFB3Q1pocmpMSFFN?=
 =?utf-8?B?eWxSRlNtMnMzRjFUSHVDeW45RGdHL244OWt6NlJTUzdZRFRDUHVjTUxzWWNp?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0238d91-4d95-4b74-63ce-08dd60ae3232
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 15:05:44.0745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lG570+/wC+SU39vk1pQ5QidUIRYpxTWG/R3QbzYwoqM8juaQQ4/BLhO4RS47TAJUg3+KZ1oechD7L0jYAvT3W6WHUAPGhU6Ra+4z1kH8Kto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6796



On 11.03.25 12:24, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Some of the PCI host bridges require private data. Create a generic
> approach for that, so such bridges may request the private data to
> be allocated during initialization.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * no change
> ---
>   xen/arch/arm/include/asm/pci.h      |  4 +++-
>   xen/arch/arm/pci/pci-host-common.c  | 18 +++++++++++++++++-
>   xen/arch/arm/pci/pci-host-generic.c |  2 +-
>   xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
>   4 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 7f77226c9b..44344ac8c1 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -66,6 +66,7 @@ struct pci_host_bridge {
>       uint16_t segment;                /* Segment number */
>       struct pci_config_window* cfg;   /* Pointer to the bridge config window */
>       const struct pci_ops *ops;
> +    void *priv;                      /* Private data of the bridge. */
>   };
>   
>   struct pci_ops {
> @@ -95,7 +96,8 @@ struct pci_ecam_ops {
>   extern const struct pci_ecam_ops pci_generic_ecam_ops;
>   
>   int pci_host_common_probe(struct dt_device_node *dev,
> -                          const struct pci_ecam_ops *ops);
> +                          const struct pci_ecam_ops *ops,
> +                          size_t priv_sz);
>   int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                               uint32_t reg, uint32_t len, uint32_t *value);
>   int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index c0faf0f436..be7e6c3510 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -209,7 +209,8 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>   }
>   
>   int pci_host_common_probe(struct dt_device_node *dev,
> -                          const struct pci_ecam_ops *ops)
> +                          const struct pci_ecam_ops *ops,
> +                          size_t priv_sz)
>   {
>       struct pci_host_bridge *bridge;
>       struct pci_config_window *cfg;
> @@ -241,11 +242,26 @@ int pci_host_common_probe(struct dt_device_node *dev,
>           printk(XENLOG_ERR "Inconsistent \"linux,pci-domain\" property in DT\n");
>           BUG();
>       }
> +
>       bridge->segment = domain;
> +
> +    if ( priv_sz )
> +    {
> +        bridge->priv = xzalloc_bytes(priv_sz);
> +        if ( !bridge->priv )
> +        {
> +            err = -ENOMEM;
> +            goto err_priv;
> +        }
> +    }
> +

I'd like to propose to move allocation into pci_alloc_host_bridge()
to keep mallocs in one place and do it earlier, before proceeding
with other initialization steps.

Also the pci_alloc_host_bridge() could be made static, seems.

>       pci_add_host_bridge(bridge);
>   
>       return 0;
>   
> +err_priv:
> +    xfree(bridge->priv);
> +
>   err_exit:
>       xfree(bridge);
>   

[...]

-grygorii

