Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A6B07F7C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045787.1416084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aJ-0001rT-Rb; Wed, 16 Jul 2025 21:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045787.1416084; Wed, 16 Jul 2025 21:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aJ-0001bl-6O; Wed, 16 Jul 2025 21:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1045787;
 Wed, 16 Jul 2025 21:22:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aE-0007F7-U3
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:200a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae5e158-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:31 +0200 (CEST)
Received: from CH2PR10CA0023.namprd10.prod.outlook.com (2603:10b6:610:4c::33)
 by DM6PR12MB4354.namprd12.prod.outlook.com (2603:10b6:5:28f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 16 Jul
 2025 21:22:27 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::aa) by CH2PR10CA0023.outlook.office365.com
 (2603:10b6:610:4c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:26 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:26 -0500
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
X-Inumbo-ID: fae5e158-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYpy9owhui4bKpBqu/0rhQrjZSYZ62xLiTeN1Lc/fpTLFQpMmPcTeYZJTW7RGTkY57YeQv6lBf+07GwY6Q4/G/vRCMDKhgwfFEM7dkHhTR/SNDDKbWwf+KmGZ3NSGjYe6omiVM1hJJoAD3GPSkhZqxc1rQtSiGkFjjmHaaLUHW6pjPLoiuCHG2iIhuygU2K/bolBhpg7/1A7N3VhQEWZAfWt8fEXLh1+MGCgv8sDDTMVBCeINNSRctjW5xutwoHpM5O4btAwJgQqmSccgkRT0GOAqGh083xk2x9CpL7JttRNcYWP+TZMnA6RAXYvpTdHSiSwYNnKtqXVbAENiWC71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntmVC9IWFJ5GNC3GzC1iMcc39AzLXNBTd/6KxHvgHN0=;
 b=d9DtBpXOBtRT8uJO41lYx/T0reUR9U/ZeRLV9xBwzw6a/FQRxQPGkmTimLCbGEfDuJAudk0t/gNdgnvc6E19bLzs8igHxRnyNeBBPvWCANfA05fBMq7tNPJ2xD1gNcyWQdSCKhCxFzS30Ux/5TxgzJnpkN1rCaLJ6S+KqLZkhBR3s4pO9tvFlBwMQy6TClBigAlCcnDReQc8IAuOQxED+u4aXsVLwmnRG7LGe4ymbQKSbB+cjMJhhyDop86F90/UuZldL2+xbM+CeXxOs4KFdauYzrtPxIf8v4mLo9yT16gze28VBU0aUVfkOTLt5PnWVp7GhNhLBMJEclaLXpsamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntmVC9IWFJ5GNC3GzC1iMcc39AzLXNBTd/6KxHvgHN0=;
 b=aFITiXfGnsjYXnHGEdCvSoJqQUh++edsfnweakCREzPhn6FH2zE6PNj6SKuyOurvOhXNTAbXfjUElWii6Ds5Ic1Ybp+brg+aAO+MC1l6mNxjjaI633Sr4nk5RBFATiar7NVlLYuheoNvI/hU2yXLD6O1aO1Qfq4K2gShaiUqECI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v2 17/17] tools/init-dom0less: Continue on error
