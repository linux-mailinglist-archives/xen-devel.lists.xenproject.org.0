Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F39A7E189
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940237.1340076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nU0-0007Dk-UF; Mon, 07 Apr 2025 14:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940237.1340076; Mon, 07 Apr 2025 14:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nU0-0007BO-Qw; Mon, 07 Apr 2025 14:29:52 +0000
Received: by outflank-mailman (input) for mailman id 940237;
 Mon, 07 Apr 2025 14:29:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1nTz-0007Aq-5U
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:29:51 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2418::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2bb4e7a-13bc-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 16:29:50 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 14:29:46 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8534.045; Mon, 7 Apr 2025
 14:29:46 +0000
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
X-Inumbo-ID: c2bb4e7a-13bc-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1R2Tb3A0Pxft8rE4CS/r+9BhKyV4d93JcdLyGk1Xvd0tGIAETW3AvjbSfTRpCYlVM8TvHmv4clQO9jiKUfSlMRz0OoBOCGqKD8RynpSOdoP23jxn4HojFn35j1k3HArpeIfxC6yZ7LfxhTTO4gACiBr6zSqPnjr1H3j5bJeUClqL8CXtduXnd2QwCt++kphL3JyxS9jGUTmZkK+8zdqX/CUcrgfqEexBeiEKBMTy4eMoxr21GtuJ/5ywoC1hIAie519wfcKSczAkJ4mFZ/F/Y6arILAG8KHTiAbZX9dDdTfXj2WFbJ93pgig6GCaDWmSzE/19ewH6t4CejIyJhhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JTQ8GJiq3U7VNnOmcNZ7lsYzpzw9ATssqw3ax/jBbQ=;
 b=uYVYCiFAo8MYo5cUkpNHZzMevI5cjurJmNKIqjjL8noMSNb1kLCv+mqqp9ps/IsP97NIoHtUb3nnn+Bul3MdZEkA3weWZyZUxZlB22N5TWS1JCZaB0FSmKWQqn1gxQQRxlV+4dqGqXKSweDnXLUr7Bz8L+llzUit51gdxYe+Dg574io+ZlgwsEVISURQh7jBCyCJVBHTgdxX0fV3A9Eq+g33CdIHUWfKuqaQImkRWV87farwtYC5Jk3vwYvFYt8ddBU8FwbytX8sKEZMdOtGVVgcwBGBYn8PbA0ft5hIcfqB1WccTO+tjV8QYJoyXMpsr8eVC4tWK98hmo4DQfFGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JTQ8GJiq3U7VNnOmcNZ7lsYzpzw9ATssqw3ax/jBbQ=;
 b=G1cGpsJqf32xB6sHXtDwbHbuC4ZpwhirDg9gWqlBfCvYdrHMu12M8WVQjt9CgJiT9m+/gdvaOnP3pHmRMc56hI9JgF786boPdp7Z4NhJyNsHwN68MbaOdNXQ3D7ihhLRPJ747APlG8CowQuvu63x4jx0smCipdMNjPK0GQj2Fwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a99913ea-b425-4c24-8d32-f4e2e3ab3edb@amd.com>
