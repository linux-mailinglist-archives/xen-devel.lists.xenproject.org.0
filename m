Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D14875C28
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 02:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690077.1075758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRs-0002dl-Dx; Fri, 08 Mar 2024 01:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690077.1075758; Fri, 08 Mar 2024 01:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRs-0002bl-9q; Fri, 08 Mar 2024 01:55:00 +0000
Received: by outflank-mailman (input) for mailman id 690077;
 Fri, 08 Mar 2024 01:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riPRq-0002aR-DV
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 01:54:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd69a49a-dcee-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 02:54:57 +0100 (CET)
Received: from CH0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:610:b3::32)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Fri, 8 Mar
 2024 01:54:53 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::83) by CH0PR03CA0057.outlook.office365.com
 (2603:10b6:610:b3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37 via Frontend
 Transport; Fri, 8 Mar 2024 01:54:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 01:54:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 19:54:51 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 19:54:48 -0600
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
X-Inumbo-ID: dd69a49a-dcee-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSs6ZcY4ffWJ1SQDXMRasVmV/zSNHo7EaKF/09azEe7oYUggQnqd1cZUL4iSQcoKRP40SUZsNks1hNOncxJtXZv7pM62himqUOtEALk7mcBVysjpDPasdvFBMbtIDP7Rga64nZEbjFJC9uzTuv43WoOXgatCzDesbVzS1x7g9jxixfeBAZXhvw0QHIimZ0+kst/AD+I+SetOOTTqpbxL/ChfIEfZQZ3ZQ69pLUl6IlhLL2p/bG7dQi0bGCj1/5f4fYOMM/cvwTevCGIsluOL2pBHvFtzneQPpp+ssza+SweQvElqirrGLQ/3x3RWT6yFMpdDhkJimyY8XZnG/Hvq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTrQweeqJ5wfSQ1EelNhRROTV7nnkDh3tQqIf7Bk5jk=;
 b=ZK+zljpj6ZIthlzADNJbbkaTcBGBTpgEwqgME+dVn2b3SG1vze20wwAZa66cthI9eHiUcBCSVvvLXXvCDuq9AMKaqkvQroJVhuq14KTwAm/HeyVpts8g5BgoFCAea1vQZJt3MyI6IaJhsZ1cmfBoErAs8jF2PCcfY9JiqbLCwpClatLmxj+2OjTM+yzgsWYFcDaydrjtyPiL9nBeRB0SaU9BCC7FS5HZtsEnplLIAkcB3WjGxbBP9UvwaX+bTp00gR/GkRECH9jFlrgSQPaN0uPTEXzYy3/q+hajVjQEKlcq1MDXmh5pAvlqK6dExOKf3+ACBCtWjYQVcWDP7tTolw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTrQweeqJ5wfSQ1EelNhRROTV7nnkDh3tQqIf7Bk5jk=;
 b=VeCQykNFOg29ITZ3pXoS1YURxh6H91pI89/X2qSPnw27RvnqmATj6hYk3YHpD5c1fJSEbL4oeaW7FuA3cSVZKwXtCOLVtMW6rgBjd8VKAO/8o8IL6LOBMMpQouhUCAtNNRJ6p2uyrKCBTyaRLUwRsmHu6bUjVNWg4SHU5b4UsnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 2/5] xen/domain.h: Centrialize is_domain_direct_mapped()
