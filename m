Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7ABF7488
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 17:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147424.1479734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBE77-0000zo-LL; Tue, 21 Oct 2025 15:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147424.1479734; Tue, 21 Oct 2025 15:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBE77-0000xk-IA; Tue, 21 Oct 2025 15:17:29 +0000
Received: by outflank-mailman (input) for mailman id 1147424;
 Tue, 21 Oct 2025 15:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pTU=46=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBE75-0000xe-EU
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 15:17:27 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c06eca4-ae91-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 17:17:26 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 LV8PR03MB7424.namprd03.prod.outlook.com (2603:10b6:408:192::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 15:17:13 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 15:17:09 +0000
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
X-Inumbo-ID: 0c06eca4-ae91-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDzwAmDsjhzRWVubBHhUsaTH5Ctb4eGcBM0hQQXAKw42RxQxEpMQUN4xR0J2ZPwQDunpQXBp6jsIqxvyoZH2syfqLfuVowA0fwVVYsN3LNa8zFU6QOJqksKXquvJnbBG9vlm+ctbpUZjYlA8wavFyaU673uewDg7bHVmhtiA8A2sRxXDwb9RzMVGwyn7l1x9mVSUEpqHoZHhihGsA8rOp9GxgQnQB+qWpTGG2hK1ilrG4C2pJsHklhsEW8yB6cWzfYedT3evRqZ+eeHhhvrk7j+8HZ4cws21rXliZllPgXaiPCxry8jGUoRU58dLnBXUlQC1t6ldqStfJJq2njtpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNRccFQkW9zyZSrbhB5i0/xoVRkVzNW/Qp35nnGE2Bg=;
 b=DfVl6L4YU4mQyc6EH1Yn49LPA9/POV9mi8U98G906w0dqZklivIl12lt2CSAx7Wn6w1kO+Dyt3sCnEQMfk5X3KeEPAS0miYgZ8xf2WvGBw0czpkr0ETBvGujSj35ZQmNmB9lwvIJ86C+Hi3hc9M6cjHCbBa4fCtFD08zF54MOIKqfxTvNW0pZGvVGhHxeQ0Dn2tzS00zWARkWFTbidfhpu87X/fhU028JrOXTOlV1HCADNUFcWWjs+3fgY6kJZa5a+E3EbdXm1adH734b+rcbDJY5ivXGNPdhKf4GbDIi60uzVDAd7tagul7s156vZ31l1XvI/aQmZ5/1m2Nc/JHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNRccFQkW9zyZSrbhB5i0/xoVRkVzNW/Qp35nnGE2Bg=;
 b=qp51OBHR6qsXpgj4uWsAq2QaQqoQ5xDL1pp4vyOFoFxVQTADqX8Krv5XxU0w3/3iEkNyC51F+fErWi4oHFqqcHomcMtWy4XTrbh4weQVWw9SfWDFNKks4kPl1KVpHMkkiXULVf2croYkExojx81HvVlaYiOZ9MPtx/WckNdNQ9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <52edb3d0-537b-4f8a-8168-1b0efc519b0c@citrix.com>
Date: Tue, 21 Oct 2025 16:17:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vtd: Inline redundant nr_ioapic_entries macro
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <f47bc8e2b6d3f28def51cc1861fda22d7658579d.1761057749.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f47bc8e2b6d3f28def51cc1861fda22d7658579d.1761057749.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0315.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::14) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|LV8PR03MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: fab082a0-2162-41f9-d6b6-08de10b4e677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czBmMVZJNkVRT3RURUpwa0w2WnE3SUpGU2Z3c0VRZHdSN3VmeE9VOGdlM01u?=
 =?utf-8?B?bS8vYVJWTnFHcldYTlE5ZjdpVjR2cVJGTVFEQ0JtQzJFZUE3bm1nS0V5Q0Qz?=
 =?utf-8?B?d1ZzQzcvL2xRZHZudmdEK25TeWtaU09qOExJU0g2SXRaN1MwaDJkcGgzcnFY?=
 =?utf-8?B?Y2x4R0pyRkdrRC8vUU5BdFFyVy9uamJEemhadmJ4STZJOUxDQ1ArWDNDNEQv?=
 =?utf-8?B?bjduV0w0aUx4UjdneEp5bk5mR05nU25ZQzFXNGZ1WmQ5L2R6S1pSY2VoRGNw?=
 =?utf-8?B?VkhUN1EwbU9KVXNKT0Y5OFFMUllnaFl6d1docGxsU1h0clF0NTFjQUZmS2Mr?=
 =?utf-8?B?R0VjOEFmcU9RT3ZiTXdmZ0lpanFscGEvMnRIbGpUTEdrT1VtVkxUWnVCSDlV?=
 =?utf-8?B?QVFRQy9GWEtOVXNSaW55K0ZqTW9oK24xSmh5L3FOaWJHRjFaYzI2SUtpQ2RX?=
 =?utf-8?B?VDJ0ajVUNTQ0L3pPWDRDNTJiMEw0QXR3bWxEd1Nvcmx6YjBvWUVaSUxjY3lN?=
 =?utf-8?B?aWZrQkszaktrY1dHcDEveWxEaEVWU05SZWttNWNzSjg4bDQzSzZsNlAwY1E1?=
 =?utf-8?B?QjFXQ1FLbitxUUpsU1VTL2RNeDk2MjN1L1hNVjB3OEVxamJnWTU2TVVRQmx1?=
 =?utf-8?B?WFUzZ0lmZldhRElLOVkwZ2EwbnJUa2RYejlZVGRXWkZjanVhUWtIODNLb3Ja?=
 =?utf-8?B?Q0NJdkFwcENnY04wRTRySVkzZE5qQm1TTWlXejZ4bGRQRDRTR21DRjVINUpW?=
 =?utf-8?B?b1JUbkxETlQvamluZ2ZFYzMzTzRuUmNmTlA3SjJVOHovdmxQc1dsWkI2NGdt?=
 =?utf-8?B?L3IrT1NaYVBQWnlERmV6VkNRNVhNazdHSG9uR1FRaWJxb2lRcHlQWC9ZM0t0?=
 =?utf-8?B?MnEzY0FMcHF6eGJYVUVQMnY0dXNERDd3aTN6ZElBRzltWm5XYVc5cTZPVW5n?=
 =?utf-8?B?UFd3ZGVGbVJ2K1ZWREc2SzBzT2NuZGltOEdSQTE1bTRXRkExL3JobFN0Z2di?=
 =?utf-8?B?ekY3VDhzUFdZVEFDUlJNdlF0MGhtV0tWTTNPcDNad1RwRTJaQ2RoUU9LYTk4?=
 =?utf-8?B?clZ5M1I1bEE0dFNneVBnM0xOalVmT0JJR2tEL1dCUlM5dzlJbWFRUmQrQW5q?=
 =?utf-8?B?VnNyeWJXQWIwRmp0YzNnWEErVGZxaUhzVjZaTG9iR2VxUlRvZVR5VDlzT21j?=
 =?utf-8?B?WDl5Q0Ewd1l1VGVZVHh2Vm5MWGZKUFRKRnFFUk1WOUcybzZUTlVxOGUvR29Q?=
 =?utf-8?B?dnNhZStmbC9ONzJiaDBydkt5Q1NvYVZzYk9aQS8vU3RBMytTVjlWMHFvSEV4?=
 =?utf-8?B?V2xxQ25WSXVrZmdNOUR6aTVqcUZFKzd5M1NnWmoxVzlSYlFqVGJra2FJK1ZS?=
 =?utf-8?B?dGNxanZ0V0Q4b0FjUWFtYXVHVmpuMHVGUktkb1hQMTVNZGtwdjNuNWlzQXVP?=
 =?utf-8?B?ZDhXRWJiR0c2NDVnQlVXOEp2OTBlZXFvSlIyUFBTK1Z2WTBNNnUxKzg4WFYz?=
 =?utf-8?B?SStHQ3Q1Ynlka1BmNDlXa2ZXM3JQWkNodVVkNFN4VWMxcENnVUt1RFRGcmVG?=
 =?utf-8?B?K2lDU1BHU2Z0Uk1rNDVhQkFGa0M5bExOYllmc0tVSUNMZnl5R3BNOFkrMW9T?=
 =?utf-8?B?WWt2ODFYS2pxcys5cCtRK1hGN3MwV3JMWmgyM3pkb0lWektsSWlTSTMyYVhK?=
 =?utf-8?B?Y1FoRHZGcG4yS2U0OTJUYU51aXExOGw5Nk0xWSs1bG50Vk5qM3h3SXZnRjlQ?=
 =?utf-8?B?cTAwY0NMWFh5QmVUZDJML3RQQUlYMlBYWWQ2a1FvYnRiSUx3U20zeGpGRFZP?=
 =?utf-8?B?WSsza0wxbXRabU1qTHFDd05UYm1XZzFGMjdBVEJWUWNoQTgxQmJ5aGxTUGxP?=
 =?utf-8?B?ZXVVR2tIazJob2tBQkxRZFdYZXVCeTl2aCtsYTcvRFRIaFhyRTlXb3U1em9o?=
 =?utf-8?Q?iLUOuwif031vO+5JRL4I8xOOcP7haxEP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amhrbGxtNmYrMjhGV0FPRnlqdlkyYzRNdnowVTBOeXRLTU5WY3N2SWl1RXhS?=
 =?utf-8?B?Um42UmtsWjhsdmdicXJ5SVcvR3QxbTA4V094bFpFd2JCcURtdWJhVndBN2VD?=
 =?utf-8?B?R1B2dWJrZTRpMERraUxhUjQ0TktvdXpqcGFVNWVOTEhzSFN0WXAyWkxuM29n?=
 =?utf-8?B?S1YydGxDTlB5azB4ZjhkVnZJZEZ0QUtmM1ZpSENBMDlJQld6alJIWXNFOHBX?=
 =?utf-8?B?NEtLenJFOHI1cWRIS1NlNWtuYlAzQzliQURqMEV1RGhxc210dkxSMnVUQ0kz?=
 =?utf-8?B?enhNUjVkbGNlR2s5K2xHT1pOS3VtTk84QldnQ2NvTnRCc3kraitSblZENjBs?=
 =?utf-8?B?K2dDY0JSZFZlQTBvdG9iVWk5TG56TlBIbDAwUU1sLzdwdG9vRHRzNWVhTVdt?=
 =?utf-8?B?OGdxRXRCc2lXcnB5dWFmMTBBUnlVYUpQK3FTMGUrbDFtejdkMytrQVEzUEQv?=
 =?utf-8?B?dGJZYzJBSlRGaXhQeFl4SDBPVGkzWlFHMUZVUjQ0dGd6OW05Qk1JajZvZmNh?=
 =?utf-8?B?ME42TTRTb1orSWFNTUY5dEZFQmdBK3p5RTBaSXQ4cERUaW5sbnZRREtZMzh1?=
 =?utf-8?B?VUg5YkpndEcyTE84RFZ1UEk2K0FLK1JhK3BLSStFYWlDRVR4UUlGMjBSMER6?=
 =?utf-8?B?QXlHS3BDcUo3dWlxN2hBWnFJczA1ckdVcGxEc3E4Uk1UdGgwaGJrMGZNa2I1?=
 =?utf-8?B?bVo3cGxIM09yS251Mkk5eVFwSHZtZUFCTVRrNzNvcHI1YWZtQmF6UCthbkVq?=
 =?utf-8?B?dG5NcC9uUm5NZHpHbW5USThsZWJxYUZiU0dHNkVvajU0bTg2TVhXei9iVFc4?=
 =?utf-8?B?NlowVHFFRTJWMncwNVhhTEwwSlROVXdlZnQ0U0g4THVISnBMMjVjbCswTWZ2?=
 =?utf-8?B?QkxLZW93NUowejMrMFJVNUJ3RGpaUGxodHVwVUhXZ3RaRHJnZStBeHl4aTNO?=
 =?utf-8?B?SW1ReXJmalE2VmpCaDdiTWhlalVVaTg3dXVDOUNFR2QvZXNYRllMRHJLNEVv?=
 =?utf-8?B?VHhWN1RJb1pwVmdQbmNJMW4xZFBtcnFHUUczMGtzVVVnSDc5UnFsRkJsRVFX?=
 =?utf-8?B?Snp0dnZFK011NUtTY0M4eG9FTjlZVmlNQ0VFU20yWDY5WXdETHZEN1Ava1Jp?=
 =?utf-8?B?Y1I3T0Zad0MvSVRuTnI4MjVvZ1VEOEFqWC9wQzZnZEVBUHdRcEJPa3BEMWVy?=
 =?utf-8?B?d2xYU1pHT3Q5SFJ1dVplUVFxdkhQZElGLzkrYW1nMzJHb2hGcHAzTm5pSkRU?=
 =?utf-8?B?WmpSRUtDNXpkU2w5QzRtMlh6Sk9ZZ3A1T0dDc29NaDdZRUJoa1V2d2xaeHVx?=
 =?utf-8?B?THpNQkdkLzQ4NFdGQ2FpajRua1pKb3l1NFFhdzd4YzlteVdBeXF6VVN1bnNz?=
 =?utf-8?B?RDhQMTZwNGJIcWlaaCswYjZibkkwQ1F0YWJNdHlhQnRFdkRZV3hhN1RyVkg0?=
 =?utf-8?B?MWRJU2FacVRyYmFpRTFjeXNXd1Q3OWRsL2VYaWtMb0hrV3lEWkh6MHJYZGZL?=
 =?utf-8?B?emFEYzBFUDl0enpYL0J0QXF1YWd5S3p1eVh0Zkdqby9wa2tHOU5sUm5hanBi?=
 =?utf-8?B?Smt0VlVwMGVvWFY5WlZ0VXpKeHd2SUwvektpMWFybEdDaGtzUHhIV24raVVV?=
 =?utf-8?B?bjlaR2t1TURIWkYvZ2ZsZzVDZ1YvY3ZPYnF2L1piajRZWFp5VklRREp5YXdY?=
 =?utf-8?B?elZ1aEZSa2pSOWFJSjFNQTJHSnpWd1NISVkxckxaa21BaHc1YVNVVEJISlds?=
 =?utf-8?B?dzhKcHNJcGJrVEpGUDJ6VTZyZGU1emxNUzNYa0xKM245S3hhSFcvcHZKNmNu?=
 =?utf-8?B?MHNKbk9pbG9ndDhQejBTU1pUaHdKWWV2Q01qbTNzQVlNQ1QwazU1cVNVRTJv?=
 =?utf-8?B?R3NVbkpocFU5bUk4OWY0Z04zSWl3TTFuTkF6SE40U1NUMnB6UFpTbXk4MUFD?=
 =?utf-8?B?UkYybStqYVF1bWdvSW9qSC9MQnJGSk1rQzB2R1l5QzFpMUNMdDdNeG9ZK29h?=
 =?utf-8?B?NGhLVGNCcStET1I5RUUxVWJEWmU0WUdRQ3Nla3FpaUJzRGVGQkJ4dGtGK1RL?=
 =?utf-8?B?MjdDK2lWOGlXbXhHajEwNms0eWJIRG5mRld0bVVWRFQzb2hlYkl1azRRWnRT?=
 =?utf-8?B?R1l1KzI5NkpuSjkxNXdGcGNrazZPUWwvd0IwaVNtdGcreVBJbHFTZXdGYTRG?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab082a0-2162-41f9-d6b6-08de10b4e677
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:17:08.9624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctPR2huERDrKMa+qxlmCsAh+paW+UxxD+7GDwk5lab54XRgqlTVeVnFmSEtKUpi2zYfVtO5C/DiH9EDgWNJ/LxiR6GcfRA562QH2uO2lEqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7424

On 21/10/2025 3:45 pm, Teddy Astie wrote:
> This macro was there when ia64 was a thing, nowaday, this macro isn't meaningful
> anymore and is actually a slightly disguised nr_ioapic_entries array access.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Queued in my branch of trivial things for 4.22.

