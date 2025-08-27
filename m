Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15370B383A1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 15:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096043.1450854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urG7t-0002pp-1Y; Wed, 27 Aug 2025 13:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096043.1450854; Wed, 27 Aug 2025 13:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urG7s-0002o7-Uk; Wed, 27 Aug 2025 13:23:44 +0000
Received: by outflank-mailman (input) for mailman id 1096043;
 Wed, 27 Aug 2025 13:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4tM=3H=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urG7r-0002lA-Nj
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 13:23:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2414::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bf78fcc-8349-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 15:23:41 +0200 (CEST)
Received: from SJ0PR03CA0193.namprd03.prod.outlook.com (2603:10b6:a03:2ef::18)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 13:23:37 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a3) by SJ0PR03CA0193.outlook.office365.com
 (2603:10b6:a03:2ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Wed,
 27 Aug 2025 13:23:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 13:23:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 08:23:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 06:23:35 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 08:23:35 -0500
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
X-Inumbo-ID: 0bf78fcc-8349-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SExRb11X7JXabmdxXpurp/z95J29AwrpeFG7k7M+2MWf8vKsJfbM1iQN/RjlYw1sP4wIVkw3ErQsO7BvG9eZAOuCuX26lyk6LPOATfqxVy12PRv1rFgDy7meOXjbxK9z/E/dbIX4C+PDEOsl60xyFbFd/lM2TZ23gKBuFCaTyDknybpdi1OR+f7IAUqp3MFbbOhelUTCTB6ljoYIaoZ3xJTJw5NGgUljIfa92xlSpeZkKH54La4lVA6tPN8W6I5ZN4sN+fg5GbmU4bLGkKLavu40OVMyyl5l3eZRqjereLAMLb0BuvQEAd3Wm2unw6SNcHT981e0ffCKq1p9SVmRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1dfsLPEJr6prokg36dJQqYvkdfMPUPgjOr3lyfTFvw=;
 b=XAibtkxvnwlnSyTL3y7ods1MPv/FTUVXz4gb2FYJzAtt4Jg4kskxs3AnpsUJ3Qqpt1w31FDT/pze8heS5bkklS+gngQSh5HU9q0D/d7JLdHcBPf06d7dHZ8fdi4yD8pWtFh0tUziQmoxDHb0GDOdknrz1uz0UE5hbuQEZ8YuN7vIXBRAJ7j9ANt0xnFdDHbOa8OstCI80oKTtEpdgQhB0B0qWPuNbXKBfIBQi1mLOdRNDcRTdkUzzDSzmieIAORjivzEJOZq4E0W9aBlYEACbAcQ43MG85d0v5UU4caWxxwB7lhpxqBwIiGuCN/EOX0L2qCcXQKDuBa2GkHCh0cDCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1dfsLPEJr6prokg36dJQqYvkdfMPUPgjOr3lyfTFvw=;
 b=QzWzsx0R7I9tyrWiNdum27JFdjVOcJqRQpX3lEJHhusj039+voonQJ7oEd7sKK+/FuX2mfAXsQlebKwal2qzOHkc2fOvoRawrBiv9iWKDwIJPCKmxRJD6rvzKN619YJtq6Oah1Xe74AwUavPUA2tngsDHTrP+c0e41yPt22DBL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <376fa306-1b77-4bf1-ba02-9a8d7946e70c@amd.com>
Date: Wed, 27 Aug 2025 09:24:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] xen/dom0less: store xenstore event channel in page
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
 <20250826210847.126015-9-jason.andryuk@amd.com>
 <b59ea812-6c97-49ea-b7a9-c02e3e265800@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b59ea812-6c97-49ea-b7a9-c02e3e265800@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e8fd2a-9e7f-420c-5833-08dde56cedf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWhsRUt1cU1xSm1QR2YxQWdjSWFOaVdTeFBzZkxrNGM2dytLZ1hmMktDa2VI?=
 =?utf-8?B?SVNibkRmZi9RWGduVmpNNklRT3l3T25SbWEvMDlxS3V4b0tvSndURDBWbWpp?=
 =?utf-8?B?eG1kU3FyTlNoRmJzTUxVMy9wUXlzVDJyd1RXM0pUOW5zNkZHVzM2eFN1WHF4?=
 =?utf-8?B?d1dZUFlsQmRIZ2Q5cVR0amhwdjFDd0tDRkJkVG5NQkZ1aGNFdkRINi90Mldq?=
 =?utf-8?B?RGJsMjFkbkp0KzhVdzdmVi81YVI2WVAvNmduNi9yNGo4RjU0UGVnN0U4cjAz?=
 =?utf-8?B?US9pdHR2R2F3RXhIZm5ORFI1L1MzalFkSWV4c1dmaUp3dCtlWmcxMVAxSC93?=
 =?utf-8?B?NU4zUDVPMGx4OFFZNlJvSm4rc1dEREYzVUJOOEZYVVR6am5xcFl6WnBSVzh4?=
 =?utf-8?B?SkUzc3hNRFJBUnZiM2VhR0NLWmI2TXBqdHZJNXdkY25iYW8veDRsNmNWQ0R1?=
 =?utf-8?B?am5yUUdRTmZFcWdneW5uRWpRZ2g1WlhaSS8wdkZGeStwMzhKYkhMdE1xRnhy?=
 =?utf-8?B?TnZWZ2hnYUF6dHlQejRSSnRlRnpkQTJmODRsTTAwbVF6RHh6b3BuS3NvaVJU?=
 =?utf-8?B?V0xnTVQ5QnZVYkFIQUd2aFVDc2tpWUJpMmdyOGV2ZHpUVDFjb2llWk5aUjJM?=
 =?utf-8?B?Q1JxNU1qNU9nUHk2dnJ1R1VueGJJd20zWHdZY2Y2cG5HQTl3MFlCMWYwYklZ?=
 =?utf-8?B?QngxVXE4dU45WldtVjVpaVEwZlYzb3AwT25SNUJWQnNOa2JLakgrMjl5TEh3?=
 =?utf-8?B?QUUxb3FxZHc0bHg5a1JucGw4NURPSDlUT2ZYSmZuSGxSaVYycWFGSHRLSTRj?=
 =?utf-8?B?QkMwZ2dHZjhLbFpIeWV5TUxFdHdaMjRzZERFNlZtOE95U1cyUUpvak5nemZ0?=
 =?utf-8?B?S0JnU3VLZXhkRGlIVDJ6NVBQaHdrM0hiWnJFam1CWVpFUXFIUFIwaVNCdVow?=
 =?utf-8?B?LytSUjlQOCtLVUVFalJvYlFIQmdpTCtSYWNReFlrN1lvVDdpTkZQVjhDR1B4?=
 =?utf-8?B?S0g5NnpTZkcwQytDQUtwT1M2NlllUk0rNFJ3MmJHREVnMXZyUUJndGQ1ZGxL?=
 =?utf-8?B?NlBqa2I1MS9GbUpkOVBhWVYvUjFyeEg5RDJmYURDUUFLMEp3bzJrSzJFK3c4?=
 =?utf-8?B?cVB4MjdZVUptMUlwWGR6WnMwTUJSKzZBbUZNa3JQcURDN2g4MDJFUE9rS3V5?=
 =?utf-8?B?NU1pczd2UnRkQ1BUd3NrMGxIQVpoVG8rWncwMFBXcGRQMnlTRTRhdnBYaHhx?=
 =?utf-8?B?K0R6bzFsbHdtN3Z4djVvWGxxVExCcHpEczIvUGQ4OHBka0V1U2owYlAzK0E2?=
 =?utf-8?B?emhObEREbjVwRzlpSVF1blA2alFMcFFBbldJR0p5akU5NzBoeEhOZmU1NGtB?=
 =?utf-8?B?Q1JKeXdoSy9OSjkzWlJpcE9wK1oraEZmNjNHb2JBM21IejJ0Q2x2blROd3Jo?=
 =?utf-8?B?WnNiRWRNbE9YVnd6Z2dON3hMeFBRd0FUcFdrZ1JKN1V1bitKMEpPcXNOTTRo?=
 =?utf-8?B?NWtOaGdtWHFBdTBwUCtNSmdWdVBNMW50VWNSaG9aRXYrY1p3d1ArRE5Ya3lL?=
 =?utf-8?B?bElyNkt3dkRjRXNKSk5oMG8vdTZvT2dWcU9LMHZ4bmVWSVNmMXdGaXhLc1NJ?=
 =?utf-8?B?dW1hZlA3WENXdTdKUmMwU1hGNFM4K1pQNHNjMVhQS2tWMVRqVERlbnVZVnI0?=
 =?utf-8?B?RHY3TnJPSGVJQVRGWUVVN2l0NWJrYTlQSElRY1VBRm9VRE5ndVI3cEIrYldw?=
 =?utf-8?B?b1UrR2NBdEg3d2cvWlltS3F0M21uczZad1RWVFh0aXNpd2NWYzhBanIvdnN0?=
 =?utf-8?B?N2tpTGtUcld6SEQ2NUliZnBhMHRxS29lUjhiZzFPSVRCTEE0VW5EWHoySVRG?=
 =?utf-8?B?UXpCdmkvTnFNUmxBaUdvTVhmMWFuSzBPdTdKMU9GV255cVF1cFpSdXhNTndj?=
 =?utf-8?B?U3NOa2p0ZHlzVTIvdkFjSFJOcmsxdTNWMjNGV29CSlhqOXVYREZVWEhCVWsz?=
 =?utf-8?B?OGpYQmdFc2tyTTRCRmFtOFFkcEdvTzR5OXR6bmJnbXE3eTRUcnpLTTF5RW5q?=
 =?utf-8?Q?J0jY5h?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 13:23:36.6438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e8fd2a-9e7f-420c-5833-08dde56cedf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499

