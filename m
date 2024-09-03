Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E732D969D9F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 14:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789105.1198616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSfn-0006pH-R0; Tue, 03 Sep 2024 12:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789105.1198616; Tue, 03 Sep 2024 12:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSfn-0006nj-OO; Tue, 03 Sep 2024 12:30:15 +0000
Received: by outflank-mailman (input) for mailman id 789105;
 Tue, 03 Sep 2024 12:30:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Szdq=QB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slSfm-0006nd-F1
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 12:30:14 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2417::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43463824-69f0-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 14:30:12 +0200 (CEST)
Received: from BN7PR06CA0056.namprd06.prod.outlook.com (2603:10b6:408:34::33)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 12:30:08 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:34:cafe::93) by BN7PR06CA0056.outlook.office365.com
 (2603:10b6:408:34::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:30:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:30:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:30:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:30:05 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 07:30:04 -0500
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
X-Inumbo-ID: 43463824-69f0-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leRzyi2haiA2xo5n73QhYXNVgrKHQGV51pAFmNjDDar/ZFsPF6+zLopWGIVmkGepKXFk85kuiml5gtFkpuIWNH63MBMZTj+hwBMvN1emRtAtR+ggU9N6UyPqjFMTM1O0W90YIKzLjedvJoYl6OJe+YI5WLp2dqRRPqPosbyZ/GBeUXTIXb6ZylDSweNFUEoApok5bYtAtKkQzlVZLPOIxVwNcKlM3oSKsvAdP7PZ3htdXcQobREtPfCmVMwkoNZyqg3huMVoq9N+ppMcBFVwprnlNHR6YczOqtDEz1xzo0spEaZC2ymVzziT1AEWE21rXCpErQcemaIrT0arhmTiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiStMwDmiFWjS5BWuVxjBf9OajUdcU5WV6YkOvSB6mk=;
 b=hyTh8zZYnX/Nl3ZfJipu/ifGW/nubShBKwYu1l5W6vQ2bKc5IK8hXc3QdXbVqP+TCNTsxNouIL//b3poSmC14PBiGH+U1Mn6ThSDUMLN5su/kfKAHniNVMOUZYITRuJNFuFcXevAC9V0ntpHpShnNjrHvfNeHqkrMfwNHyLCy1NOzPTEvHBt8bSTjgRqfIZI3f0rHt4RzEYputigCUiAaRwpNK1fbE1dLBz/jsAYT6WLFGrUvJmfBngl53/rIagrU6Ty6qPrNJuBDcXVoxD+XU41fARRZCeXZgl9RPuZ4RdVcTo1l/6YUipr8Bu926EG/bLI43C0o1FoczyY8cVQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiStMwDmiFWjS5BWuVxjBf9OajUdcU5WV6YkOvSB6mk=;
 b=h/d2I7pwFSLWPj60J2JSbe6aPre256FCClbZZ+26a06paA0riDuoZC26bxuTL+JWGZqy/5AkML8HQTEDa3kVSSDS74iOH1xZl4tg5wndVK5gqAa66Vh5+UB/d/gPRuxNJJP6EvBgKF/7GaNCX46vCf2WkWqLiuqqSIJLBFZekg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <578a5631-fee7-4de0-a764-1f7c896ee057@amd.com>
Date: Tue, 3 Sep 2024 14:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for emulated uart
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Artem Mygaiev <artem_mygaiev@epam.com>, "Hisao
 Munakata" <hisao.munakata.vt@renesas.com>
References: <20240829133314.4042845-1-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240829133314.4042845-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6f9c81-b396-4e0b-932e-08dccc142510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHBnK1QrVXB0VG11NndOZVFyMWZEblE2TzVsQmhHQk1YcVZXemZFUTdmSVRW?=
 =?utf-8?B?Tk5TU04yMHAxcTluMHNUczZCT3VBN29SM1U2NUlpSEovNVAvbkVMR2xOdEJF?=
 =?utf-8?B?M0VrUmRTYUJPRWlPWUwzSU5LS04rVHRZbXplMjVtS29aY3o0YXVDcFN3Rmo2?=
 =?utf-8?B?c21CV1VDK0JpbHRnQjFFaTlmMWlWTjhBSzZLYWRmTHVKRS9ZTmlMVnh1cGk4?=
 =?utf-8?B?KzZqOHdKSVlmbjREMlh0RElTM3VONEtZK0U4djBqSlRZNWowMXZzQWN2Z2Vn?=
 =?utf-8?B?MVMveDQ5UFVmakJNS2tSVll4c1gzUWtGYU1BbmtZRTQ2aEVIRFQzNExkUzRD?=
 =?utf-8?B?aE55cFNSY1BFWGFWTzd6QkFzZTFIOGNmRHp2cE51UFVnSERjcmlaNEhLc0lH?=
 =?utf-8?B?MUdKeVR4MzRwSXZmMlZaNnY0eEdLYzhPaThZUkVzZ1JJMWtpNTdPcUI5RkVi?=
 =?utf-8?B?eTlIU0xqZGZQVlhha0JnU3FaZ1owVHNIYjFRMzFFUXhsalVRYjNXOXZ5QVhQ?=
 =?utf-8?B?ZWVta2FNbzhXSUVidnhheWJtSVhUUmJyZzhZYmxrdUdGTlFFdG9YVGFtWktP?=
 =?utf-8?B?eG56N2VacjFlaFhzK29kQlhFUGptMDBDUXNxbXJ0MWxRWG1YbzVJcHJmUFI5?=
 =?utf-8?B?Ly8xbys5VXQzY1lCemVLZnFMSTZkcjdtTTV0M0lhVXRUZ0JFTnpKZEV5Z0di?=
 =?utf-8?B?NmFGMnNRWWNIK1ZwM21JTmRsdXYwRWI0VzFwZzdDb25QZ0orOE9LYXRyZVUz?=
 =?utf-8?B?NmY4dGlGU2crRXdLWTFjMWVvQ2tEWkdvaGppYlNKeW5NOUxNVXEvMHRmNnlz?=
 =?utf-8?B?S0p1WHFGTXNVdmNrcnNIMDlhZkg1Q2Y4NkdYdmIvVldQek9FVUNmRHR4OEk3?=
 =?utf-8?B?aUJQUVdJUlZIU3A5YktzVmdNcWpOKzRKZlI0bWtJL1dKbVIvYVJGRnRRcEpj?=
 =?utf-8?B?UXVXazVJUXJnUlh0L0lvaGZtSEsrRFZ3S0l3aEM4QlI3N3A2UUhSbisvMnhY?=
 =?utf-8?B?cVhMNkE3cGZ5aUJXSDNkWkJEdWpjSzdmQnNIYVJhSnBpa0FSUTdiTnE5OUo3?=
 =?utf-8?B?YUcwYUZiZ3VrQ3dlN1FCWFVuTWNuUGpuTy85eklVUU9JcjJpRUI0aTF6Nnl5?=
 =?utf-8?B?SklNbWo3cmxjUjJiN1ZUc2gzdUZSQjJBRWpYWWRZWTQ3eS9rN29ad1Z0N2pR?=
 =?utf-8?B?STBHa3E5NFozUGk0OGFSQjJSYkxlc3RrbSttZ3dWTWVJZ0MyZSt5QnN6dnRK?=
 =?utf-8?B?eFF6QzcxYWh5RXJqbnhWUjVOZzh2WXljc29GOE1NU3NuNVVRSC9SRU9qZGdD?=
 =?utf-8?B?dGlJZkp2cUlnN01sRmdMS3IvSTJHZmxGQWUvL2JFWXNRZUFIUzZVeHE5RGkr?=
 =?utf-8?B?dVp4K3Z4ZzNLSEZhc3BYWnhLY2RDb1gvMmlHMkVTcnhPZTBzUmdLdG9CbEpj?=
 =?utf-8?B?aWRhM1ZMc2VKUm5IeFJHdytLT1RQWDJHYUpyMGtVOE1keWRsRFYyTzgvUWlQ?=
 =?utf-8?B?d05CSGI1SUpWSkpWZ0krYjlvUG9UT2pHdzEyS1NrSDdHdktMOXJzSDRubGJr?=
 =?utf-8?B?bmdaanpIckswL2VjcCt1b3B2czFERUNnVEFRWlJVbXpJMmxTVWN1T2VISVJr?=
 =?utf-8?B?Z0dhS1ZFUjl1UXdKNlo1QXpmZE02QWQ4THZ3QkpxQUZ6SEJpYzE5cTg5UnR6?=
 =?utf-8?B?aDY2Q0ZsTXJ3VkNsTWtmMlpKRzd2SW43c29xYW5tdXFJVFVuTlRqMWRucGpD?=
 =?utf-8?B?dmlFalE1Q1dMQkpKV3pBTEZlMGJmY1JwemUwUFF1aGw0ZDhiTFBIU3RvUXhF?=
 =?utf-8?B?MDhzczM0TnBJZXYvdDl3QmZxeDNkaFJmcE5DcUkvemJFQnB0VGtxN2YzNzl3?=
 =?utf-8?B?Q2g2Ylk2SjZEeHBZME1NTDFLb0N2N3YzaVBtdFJBdThidHNHM09LeXZ2a2I2?=
 =?utf-8?Q?0DnUIBOlW20=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:30:07.2398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6f9c81-b396-4e0b-932e-08dccc142510
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831



On 29/08/2024 15:33, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Add the requirements for emulated SBSA UART.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 224 ++++++++++++++++++
>  docs/fusa/reqs/market-reqs/reqs.rst           |  31 +++
>  docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  21 ++
>  3 files changed, 276 insertions(+)
>  create mode 100644 docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
> 

[...]

> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
> index 9c98c84a9a..b69699e5fb 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -15,6 +15,22 @@ Rationale:
>  
>  Comments:
>  
> +Needs:
> + - XenProd
> +
> +Run virtualization unaware VMs
> +------------------------------
> +
> +`XenMkt~run_virtualization_unaware_vms~1`
> +
> +Description:
> +Xen shall run VMs which haven't been modified for Xen.
> +
> +Rationale:
> +Any kernel/RTOS can run as a VM on top of Xen.
You cannot say that as it is far from being true. For booting guests, Xen follows e.g. Linux Image protocol
which means more than just a header on top of the image. I would remove this rationale.

~Michal