Date: Wed, 16 Jul 2025 17:15:04 -0400
Message-ID: <20250716211504.291104-18-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|DM6PR12MB4354:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a37be6-1664-4cae-a45a-08ddc4aedd58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?43KGu63Hvfxn20CVQjxu6D0/lW9JrJH2d9NjZb/QzAIDhjOZLQrHF2Sldlrv?=
 =?us-ascii?Q?W+mdxiBAo4s/zvAlK7JKSeiI3gI/SLN4Re4OsErWxh/4i68ExYckwcF0eTNR?=
 =?us-ascii?Q?obiQ6IlYq9CwEgB3310kVxIE5T8PKjwUz3CzsC1ONUwfVoC6GVJeNTzA8yuv?=
 =?us-ascii?Q?2G97kQ1qq9lF5kz4in530ImV1juPKQgjKEG2BRthQ1ZLP4o9MhmapHkpGdEC?=
 =?us-ascii?Q?0DpDD+BhbEyXYAS8kjuXo2yZmHEv9At42QX46hGGS9g8NUobEKkf5EIHrd5u?=
 =?us-ascii?Q?wGUz+BXLE8siC2ylDPFWzu3Bsl3A4v1YMsRL0wiU3SgwhO3GPHq9ACOZIeD8?=
 =?us-ascii?Q?vIm7Ztl/BP/cK5smbh+OcD3N91uR2xW7D+0pmfnv8iZgtDgL1DCsphFEbN0H?=
 =?us-ascii?Q?Gq8BaGRHssQ3ouDVh+VyqVyHtxYoHRqr2qK9xsukHSOihkQXRn10s+QxwqkI?=
 =?us-ascii?Q?H+kbKVhavhI9Rr7CNIO9cTkydN0pObBsDIk1gSWLs0t4edKRGuPO/R6CJXZ8?=
 =?us-ascii?Q?n68Glgh/9y8yJbcXS5Th5ncVzxnRlhMZ1KJM9McsoK90H8doWBXvtNaSCCNe?=
 =?us-ascii?Q?yA0evKRdxp7UcNp2W0sivIvRQdRmEdKMpnRDlmr0lObxLxe4gbWdEXjvtaPN?=
 =?us-ascii?Q?Dw6CIhuV7F3XqX6mMQlMzkWDWWnR83DTnRwWenYmhLHfxEKOEi8odQC7blEy?=
 =?us-ascii?Q?VqROIGK7DGtq/50qKL3+ly5Nnx9MmhFCmkBAYgo3nJJx8h8kDhEliuykg5Xk?=
 =?us-ascii?Q?RKJR7Md3x8jKDHm0BQj82D9gl5tXEhgeft4UwR8MfUF/stCPB9mY+RCf6HGE?=
 =?us-ascii?Q?CsgZo/ArbhNNw+yF6Armm2uZHLrfDc/EaKeoTJfDMEZzLa5F2VlIOZwxOG4x?=
 =?us-ascii?Q?oTFbptQ6r2MbEbs1fpQTrDLWEjxWPOUFqdPrXCw2cTKyrmEjO5bG8mbahMCQ?=
 =?us-ascii?Q?sasauMJ7Vc8PG0WvSxAV0q3iK1y66FV5pTGPVOgRvB6ajovO7WP6oo2eB5w2?=
 =?us-ascii?Q?StLK7GvYNBAm2pEE8k8JI6cLahvTSnRS+edA4TZLMLCfspqIH0lGQd7C8hGA?=
 =?us-ascii?Q?2mFRcVofajkySJS2TCGNUhFUVunZzScZFlmIZgAoZUM8rhTDpcVdnGzuKHxR?=
 =?us-ascii?Q?1z0Xl9wDdvyHGo9vl/FdNWb8Uh0SCEnKjYXpmJCZToT8rmCwRDkAVbu8rEPZ?=
 =?us-ascii?Q?SX/Xf6kqULQUGW9HfmUDT7oLUbJ7sAj+aRcJtznq6awXyrxWJNfSYdMAN2Zr?=
 =?us-ascii?Q?9oS9tFZhrzxkGMiHjHFUh2A+Z5bXpQkqMiWrX0aa2lV0HCICbRSCzB1qkmCY?=
 =?us-ascii?Q?Mk2kjCmUbNLYEvwA711wGq61EuE3qRNde+2PjDesqHk96e9m5cSwXGPPOYkB?=
 =?us-ascii?Q?cK/Hha4aFPjkHTB7EeLRItNGfAJY4f9EsU3Rc02W4Pm7mD9FgAHI4ocme7Up?=
 =?us-ascii?Q?GvpicsI01BDh6hUT6QmVY6r8vDgKnmJuuI6kuBnBl6sfEvDHXCGhJq0Zb4W9?=
 =?us-ascii?Q?G8HSc4/bSZQHF/WhHhvnZzx2bMZFuXaBM36P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:27.2610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a37be6-1664-4cae-a45a-08ddc4aedd58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4354

An error on one domain doesn't apply to others.  Continue the loop over
all domains if init_domain() fails.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/helpers/init-dom0less.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 4336e0f418..bd213c5ccd 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -377,7 +377,6 @@ int main(int argc, char **argv)
         rc = init_domain(xsh, xch, xfh, &info[i]);
         if (rc < 0) {
             fprintf(stderr, "init_domain failed.\n");
-            goto out;
         }
     }
 out:
-- 
2.50.0


