Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E6A128DD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872812.1283840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6PO-0008LP-A8; Wed, 15 Jan 2025 16:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872812.1283840; Wed, 15 Jan 2025 16:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY6PO-0008JP-79; Wed, 15 Jan 2025 16:38:22 +0000
Received: by outflank-mailman (input) for mailman id 872812;
 Wed, 15 Jan 2025 16:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZO=UH=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tY6PM-0008JC-Ov
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:38:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2417::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fd4c370-d35f-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 17:38:19 +0100 (CET)
Received: from BN9PR03CA0039.namprd03.prod.outlook.com (2603:10b6:408:fb::14)
 by LV2PR12MB5893.namprd12.prod.outlook.com (2603:10b6:408:175::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 16:38:12 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::e9) by BN9PR03CA0039.outlook.office365.com
 (2603:10b6:408:fb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Wed,
 15 Jan 2025 16:38:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 16:38:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:38:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Jan
 2025 10:38:11 -0600
Received: from [172.27.3.102] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 15 Jan 2025 10:38:10 -0600
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
X-Inumbo-ID: 1fd4c370-d35f-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/7NX37+dhNKPyqUQXTCRZ/4Hi0poI7w5lp+XG0J3nirTBypvcg3Kb5DDSH5KypUoYcegnP1L0GR45Yte+MkB5qMYkRnR5r75QF5ZD/9h7HkywDNG7FU+i/kom2gwckumWV2CEjAEszX9dWUD/wNMpmiunbZVqKu2A6pgTwfkV6frWugDoypx/u1yFZ3o3L9RmILeraLu13p8hY5Je3nG84fRr9Hzqx1dS8/GybSLpd8Egg11ZUqVLZt7gQHJ+2Ek1MRxi2eEOXzDTYzyDUeEe1byNz4GZZOILblQnE8If4KxF6kmaGtjvXvvZefxlA9FODbsELFPsgxNiC8W4ZOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUXXusSk24drhfYsuct6vcK2Za6M9r1k0aIHaTia3Wk=;
 b=UdvxvULq8KFZqwCPbamVnJA81Yq5f/BNbJkoHJiu4Qebx4rh+68v6vcDDBuO8Y84Sg/3VAKEAB44u86dpVqd93XOdSGDgjsnuzqiWv7gtGXg+5OA55vJ8vS/uXUMojdW2k15cP8LKDgVy35NjXu20+srdZbQigM3Il3gpgv4tWOx7uOUeqElQbTnalXWonGc5fisF6FOjfNkw9I9noLxRHonjlFOpOXywY6uuII51PiGbZBo0EmPiIcsJsaRe+r+00Jd5wRzxK+ePwWdyqNToC2D097wjGh65XQZKJbr4+T8+KZxgsiCPqI/fhMbsiwr/RBzbpQns8mgA6J/kcg4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUXXusSk24drhfYsuct6vcK2Za6M9r1k0aIHaTia3Wk=;
 b=Ukj5cqRxbevJIsehS7X1jzP/NIforfysGfngMQlG11ouvgsjRFT4f1JhwJRUw+f4DlNEebiB+8rFa0wXU4TKwOT4pOQmLCOCLV+Q2ap7Uz4L2XUkHtJqAjERriTzKQTVxJYIRxvJGvTvLNv9Rs536kkH6tTDr7R9UbGVEahHDxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ed6b3a99-a48a-4a8b-9028-dbb4012fe848@amd.com>
Date: Wed, 15 Jan 2025 11:38:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 09/15] x86/hyperlaunch: obtain cmdline from device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-10-dpsmith@apertussolutions.com>
Content-Language: en-US
In-Reply-To: <20241226165740.29812-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|LV2PR12MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d71e30-33bb-45ef-08e5-08dd35830096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzBVdnV5bldlejErRTIyeE9NTncvTkZyUG9YMGV1SFI4ZHFJQnczbm45bXE2?=
 =?utf-8?B?Zm4zNjVkOWNMNG01Mk85SzNGSjhDdEpZNjhJR0lSY1Y2Umc2bkg4RnBwTFgw?=
 =?utf-8?B?Lyt0N0FTS1lOcFNKUVRUWjVCeGpoRXlBUVJ5NzMyZ0gxV1owdUpZbERJeWw0?=
 =?utf-8?B?dXVxYStEaDYzb0U5bVEwS1NSUVlVL3FFREhDVEpuc2k2c0wzQkhlZEp2Z0VL?=
 =?utf-8?B?VCsrNlFKeU5GaTJyVmZoU1JCT0V3SWZtUENoN3dIM3JrNHFRSWtadUx4cHUw?=
 =?utf-8?B?MnBMY2FHQVR5c1lqVFNjMnRqV0N3dDdTbEJZaC9kTm9UYjNrOHdyamJBTEha?=
 =?utf-8?B?UEtVSm1VNFZzU3oybitEc2FUN1prbGVsYW15K2ZIbDRRdlJmMjI2UzZBMlhl?=
 =?utf-8?B?Sk1IaENhandVckg0MThBWmZaRk9Vc2d5OE15YWxQSEpqKzhZQi9CL29ORkRV?=
 =?utf-8?B?WGFua25UV2JjRGltL2J5ekpuL1VjL3AxN25BV04ra2w4OVRGS1hxb08yNkZU?=
 =?utf-8?B?LytSb1RNODcrVWt6WVQ4b0lKRjFjUWRZWDhrYUFDU1F1QTRGd0d4TDFLaDVB?=
 =?utf-8?B?RThBVEZndURoRzBKWEIxWVJIVlN3MHBzOEU3UEJkdUU2V3g4d3FKS1ErZ1Er?=
 =?utf-8?B?L0M3a3JaUlRkVnh4SHpjSWx3dUs5Q0t5bWl1MitqT0pxVDJ0bFZUdzRtZitz?=
 =?utf-8?B?RjUveU1abmVobURqejV3QzFsbG8vQkJnVGdNWUJMWUgyMDhNdURrdXlKNFNN?=
 =?utf-8?B?b0cySnY0WTZIOFRHNzNrVWlCT3g2c1lLWmdqRGkwUDdQb0o4dmkzUER2TWdL?=
 =?utf-8?B?SU9zWjBjV01ObDlmOU5naldKMjF3WEM5aXVWbGRrUzhqNldNQmRPYTdQazFq?=
 =?utf-8?B?alczQWhFREQwUGVSeG5FdjRCaGtnS1RzdmZtSUdseWxTNmJlWEQxdE5oV3N0?=
 =?utf-8?B?dGRWbmNWL3VGTkFGbWdLSDFnbks3V0lwWFRjekoybEdoenpQekxuS3hxMU1h?=
 =?utf-8?B?elJobUs4OUgrNE0zUDNwRjQ5eC9zK3lZYVlVMUE4QWM3WnR3VjNNOTBTaTV2?=
 =?utf-8?B?L1NmdlRrWU1YOUVhRG1WV3FFN3REakZ1RDFUM3htSHkyWW9PSmkzelhBM1hJ?=
 =?utf-8?B?Z01hV1JzSHNrMDIzYVhOYnJBLzdSQVZ2WEg5eWF6aTFmZGVGSDBIYXVDaWZ3?=
 =?utf-8?B?OG1SV1lWMnZOc1BhbHd5T3JreXV5bFVBL1AzclZ0TUNsV05uUFg5T0hoeHls?=
 =?utf-8?B?bkVlQzhaUUIzb0FSQ1pYWVBzaUZTTytKc2ZtQVVaUG5vUjl1bC9rZ0tDUEdt?=
 =?utf-8?B?anZGdHFwNlhJM2ZjWENjb2Y1TXhmWEE3SmtHOHdDZUtFbzNwVlBlMVlCUEJS?=
 =?utf-8?B?RDgycWpFbEMwaDd0OHFWMlNkakcvNHN1bkdnN0dpQXUzNEpnTC93cTZSQjdx?=
 =?utf-8?B?S2RQWmhvTktTY3hLRmR0WExxdUZBNlBMWHpIb3k3SFVnM09tVkgwc3k3cVZB?=
 =?utf-8?B?VjBSWGtPd243dmt4d1lxaFZQcjlIZjU1TEJKQnlJVExRRGJ1cmRBK0dJN05y?=
 =?utf-8?B?ZzE3RXB0OGNXM0lFZnhKVW9IR09iRitDUlltMFIyRVR2RVBWRW5ZMjhSdFY3?=
 =?utf-8?B?Sk5KSGRwOUFTUWlQc2VjTDV6cTNqVzZCWjU4bkdyRUZRR2xWK2NkaU9QVzdN?=
 =?utf-8?B?K21YU1pzdzZxVmVjOW8vMHFuSkl0NDQ2bGhTQll4T3NQVkZBWUMxNUdpcngz?=
 =?utf-8?B?QjdFWU1iaEFxRTYxZytJV3JUVWxHbk1EcTVSRjdBemsyWEV6ZlRmK3FiZlpv?=
 =?utf-8?B?YzNBN0FuZ1ZYemk3RW5HK3dyb09qT2x2V0dVRTgweUFZM3hOQml4c1c3VytF?=
 =?utf-8?B?YXMrQ1NqQUVJZnd3ZEVZbzNFa1RETDVWSXJ1Q3FqYVhJV0UxMGdYeUZGZzdN?=
 =?utf-8?B?VkludGl1TGlndFcyTHdOVitabzlXMEhBaGcvcVduemFrOHBOSmdCNWtlWGxn?=
 =?utf-8?Q?6jJuXvVQZ3v0tMDZzCgSRdJGdsglGA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:38:12.2517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d71e30-33bb-45ef-08e5-08dd35830096
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5893

On 2024-12-26 11:57, Daniel P. Smith wrote:
> If a command line is not provided through the bootloader's mechanism, e.g.
> muiltboot module string field, then use one from the device tree if present.
> The device tree command line is located in the bootargs property of the
> `multiboot,kernel` node.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Changes since v1:
> - moved common fdt functions to libfdt
> - rename prop_as_offset to more correct prop_by_offset

> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
> index 27d23df03af3..0e54aeeb6cc2 100644
> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -28,6 +28,30 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
>       return 0;
>   }
>   
> +static inline int __init fdt_get_prop_by_offset(

I think fdt_get_prop_offset() is a better name.  The point of this 
function is to return the offset in the fdt of the named property.  "by" 
or "as" confuses the purpose, at least to me.

Compare the existing fdt_get_property_by_offset() which is performing a 
property looking by consulting the offset.

Regards,
Jason

