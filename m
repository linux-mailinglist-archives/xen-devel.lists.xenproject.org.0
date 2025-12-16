Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA054CC5888
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 00:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188480.1509641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeru-0008Sf-C0; Tue, 16 Dec 2025 23:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188480.1509641; Tue, 16 Dec 2025 23:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVeru-0008QU-94; Tue, 16 Dec 2025 23:54:14 +0000
Received: by outflank-mailman (input) for mailman id 1188480;
 Tue, 16 Dec 2025 23:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKfF=6W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vVers-0008Pw-JV
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 23:54:12 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 822b1f42-dada-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 00:54:07 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB6462.namprd03.prod.outlook.com (2603:10b6:510:a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 23:54:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 23:54:04 +0000
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
X-Inumbo-ID: 822b1f42-dada-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atn/qjheBJhvTR+3DPvNBRYSHLh1NBGeAp6O5zHEGnwdDIVkE4sX8ktpQpAIR13DPaAcSNl8Dl+JX2CPzoz0d9Jpj+8cP7SQZbfiWnEgM7jcZ92Np7JfvG5dfAm8Z5MAbDTSzo+B81cYKwxEwW2lsQzx1pJWGulkCLj3saJB657F3x0q1LubMIboaVTOujapYTnYX3YWvEytMhfi5sw/aWY9Ir7niwRJCv5l/NhTit85Q4Z3LxnAlvx0SyXh6aTRyCVFnUaGBy0GC0z+QVbmP9anLD7u3jADaiM2jtvsAwjVXXBkC2RKX7praKrAc1av+/bZml1ON1XB4CGi+f7kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8/R72zQa7IeFs/3n+DP+EKlqh0IWKcFs9CGcO4hif4=;
 b=ECBTdBRNT4vEyMZuRc0z9U/4tDpUZVoKHJzG4tI28po5dJMGM0xhXN8Q/4AfJeoXIkKM9kpaaLketgLKNWJFyEpT7JajsvKMUAuC52jTny8DCeeyd58qm/EOP29NiUIOvnT+EQTrpNFm45nLjVyKZf640rXI+FmvPcdeiesDSz82iRQxSHNvYapOKXB1ZxUA1XnyZML9ltQudxVHceWmOG/EHLkH3SUbaMh5Zv4aaco/CzTTRSk9K/gz/vfHDZvNPPJYuSUpbIAPi+gtAhaUgVFtU91hqFZMZle10vQRMRkCJlUwRk8VYUIje85Sx4J/F0COaFIFiqSmCDZahzHeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8/R72zQa7IeFs/3n+DP+EKlqh0IWKcFs9CGcO4hif4=;
 b=SnV3cDgYDPSyob9ySQ6RQH56IHD2RJe2zd3kvy+QIb+eywSz4cIK18uF1Zhb+/Gq8gSD3v7r36u04jwWIeLpT97VRIc63ezCrdC3bYYavpC62UTnn49iJryiwT/R6CsBPEOR0UOnUFTU5h6X+QraxMnUTvtSIYGjBHRma8b1hPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <63b6f29f-29ca-458e-8d6f-3408e84173e9@citrix.com>
Date: Tue, 16 Dec 2025 23:54:00 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: X86: build failure
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ee2e801-9a3a-414d-9df9-113f419e02e9@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <8ee2e801-9a3a-414d-9df9-113f419e02e9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bd6b10-4c58-46e3-00ea-08de3cfe64b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3cyNllxZjhnenE3eHNHTDRnc0luZXFSSXpRa0VNYlV4akJKRkR2OVVUaEMv?=
 =?utf-8?B?d0VwOFN5aElvUU8wTzFETFpsUFE3VWs3SnRrck4yWXIwd2ZTbDVOYmRUU04r?=
 =?utf-8?B?WE44RHI2WXRqSHdFRHloaU1vcTF5MUliS3EzcWxjZHd3Q3ZoaEpHejRPQVk2?=
 =?utf-8?B?R0ZzOXc3eWNwUFZNMUdRQVBIS1A1VTVSKzdzcm9wMkRxZmtOZlp3dkhiNGlh?=
 =?utf-8?B?SUJmdWFURlBLblZYUDMwb0hvb1krTTRybHZtdTJNM0t1cGZzYWdlanJFa2tZ?=
 =?utf-8?B?SE4yUC8zSzdSR0E2cTJ6MGFVUlBtQjh1RGpxbU5wcWdZSExJdGxaamNtYnhK?=
 =?utf-8?B?WnlaVU93OVhOTDlFbE51aDhmQUVoOVlCYmRuSXVxREd4OHFUQTN1UHhCZ29I?=
 =?utf-8?B?d2dQS2NxRHYxZ09hdWRzUlZ6QStZWEVqU2M4OFpBU0VGZ0NBOFA4SGNranQw?=
 =?utf-8?B?TytydUFLMGcrYkVTNTdaUVQxRThkdm5mc2Z3bGxvOURRN3NGeVRGMDR4VGFx?=
 =?utf-8?B?RkVTbTFvSGVtYURxQlU2cFlQODZJNjg5TEtHS3VCSmd2MSsyNmFSZDkyTUR5?=
 =?utf-8?B?aGFYR2RNK012VktsaFNzcVJXeExPbFpvSTZIMEg1OFZTZTBRcmVPTXQxaFB4?=
 =?utf-8?B?enN3ejlQbm1RSEJ5TFJZUTZ6VTkrNm4zNGVabGFiWkFCZmFlbXN0Uk0relJS?=
 =?utf-8?B?dGpGQW5WTThuTmdVY3MvWHhaM3N1Yi80QzRWUjJJV0ZJMHcwY21aaFhPS0M4?=
 =?utf-8?B?bTF2dEVUQ0hmd1dISkNZZkVRVi8xQXUyRWJYdjl0MDdLZzJFRHVhOTlSWk9Z?=
 =?utf-8?B?dlNIQ3BSalFQSUc4VGpDUlRUTG1EbE4wZlNqS3czY0F4SEtaRWYvU0N3ZklN?=
 =?utf-8?B?Nk5qYTRRVTdWMXNMZjdnMkhNTy9ZS2xsbzFPdGcvRVRCMFNHOWhSOHhnU1N0?=
 =?utf-8?B?WXN4UC9Xc1ducHVNV0lsYVRqQ09qYmNtWjUveW1yYWNuZE5VczBBL3FFcjdr?=
 =?utf-8?B?Ukw1V2Vud2NDVUUwdWtIZmVLbDRTQkhTNWsvUGwyK01HdTFVVzc5RDl4R1hH?=
 =?utf-8?B?RmkyVElValh4S0RHM09RTmdLSCtYb0J6MDJkYlJOaVdOVHUrK1VpTGtEUk02?=
 =?utf-8?B?RldIUWcvUHRxdGdzeDZKS0xoanNLdGlBM2RTcGFMUzhnMHZweksyUDZBUDVX?=
 =?utf-8?B?Z1gxemNvUlFLTjkxdzIrZkRZaTlFY2xLV0dWYldzbkM5dDZMTGtsZDdkdzd0?=
 =?utf-8?B?c3ZmcDJ4WWJBdmw1bFprQWZVUzZ4MjVFT1plYjRGRHN6NGpsKzQ4Zjlsd3ly?=
 =?utf-8?B?ZW9UN0xEeFRyempoMkh2cmtSRGYreWliN2F2Ui80c2Ura0RHMlRlT0tib0hv?=
 =?utf-8?B?R3FvSnNQNHc2OWtpTlBxNXArWktYRG1zT2lKcVBzM0hGVzA3RFR4RkxVeUFx?=
 =?utf-8?B?Ylp0VzE0bExTM0lQayt2YWZCN2ZyK1JLU2RCWFdpUzc3dzZWc1Z5NDR1Z3lX?=
 =?utf-8?B?TzlsNFd2NDFITGsvOFltOGYvcS9kV1B4by9CUEpJb0hqbktNTHBhbWpCWm5O?=
 =?utf-8?B?SHdIVnVXQmRyUmR4LzYrVkw2QkNnS0NYOXFpYXViM1pBQVR5aFUzVm9Nc2dC?=
 =?utf-8?B?Mi9WbVBqR2JJQjRKcVIrdzVXSjZJNFZhbG11QStlLzhFK24xa0JLZytUZVJn?=
 =?utf-8?B?dnlSaVNDKytsNnQ0U1JuWnBIU2U4ZW1BMVMzYkNBVit1amFpbGRaNEtEb0JC?=
 =?utf-8?B?U2JBUCtWUXhIbEkrU1VOc2JSU2JnODR4SnJLZ2dJaURES0dGV2hjT3lGQk5P?=
 =?utf-8?B?cjkwTktYYmQxdldtZ1lVcjBUMUcwNkJGV1QrTU5FOXFsU05zOFdvM0xtVSsw?=
 =?utf-8?B?V1dmVkUyRlltYjlBOW5SNDlkNzUvOG5WTEl4VHZyTEZWbDdINTNrQ24xejRN?=
 =?utf-8?Q?XXZbXlDBY0lfCqXqP9w0zfq6NiK3E8Y2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3JaQkF2eno0YVVnejVwSlZ0VDhIcWx3Z1RGUVhwR25lVmlEMjVQbEVnTnhk?=
 =?utf-8?B?OUEyT3VBb3BzUGZjWDRyQkdLdnFyeXhPR0lCS2Y3U3ZDczM4L1dCTTBScERS?=
 =?utf-8?B?TUhONGNpSWw5TE50Z2JqQmpOaXJWeEl1RkowWm04ZkZycnRNbXVlUXJPUDRB?=
 =?utf-8?B?ZUZVQjJVQy9EUmdmOGJSV0Ywa01UTTllM3pCdzBWS1EwcXE4YnAyclljL1Br?=
 =?utf-8?B?R0NrdHJ5ZkZrZUxWT09CQWtPVHJwWHFBYXNHdFhIcld4aEVhMDJjdlN3V2c1?=
 =?utf-8?B?Q2tseG1WSWNDVmhqZmtBVFVkd0hvSTlQZ2tFT2E0V3JuVHF2N2VOMGRqelZB?=
 =?utf-8?B?eXV0c1k4WkVReDVDSmorMFZkVmtkWEx0czhzWWxuZ1lCYTY2ZnVOZEEyemZP?=
 =?utf-8?B?dDlaeXdBY1J2djY2TjVUK0JMYW5Ib0dNcXducWh4bkptNlFvRGpXMFNhaGdD?=
 =?utf-8?B?emMrb0dzVllienJwZ2NiTTVOZHJpczJ1Rkw0cEVucnVnbnRDZ3FpOU9MTEx0?=
 =?utf-8?B?YVMwWFdabHVadFhKeUNiY0ZkQk1UczB2RFRpVjBqcW8vNTRaVU8ybVIwRXJZ?=
 =?utf-8?B?ZmhURVNTeFpDMW0wZ2w5cDQ3NXZOQm1FV3NNN0s3R0ZicnZ1YStmS3dqWC91?=
 =?utf-8?B?clpSZWxKcUcwbnhKM3d4SGp4dU43cDBzYURmY2VaL2s0Z3g2NHJvdTgxbEsx?=
 =?utf-8?B?ZmQ4UlNaRG1qNlowMm04c3d4Z09veDFoWVR6Q0FUVGlNTmxxZmJxWHBVVjBB?=
 =?utf-8?B?cCtuUmJOeTZRK2lCRmVXTGxqN3IyYjR2ZzVaakxlNFV5MHdwdHZnQW5iZUlT?=
 =?utf-8?B?S2RGMW5OUE9rWlNseTd4QzB4WGdIdnpCOC94Nk5mOXF0Si9idXNKTnlQNHM2?=
 =?utf-8?B?TTN1QVRJV2RWK3NjbDFYSEdzVnkzTG5kVEV4RXlaM2xmbE4zOHRrZWpScTQ1?=
 =?utf-8?B?QmVWUVUyeTB6b1RrQ0JEaCt5emlyc2RJaytEMm9QUmxYYmFycUd5dW1QblN3?=
 =?utf-8?B?dS9HUENpMmswNUNidmZuOW9xaUcvQk1LVUFBWC9yWHJ1QmsvNU1xWTU3dWRG?=
 =?utf-8?B?Z1ltOTBENU82SDd4Qk5JdllpMVpydnEwQTdMZXA2ZE84eU1oVGZCNmgvWnB5?=
 =?utf-8?B?d29LbVhnYXRnT1lieG5ITml4SkU1bnZ0ZGZJS01zeGJJTVMvN1RXYnJra2Er?=
 =?utf-8?B?YlJiZk5sV05MTmY2ZTBNVzhMZFlUMUMxNmEzV3Q1VTMyblQ0eFV6aEtxNHdN?=
 =?utf-8?B?Ymk5V244UkRYOE1vRFJUenMxY1ZvZ2NJcDVBeStNOWRDdWtIQkRVRi9SeGFh?=
 =?utf-8?B?R1NqcjJRUWNzejMveGpNWmF2TmRja0VIV0tBcWJqTmFneDJkVzlxZkQyQWpM?=
 =?utf-8?B?d3NGNzJZdHNPSEpkTUJFK3Mwa1h5NXYwUFprVVBnUzlMYUhmcGQvdktxeGU4?=
 =?utf-8?B?WmU1eW1ZeERNR0JTdnNlQWEvSWpBbEk2akY5akNxZEtwUDVXWEFUNTJxcjlD?=
 =?utf-8?B?OWt5TWRWR0N1bEtWZFExOUFrVWtyR3lqbE95S0hSbzg3eGg3M0w2YWlQT3Fk?=
 =?utf-8?B?MURkVDdGU1ZMaDdpUVFMRVpsMTJoaUhoVVR2SWFzcllvQ3RDK2swZDZneFM2?=
 =?utf-8?B?RGRhVDFmK3BxWjY3TDNKVGd6RkhxL2VHeVl3bFVCKzJjMVFGQ2R4OEtBbFRD?=
 =?utf-8?B?K2xPMWdYaGk2SjhXZ2RsMCtmeFhrUXJpTWlkdy9laUhIY3ovYzc2RFp4Z1Ji?=
 =?utf-8?B?UTg5ZWFRK0oyYWhNRjdBVnR4UitOZWVsRXo1N1cra2c0MXJWSkxVVjZDaWVV?=
 =?utf-8?B?T2ErMFFhL0JGUGhuczBqMTVKRTZQSU4zRDcwZVI2NTEyQzNkckc0QVQ4ekc3?=
 =?utf-8?B?dk1wN2N1Z3cvSW5mTTl2eFhNSUZqZk1oNHZKa01CNS9hTkdxNlA5RjVTdkEy?=
 =?utf-8?B?ZGtHbVZHTTh0OHd5S2l3MWVqV1dTMHBSckRBbXc5R0FqcnF6Q1pSVEtHYkk1?=
 =?utf-8?B?R2kvNmkyUm1TVXN1Zkt2SGVRQmwwdmliMDhlTHJCUXRhT20vcGhTR0FzSlBV?=
 =?utf-8?B?V0ZoUElZL250WmJXMVUxdEo5eFg2aGIycHhTN1BOTUlBZGhZekZvNitZekRS?=
 =?utf-8?B?M2tTdGwyVDNWdlRHcmVjamc2Z01CVW9NOVVYa0x4Z0JZczlXRkJ0Tlg1dkoz?=
 =?utf-8?B?ZU1pYk5JU1BRODV3VWdNZEpqbk9QN2tFNG00dldhTGk5UlBuWUVGSVduNEEr?=
 =?utf-8?B?bUJwbThjc2U4V3hrbzAzdUZxUXJSRXJhR0ZXOU9jc29MWExTVnBVeVVaYUJm?=
 =?utf-8?B?TGlXWEE1UHJ0Nlhwc0o1ZjlJc042WUJRRlZtVGI0THVJYmkvaDFtLzRGOHVx?=
 =?utf-8?Q?G+aNBol8X7WjEf/g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bd6b10-4c58-46e3-00ea-08de3cfe64b1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 23:54:04.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KMbCTfcb6i92e+05Ec4lsMsuIH3fN2LrTzWa0u6CKPZ3SXs5Epy5NjEgKl/npL5KNrBjVCzwBEJL2f68l0U/0bMQv3SFzJ05FMM/94y9J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6462

On 16/12/2025 11:35 pm, Grygorii Strashko wrote:
> Hi All,
>
> I experience build failure with following Kconfig combination:
>  CONFIG_DEBUG=n and CONFIG_XEN_IBT=n
>
> with gcc:
>  gcc --version
>  gcc (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0
>  Copyright (C) 2021 Free Software Foundation, Inc.
>  This is free software; see the source for copying conditions.  There
> is NO
>  warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
> PURPOSE.
>
> Is this known issue?
>
> ====== log ===============
>   CC      arch/x86/x86_emulate.o
> In file included from arch/x86/x86_emulate.c:27:
> arch/x86/x86_emulate/x86_emulate.c: In function ‘x86_emulate’:
> arch/x86/x86_emulate/x86_emulate.c:70:36: error: writing 1 byte into a
> region of size 0 [-Werror=stringop-overflow=]
>    70 |     gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 :
> 0x8f; \
> arch/x86/x86_emulate/x86_emulate.c:78:9: note: in expansion of macro
> ‘copy_VEX’
>    78 |         copy_VEX(ptr, vex); \
>       |         ^~~~~~~~
> arch/x86/x86_emulate/x86_emulate.c:8140:13: note: in expansion of
> macro ‘copy_REX_VEX’
>  8140 |             copy_REX_VEX(opc, rex_prefix, vex);
>       |             ^~~~~~~~~~~~
> In file included from arch/x86/x86_emulate/x86_emulate.c:11,
>                  from arch/x86/x86_emulate.c:27:
> arch/x86/x86_emulate/private.h:691:17: note: at offset [0, 4095] into
> destination object of size [0, 9223372036854775807] allocated by
> ‘map_domain_page’
>   691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/x86_emulate/x86_emulate.c:60:21: note: in expansion of macro
> ‘get_stub’
>    60 |     uint8_t *buf_ = get_stub(stub); \
>       |                     ^~~~~~~~
> arch/x86/x86_emulate/x86_emulate.c:3354:15: note: in expansion of
> macro ‘init_prefixes’
>  3354 |         opc = init_prefixes(stub);
>       |               ^~~~~~~~~~~~~
> arch/x86/x86_emulate/private.h:691:17: note: at offset [1, 4096] into
> destination object of size [0, 9223372036854775807] allocated by
> ‘map_domain_page’
>   691 |     (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) + \
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/x86_emulate/x86_emulate.c:94:21: note: in expansion of macro
> ‘get_stub’
>    94 |     uint8_t *buf_ = get_stub(stub); \
>       |                     ^~~~~~~~
> arch/x86/x86_emulate/x86_emulate.c:3402:15: note: in expansion of
> macro ‘init_evex’
>  3402 |         opc = init_evex(stub);
> [...]
>

Hmm - that looks like more of the GCC 11 bounds bugs, but that's what
the gcc11_wrap() visible at the top is supposed to be fixing.

Neither of those CONFIG options ought to be relevant.

Which Ubuntu is this?  Is it something local, or from one of our CI
containers?  Is this on staging, or local?

~Andrew

