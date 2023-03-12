Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC96B6414
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508925.783927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0g-00064g-9C; Sun, 12 Mar 2023 09:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508925.783927; Sun, 12 Mar 2023 09:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbI0g-00062J-5l; Sun, 12 Mar 2023 09:28:58 +0000
Received: by outflank-mailman (input) for mailman id 508925;
 Sun, 12 Mar 2023 09:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbHwZ-00008O-Mg
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:24:43 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7d293e8-c0b7-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 10:24:43 +0100 (CET)
Received: from MW4PR03CA0223.namprd03.prod.outlook.com (2603:10b6:303:b9::18)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 09:24:38 +0000
Received: from CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::dc) by MW4PR03CA0223.outlook.office365.com
 (2603:10b6:303:b9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT088.mail.protection.outlook.com (10.13.175.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:24:38 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:33 -0500
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
X-Inumbo-ID: b7d293e8-c0b7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4BVFOQz+1oCDcCfyYMlezy6i2yl9caGQB3tdS1APBxUhcDx6VppFlOqsjHHWuPphpqVY6KxVC20nUZD7cC9SUMyG+hs/cGz9pZvKjvdi+SKMSXeJQNZwmisa6HzzGVKaN9/j6b7E/WRT/dZOQWih3vwYvhWSUd/RSUJ/ZwgHWo3q8YBE+daOnK83BTbpoFGnPy+rKQ9EugVBu0fA5UmnyUtOPiwkWxkFpYeFFW5/iw6ZfJcavuRC/WdIS6CdTTNLog8lBzN8W/yIkYB1rO6Dk/t/fjILgXsQswmf0NzaT9a15xglx9fX2Np/GGSyUBxInMQb8mOJsey15kTAJquVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdXw/VYVPUbUxiMUH7EPpY7XT11q7Fr3BSwkuljjJuA=;
 b=gbGLTr2Y/ydr+7M3dIrtNo/8j7MAQPZ5wZdaDNyQ29VmFyByFbEhbOO5cjdKph21M/jxXA1tRNvA0NsnF9eEGBTdaCG9nF+M5Jg7JDbWU5sbh0btsYobFZHW+q7Ma2Rvtn9n89Ttu1pEgVZzS9AH6N0BvmdTdLiTqZ7TXyz4IfZPRdzlhLfW1/49YpNPct6bEpDxeH2RSTjA6/3VXwqZOpG3RLfejtRtp0mNipfGiMNVAdWICVry95jzmGV4uqv1mIMzwadnHzSAKQt6s4T7HDwyqe4RlJrRDfXzvjoIbVlxTiKizY4npfPYBlqt6BgIR/Ob84ws0SG1CuRhV2zSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdXw/VYVPUbUxiMUH7EPpY7XT11q7Fr3BSwkuljjJuA=;
 b=Rw8nreq6E3Cb6pVme74+5TirhnlQ0LIyOap+SeNh7VHSqV08OBRo/N05KHQ6fy4z4UDZaQZuzEn5Skrrj9leBu85pf7b4Vv9G+OXf1O70qImCOwKqDuDaUEUYTEd0D4VyJznIV0je4sk2sBLfM26SClxNjYaatW293eivQS92nI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
	<qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC QEMU PATCH 18/18] xen: translate irq of host pci device to gsi
Date: Sun, 12 Mar 2023 17:22:44 +0800
Message-ID: <20230312092244.451465-19-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: cc673529-2423-4135-5ed6-08db22db9a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XJOZrVicCW17z/AcoTuCNDsCWVZBmtGSfp5oLSWAjg/A86NQilOIu5bUUyq7g+Rf3jewmAMNSsj6E4+CmvMZsx5lHjGA2fAVgJBOfelFqEVUEt23AskDYZdCcnQArJKTADn/3zR8htkA1g0sHE8QOmZrmTmhHBjFvccPC5v3NXr+I3oljE80f9J6pS4r3NnrGsMakxShAAa+crZ0RZLQfB6It8XX2IknYhPMoQSHyCCVxvz1MldJwELllb5RXr/gDDkt591Yr/6+uHa0udrrFZPC0KluHRA1a3RwyJMFpK8CI1jniIIuEhtJqYx4HM8zSQB5uBBJlH2o4r9xMlrzitg4JayEU1IbX3K+2t/4CmgO7hBjBiIXfVJGZJl7UZ6Wl0/DindZZN7vZpRWVUIw//4I88kwWpWYuh8/Bq0Owtn44gEcoxshJpoZ//gg4tc8T6R5Wbmc4bX2NxstjevyC90Jvri1FW04av5MUoXLxDG7RnGIlTR64aiRou4UXdqaaA18DDjzDbojQ8NsWFNEkxkeKRKZIbul/tATRT80Qm3BeIzAe0D4JY0xPrlOUktUbcv+03DlteyAqC/zHjPY1XL3T72DAl0PaLv+bjFGKsPDY59L5MkXzXxWgawlCcMeaw9sT5ZpYzt9MVHUflEHB147Z9mptw8GhicWYzkP+IMlhsfmhkd/SuIt6Ugng8cmCb/lbq8F/a71X3Vh6OAX5s6qn/qH1ZL/3PBdQYiL/q9EAkBnC0DZikWWfAUtM8yj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199018)(40470700004)(36840700001)(46966006)(36860700001)(6666004)(7416002)(5660300002)(8936002)(70586007)(70206006)(4326008)(82310400005)(7696005)(40480700001)(8676002)(83380400001)(54906003)(110136005)(36756003)(316002)(478600001)(426003)(47076005)(41300700001)(40460700003)(336012)(86362001)(82740400003)(2906002)(356005)(921005)(186003)(16526019)(81166007)(1076003)(26005)(4744005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:38.6256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc673529-2423-4135-5ed6-08db22db9a78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962

From: Chen Jiqian <Jiqian.Chen@amd.com>

Use the new interface in the kernel to map pirq for qemu.

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/xen/xen-host-pci-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716..6ca841a967 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "hw/xen/xen_common.h"
 #include "xen-host-pci-device.h"
 
 #define XEN_HOST_PCI_MAX_EXT_CAP \
@@ -368,7 +369,7 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     if (*errp) {
         goto error;
     }
-    d->irq = v;
+    d->irq = xc_physdev_gsi_from_irq(xen_xc, v);
 
     xen_host_pci_get_hex_value(d, "class", &v, errp);
     if (*errp) {
-- 
2.25.1


