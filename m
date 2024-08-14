Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F9951B4B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 15:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777154.1187343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDbk-0001jO-NA; Wed, 14 Aug 2024 13:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777154.1187343; Wed, 14 Aug 2024 13:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDbk-0001hI-KJ; Wed, 14 Aug 2024 13:00:08 +0000
Received: by outflank-mailman (input) for mailman id 777154;
 Wed, 14 Aug 2024 13:00:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSq6=PN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1seDbi-0001c0-Oi
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 13:00:06 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ff8b59b-5a3d-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 15:00:05 +0200 (CEST)
Received: from BN9PR03CA0082.namprd03.prod.outlook.com (2603:10b6:408:fc::27)
 by IA1PR12MB6188.namprd12.prod.outlook.com (2603:10b6:208:3e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 13:00:01 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::23) by BN9PR03CA0082.outlook.office365.com
 (2603:10b6:408:fc::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 13:00:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 13:00:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 08:00:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 08:00:00 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 07:59:59 -0500
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
X-Inumbo-ID: 1ff8b59b-5a3d-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtU5wuigAjecn2L6EkzsXmba5EprJawz4PmfZ3XrdqWP//aMPwJlQa61IfI/PkEIXIO25jS+GgOGTUUvrhpwhHHeq+Tsk9xrp/qZ9mYT5zqcqF4azeiC5p/tFNmLDpcKHYvltupVETRsU8XIbkcNtukCr/PsS3edEkem4te4tVjotfzWwttXXLxOSrntI5IA9shmKGahprCBSej3sHgLjUumK3w1TvLHbewo5PflQrrLk6Hk5kO6rbIyP+//BV4zVTM0ZNF/OsVBTL6lskWUpyVXgYv831XBhaR84Wd//lE81cJTpi/0+1sH7g84Q6sGcizs/qQ1Oma/QtCu/yNosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhNIUO9vBkPVQxb8J5KNnZujQc1BlrgUWDnwnkizL1A=;
 b=zEPg6OhtLgXjCmQqYd58OFaMRDbnvoGjfPyC8rsVRLayAijLsPdh3LsWQN12kP4z5XVktXGERtvqPKrjv609APH2gy2f1mjSyTKW82rS/qJHmaqhbcDj5LxECSz6g6f5m1sAECVTa78OfFxhC8nqBXgNhq3ew8+Q69Ut78uebjZ0fS/MtgLgfIjlY+YQoLtlvldBFbP1u22drNRmg4YT1Bp3ZYWx5F/u4I7mEdTpz3uFL2gxAtoa0NWs+OiH2M0Cn0/COeptdABJINitAld292mF4t0nthMQrqbHyW7GzS8KpQRlzhZHhUaOKD5xL+uR5KXeRwqh16c4HtzPj9pOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhNIUO9vBkPVQxb8J5KNnZujQc1BlrgUWDnwnkizL1A=;
 b=ues1gmSHszSdlJp2LD3jhv89jBDV9O7FaDmrV5KE1QnQTlKuynMEeKsrj2NQZAzoM1wXgGQ7iulHfnk0rDgtyCsvWo14u8cx7OXLQWpVHNlqBnNTqklwdBF5KiJ4mmjS11NVSO6ZZHBb2Llnd26inRf+9LAhDB9/tkLQdVIVYj4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dd7948b5-070a-4c9f-8e10-b51f1490ca09@amd.com>
Date: Wed, 14 Aug 2024 14:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen: arm: Move the functions of domain_page to MMU
 specific
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <Volodymyr_Babchuk@epam.com>, <julien@xen.org>,
	<jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-4-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240813171356.46760-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|IA1PR12MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0b4845-5fda-43f2-31ad-08dcbc61025b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm1ackVDNTd1TURmWHFJcVl2R1lKMGIrdmo1VUlEZmNsN0RxNXZRaEVlbHE4?=
 =?utf-8?B?blhEQU16cjJvRitxUlIxc3lpVEY3OFZ2dmdibUh0ZkdQTGhZT1JoNUp6Tnox?=
 =?utf-8?B?UmZ4Y0h5Z3dFRmxnbnh2bGFCam85WmhlejR1bDBaOC9ZZlF4SlpkR3draDg4?=
 =?utf-8?B?a0FhanJFRTI2THZ5M291RlpmQkx3NHRKb2dMODA0VWtnOUdrMldYY2Z3c0Ez?=
 =?utf-8?B?ZHpEcGQvMkl6aExYL296SW1RQlJLd241d1U1SlFmUkdUek5jcmQ2cmZwc0ht?=
 =?utf-8?B?aVdoREV2K1hxTFI5NUlTVUUvV3phOFNmRWtGMXdHdzZkem5xYzBTWFJ3UjhL?=
 =?utf-8?B?ZVNxK2NTdkMyWTkzVTV1bERadjRlYnRmQzB3MHBZeUlyMWVvVHRSaEI4Y1Y0?=
 =?utf-8?B?aGpRQ3RhR2xKbmY0M1NhNDUvUlVNNlhpSTlvZTRQYmpKb21NUFVsTXZCbE5N?=
 =?utf-8?B?R2ttMzJDZnVLNDA0bTg5RFVtNW9naTcyUmEwSHBtNFYzVUNSV2J3Nk1XVlBT?=
 =?utf-8?B?WVgxNEJoSm54cTFqeHFnZjBRMTVQNWVQWFBTR0htc0pyY2FMRlZMN0p1TVA5?=
 =?utf-8?B?eENxS2FYL3NlaUNzYnNPRk90ajJCell1WGsrVEYyWEl3bDdGeitEdEpLWVBT?=
 =?utf-8?B?aDVYbklZeTYrM0RaOU9DYVJqL21LcGdhSktXZFRybXVWeWQ3cEVaY2xCcGJK?=
 =?utf-8?B?Z2RkazN1Sm9RdC9iQVRmelF0bXV4aWhhck1Db1BVRTVoQ1VrNUpWZmZwaVdm?=
 =?utf-8?B?UnBINk1BdXBqYkFpUXo2ekZxMHRNdkwwNzNGOStWS0VtRWlDYVMvNThMTjd6?=
 =?utf-8?B?bnNVNkRTcUtxSkt1ekk1VERUcFlCVXphclVISWNUQmd0emFhK05vVGIwUTVu?=
 =?utf-8?B?dlBZVHpuOXNUOEYxU21jR3gwazJndHpUeVlkaHNhKysvMWJBZ29KTjhTdmVY?=
 =?utf-8?B?c3J4Y1ZRYnRpakNFaVE5MzNZcEltYUpKUTdBc2tBS3FqcHFJNHZxQko0S3ZN?=
 =?utf-8?B?MFZsZ0xwTWhkbUhiUXlZNHA5RnlqOXFkNVN3d0xYT2FxZWJHejg2K1VTVUZu?=
 =?utf-8?B?LzllWjlOOHpneVVJR3BWZ2ZGdjJoNnR1NlNOeXA4Vml6dUZRaVJRSUNFQTJi?=
 =?utf-8?B?d1FXa3VQYmJSVWovM0dTVCtyWW95cUllR243YW9qNGhIbURGUFpmeTF5ZTIw?=
 =?utf-8?B?V1dwN1AxQWVjZmtPVDAvbGpGUk9ySWluZTNHZjJWeDRwOTVBam42TEh4SjF2?=
 =?utf-8?B?NWpMalphekJPbE5qS096RTgvT1pka2w1ZDVHL2dlUUUxUmVUWE5yVnNvZjIy?=
 =?utf-8?B?YVkyWGZZTlFvYWQyeG1NT0o4TVBTdTR5bDVtczhRcjJDZW1aOWwyaUhFZitm?=
 =?utf-8?B?Rm11Zk03RzZWak1XUUdEQ2VTWUNsTUY4VU9wdlZxM2VXZHQrekFYR2VNbmZD?=
 =?utf-8?B?ckxKTk45WUROdnZkK2pvejExMnZJSkZ3aEpqc0hmNjBXWmY2YkVCbVE4REpG?=
 =?utf-8?B?bkhFc3VFOGFjNFY4MWwxUmVCaXZHN1Jnam04bUV1QnpUZWt2RHNSNzIxVDM0?=
 =?utf-8?B?VjkvSHZxZ2FCNjI3UGxkUTFqV3ZncmU4MFIxaGhrUkQ2WnNYWlBaNlZENFZw?=
 =?utf-8?B?U2hMMkF4eGNldlF0ckxKV0FTWmhnN0t3KzlhbmVpalBlb3BDUitwZW9GR0pC?=
 =?utf-8?B?RGFDMjJ5RS84TnNPNmk3QXk2RndtQ2d4YUZDZXNGWUxYdE90U0VQM0J4RWZq?=
 =?utf-8?B?UUVjRHE5cGJQdytseVdIMDFrRjBEd21CZk9WZ0ZvSngyK2ZUQUpnK0dBazI0?=
 =?utf-8?B?WVdqNVJZSkkzMTEvRXNUamJ0cnE2cG5YQWhBMmlwQi9BcXMwMGQxOGJCbXVM?=
 =?utf-8?B?VHppQ1RWS0lMM0ZqaXlWRXFTSmV1T0h6czBUUGg0YVdLRWgwT25aOTJZYXNy?=
 =?utf-8?Q?V47j+hOpzgVVO2m3rym4ZfvUHOT7wh9O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 13:00:01.6523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0b4845-5fda-43f2-31ad-08dcbc61025b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6188

Hi Ayan,

On 13/08/2024 19:13, Ayan Kumar Halder wrote:
> Moved init_domheap_mappings(), map_domain_page_global(),
> unmap_domain_page_global(), map_domain_page(), unmap_domain_page(),
> domain_page_map_to_mfn() to MMU specific folder.
Both the commit title and msg seem incorrect (you took them from v1, instead of v2).

With that changed (i.e. title and msg taken from v2):
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