Date: Mon, 7 Apr 2025 15:29:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
 <C6C24096-2BCC-4D09-A20E-AAB1FA923A18@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <C6C24096-2BCC-4D09-A20E-AAB1FA923A18@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a61967-6baf-4366-7731-08dd75e0a56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anBZRG5sbHJpZzRaRVIxSWIwNUROMlhFZjlkcEY1TXhpV2Q3MUZnTk5jb1Za?=
 =?utf-8?B?WVd0YTI5TlZxWCtSR0tiTU1mT1ZWcUxIbGpYcU9zSmp2Y2g0TVNtSEF1WWVr?=
 =?utf-8?B?MFBYaGxidEhZclZsS1ZLOUJLeFlWVlYvUXkwTW5LSTJBWWpqcnN4RU5TdFE2?=
 =?utf-8?B?TnZPNzhrLzNNMmNCaDV1cXJ6S29aa0hXVWE1S1BvakJYU0QxVWQ2bDdQS2lM?=
 =?utf-8?B?S1pIVjF2SjlKSnV5dzNyQ1A2OHYxQWdCVTd2ZkdIMk5sT0pmb1NWYnZjOU9h?=
 =?utf-8?B?MUl1ZG9BTGJGTCtxVVJFQ3pMUkZRTG1heFgwdkpPL3BmcE5NUXFTeFN0ZUNU?=
 =?utf-8?B?TUN4dTVxM2JqTzVjSngwT3k3QzFtM3ZFVlRTb1U2OENIQWZuNTJyaFprWDVl?=
 =?utf-8?B?dVZRa2ZRSzM1UEEzZ1hoRk5uTllkdlZjQUp1dnJDbnpUN0psbGdOYjlNR0tW?=
 =?utf-8?B?L0pVbjErY3lmZFJ2eGV2NFE5M0FXKzAxU0ZobDVrSWVYcC8rTHlrNm9hTmRZ?=
 =?utf-8?B?ZFgyKzFMbVg1RDJNRkhsTERaQkpwbXhUa0R5b0xpQ1ZydW9yMURzOGNZU0tl?=
 =?utf-8?B?Q1RVekNFcXpncVpKRFZlSUlVdGxvai8vWER6VFVjdDRNY2VNbDB2b3NFbEtM?=
 =?utf-8?B?cnNrV1BUUGlBczlKWm1SVDFkUFNETmJKU0l1Y2xVeXl5c095RjBsanBySkJy?=
 =?utf-8?B?VUl6YTBGd2cxdHlOM29JOVJyRkkxdGNTR2FHdi9pUWhHRG94bGt3L1Q1aWVM?=
 =?utf-8?B?L3BGWmNiUnI3VWRCMURnYTJTMHBWRHA1WDFvd0JLdWxuU08vMC9YMzBiMkJu?=
 =?utf-8?B?eHlUNnU1dVhjdTJPMHN3OEtEMEYrczBUS0pPMkYwSGFWQmJUOXNMWkdRL1hG?=
 =?utf-8?B?VTFCT0pUMlhoNXV5T2prOUVUZkxJRDBwYUUybHdLOVI0UlFGTDN6RUp5UnBI?=
 =?utf-8?B?eDhFNU0wZ1JDL0txRjM2YW9JcGhyc3VBMjllT3FQVGtpMVBXNXJJTXZ3cDNM?=
 =?utf-8?B?aG42MzhMZEM3RVNCdGQyWWR2MGRtWVA1UTZkaWZmVm9ZM1hTZnA1bERsUDM0?=
 =?utf-8?B?L21LWXpnaVpjTjNCbkpPaS9IMUtSQ3QvYXBxUTZsK2JSdUtESWVFcXdjTFBU?=
 =?utf-8?B?cFFyZFNtTy8zQjM4T2EybXc1N2NicFlYVzVWc1VlM3BoZStWdU1rVXd2bHFs?=
 =?utf-8?B?bTQwK2JQVFhMS1E5YnpzVUJCN0M3akxOZittL2I1dkV1allKK053ZXYvbUVv?=
 =?utf-8?B?V2JVTjVzSWR5RndHQ0RGNjhSMjkzZW9XNlh5T0ZsRit3VCtpamRMVkJPdEtG?=
 =?utf-8?B?NjJTQzFLemRPaFRlby9QRGZSZnpoTmI0U2JBVjhGWVpIVk5LQlZPZ2tWaUo0?=
 =?utf-8?B?ZGpjRzBCY3doUjFMNEM5WTIwUkpXOTRRb3Y4WWZpVnpuaTVSenVocFNOaWt3?=
 =?utf-8?B?MXdyREJRQjNvZUcwYkQ3N2xMeTNxYThzQTlHUEJzd2RGR1FFRzlSWG9EVWhJ?=
 =?utf-8?B?Q1JtYkVqcHpybHd0VXUzc0U0ZG04WFB2bG9zNXR5UVg2MjIrYTFHTC9pTkk4?=
 =?utf-8?B?dTVWaEJNc0ZPNmVCTVQwMmJBSXh1Z1BNSGRyRFJUZTVFTjYvMTFiemovMkZy?=
 =?utf-8?B?dEdYLzU2NjAwcVNKMHdUbGFDTmVCNGpMVlgzYzMwRjJyUHo2MG5yaitwSURh?=
 =?utf-8?B?MDFma0J2ZE80M3VDQWFORjdnRmdmSm1DMmlOcFNlcTFTd2o1MWNKMmRzN21B?=
 =?utf-8?B?ME5CMStiY0dGQVNFbmV2UittRmJsRHAvT0FneEtma2kxWG9UQ1FxTjRmUVFP?=
 =?utf-8?B?VGp6KzhlWmR0U3pZZmwzQzN0OXhDT1lUdWFDRTZ4ZE1ZdzUwUmtCaE5vN1lR?=
 =?utf-8?Q?zz9lHUWtJ7hJx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1ZOeUZxQ3ZkVXA3NVEyNmdMTllRSlBqT3czL29Ka2Vhd3gzbkJYcEhuTDJr?=
 =?utf-8?B?bUYxb1E3Q21ZS2tkVzNrdXFDZU1CWkhyNUVocVk5ZTAwdkNiWXE2TTQycjRa?=
 =?utf-8?B?dk1Bbmh4QTN3WFJkZUd0aUZsNkIyWjZqNlVFU0ZrQmtwb1J1QXlJS2JJUmpa?=
 =?utf-8?B?VVRFZGkrWkxUT01qVXQ3clJDVkppOVF3RnVvV3VMZW9kN0k2eWNjYWxVRzFy?=
 =?utf-8?B?cU5qemE3Q2lQNEN3UWVqQVA2MkNhVVhxeEVYVTFRM1JMSG4wc1lETlNrWVFq?=
 =?utf-8?B?QzFEbHNtSVZqaTdhcEM1QzhDK3Q5a2l2dmxtYjhkbWRSS0Y1T29PN25lamRZ?=
 =?utf-8?B?ZjIvOUV2MG5jWjlCb0UweWw1Q3p4MDJ0VS9tL010MkpLSHdGWmdmakI1UXFq?=
 =?utf-8?B?STdtOEd3OHRhRjNudmhlZE9ycC9xd2RWb01weWx5N2hMSFJnSnJSblVOdVRq?=
 =?utf-8?B?NERqK0UxZ2svVkZmUEJSQlBaSUV2bklqNTFybFJoSDVYTTRjUzhyMlNTaVhi?=
 =?utf-8?B?NTh0VmtoUmNzbnI5VCttZHF0YWtIZ0h1WTV5OWJ6WWpxMFZQc2xpbmN5VXF5?=
 =?utf-8?B?SkRtdjR2K2k1cGtDenh0SXpzejUvZGpvd2xqTWt5R0NRWWFGK1p5N3VyRE9H?=
 =?utf-8?B?NTNNNStCdXlDNS9HaDVNNUZwdEhHUGoycDBRM0x2ZzRNT0Eyb2RiT3U0TDA1?=
 =?utf-8?B?Qi91ck55QXpIeStxMXFsd3Q3Q29ZQWUxT2I4aHZmNExCN1NJM0tXWlNXUkth?=
 =?utf-8?B?eVh2VWZacXkvQUY2ZlZncUpUR0tpby9kTks2RzFBNEFtaUJhaC9OY0txZ3hp?=
 =?utf-8?B?bGU1UmdkYkZuTTFiaUxzU0d4QXlOTXFiT0lRTFJnU0J3RnlFRWlnSUF4M0Nt?=
 =?utf-8?B?UTZUc1g4a0tLcERERXAvSDlkT2U2RXpyVVZ4Q01sTmhXZzhyTkJkcTJxeE1W?=
 =?utf-8?B?YkNScEU5TzdNcXhzWmc1cndid3FTY2dCTUZySlhlWXhaNncwM0RDa0x2MUpW?=
 =?utf-8?B?Y2F1akpKMjI3RVNGSjJMaVNRNFA2MUZPWGxmM2FYc1hMbnZYUTVGNTlRejdj?=
 =?utf-8?B?OGQvUDVnMWIrSFV6VUx4RkhWRkpUeUV4NHJZQTQ5Y3Jydk82RkhJSkFwbldt?=
 =?utf-8?B?bU5QZlE1eTA3VlNCdUEyYVBTbS8wOW1sM3NLbEFzUGh4L29tTUtyYjRpSnJF?=
 =?utf-8?B?UGI4K2xXY3JVSjZGVWhIeDVaQlFkT0xZSUJraVdScVd3K05VSFNBVnpFVHpS?=
 =?utf-8?B?UjU3TnhZYU1EazQrL1JDK2lPRWI4U0FjMUVTSU1tcDJscmh2UjVvS1NNTk1J?=
 =?utf-8?B?bXFjN3RIYWZUOWw0VFY3YjRTamtmK0hoa3c1RW8rVUJldFNqOGZjN3lvQVp5?=
 =?utf-8?B?ZElmT084NnorWDBFckNqMWZXaHFOUVZVQVVpR0g1N3NtakdQekhWNFk5b0Ew?=
 =?utf-8?B?c0QwbTFqUEFoVmlCSklmU0VuSEhodFhjQlZOQ3dBR1Vkb3FhdHhjYkFJK1V3?=
 =?utf-8?B?OUVwNklzcWFid0lwS2NRVXM5R2J2YnhYTmZFMEp5d21ybDdLN1o0REY4U05Z?=
 =?utf-8?B?dDMrYW5panVHRTJLQittVGdlTkRBbnRoeVZDM3ptNDJBaS9qdG5ybENCVTdk?=
 =?utf-8?B?b2FTeCs4NnpZMXdJVC95S1pFbXB1V3Fhb0J0d2RUV2dBeG5zQk43SnlCVDVu?=
 =?utf-8?B?WmZVak1IZDdpT2IyOExPcmhBZ1BmV0NoTGdIVnNtT0dxNHlhZ3FvQkdMbnRD?=
 =?utf-8?B?bThvS1p2OVVkMjY0OGJycXhuajIrUXI1aDF0eU90bkZiVlI0WXBFM2NtbnYy?=
 =?utf-8?B?U0pMZTVHaE80dVMzMGRSbjgvNEJIUTNJUGEzVzlJWFJsR2hPSURUZ01qVVVR?=
 =?utf-8?B?QUgzeWxQVnlZeVVmOVI3V1pTTTE2UWU2MklnRG01VkZwV0Y1N0ZXZE5nNWpZ?=
 =?utf-8?B?Q0hXM1lJVW4zUUpTVUNUQ0VUQVdhZW0vT2FNMEc0TkR1R1lWN1pIczhuWnBk?=
 =?utf-8?B?MFk0ZVppdnBaTmtTMEZxeXF3MS85QllKWG5ZQWE5QjlQS2V4Nmk1WCtxby9n?=
 =?utf-8?B?bmpxaUhmb1dUWGFPNllYOGpVUnMxOVFGRjNCcFF2aS9kRGVLdTNwbVl5VW12?=
 =?utf-8?Q?rqhZ75aOYbKJbgBy1oATGVk5H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a61967-6baf-4366-7731-08dd75e0a56a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:29:46.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYReF0SJMILRRe6iHsEPjSOXUr56fKAaf16Y8brNFH0oS+kcoxfPSQdxZNVC5k2xQ6ZRdGUboCxrFNJdhHVwtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835

