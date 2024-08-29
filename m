Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FE963C04
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 08:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785490.1194941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZ2M-0007ia-F2; Thu, 29 Aug 2024 06:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785490.1194941; Thu, 29 Aug 2024 06:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjZ2M-0007g1-Br; Thu, 29 Aug 2024 06:53:42 +0000
Received: by outflank-mailman (input) for mailman id 785490;
 Thu, 29 Aug 2024 06:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/9N=P4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sjZ2L-0007fv-8w
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 06:53:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2417::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b75228d-65d3-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 08:53:40 +0200 (CEST)
Received: from SN6PR16CA0063.namprd16.prod.outlook.com (2603:10b6:805:ca::40)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Thu, 29 Aug
 2024 06:53:36 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:805:ca:cafe::f7) by SN6PR16CA0063.outlook.office365.com
 (2603:10b6:805:ca::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 06:53:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:53:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:53:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:53:34 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 29 Aug 2024 01:53:32 -0500
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
X-Inumbo-ID: 6b75228d-65d3-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fByj/DAnc8QRs3tEDZJmangC+DzdD6+n9MuHibhoNPGTrmohWZtZXXK/5MQa7Vafbm6ERMEWq+b0KfBqJgkm7L/4zTiJrVYn6yrhESb2m4L8xPpDBd+tj35oE+LMW9t6qunf+qZA5BsOfZ2vhY8KnSJXgCYrIoKRdl9BKB0dD0C/qPTwjK3jU/CmcpU0urDnGCo1F7UueeaHO3scB2YIg9YCBTndgk9+60JOr/GDIeZtTBycyK6h75afimLWbnt8AIslRv2hlopRZn5e/5pkNRjie0xbA9LDx1txva+3cbgWPpoVG/BiTN9+DXNOzb2NttXe820RmAjZs0woeS4dMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFs28kpno5mKFR628jWVGAfUyjLnvihFrGHeClS/aE8=;
 b=zDlfEMPZESqD2ovP1+rkBpBnkVyAEliEDoRi5rESIAIfcz/hxTudRj0d1vdj2mq2f4eE4S4EW4JLKQVsIe3E4xd7oeRGLt9xrH0ntWr+psZoeaZmYMUm9AHAQBzSY6Nq4LmAh9nezk5JJm9cQ85JxOyYJXw4jOcuGrhpMJoryh3OTS+KqBsrCczXwIQz8nWuNGVqO4EMD1T2JjyI3yJnnC51b4ctsFGkM/l133AQMdctQjs5l/JajIMlQwqMRHwaXRWWsavBTiwweBipxGfc9D2kbR5p5z4uAYany5On+pctksX3lE3M8Q8vhbP25wxAmSzjG5v2ytOavXAmEy9LTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFs28kpno5mKFR628jWVGAfUyjLnvihFrGHeClS/aE8=;
 b=vcFfiXiUx5boW5P5xDx14aaeAHdqDrtD6KRGQd/osyQrw55IsQDLbiwboZu67sVIBWrymSun7SEx7bt2Zv4WSqOVmd3JI54YmfcUTTb+/XNEC2wXUes4LtQKPmpRuit5zoMfMgpKPiDzxu6OpTvUIS6s3dkvDcI7PMXJABiCNd4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2756d5b3-e4b1-420e-8402-2697c559acb9@amd.com>
Date: Thu, 29 Aug 2024 08:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: fix false success in qemu tests
To: <victorm.lira@amd.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <e4de45759723b28713ef205335c4d79b9e7074b7.1724904269.git.victorm.lira@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <e4de45759723b28713ef205335c4d79b9e7074b7.1724904269.git.victorm.lira@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f67441-7b80-485a-1ddf-08dcc7f74dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUw5aUhQZHpjVGhMcDNvMGlJNGNReWt3SHREejRpLzV4WEtCNFlhcTJJSmxB?=
 =?utf-8?B?a0pyQW1tTTdQMnBJSHhCa2RyaEJyVkNyUjdaUFQzNUVJdkFydzIvMCtIelpR?=
 =?utf-8?B?WjJ0Z0FpUmtmRUZTUSt4WWF3V29OYW5zcXVsbHU2VDRleGVOOGRwZURtN3g0?=
 =?utf-8?B?VkE1ZktkczBMQUVpa0ZVWnhWN21Ec3dteTZJZkxUT0kwUjN3d0RObkhIYUFw?=
 =?utf-8?B?bUNEMXR4MDdtMk5nWkZEejV0NU9ROWZjWGtBaTN1cXpNRWczUXZFZklEaXBL?=
 =?utf-8?B?UFZmNGQ5eDVqZFZTMWkwdUlmeEgrNHBmRkw3RlFTWFo2RjBBMjRkbkFJdHpT?=
 =?utf-8?B?WXJCa0RHdWltSUlZQWRlRzVvQjRlTlBXOTlBdUZ3NG4xY3p3eXJTMXJVOTlR?=
 =?utf-8?B?K0lOQTlhTWEzWHZVR2FyYW5pUHJsQ3dmOWZBbDdtOHBXREI0UnBpaGNxelMv?=
 =?utf-8?B?R1psR3NOSUViTjkzdjc3ZlFobE4vbVNoUkJxVXN4amMvUXZMazV0ZHhweEQ2?=
 =?utf-8?B?UGQyOGs2em04bWFzNHVuYUNkSEEzaGsyZ2FNbXhnTUc3Tzd4MmVySlp6aEs3?=
 =?utf-8?B?eldxR25tb3Q2UEZSVWFKL1J2NGJGS1NpcGlRK3E3MGVCbXFMNmdrVk9jNElY?=
 =?utf-8?B?OVM2dWxodko5K1d3SUc0S1AxU3ZYSVk5NnAvQ0F6YUN5anVNcjNFZEVjeDU0?=
 =?utf-8?B?OXVIY3RPL3o0N1JTS0ZZQXBzR3dCU3pTQk1MWXhCWmxFc2RjWnVuUDNTaGps?=
 =?utf-8?B?Y0ppTkRubTZIdDNaVFR2Wlg5MFdJNXg1a0FKbVgxd2ZpY2VSY21ZMmFXUUJi?=
 =?utf-8?B?T2dZTUlybWs5a0tPcGJVQUtoaDJFSVdPU1FYajc2Q3RIQmNoWUthYTlRQXNQ?=
 =?utf-8?B?dkVNV0RuTDFkKzBBUmZaVC8wT3ZhTUZUdGlSU0ZQZ1J2bW02YW0yU0JYZEVz?=
 =?utf-8?B?SW5mdGhQd1hCbkxaSy9KWXd6eVdINXFzU1dGL3R2cDRaRGU4VDRPcG1lYm9r?=
 =?utf-8?B?eVE5QW52VDN1L3dKeUxjVFczZzhTTjR6cUFZdTJxNkxsV2NkakltNHpjRTBh?=
 =?utf-8?B?bjhNK25YQzc0bWtNWlp5b0R6cVE4SEFyK2RIb1QyQ3IveHB5a0ZTeGxkMVF4?=
 =?utf-8?B?Y3hNL2czZVdqa0hjQmpROVFVai9NcTQyamdVS2lLTC8xQTdmK2dtQ21oSm9G?=
 =?utf-8?B?VmRYV29xc3U3ZkdYbDB1VS9OS1ozc0xMNUpvY1VFUHNiR0x2anZ1ZnRNWGFa?=
 =?utf-8?B?Kzc3OTBYSTN3WkFZeDN4N0w5NU9QQ21jV09TTDB3RWNneW54R3NpTGpZSXRh?=
 =?utf-8?B?S3NQSC85RGM2OUxkTDg4OGR2SUFCaWF5REpDRjl3TGtFUHNLeEcvQzMzR00x?=
 =?utf-8?B?QWl1MjlWTHlwTngvQkVmMjB4aDVMT3lqN290dTZsSHBvSzFXM2FsQTlXekFr?=
 =?utf-8?B?Yy9Lb2I5OXNjVFZibFhUVmRxaDZtQzlwTHd3SmRpeHBHdUYxSWRJZXVKaExi?=
 =?utf-8?B?NFI5MGtQT3cyc0lPakEwLzZTMnhDVEJpTHc0N05RYjVXbEhqWjF3ZnZYMi91?=
 =?utf-8?B?NmdpQVI2RXN3VFF1anZIRjFpWmdNcDBjYXM5Z2VpUktMK1lBTVM4WjV1M250?=
 =?utf-8?B?cEhEb05YWjRjaHFQeDJuMXUrM2wwSXhiMVpIdFFYTmFyczRzM1IwbHoxczNk?=
 =?utf-8?B?Wk4rcWZHYnVJVjZ1NWg4eG5kSGRUS0hObUROdS96bVQ4eEQ4NjhwQmlvOUVx?=
 =?utf-8?B?a3FHOXpJWFJ4RkJGUTFrbXhTTEJhc3BqUEhIQzFYdmxvQ0RpcDE5TWhuUFo2?=
 =?utf-8?B?aG1yNkVTc1R0cERGOXJGRUltcFY4S09BZnFKa3pTbmlUV3U3NTk0QmxndG13?=
 =?utf-8?B?SnhIZzUxTTQwMzZlbEIxOXpicW56NHYwWHJVT1VIeUt6dnppZ2xIRzUxRHZ0?=
 =?utf-8?Q?9N7qlbLfAkFmzNjWNxCMqns1o62lPmys?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:53:35.3470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f67441-7b80-485a-1ddf-08dcc7f74dce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130

Hi Victor,

On 29/08/2024 06:09, victorm.lira@amd.com wrote:
> 
> 
> From: Victor Lira <victorm.lira@amd.com>
> 
> Fix flaw in qemu-*.sh tests that producess a false success. The following
> lines produces success despite the "expect" script producing nonzero exit
> status.
> 
>     set +e
> ...
>     ./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
>     (end of file)
> 
> The "set +e" is sometimes needed for cleanup such as powering off hardware
> after running a test.
> 
> Fixes the CI failure introduced by 95764a0817.
You may want to use "Fixes" tag. See docs/process/sending-patches.pandoc.

> 
> Update xilinx-smoke tests to use the "expect" utility for early exit from
> tests. Generalize the variable names in the script "qemu-key.exp" to be
> used by both QEMU and hardware tests. Add a missing "-continue_timer" flag
> for the expect script to properly time out. Add "expect" to xilinx
> dockerfile.
This commit tries to do 2 thins at once:
 - fix "set +e" issue
 - make xilinx tests use expect

These should be 2 separate patches. The first patch should only remove "set +e" from qemu patches.
There is no need for fifo in qemu tests. You should use that only in xilinx tests where we cannot remove "set +e".

~Michal

