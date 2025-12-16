Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA1CC19B1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 09:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187666.1509007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQZt-0003Q1-DG; Tue, 16 Dec 2025 08:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187666.1509007; Tue, 16 Dec 2025 08:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQZt-0003Na-A0; Tue, 16 Dec 2025 08:38:41 +0000
Received: by outflank-mailman (input) for mailman id 1187666;
 Tue, 16 Dec 2025 08:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qh75=6W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vVQZr-0003NU-DU
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 08:38:39 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c8750df-da5a-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 09:38:36 +0100 (CET)
Received: from BN9PR03CA0682.namprd03.prod.outlook.com (2603:10b6:408:10e::27)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 08:38:32 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::46) by BN9PR03CA0682.outlook.office365.com
 (2603:10b6:408:10e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 08:38:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 08:38:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 02:38:31 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 00:38:31 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Dec 2025 00:38:30 -0800
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
X-Inumbo-ID: 9c8750df-da5a-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoeEgqMTyW4EIgTYRkS9/PX0x7JxXXXinxLj7LQ5gBJjN58K2mzpkMgum3HWOOJBzxCxx57H8ed/XhJHFjmpWZdE9wpDsEBkB5QMNPBII7Sstb+ZBIgfNMdUfe++Jjn3cVr+phuvrGEclBkL76iUVqU0YEDr9d9M0OF3srzlBNU6DnqXRZ5XPS8xyaJgdm44TOzUOOJSkdEpgW+UybWF7KajCl4xb5+zHs57QKernIM6Zn3Qj3FtC+D/9D3el8VO8s/qdsnKuWabQhm1eTWT6VlKqM8EHPuqayZ+3p7WLgmr4N/AbHmoi41bUJhw3+gEKb41/kf3fAnpEEk2nJ6iVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDCsW65i7qm+NHFKpRQwMSiyGeC4ZTpkMdoTaSGsOOw=;
 b=UQQ3XPPkQpnl1z95RwZngyPowOniTUbw0Xtomas0bixtYRJG8WLisP4rjm3WP7r6aHmeYkbg8SAsfh+a4vhOcoUPoh3vyFXO1No1EKrDB2jvfGwT+fCX59bRNy4tAuXDJSRGbGWbX71/F/umE9Y7OW4rcXXA54vQQWQ/aetLDCJ9w4yXnRr2k7mF3Ex9mKMkJ22WZlzfx0u28nfMtrGM2zwDNDs3t97U3jIlUKOJ3uKIZgvOrPtrZbSPkBLtazuB+j31aa4QIqf3wONXbOriuHGZhrTLRIWfomPcaAJUHjosMAK0MBuG/jfAPN4Vv25REGaYebWxlTVuCj+7/kTd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDCsW65i7qm+NHFKpRQwMSiyGeC4ZTpkMdoTaSGsOOw=;
 b=PI5BOUvwZLwoiuLoUUYcafafyKhuJ7kg8ksHbjpNycbQPkX9gEAGtNz9CykuijAgi/abjNdks0U4EyMNYe4i3qzgHoTAoByRhNj7FcrrHPeOx/WdkoCqjLgOZELpMX1c9LKlXoNEk8/bLdmTJuuPk8OArrqoDv5v9BmNf/aTJg0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bfe096e0-c908-468f-a916-b1981a6e159d@amd.com>
Date: Tue, 16 Dec 2025 09:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gic: Replace BUG() with ASSERT_UNREACHABLE() in LPI
 paths
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <1c846d023255a7a7a9ce533cde0a8db3c26eb855.1765811852.git.dmytro_prokopchuk1@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1c846d023255a7a7a9ce533cde0a8db3c26eb855.1765811852.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8ecc91-1c39-4f20-df6b-08de3c7e7ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHlNVnBhSy9jWHMrZ2t2NEgvS3MvK0ZvaUZ0b2x3bXJaalQ2U3VTQUlzcXRP?=
 =?utf-8?B?N3g4Q2ZDM0o2NTkzYjN5RFlqL0pMb1ZvaTZOc2JrSWlpZ2Z1TEdEbVJNV0Z4?=
 =?utf-8?B?QUVLYzZDUG1MOGtNeTkwM2txeTREK3pMazdSZHFFWUlJdG4zQkFXUG12U3U4?=
 =?utf-8?B?bEhpYnhsK2JSanlIeFp4NmpaRHh3eFVCemtQS3NOVit4a0MwY2hGMGhFeFI5?=
 =?utf-8?B?VjRGS25vMWFjc3ZXMEdEb3Vsd0tOM2NDRjZIQStFeHVoMW5aam5HdG1DT2RH?=
 =?utf-8?B?NnhQVjMzMGVxa21ac3RFdHNONExqVUhXVk5tSis4M1l4cUE0SlRlTzhlVzBn?=
 =?utf-8?B?b1krUHVWbGlVZzBLRGtEMG5FY01lV1pGSnJUVWYzN0tuamhIUWJoRm5LL1lu?=
 =?utf-8?B?ejl1QjFIVlplVTFYMUlSaytRYTM5SkJjLy9nTG9YWXBRa0NPdzFFM3hGQWFm?=
 =?utf-8?B?UGlTd3ljb3crRDAwRXFpelFQWmtKczB0VVhBRHk5RnAxZlNuenVHeFRILytz?=
 =?utf-8?B?MDFPRW9VMUhUUnBCaTRXTExNZUlMOUVoU2EvbFZOSUhKaGsxc2s2VFFvQnJB?=
 =?utf-8?B?YnF4TngwZVhVd3JwR0FPVXFGN0pRT1VOYkdpVmRSYWhIeEpHYmlQLzV0RXVR?=
 =?utf-8?B?emNkK25uTzUxSjdqRVBjRWFQZ2I2Ukd6T3BBR0s1TlBDcVdkaVVYOENpVHBI?=
 =?utf-8?B?cHJrQnVVWUtaNWtRNVpBSGNpY29peG9sRHBTeFhJdEloRkxrUDZkREdMRlFv?=
 =?utf-8?B?dU8yRXo3V0hJSGM4cERMVWJINHY0T1ZkQjFLNkd2OFVBOXNFYTN2Z1c5QmRZ?=
 =?utf-8?B?ZkdmcHFyd05vUlBid0tMdUZOeFJWRTJ1QURqNDAvQytFNUhNMmQ0SHJ1aUJP?=
 =?utf-8?B?eXRkZFRhRk5FSkprS0twdXR3cy9SWDh0SHJ4KzNEVVhHK09qT1dBa0hxYVNO?=
 =?utf-8?B?UkQ1T2pDeWhwRmpmY0pVd0R4Y0VWZUV2S3p4NVJhK0xIZjM5cmZrYjY3T2Nu?=
 =?utf-8?B?dFJPNTdncTJkY3dvelNIYURVQ1dXL3ZqQjMvaEVRQjZzOGZ1MjRWS3NxK0pW?=
 =?utf-8?B?dmtCVkl1eGVudjBlTExob09NMlRRMFppRmlMNGl3emVqSjdIY2ozYlNYQ1hB?=
 =?utf-8?B?K3VSdGxabzJnWllCc2VqRjJvZEVYcE00bHJEbitqYW5ZSXFLZ0NBVU96M0Q0?=
 =?utf-8?B?TG5tenNkYUQ2UmM0NFo0bHZFZmRFQmhtekdoMEhPNGlJZitSWmpEUk5ybVBF?=
 =?utf-8?B?OG80QWwyeTJxd2xPMWs3aklyKzhCMlpQelhIdS85cVFLT3Q4T1JSMkxmNHpa?=
 =?utf-8?B?SWpPWG01aFpoQWluRjM4TlhHRm56NFpRNG0vQS9lOHdNM1NtbE50aWF0NzNs?=
 =?utf-8?B?emVkcDB4NytBL1R6RDBVL2c2OC9ocGxGUzdNd1owVXVnYnR5K1J5UVlNY0Z5?=
 =?utf-8?B?NzlkTjRLam9qZ2RQN2tUM1g2QWhtQUkwRFhnbkxDOFVabmNKT3dWcWFPczh5?=
 =?utf-8?B?YWhyVkEzVWl1ZzdmeHc3OEcvb0R2QmROUk9md0pQZzZZT2FSQld3U1dXdUYy?=
 =?utf-8?B?MDgwSFdaVldEc3c3UTlmUkMrKzJCQWlHUVBobGNMVTg5QjRkYjhSUEQxL3lC?=
 =?utf-8?B?SnZPTzNSUUYxZTRCNkNYSDc3K2UvOWJJMTZUOHlxZjhaNVgrQ3JoU21YOENK?=
 =?utf-8?B?OGtsUEQ5K29sZ3htcUc5dHZUQ0FRZTVYWEU1TTIwWTVYaWJ1RGsvYWY3bE1I?=
 =?utf-8?B?cGJjNURBZTUxeFVJZXEwSnVkVUoxazlBcTVhcHJoc3ZsM2xSQ3M4SHZMVUxo?=
 =?utf-8?B?Z3NxbEFscVJtVEMyYUlMSjNGMi9jc1ZyU0NYRWJDb21LclRVYzZhMmxlTFNU?=
 =?utf-8?B?YVVObkdsckxkT05zUTVDMkNuTlpaU3VZNUtlUlArZ3JMWHRXeTE1YjQycGhv?=
 =?utf-8?B?NmN2UlJsR0w3ZEQxMXhwNGdNb3V6S2UrNzZST0x2T09uL0ZXQUhzNzF3TDB5?=
 =?utf-8?B?WE1QRHhrMWloVURWRWE1ZXJkRXdGMEx1anZBOGhUZXNUTXdKM2FjM2FxdnIx?=
 =?utf-8?B?T0RmSFQrN0w1VlViWmZObkpDTk4xUU5CMHdNQ09rQStsTmo5ZHN4VnE3WDVC?=
 =?utf-8?Q?WRM8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:38:32.4265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8ecc91-1c39-4f20-df6b-08de3c7e7ed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969



On 16/12/2025 09:22, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
> The GIC LPI driver callbacks violate this due to the use of the BUG()
> macro, which causes the function to never return.
> 
> Swap BUG() for ASSERT_UNREACHABLE() to satisfy the rule without needing
> an additional deviation.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


