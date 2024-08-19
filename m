Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF0956769
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 11:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779498.1189210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyxE-0001w9-2J; Mon, 19 Aug 2024 09:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779498.1189210; Mon, 19 Aug 2024 09:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyxD-0001tX-Uw; Mon, 19 Aug 2024 09:45:35 +0000
Received: by outflank-mailman (input) for mailman id 779498;
 Mon, 19 Aug 2024 09:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCRv=PS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sfyxD-0001tR-7q
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:45:35 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2418::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70f0a94-5e0f-11ef-a506-bb4a2ccca743;
 Mon, 19 Aug 2024 11:45:33 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 09:45:29 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 09:45:27 +0000
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
X-Inumbo-ID: c70f0a94-5e0f-11ef-a506-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujhzAY5MobEcxlEz6mOMgapD5rJ2IYq41aFrJ42mDsfO5fKA4qB9akwIQk/aG8JG9Z9Rhc/sL8HihFkIvHEvPjpInWBQzR/ouuFu0aDOfShOneCcf/73BPeYk4o46fOmv85WRvNGaoXozeea4s7RjztBZsMJtnt3Bk1e9KQI1IrIw4AIAxluNS6GqH6TaMm1EQN5AhNnmSu3MAUTHjtzHaW0PcxMepppj8yAjfC9hUA6YAPut4liSC7ini72thPQcEx054WQ/mieoPCbx9vlDacAoYY0pT2rDt8Rhd2afY4WDjngJwFskerbufsLAzHdJVk/bZHhIDDHSUnfM9aMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBrY/EcFVpUobYfk85vY4+phwDYtscNFa03Fpu2nuic=;
 b=KB6flnyWBmiEhZ73dxUpzB9ProqNXPdRvgo6Z0PJ+RrusDfY+cA304yOGX1sTRpVreI9/UKtNhWumTnbR8ETQpWkThQd/Jn7ohLvBv3u3tmNlbSSv5v4O8PBoFjHRBvfwSJO4veztaBL4t+zVVkHZjM13voC91Zz/Zf6JcwTt4p+R2RUwssaQQaKzOkkc940Ed5h+1T/bnmJ3vEesWKYuo3yHzklS2QdZeB2SmVTfKgFobAIJdb8iwcYYu7yNlIKsXTK+0CAsTMkfoIaQUSi3UulHm4GUBlrqqkA+TWBylIj5/QMHPupyydqj2+cNrsPL9GrKm33jR8h6+snxRr4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBrY/EcFVpUobYfk85vY4+phwDYtscNFa03Fpu2nuic=;
 b=wPNjfEwk6BBfmE93Cthmngi/EogGAyfbeVNfNzk02s9imvqVicnu98Y6WTvR5ZGKbwQdhs+FWDPuFQnpGIigIa2Ii8qLNrTHFZWfafTkTIpK+rIXWRA8omQk91xWhtHJRXBieh8pjOEZrDM42cyF5Xm+SZ0XcKHNb+VI3VP3aq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
