Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68D89861C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 13:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700827.1094550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsLOI-00055t-1v; Thu, 04 Apr 2024 11:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700827.1094550; Thu, 04 Apr 2024 11:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsLOH-00052t-VV; Thu, 04 Apr 2024 11:36:21 +0000
Received: by outflank-mailman (input) for mailman id 700827;
 Thu, 04 Apr 2024 11:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsLOG-00052n-RE
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 11:36:20 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8daff9f7-f277-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 13:36:19 +0200 (CEST)
Received: from MN2PR20CA0001.namprd20.prod.outlook.com (2603:10b6:208:e8::14)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 11:36:16 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::6) by MN2PR20CA0001.outlook.office365.com
 (2603:10b6:208:e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 11:36:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 11:36:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 06:36:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 06:36:15 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 06:36:12 -0500
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
X-Inumbo-ID: 8daff9f7-f277-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5lL/P3FvVjj90hhkHDwHYX18lzjZzytMEZ21FuD/kZgLsETOM3Hh+SAGcnrwKm2o6vWUmO6hCZMmVo1BwV2hJEhzNOLW9KsiPjN+1hZTpatSklyLtGwlNsrfoJ9DvHgF0RT7XF46s8MRdpMMMX0Ju0IAl0RMGyG7dbCqG/STa3VfW4gqslEJJPdN4ZwbgbwL0K7ZKTqS+JzifaGqGq13qof75TxhHRnbny++/+qDidI0CjW2DR71lIodx6poEamNGI62xzSIQ4Q4ZjQVasvtVVo+/sIxS1OHaZq1ZIaaz7aSe27k4dbyGrAW6SePgzuti0dTqksU7OSQHSW9adaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DBhCerJZpFX20dxGZr1pI1DqUS9MKKcoucDMbJ5nvU=;
 b=htGCmvyXA5vOjDpxSrOEe0CetNkhPWrshoqS6OUi1zIzaMYgUvpVqYiry8aNDJeuWn70iSsBf5NUaB0Kctc1AiQ0FSbINCOtZCXeVKO4U6Yerm1qV5aQG84UquKb0l1zoxEEaCAChq0l0NIUfWgmAWmV1OV59t2uc8wEriFnui042vREVoz4WvszbnelivB2hHx2bBubFuBLM/P/UgTyzOuqAz6kI3GyG2f2tQpqG5XqS2gVjLmjDlte34GfzeOxc+tG+rlseBqw9yAci3E0DhIaftJs0LlZkDS8wBB7t/bl1fotd115bL/7NK7Y2Bvcuz8tOrigyNGwNlZMfPGMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DBhCerJZpFX20dxGZr1pI1DqUS9MKKcoucDMbJ5nvU=;
 b=fRSnrJInIEX2MzH7ooTis/yzEouV6vMHcR5pDLKWS3LtCHjBKqW6f+RQxOP8R9TlG8ghIfl+7oRrphZfl5WnzSQOt+qN6g/zgWCfj2Zwt6ryKabtVka1vvA+pNNkkN3FYXJAY6mBCb3TIenJIgkxFi6IHUHlJT4+06W2QuWESOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ae50ef70-39d6-4abb-a457-8bc7cb3bbfcd@amd.com>
Date: Thu, 4 Apr 2024 13:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] xen/spinlock: add explicit non-recursive locking
 functions
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Lukasz
 Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
	<mateusz.mowka@intel.com>
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-2-jgross@suse.com>
 <7510b237-a8cf-4ded-a99d-265bffbed623@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7510b237-a8cf-4ded-a99d-265bffbed623@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1ee01f-01c3-467c-1143-08dc549b7094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KxPNo66XrOgGmaZCKFnrFP6ruZ8rnz8313iJ8e3p7z9PyflyvmT/OKPIz1r6GOOpNgE8yBTTOv+0pHgrItMmBKJR42wheQCCO3qeOd1l9qU8BOBidfYzMjNzTm5EpGZ4kH7457kA1FLVJhYnDmxWjlTCPmst9GsgE4GCoxDTdrMXUSj3Y5Rl+875UMF+9SdoYCM+JPD19iFueNB761HPrS4t0VaqxsWWM7v5DtTnZKuJWCD+hf/4s/O3e03AECEakPNj7bPFEvU1gqKfpW8/ZXGG/QqEZ4i6rcZrRE20HF3esuA4O6wyo/jMql1eKl/xRJ2LNYwt4erpWCK64yjrl8Fv28jv+0oJ5nmfs8pJ4KqeDeAsvR90nur2wXU25VDIjzqOHWbshT7oscsPsaUHOa3+FufbjbLEb+SiRdq6s4HnSHZbCJAX2wjMIFb6AiWYfmvf5LDw1pe4iF8eRX2ZvsP9GWDP2tKOlJO8bv7MAn/xsmdr2kZZouGmP0fKjF0FUuOU62P9qbHXN6TLQBoEtZ0M3tDwBue1ay3i9viN1d5/kvdFitCMGAVdb5M3zRrOkPKeg0GjKxDbOCw0M5G0WVsZb1WsFisxhhYUGh84bS0epS3bhuHO57gaZdr6XhsGlCSZ3jX/vLjHDmX/1RWV4Ka3zM2D2brXma0Jh+B2iDQsPii76kaOba6H2JVtOTXHlvc6pUvtBx2+UKqAdE5IGL0ul0kLO2ryGQqr1/v8Y1e7mSaFGlpUeInknZXy/gMF
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(7416005)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 11:36:16.2840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1ee01f-01c3-467c-1143-08dc549b7094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572



On 04/04/2024 13:22, Juergen Gross wrote:
> On 27.03.24 16:22, Juergen Gross wrote:
>> In order to prepare a type-safe recursive spinlock structure, add
>> explicitly non-recursive locking functions to be used for non-recursive
>> locking of spinlocks, which are used recursively, too.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Could any of the Arm maintainers please have a look at this patch?
I can see that Julien took a look at this patch and he was ok, so:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal
 

