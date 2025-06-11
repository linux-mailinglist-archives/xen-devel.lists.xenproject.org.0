Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B995FAD5795
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 15:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011787.1390308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLtF-0000mc-Ml; Wed, 11 Jun 2025 13:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011787.1390308; Wed, 11 Jun 2025 13:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPLtF-0000kW-Jq; Wed, 11 Jun 2025 13:53:17 +0000
Received: by outflank-mailman (input) for mailman id 1011787;
 Wed, 11 Jun 2025 13:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVzw=Y2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uPLtD-0000Tp-EW
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 13:53:15 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2414::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a3385f6-46cb-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 15:53:13 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Wed, 11 Jun
 2025 13:53:07 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Wed, 11 Jun 2025
 13:53:07 +0000
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
X-Inumbo-ID: 6a3385f6-46cb-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgznPjePDqIEe8XD+M6k8Go6yT1GQ++gq2l1KzP1oN9TkzdGWi44dJKCXJG4KYdMNm93oGjqnADro6wtS8SoiZHxLjt8L1QVaVBrpSvE9fQbJtF484Wm5c4qDA/KQeZjA9M00HBNTMpxK8x4fMzLnwvo3cHi8jTqUCHaeUDQAvJvSTpmmjSAmQUVRHhgAJHOv5wTuofwW1pbfci2v7LN6FpJsfeVXjyZmNKnbE+YoOBIPvhtpqAXvLdADUquIK6tk6QRDlhqKm0F53+90elEtUkm+kqGBh1HW/yN0qgfeMT2bRDW5itNbOnasm9RIqYAHHxmFJfI+SA/f6/prwPvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUEqhfbrTqoFATdGeSIV975frBPi2IJjMsFogOGtq40=;
 b=osHES38iNlP/NrHrgyDcOX9ZZ1E8Re8YCdgJptHH9hIB7BQCOK7Yz81AaJI4XxsL/RXPrszUEB4uLQ05896PMn/+gT4QIC7RLAtcpRwpTQ0xZQ9rWV4gSgEcSxmmdjowM7UX9ubVhJE5znSYUjqwIBbUM9mIkav2h2f4lJYzoEx3k4jLJlRE8yfeZY1PqQpDK/sbYxRzVGZm9svG9kDe7fTM8TogEbF5HUPz3A3A7HQCgptiqEW2bTD8+0wGVMy29H1t7pvCG2C7dux3bfU/7DHgfDBtxccWflh6HQHLhG1xd6/02bOwDDDLw6VdO35KGFvwvgm7NLUGuHWztZr8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUEqhfbrTqoFATdGeSIV975frBPi2IJjMsFogOGtq40=;
 b=ICnlavNzkp5G9CVhdOVHa2HeUYtsF1Eyzlkhu+/M/Nn8knPDY8cAGX6IFqGD4GkeLJHf2JzdTmhiuTj/xye3QWT5bQF0Vz6CIAF9UpyekHYyu8GNcn77XxcvEqPPzo48TNbv9fHoo3EKY6ThWBm2dU+W2tKjZb825ZCb6D0O1OM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <27fc7c41-3a8a-4bfe-bed9-b05b33c2d73e@amd.com>