Date: Mon, 19 Aug 2024 10:45:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c39b60-42ba-49f2-e437-08dcc033a7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnV1UnY2em0wTTBNWFZod0JEV05QeDJDSzFMMjdXcGIrem9UZUNxVENaZDRm?=
 =?utf-8?B?citCNXhUdk9jbkEyZXJFTzBYOU9SQ1A2VFQ1STgwZTF2YUZ6dFRxcUxuY2pH?=
 =?utf-8?B?K0FMK1NuQkw5UVF0WURsaDVzcmlSWitXU0FqYUc1Y0NQRG45ZE5CY2ZUcVIv?=
 =?utf-8?B?SjgzOEJ5SGF3dVpTMGMwbldpV3pidmgxV1FybjhuTkdLZTVreXpRL2k1MktQ?=
 =?utf-8?B?bzdIK29XQU9iY3lTYmVRSXcxbldPZWpINTBBT3NBbFZoQVhVV2FSWXRjRFVJ?=
 =?utf-8?B?OGVxVVQ5ak41Nmp3cC9mMXluRmtDRlEreGpRYzhrZFpNcEJtUHB1ZlYyU0I3?=
 =?utf-8?B?VTJIb0FvMmVYelhkY1RpNGw0cWZBTjZGdkFQZUE2elhUVzJ2VG5UYzIzVkw5?=
 =?utf-8?B?ajRVNVM2d1ZvQVl6ZWE0eG4vV0I2anU3VVRGcTFvVVdqNUFzaGtqRFRoNy83?=
 =?utf-8?B?cnpEYkhML1ovNDczV2p6K3JyMVV6Ym5sYTRHUUlwWGhQSjhOam5tMUtSMkhl?=
 =?utf-8?B?U1A3WXJCMGp0bzZkb2F3TWVibUt0Vk9sRnhnV2pDb3JVaDlIWm1CRHI3ZUdV?=
 =?utf-8?B?RGtnNXF0eGVDTjJpWVFTQWlSZCtJNEkyZ0ZZbEdqTk5GWGRGbU53Z0RYQlhU?=
 =?utf-8?B?Y3dwVXZiOU1vaUxDMnRkZ0tQQnNWUFpTUHZVV1hrdHl6bmRJOWRlMXBzeTd4?=
 =?utf-8?B?TENUUmZlekE4NWNFM3IwTWZXZW9RMGJra25Ka09MM2hOc0x1b28yMi95emxU?=
 =?utf-8?B?ZjZjb3JEY0hWekJDL29aMzN3RGg0R3BtUmFLNjIyc0FqNFFxM3E4Und3SmFP?=
 =?utf-8?B?QXZKM3huWXlNZ1NvL1o1bDRsbkNyb21ucndnVTc0Z0xtNi80a2FnVE02Y292?=
 =?utf-8?B?VHRSREJ1T1ptT1I2RU1VMUhFNWZHV0JITWhKMlRkeG9ybFQxanhJREVQeVZr?=
 =?utf-8?B?N3pCTWRZQjMyUW9RcGYvR2s1WGhJNVZmbWtzSGpaTmxBRDN1UWw0RkEwMllJ?=
 =?utf-8?B?ajBFVmlIMXA0SU9ibmJUN3F5elVKYS81amFNaGp1UDk2d2NZNC85Ylo2eTkv?=
 =?utf-8?B?MElZZXgxdU1qZzVhKzhocnRKQXFVN20zTFdUanVCRzFHNVVnWGJQNHdaTHJ3?=
 =?utf-8?B?RC9VNEQ4ZjFXeW55NE9rVlFYNmNMY3BZNXJpWEd2dEFraExRbFF4cmh0c1p6?=
 =?utf-8?B?K05NTCt0MHgra0FjU3lkSjdJOUZobXl0Z21sQldXV0U5QjZ6K2ZrRTBqMG1u?=
 =?utf-8?B?OUpmL0dlVzFwUXlEYUdOdm9MY1NybTlPbGpvaUdtT3MxZWpRZzhJWG0zRHdV?=
 =?utf-8?B?bVcxV3dISVJRR1krVE1KLzdMY2VEM1pvb3Q2VWRwT20xOW5DTDRPN3NaNzNS?=
 =?utf-8?B?YjBtUE9WQ2dROXkraXhDOUZyYzQ1K2tzTDNsTTRjZE5KKzBRRzJ6NnMvc3JT?=
 =?utf-8?B?WFZHR2srUG9QNzhlcVVVc3NJNFF2MWxjYTBEOGxCRHE0RVJVaEZpTHcyWWx5?=
 =?utf-8?B?MlgwNXVmdmd5N3hUS1JhR3hHbnNob1I5aTNFOHZIaHRZazlLb3hpcXJBSld1?=
 =?utf-8?B?UnlobFE3ellMNERTOUY3SFY2bm5iMXNvUDlqeXRjR3UxQkpCcmVvRXRrQ0FL?=
 =?utf-8?B?S3VmN1AxRVd6azBQa2xxVGhnZjY2Tkt1TGFkdjBxNWxQbC9uT01kQ1FYSmtS?=
 =?utf-8?B?L2thQzRsdHFNeU1nTytFZWFkQWJQV3pUNmNrSlVKMkdFMWV1SVE2MHBUMU1I?=
 =?utf-8?Q?ZRSjxHNDTenNLBCJkE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWlrK0hHS3JkY21qcFY2ZnQxMTc1QTBTSGJya3k0Tm9JbDlPTmRVL0hmMkpT?=
 =?utf-8?B?VWtUcHlTRHVrQ1Q4Y3VNZ1VZL3dLR2lqVi9UcWhKZDdSZGI4RDhzOEpmU2hM?=
 =?utf-8?B?aGJDSXVzKzVINFBLcW9rVHZyNEQ4Tm8vM3dHOFpTbVJDYkl4Q1pjY1lIdzc2?=
 =?utf-8?B?cWpJYUwwZVBuendKcmNwR1Zobk1HalRFTzBySXdQOGMzRnVxN2dmTHVkRFQx?=
 =?utf-8?B?cWN3ZWdHYk14eGxyRkt2TkVzRm56VE1sNHlQeGVMSXBJN3Z2RnRHb3VBRTdt?=
 =?utf-8?B?NVNpMGgrNXRxVksxc2dLL3pkRFpEdWUwbkRBN2tIZVo4Q2I4eDRYOE9uMEpN?=
 =?utf-8?B?OWlQam9VWGNNMCtkQWtBS3dUYVR3ZVIzWW8yN1lTWVlTRmNQSUdCRU52NXpp?=
 =?utf-8?B?UjROby9jUG83dUMrSi9XQW1xMmY3T3FIaTZTeEVEdnRsMk0rNkRqYk80Wmcx?=
 =?utf-8?B?VWU1VUttLy83NnI0NGxBa01mZ3dqSUNwczE3S1JNclA3WWxseHMwWjFPWHJC?=
 =?utf-8?B?U00zRnc5SW05NExCR2dxU1Z5TGxSQ2g3WkJmM2VPYjl6cVRkVjdBM3lONFFX?=
 =?utf-8?B?TW1XU3NSZVBhM0NNVVJMVHJTekNVbmdBb3Bib2ZmenV1RWNSdldnNllUNHMz?=
 =?utf-8?B?L1hEQ0l6M2g2YytjdUNiYkFEZG5aL3owQ1ByemhBK1NaRFpvY1pCYyszcXBr?=
 =?utf-8?B?YTdGT0RxNlN0ZXR0TG9INDFlZFJ1UTBkQ0ZIMFlHSlhyWkNlUExoc0NESWt3?=
 =?utf-8?B?dnpyc2VQZDJOVXZ3SFhwalNBNjkvNitSUHR5aDFjMWk0dzlVUU4wQ2lzZElC?=
 =?utf-8?B?Yjh5MnZicjlmNFdYZGtzaGtBRDI0QmR3YWE0bGxMTnc3dGswbzNjaVZUWW5W?=
 =?utf-8?B?MGNKcUdIa3dLWHhqY3lGQmljemY3aG9CMC95L1Y0ZW0ydDluK0szMjF1ZlNz?=
 =?utf-8?B?WUg2Z1lPaFhGUVFaUm02UDdLa1k0Kzc0NkZRZERiM1BqN1JoYWEyTmdQbGIx?=
 =?utf-8?B?T2V3N0thMjlsM2hGU1hrSTNKTmFINXZNWVdqVitpZ1dMcWRtNk91WFM0TnJy?=
 =?utf-8?B?ZlNDV0lvT2FVT29wT0JmVGJzUzYxOUx0aGRWK3plSTB5YnVZN2JkK0ZCdnhT?=
 =?utf-8?B?cmR3ekhXMk94UEEwQXRyWi9rOURzOFRwVjVmZW5VVzhuTjRsTWdZSW9mMnpO?=
 =?utf-8?B?d3cySi9URElRMFhFSnJNWWpCNDM2cVU3cHdhRElzeHBjSmh4RTN6ZEk3Q2Zs?=
 =?utf-8?B?eE5ZVXMvSmlmbVl2bWdLRE14dkRJWGdrSjhvZzlyWUROa0hraUpPdlB4ckpL?=
 =?utf-8?B?dFBLb0F4cUtwdjA1Z2R1Y2ZMOU1uKzkzMkxlcExBSTZTeGI1NXQxd0pMNFdN?=
 =?utf-8?B?MzlGWGY0dG8razY0eU9SU0JnWWVSNjlDbFFGZjRSdWRwTkcxVDEveWl5WUtJ?=
 =?utf-8?B?T1g5Qk5TUUpyMnRvZXlkTDBEYlArTXZ6cVROcm13eUxXbFgwTjE5dnlYOHFY?=
 =?utf-8?B?WFBORHR3M2VIYUNpRU9vbmdJZlVLdmhDNG1QVEpZSitDbzdlc055M3JSMXpV?=
 =?utf-8?B?eEROWFBrbXNZWUZleUxKbVd6M2tZT1ozZGJrTDdvSlhHTzR1Qi9kb3RkWUtH?=
 =?utf-8?B?MWU0aGJJQkdjS3hWMW1raFplVFg3ODFlYzlUd3k2NnpyUnRZSi9Hd2x0T2FX?=
 =?utf-8?B?YmtWVDAyZFlpSVFaMkYwbHNXYzBZRFVPc2RaQnYyTitvU0FRRjdDL1VnNXFX?=
 =?utf-8?B?REFGQnRtMmJ1bkZPTGZ4TXNHaGl6MVlaV1hScUZuZXBqZVRHWDRBWWU0SW5S?=
 =?utf-8?B?SG9yRWhlUHl5d0xpYlRjUEVEK3JUK08rMWgxdlgxUjN0VTNjbUlUNHY2ZXox?=
 =?utf-8?B?QnpVSkVLRmFLNGJOeHhIRGJpc292bmM5b1VJMXliQU1ZQmZWbld2cFMzT2N2?=
 =?utf-8?B?R0lha2t0R0UyTHovSWRGVUtBTVcrQ1ZXMTllZWk4YytVL2RkTDRIYmg1aFBo?=
 =?utf-8?B?OXQ0bStudktMVWlCcGRFckFXYm9vSjNFTUVGb1hsNW96dWUzU1RhR3FTQi96?=
 =?utf-8?B?L1R3dExzdU5LUGpMdlk0TWtCY08wejJ2OGJmeXlrUHlzaEpaRzNBUXREUEVE?=
 =?utf-8?Q?iF2+MrxUWxZHB7Kqx7R/7OA7f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c39b60-42ba-49f2-e437-08dcc033a7f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 09:45:27.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP0JQaOo7399yVMoXxHba0rjteO20dqb3/ZHJ7IgP+J2vNf0p2y32DJp9g/HBrzFeAToA6aNU6OEllOB13dVlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614


