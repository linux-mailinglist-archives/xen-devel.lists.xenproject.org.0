Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC30AD6049
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 22:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012177.1390720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPSIy-0006zc-9e; Wed, 11 Jun 2025 20:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012177.1390720; Wed, 11 Jun 2025 20:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPSIy-0006wi-5d; Wed, 11 Jun 2025 20:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1012177;
 Wed, 11 Jun 2025 20:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPSIw-0006wc-OQ
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 20:44:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2414::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d53c66b6-4704-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 22:44:13 +0200 (CEST)
Received: from BL1PR13CA0271.namprd13.prod.outlook.com (2603:10b6:208:2bc::6)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:223::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Wed, 11 Jun
 2025 20:44:06 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:2bc:cafe::1d) by BL1PR13CA0271.outlook.office365.com
 (2603:10b6:208:2bc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 11 Jun 2025 20:44:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 20:44:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:44:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:44:04 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 15:44:03 -0500
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
X-Inumbo-ID: d53c66b6-4704-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8UiAIB1gZZi9KJ4nATn4O8YBLEHPN2/kbxFErjIYnhAu4zQsx5csRM7/9tmSI6xbTbBMegPpjMPhAKIHq/kCbAvPPuGjGVvTdWLLBoaH7v/E8AZnu2jGT9EDjdKUG8AQjx7M8aq91iRpPLoVPEkd5AQ8+6e0M3ZJ5HaOrUTz2/SS9tOhqUU/SbtawkLhLO2mLXpSdbpCAfAefgKS2u6CL7IlxU4aHvpLM6aEl+4UkxWOwgG4eew0YSlFyfDLoyLLogktv1nRyx76QKve+hjjaEyEpTHGY+w6ffNpD5Aey/D3U8akMeaWELdpqNgE3eKq2i2q3lO7UcdMpmuAsot3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u9KL/l+My+LzkoAWbGrbAc3Uv1NOv5SYpmfJKk8X9E=;
 b=YyL8hD4OjTzfo6v/2IewLUnDaTJfpOqGQo7rZKu6KMNzftSsd6lF9l8Fah5cpZ+QKEx7yIuofjl5ncMtoqYueF/7ZGO6kBuHq2COGOTIDX74PnPYCKXy20grBcsOnNYAJMHfqiT6mVjyKJCBtToKtoqkPUSbfe9gNkgM33PeZxyKMcvW7QDnRjJ/4IeYfPQl7kNnD5SN2AHVMFcwk3KB7cFXgr+M48LiDeGW6+O94cAVgftNENM1sy3/zh+l1iOP4MzmXVHPhelppneE6QroE61clm/e9E4N9pz5FVzvUmXrjxdA9CvOceLgiMCOLxYiPhzi/iKn/TQ2EGdxg19jFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4u9KL/l+My+LzkoAWbGrbAc3Uv1NOv5SYpmfJKk8X9E=;
 b=0LUjeglwSOO0CuTMPbcNBTHs8e7UymsNHvpaJD+qIEMSwIKopAmBXwxfVQD+nM156dU4gfda9d1bAH9r2EtYghsNZ+XIAgA/A1sxMdepYeqFFhk5FFOemoi5sFX1b2IMXTBSXunihMBoU4chr3c917i6cpzGAOus6OPinavke5w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6b1a780b-4454-4001-ac36-26eac5e383a5@amd.com>
Date: Wed, 11 Jun 2025 16:44:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] vpci: rework error path in vpci_process_pending()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-3-stewart.hildebrand@amd.com>
 <aEFpARzSGJjFCjN1@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aEFpARzSGJjFCjN1@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d98bb03-34bf-4586-5394-08dda928b565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nm9mZE82cVYzcFlpVndKZ3k4Y0w1bEhEQjNGMGR0Z0FoaDVrV2MzNnNCS0JN?=
 =?utf-8?B?UXllcnRQL2duN2NsYWFnR1FDbEpucDBBa0hNeTBrRWQvZnN1QkprZ0c5T0lF?=
 =?utf-8?B?TTZyaXhWdlRjcXBPU2t6RDNkYTRWVGczcDUwN2F2NittOTVHS05SdWJ4NGFI?=
 =?utf-8?B?SHdVYyt3WXRzYVRROENFLzg2Y3VBMzIybXFacVZvYy9IK2owTEZ6MThENFkx?=
 =?utf-8?B?QlBPdTRaN1puZkhiWFVKUS9JZEJGYVArQjBURDlYSkdCT0xDcCtTTCtzTkJN?=
 =?utf-8?B?RW5hRHRDNlRKanNUWk53bDFnRmFoUC9JSmxSS3BqMVNZUEJFSmY5ZU9rbnZQ?=
 =?utf-8?B?V2pJMVJJNzA5dStLNE9RcGhDVlNFd2JCbHEydnlGRXBpcnZ3dG1JT0xyQ255?=
 =?utf-8?B?bHRKSmVRYkxtUWI2Q2cwU2sxM2lNWEYra2VwV2FsR1ZEbWFJK2ZTcG94Wmh6?=
 =?utf-8?B?TElRVGh0akk1Z3padExreDUvZjBZcThrK2ZmRkJnWm9EaVBNRnNHbjVxcHZr?=
 =?utf-8?B?UTlBNnJEc20zeU9NRlQrVHZYYUV3UGV4SDNUcVhmc2IxUzVmU1dzZHdyQmsr?=
 =?utf-8?B?dHNXRHFwWi9PbXVFU3JxTkJxN3FuamdvblhkZzdCZmwwNHV3UVhDeTFVK2Fu?=
 =?utf-8?B?bGIwVU1ETGNQRGtQOTd1dURkRUxCWjJaOFFJaTcrZHJmTjdQREZSanpLZWxN?=
 =?utf-8?B?YTNMM3VrM3JYU0FpYlBpa0FJSUM5ZzdYT1l2TGN1c1ZIWm5tWWZDckZNZVRj?=
 =?utf-8?B?WWJLdmhrZVQ2RmhsTkJmRVFUVXFyVk8zd2s3a1U0ZEJJS3lxUWtzUzZycE5P?=
 =?utf-8?B?WE9TZUcxZnZSbmFJV1Axa3oxVVNCU0FUMDI2cjJJRlJtMis5UmNESmZQWFNJ?=
 =?utf-8?B?Syt3c21UaTcrMzdFTzU4V0MzbkM2ek1ab2lsSEZqWjdtRDRKaG1zdGdkUnpL?=
 =?utf-8?B?R2lRQVBuV1UyVm9TMVZOV2x0MjJUeEl4V2JiR1BpbnNxSDdaOEdwQTFxQ0Y2?=
 =?utf-8?B?RTEyYm9YU2FKdTNqeEYwa0RrTStTVGt1R3JSSjJyZlZUdkVyK08wdEdDTWNB?=
 =?utf-8?B?Ni9VR0JKQmtwNHg2aHlaNksyV2JMNm9ieWwrU3hwRXQrUUtGcFdHY2h0YmVY?=
 =?utf-8?B?SHhEakx6eDlsekZCNnpHL0hhTk91NzUyRXBYU3owdWFJYXNKdTc3d283Y2Q2?=
 =?utf-8?B?OU1KZDltbXlMQVhhbVdVMGFsZWloYlVtRjJUdkw5UGJVbHBveWJFc3lwQ2l1?=
 =?utf-8?B?Q0FsUEdEZndLVmxPaHJTMUYvYk5RZ1JsR1FPRGxaMHliTThMZVhpRlJIVWEw?=
 =?utf-8?B?ZHVBUnpjWHRJaHUrVWJ4aVc5eWhYRlhEMnZvcEF2NFNMaEkzY0JidEhXUHFQ?=
 =?utf-8?B?UGtaZUM0RFhZWXg4ZVNmalkwaU1PblhDWkNFKzc2QzNpU09RWk1jeE1pWjZZ?=
 =?utf-8?B?QlVwcmwrODFmcHR6Sk1UUHpkdGpzRWdhYkg1NWRsWS9kaktNSExOcDQ3R3c5?=
 =?utf-8?B?cEViWWJtQ2dYTm9Jbk5IY3UweTJXMnpzZWQ0TlUyQTB3S3dHWkluUkVKTFoz?=
 =?utf-8?B?TEZ4elNjL203blJiREo4TFNtOHJuZmlENm9XeWYvUU9vV0RWTEE5U2VmMTBz?=
 =?utf-8?B?MGFMVnI3alNiUWpxOXg0a1ltanQzNldZZ0U3eU52T3MyUEgxQXUyRERtbFRD?=
 =?utf-8?B?ZnZxaTFjdGZobldOQ25ERHF0ZXhLYVZzcHl2SmM1ZHlZem9VVFlBS09Ib0JM?=
 =?utf-8?B?bGZkRWthOXBVSzhjRFQ5UlNxdTNpcGhGZUY3MWpRZmVqaFF2ZStSVlBZa3ov?=
 =?utf-8?B?RTNBdFB6UWV1YUNNSzJQSFNHRWNVMER2MVUrS1RuSlkzcHBERGN4MmNLL3NN?=
 =?utf-8?B?d21TSmpFQmlXc0F6SXRFSGRTRFNmQWg0bW1PekVGSzMyQTJFVnhGdVJ0MERv?=
 =?utf-8?B?ZHlvMVlyaldFaHVYODh6NklxODlMRUdubkd4ZkdPc25maWI2UFhOVnNBcGxj?=
 =?utf-8?B?U0F0eXpDSkFUZFNwZnMwL0FFTXdqWG5jRXRheTYrejhtQjJ0WWNBeGZZZWZM?=
 =?utf-8?Q?DLtqQV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:44:06.3146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d98bb03-34bf-4586-5394-08dda928b565
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

On 6/5/25 05:53, Roger Pau Monné wrote:
> On Sat, May 31, 2025 at 08:54:00AM -0400, Stewart Hildebrand wrote:
>> This will make further refactoring simpler.
> 
> I think you want to add:
> 
> No functional change intended.
> 
> To the commit message.

Yep, will do.

> 
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

> The success and error paths have some shared code, that might be good
> to unify, but that requires further rework.
> 
> Thanks, Roger.

