Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7929937B2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 21:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812387.1225114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxtl1-0007Ll-F1; Mon, 07 Oct 2024 19:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812387.1225114; Mon, 07 Oct 2024 19:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxtl1-0007JF-Bc; Mon, 07 Oct 2024 19:51:03 +0000
Received: by outflank-mailman (input) for mailman id 812387;
 Mon, 07 Oct 2024 19:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxtl0-0007J8-5D
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 19:51:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7928f32f-84e5-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 21:50:59 +0200 (CEST)
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 19:50:55 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::a5) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 19:50:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 19:50:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 14:50:53 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 14:50:53 -0500
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
X-Inumbo-ID: 7928f32f-84e5-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rswqdLJY1aksJvD/2Vsgo8C0GmZ8Z8HEcVXobe/RhT1pJkF7D7i6+zfa7ZyO3UNHiDBVnmfRmQZtyFbOsrOmkPJluI8hdnIDa1RFM6t+voMVMZbwjagLGQDtBiTsKz/yA7TEozIiVPnjl+nL1N9/LzId0/DeYOrJZF2Tujfjibsvj1FccXj3Rnp6pvUISeVKwa5obWo2k4YfdMF3zXrAGeB27rIOtx/3li1c6h7hZkOglv1koHupdOlKWNtt+LVZeFro2OYbpMvv+iH73vqL2TbTYQo5LRKWiaMJzPAoaEAeFVeGLGey7uUFQQQilxeGisVh+e3XZ4E4a+PYqsIbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PNy/YK5F8zUiWjHfpze0wKfCrrd86+vfXfJLFlEJ78=;
 b=eKhEjxgkLhdjWe3t86SL4oJbY7ivsILY7ktr+KQxJr5QhzzP2ULc+gQRGhnlCB5nLAibtp/zMTZBoynaC8NU4Jd3B/HaJsQl1noAmrYB260SQZ0GCcyzqCn6enDHlUB8ZwTMmd1VDTk6fTnpPCs1U5PWVxzdCUqcaQRcNzwEN+pwMboYJoKKSZRoYKInonzxhjsbqACd93u59QEHHJxIxK4eHOwBshDGrYe5h6Kr/M8SCvPWO6npILDInwJemcCQDTNStMjn1OWQtaR1vRF3xByYBWI9kWzIexkxsBKeJdtvuiX5TpXLiQ/lkCGPvFYQl3BxulkPvYESVgxrla0QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PNy/YK5F8zUiWjHfpze0wKfCrrd86+vfXfJLFlEJ78=;
 b=KO6rcMo39WmbolS2KnHpM1+h/IfP8KE9m5T/qYf0gk62tyc1Cdc+hlPO6R/p890WUp78IGyZWBBm5KpWqVeWmsYT83FCtYa3vB/4v0WLmSVkOZvjqONbaGacZhbWZMErVIjQ+nn9rnXXKbGyVvu4kJ7Xvf7NXcEEN+iueqDiHRY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e45d1cb7-333e-47a3-8834-5cb927e42e3b@amd.com>