On 16/08/2024 17:40, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 14/08/2024 13:33, Ayan Kumar Halder wrote:
>> Hi Jan,
>>
>> On 14/08/2024 12:35, Jan Beulich wrote:
>>> On 14.08.2024 12:55, Ayan Kumar Halder wrote:
>>>> Hi Jan,
>>>>
>>>> On 14/08/2024 07:37, Jan Beulich wrote:
>>>>> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>>>>>> From: Penny Zheng <penny.zheng@arm.com>
>>>>>>
>>>>>> Introduced CONFIG_VMAP which is selected by the architectures 
>>>>>> that use
>>>>>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>>>>>
>>>>>> VMAP is widely used in ALTERNATIVE feature to remap a range of 
>>>>>> memory
>>>>>> with new memory attributes. Since this is highly dependent on 
>>>>>> virtual
>>>>>> address translation, we choose to fold VMAP in MMU system.
>>>>>>
>>>>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and 
>>>>>> make it
>>>>>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>>>>>> depends on VMAP.
>>>>>>
>>>>>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>>>>>> attacks are not possible on non MMU based systems (ie Cortex-R52, 
>>>>>> R82).
>>>>>> See https://developer.arm.com/Arm%20Security%20Center/ 
>>>>>> Speculative%20Processor%20Vulnerability.
>>>>> While I'm not an Arm expert and hence I'm likely missing aspects, 
>>>>> I question
>>>>> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
>>>>> conclusion towards the usefulness of branch hardening. I would advise
>>>>> against encoding such a connection in the Kconfig dependencies.
>>>> AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' 
>>>> was
>>>> added.
>>>>
>>>> See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk- 
>>>> PC.armlinux.org.uk/
>>>>
>>>> And from
>>>> https://lists.linaro.org/archives/list/linux-stable- 
>>>> mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/
>>>>
>>>> Spectre is valid on MMU based systems.
>>> Since then various other issues / flavors were found. I've been 
>>> focusing
>>> on the x86 side of things, but I'd be very surprised if some didn't
>>> affect other architectures as well.
>>
>> We are talking about Arm here as "HARDEN_BRANCH_PREDICTOR" is 
>> specific to Arm.
>>
>> https://developer.arm.com/Arm%20Security%20Center/ 
>> Speculative%20Processor%20Vulnerability covers all the flavours and 
>> it does not include Cortex-R82 or R52.
>>
>> It says the following :-
>>
>> "Cortex-R cores typically use a closed software stack. In those 
>> environments, applications or processes are strictly controlled, and 
>> therefore not exploitable"
>>
>>> Plus branch hardening can be a pre-
>>> cautionary measure, too, I think.
>>
>> The first two Arm non MMU cores that we wish to support in the 
>> forthcoming series is Cortex-R82 and R52.
>>
>> As seen in https://developer.arm.com/documentation/ka005109/latest/, 
>> it explicitly states the following about R82
>>
>> The Cortex-R82 implements the faulting feature (FEAT_FPAC) but is not 
>> vulnerable. The Cortex-R82 behaves differently than vulnerable 
>> A-class CPUs when speculatively executing past an instruction that 
>> authenticates PAC, and that behavior does not allow the attack 
>> software to create the "oracle".
>
> I am confused. This is describing why R82 is not affected by PACMAN. 
> But the Kconfig HARDEN_BRANCH_PREDICTOR is not for that (Xen doesn't 
> yet use Pointer Authentification Codes). The Kconfig was introduced 
> with XSA-254 which predates PACMAN by nearly 4 years.
Yes, you are correct. I was somehow linking PACMAN to branch prediction 
attacks. So, by mistake I assumed that HARDEN_BRANCH_PREDICTOR is used 
for protection against these attacks.
>
>>
>> We can re-enable branch hardening if we know there is a valid non MMU 
>> Arm core which is vulnerable.
>
> Re-quoting what you wrote earlier:
>
> "Cortex-R cores typically use a closed software stack. In those
> environments, applications or processes are strictly controlled, and
> therefore not exploitable"
>
> It is quite subtle. This wording doesn't imply the cores are not 
> vulnerable. It says that if they are, then it would be difficult to 
> exploit because the software should be tightly controlled.
>
> Now this would be really up to the user to decide whether they want to 
> be extra cautious/futureproof or not.
>
> As we are at the beginning of the MPU support, then I don't think we 
> need to resolve issue right now. And it would be fine to gate it. But 
> maybe ARCH_VMAP was an incorrect suggestion. It might be better to 
> gate with the !MMU (IIRC this would imply MPU).

I am ok with this. This has the benefit that the change can be contained 
within arch/arm if we do the following :-

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index cb2c0a16b8..26f7406278 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -329,7 +329,9 @@ void asmlinkage __init start_xen(unsigned long 
boot_phys_offset,

      setup_mm();

+#ifdef CONFIG_MMU
      vm_init();
+#endif

      /* Parse the ACPI tables for possible boot-time configuration */
      acpi_boot_table_init();

Are we ok with this ?

The definition of vm_init() is in xen/include/xen/vmap.h. If I enclose 
it using any CONFIG_XXX (like I have done in the current patch), then I 
need to introduce it in common/Kconfig and define it for x86 and PPC. I 
would prefer to contain the change within arch/arm only if possible.

>
> But before the feature can be marked as security support. We will need 
> to agree on how the hypervisor is intended to be used on ARMv8-R. 
> Maybe it would need a caveat "only trusted software can be run" which 
> means we don't have to worry about speculation on Cortex-R. Although, 
> it would be nice to have some defense in-depth :).

Yes, the support for ARMv8-R will be 'experimental' for some time. I am 
planning to add the minimal support required to just boot one or more DomUs.

- Ayan


