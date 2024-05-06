Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E128BC6AB
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 07:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717190.1119179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3qiy-0005Ml-RO; Mon, 06 May 2024 05:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717190.1119179; Mon, 06 May 2024 05:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3qiy-0005KH-OP; Mon, 06 May 2024 05:17:16 +0000
Received: by outflank-mailman (input) for mailman id 717190;
 Mon, 06 May 2024 05:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3qiw-0005KB-JP
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 05:17:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e37f4090-0b67-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 07:17:10 +0200 (CEST)
Received: from BL1PR13CA0374.namprd13.prod.outlook.com (2603:10b6:208:2c0::19)
 by DM4PR12MB6205.namprd12.prod.outlook.com (2603:10b6:8:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 6 May
 2024 05:17:06 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2c0:cafe::30) by BL1PR13CA0374.outlook.office365.com
 (2603:10b6:208:2c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 05:17:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 05:17:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 00:17:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 00:17:05 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 00:17:02 -0500
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
X-Inumbo-ID: e37f4090-0b67-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPKwCA4a3uwF0v3DdYtyqEuNJJBJoIj7ell6THp9eRXIPM/cNd65A+RULXv5w2V3BxyapUV3x9cyfiMzpvm39vOKJ6FRAygA988r7v/+mN9wHdpLgEl34yjUquAsW1BNVlvEWKkjLPoq545dIbS+whEwuJo3Hp9mSlFTgQwunq6oEvjhL+BT2lWPzxnpriblWOaijS9ptLkVO1LCbeN0A73ddbf5anIDVn1RY31/7TqqoU64Kj3BBfpgYmPHLdEwqzJifDNc9Qq4I5dVlI2PcMPUhAF0gx6IU3+bUTrvkdDfRDRhnus2Z766FaOgY3GY7+M+7TvWyQo2xQ0984ZeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6c0h+MggjM7sWpoLtoclczD4wvLJnexioR+AiveNI4=;
 b=ftRgA9MrG6oqra166S4KqhZNVf0esKHHlUsKxT1glwW+zBjqYVTwwR+n4XgH0jD+DfIRCiAf1bkDDXfcePZJsmo91nsANqL89EKoJUhI6xhbflqv/nv25fYWKzn2FLjGnQo/3z4zabFoqc4g5YJAcLcJJ5H8G0pi5GN/vTtGCdezEHjpbnMjqLRoyNiN1iAarLgNu9gbkKdKoalXF5XPy3Qo1m/2j5Vh8wPBpGy81WVzurwZHqbWx+gVJOjD0tKe1Gy2/0ctsHaNxwOyBkkg0aJ58LES0IX+rPIk/vfHXpzV+4bMloZMA8QYeJoRSnn4lyr/NC1n/ynpRVasnwt22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6c0h+MggjM7sWpoLtoclczD4wvLJnexioR+AiveNI4=;
 b=kD3Iu19krscQagypT98KUfNbbiCMqxwsZJxs9X4XwFXhYTOOfj0Xt+esbTCuM327Ap0BsMpAdA1X9PjRB0CNKsrYGb4KkNAOQWmaOV1l6asl4gxygfYVUZDZxxDDDV5pS0NSiyYPSimGiaPxGOa4BQHwk/LLPapigPX0NGX99qc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <71fc7673-e968-487d-8478-1c7aabef708b@amd.com>
Date: Mon, 6 May 2024 13:17:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] tools/libs/light: Increase nr_spi to 160
To: Anthony PERARD <anthony.perard@cloud.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-6-xin.wang2@amd.com>
 <334eb040-234f-4492-9006-9faadfe28c59@perard>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <334eb040-234f-4492-9006-9faadfe28c59@perard>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DM4PR12MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: b19f68ab-a4d7-4ca2-eff8-08dc6d8bc5d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTh1K1krbWJBbXo0THVtSW00R0YyekU3d085UmpZbWNwamI1ODgvQmxqckM0?=
 =?utf-8?B?dnlQRCt1NUw5TTFNSkZXSG0zeTdiUnRVNC9tUVVBVEIvWUhuOUNoVi8yYWlt?=
 =?utf-8?B?MDlXVmdzallKeWRhVG91VnhrTG01VzZsQ2JCQnNiemR6dy9kZnRyWTFnbzNa?=
 =?utf-8?B?QXREU2FwUy9sV1lkSllMODhGSlA5UEVRN1BlTG04eHRrSFVkV2dYcFluaDN2?=
 =?utf-8?B?ZHRTbmVtMno3Uyt3SzRDNWF1SUEvSko4Sk1VNUJleCttWTd5RXdpR2RRUEp5?=
 =?utf-8?B?d2Q0eFVmSDYxczJVRVAwUFQrek1yRm9jSG8zWU4zUzJ1N2kwUEY5dGYyYTR1?=
 =?utf-8?B?REs2WHBuU0J2eFNqbVZxWjduR1RxRGg1VytobXMyMjFLY2JtaVpZT3UvYXg0?=
 =?utf-8?B?ckovSmFvUnU3U1JZNDBLeFRxYmFCQ000ZUxwdmloVEFzVnJsUERDWFZZMEJu?=
 =?utf-8?B?Y243UUZET1ZvQ2NaWXNCMmJSK2dTNDN6WG1LUXBGZldMcU13clBPdllNaVA2?=
 =?utf-8?B?eGpvNUNNUjFycWRuenRLaG9DQ1hSZ3g2ZzdQVVE4a3JPeG10ZTY2RG9KZkpN?=
 =?utf-8?B?QXIvZk5VN1pBRW1nbmp2Y3ZXY0ovS0NvajJ4R05DRnVEdkNrRDk5cGpPc1FE?=
 =?utf-8?B?YjR4Z2ZmMHE3MTVDaGJ0a0wxL2VUbWVFSmN1ejZTZndUK2p2ZXFxbW5mVEUv?=
 =?utf-8?B?ekZicVBFdnhtaWJrZFNRU2kwRmRsa1N3Z1lrWXh5KzBPaFpHNStmVm9BSFRu?=
 =?utf-8?B?VmVKSnJrTjBRa1N2YjF4YXFLWVE1ZnB2Z0c3NTNXWDBhbGd3SC9pNDJZRHkr?=
 =?utf-8?B?U1hiemNTdW41SWlJelZXemVCTnJvZmxUWHpsUjE1YzBlaW1tdVF5YlFseXJk?=
 =?utf-8?B?OEFsdTY1Z042WVdNQldYSGVLemhGM3d3UjVqWDFTekJZWitPdDlwVC9LcWhG?=
 =?utf-8?B?VEViREVXaVY0OEtSNnVaR3dnaGRLYzl3RlJ5NlBRWklvT1VjMm1KTVVkbGR2?=
 =?utf-8?B?elZQaGdhcDhPZHNqM0ZnMmh4NTJOdWVVNlZjT3Jnblg5Y2VnVU5qL3FWMjFs?=
 =?utf-8?B?akVQR2hzS0xzekE3RGNtTXh0YlhGbEVBSzdoVGdYYkV4MER0Z2dzbForeXBk?=
 =?utf-8?B?eHEzWXVZYlMyV2hTMEpLZDN3TkZSNTAvQlorTDhYZXhUNWY2RWxlWkw1WFps?=
 =?utf-8?B?RTZKQ05rMHUxblRyOTFPNjFpdDVFbFNidlZpdGFPY1JHZWEraFA0TXZUZjRG?=
 =?utf-8?B?eG91dDRqYTVwQitKQk9RcmRmRzF0NXJNSmdLNnZpSDI2K0V5eExpS2w1ODJQ?=
 =?utf-8?B?S2M0LytpQlRkdGs2WUNEbTR0M0VvcTNNWFp1Tzk0V3UrME0xU2RtTlIweHVK?=
 =?utf-8?B?QnhyUkt5QVRFczVnUi9sTlQ2RWhMOCtYNHZseTkvdU90eFZZTGhFVlloNkla?=
 =?utf-8?B?d2tWRTZSK3pCM1F3VW1TMzA5OG9ITW5CN2VaWmk1Z1hHZVVMQlVWOGJPdi9F?=
 =?utf-8?B?QS9iano4SFJFNFYvNFU3ZDlhUnByK2hqUVRqMUNXVlBqQTJ3Wi96VngwdFRT?=
 =?utf-8?B?VWhveXRJRFZMMnVLYk9tbzQvb2F0U09pMmNjT1FTRDVyVXhvSnVqZmhsazZU?=
 =?utf-8?B?cy90Q0QyNlZzcWRWajhOdE1JWXE0OHZYQlBCTk9ZSEdXOHhVRnBKMm5laDU3?=
 =?utf-8?B?aHN4N0haSjlhNzZVNENRL1lqVTh6WVF0OWZEb1NZbXNWMHo4bjluM3lVd0dP?=
 =?utf-8?B?eXY3VkNuRjRmL3o1bUNsNkhGNWIvbjFtcElQOUZ5aW91YlRkU1oyeGQ3dWt3?=
 =?utf-8?B?L2grd28zMmx0bFIyU2FibTRzUElTN2pBODRtc0ZJT21SUXUyRVV3NTZvRTdR?=
 =?utf-8?Q?yTzirStsVdCqc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 05:17:06.6444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19f68ab-a4d7-4ca2-eff8-08dc6d8bc5d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6205

