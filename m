Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D166C479D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 11:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513302.794147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevjF-0000Pv-V4; Wed, 22 Mar 2023 10:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513302.794147; Wed, 22 Mar 2023 10:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevjF-0000Ky-R2; Wed, 22 Mar 2023 10:30:01 +0000
Received: by outflank-mailman (input) for mailman id 513302;
 Wed, 22 Mar 2023 10:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pevjE-0008I3-3M
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:30:00 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe59::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e84b6f3-c89c-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 11:29:58 +0100 (CET)
Received: from DS7PR06CA0023.namprd06.prod.outlook.com (2603:10b6:8:2a::14) by
 CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 10:29:53 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::7d) by DS7PR06CA0023.outlook.office365.com
 (2603:10b6:8:2a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 10:29:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 10:29:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 05:29:51 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 22 Mar 2023 05:29:50 -0500
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
X-Inumbo-ID: 7e84b6f3-c89c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4C2nVVuNH5Zzivo4wSKC817rApHB3DguqcQW5p81X3E8RDaEmWLeXbM9srrdH/voGYeI2hqRQz5s8nauhO+1b60cqylwpofDGCTMySmRzcMCNeRgsJuhWkZmCjc0sAfQR7g1PC6jU7C37K1GGt4yEZlGizu+qzMUMhlHbbBtGKNoEofj3arJpV+yX9xjgnwBSmWpDo7aAkYn0gAfiM/ZA+G3Kf3Ao4oJ9hQcj/etHWSbWylWD2zVxL/An0Ple3raK4rRz73o72y0BF9WaJDhwOQpIoABycQm9gQ+JpRMfxqBgydUz03LmsPJ+t0d7CBUSZHy3Q0vccKe+HuPGsekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyJRc0znxvGeUPenKllUBZbO/z1IN4gNAyJvbD+AGP0=;
 b=dYRgWtgS0/Zm2wFTbJhECusIlzznLCJ1GsuJKbYRCPOq8Xlx8Lo8msseFxXPdyOXMv4A4WdwpGoSTe2YA2q7wjmLIpFEHkRdsP7uQ5Qu9ICXR5afuEKDKkPIeIOdzETAs7Cc1YrN+MbNqNMHAcoJRmsqEcVwgHR7DczXCTl+m2MnMgxuECDcWRyqznCYTuhyC/bPqqz5FG2MzhimY4IF9KhYoGVMat02EB1er7wFArzjcqnGjNGHAkzNNl3vaReW5QDMa2tSHm2FVJAG2/qpKxlnN5nKYRk7jAznxTsTNB4YkcgOMIcpsAumYmTEKN7xIvisipPItIfZC4IUpATb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyJRc0znxvGeUPenKllUBZbO/z1IN4gNAyJvbD+AGP0=;
 b=Q/8qF0Ix/cGaRvoa3Ck0JgSQOOlXG/W0El0BHYmyl/AyV03NYnM9GMDOTC80pB+tuLgzjNyOw1MRoOOUdg0T88096q3ayhiK2AjKqsDMGM+8YkUv2TstBtR1zDiiq7lnjzOBt3rb/WTnHwQSp5mXudfDypSGYeJSPMz9CfEkqaY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Date: Wed, 22 Mar 2023 11:29:41 +0100
Message-ID: <20230322102941.959-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322102941.959-1-michal.orzel@amd.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 76db225f-5eb6-4117-dc18-08db2ac05fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZWZs8Gdm2pyz9qJD4AnSgsscFj96KcJWDmKFn7lZnaBzRbDP5O+acVXM/oiL5DBQU4o7KfeG2KXoNcWwNVeo4mWHE2WRSgAx7XKZZzck9RtsNiBVJaNOJDaVzTjW7ZZC2PQXOpAyj8ROjPU5ehPFJGeT06p3dMGFTv+PhVNJpHERJs9FAWxsOvsuyBj+BBduAefy1ixVi0iM7LHfsMVZeRDTULLX8XRAqoVxbG5gg/cISI6HepDh65a+dUMb1jeUDd653jHqI+n9m5YTeZletRVFPArMWqqutreDhNSHswbovoawCcxPB/jSf7yonVdDDxfqdNQos4DjGDLdk0kybTY3b0ZJHIk917pi41m4XFOLV3SSCPV9Sjtks+mmW1ijtmerFyhGPZB30VRMQIQFf31/YWySX2oBgjW5PxZ/SrFjD2LXm3J9z0+itOJR76TeKx/pyUOOhgR0Bpe/saFJDuyuuBxNqEuild8YdqePQbT3gwnfITF2UpcDkYpJJNlvCIiB0kMkyA/CnNHBul0SHXAj4YbH3Xz0VBFJMx0wPRww9ITidymGS8mnzPWjcChjod+z61zHy1Zd0INCKWhoNqM1sdjeQZsCWbpqGJk/9c1yq3lxy9fCHgQRgq0ULsbF+vYwFhbGcu6GFVGZamntEdvtwPph28MwsA+seEtWndaeb6e1yyMPGsPdSxNg2VfW6+tw3Z2+cHZMyPbC/n1ITqyehM0f3bkvvJByhRqTsc4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(186003)(1076003)(26005)(82740400003)(426003)(47076005)(2616005)(316002)(478600001)(83380400001)(54906003)(336012)(6666004)(8676002)(70206006)(70586007)(41300700001)(4326008)(36860700001)(36756003)(44832011)(5660300002)(6916009)(40460700003)(2906002)(81166007)(8936002)(356005)(86362001)(82310400005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 10:29:52.9855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76db225f-5eb6-4117-dc18-08db2ac05fb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249

When vgic_reserve_virq() fails and backend is in domain, we should also
free the allocated event channel.

When backend is in Xen and call to xzalloc() returns NULL, there is no
need to call xfree(). This should be done instead on an error path
from vgic_reserve_virq(). Also, take the opportunity to return -ENOMEM
instead of -EINVAL when memory allocation fails.

Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/vpl011.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 541ec962f189..df29a65ad365 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -696,8 +696,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
         if ( vpl011->backend.xen == NULL )
         {
-            rc = -EINVAL;
-            goto out1;
+            rc = -ENOMEM;
+            goto out;
         }
     }
 
@@ -720,12 +720,15 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
 out2:
     vgic_free_virq(d, vpl011->virq);
 
+    if ( vpl011->backend_in_domain )
+        free_xen_event_channel(d, vpl011->evtchn);
+    else
+        xfree(vpl011->backend.xen);
+
 out1:
     if ( vpl011->backend_in_domain )
         destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
                                 vpl011->backend.dom.ring_page);
-    else
-        xfree(vpl011->backend.xen);
 
 out:
     return rc;
-- 
2.25.1


