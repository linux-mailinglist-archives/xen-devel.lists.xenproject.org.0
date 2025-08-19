Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF768B2CB76
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 19:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086881.1445089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQV2-00025J-HA; Tue, 19 Aug 2025 17:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086881.1445089; Tue, 19 Aug 2025 17:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQV2-000230-EH; Tue, 19 Aug 2025 17:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1086881;
 Tue, 19 Aug 2025 17:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xG4o=27=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uoQKt-0004O3-4J
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 17:41:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2417::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab991dc0-7d23-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 19:41:01 +0200 (CEST)
Received: from SJ0PR03CA0370.namprd03.prod.outlook.com (2603:10b6:a03:3a1::15)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 17:40:56 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::b9) by SJ0PR03CA0370.outlook.office365.com
 (2603:10b6:a03:3a1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.25 via Frontend Transport; Tue,
 19 Aug 2025 17:40:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 17:40:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 12:40:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 19 Aug
 2025 10:40:54 -0700
Received: from [172.28.207.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 19 Aug 2025 12:40:54 -0500
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
X-Inumbo-ID: ab991dc0-7d23-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxZFYx+pMDcTzwVr1jdlggWNB6XgeaAuq/j9/LnGCpVBWZhpyxTSMNn+eFHNPhXbr/eKgd5iwTNOtPljbOePNP3Nl1JyvmsmkJNqa31UBpyvfQDJyZMzdhEU7FF1iSY0gYBED+XWXFXKrM2wdWwsMBt7AsQes8D2uWtHV2AbCuFFLLg8CybBbvWNh+yg0vfzpKB44mEoebHZcQrCoHhNceaTKT5H/acQ6KmNYJK/g6GGcBrOqCLch1JWpbG61d/qY2Uv2RBmKBJM6bZe9TUNVLVpQtxSrACv6ixFgQ9Ac7UwxmhymG5t65OQPA5fIu/pLx9qpIoIhkIv4BkfYJt8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9EZfx+dGx80nPNepjfNrACy30O6GM/cb6wg7FI1Zm8=;
 b=VqlEAGhQEr00n40lagz9X3+SAxPKLEak7YVRt6VcyD8b2mANKdbBGYs8w0Xuo+LsuBqHa/bBbRZV0h5vXuiO3Q6IAUe5nMipKInWv2UBYU+jW0sxyeCONnBm4XzugPCCrGWezx8mnsO1tUeo6CMrv1XCCIU3xnC5cHrfufggY38qnT2ImNybIo1/9b8Tll0kHO8DzpC0sfWq5rWOlHkOpDRZTineVNgpDzZAA2lWFe8r5860EgTY8gI7jQrp0ZB91fOEXLiTHD+Ls+3kI/k8YKwbbAiCPCdJzDQzFY6chtHyX5QQY2ETZfpQJ8G1dfN/eK0guGDXbjjvh00L5eWLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9EZfx+dGx80nPNepjfNrACy30O6GM/cb6wg7FI1Zm8=;
 b=uvLTxQZu+9fv2rdPbOczMkc8qcExKWXJMvcunJFuUysMYfqKZ5yJzGblzPUJwrnEylLT95zh83MGxgqdpTyuI8laSiik1U9KGlGPz6LZw5KML4PfGjRY1WwQsz/M+Mc6TVGueD75Rnnv9SmLkj/hzBjkKon20w/v8p6wIQc3ysk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b325c586-592b-4cde-b36d-91185b41bd0c@amd.com>
Date: Tue, 19 Aug 2025 13:40:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] common: make page_{is,get}_ram_type() x86-only
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
 <4a568ff4-2cfd-40ec-b249-217fab34f4ec@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4a568ff4-2cfd-40ec-b249-217fab34f4ec@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fb08f2-c0b7-4a4e-b8c8-08dddf478cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzhRMkhiUUpCbUtTcVo0dHZzeEJsdjV0RVVaWDNHdU5CN2dTWXFQcFUzTXlh?=
 =?utf-8?B?WHVySjZYaU5GakxGWVVmUkhFeWVObUc3WFhibzFxalNwSE1uZGhoYW5qSzZV?=
 =?utf-8?B?Mm8vcjZSRFExN2lwRkxDb1RmOU1EVEd6MGJuV3UrZEFzSVA0WHhUZGJjNDFP?=
 =?utf-8?B?QzJEaGd2RGUxbVNqNVVwZE5tMmpHdCs1SVlDSmhJUXgwRVpCd2J4b0VVY3N4?=
 =?utf-8?B?VmJIdk5VUE5WeDZKVk9hUGlkb1NqMFI2T1lla1E1S1lJVFZkczNaOXMyWGph?=
 =?utf-8?B?UE5vcjNva2hkVWluV01nZ1BtbnN3dFNXY2tUb0tOVEtpanQzOUkydzBvRi9E?=
 =?utf-8?B?SnBnMVVEZjN2elJJL1hNTEowOTRNcTQ3TmN1LzZPdTF6THl6M0lXRGYxRzJ5?=
 =?utf-8?B?ekFiMzlKTnNGN3dUVVJHU2FXQjR1NHdJOWdGdnBCNC9GNERhL05HYjF6bzN2?=
 =?utf-8?B?VlI2UmRVWHFnL0V1VnRmcDFrQjhPdGhyT216R1dGejg0aytuTXprNDUzeHFU?=
 =?utf-8?B?T1lEQW9jTlhUMW16N29PRGxNSWpKS1d2VS9sM0pYWkZleFc2OVdrbThaKzNZ?=
 =?utf-8?B?UXVwOXZIemFXQUhaSmVaTXl1b2FYbmRqTlJmYTQ5SDNLTnRKZDZKRVJXUlZ3?=
 =?utf-8?B?VXU2MXI5MGY4R3Q5U0lMRld4ejR6N3VzN3E3Ui9HVTRkWlFDdEVXWkhIOVFF?=
 =?utf-8?B?UkRiRjk0OGRDV2d3bG03QmpHWGNPZTVSWmZlOE5tU0FKeVF5V2ZQZGdkdGwy?=
 =?utf-8?B?dXpzMHdLYTJETzVEQ21BTHU4Y1R0aW9zL1hObVRicmVRNHRiMWt5ZkJtakVN?=
 =?utf-8?B?aTJHUjlKTlZuRkd3bTU3MEdCblRmUFlKLytINzN0WVFPSGxYUUJ6c1diWGVG?=
 =?utf-8?B?ZXdwSDBOclEvMi9ydDZaNFZlWGtJYUw0NEUxd0ozZ3c2dTBwSXFvTnRQNXh4?=
 =?utf-8?B?S3B0TTRCYWZSeFpjV3V5K0RLZE51d3ZKWTFZWkNlOXVYcWpOZzNtaDhSeVpG?=
 =?utf-8?B?alhnTUZaOEJwVmpqQldOSTZQZzRFSXF4T0NyZG9aSnZrcHRESTJTRFZQZExP?=
 =?utf-8?B?RTUvc25qNWZQbEViTWt6dFJHdG9vVGkwS2ZncU1LNDFWajFydHNjYnhQOExu?=
 =?utf-8?B?YWRyVWg3Qk1ZdnFhc1cvOWFkd3I0Z0d4V0ZMM2ExcVZoUk1QNkVXdzlqNC94?=
 =?utf-8?B?cE9uQzlIR3VscitKZDNIWmFLU1VTVFRKR3kyekhTbGc0enYwWUkzUnRKSmlR?=
 =?utf-8?B?WHRUOHNaZGFvNUdZajBIRDc5V0k1bjlrVWhYd0JlUnR1aUtTekhDd0k3R3BZ?=
 =?utf-8?B?dTBkOE5zOXk3YU82dDltNWdzeCszSjhySVR3WWYzZE1LanpGcWJvVDRPN3BG?=
 =?utf-8?B?clllT2hIVUdldXhHZ3lhMGJpQXhGclFMVzNWVHR4Z21UVnZUYkFabVlCb3Rm?=
 =?utf-8?B?Ulh0YUpPM0tnc3lYMzVoL3V2L1kwM1h4MHhJQjlsRjVCbEZmT2Y2Y1FCR1dY?=
 =?utf-8?B?aStvbzI4UXF5U2pYZnE5UHFTbjJwL2hNSEtCa0cybjZxd1FhQXhnUFdJVmI2?=
 =?utf-8?B?QWhiOUxxY0tuajZFMnlMbDZjV1lhUENGRm4yeWc2a0VoS0dUanBvM2ZWczR0?=
 =?utf-8?B?UUMwZTRiQ2xtVTArbWIrQmJ4Mmc1MENFSTFIN09FeHhPa1lWbHVGT2RFT05S?=
 =?utf-8?B?dEwxUzRacmxyVzQ3d3JBUjBzdmdSSFl4Um9CN25vUU9wenNpSHVPNW0yWjlO?=
 =?utf-8?B?dER2S1BQUDkzS003Q3dpNjV0TVdodHZFVGhBSS9tTEZYMWU1N0haK3JaUldV?=
 =?utf-8?B?dHFpQXhkTmZDeFlvV21hV3RiY0hZSGhBdFE2UUNaREtBenAwRE1iNHJWQ1Jz?=
 =?utf-8?B?RUVOUDJOWVlySnY1c1I0OHFHWWdMY0NvanBzSmhpV3oyQUtTQWFHOGQ0YWJV?=
 =?utf-8?B?Wk5KLzNqZWYvSW56a3NlQVN0KysxNEJiZlNSQjFSWm1wUzI3ZUZjVVg4aXJ1?=
 =?utf-8?B?Wmo4SC9STUZSanlDS1EwaTNlVUlrQnZjaHB6MXIrdW9EZ20wb0FZdHFMWXNX?=
 =?utf-8?Q?dUjowf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 17:40:55.4887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fb08f2-c0b7-4a4e-b8c8-08dddf478cde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146

On 2025-08-18 03:57, Jan Beulich wrote:
> The classification is pretty E820-centric anyway, and all uses of the
> function are now in x86-only code.
> 
> Switch the boolean return type to properly use bool while at it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

