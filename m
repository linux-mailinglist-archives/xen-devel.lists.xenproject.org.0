Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CEDA42094
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 14:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895168.1303771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmYVD-0003yO-Dl; Mon, 24 Feb 2025 13:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895168.1303771; Mon, 24 Feb 2025 13:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmYVD-0003wQ-AQ; Mon, 24 Feb 2025 13:28:07 +0000
Received: by outflank-mailman (input) for mailman id 895168;
 Mon, 24 Feb 2025 13:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vo6Q=VP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tmYVB-0003vs-SD
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 13:28:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:200a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26ea4a89-f2b3-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 14:27:55 +0100 (CET)
Received: from CH5P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::11)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 13:27:45 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::f) by CH5P221CA0020.outlook.office365.com
 (2603:10b6:610:1f2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 13:27:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Mon, 24 Feb 2025 13:27:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 07:27:44 -0600
Received: from [172.24.130.211] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Feb 2025 07:27:44 -0600
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
X-Inumbo-ID: 26ea4a89-f2b3-11ef-9897-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdMe/xPA9xDArh45gx6yu/rmDWSB8RigKtWbUTe1hN+PBWzzbvpBV72yYnRZcmpg7i7F8GKiUH1HvY+V4Fig/BS50mkjL6keqKYOjdBLvNfQld4yeUkMbFCu0p0JpmaMerTYx9tzz3xPE0JaS2S2Z9P2OAxNBzTsZ9Zoj/huYGrOXgt6urMzjOa3WSzm6/VsFlwpKVW8Na3muByPnZ7v8mI9eDRBuiMnFsypHEvqMmqXu7vo66ZN0Qe1A8/tcavupNeNnaz3DmYpghlqpbyRvCjwaDNSG3ib+Yc1kNGFHf12EtS017n0d2R3saCN0KaNZZmCkI9Y3dh9LjU2pX3UIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+8L8GW9YuOtnJ4f/ZEsdvLJd/Y+CkVyoSzuBXlh+f0=;
 b=HuzteEE/TpEJjix9KoRv/VYn75qEtlxdBpwGNFdKjTT01K5VwBRpB5IvY0vbUyDMBU7wnUJ5wFcOo0Xn9g+0+sKg5j1SMk2dMmkqp1sMk117zu9ipgcvk/Nsr4WvN/AVTl4bzW0TY/Gj0k/yl8t5odu4eBjS4xqTT6LyCBbG2YkCWb7WWXKbc09uz+KE5NRKpxpw5B1ZLUTUhNOnWicc/soVSuSOoCnCR7HHuFQMRS+PaHSzk3jYj6ol2dJ/6JrJkA4mP85cdvosDhWz8aUre9hYlMLLKG+sC3EgPpTZlDFH/1mMiS4E+8NKWjXv22DbbCS0kPKS+MHtgDJyqkZusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+8L8GW9YuOtnJ4f/ZEsdvLJd/Y+CkVyoSzuBXlh+f0=;
 b=ka5Khv7oiF6wryt6nd9tUk5qRVlMAQbBOxv4BRgZ7PFrXDL54QdaS+nmQ89n9bFB/PBu/oUMlLBeKUbU+09+9YrjkwoUTzDoczy/c2hcQpQJCryvEGl7NuNqMTH3Ch/MbYaKp7cB7ye2ztiikNFZOHv2HsRAKliAet63FDnk5w0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c72f8bf1-0161-40b9-b4eb-1309aaf141dd@amd.com>
Date: Mon, 24 Feb 2025 08:27:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: Fix git-checkout.sh to work with non-master
 branches (take 2)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <20250221223432.882705-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250221223432.882705-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|MN2PR12MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: 072a1bd0-d7bb-4dab-89cd-08dd54d7060f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVVyK3RGRVFybTVwaC9qaVlMQnFtSEhBTVFldjFTMGpWR2VJSzlJWklBSHJH?=
 =?utf-8?B?SzdteXhWaEc2K25kOXBzaE5WT1hucTRlS1h0QmxJaGNBNCs4cDUrdTZqNzgx?=
 =?utf-8?B?NUpRRyswN2w0ZzRsSGM2ZDdMc0ozbHZaUmR6OHh4VVFqL2tiRnMyU0ZSakl1?=
 =?utf-8?B?Tm5MVGdVTGVBRm1KQ0NNSEluWWZtdUZ3THUrUVpLTUJuNTBTRUJEYmh0cTNE?=
 =?utf-8?B?cGRJUzBkMGxlOTFhcHN3Y3h4QmVCSVg5VHIxZVRNRjU0R1dFb2U2dEdmK1lF?=
 =?utf-8?B?NW50NDFTQmlON1g2cGlrS2xySGl5cURFSWN1SXRDcGFsZG8wcERCVjh6NHE3?=
 =?utf-8?B?ZWpOUWx3RTNlS1BuNVcwVUN3WmdSRG56WFBhVDF1RHVrZVpWcUpvdjJtK1Ft?=
 =?utf-8?B?VEM1YXN6NEVqd2haUk1UdE9qa1U4ZFFhMVdZQlJOTVFBQ3lUQ2htcXZINmNR?=
 =?utf-8?B?YWhBRlJVNW1reThHa2N5MlBjNUFTdmlFUXdBU01vaHpwNC9OYmlmV1RlM29u?=
 =?utf-8?B?a3UyYzZaS2FtVXJKeGNuS2g1OU50M29FRlBhRGE1Y0RRSVAzR0lkTHpDU1cy?=
 =?utf-8?B?MmkvSTZLbmx1aVd6MmlpT1V0Q04yR3cvYmppdEphTm10QldWU3lZcE5aWEVr?=
 =?utf-8?B?OUZmQmpjNklsSU54Q2xUL3VVaGJYOWFKdlI1UjBpWDMzTTA1OUtFNi9TZFgr?=
 =?utf-8?B?RFZSRlMzQUJTRGVkZFZIb1NoYWhNbDVCOVZJMmZ1TU4rS05mS0wvSlVjNGJG?=
 =?utf-8?B?d2Z4UTNQR1FQR254TTcxRGdhSktlbXNZU0JHaE9IYUlDZXF1eTJRRG95NmNM?=
 =?utf-8?B?LythcTQ4WksrN3FLK3B3a01XV2Vtei82b2FUUGUzb2Z1MmRNdTR0SG1CNTRC?=
 =?utf-8?B?OHc1OTdscnhudG84Q25ETEp0OGZPRWRQNC8xTDV6ZzZSN04wWGl2T3pBSjBB?=
 =?utf-8?B?Ynd2aWF4Z0dDY0RrVGJKN2hBUitjcHNsLzhkZzZKL3hwUUdzeFNVMVBEQzYr?=
 =?utf-8?B?RGtIZE9YOTE5UVJlT2cwZGpzaFh0bGN5bEI4bzRlVFkrMVBxUCtnbEdKTm5m?=
 =?utf-8?B?R1d5Vmk2OFQ4M2JRZTB5dk1qVjNtcEZzdGQ0ckMzT2dKR0k3d01xZW9tbXMv?=
 =?utf-8?B?WEZFZlU0Ym5qQU03SEJYaHRFTUIwdEVHVHR5d1FOQmZZQXhMV3Mybnk2eXhw?=
 =?utf-8?B?MlA2bTY0RldYZzdmUE8ybkk0NmsxcXhLa3VCdnNrY2VvVmJTdUZXd3pMSGdj?=
 =?utf-8?B?cDNNL2R2ZlJIZjViVHBNWnVTaTFJaHg5cGplYWJXRUVXZ1diOHZXVTY2Mkt3?=
 =?utf-8?B?MnEwUHF2STdseVNqQmVoSU1sMlA2blg4ZElMT2R3WkdkNXhYeXgyREwrNjY1?=
 =?utf-8?B?aWhqcnZCcEhiMEZaZnFQdDN5UzJ0UmpvTUNlSDgwQ1JFMDZRV1N5Rm12YVRV?=
 =?utf-8?B?Wm1GeGt6VVRnMlNaaHJnTXRxdjMwcUJFaEJ2SUVQV2M4SWV1Zy8vWnpQK3RR?=
 =?utf-8?B?dFhEUW00eHJyTHQ4QkFFMHVZZ1FGNmRJRnpwMVNJZ0xvTUtKdmFkVEdhYkow?=
 =?utf-8?B?U2Y5REVvMTBDK1oyaWk4VmgzU1RCVmdmMjF2Y0JQM3RRMVVETjUyTnMxYklT?=
 =?utf-8?B?R1hiWVdyOXhyNjFFMVJTSzB5VVdRTGxMZ3A5MHRLZUZnajNsK0duOTNiYUlP?=
 =?utf-8?B?VnRCT0F6RktFREtxUlZNRGRrYlJ6MWxWL0VtS3AzZGRxMjczRGtjb0FXMUxW?=
 =?utf-8?B?aHJ1TjAwVkdWRVMyR3g5bC9kS2ZVSDFiUlpIemxCQ1hLUTM1Wlcwbkk1ZXB6?=
 =?utf-8?B?dE5oZXh2bnNyanVSaHNTVVJjT2hXVDlLbXl6cHJUdGxUZzhoUWU0elh6TzRt?=
 =?utf-8?B?dkZWQkxrUEdieWdCZWpWenUxekJBclZ2QW9wanBXdDRNYnNVdUNqZjBaczJs?=
 =?utf-8?B?KzRZWXZkd2IxNnlWQ1RKU2pacFEvVDhLd3lLUS9UQ3RUSjNzZlZrL1dlQlVH?=
 =?utf-8?Q?ctlcxx2CNyxGifTOSPTfEbp4PhvT3Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 13:27:45.2080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072a1bd0-d7bb-4dab-89cd-08dd54d7060f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128

On 2025-02-21 17:34, Andrew Cooper wrote:
> First, rename $TAG to $COMMITTISH.  We already pass tags, branches (well, only
> master) and full SHAs into this script.
> 
> Xen uses master for QEMU_UPSTREAM_REVISION, and has done for other trees too
> in the path.  Apparently we've never specified a different branch, because the
> git-clone rune only pulls in the master branch; it does not pull in diverging
> branches.
> 
> Fix this by performing an explicit fetch of the $COMMITTISH, then checking out
> the dummy branch from the FETCH_HEAD.
> 
> Suggested-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