Hi Luca,

On 04/04/2025 10:06, Luca Fancellu wrote:
> Hi Ayan,
>
>> On 3 Apr 2025, at 18:12, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
>> configurations across arm64 and arm32.
>>
>> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
>> arm64. Thus, they have been moved to prepare_xen_region.inc.
>>
>> enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_region.inc as
>> SMP is currently not supported for MPU.
>>
>> *_PRBAR are moved to arm64/sysregs.h.
>> *_PRLAR are moved to prepare_xen_region.inc as they are common between arm32
>> and arm64.
>>
>> Introduce WRITE_SYSREG_ASM to write to the system registers from the common asm
>> file.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
> The split for the common code seems ok to me, but this patch is introducing an issue for the arm64 compilation,
Sorry, I moved something at the last moment without testing. :(
> I’ve done an experiment and with these changes I’m able to compile both, but feel free to ignore if it’s no what you
> had in mind.
The change looks good. However, ...
>
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 22871999afb3..a90d1610a155 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -20,6 +20,13 @@
>    * uses r0 as a placeholder register. */
>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>   
> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
> +
> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
> +
>   #ifndef __ASSEMBLY__
>   
>   /* C wrappers */
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 6019a2cbdd89..b909adc102a5 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -1,10 +1,6 @@
>   #ifndef __ASM_ARM_CPREGS_H
>   #define __ASM_ARM_CPREGS_H
>   
> -#ifdef CONFIG_MPU
> -#include <asm/mpu/cpregs.h>
> -#endif
> -
>   /*
>    * AArch32 Co-processor registers.
>    *
> @@ -502,6 +498,12 @@
>   #define MVFR0_EL1               MVFR0
>   #define MVFR1_EL1               MVFR1
>   #define MVFR2_EL1               MVFR2
> +#define HMPUIR                  p15,4,c0,c0,4
> +#define HPRSELR                 p15,4,c6,c2,1
> +#define PRBAR_EL2               p15,4,c6,c3,0
> +#define PRLAR_EL2               p15,4,c6,c8,1
> +#define MPUIR_EL2               HMPUIR
> +#define PRSELR_EL2              HPRSELR

Considering that there will be lots of arm32 MPU specific registers, do 
you want to move them to mpu/cpregs.h ?

That would be my style preference.

This issue does not occur with arm64 as compiler provides most of them.


Michal or Julien - thoughts ?

Rest look ok.

- Ayan

>   #endif
>   
>   #endif
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> deleted file mode 100644
> index 66871379a53b..000000000000
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -#ifndef __ASM_ARM_MPU_CPREGS_H
> -#define __ASM_ARM_MPU_CPREGS_H
> -
> -#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
> -#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
> -#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
> -#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
> -
> -#define HMPUIR          p15,4,c0,c0,4
> -
> -/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
> -#define HPRSELR         p15,4,c6,c2,1
> -#define PRBAR_EL2       p15,4,c6,c3,0
> -#define PRLAR_EL2       p15,4,c6,c8,1
> -
> -#define MPUIR_EL2       HMPUIR
> -#define PRSELR_EL2      HPRSELR
> -
> -#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
> -
> -#endif /* __ASM_ARM_MPU_CPREGS_H */
> -
> -/*
> - * Local variables:
> - * mode: ASM
> - * indent-tabs-mode: nil
> - * End:
> - */
>
>
>