On 2025-08-27 04:03, Orzel, Michal wrote:
> 
> 
> On 26/08/2025 23:08, Jason Andryuk wrote:
>> Write the associated event channel into the xenstore page so xenstored
>> can read it.  xenstored can map the grant by the reserved grant table
>> entry, and then read out the event channel and bind it.  This eliminates
>> the need for an additional mechanism to discover the event channel.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> v2:
>> No change
>>
>> This should go in after the init-dom0less changes so init-dom0less is
>> ready for xenstored automatically introducing domains.
>>
>> I'm looking for feedback.  This is ARM-only for the time being, but that
>> is the only in-tree user of this code.  From the perspective, it is okay
>> to go in.
>>
>> If we want a cross-arch approach, a common function to write to guest
>> physical addresses would be needed for additional arches, but they
>> aren't available yet.
>>
>> Oleksii added a function pointer to dtb_load() and initrd_load() when
>> moving dom0less to common, but I think that isn't necessary.  Just
>> having a common helper would be sufficient.
>>
>> copy_to_guest_phys() or something_copy_to_guest_phys() could be defined
>> or a wrapper for ARM's copy_to_guest_phys_flush_dcache().  Other arches
>> could need to implement it when using dom0less.
>>
>> I'm not an ARM expert, but Stefano said
>> copy_to_guest_phys_flush_dcache() is not necessary since this xenstore
>> page isn't expected to be accessed without caches enabled.
> I'm not sure I understand this point. When copying data *to* the guest, cleaning
> is about Xen's cache, not guest's...

I was trying to highlight that the patch is using 
access_guest_memory_by_gpa(), but dtb_load() and initrd_load() use 
copy_to_guest_phys_flush_dcache().

I assumed from the name, and Stefano's comment, that 
copy_to_guest_phys_flush_dcache() was about ensuring the CPU's cache is 
flushed to RAM.  That way a guest starting with cache disabled would see 
the correct contents.  But I don't really know how it works and may be 
wrong.

Thanks,
Jason

