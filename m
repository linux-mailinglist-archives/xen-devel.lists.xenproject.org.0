Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E2A242EE
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 19:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879980.1290158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdw2J-0003L0-I5; Fri, 31 Jan 2025 18:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879980.1290158; Fri, 31 Jan 2025 18:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdw2J-0003JI-FC; Fri, 31 Jan 2025 18:46:39 +0000
Received: by outflank-mailman (input) for mailman id 879980;
 Fri, 31 Jan 2025 18:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkmC=UX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tdw2H-0003Iw-Ho
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 18:46:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2416::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05af9e0-e003-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 19:46:33 +0100 (CET)
Received: from MW4PR04CA0321.namprd04.prod.outlook.com (2603:10b6:303:82::26)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 18:46:27 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::31) by MW4PR04CA0321.outlook.office365.com
 (2603:10b6:303:82::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Fri,
 31 Jan 2025 18:46:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 18:46:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 12:46:26 -0600
Received: from [192.168.195.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 31 Jan 2025 12:46:25 -0600
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
X-Inumbo-ID: b05af9e0-e003-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rL3du09rngXkUfki9OYOwX4p8LSgqJiquRLXnuk3oZNLXM4LdqPFzvTrm72yoCvbG0CR0vpaW465vtlP6eP+ww5G8J7DUBRNusXw2Jzjz7C4RPF8h94k2u8P0KxDRMgirrfhdeVVpnccfDoTu+MInLEdttllNWuri9pdNISL/acNcDCgYoWG6V1xNwZJqIRyr9bNWQWxREzxL6dGH3hFKwAi6AYcFA63FMcfBals1ipRqYRC5m/5LGRgT8BY0WIU6o2CSZUz5S2PK1EFC+xuu2p0RNCMAhfWk63rVULgx3PJXYnFb4Gs5RGg3t0t+92yyYORPsKtF4kVX2MlZpSYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RS8pnDL1dA37YFpaS6K65r43e2EqQjnBbYBrBpOrdzI=;
 b=eRXqJpwPsJCY3oHH1ABGR6hi5isGqyzp7MJB6uZ2SQiIk3nJHjPe6Yd1YL1R5WM5sVoWj7XQKe+kAqSpMYCBYfTcHYw9DuJhrDOHs78j4i2s9p6h5CTYyGf4DxNlj0zFaQdZZPGe6P489ofekdTVElamB2CSPAVXruJ3L/KllyRLGQnMBU54Eq7zHxKlnOFkW5A+h38bIGWmj8BxNNlzvU+vZlh1ShEysbHqUBPtIlsGMVfW1k3c0oDPiGL5ZM0Yqg9JQCJt8pLfILGGp29m61SU3npuBxh/6gasIS4S0/sseot6Rnv+dqZH9C3AW9DilO+sGdZorq1vygYG3VcnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RS8pnDL1dA37YFpaS6K65r43e2EqQjnBbYBrBpOrdzI=;
 b=YQ1gGRn8Jll0jTUGfOHYHZYoy2iygeRVB6rh4EsQIZm7/ZkDRxpEfJKEutqvF/JFQo0J9qXELkdVcbUyUzl9BhXWThPQo9m+MEayLA6KYsBM0h5/ce/jTLSs9yeu7OK1m+BkwHlBVsPZ0iFKJKQfMxqgsHLrX5MuSjYkhYOkQsw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <34b2949b-5a3f-4659-a83a-f7e0dd4a9e0f@amd.com>
Date: Fri, 31 Jan 2025 13:46:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20? 1/3] AMD/IOMMU: drop stray MSI enabling
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <ea0fea03-6002-4fc6-86ac-19598c9d9ef6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 427143ea-c8fd-4b38-2731-08dd422791e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWdhbi9LZE5kaFhBRWxGcFo2WCtSTmRuQ1BwVHgxd25GRDN5VUluaVJHUzJS?=
 =?utf-8?B?UE5zMFBjWVREZWM5blRpQXNTY3dkK2tzRkR4N0NPNWFtRDBpdENJOEJSdUYy?=
 =?utf-8?B?MGJSTkI5aHY1UjNKU2JOcnhsZTVLN01pMEVXWWZOWW16K2J3U1N6TFVCeER4?=
 =?utf-8?B?WkFvM290UmU5a0MrejJmNnZRb1kva21nZWhKejJEWnhDQ0JPRUVHZ3o2cHpq?=
 =?utf-8?B?d1NGUEFhK2N2VVhUZHEvd1R3dWJIM2JwdkEzN25HMWd2eXV5YmVqano5SGth?=
 =?utf-8?B?QnJaak5FM0doQ3VFUUQwcVZKUHVqcDlWakRiWFlpeDFJeE9HeU1BOFVzUWNP?=
 =?utf-8?B?TGhEeDJ0R3UzV0orSkZTemQyczFrTklLOHpwc0Jxd0dMeE1EMGRtd2o0QW5F?=
 =?utf-8?B?Um5XSUtSZkRCU2xqZUV3ODlJdGVHZzJyR3pwblVrQS9FYVRTSjdSNXcyR1Nt?=
 =?utf-8?B?cGZoaFo1U051SWRVeXowbE9LZGJ0NDZHL1RKQkQzc3ZQMWgzUHNlWjIxdlp2?=
 =?utf-8?B?d2gzZkVrNVlNdGg2SURoNnZpUS9pNFlvMnRZMHRLTjM1RjIvRDMvQzczSDg2?=
 =?utf-8?B?Z3VzcUFwYmczZG1pU1drSVFJM2hvUVFiTTVvNDgwcnJldmloNitDekk5RUxa?=
 =?utf-8?B?SitHM25kVUR0aFZHakY2d0hBSWc3VDNicWE1cnhHajFraEZLUHN5N0pTSDg5?=
 =?utf-8?B?RWhUUnZGTlh2ZVVTMmxCWEZIN3BHcGVINXA4Z0l0WHd5ZHYzYStjNkgrTm91?=
 =?utf-8?B?OHVDc1hHcUNhaU9JcmVJUlg3aDMxc3J5THR0WmpjR2xBVnRCeHpQTENjL1J6?=
 =?utf-8?B?ZjMwVUJtNTVqczVwczhtNmh0Qzd2T0VCY011Ry9sK01jQjExYzNZdXJ4a3FP?=
 =?utf-8?B?NWYvL0lWSVVEL1Nhd3dldUxKQUFpY0ZTZWw1bmd3U1NnSTJ4ZnFYbUJQRHEv?=
 =?utf-8?B?NHJOd2k2L3YwZi9oNk1RTWRtM0N0NXhrK1pNSTdDYzRoNnpSYU44RkZwZlhT?=
 =?utf-8?B?QWVwU1ZoWjdHMWJwM01OTzF6dlRLWWg5elBJbFFhd245TXU5VGM3NHZjUFlx?=
 =?utf-8?B?ZVNkVlpUY01iNUd0eWkvNS8vNWRkMFdXRS9qcE1WNFlTM1VMZ1U5QkszTkFh?=
 =?utf-8?B?TGxXeUFXR1J5akt0bm5mSGRQK3dHanlwTWNYMGJRV0N3VXRiSVJEU1gvd0Zq?=
 =?utf-8?B?UVUyQi9UL1lqR3ZrS3QzTEd5SjdhR2xsdzJzZGFISHRiUUhXS044U2phZFh4?=
 =?utf-8?B?STRLTnpvaHpsYlR6M3ZTa01ycVlsY3p0bkExUnpxWUdkVzVldk9pZHk1T2lR?=
 =?utf-8?B?Y0NCZUVHMVdPK3pYUC9RWVpiZko4dWtsa0Q2K3FsRVd1VEdNdjNjcFgvWk5S?=
 =?utf-8?B?dWc5TVZCY2tkK1hNaHN4V3pPclZVMnB5TEZCRGl6N2Y3aXNWWS9GcVVXOGpF?=
 =?utf-8?B?ZHZiTS9vbDZwTkFBSDhKWTdjbUZHT1BOeVArbTdpd0JwdGZTSmZvSUQ4bGxJ?=
 =?utf-8?B?V05CSFlGeFRIRklUelVOa3owVlhXdkFEUlljVE9XRDl5emd5TUFQbVpjVzBa?=
 =?utf-8?B?RGJSRGlsRUtWcW56eExIZ0pJUGdVaGNYa25idjdSNzdtcGFneEJhdnhwMFFx?=
 =?utf-8?B?OFcwUXhhWUxZb1NwQkswVWlacE9wWTFsbzI4V1RLUUkrSVErU21WV0xGY2ph?=
 =?utf-8?B?azZ5ai81dk9GZ2sycm91Nkh5SXd3NDY3V0w0OFg3N2tqc2pUYXEwSkQxSUw5?=
 =?utf-8?B?MDlKQlY4TXJzTnp5U1NzWTZPUndLSXgrVWVkYXM3TDZDZGhnTnZ3d0hTOWRx?=
 =?utf-8?B?RlhSWGxzM0ZiSFNiaU9IbjVjcHIxMWR5bG5nNGpCajZkUjRTV3ppclI2WUJo?=
 =?utf-8?B?REpQL0wzWXdlN3JvYlFyQ1pNbWcwR0tQWlNhOGxqVFhENHREUkhQQ0Z5VWFD?=
 =?utf-8?B?eU1kQXI1WmtyMnNabm9tV2E5NHBmUnpFUGFhMmNsd0s0U1N3b0xTM0hiWGcv?=
 =?utf-8?Q?MTNFxsrYu6LLVmWx0fWyhohd3RvU8o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:46:27.3525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 427143ea-c8fd-4b38-2731-08dd422791e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570

On 2025-01-30 06:11, Jan Beulich wrote:
> While the 2nd of the commits referenced below should have moved the call
> to amd_iommu_msi_enable() instead of adding another one, the situation
> wasn't quite right even before: It can't have done any good to enable
> MSI when no IRQ was allocated for it, yet.
> 
> Fixes: 5f569f1ac50e ("AMD/IOMMU: allow enabling with IRQ not yet set up")
> Fixes: d9e49d1afe2e ("AMD/IOMMU: adjust setup of internal interrupt for x2APIC mode")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>

dom0=pvh on CPU *without* x2apic support.

Thanks,
Jason