Date: Fri, 8 Mar 2024 09:54:32 +0800
Message-ID: <20240308015435.4044339-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308015435.4044339-1-xin.wang2@amd.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: b2327975-6b70-4fb4-6436-08dc3f12bf00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2uhOvfvapcZUJ6UsU8iuObgLlp7sB0bdDo3yY7b+0LOckNzr87hHHmp7GWKdmjm96bpfj8ygM3gRqOsCv5jhrkc9TPnYYE+MIeWwXtz5GkX3SyK0xyNZcP2aLEJ6DsfQWj3Z+2vZ9dj2Zqpd1tmvMbCeZWXYGZ05q5I5bSaDOKSg3inv7RWDUMA1jGh3nhDhseLq1mGgu+KG5M31pu+MR6NXCbKeNA2jHbQwLNKj3DZYr1E4VvnqAkjzPCYFawfodtYVkMv3hdunUnSy189KCUDamV5QlgpdiVSJ89LWEHc4+xA1vQBsr17LUObIDZoyWtg/AjsaVmq2Y+oMIlH1IfSSx1CiTOAXSs1ZV5jBhni1g+SxKOUH1f0OmEvdqBA+VjTtccLZyGqK4NHjlWAIXSRQsDCCOlwqYIyarqvudTwXyI0cOVE7UWTRRCmYDunjZa3sTMJrgriZBmUdBRPT1bblI1TlB6eD99UfFrtTtZy3XDLSke6Yo0jHtR4m7hYlxtM1xZaVKTJgkW4oRRh0pNkGJfUN1QtjTLONP/0uJaRCbso37tXV6e9gSzWPWVNVVUuLki5IeUMW4ES5jemnN32u0bVUsoF+4Q03SC9wptc32IRxBk64WOg2gr2ZK+ZtyJv1E6mQuUV2zh84Cbd36plvd0J3YfqcB3w5WSlj36RS3OpkvVH/XUQgMvxQWqgnm19/QlOjVayRWv9O1kZBYIN5hXFH39oNWqhITjqSDCV8OS6zX/PPXJ6Uffzdvii5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:54:52.5577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2327975-6b70-4fb4-6436-08dc3f12bf00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944

Currently direct mapped domain is only supported by the Arm
architecture at the domain creation time by setting the CDF_directmap
flag. There is not a need for every non-Arm architecture, i.e. x86,
RISC-V and PPC, to define a stub is_domain_direct_mapped() in arch
header.

Move is_domain_direct_mapped() to a centralized place at xen/domain.h
and evaluate CDF_directmap for non-Arm architecture to 0.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch
---
 xen/arch/arm/include/asm/domain.h   | 2 --
 xen/arch/ppc/include/asm/domain.h   | 2 --
 xen/arch/riscv/include/asm/domain.h | 2 --
 xen/arch/x86/include/asm/domain.h   | 1 -
 xen/include/xen/domain.h            | 3 +++
 5 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 8218afb862..f1d72c6e48 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,8 +29,6 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-#define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
-
 /*
  * Is the domain using the host memory layout?
  *
diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/domain.h
index 573276d0a8..3a447272c6 100644
--- a/xen/arch/ppc/include/asm/domain.h
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -10,8 +10,6 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
-#define is_domain_direct_mapped(d) ((void)(d), 0)
-
 /* TODO: Implement */
 #define guest_mode(r) ({ (void)(r); BUG_ON("unimplemented"); 0; })
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 0f5dc2be40..027bfa8a93 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -10,8 +10,6 @@ struct hvm_domain
     uint64_t              params[HVM_NR_PARAMS];
 };
 
-#define is_domain_direct_mapped(d) ((void)(d), 0)
-
 struct arch_vcpu_io {
 };
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 622d22bef2..4bd78e3a6d 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -22,7 +22,6 @@
 #define is_hvm_pv_evtchn_domain(d) (is_hvm_domain(d) && \
         ((d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector || \
          (d)->vcpu[0]->arch.hvm.evtchn_upcall_vector))
-#define is_domain_direct_mapped(d) ((void)(d), 0)
 
 #define VCPU_TRAP_NONE         0
 #define VCPU_TRAP_NMI          1
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index b1a4aa6f38..3de5635291 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -41,6 +41,8 @@ void arch_get_domain_info(const struct domain *d,
 #ifdef CONFIG_ARM
 /* Should domain memory be directly mapped? */
 #define CDF_directmap            (1U << 1)
+#else
+#define CDF_directmap            0
 #endif
 /* Is domain memory on static allocation? */
 #ifdef CONFIG_STATIC_MEMORY
@@ -49,6 +51,7 @@ void arch_get_domain_info(const struct domain *d,
 #define CDF_staticmem            0
 #endif
 
+#define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
 
 /*
-- 
2.34.1


