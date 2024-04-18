Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D78A9F95
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 18:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708518.1107500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxUIJ-0001za-Ua; Thu, 18 Apr 2024 16:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708518.1107500; Thu, 18 Apr 2024 16:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxUIJ-0001wn-R4; Thu, 18 Apr 2024 16:07:27 +0000
Received: by outflank-mailman (input) for mailman id 708518;
 Thu, 18 Apr 2024 16:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOTl=LX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rxUII-0001wh-9b
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 16:07:26 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcc8702d-fd9d-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 18:07:22 +0200 (CEST)
Received: from BY5PR17CA0007.namprd17.prod.outlook.com (2603:10b6:a03:1b8::20)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 16:07:17 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::38) by BY5PR17CA0007.outlook.office365.com
 (2603:10b6:a03:1b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.27 via Frontend
 Transport; Thu, 18 Apr 2024 16:07:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 16:07:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 11:07:15 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 11:07:14 -0500
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
X-Inumbo-ID: bcc8702d-fd9d-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VScJpLV3JLMnIf08jRVQ8tC+896hfqB/HBfK4m3V3Sjegol8TPgvvI2dgOCHj0ejTTQ3/XOa/CuAtUliSV7gW+ctEqKvylywYBdIXTUSUIKfxKKpbzMvIFXAv3nwSpozgX5yxOPjNLT/CoZyl5rfZTHEnrH5isqBM7qFNLlRz5n+FRQ7HF5BmP3HBsN9pkItWyTB9htgCKqnD0MVS9MAwWmmsasyf+EEf6JHZpwLfu2zYuWYGkWBCWVsfpC9RQJ6XpCS0H8OYh71vWfTWn+GQfntaWcHckWPf6jALJeyNJFfua8RKMsubzSGbaUDJbxzzuv9LuW1PW/6H0hgOmFRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp89nXlE484aF/SogIXg0jLTRzLzbU7LFmPbCM15Q2Q=;
 b=f71kx4YcOwnkFU8PwxvQUJ4h8ZcF1movja17W02naDKslLkbKWBpDkMohinBjwjnC2FGmfwkP+VzqaUl4RQBOtkMe3lDEPpju5J1tFa2PIqqePyh7T00zJ2BFYfj/LSnWufxSwmn1Lx0s9XWEDmHRcNIBdwk4R96JNXXKX+GxJr0k9aIWOXB5QfwXH3IkV9xY3+RGoZagwxUd7CqW2551NLqyqqz59Yjwn0y4TCWZ9xsm0v+WqgDlRxik4xdRttRlaw6jV1itS1qKRTdO8CGuoO5nMVX4cFkOOCWF2wl4Ol7blARntBuh0ujAOa0GijusOrD52Vdn9BkXlMMPIvW5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp89nXlE484aF/SogIXg0jLTRzLzbU7LFmPbCM15Q2Q=;
 b=dGX1nyRGTZDzR7YKz6OcttfkhhxIzC5WcIaW3U5EH9lo7AbU/OLmWrHTECyt+QJ7wYN98GR3JE+qElsK30pNohbfruFlsbEcxaujZodnllc4BBhwn24WFTw8mJ4blUoHHP0anpG8mBTrN5AgOa8dj8s305WgxTyHBf5NSHRdn/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/PVH: Use unsigned int for dom0 e820 index
Date: Thu, 18 Apr 2024 12:07:13 -0400
Message-ID: <20240418160713.27101-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 75df6c57-e041-43fc-47b5-08dc5fc19de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JZrBPGSrf2bTz8QIL6c2SpXszP8ysdVqrl7ND0J1gKZehDtTz1sqQeeZRlzv?=
 =?us-ascii?Q?qSwouYd1m5OEcnlDScJAIhf3N11ol2sbEZCV2nxtlo3rBbCaahCAQOdu1Kil?=
 =?us-ascii?Q?+W1BxGQx84WXg5RBQj7y3mTAhVYPKIj1dichi9emUp+3oVv0LOB01UQhzaQ8?=
 =?us-ascii?Q?Nvu7cckEVNAc0S076dfK+unIOrOl345WwP5I3xOd1FRP0XoZsFfS3ntck3S3?=
 =?us-ascii?Q?s0jtjGeMtqoCx7YPcQOfPvnWOBarJaE9L11WJN9pFgVk5mRLMOVk8p2SG/Kg?=
 =?us-ascii?Q?2Tr09OhpkBUiWj+01FkgmFyrqerOZAZrvac+khWvNIjdXnecSScYLPsagxR9?=
 =?us-ascii?Q?eXHvO1AF29LCoIqFEtyut+NDUV3YlUb4/dosYa6yRIhGbU9i0VSlIgEi/YqC?=
 =?us-ascii?Q?9yfBf5Y5GHgdZh+CWuKJp1y2+KApbAs1XSTPKhdmXpF7f6IBlFMzc1fXSAuk?=
 =?us-ascii?Q?M83L/kIZkPdJsUbfTuvUuRWuFKl6vxdO1fcW2es1Db/LPK5ZPtBGv2JrUYOW?=
 =?us-ascii?Q?1sFHsyCmoODh/hjXrN+It6k9RT3DHDPCGSGJcRZqz6tXW1wjbdNpxVI1wjkZ?=
 =?us-ascii?Q?zFGLHTcsSo++w64a46jCBKT0kWRbCAGO2O/woS8Xb3Fj1c8UG8K2Uf/Iu0Cy?=
 =?us-ascii?Q?QKXzrkZHoYIhJeng5s+lwVlz9AY44gfBMOBQ+5oUy+2R4r3vZqxRTAOqGRZB?=
 =?us-ascii?Q?Of3JI7JSc+79U9/gJ0nw+0UroPJvW3LDZG9GkUNyrSEduiQgEeCiD3/6xoz+?=
 =?us-ascii?Q?3hfMiqfcgGIQyFhJT+pMwD0XjOoRvSgTnbKJ46s3zwYhQitpNzVqi6jJtEaF?=
 =?us-ascii?Q?XVRCLNLSJQcNk00LrFRG4nAfBuvF1tyzEO0vuy+9I9dsdumENAiPbAx5okCF?=
 =?us-ascii?Q?dul4rLiu1ET5N1ZxUJlUDKkpJZv9TA/ldr2yoaMz2Mpy5W2aequyXQPELsrX?=
 =?us-ascii?Q?NDCi7RCldvr09hAYnRGLwoFxP55JcigHrUCGuo02EF6wiZghOvA0kqGFCr0s?=
 =?us-ascii?Q?J0mUzLidKAQBaQ4Ru9er775EnEYR/njnqGOn8hQKAahaue5ahPVlV9QWN0Bb?=
 =?us-ascii?Q?WyC/letMXCxBhLTcj0rcQGHdHv79buiO0iQIAkqkouZRcFxcvB+SXNbOklCy?=
 =?us-ascii?Q?Eh2f30cu9nqavXBJLDDsH64oJLQwhSHpAxIWzzIcvO3h7Gjh8q+w0AyQgnrl?=
 =?us-ascii?Q?tqwtTKoVLCKNyc6W4g9J/Kai9f9FkitezUsU5XzPGwBH+VO1z/3PQXBoOuLB?=
 =?us-ascii?Q?/Bk8/EWTu8w10r9KtHmWZkc/0YhQbi2cB4nbBYMf8e2b6hk2kV4vCGQ1ox6R?=
 =?us-ascii?Q?0Oh+jBxePxZXGPedRiz5WzDjeyHAvZCb5KbCg3mNeWX4Hzyl4tMiYikYeB+d?=
 =?us-ascii?Q?x8osvH0FIyVkgpEIhXhtYYQU0pSy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 16:07:16.0828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75df6c57-e041-43fc-47b5-08dc5fc19de4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577

Switch to unsigned int for the dom0 e820 index.  This eliminates the
potential for array underflows, and the compiler might be able to
generate better code.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/hvm/dom0_build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index d158f4d241..ac71d43a6b 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -569,7 +569,7 @@ static paddr_t __init find_kernel_memory(
 {
     paddr_t kernel_size = elf->dest_size;
     unsigned int align;
-    int i;
+    unsigned int i;
 
     if ( parms->phys_align != UNSET_ADDR32 )
         align = parms->phys_align;
@@ -579,7 +579,7 @@ static paddr_t __init find_kernel_memory(
         align = MB(2);
 
     /* Search backwards to find the highest address. */
-    for ( i = d->arch.nr_e820 - 1; i >= 0 ; i-- )
+    for ( i = d->arch.nr_e820; i--; )
     {
         paddr_t start = d->arch.e820[i].addr;
         paddr_t end = start + d->arch.e820[i].size;
-- 
2.44.0


