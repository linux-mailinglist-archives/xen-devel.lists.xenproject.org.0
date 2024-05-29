Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E68D2F05
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731585.1137161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEEV-0000pz-P0; Wed, 29 May 2024 08:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731585.1137161; Wed, 29 May 2024 08:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEEV-0000o6-MC; Wed, 29 May 2024 08:00:27 +0000
Received: by outflank-mailman (input) for mailman id 731585;
 Wed, 29 May 2024 08:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcHb=NA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sCEEU-0000ns-LI
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:00:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2412::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8107c3da-1d91-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:00:24 +0200 (CEST)
Received: from CH2PR18CA0002.namprd18.prod.outlook.com (2603:10b6:610:4f::12)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 08:00:19 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::85) by CH2PR18CA0002.outlook.office365.com
 (2603:10b6:610:4f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.18 via Frontend
 Transport; Wed, 29 May 2024 08:00:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Wed, 29 May 2024 08:00:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 03:00:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 03:00:18 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 29 May 2024 03:00:17 -0500
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
X-Inumbo-ID: 8107c3da-1d91-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ1FOhUSjYYB+jAaEvIMl9aMEkpCJmi42xe3IjFbv8nEzPM4pR/XbNioHZ6SozKJGrSEtYx18A27WgxPyfWolc8rggxS42IcqdAS+/AuCHrNmb4oYqY3D73vg57yYB0xlh/rNLmm17TRiUQxB5R4FDvgXKPIH6F1eVVTp210HZrwGM1Ktbv2S8E4BlofvMbfnzRuPyz/QgR6HyWiBH7tcA/2kM63vyR3P8M0xap0AdHvfwECD01tLCg9zr2XSSn3Wx9T5yVAmwNYMD05o8PkzKp0PeGrTGYupHeSYoa3SKwfwcZWUv71hwOECxui1rJVldB0jFaEtdAx1KyWwGp9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1XdPZSgXGOjtOcpE/ko0av/GDtvu6CmLAGd0/E+Sps=;
 b=MvEh3xRwzvWVW64qkeuM5jVyCfRpP93DrSdId9lmALcghfDt3nRyJJOXPnU1afCCpMu8HQn6jRf5QPdcT+l9oCbpfhUWGYVOv25TkjzxRSbUXP0XNHYEfj2r0bFgQcvP+GRcLjoycdnLM8AMrLt2hsq7ZGA+Yob7+Mry/jm67VdHvB+0x0bYkOq54kgVZF4l3+0qrvR8j8vhBIIWAWktw3xcEX/NfZuhjhf7j8Ha2t06G+W9vuQFuRf4yq0nuuZ9q6dM75T5p+gjj0YmgQJ2dDcH82sHGVAuyKGoT3UJSTIOiZ+Sy/fj/YUiMB3sz3p+pxPTk0Y8WG0KFz7Hw/C1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1XdPZSgXGOjtOcpE/ko0av/GDtvu6CmLAGd0/E+Sps=;
 b=Dux55XB0BsEZHZQHT1ZgP0dR2Bdxctu6ebcie9+2A9vtjM8sLzQBN6ezSJyvw+kEQvYz7RtblXPD8YNHMG0CDx0f5C7Faeq9/Nh5/GASfGnT0NwReV5ukzwjUfY3toPR2O6SWKvUvccW0P6SGbStNp8BdClbwIspQLR9s1yhD1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ee3b5c27-c481-4f80-aaf3-9f91ed1c41e6@amd.com>
Date: Wed, 29 May 2024 10:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] docs/features/dom0less: Update the late XenStore
 init protocol
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
 <20240524225522.2878481-4-stefano.stabellini@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240524225522.2878481-4-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 584fd66b-28d7-4c83-5daa-08dc7fb56232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjU3Z2wyT29lbGR5YVZQNDl4di9PelNUcVJEOE1MY3VsVWV2U1dVWW15a0Vv?=
 =?utf-8?B?ZHR3YVZvZ1hwc0dLYW1xU0FZa2c1R01ZN3JnR01qbjlPQlQvTjJCRGxrMnVx?=
 =?utf-8?B?bzRoYVI3aVBzMmhzRFhaNzZsdExkU0VWT0J6azlKK3RNQjZsRGNnNEROaW5w?=
 =?utf-8?B?WDVNSWFRSWhBaDZKYUpMU1FOcUFkV1VwY0lBQTV0WGFjZVQzRjdSK0tCOHZ0?=
 =?utf-8?B?Q1A3d1J2NHlvcVBHRi8wWkllbElZS3JOelduZjVqdjUvVi9UcFd2aG0vTmdI?=
 =?utf-8?B?RXRXcVJPUkp6Z2tlUER3RGdHbzI3TU9EZGp0Y0NQVHFPSXNQUi9ock9EUzJr?=
 =?utf-8?B?N0lVbUkyQmpiZXVtOEJ5Z0tsalBPTEc1ZnBXNVp1Y1Z3UXpxK0lQanpxZ2Rq?=
 =?utf-8?B?RCtnWmwvcEdFZk95Qld3TnE1ZXJHTFlUNWtLT01lL2lCNzA0dkFybVFxMzhk?=
 =?utf-8?B?eHMySU5kV0lhWjZWcjFwczJBbHI4dFdYa3hmeEQvZmY0UEpISm5aRjFLM1l5?=
 =?utf-8?B?V1NzSVhLVWlaNnFxdS9XRmpvZlNNeEtjOEhNUTA1T1FBQzB5amx5QXo4RWdU?=
 =?utf-8?B?V1FyVG5NNXVsbFdIUmVUbVhqYXJuNk5lL0dsWnd6M2RVWk9UUkF4MU5NT0hT?=
 =?utf-8?B?NFhVRTFaSEN0U0kyaktPanZZWmQ5ay8vQWRFanI1SEtLZ2IyWU0wbzArQjlO?=
 =?utf-8?B?aTc3c2hQM1czQUZCWkRyKzlZcmNTUXdtR2p0VmkxS3hJOHd3azQ5Vzd2ZHh1?=
 =?utf-8?B?UlJzNE5XWHJVTUgvblgvT0NmYm1jbHNqek1nM0Z2VmJFRnR1VkdYTTUxdk9k?=
 =?utf-8?B?NDNVR3dTbW1Gb0FYR2xPR0tQajFpV0dxWWN0eThTcFlxQzREdzRRMDJnSFRY?=
 =?utf-8?B?UjRYT0NPNHpsUUUzMXNrdWJmOWNRWjgzY21PNzl1dHdJMHZ5K3VhVFl2enVN?=
 =?utf-8?B?MFVqZURZY2lzNDNKellGSHVJZlQwZ2xoTSsvTHErWUErK0c5Q2hpNm5Od2dr?=
 =?utf-8?B?bVpWTGtveTZUc2JvSEZzUlZjSmlnYVJrd0ROR3RLT3BqcGEvTFdTQUpyWXY2?=
 =?utf-8?B?STN0bHkxY0hSS0dxMjZ0SklGV0htQVVnR25FWWlSd0hONXFyRG5aWkJpNXlk?=
 =?utf-8?B?V1FyS3ZuVlBKUHJJZEV4d0FyTjllc3hLS2FHRGFrTWw2NVZvc3ZTUENjZnNs?=
 =?utf-8?B?UkJtZ3dhbVJWbVl2S2o2OWJrVHcxMUN3a1VPTUR3ZW9SMytJK294bXNvSWpC?=
 =?utf-8?B?WjMxTmVHSFc1cVlLWDU0dmdkK2FCTVF4RDROb0tPL1YxbG5YSVBkVjl0UWQw?=
 =?utf-8?B?R29Hb09CUTNjdnpNVlN2dCtlNzczakJ6ZVNuOVpYZVl6ZlpsT0N4OWs0WlR6?=
 =?utf-8?B?NlR4UDBTV25MUXdrcm02amlMakNPZ1E2Smg3MnNQeEZ1YlNaNDZjODdESE90?=
 =?utf-8?B?Ylc1bzhCSkNBY1FFU1RoVEp5UWtFcGxYUHhIMHVLdjIxNFQ5dFpkcThPc1BF?=
 =?utf-8?B?T1JIQXZFaGhLZ21HdHJMekxRc1RUVXNGK2k0bk96TCs0dGd3OEk3ditvdHd6?=
 =?utf-8?B?cncrRUtxamRIMFVqZDJtY1BzS2FVMzlOdHhwdjJwYjYrYzRpY05MQTA1enlm?=
 =?utf-8?B?WUlkRXhrWXhGQ2ZrY1lVZHpKenMvbWNLd01uLzUwbVljS0NKd09aZE5CSE90?=
 =?utf-8?B?L0dXdmpDZlVERml6ZnphZzlSV01XdStRWGNiY1ZSUDJhOUU2NUFBVG9XQzc3?=
 =?utf-8?B?RU5JUXpEMlNmL0FRMVkxakQ1UXdqZm1lK3EzeERSNUhkdGE1dmVYQUZic1JT?=
 =?utf-8?B?K3RCdjQxc1RzS3dreDNqcGxjNlJ4SjFBUUtEUm9kdEUwOFhnckp3UDdZVFNr?=
 =?utf-8?Q?s4YFFl2yHbxW3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 08:00:19.2418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 584fd66b-28d7-4c83-5daa-08dc7fb56232
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190


On 25/05/2024 00:55, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> With the new allocation strategy of Dom0less DomUs XenStore page,
> update the doc of the late XenStore init protocol accordingly.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


