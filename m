Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0F708C80
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 01:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536591.835062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pznIx-0008Cs-9V; Thu, 18 May 2023 23:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536591.835062; Thu, 18 May 2023 23:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pznIx-00089X-6O; Thu, 18 May 2023 23:45:07 +0000
Received: by outflank-mailman (input) for mailman id 536591;
 Thu, 18 May 2023 23:45:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wJ3=BH=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1pznIu-00089P-Q6
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 23:45:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00a1e0ef-f5d6-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 01:45:01 +0200 (CEST)
Received: from DS7PR03CA0015.namprd03.prod.outlook.com (2603:10b6:5:3b8::20)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 23:44:56 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::2) by DS7PR03CA0015.outlook.office365.com
 (2603:10b6:5:3b8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.20 via Frontend
 Transport; Thu, 18 May 2023 23:44:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 23:44:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 18:44:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 18:44:54 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34 via Frontend Transport; Thu, 18 May 2023 18:44:54 -0500
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
X-Inumbo-ID: 00a1e0ef-f5d6-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZb1yO3ncl/YKeaSmEwHFtLIPsBYzrqJWcwg6AS3HDrAz8n8yxB/43tQdc+2tndrXqgXZ1gHgglxO5YbrIvnuOtRPICNrpEOF3JCthYq05nSWduAxFAxAJp8BPuMuxU7HKwPTnb5aT9WkHBlaJ8Hghrkx55Pkj5HjMN5GBYe8Bok8FTG3OHfgDmJVMPTQPH0BTjhZcjO1slHk5GSvR9E2p/CVFclsnmpLj5xvgHUb9e5l0cTslLFd56Ks0tOkO3A47noNQU80CVJTBq5agFKo7BdrAAQo6qgTN0O10FiDGW9bAK9bZosuVc9RKybiHQJ8gvMwhcbUnZ8du+Wv458fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBEWT/dwzg5bHP+LJqopgQqdSF83NK+k3UHbU9VyfRg=;
 b=fBJ5rvflvABHgSYNohQ7163SBLGNGlB8fQoNH/FF/w0u+dLobOf7kNEN9OcSHlvh0wLouTbxoXmMjDTPeucKHzOX6TSbfwXrD9PDb11F0Of0HK8G/Xie+flL9/Pc0Pj8BJrUByLY1J2Sx/4Mos68NypCcfSxw+M6tzwWIZRI6gdqiM0f41uLho4DkTgmaHfrCFHXsWPbjMMq/wOKTy9+S7Cd1k3S+LPUp3w85zyqe//KrQG6hHHs/Y85ntYw7M6QPxL6awDagQq6+5+A/ZnsIRyQx/yasNeFYLDK+97s1ucjsNUVwUbbJjjTqaPq5v1FOe0wOMF1YOK9kyYweGcDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBEWT/dwzg5bHP+LJqopgQqdSF83NK+k3UHbU9VyfRg=;
 b=Q0v5s6MLucf9OOGgzMCaMuLtMKhKMexB6mKxwgaYs3CbQM5a7DjegbXnIXqqyXar+ywMlvH/3syPB/4aqn6vd0PdB7TGaNYPuqcU8S1JkMBvyEkLKnq61OuyD36hUeHb8U2lvFeM6VyrkHl+lvJGQELheix/k8c7t+GWqGUcAIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 18 May 2023 16:44:53 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<xenia.ragiadakou@amd.com>
Subject: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
Message-ID: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT010:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b2950f-209f-4638-5800-08db57f9e260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gD2iGDXdeZcGHutBNg3SbRQuLkDroKdIR3UuhaPuUFJCrY+VGwwHoVkDnlgz6pVcvKfdam0V7H8UyDKzx1//pu9LwQbq+NstJ4KrYwXAOvWko+Ixz/Td8lTCrZluhZy/VNpk5KX9V+yuk+BFt8ML8dt7G9E7jWsswO6vmPb0QJSL3Ic3/JCDCvk/zdQAFdaxRmnVva6duUlM3qOGDWn0lxKsZnozZybsPqzgzqFEUAY5fb4+TjPYUSBfm5B8dE6mMixDcKjCW3DMogignTzdC2E6Upcn15YA9C44HlIroSOBSnikRi8Sdrf7ttN2CbWPTG39nLsEvk/Rsw5SR5a9Sab0DEEZG2ceBEWJbKGmzCh4dODdj/zi/uTW38No8Q84xE9IZjPZ0uXomrtNif30MIO9r0fKcGEU9OH83Q+9O7C4jG7JALP0rFykC2v+BAHWQhSnRAcdZ3SivGHnAMO3zxoUoy4amjV2UsPEn7JGUyrosBbh3kg1se7C12OFu+ipeQxhDkBUxEwO7my3IMVEJpsJKb/FM4taLe4C1Yk0et8t5t0Q2fmP0hxxDSrX1AGFb4Hjkg7Ur0WKMmT9HCeH957IagZLky6+nzvoWfOWpphCbhK+ogeJ3CQXmAKwE+Xsk7l7uoLm1dQKQLHWhZHiqRoXPlRn8GZ/oMpgaXePn8CyuyybDrKdiYdqqQvy+uBiJVGMefpM3CnWnkbo/AKo+FCZHJgiwJInoU6kFgsHb0gjdo+9gz0JxAvkwYSAhpoIZgnqoYqN44faC53N360RWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(33716001)(356005)(81166007)(40480700001)(86362001)(40460700003)(82310400005)(82740400003)(44832011)(478600001)(186003)(26005)(9686003)(41300700001)(5660300002)(15650500001)(8676002)(8936002)(70206006)(70586007)(6916009)(316002)(4326008)(54906003)(2906002)(36860700001)(83380400001)(426003)(336012)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 23:44:55.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b2950f-209f-4638-5800-08db57f9e260
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350

Hi all,

After many PVH Dom0 suspend/resume cycles we are seeing the following
Xen crash (it is random and doesn't reproduce reliably):

(XEN) [555.042981][<ffff82d04032a137>] R arch/x86/irq.c#_clear_irq_vector+0x214/0x2bd
(XEN) [555.042986][<ffff82d04032a74c>] F destroy_irq+0xe2/0x1b8
(XEN) [555.042991][<ffff82d0403276db>] F msi_free_irq+0x5e/0x1a7
(XEN) [555.042995][<ffff82d04032da2d>] F unmap_domain_pirq+0x441/0x4b4
(XEN) [555.043001][<ffff82d0402d29b9>] F arch/x86/hvm/vmsi.c#vpci_msi_disable+0xc0/0x155
(XEN) [555.043006][<ffff82d0402d39fc>] F vpci_msi_arch_disable+0x1e/0x2b
(XEN) [555.043013][<ffff82d04026561c>] F drivers/vpci/msi.c#control_write+0x109/0x10e
(XEN) [555.043018][<ffff82d0402640c3>] F vpci_write+0x11f/0x268
(XEN) [555.043024][<ffff82d0402c726a>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
(XEN) [555.043029][<ffff82d0402c6682>] F hvm_process_io_intercept+0x203/0x26f
(XEN) [555.043034][<ffff82d0402c6718>] F hvm_io_intercept+0x2a/0x4c
(XEN) [555.043039][<ffff82d0402b6353>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5f6
(XEN) [555.043043][<ffff82d0402b66dd>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
(XEN) [555.043048][<ffff82d0402b7bde>] F hvmemul_do_pio_buffer+0x33/0x35
(XEN) [555.043053][<ffff82d0402c7042>] F handle_pio+0x6d/0x1b4
(XEN) [555.043059][<ffff82d04029ec20>] F svm_vmexit_handler+0x10bf/0x18b0
(XEN) [555.043064][<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
(XEN) [555.043067]
(XEN) [555.469861]
(XEN) [555.471855] ****************************************
(XEN) [555.477315] Panic on CPU 9:
(XEN) [555.480608] Assertion 'per_cpu(vector_irq, cpu)[old_vector] == irq' failed at arch/x86/irq.c:233
(XEN) [555.489882] ****************************************

Looking at the code in question, the ASSERT looks wrong to me.

Specifically, if you see send_cleanup_vector and
irq_move_cleanup_interrupt, it is entirely possible to have old_vector
still valid and also move_in_progress still set, but only some of the
per_cpu(vector_irq, me)[vector] cleared. It seems to me that this could
happen especially when an MSI has a large old_cpu_mask.

While we go and clear per_cpu(vector_irq, me)[vector] in each CPU one by
one, the state is that not all per_cpu(vector_irq, me)[vector] are
cleared and old_vector is still set.

If at this point we enter _clear_irq_vector, we are going to hit the
ASSERT above.

My suggestion was to turn the ASSERT into an if. Any better ideas?

Cheers,

Stefano

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 20150b1c7f..c82c6b350a 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -230,9 +230,11 @@ static void _clear_irq_vector(struct irq_desc *desc)
 
         for_each_cpu(cpu, tmp_mask)
         {
-            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
-            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
-            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
+            if ( per_cpu(vector_irq, cpu)[old_vector] == irq )
+            {
+                TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
+                per_cpu(vector_irq, cpu)[old_vector] = ~irq;
+            }
         }
 
         release_old_vec(desc);