Date: Wed, 11 Jun 2025 15:53:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250609183438.178214-1-stewart.hildebrand@amd.com>
 <20250609183438.178214-2-stewart.hildebrand@amd.com>
 <6a52ad54-cac8-43fc-b396-87b0ac01d1dc@amd.com>
 <3ea5fec5-0083-4c83-9430-229550911b6b@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3ea5fec5-0083-4c83-9430-229550911b6b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: cd387e37-5a65-4c32-cd20-08dda8ef4b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aElXbFRSNGErVjVkUTVhRFRjQm1MSXkwUE1KZmxia1NTWnRVSE9uWVZGVHZr?=
 =?utf-8?B?OXJVamVsRUhTN21CSVg1UnVVOUlPbTR6S3BuMHEybXhrb0xLRGF2WmxYU3g1?=
 =?utf-8?B?T2phNDRKUHlJbUdIeENvREpQNC9SMWhNeFNPRUFlWm9SQkg1SU04ajBhVlJY?=
 =?utf-8?B?YlJkRTNRcUNGbE16KzZ6bFdLS1BlSklTVUE0bnV6NUxVb0txSVNncXFKdmZT?=
 =?utf-8?B?SnRuVFZWMVZRMzRYUzhTV1g3aU8zV05pa1R3SWlZZ2hDN0tQNFAvT2lqQ1BU?=
 =?utf-8?B?K24yUEJ6cUZ5YzVYREhoK2lpSVNkdXdNV1pRTzRwU3NhUHZKVU0wWHd5dnFD?=
 =?utf-8?B?N2g5M2dBcHdLeG9jc1FjQVAvcFJtSXhpUElXdWdYTkJ0STBCeWl6Wmxud1h6?=
 =?utf-8?B?c2N4ZFhBVUpDMWM0bURLc2ZjWHpCVmc4cVVScDk5K05nc3dwQnErd2lQRmlX?=
 =?utf-8?B?ZXA4YTV2T1d4cGVGN0Fvem9PSW0zMm8ybmRzQXllRmtKb3FaWlJVa0ZVTUcz?=
 =?utf-8?B?Ymt6dU1zeVdGM1RucktFbzBuUnRuWWRFK2doNTBCYTk1MHJYTEI4VFhOV05Y?=
 =?utf-8?B?WkpGL2tJVXJxdnM0RHVNV3lRV1N3RWVabzhSSThMZGNUQlFuWkZneVZsbXlp?=
 =?utf-8?B?MVh6TGRiajBEVG9NVERoRGE0RDdhRzl4ckVNOVhPWWFmMEZENE1QLzJzR2tS?=
 =?utf-8?B?UDNWbE9VUWw2M2R4T0NIZTNjelkzb0c4QnVjU3daVkVqSldFY0h1ekIrdERB?=
 =?utf-8?B?OWNNMzk2dWpGKzBUbVRHZGoza0ltVVphSDZOSGJEdG5uUmplamthYTRtYm1j?=
 =?utf-8?B?YmRNTENDc1Z1UGl6T0hEZmNRNXp0RHB4ZmZlWjdONlp4VVJuUTN3ZENVUk4r?=
 =?utf-8?B?WmQzRitEK3ozc2J5bnlkUStpL25ZcGN1U0RZYzVuWjJZUERMMlE3U2g2VGtY?=
 =?utf-8?B?S3ZqeXJWSUJwb2x4SE5sVlppYmxpT2Izb1Awc05kak9JZzlSS0ZSSkhMY0g5?=
 =?utf-8?B?TGpPKzB5bi9uVzVqM1NubTNWd2VQYVcyRS8rS3ErWmJGYlRIK3dDb0x3L0RQ?=
 =?utf-8?B?TnVrVHNvVTF4aG85S1FFQkxjaW9OMWVyVVN3YTkvanVkUUxVN3dZTXp2eWVZ?=
 =?utf-8?B?L2E5WlpEYjBWVHJpd0ZHU3V5VWZxSnFkUEpoV1lyQnZHSEtTSE1UWEdwNmM5?=
 =?utf-8?B?RUF3ZFRIQ1NyT2M5eE5vb3d5MEZGUTROZzY2K0VOLzZpb1QvUUtud3pIR2tW?=
 =?utf-8?B?VzdmRGtrTzFYSm5XWHlMTTlla3JtVnlrYnJaZDhjaGVVd21xV2VlZWhpMVh2?=
 =?utf-8?B?UXMxcHFUZm94eThPSU1NL0E1WWgwc0N6TTUyc1J0dUpVTGJhMkpPcDJIS24y?=
 =?utf-8?B?N2EwY2M2bmJobVZjLzdQUUJPNDhIRDNoSCsrSFFKV2lUVzAvMUp0T2g5ZFdt?=
 =?utf-8?B?VWxuZWJNbUdrbGtSekVqY0tqczhKbXFaL2d0d3pRU0QzV2FscDhRZ0NtMXFs?=
 =?utf-8?B?dlYwdldYeXV3ZnRNWldvNnJmdVNONGNiWjJMbGkrYmFsT2dCK2c4c0ZCbTdQ?=
 =?utf-8?B?QVo4Z1Z4VE9QNU1OT094NU0vWnR4ZG9XckY0Kzc3QXBxNkdUTDZxQld3N2ZQ?=
 =?utf-8?B?MHBPempsc3IwaHJYcnJaNnJwWmZGWUcyd0p4NTl3aTJLN2ZpUjZpTGdZN3Ar?=
 =?utf-8?B?TkNKa3B4bGpXSk9Za1JrRnFDMFVONGZab280OTF5OS9FSEQ0d2xubW9vTHNW?=
 =?utf-8?B?ZmlSWjRnditJV0RDR290U1QwSzluVVROWk93WUNUSTVVMTlITDVSOGo1cnhq?=
 =?utf-8?B?NTNSYk9aN215Q3lhWUkvVUZmOHBVV09YVStJdDVSV2ZwOVpRd3pyc0hiSnhk?=
 =?utf-8?B?aUhLSVdJUVNmYWEwdkFxSzAzQnNscjRoU05BZGFCY3NxNWJqTjF0clhsNTJK?=
 =?utf-8?Q?ggzYH71y6f8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1FKNXJreDdFNndmZWFXVWRhbVh1T3JxR2RtSjE3YmV5QUhadE11QnQ5MmN4?=
 =?utf-8?B?aVQ3Zklhak9vd09ld1FwM0NvTjgwQWlvMysxUEdCZkdZZmhFUWRvK1ppdktr?=
 =?utf-8?B?MzRsYUxVYTlVM1E0VXZ2N1N4dERMZjI1UDM5dVB1am4zU044N1pKRVpFSnQ4?=
 =?utf-8?B?eUpKYmxNbmFJNE9tbFVBajBzK25lNUZwOVNCSEcxK1FRQVZGdWY0aWNWc2ty?=
 =?utf-8?B?YzJDZnZDWEJlc2FzZDdtMks1c1Zhbk5aeWNyNVpvcHJBRmZtT2pqVVdZTVVv?=
 =?utf-8?B?cDBiOTBLTnBzVE5kK3NoWjYzeXg2Z0RsaCtleGc1SGUvcGh4czVYdXVsV05q?=
 =?utf-8?B?WFU4SGMzUCszanRFT3UyaHdBNXluTlVjNzRFMXlUQU9wbGRGTjI3RDN2T2xk?=
 =?utf-8?B?U0w2aEt6Q0pFdmgzaVlISmgzK3E5OTVhNlFhVmYweUF4NUVGNmsrZElhdmV4?=
 =?utf-8?B?Y01MRFpMNm0yRG9iYU03UnY5bEFSaUdhU21IR3FlOXE4N3QzTVEzS3MvN2Fx?=
 =?utf-8?B?ZnFNeENxek00UG1tN0tDRGpkUUFnY01ZYngxaCsvMTdhbWx2ekVFdW9iTDdF?=
 =?utf-8?B?d1dpbHZHMVRRb3ZodVdXVDM2ekdCMVZUQk9DWTJzdUExSUFvUURaazJUSElw?=
 =?utf-8?B?c3ZaYjBzM3RJLzMxaitUZVVVTVZ0a1JmY0lWZkZrMndCUDZieXlPUStvUzND?=
 =?utf-8?B?ZnJBcGM5Qis2ek1wT3FrcEVDUlQxVnZJVGFEaUxPOTRQZzQvc1NHVU1pZVla?=
 =?utf-8?B?bzkvWWJUbGZKMkxZRk1EK28zWUhFMEE3VkQ0NnUxZ0dXc3hhQjlDYzZ1T0RS?=
 =?utf-8?B?cE1YcUtMV2Q4WjlaRkpIMlNQZXJuMzNLaTcyN0xsVkNsaGtxdFhoeHJyak1S?=
 =?utf-8?B?UDdianpocU9sdk9WMDAxR2FtOHRSRFdTYVR2cTRrTFBDS2Z0UDVJYlhmYi9B?=
 =?utf-8?B?c0FoQXlJWEhNZ0taSzYza3VnRUpmamFFU0swcTgyZUpMYk80Sys2dU4rZ3g0?=
 =?utf-8?B?UmRJRkpGeWtLYlJkVU1sbkpXTkc3aXJGTTY5aDdTcU1zY0JaODllRG1qeERY?=
 =?utf-8?B?cVVyTTJnWjVHRW0rWUpIa21OYkQyL0dQS2RETjNSd295MGZVUHdIQVFXenBt?=
 =?utf-8?B?aGp5T1RLUitsWTd1TEpwUVprSDJMWVNVZVYycUpmdXZQSzBaV2cvNDIxaURV?=
 =?utf-8?B?RktzTlRmZmVxaE1EYkJOVFRTQkhqUHRTTVYrUU5LZjMzMkxSUW5UMkw2Q0g5?=
 =?utf-8?B?a0dTL1BLMWllamdCUGo1djhrUWVhcUJDWHo2ZS90ZFRqcmw0cGxSNysrWjVa?=
 =?utf-8?B?dHdCT1Bub09HT3VST2VyYXpjT09mbVZIdmtHVEIzV0pkY1J6L3VLdVI4d0RI?=
 =?utf-8?B?bXFtTG81Ni90eTNMbEl1QVRObEVOcEFSdGxuNSs4ZzZrU2hXT3ZrOXBWQVNJ?=
 =?utf-8?B?c09RZ0l6SHJFWGozd2FzZ1cvZGVFQ2pwQ1hEbkJmaUtYbzUvZVFCcmdRVWRP?=
 =?utf-8?B?U1Zpb0ZXVHdYZ3dOZ1BQQ2MwaGtDRnZacWNZY3V5VUYyUFNBaVQ0d0RwSlM2?=
 =?utf-8?B?aXYyOEpLV1NBYVoyRVhLcUVEbm5SbUFNR1YvRzRoUkpyQTY5dUhlczlEQ05n?=
 =?utf-8?B?N0RTaVlxTEcyanVEd3lyZmRsTmVxVVJKUWRLQWxFUmxiT2FPeVN0YXpnNVhO?=
 =?utf-8?B?MWwyMEU1dWxlMGlaRWNXcldiVUFGeWtqQWFLS3gwV0JTZHRhSUJwZThSTnlr?=
 =?utf-8?B?WUNxK3NOMmYvR1FKdHo3VXZtd2R4bXZ0K0JKZDVlYzlpRm5NWVp6QXJhZFc1?=
 =?utf-8?B?RVZNeEtrVXVyWUJ6dEtIUCs0NXRmVlUwUW1YOUlHbnBiOWZJTERSQlA2aUwr?=
 =?utf-8?B?ZkZrbUt0OFJXOFVCSndvVExPZGJYK1R3dnJJOHhWdVhlQ3ZQdjFsanBmOVpN?=
 =?utf-8?B?NGVlalR3Yzh3YU5PNS93V2dNMXcwVDUvNUVmN2ZrWis2YmNvTFZUaUVMcFpP?=
 =?utf-8?B?Vk91U2xQTzNGZjNJZjBBSm9wMCsrYVFiVmFjOW8wK3ZTWUdvQVBOOHZrblF3?=
 =?utf-8?B?RnVEMnlZNDl2cHpicU5lbFY5Z0ZUcWROOTFiZENycDlpeTJQNEZ1aUVmLzlP?=
 =?utf-8?Q?hGp4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd387e37-5a65-4c32-cd20-08dda8ef4b67
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:53:07.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AwwTFnAFhsf8qlVEa1OGSCuhTKsuvT46CQoZNh5kjDQQkKK09cjqtdPIXk2HNE1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151



