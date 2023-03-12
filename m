Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8550E6B63BC
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 08:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508868.783798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYa-0004fH-Dt; Sun, 12 Mar 2023 07:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508868.783798; Sun, 12 Mar 2023 07:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbGYa-0004bk-Am; Sun, 12 Mar 2023 07:55:52 +0000
Received: by outflank-mailman (input) for mailman id 508868;
 Sun, 12 Mar 2023 07:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TSl9=7E=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1pbGYY-0002sM-68
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 07:55:50 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d059e60-c0ab-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 08:55:49 +0100 (CET)
Received: from MW4PR02CA0005.namprd02.prod.outlook.com (2603:10b6:303:16d::14)
 by SJ0PR12MB6830.namprd12.prod.outlook.com (2603:10b6:a03:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 07:55:41 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::7d) by MW4PR02CA0005.outlook.office365.com
 (2603:10b6:303:16d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 07:55:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 07:55:41 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 01:55:37 -0600
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
X-Inumbo-ID: 4d059e60-c0ab-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGD76nxfyaXBd1D6EvwyIZsw0tg5SbDc2Dnj8MYVmZj+WC4ukIdtJ9CpG1KgRp/C2JEMSUotu49utQhmUVfLvFkRrhIclPoPAlJzhVlUGrVJJ/8oOlym4umvydEQqgxK/RO3JjVIM/Y5zDFbOqnFrFvmXBTVLvDcmPKwMIhydViFWu1IbwBPmoTLHu+ClY9+LPPlX1qT6HhwLzMY/SWrRZW4iYsTyoCWAlkDqKDHIEGG51ZeOc455GSZnkuCcUDN/y9GmRnrlvBT6RXSfnhfwNIQEKJTpyr6XHUsXpDn0THuCU9ynKiTeA+7AGFKKoFjTD/zJnDWj6N3ho7EqHTmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbEo4/fbStYgnrq3fF43Fq6AIUEljAM5PanTYZFaUAE=;
 b=l/zYGX4qbqzb+PefN0yhEbOlhjuWhgbAQTMbNTTy59TLQ9UmjUzV98Hi/1eVtClNtSJba8kYukXRprmoMzLlV9KTDwWNT6hTKQbUGVCAZWsgMmeIElIkBAd+cfTbs3XgSa8/7eFrBPOJsc42D+KbDh52OpYYrHOXLCowu/sa97pjxvqzsaJ1v9QBe+bvM3a0NHGid+HRTJHZYD3Qf/NanE9HJdr6mNMVJlZc0RKbHH/0UceZuPTwF+Vd2UNtwhMfim9WHlcF+w7wQJAMmSJvEXEBIputZSvNP+F3IzjGV6SggPJnG0flvgo6c8TIgtut6tqIcbvJN7dIkWzXUW+9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbEo4/fbStYgnrq3fF43Fq6AIUEljAM5PanTYZFaUAE=;
 b=ByWC+BfkUECwO/o35Kg7ZJZnO4L0xAKy5S0iQX5J76E2pQKnQ78f6cl9GTcM0yMcEMwWAsTkZH+pzulMvVS/eg6BcbnwD0LnyiCOWpbUoDOnhIoDIAUt5P4IVruunyNh7cfNrubICd1GSW8G2C615vdqUxvChV5ZJO2I9FLMOt8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
	<burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
	<julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [RFC XEN PATCH 5/6] tools/libs/call: add linux os call to get gsi from irq
Date: Sun, 12 Mar 2023 15:54:54 +0800
Message-ID: <20230312075455.450187-6-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312075455.450187-1-ray.huang@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT014:EE_|SJ0PR12MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: bcec3bb2-7f91-4e66-c121-08db22cf2d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YHkQGgy1HJbzCXzbGw8qmVwi0bGlwEXfoFr9HZERney+2O3zrndNh47czBCSqzpUfxR4u5XIM2wbsMCWBPnXNW7dQ7mcAO6Dvxs0N14MlOQfMdn3quckrLW03O/cbXWngZgwNSA90xxoKa+vL60MpAj7eYn2X7YUPKX7Gf1WjmI7H7didNRBA0dIom8PStNEbzHx6T69iNeRWML2tC8gPwBNeFybqkuUNiCfRpur1MP6i+kal7GhKxy9mS+/ukYQR9uk15ftlWnw3K3duX6H3ZycV639RyzttdnY8HbTBgtKXul8cyuZdJVRhRIRAsxdrkYIl3FME+36Tlp6micR3aWV7OsFyoGD+5FJg8nuoBetpTbNi8izhy9CnLjguG+1CV7bmWbfliCVhJpCm54FSWXyjht35OGWZ77b/LGVrhGzb0OYvdKVYrs8mjog7ildqi7pgIQk/HG+vq0lAKBKOtoLP+I0YZAYBZcEsQDxyZz9Ys9OWnYv6GM1nQnyzT4Q1+sRFYshaRaZI4/STwo0s0DT6L/XQEoKOiid1/Eeqn8pVzNdlFZ7Ii3z5yux1VBavZBEeJLmXTJO8VoHfDrzuzZiy2G7fG2fKrWLXHc3z124IapxUsDOuBAg80oOrBLqRnEI/ko+TNP+GOn+56XUqVfBpwJiTf+OhZfQ54hq8gFV5IPYcW3Z4pKO89mTRaCH5IJwUzVGrZHcNrYSlODL/nBXw+bpK3HaeZf5jMTU7RE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(46966006)(40470700004)(36840700001)(54906003)(110136005)(186003)(16526019)(26005)(1076003)(356005)(5660300002)(40480700001)(478600001)(36756003)(40460700003)(8936002)(7696005)(86362001)(2906002)(6666004)(4326008)(36860700001)(2616005)(83380400001)(70206006)(70586007)(8676002)(316002)(47076005)(426003)(82740400003)(82310400005)(81166007)(41300700001)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 07:55:41.0355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcec3bb2-7f91-4e66-c121-08db22cf2d04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6830

From: Chen Jiqian <Jiqian.Chen@amd.com>

When passthrough gpu to guest, usersapce can only get irq
instead of gsi. But it should pass gsi to guest, so that
guest can get interrupt signal. So, provide function to get
gsi.

Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 tools/include/xen-sys/Linux/privcmd.h |  7 +++++++
 tools/include/xencall.h               |  2 ++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/call/core.c                |  5 +++++
 tools/libs/call/libxencall.map        |  2 ++
 tools/libs/call/linux.c               | 14 ++++++++++++++
 tools/libs/call/private.h             |  9 +++++++++
 tools/libs/ctrl/xc_physdev.c          |  4 ++++
 8 files changed, 45 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55..d72e785b5d 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_gsi_from_irq {
+	__u32 irq;
+	__u32 gsi;
+} privcmd_gsi_from_irq_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_GSI_FROM_IRQ				\
+	_IOC(_IOC_NONE, 'P', 8, sizeof(privcmd_gsi_from_irq_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xencall.h b/tools/include/xencall.h
index fc95ed0fe5..962cb45e1f 100644
--- a/tools/include/xencall.h
+++ b/tools/include/xencall.h
@@ -113,6 +113,8 @@ int xencall5(xencall_handle *xcall, unsigned int op,
              uint64_t arg1, uint64_t arg2, uint64_t arg3,
              uint64_t arg4, uint64_t arg5);
 
+int xen_oscall_gsi_from_irq(xencall_handle *xcall, int irq);
+
 /* Variant(s) of the above, as needed, returning "long" instead of "int". */
 long xencall2L(xencall_handle *xcall, unsigned int op,
                uint64_t arg1, uint64_t arg2);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 23037874d3..3918be9e53 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1652,6 +1652,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_physdev_gsi_from_irq(xc_interface *xch, int irq);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
index 02c4f8e1ae..6f79f3babd 100644
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -173,6 +173,11 @@ int xencall5(xencall_handle *xcall, unsigned int op,
     return osdep_hypercall(xcall, &call);
 }
 
+int xen_oscall_gsi_from_irq(xencall_handle *xcall, int irq)
+{
+    return osdep_oscall(xcall, irq);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/call/libxencall.map b/tools/libs/call/libxencall.map
index d18a3174e9..6cde8eda05 100644
--- a/tools/libs/call/libxencall.map
+++ b/tools/libs/call/libxencall.map
@@ -10,6 +10,8 @@ VERS_1.0 {
 		xencall4;
 		xencall5;
 
+		xen_oscall_gsi_from_irq;
+
 		xencall_alloc_buffer;
 		xencall_free_buffer;
 		xencall_alloc_buffer_pages;
diff --git a/tools/libs/call/linux.c b/tools/libs/call/linux.c
index 6d588e6bea..5267bceabf 100644
--- a/tools/libs/call/linux.c
+++ b/tools/libs/call/linux.c
@@ -85,6 +85,20 @@ long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
     return ioctl(xcall->fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
 }
 
+long osdep_oscall(xencall_handle *xcall, int irq)
+{
+    privcmd_gsi_from_irq_t gsi_irq = {
+        .irq = irq,
+        .gsi = -1,
+    };
+
+    if (ioctl(xcall->fd, IOCTL_PRIVCMD_GSI_FROM_IRQ, &gsi_irq)) {
+        return gsi_irq.irq;
+    }
+
+    return gsi_irq.gsi;
+}
+
 static void *alloc_pages_bufdev(xencall_handle *xcall, size_t npages)
 {
     void *p;
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 9c3aa432ef..01a1f5076a 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -57,6 +57,15 @@ int osdep_xencall_close(xencall_handle *xcall);
 
 long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall);
 
+#if defined(__linux__)
+long osdep_oscall(xencall_handle *xcall, int irq);
+#else
+static inline long osdep_oscall(xencall_handle *xcall, int irq)
+{
+    return irq;
+}
+#endif
+
 void *osdep_alloc_pages(xencall_handle *xcall, size_t nr_pages);
 void osdep_free_pages(xencall_handle *xcall, void *p, size_t nr_pages);
 
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779c..4d3b138ebd 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -111,3 +111,7 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
     return rc;
 }
 
+int xc_physdev_gsi_from_irq(xc_interface *xch, int irq)
+{
+    return xen_oscall_gsi_from_irq(xch->xcall, irq);
+}
-- 
2.25.1


