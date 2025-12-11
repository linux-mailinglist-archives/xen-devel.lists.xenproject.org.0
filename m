Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B7ECB59FE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 12:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183916.1506503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTehG-0003Tg-PX; Thu, 11 Dec 2025 11:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183916.1506503; Thu, 11 Dec 2025 11:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTehG-0003QU-Mx; Thu, 11 Dec 2025 11:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1183916;
 Thu, 11 Dec 2025 11:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pO9S=6R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vTehF-0003QO-EJ
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 11:18:57 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e65e2eb-d683-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 12:18:55 +0100 (CET)
Received: from CH0PR04CA0086.namprd04.prod.outlook.com (2603:10b6:610:74::31)
 by SN7PR12MB6861.namprd12.prod.outlook.com (2603:10b6:806:266::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 11:18:51 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::3a) by CH0PR04CA0086.outlook.office365.com
 (2603:10b6:610:74::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Thu,
 11 Dec 2025 11:18:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 11:18:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 05:18:50 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 03:18:49 -0800
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
X-Inumbo-ID: 2e65e2eb-d683-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0ZiDImPGVedUVVib8b6tCSQbGtoZ5zFVMgwN1VQABjZhVC2pacllxnrX+klkTnpWubZBUmfqnELGCnK1mNHkXWS8pd+RfAAgqt8nzhnLna/hJw/A/EYvjRyEmTxM/DmikOMcN4LOKr/2N+I6aJfLT4n1Tfmfoc4Id3riJv2zqTJcFz3C89o3YxG6BV1HkWrVFsGK+JFuDKMbp78IEqMdhUkFlN9NjtWyR/FoH4DVB+ZiXNzm2BAXp99uLn0X1XuvivD0g9XkTRCkekm66fXc+TIHvZofjqYXmJtOHDsbSLdj3+oyXDNLJTrAZA7AaCUWa1fztZjFJu7iv1+PW6gEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+PJLbrxb8Mnsh35fCCRUAZoERxo5hSwy9Nf5x879Yk=;
 b=T1zwHHFoRS2i5JUzIcPxYi507EYowUtdh7Jpin0yyj4x9Yppc+itoofsRxfpd6mdwG/neA8tfx3SUOcUqRQLwlRDaqcXaBF7A0fO0j/NVYorps6LtZm4uZTxX+2By+TsbRATvaqLd3evQEg0z27KeVo+BbFm8YsZn09mS7SYwbDcullCg7+IKInlevJvToDk+hwD70Xu+3wnHrUp9RsOxw4uKrlU97KIlm/ioGzA3X2jWkqhFfvWu2aanMaN9NZZ5TordtUKjnPNKZ9xAptllJSeJyaVKTbbuZLTNuXX3+bueErXZyGWM53IPgRpLwnjIqhElfWoCqZtWnVKaLq/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+PJLbrxb8Mnsh35fCCRUAZoERxo5hSwy9Nf5x879Yk=;
 b=LRblCR2sqCfk1DYWdgVPt2S09uNQvVMQuQZtWtxBMfCLr61P0KSjUreiby0pYKGtDgs/ayISDJAOIAbVGzMjFAkp1JCH3CfPcE7EdFkTgRkkc71iCMt5jooZkmO8jOOJZSg+w7fbXWczvkRZQxeIev3AVHpMyVz9bPYm3NeI08I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <ae501ac4-ce18-4c0d-a607-6ff8e4178ca4@amd.com>
Date: Thu, 11 Dec 2025 12:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] Arm: actually put library code in a library
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
References: <f46f89f6-242b-4433-958e-36088e567ccd@suse.com>
 <fc35728f-0fcd-4e29-bbc5-9410323a7a64@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fc35728f-0fcd-4e29-bbc5-9410323a7a64@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SN7PR12MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: ed56e9ec-e5e5-4d48-66a4-08de38a70fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2xZbVYwUTlHZktlRkVRN0dielZsYzZhc0NQdnZjQnNsbnNOVmNSdEtlQmMy?=
 =?utf-8?B?MHNzdExRQVYwbnlXREloSVh5dERaVlBqRWlTVXZFbVZJeE9XT1VOa1I0MnNB?=
 =?utf-8?B?N3ZlSy80RjJjZ3A2U3lFMENsUXZUUTRhMVl3N3dzZCt1SWhVc09IbFd4cFlh?=
 =?utf-8?B?MWFhWktqRnlUQ3IvanB0TThRbmlkaGxyU2hFQUl6STRvem9SRjlnbWNMQTB0?=
 =?utf-8?B?UXJOM1YrdGFmKzVUbllQVHhtcEdHUS95eFdPd3A3MGRrS2laenVROGVpT2l4?=
 =?utf-8?B?bndjdmNJREN1OVBCU1l1aEl1Q3p3dHZjNGdZaUhUOWlGVDdLYkJrWlA4N0tE?=
 =?utf-8?B?NVVYWkxGY2dEVVV6MWNBUGduWGZBT3BkOXpmSHZOV1gxUGR2eGNLZnJHaU53?=
 =?utf-8?B?dUdmc24reG5HZHg1VjIvRlVTcjcxYUVhQVJDc0k5UWMrV0JhUmpUcFIwcENZ?=
 =?utf-8?B?ZmxvYlVIb2NxZCtxMEt6WFp1ODE4T1QxWWhyZlByVXF6QWZpdk9jTnV4YTZs?=
 =?utf-8?B?eGFaV3hURUEzVjV6ZUJlR3ZUcVR1YmJvRUFpanc0c3pRc1duTWIvN29QWk1p?=
 =?utf-8?B?T0xtR0NqRlpYdisvUXkxVldDZncyMGd0TUtnRVV1bllrUGtHRFFLQllMQmox?=
 =?utf-8?B?ZldEdUE0bjZucmJ3MmlyVHdBT3dKMWR6emN0a2N5TzVIWkV4OVFaZXBpZjJ3?=
 =?utf-8?B?Z3QvMU5CRTJpbkI5Y1VyYTQrTGxVSThtVmpHQjd3bHBXbFJ1OWpDYVMveW5o?=
 =?utf-8?B?ZWVTV056clhiNGFXWXowdVNwSEs1eStlVW56azFWWlRYL0tlcWJVUFc3eUJr?=
 =?utf-8?B?YTRwaGpncjBKazJVZldzYWtQS1dMZ2c2MHlKdUlPS3VVS2l4aUR5bEhPZDIy?=
 =?utf-8?B?RldpVHdtS2NwTjZwbGZyUXVjeWMyWGd6NnRnMURpd1VrS1BMRFFER0VkNHdQ?=
 =?utf-8?B?UXBObGVONXVlTEtFZEVrRzVWMW5WOFdrQmNscURLNEUvT3YzbW9UU05ESU1D?=
 =?utf-8?B?YkZQajFabys1R01KaG85VVJqQStDV0FiZVd2ZXJaWWkxS00yVzVvZkJEOGlm?=
 =?utf-8?B?UXdMWDhUazYwQnZ1aStzT3U0UlBpd1lpQk5KQ2JBL2FOdTBrN21FNE9LMksw?=
 =?utf-8?B?dmlVWWtERVRoT1JJNDVlWXBDMUxtTE5hdmZyUlRlYWtDakYzUW5DdEpYYnJw?=
 =?utf-8?B?MXZkWE1nQ2xKVG1iNW1pZXNRVUtsR1hrUVMySytyVWlxSHdSOVVZd0laZndU?=
 =?utf-8?B?NS9pOE9kM3VZQkFWUVBzRzFEbzR0Yk5ZY1hxNGV6cFEzSXZNK0NmbHU5b3JR?=
 =?utf-8?B?dG1NcjN0TUhra0d6Vi9BVTU2cVd1UVJiS09SdzNrby96aFJydjAzRjdEZnlZ?=
 =?utf-8?B?ckcrUVlyRGdGNEwraWVCdThiY3VtbmtIY2VidzJvbFRGbzYveWNKWGtzaXIr?=
 =?utf-8?B?b2YvWjBlQmptTk9RdVRWUVhLK3J4bmZScmQ4NHl5ZG5NOWpaRFFSSFRZcUxO?=
 =?utf-8?B?SVEyYzk3ZUpWb3NFRlJTTVNhSUtzZlcrekk2dnJsTkNPS2N6OGpRMk96bnd5?=
 =?utf-8?B?aGZ1Z2NWY0IyRGlycEJnRTB6bWcxVDhRb2wzN2tLYnM1N0VWUDNHbmZ4Y29U?=
 =?utf-8?B?bXJ3R1I1SzQ2MkdFN25Pc29wd3lOT2dPS1RhOVlUWWtjekRUZ2FsVVFJM3k3?=
 =?utf-8?B?VllDaDBsNDhrU3g1Ym9ZeVBzM2duNmJqR1pOREF0UmdVR3NnQmlhQ3U0bDc2?=
 =?utf-8?B?RlZhS2RFblJVTlZkVzZYYXVVeGpwaWVnVHFGcmFldE45M1kvK0Z2Nms3Y1JK?=
 =?utf-8?B?VDZkbnNna1c3S21ZblZFejRYMU1FUUhmUDBYamtpRkFLamhRUENqMVZhenZB?=
 =?utf-8?B?Q0RZeEgrUEc3Sm5EV084WjRubytHRkt1dTVyNEhIMU1yRjduazZWVFBWRkxJ?=
 =?utf-8?B?VWJFM3pEd0xyNERuQmR4cEFGc1dlVkNnM0hxbktCZjRTa1JhMmhCckxkUmxh?=
 =?utf-8?B?YW1WeTBScG5LM2hlSjJxRzdSOEtJZms4U0lwRSttMnBCZFNnak5VL1BFLzVI?=
 =?utf-8?B?RkswMU5SMGI1T3JIY0RkTmRRT0IzdFE1WFBMaTN2QkJNTTI5anAyLzkzdkZu?=
 =?utf-8?Q?8QwA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:18:50.9462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed56e9ec-e5e5-4d48-66a4-08de38a70fd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6861



On 08/12/2025 13:06, Jan Beulich wrote:
> Now that the build system supports it, build the $(ARCH)/lib/ directories
> actually into libraries, thus permitting unreferenced objects to be
> omitted.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