On 11/06/2025 15:49, Stewart Hildebrand wrote:
> On 6/10/25 03:27, Orzel, Michal wrote:
>> On 09/06/2025 20:34, Stewart Hildebrand wrote:
>>> Similarly to fba1b0974dd8, when a device is passed through to a
>>> direct-map dom0less domU, the xen,reg ranges may overlap with the
>>> extended regions. Remove xen,reg from direct-map domU extended regions.
>>>
>>> Take the opportunity to update the comment ahead of find_memory_holes().
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> v3->v4:
>>> * conditionally allocate xen_reg
>>> * use rangeset_report_ranges()
>>> * make find_unallocated_memory() cope with NULL entry
>>>
>>> v2->v3:
>>> * new patch
>>> ---
>>>  xen/arch/arm/domain_build.c           | 77 +++++++++++++++++++++++++--
>>>  xen/common/device-tree/domain-build.c |  5 ++
>>>  2 files changed, 77 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 590f38e52053..6632191cf602 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -792,15 +792,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>>>  }
>>>  
>>>  /*
>>> - * Find the holes in the Host DT which can be exposed to Dom0 as extended
>>> - * regions for the special memory mappings. In order to calculate regions
>>> - * we exclude every addressable memory region described by "reg" and "ranges"
>>> - * properties from the maximum possible addressable physical memory range:
>>> + * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
>>> + * domU as extended regions for the special memory mappings. In order to
>>> + * calculate regions we exclude every addressable memory region described by
>>> + * "reg" and "ranges" properties from the maximum possible addressable physical
>>> + * memory range:
>>>   * - MMIO
>>>   * - Host RAM
>>>   * - PCI aperture
>>>   * - Static shared memory regions, which are described by special property
>>>   *   "xen,shared-mem"
>>> + * - xen,reg mappings
>>>   */
>>>  static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>                                      struct membanks *ext_regions)
>>> @@ -882,6 +884,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>>          }
>>>      }
>>>  
>>> +    if ( kinfo->xen_reg_assigned )
>>> +    {
>>> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
>>> +        if ( res )
>>> +            goto out;
>>> +    }
>>> +
>>>      start = 0;
>>>      end = (1ULL << p2m_ipa_bits) - 1;
>>>      res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
>>> @@ -962,11 +971,48 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>>      return res;
>>>  }
>>>  
>>> +static int __init count(unsigned long s, unsigned long e, void *data)
>>> +{
>>> +    unsigned int *cnt = data;
>>> +
>>> +    (*cnt)++;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
>>> +                                      void *data)
>>> +{
>>> +    struct membanks *membank = data;
>>> +    paddr_t s = pfn_to_paddr(s_gfn);
>>> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
>> Why do you subtract 1 here if ...
>>
>>> +
>>> +    if ( membank->nr_banks >= membank->max_banks )
>>> +        return 0;
>>> +
>>> +    membank->bank[membank->nr_banks].start = s;
>>> +    membank->bank[membank->nr_banks].size = e - s + 1;
>> you add it again here.
> 
> To be consistent with add_ext_regions() and add_hwdom_free_regions(),
> but I suppose there's no need for that. I'll drop the extraneous -1 and
> +1.
> 
>>> +    membank->nr_banks++;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>  static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>>                                               struct membanks *ext_regions)
>>>  {
>>>      int res;
>>>      struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>>> +    struct membanks *xen_reg =
>>> +        kinfo->xen_reg_assigned
>>> +        ? ({
>>> +            unsigned int xen_reg_cnt = 0;
>>> +
>>> +            rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
>>> +                                   PFN_DOWN((1ULL << p2m_ipa_bits) - 1), count,
>>> +                                   &xen_reg_cnt);
>> This does not look really nice with ({. Why can't we create a helper function to
>> report the count for xen_reg_assigned and call it here? You could then also open
>> code your 'count' function that is not used by anything else and is quite ambiguous.
> 
> If I'm reading this right, I think you're suggesting something like this
> (in domain_build.c):
> 
> static unsigned int __init count_ranges(struct rangeset *r)
> {
>     unsigned int xen_reg_cnt = 0;
> 
>     rangeset_report_ranges(r,
>                            0,
>                            PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
>                            ({
>                                int count(unsigned long s, unsigned long e, void *data)
>                                {
>                                    unsigned int *cnt = data;
> 
>                                    (*cnt)++;
> 
>                                    return 0;
>                                }
>                                count;
>                            }),
>                            &xen_reg_cnt);
> 
>     return xen_reg_cnt;
> }
> 
> ...
> 
>     struct membanks *xen_reg =
>         kinfo->xen_reg_assigned
>         ? membanks_xzalloc(count_ranges(kinfo->xen_reg_assigned), MEMORY)
>         : NULL;
> 
> 
> However, the open-coded/anonymous count function, aside from being a
> compiler extension, doesn't seem to play well with __init. As written,
> this doesn't link:
Sorry, I don't know why I wrote to open code count(). In conclusion my remark
was to place this code in a separate function to avoid ({ in
find_host_extended_regions(). So there will be count() helper and count_ranges().

~Michal


