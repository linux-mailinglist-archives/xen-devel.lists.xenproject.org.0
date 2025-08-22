Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E648FB310D3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 09:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089654.1447160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMZY-0003Rs-HE; Fri, 22 Aug 2025 07:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089654.1447160; Fri, 22 Aug 2025 07:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upMZY-0003Pk-D2; Fri, 22 Aug 2025 07:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1089654;
 Fri, 22 Aug 2025 07:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd3U=3C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1upMZX-0003Pc-By
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 07:52:27 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2416::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f02c0677-7f2c-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 09:52:25 +0200 (CEST)
Received: from CH2PR07CA0054.namprd07.prod.outlook.com (2603:10b6:610:5b::28)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 07:52:17 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::2f) by CH2PR07CA0054.outlook.office365.com
 (2603:10b6:610:5b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Fri,
 22 Aug 2025 07:52:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 07:52:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 02:52:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 22 Aug
 2025 00:52:44 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 02:52:15 -0500
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
X-Inumbo-ID: f02c0677-7f2c-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9xJ5aQEoey/QxBSPiGcK2NxKUDI5o+WGbDATl9SPRT7dpP7znTVohlvHNNxN+nR7eKeYtBIFK4CpI/JcHjaGZplkrklKA23tYO+lJtblrYXjU/Qint9lI2SJ6kl5gqQBDoytzFa46wgLDIWEwaQvps3YxxnirGLXW4ZeM+X+7CkJO2GtcDFXTdbC3NqKb0dI8Mwer5Bz00X+lMYgp1idbK78ok8wTE0SZpnQ2s/Hwse5kXoLUcDSX2MkLELMQdszyCVvw1w3+TRzrt9gcH65JDkkqFi5hG/qP6fnTPy4BJQlX0nfB12RfV+FuIMJdgTOKLlqBip7Btkcj6MxLS4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dyz+2dJLLEK7VT/rka9F6BTDMzAyogpVUj2I7btkww=;
 b=sRKdK/lu+ZCMsjWnIecY2G4umTCj9tbp5mXYnjrWPRjiRN+c0RTWb7D1TSWzqN8veoNfYii1H/QAZ25s4gsCW643G7fLyByUbqjnF1oP+5/tNNq7vcc/3pJ2lW6dYHYUhAGVyhl3bOHiuX2ninxpNydHjirmMNcnT+KFf6aGpIm4bNqo1ms94dkGk4kMXNw7BFP1Rqa28imn/MSHTit//op9Y9KOt0SHtRKVyPPJrvCqXBFSEx044pw4hKhRe55QO2iUk9sNpa+c579b8QnjhJDNolpvCFQ8GDnF0NrJWCeTA0ka2OCe6Umfbx7y6Y2y9l9g0Zy7MBcTbgAPKPyZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dyz+2dJLLEK7VT/rka9F6BTDMzAyogpVUj2I7btkww=;
 b=SRWEbqBwH5YPszTBzq+Gg4XzwRXwVtNUgBf60aTvr367VJKZn2ym+lYqaAXsVT54kkj78hZmYnoBhp2176x+bY4tp9z/1m0feDqxvn5xbjvk/gNpOdsJGrpMDXDvkUzB6qxSbJDBRpuuIBS50ppXS5l89+BGwaSOAInOPIp3DX8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fecda1a7-5a10-41fe-9722-b83b3c66f61e@amd.com>
Date: Fri, 22 Aug 2025 09:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/dom0less: Clear xenstore page
To: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250820211242.116868-1-jason.andryuk@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250820211242.116868-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|PH7PR12MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: dd882d76-f773-44be-d88c-08dde150d0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlUwL1FSVHU4QkNrNEtrU1Y1TFRoUU9hc3Q1cExtQ2JJZGVlS3RTc3I2aWFH?=
 =?utf-8?B?L1FvbnF2RzBRc01sRGtIR0o3U3B3QnBOa0kvSkYzQzdlWkFhdWFyRmM3bnFT?=
 =?utf-8?B?eTJxbUlGMHgvQ1RjK2YrVHloVVk4ZDdqTE5MZXBSclkwdndCbnZEbHlXejMy?=
 =?utf-8?B?Mit4TnI5NjZObHVTbUc2d3crNDh4RStZQTdxU0dMU0p2b0x6NzZ4RmkyanFU?=
 =?utf-8?B?WE9zVXlQQVJDS3lKUkJrSjBuZU5RSjZIaU5LS2I3OC90Z3BlRHBVaXB5ZXNz?=
 =?utf-8?B?aGZyQlFIUEFjdFEvaStSTEVZTFVQMG0raWZEaHR2UVJ4cHRHdG5ESFZKam5j?=
 =?utf-8?B?R0hQQVFCZHpIcWlMV0h5V0V4RGpySkNIWHh0UUh3ZklvMmpZbXJSL0JTUnlD?=
 =?utf-8?B?NFdYWU5IenJPNFhNQWllY1U2Y1hYZ2JnL2t4Zy8wcGhtZ29ZMWZPYitpV0lE?=
 =?utf-8?B?bnVCZ0l6WlBobzMyZFY1em9QeUVyZEhITGlBVVpRQmlWbDZkNmg3NUgwTEIy?=
 =?utf-8?B?V1kxMDM1TUtFTkszOUxDeDZtT1pZYlNMdmdWSlJPa2MwZStJT3czQy9RdmMx?=
 =?utf-8?B?bXFySWxJUEpLakZMMlVGRkQ0R0wwVnJ5NG93bmFXdGZzeGloV2t4a2U1V1NO?=
 =?utf-8?B?NUoxakEvS21ZamlSdS9YbExFVkh5bkVpM0d0R0JGcWNSVGJMNFlXbTV1UUw2?=
 =?utf-8?B?RWlBbG1aYnNGUkFkVkpGRmJ4YlhEa2QxbmpnQ0lRSWNTbW9wZ0kvZ2ZWODg1?=
 =?utf-8?B?ZFIyQUJlclE2eFZJMkxaZkMybi9aZUJWSTFUQVJtTzdMYmpXbzNoVEplbGZh?=
 =?utf-8?B?RC95N1ZTZjJadUUzemRwQnVGV1pVWnNVYjRKQ09MdzNEdmo2L1dNdjJZKy9w?=
 =?utf-8?B?VkR2dmpBbDg1ZHQ5ekFJaVd5Uy9hQ2RKZXpEZWRFT1F6R1JuNXErV2RhSkhO?=
 =?utf-8?B?UEpLZTZhcUI5NDM2Sk1ZNlA5VlY3Q0NmM1N5bXIzVzZZOVZDQVVvZ3VOT3h3?=
 =?utf-8?B?eTZNQ3dLd2RKelBJNGprc2JKa3hZSk1OWEcvUzcvbWFPanEzZE1DVzRIQkt3?=
 =?utf-8?B?bzJERmVycXFNbTExL0Vqd3I5M3g5NE1YU042SC9UWVBxUHhvN1JvcXV0M3kv?=
 =?utf-8?B?Q1MxQmNBUVpoSHF2WXhzKzgyajlIdEtpbkNQbEdyTVVaa1F4RWx6bzUvSmI5?=
 =?utf-8?B?QXVrOUl2bXVWUnFxNnJoZ1AwNjdHWHlLQk54OWpaVVRNbjlYeEwzc012WUdq?=
 =?utf-8?B?Z0JlNlQ4V2NGSnlRSmhqYk5LNURWTlpOa2NhK3ZIY1A1V25tSUVXT1BRVG1O?=
 =?utf-8?B?blVyemt4OEVqdEdVY3ZpaElkTG9FTnNqWWR6M1NsK3VjQU9GZlFaZVhPQmx6?=
 =?utf-8?B?YU5PS1ExQ2o4R0gyREgzOG85djN0ZlNWaVlIR1pxc3EzMHl0M2F1M3BCMW5k?=
 =?utf-8?B?dUVScUh5TTlIQVd3bzFLMzZtRzFpcmloUDBpY0E3b0hxOUpGRkJpZWR3N2Mz?=
 =?utf-8?B?N0lOVkYxeThxOXNrNU5adFVTOXdCRkRPeExsa0I3c1BwRHc4SThPOGE4Y3R2?=
 =?utf-8?B?a3JyamdQYjRwbGJxN2FXMkY2Vit6bnRjKzZxZFZQVUVhOHdhdnJ4U0hDWm5G?=
 =?utf-8?B?cHIybm0vazhOMEhEbGRIUHByRmt0SDNkZHJLWEJlQVdOQnFkYUxtUWRjT1lL?=
 =?utf-8?B?QXIzV2lHbU9raTAyNFhZQzJpZWw4Uk16Z1dxZGZFOEhDSE1SdkdIVGpQeVk4?=
 =?utf-8?B?bGRnRzcxbzNWS0k1UmpnbGduc2p0SE5zV3Myekw2dmpqaUc4WUFLUjR4Rzcy?=
 =?utf-8?B?TUs4L2xpZElKSlBpdEJXSndQN2JQM0RRMnVCSkowdXRRblltdm5NYk40ZmJX?=
 =?utf-8?B?T2tVZWRzTEVXaGwrcFdVN1NtZU5Ob292OFJFUUJRbjdGSWMwZm5kbUMyM2ZV?=
 =?utf-8?B?RTlKclNpcXJkRU8yMUpLeEpJR05pUjVPbXMyNlBOb3VnZCtTZG96OHdKaDhB?=
 =?utf-8?B?cEdFQlAvcWlIcm15L2FPa2xvS2sxT0Yrc29ZTlRickVIRndnYnI0VGo1V0lN?=
 =?utf-8?Q?p7bQrP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:52:17.2965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd882d76-f773-44be-d88c-08dde150d0d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902



On 20/08/2025 23:12, Jason Andryuk wrote:
> C Xenstored was seen failing to map a domU's event channel.  Enhancing
> Xen's error messages shows:
> common/event_channel.c:427:d0v0 EVTCHNOP failure: d1, port 3267543746 error -22
> 
> Port 3267543746 is 0xc2c2c2c2 - SCRUB_PATTERN.
> 
> Xenstore expects a non-zero evtchn_port to be valid.  Explicitly zero
> the page to avoid this.
> 
> Fixes: f78895ad78c9 ("tools/xenstored: Read event channel from xenstored page")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


