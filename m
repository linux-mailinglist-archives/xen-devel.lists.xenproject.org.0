Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAqVJ4AGfGnBKAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 02:16:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1AB61DC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 02:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217167.1526969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vld7M-0001pE-6f; Fri, 30 Jan 2026 01:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217167.1526969; Fri, 30 Jan 2026 01:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vld7M-0001nB-41; Fri, 30 Jan 2026 01:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1217167;
 Fri, 30 Jan 2026 01:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=khHy=AD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vld7K-0001n5-26
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 01:16:10 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5c8bb8-fd79-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 02:16:05 +0100 (CET)
Received: from BY3PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:217::17)
 by BL3PR12MB9050.namprd12.prod.outlook.com (2603:10b6:208:3b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 01:15:58 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::de) by BY3PR04CA0012.outlook.office365.com
 (2603:10b6:a03:217::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 01:15:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 01:15:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 29 Jan
 2026 19:15:55 -0600
Received: from [172.23.55.58] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 29 Jan 2026 19:15:55 -0600
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
X-Inumbo-ID: 3f5c8bb8-fd79-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxCcdxyppVZAOFMTimCpS5k6nCKiO33UjhEulJRVDwreyFgqRTgEORv3YcJb9Kt44GAUgBuG1FywDX7Y2cDDD25UtSKOQcbtIzMaq0ogYP+wGTCC/edGknFVVuUkKVVF8R6t0JZyuZ3PHyY+IcJ800y96klt4q5JEb+Sa+GYIOf8tKyfMe91jtZjlH9/MEUB65J/fdAa4r48ltKXrZbhvGoxfwBfBJFaMHrnBXF8PRu89tNZAfB6cCRhRVt64hjMqZwnUwMTPwKTpp6j3nAQjr1OsunXJLuNk1KBA5k2CSwJQpPK/0WMLVTPgjTx6AkgMW8IDjcp+0hywn8tRJ6kLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzcptzbJOo7Yz/i9v0LFtExbw5pxyLcL/Da0og1H+6U=;
 b=DAT4gxi+vvlQkSmaz1bvUu3X3LJcv5TXXCMSfS56YcONniLsSMVFU9wBaViNsflL/dWbO8kGO6jHhScD0ZEw0ubIpSz0MVNHokyB93F18CLV+WOd9SXnEevJWMMI6EiZd7nSvc8NX4wdQKu00Ygc2y0WPUAXa5KYDqgP+2r2JcEtwqGTsti7MAICCsakqWbdu72L6miJIx2qYBeHz9uBzWbdqQIjdRgBvB/OxdmFC5I2IAuZQJHtCdvPAqVM0RaMPqb/YsKxSuZqRd6bvC0fAElOndOkSCPZrTaAf9YuxfGkcy3sXpstEuUrw4UbhfPjV+MQIgH6Af0YoD38bIgPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzcptzbJOo7Yz/i9v0LFtExbw5pxyLcL/Da0og1H+6U=;
 b=tbcIOXNyzwEh46AbykTp0n+NN3oNPp5VSXZwNHUJUFYMnkuiE7Yr7rEqmEElqz0bGIgPXZdFxXLTCyRwlG5pqT6DIkkvgtfkHJK6ARaf2UId2+c2cWVz73BnPxze0Fr8Yi3a7abvuqLuvt01kTMYKyP+IbBLzw36cRQF+fv1nY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <bcccb80b-a7d5-4600-8dc5-c4dd8f99ab71@amd.com>
Date: Thu, 29 Jan 2026 20:15:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] xen: enable dom0less guests to use console_io
 hypercalls
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<victorm.lira@amd.com>, <andrew.cooper3@citrix.com>, <jbeulich@suse.com>,
	<sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
 <20260129220858.2371938-2-stefano.stabellini@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260129220858.2371938-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|BL3PR12MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb7b723-a104-44c4-e003-08de5f9d1f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjRWK3FFTWUxTGVsclNBTkJ5cUIveXZabWczRmRwWENOM0gwRDdBWWxEeFh2?=
 =?utf-8?B?OWFTc1JvcVVyeS9TLzBSNXF6cURnUFo3MkxjcEhxOG83L1VGcHpYWUJ0SU1Y?=
 =?utf-8?B?TGw5amlpc2JDcTUrc2xtV0F4ZGhETEZLdmhMZldJR1hzS2xxVnBKQWdpYnFv?=
 =?utf-8?B?cE9PeGo2cjVTdmxzNXVBZ1VEKzB6RElWa2M2VGVQUzZrNHBpNTE0Zk81RS9X?=
 =?utf-8?B?WWdEemFpYWlZK0pRN3VaUEN0MytMYjVpd2wvZ2NEbmVrc0NLMEh0Nkt6TG8v?=
 =?utf-8?B?bzZFNDdGSC96UUJ1eW9TWTBUY3Y4SDFTVkRkelNuWklzUGRuL1ovRnZoeDBD?=
 =?utf-8?B?eitBL2dCNzM2RXhDMzFlbGo5WjBtY3VsZmRJaEN4MWVERkZCOTdVRkRWeHph?=
 =?utf-8?B?OVVQak5TNmkxOW9RYkEvRG5uYVgvL2lZa0tlZ0paNjNmQzZlQksxbExYaW4w?=
 =?utf-8?B?SUhSK3VncDdYM2lBdE5pNFA2QThXVDdYWWxydFhGWU9JUEZxSWFvTzlreHRM?=
 =?utf-8?B?djQyRVZaRDE2a293dlRiVDdPSVpSajFCc2p6TUo1RkN6MUViMStmd1hlTjEy?=
 =?utf-8?B?c1FuYmwrb1JXUTV5T0ZkRDZ1YkgrS2pXTS9xRG1SSHhmN0pPa05wbzVVS2Jz?=
 =?utf-8?B?VTBDZVBmaG1kMTBXaElydnRXamErU0lzK3ZWVnRRbnVxTi9FZ1oyQXdLdG41?=
 =?utf-8?B?bDBPaFF3K0VTM1M2T1gwNGJPZ21TR2lTNjZsVGQzMG8zcXNNYklBdlFpMzMz?=
 =?utf-8?B?K1QzaGpuUVE2WUtHZVlQdm5jcVJ3MEtzZ05qbDluRC9wbTlTSVBtN0lCVFlC?=
 =?utf-8?B?czR4RVRVL0g3Nkc4RU9qdk94SE51R3RwYm85MDNGZmV4bno1U3B2cUZ1M2NC?=
 =?utf-8?B?dENRcHdLWUFhZjljMjFnTDVIR1loblhEQmwrbVpVRUFNNnhZYlVHcnB5RURK?=
 =?utf-8?B?WmJUMlVIZ1ZNRHlZY1k2UllBM3hub3JpaVByS2g4ck9pcmcxS2xoWmdLWXhw?=
 =?utf-8?B?OElEK1ppR2pZVzEwT0xuT1VyRWtyOE9xMVBqcERkamIyZmhTRXJQQnE0cWo4?=
 =?utf-8?B?QlA1NGhyYXVVL2llcG9oYTlMOE54d0twUUxvaXVScFBUN1BPems0SW42WG5w?=
 =?utf-8?B?MXdhN2NhQVNIViswdU1vU2ttblJTYTBzR2cxREQ0ZDQ1V1A5cTBmc3VOdkUz?=
 =?utf-8?B?a0xaSnE2b0pCZ085NVQzbjg2UVY4RGJLL0hVY05aR25ISnZCdUdwUUNEdFg3?=
 =?utf-8?B?bXBzM1dNZUlHL2lTWDMxUzJYQVR3YzlGeU1YU1Y1TW5ESWJyei9yYlQ3RnFH?=
 =?utf-8?B?UUcwVE5UWDdZa25kaEtYS0x2L2VSL3lNV24wRnIyNk5haTVMYlAwdjNGN3Y5?=
 =?utf-8?B?dHdzRlBTVlVvVXBSdDdOR3Q2SndMYitoN1pHbXZkb2VGSE1VSUVLQ092T1oy?=
 =?utf-8?B?bkhqV3VkR1VCbU4zT3JndE1DVTNqVVFBZE5qMG9PUzFRNWcrZmdJalFvbnZ6?=
 =?utf-8?B?VjhBNkxCU1VsSEwvOXhlMDViMW4vY0hjcGVtbjFaTllkS0lqcGNRQTJxZG1w?=
 =?utf-8?B?SXgranJmdER2Tng4U0Q4SCtldWxCMDBvUHJ1TVNuT3hpcDRCWkR5Z2UrNTVK?=
 =?utf-8?B?MWYrQWxYU2hIaVAvZDRhV3YxbWhwdTBnNEpEK3hJY1RsNFFIYms3VXhkbDda?=
 =?utf-8?B?OEVESklXY3VUMlhGYVlxZDhCL1diRTFGeXpraWV1Y2k5SmxJYzJuMGxyMFBN?=
 =?utf-8?B?VW1iclczUlAxbWpVbXNQaHM2TVdVcWIvUmtTZ2hYdzdaS29RMjROWFRCeWZh?=
 =?utf-8?B?Y1A3OGdSZWtoVmduMHJDcXFuVmV4K0E4RjhkdmhFNGxOSWN2ZVRlWUtHMVRR?=
 =?utf-8?B?S0JOc3VPazNKWGt0QlBaaUpFNjNVaE9oenArdzVxb2l0anRORXkvS2tVMFp1?=
 =?utf-8?B?YVFSTHBjU2JnRDd5aFI1N0ZVNXBYcmt0UWF2MUJrUUlFbTNyQndYc2lmRElX?=
 =?utf-8?B?LzNHRjhXY2N6N1pycVlWUCs0cCtEbldSaFhNT0dWYVFPRWJLMG9sNFFMakw4?=
 =?utf-8?B?UWVBeG5uTi9iTjhvR0J3K2lVNzlTZXN3Q0w0OU5MZWpkTjRYRkw5MXBvOENM?=
 =?utf-8?B?SUxWb2pqMi8vZVk4QlV0RjBCQnhMZ2orQy9OalNWUEJYOEE2ZEpRZFVhVlpL?=
 =?utf-8?B?T3JNbERlbkdkV05wU2ppZTZTcmJTQi8yMnFpWlVNUUVqUWhLOHc1TUtUVUVX?=
 =?utf-8?B?SE9sZHJXMm8zSWRjR01vdWhTSm1RPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yLXBNcTDPRE/JnzA8P0Be5z4S9xxUtSgxHW7iUeYU2xomhj+xArlylUWuItoTFBJuAXNQ83JMlwmxDCcIq20VWvuZ5hhp3XiSaIffem9Wm7B8auxe1a+ccLVUiep0sSJnTKu3avICVZyVISfToLziPLT8VLOXuKC5gUgPydWhi4pDIn21PkaAQCgkHGMfljw7VYX9pNElJkOEMLcK/HI9CkWQ5e/Lbea5/Fsn8LLPbOYY+UuBwLp0gsrQ7UBh2FE3jNTXqcHpwJ8PdJ1a+idlaoSrycZ6bt02tyn65hLHSzyknQ5sRWDDbT8Re23I6Q2I1zmsPgRt0YwByvVsW+N7dAjlJ5Ec3U1tqzFfI+yIOASKVGPOIL1IHiiuPnAOeRvo2W9fbAmgySGag1NKF+9V7rlgUldPvrxbFCniGx/U6lvEyiPPzPO1FV7Jt4wSsoR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 01:15:56.6899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb7b723-a104-44c4-e003-08de5f9d1f06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 02E1AB61DC