Date: Mon, 7 Oct 2024 15:50:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/44] x86/boot: introduce boot module types
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-10-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b483cd3-1b4c-49af-5c33-08dce7095b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU0rSVdwTm9YWmd5VVlQa1E1bmZTMUdWWUROeEc2bUVGUWpGL2poRStsall2?=
 =?utf-8?B?SDdWajBHNjZaS0lpTS9lZmt6NkJSZCtOU2IyVDhNTGVDL3F0VXpQUlhiU0hx?=
 =?utf-8?B?d3JkbFZ3WEl2M3laaGg4MHQ3blBNc2EyVXdoaU9nZXdiZ3cxL2tXcks2Zytq?=
 =?utf-8?B?UnJHQlA2eVZkY3F4U2Q0UzFGNko5SHkrTjNjc3IzM0xJR2F5Q2Q1VkxtRUpk?=
 =?utf-8?B?LzU1ekRwK0hQTjgyd2hENndZVmRYaGpiYkRUMVZ6dGFYSzVNaVVkRWRuVmNq?=
 =?utf-8?B?MmJXN1JRVmRiTWFVWFgzQWJoeThFNTFtcnlTdXpqQWc3dEhyengxem05MGJV?=
 =?utf-8?B?VTk5UWY1akxRUVpqRXJINHprSXFtTFVpTXA3M25iTTcrZDhtNHVTQ0ppMDVP?=
 =?utf-8?B?aUsrdWFKWVBwaVhaRFRIMFBrLzNGNHFyRFdDVnRMVitIR3hLN1p1RFZmdWxN?=
 =?utf-8?B?dlJVNUxPTkIrNHVrK1ZzZjg4L1B4dXNlamd3V2pkam1QRzYwTGp6dUthU1lO?=
 =?utf-8?B?bzYrZUJ0U2lGSXQ1MEFNWU5LM3BOZzRwTWFWVUJzYjhWc29KeEhJMkFyK3l1?=
 =?utf-8?B?S01SSzNxZlN5bU1IeXVyYzBCM2tDMllGTk9rYzdoSE9veURaUkgrc0FqS3N4?=
 =?utf-8?B?K3ZYbnBHNDFqQU1lRXJ4am40Ym9FVDgxTWd6V1ZoeHBzczFITzZMV3lkSmhp?=
 =?utf-8?B?c3U1V21WektoTGF6M2pYWHNuY29iWVd4WUR2eXpLNlRYWXZkTi9NbWxVMVRl?=
 =?utf-8?B?Q1VQRDVTbmVIWnBwUElqQjZzejZtN1VoWUpkaHVOUUZGOEgvbGUvcXZ5WnZJ?=
 =?utf-8?B?c2J2d0s4WHhYUjdwNi9oT1h0bmgxVk5qMnNuTTJJTXI5WmZSdDc2T3VobHlk?=
 =?utf-8?B?VzdmckVvU0pOQjhQTDNWT1B0UlRkWHE5bFZrOVAvbDNwYXpOMVdTRHE1eEEx?=
 =?utf-8?B?QXZPYm9kRHlHRW13MjZtcGVaNU8zUkhkTGM1aitLSFA4ajdkUDZWUXlrUzB6?=
 =?utf-8?B?VnRYQ1REekk2N1JJVXB2VWs5YnZ3QjFZTUpLTVN6K1JoVHQzUXNkVkxrRTQ1?=
 =?utf-8?B?ZGdXdWhtcEdFdmtXS09rZEt4T3VwYWEyNWJpTVY4QU1OU1lmTjZpKzZFMWlZ?=
 =?utf-8?B?NFNLb2tPbStJTk1HUEw4TDVzdlBVWUJXM0c5UERVblVzcFpCSzgyemlaL3lx?=
 =?utf-8?B?cWNTUWFVZzlqVmJZUjdYNi9UelpaeXI2REEzcUNsRXkrVEExbjNrTVRnMmd6?=
 =?utf-8?B?dTU3V1NvR0ZKYmlYY3g3T1ZPdW4zTGtsS2N0SEw5SDJ4R0JQQnI4bERHNGFT?=
 =?utf-8?B?WXhMdmF0bWFGSlZ2ak9wZHcrU0NJREdEd3lOdHN5RnZJbTByNFF4NjdWQzBl?=
 =?utf-8?B?emtxc280L29tM0c1L3lqblJvUWc0UnVkR0lGRlJwZ2thTnNDTXpXRzhlNElS?=
 =?utf-8?B?R0JGV2JSZEN2WjhXditwb3I3YmxXK1pDa3ZlQ1JpUmRLck1EMUxIRTBSOWRL?=
 =?utf-8?B?ZlJtMktXTTYzZkxZYnBxaHZncHdjQkQweG9UTWV2Z2lSMkJCMGd3L1pCODhC?=
 =?utf-8?B?VWw1UWo1dlVpOTdrOGlHOXhVbkJXV25kQ0tOTHBrdmZrYmlRZVRtV0trTTNp?=
 =?utf-8?B?bG5kTjdXdElteXMxbi9NREJNaC9zY2hERWxYYlBNY3NHNGhnV3VJK0JwNVpk?=
 =?utf-8?B?cGQ3U0tIak45R0g1Uk12VTNCNGxFc0Z6ajdFZFJvcUxPMkhoTDBRUlpENzF0?=
 =?utf-8?B?VlRVTUZVUlpOVCt2aUkwa1B2YjBSaUp2cFNUYktQN1kzMVY0cHROWjB5WG5r?=
 =?utf-8?B?aHlrU1F3ckx0Q2ZLZ3VRQyt3bjBSWURDRzlwNnc2NEdkVFQ3M1BnYVNPRUJ0?=
 =?utf-8?Q?1tSQ4tbaCcoCx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 19:50:54.6423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b483cd3-1b4c-49af-5c33-08dce7095b09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This commit introduces module types of xen, kernel, and ramdisk to allow boot
> module detect code to tag the purpose of a boot module. This reduces the need
> for hard coded order assumptions and global variables to be used by consumers
> of boot modules, such as domain construction.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> @@ -2058,6 +2063,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>              cpu_has_nx ? "" : "not ");
>   
>       initrdidx = find_first_bit(module_map, bi->nr_modules);
> +    bi->mods[initrdidx].type = BOOTMOD_RAMDISK;

This is incorrect if an initrd isn't present.

>       if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
>           printk(XENLOG_WARNING
>                  "Multiple initrd candidates, picking module #%u\n",

