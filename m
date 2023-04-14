Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7636E2A57
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521215.809655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcP-00022d-O3; Fri, 14 Apr 2023 18:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521215.809655; Fri, 14 Apr 2023 18:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOcP-000204-K2; Fri, 14 Apr 2023 18:57:57 +0000
Received: by outflank-mailman (input) for mailman id 521215;
 Fri, 14 Apr 2023 18:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OWbr=AF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pnOcO-0001yf-7e
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 18:57:56 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e88::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4297d594-daf6-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 20:57:54 +0200 (CEST)
Received: from MW4PR04CA0259.namprd04.prod.outlook.com (2603:10b6:303:88::24)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 18:57:46 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::b3) by MW4PR04CA0259.outlook.office365.com
 (2603:10b6:303:88::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 18:57:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.33 via Frontend Transport; Fri, 14 Apr 2023 18:57:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 13:57:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 13:57:43 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 14 Apr 2023 13:57:42 -0500
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
X-Inumbo-ID: 4297d594-daf6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPo3Zkau8v5cZvvTDRT5ZDoJxjWnp46Q/ftxQaGfnfgX64fe8jZa27ISThGxZfFgj2URL0unFqPXgPe7IYajX6mvs0y9CnmofDz+hTxT2aMt+8tvYfRIkoMfX84Qaa9mSH0bLdg94thJl1E1KijBSopNwkjP+oEzi2G4MEuHaXvigdpZ3c9lgiB1uTlUJWxoIIB19nxXcMZQ75a4ZXQVNfm3hB09UuYDdjm812tQjxbPqSPVyRNStF6noawt1cdIWCThivdjFAZ0Vqp8dgQc+DnxVlOiEyq/4Vt/mzCb3WGkcWqYsTOqmBkLvfcs9w7bNuhI4RzzWJpYIIvPka0d8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op4gLrZXr+32HM/wsQS2QIeYqXOraK+iVo5JPJFoRrg=;
 b=PF0tw8puEGB7V1u4jMXk65LW/+c6OHWy94UvCCX/kPCviDxl6+UFeEWStJniZa2cg8W3tp1zKG7V3uWAoXQK4FZB4G0y7GpFHVfO8PAeiv2epeGIzj61IjIBjsC+07sF7YUkgoE44KPdH11MKPAGqVEYhzrrqAvAUxEcFCMRw+JYqfLYkHxAOitSo5xv5y+NFijKm04vtBHvRtmVMdTt4WZ7344MGK4pFBbQTPimQqDbabxDYqXnwqi8RKQG0HvhpbrZzoTSt7EFu8r+2sDHUREZhXqLQiDnNBttNMaphFyKPO2PXDdkRBa8R044Vh1iOz1RF2YXf/fjTh4z5iwYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op4gLrZXr+32HM/wsQS2QIeYqXOraK+iVo5JPJFoRrg=;
 b=gOhpO5lNnnXIY4VlUUeOUNUG5dcNiTSFrhvVLUPammGnNuJIaK/2xGJJ2jhcc9MlgdxmN0vESeUqlujwSKjQnSB+HT6Mte9fHiY92/XAxhWsxYhy2LkaWBGYZZi/wxdeW95ZQ5h+jgXqangf3IZ/NkRMH2KKThjRYvv8al/fekQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH 2/3] xen/efi: fix unitialized use warning
Date: Fri, 14 Apr 2023 14:57:13 -0400
Message-ID: <20230414185714.292881-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414185714.292881-1-stewart.hildebrand@amd.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT004:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c6a0c3-bf5c-4b69-daaf-08db3d1a21e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IsgYxjrVVnc8ryVLdw6JHAKd7S4Bus9ldxYr+FiRT9sABsv4fL3jP/JAs7y607JaaF8RAC+OMQInsyCjc3yxawg5JIdVOvx68ziUFBtBgnZEcU2zdEnFEfN3S/EtiCG1T4HB9c9giYrP8OI85HGky6UaIB/jQyM/k7HwyrNeh8DqTxGPgS1syA+Gbd/VnVNTckD7EU3lFK9Syl6dR/GRrmLfrTyTyWIwfM4Zvc9p0tjjQIAIOb0jdjFUe9Ng1iFrHVwHbAf3WrJUISpcFnjWjqKZafZt26WedtrdIz9bo47N8ECM+QHzdmUMWdxLO7/uCF+kEeP3Z2HIxH4Cvwg3391ybFJKYxunJd2XQKEZbYuw/j8KZdL/lgtDkCMF33FNY6RTgMVzjfSwFGLYeGjn8TD9DWo9NWY06Ro/GHPcGNoF/zI+eM1hpx/n6S7OSTCjNbjqU06o1sGqDCwOxH4KFwIWMKWq8Z/+g3//YifkWXMHNu5x6oMH1bcwhX2w/6mGL7dygT+EDgN9hWXrdFdidVWcIQeLePBMQ9limsZuMvPyVslGEi36UlDxGu8M3rVMTzT556B7maMx4POovK+jPhy1X1hIVFmPBKUex48/8OkxgK9018IH6OzN+bniYifijBSLrEZxI003ZZPifRXgcXezB3GSd6ca1mw3ec9WRaPHSxMbrMQjZ/1fA849E0+EvxylOqbKuV81MHLET3fDe3xGGS4fE5c9FjJ4vLjUmRM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(54906003)(2906002)(36756003)(26005)(40460700003)(478600001)(8936002)(356005)(2616005)(966005)(81166007)(47076005)(1076003)(82740400003)(44832011)(83380400001)(186003)(5660300002)(426003)(336012)(86362001)(40480700001)(36860700001)(70206006)(70586007)(4326008)(6916009)(8676002)(82310400005)(316002)(41300700001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 18:57:44.8872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c6a0c3-bf5c-4b69-daaf-08db3d1a21e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911

When building the hypervisor for arm64 with -Og, we encounter a (false)
uninitialized use warning:

arch/arm/efi/boot.c: In function ‘efi_start’:
arch/arm/efi/boot.c:1468:9: error: ‘argc’ may be used uninitialized [-Werror=maybe-uninitialized]
 1468 |         efi_arch_handle_cmdline(argc ? *argv : NULL, options, name.s);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm/efi/boot.c:1263:21: note: ‘argc’ was declared here
 1263 |     unsigned int i, argc;
      |                     ^~~~
cc1: all warnings being treated as errors

Fix this by initializing argc. As a precaution, also initialize argv.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
See previous discussion here
https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00805.html
---
 xen/common/efi/boot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b69c83e354ee..c5850c26af9f 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1344,6 +1344,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         if ( !base_video )
             efi_console_set_mode();
     }
+    else
+    {
+        /*
+         * Some compilers may emit a false "uninitialized use" warning for argc,
+         * so initialize argc/argv here to avoid the warning.
+         */
+        argc = 0;
+        argv = NULL;
+    }
 
     PrintStr(L"Xen " XEN_VERSION_STRING XEN_EXTRAVERSION
 	     " (c/s " XEN_CHANGESET ") EFI loader\r\n");
-- 
2.40.0


