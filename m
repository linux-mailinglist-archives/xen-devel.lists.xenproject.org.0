Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3088A00D6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 21:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703595.1099322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudwT-0000xR-QG; Wed, 10 Apr 2024 19:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703595.1099322; Wed, 10 Apr 2024 19:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rudwT-0000vd-NS; Wed, 10 Apr 2024 19:49:09 +0000
Received: by outflank-mailman (input) for mailman id 703595;
 Wed, 10 Apr 2024 19:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkSW=LP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rudwS-0000OV-PM
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 19:49:08 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64285fb7-f773-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 21:49:08 +0200 (CEST)
Received: from SN6PR01CA0004.prod.exchangelabs.com (2603:10b6:805:b6::17) by
 CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 10 Apr 2024 19:49:03 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:805:b6:cafe::ea) by SN6PR01CA0004.outlook.office365.com
 (2603:10b6:805:b6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.21 via Frontend
 Transport; Wed, 10 Apr 2024 19:49:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 19:49:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 14:49:03 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 14:49:02 -0500
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
X-Inumbo-ID: 64285fb7-f773-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItA2HYzklBqNdbLijzteMpEt8IpC1bHrV/OcdtY2oblEm1SpOdFX2kfpKE6Hu1jbantAJam80Xu3nspDU9ppoUWhZ8Nf/8ADQVgR8G5m7DxoJEziRbrQzNVU9cQz//XdFnyasRG6MriP2K5yRtXXBRWP4rWEwNlmEAgcFFldWfFbPHw/MVCCSRCvc8xBI0SPgfLxLa3yKPn0jBo8cSc5utR64ggaIWce9nKv13Xn7tULaHL6dMvXCaEoPkmi0QNGLDw6itJGrc6sflhZFz1HQwO0fzpbfJLKZ7R7oGqGNH9RgKUPn5EEBtn/HU8GSt1QOpw4DXwv+jKVLHPFdCb3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aGShkfhPfFFWeAFRLHJuhfTDAE6nHPfx+9E7Z29HTo=;
 b=cTSirRTDi7jJFDA8LmODI4Xd1BIGOC6Hu7ZEiR0pDcqfBatghRThIGRXZXf0LoNJn8fCZe7hTBXjDLT6yggwhShpdWPBNZNAsvYA1BhdOVpBiFwVYxdIc5OObNHQQP/nJbDnwd0kaFcWdYEF1LPTCzF+gtVkfYL8U/qk2IajIzUtaY2yFtjvEnT2Pdew0TJlSzwTEBobKR617XJWqSgNLV2+4Fiy1tXL/33Qv00Af5/ld082O5Zmq9hffUCd+XHXiUXFf4tcmGJOXOmhbWvjTGjhNSTS8tgA3gCu/EqtS/W3EM6BEyAnh5neTvid8G9BW2eqzWXvt58UZwovjhbk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aGShkfhPfFFWeAFRLHJuhfTDAE6nHPfx+9E7Z29HTo=;
 b=PDX50g03Uxd2jBK0see9BqGTAY1jxGn6sjyLz/Gn0OqSbYIecdV92i0mrmg3RMRilwzQdpGNlKH76KNeMSIO00ex65UkHTmYCybGmmRzrH+mR+/NlMkg79rE4eRIKIlUuhddRltHwe5rUtCTzrfU9HhYZ33cpBcEBXTTwhKO2Jc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
	<pbonzini@redhat.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH 3/5] x86/pvh: Set phys_base when calling xen_prepare_pvh()
Date: Wed, 10 Apr 2024 15:48:48 -0400
Message-ID: <20240410194850.39994-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410194850.39994-1-jason.andryuk@amd.com>
References: <20240410194850.39994-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b51e1fe-9d0d-4a1f-b88d-08dc5997465f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XVBm9L2PuCo/0Qc+UBqidKjVjR1Ng3tgNhwQm5HXMaeH1RzxriqOARAJ0wvTRznI28+gqoR72iS1SJBtWk8uWhF/zTU9wm8nOK9KftL7vv+3kyo6gJZalot8BbqAnUokwL6joS1OY7XCH5/aCwO6ujkF83zBTJkBB/hneMBhr4KBdw+z1zrXOx5viON23J14BXMYoiWmT3Y9oiife+5ZgiHbj0pY+ZdN+F1tjEbwIywATO8fNB/AKtfipu/ZScNwmohwCZcJxinf2jkF5k3kg/OaOiuFVflTPhaCBRES8l5pahuURX6g2jAC5b05DqzlYYzK7HdWGSJ9Se1WJnbcKcwf19Pyt0+boLne/t639/xphIfYZdYXVa7dmrup/UbKjtQ+zTOtAHjyqiN4LAf9bfbapQuaAdL0ZkI+UVuvmDMQKn8YprZkO3wWtAAsJFJCNRiQk/bD3EFlftYgOBAMz2MXkXRX63THgzXXcSWEzsk5qGhU9V3i+p95RmAUXLTV6hdcEwy8mn8b9rMskUB2sI6M5A+UPta/dXj4sT+/UeLQpWWHobcfT8eFQD9KI03QC3PGbUmbdsZOsoYBds862k8gfuKtDzFHDxyNY70Mr3gVMxn04d/YLqFSahTa395tjyVcRCOYP6pYRNT10hbVL9HkS7aumNPO10Im6csoKoLdbOXEN5rBBx9ixqnSmpvlUSTYNFkZAAybn9iX9vtnVQw+sW3/2Ake2M7jMRCCg++ZoDLNRX3N0bc4DBfoS6H4amMHVxvNRjCe5bnQDPG4gg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(82310400014)(376005)(36860700004)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 19:49:03.4754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b51e1fe-9d0d-4a1f-b88d-08dc5997465f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130

phys_base needs to be set for __pa() to work in xen_pvh_init() when
finding the hypercall page.  Set it before calling into
xen_prepare_pvh(), which calls xen_pvh_init().  Clear it afterward to
avoid __startup_64() adding to it and creating an incorrect value.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Instead of setting and clearing phys_base, a dedicated variable could be
used just for the hypercall page.  Having phys_base set properly may
avoid further issues if the use of phys_base or __pa() grows.
---
 arch/x86/platform/pvh/head.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index bb1e582e32b1..c08d08d8cc92 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -125,7 +125,17 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	xor %edx, %edx
 	wrmsr
 
+	/* Calculate load offset from LOAD_PHYSICAL_ADDR and store in
+	 * phys_base.  __pa() needs phys_base set to calculate the
+	 * hypercall page in xen_pvh_init(). */
+	movq %rbp, %rbx
+	subq $LOAD_PHYSICAL_ADDR, %rbx
+	movq %rbx, phys_base(%rip)
 	call xen_prepare_pvh
+	/* Clear phys_base.  __startup_64 will *add* to its value,
+	 * so reset to 0. */
+	xor  %rbx, %rbx
+	movq %rbx, phys_base(%rip)
 
 	/* startup_64 expects boot_params in %rsi. */
 	lea rva(pvh_bootparams)(%ebp), %rsi
-- 
2.44.0


