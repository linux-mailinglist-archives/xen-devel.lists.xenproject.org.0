Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDCCCB1582
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 23:50:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182291.1505186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT6W5-0006bR-2k; Tue, 09 Dec 2025 22:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182291.1505186; Tue, 09 Dec 2025 22:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT6W4-0006Zf-W8; Tue, 09 Dec 2025 22:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1182291;
 Tue, 09 Dec 2025 22:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT6W3-0006ZZ-MR
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 22:49:07 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd67971a-d54e-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 23:31:28 +0100 (CET)
Received: from BYAPR02CA0024.namprd02.prod.outlook.com (2603:10b6:a02:ee::37)
 by DS2PR12MB9751.namprd12.prod.outlook.com (2603:10b6:8:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 22:31:24 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::19) by BYAPR02CA0024.outlook.office365.com
 (2603:10b6:a02:ee::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 22:31:23 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 22:31:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 16:31:23 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 14:31:23 -0800
Received: from [172.29.90.244] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 14:31:22 -0800
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
X-Inumbo-ID: cd67971a-d54e-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsZ82LWgcLFoWArKp1sO9HNINBDgCUDj4O/LbMzcE8IGRb02T2JhLUHiCQF/onLW1TikKemXSIkhX5pGMm3nblX6/v5LaOh7P3F5YhbjPOYjZaSIN7N+JFjG41UIXaAOCJ3wO+A6AoJ8IwiOBxC7RO2Ng5vv5vuiKrJOp4pefXvJmTo8w75yL4hAL29fv8RW7Ng0CBMVe03+hioslCbDEvlb789uK3FX8CSTmO3ZMqmqr0QYyb83MNP8AfkvaHHDKSyc+LBRqmiYH1FsORT10pAXXc5LTLk4Mf3A9d4zpKrcBc+gyzyGqIKkLk0Y36RPfEZWhUkLqfQPV9Y6fwDulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOCI+4Uyl88TpWdukmZa2n5ZHFLIsFa4QlJ8dtRtcL8=;
 b=sM4e17Dj2qCN4kkFTOMlMJx4SEaKafwZM1j8Y8krEnP7apqgadNvvt/cXmzojR0GLoajTlXbWYpGxvziz1OK/ZD4sah3nd9OpZ3hzPITXAsCgK7XXQZ70zub9cU6DpGBhtseT9boxStc+SN5RzebmHLxrZMHjGkaDON8YTepQOgXPn8yD2qvj/PU2rSJeRLW/qj8NqUenyp+40q4hfFjm104IOxU8JPQgyA6Ibv9gObNzCbuXE13vAXwMXm/ga+PiR0tdqNjYmIY6bYv0AG6WGj/XLavDOjWRXjFx5KXnnllVfjvtHTzRCVCbaBQHl0YLNFaRwwuFofNG3oE+e8L2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOCI+4Uyl88TpWdukmZa2n5ZHFLIsFa4QlJ8dtRtcL8=;
 b=gZsSOiIi0FjOMsfuagpjpVQb+NHbQDfcX1oYoimOGuUSd1vkVxmnZWSHvG4YGm6fn0Frr5KmzP7443ZJMOo8cRN3ijFJnBmRodw3efWIAshv7M1noj1WWcCs1rEZOpbtBqPNuUohJrk88fSiLjQ8/fBbdF9DX4L1D86gJz/Fdj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1c49a560-93d9-476c-b3d2-5f7ce416d9c3@amd.com>
Date: Tue, 9 Dec 2025 17:31:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/cpufreq: use host CPU policy for Turbo
 checking
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <27f467a9-a507-4832-850e-190aff8c04aa@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <27f467a9-a507-4832-850e-190aff8c04aa@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS2PR12MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b8329f-81bb-4b38-1e8b-08de3772af37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU1sNU5yTTFaZ3c3SnBpQjd2WUFtOGlwSEFQaTZLZUsrTDh0ZTExY3FhTU80?=
 =?utf-8?B?WXNXUjJoK3RiYjRkWm9VSjc1WEJRc21rME5JQVNueFgvZEowb29zNUprSjht?=
 =?utf-8?B?cDFNVVZmczY5Zm5FTVArbW5USHlIS2VIb1U1elZwRmsxWHlteW0zYkM3MWJm?=
 =?utf-8?B?a3BSYThmVkNrWHdLczRyY0RNNDl0NXh2NVpKRTJLQ3FKS3FEZ3NhSTlzUGo4?=
 =?utf-8?B?bUU4SG9CUDYwR09pZC90R1MzUGFLb3VZTlVBenIrRDRUMkdQUkFaUVdSbjlI?=
 =?utf-8?B?bWZvSXJNSGw0UFpRRXd3ZVdjTVNwZXRFckk2THhYWW0zT3BsTE1zdS8wRlB5?=
 =?utf-8?B?a1BIdVJZNXozTStuL2FVemNtM09xanRXUXNpZk9ua21xdmZpb1dFcEhYaDhm?=
 =?utf-8?B?aTRkckl2STZ0Tm9JVnZESGtYUHFhNTJxREwxTFRVR21vaFRvdGppdTA1aWow?=
 =?utf-8?B?Qk5oUlF6OHFZanI3bHZrQzRsbnBlbk5VRVJJSXd3eE41MDRxNWEwYzhPQldD?=
 =?utf-8?B?V2I2aGtXTDVJaTFlTWxPYzFBbUErekp1RXVvWTVSUGgxRmV0eUVVdDFKNUJv?=
 =?utf-8?B?cHE4SmRaZEVzTjBwdHM0UVcySDdySzZWeTB6Z3ZJRjE4cCtNL01KdUpHOFJF?=
 =?utf-8?B?SG9zMHBtUFQ4YTdsNWlEU2JxbC93UFNaSTZhbGE3T3JycHg4WGxUZnBJMTRl?=
 =?utf-8?B?Qm5RbW5HT2RCak1wd3BmczlScUI4ajYxbHF3L1VidFo5TjdJUGhhK1JyTmNh?=
 =?utf-8?B?Uno3TXkxeExEYTNZMlBGWWJ0SWNsQXpBaUdMUFAra3lJVGh4N252THViNm56?=
 =?utf-8?B?VFhZNzZUcGNQNWtCaHhWc2RNbUVFU3I0ajF2RlcrWmlqSDl0eW1DZlQ5aVJZ?=
 =?utf-8?B?ZU5DanZlbUFRc1VvemdkeDhDNnpLZUYyaSt0bjNyMDZnMW0wLzVkQ0phYmRs?=
 =?utf-8?B?UkM2a1ZmWVZEUTVlbmR3czkwOWR0NkpWU2NUM21taVhmemxCKzBwSVEyY3lR?=
 =?utf-8?B?MW9XK3R6bEtiTk1uTzR3SFhRaEFXYUd0bHlqa2dqYzNvVHp2Wnl0QjYrQThE?=
 =?utf-8?B?MmFoTE85cmNudFVvSUxIZjBRT1hMM0JMN0E0bjJ4ZUxweEhnbkhnemVNRThu?=
 =?utf-8?B?Z3Z3Y3RFSXRFdmh3aW54UVlvYlNYOERCMnh2OTg1ZVY5czhoRkNxM0ZVdXhk?=
 =?utf-8?B?U1N5UnpmUHpWNWhDMDlKTzkxanF0RnhSdU5yaUk5U1haWFRsMndJc3BpU3p0?=
 =?utf-8?B?SXB1QkNyZnZNcytRNGs4SGNjdXpBSzI1WGkzZzVXQUtjNUVTNUwwMXFFRzMw?=
 =?utf-8?B?WUpqK1JjaEFxYzBhRktJTTludU5uNWozbmJoNlJ0TTdlMUMvWnEzOTFNVTEw?=
 =?utf-8?B?c3RoM3ZOWGtrdEJKWnhkSENZZlVVcVlhUjBsNVcwUG90YVEzeWZxMFRIVm5Q?=
 =?utf-8?B?YkVIc1pRNkIvUXM5U3luTXluV1FwazJTVVZtTjBkY1NVRWlhTWhLRXB6cmRt?=
 =?utf-8?B?c3ViVkFna1lmNlJ6eGNGeGNSd2N5a2I1MkQ1aHh0Qk5VQjhNZFRxRW85amV0?=
 =?utf-8?B?OHBBUS8rb0tHcEhEaFdYY1NGMmhMc3JhSDdzQzErbkRtTG9jbEluc3E1K0Nm?=
 =?utf-8?B?dlVmeisvR1A0Y0ZsRjBmUEtSYXRxMllWSDdnR2NVVkRrWTdhM05xeGdvVzYx?=
 =?utf-8?B?dkU1bk5QMDNFbmpSSzhMdGVFUnRyczlLMG42M2NTcmlWU0tPajVVVElBWTM5?=
 =?utf-8?B?UmZkSzhPWUcrTktoSVNXWlNuWlcwWjErZ1lITjFCaitFOWk5TGo3dE8rb1U5?=
 =?utf-8?B?dGgyeXRnQVhsOGF6K2k1MUFwMmFiRzZSZDVRRzZsT1ZyTVAxaXEzYUJibWVO?=
 =?utf-8?B?U2w5OEVySWQxVDRrbUtzWmVwUFRsNC9zWVZIRzdPbkRtclpKUkxtNVAyaDBS?=
 =?utf-8?B?SWhlTTNrQWdqcmN2YVNscFk0VVZESGwyd2VZN3dOeVZIMVRwZFVyN1NCTFRy?=
 =?utf-8?B?T3RBU05uazJSa2dmUkRNbXJuVlM0dFdibGdTaE9WQ1g5OXhmcklRaWhqMGZm?=
 =?utf-8?B?Sm1yY1NpOXp0OEZTUjIvcFp4UHJpTDkwY0ZIU2t5dEVDMVVCaEJlM1hOUTdM?=
 =?utf-8?Q?I7Ow=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:31:23.7783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b8329f-81bb-4b38-1e8b-08de3772af37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9751

On 2025-11-24 07:24, Jan Beulich wrote:
> There's no need to invoke CPUID yet another time - we assume symmetry
> anyway. With symmetry assumed, logging per-CPU also isn't very useful.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