Hi Anthony,

(+Arm maintainers)

On 5/1/2024 9:58 PM, Anthony PERARD wrote:
> On Wed, Apr 24, 2024 at 11:34:39AM +0800, Henry Wang wrote:
>> Increase number of spi to 160 i.e. gic_number_lines() for Xilinx ZynqMP - 32.
>> This was done to allocate and assign IRQs to a running domain.
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/libs/light/libxl_arm.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index dd5c9f4917..50dbd0f2a9 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -181,7 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>   
>>       LOG(DEBUG, "Configure the domain");
>>   
>> -    config->arch.nr_spis = nr_spis;
>> +    /* gic_number_lines() is 192 for Xilinx ZynqMP. min nr_spis = 192 - 32. */
>> +    config->arch.nr_spis = MAX(nr_spis, 160);
> Is there a way that that Xen or libxl could find out what the minimum
> number of SPI needs to be?

I am afraid currently there is none.

> Are we going to have to increase that minimum
> number every time a new platform comes along?
>
> It doesn't appear that libxl is using that `nr_spis` value and it is
> probably just given to Xen. So my guess is that Xen could simply take
> care of the minimum value, gic_number_lines() seems to be a Xen
> function.

Xen will take care of the value of nr_spis for dom0 in create_dom0()
dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
and also for dom0less domUs in create_domUs().

However, it looks like Xen will not take care of the mininum value for 
libxl guests, the value from config->arch.nr_spis in guest config file 
will be directly passed to the domain_vgic_init() function from 
arch_domain_create().

I agree with you that we shouldn't just bump the number everytime when 
we have a new platform. Therefore, would it be a good idea to move the 
logic in this patch to arch_sanitise_domain_config()?

Kind regards,
Henry

>
> Thanks,
>