X-Rspamd-Action: no action

On 2026-01-29 17:08, Stefano Stabellini wrote:
> Enable dom0less guests on ARM to use console_io hypercalls:
> - set input_allow = true for dom0less domains
> - update the in-code comment in console.c
> - prioritize the VUART check to retain the same behavior as today
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v8:
> - move in-code comment update to previous patch
> - add in-code comment about is_focus_domain() check
> ---
>   xen/common/device-tree/dom0less-build.c |  2 ++
>   xen/drivers/char/console.c              | 16 ++++++++++------
>   2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 840d14419d..cb7026fa7e 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
>   
>       rangeset_destroy(kinfo->xen_reg_assigned);
>   
> +    d->console->input_allowed = true;
> +
>       return rc;
>   }
>   
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ed8f1ad8f2..418d194cef 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -613,11 +613,20 @@ static void __serial_rx(char c)
>       if ( console_rx == 0 )
>           return handle_keypress(c, false);
>   
> +    /* Includes an is_focus_domain() check. */
>       d = console_get_domain();
>       if ( !d )
>           return;
>   
> -    if ( is_hardware_domain(d) )
> +#ifdef CONFIG_SBSA_VUART_CONSOLE
> +    /* Prioritize vpl011 if enabled for this domain */
> +    if ( d->arch.vpl011.base_addr )
> +    {
> +        /* Deliver input to the emulated UART. */
> +        rc = vpl011_rx_char_xen(d, c);
> +    }
> +    else
> +#endif
>       {
>           unsigned long flags;
>   
> @@ -636,11 +645,6 @@ static void __serial_rx(char c)
>            */
>           send_global_virq(VIRQ_CONSOLE);

I think we need an additional patch, or included in one of these two, to 
change VIRQ_CONSOLE to a VIRQ_DOMAIN.  Otherwise only hwdom could bind 
to the virq, I think?  It would be the two changes below:

Regards,
Jason

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 67700b050a..dab123f20d 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -138,6 +138,7 @@ static enum virq_type get_virq_type(unsigned int virq)
          return VIRQ_VCPU;

      case VIRQ_ARGO:
+    case VIRQ_CONSOLE:
          return VIRQ_DOMAIN;

      case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 903ad912cc..138eeaa14d 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -611,7 +611,7 @@ static void __serial_rx(char c)
           * Always notify the hardware domain: prevents receive path from
           * getting stuck.
           */
-        send_global_virq(VIRQ_CONSOLE);
+        send_guest_domain_virq(d, VIRQ_CONSOLE);
      }
  #ifdef CONFIG_SBSA_VUART_CONSOLE
      else


