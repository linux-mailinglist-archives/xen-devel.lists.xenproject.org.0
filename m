Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6978E97B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593572.926595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3W-0006Tz-4B; Thu, 31 Aug 2023 09:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593572.926595; Thu, 31 Aug 2023 09:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe3V-0006Qw-Vm; Thu, 31 Aug 2023 09:33:37 +0000
Received: by outflank-mailman (input) for mailman id 593572;
 Thu, 31 Aug 2023 09:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YD1y=EQ=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qbe3U-0005pR-HH
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:33:36 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74d680fd-47e1-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:33:35 +0200 (CEST)
Received: from MW4PR04CA0272.namprd04.prod.outlook.com (2603:10b6:303:89::7)
 by LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 09:33:32 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::c3) by MW4PR04CA0272.outlook.office365.com
 (2603:10b6:303:89::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Thu, 31 Aug 2023 09:33:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Thu, 31 Aug 2023 09:33:31 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 04:33:24 -0500
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
X-Inumbo-ID: 74d680fd-47e1-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTf4S2tyeAJ1wv5Ja9xR7ec3dCfywWgvKygmrtdUhjs9lWEkJvSfSWwj/2AMuQwOWEVXtHf1BxbAGuOk7/I/QEZXo1tAkcO5NzTOgvMNs2WnHsb6w5w5nzYsHZyJiJ7VT/DXrNongn/Tjy+8WZ72f1MJZBJos+dxoMcde7rFsJWsuVwMudWbtYwntejOK9t/iv5qoaTxOqtqkUP9u6Q5I6/ip+X5VUx8sB0lkatjqMXikiZhrw+MaFbWorV1iuK0zuz7tjN4y5B1N2z9oIgwpM8DM26ccRpfpx+tjiVahxUunsyQIzJ8p2f8OiYcxx5vKLU71uxdtJpvRNsGSqIvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkbJyyl2hKRMbUZDjv2bheTdRoyRBB1f2ttFfpngVoY=;
 b=SSzdBf7bKl3y4gN3QrJ2wttXi0U5qgHql/tB/32Iu/YjEzeOhKPyn2unjVamRum5KbID7WCuS5Dc7pNFeqRiOwNx5knYJDaZxMz96j8BfTH8MFMYFDZohsARY8iR/COViZBc65e0N35l/Sb/tSb5dW/zKkvy6hJM9yMQ9TjfrRTI0c+2bSGSsoDmmxObPmM3ePDkrL3iQJFBbdNt95K1y3pFtJYSLjT50quMenVvNjqtIWR2333Cwv5e/wWGU9cFTDDMz495pBZK4Ua4Wqwiy0jO7CJrZ0uhY37Pp/L/eNUcN8w94Ehf3fZWpFwBN/TWcd84vSqizXJ3ZCQYH+u/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkbJyyl2hKRMbUZDjv2bheTdRoyRBB1f2ttFfpngVoY=;
 b=GHWHQ297prRGui7LiTWWSZXw9ZGGy40qsgIui3WZJskBxWNyfK+lvdeAzoQ7uDr7FCwRLkn4FESh2DpiJKvFDB7Tzo8gDwEdjgN131wbGKx1ko13R3bTmPrxYh9w8NxlE0ZBjf8Qd4jj2L0xDL9xv4zCIzhRRzG4kt9AXUpXQ7c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Akihiko Odaki
	<akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v4 02/13] virtio-gpu: CONTEXT_INIT feature
Date: Thu, 31 Aug 2023 17:32:41 +0800
Message-ID: <20230831093252.2461282-3-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831093252.2461282-1-ray.huang@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e76fc58-6ac3-4538-88ec-08dbaa05575e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wiH4UvJx8dN6O7byKREbV7UWWhKCNrvESLRrIxlKzanbDnuu+AByYxnN7rJTvNApNYMIU0tb4wzAvxf9fPDLtcyMwCKEpbQxu+WnPGA1TyvXzwlX8fhex1N2xonFzgusMIgvzU0S5nRyewCg9CeIkt7dMmrq6GBy9g9LNPI5k+oLv+6aUlAoo+lZOrk8nN+XQ2W7XSFNuNbfHgtueLHxqS+MZ8mLSvtRLyppRxJHTmmcrquyxEAuVlHsSR9GYW/w97eTGmydhy48NgKivNjK19s8MDYVfqVdQlFvoy42+V+EIec8RgaEVb6AkRdLy1ygVQvxDFFXlmI15oaoQSYNTKFN8KninnsUSE12AB6VNx0QRSeQUqElPeF88vXcoEGLdRbGRX40NbINOZyNT1uTcGBjdA74PPjqSfFlGqtQrQ+zhVuKWNt07y40EOvrjywwbgZYn1dsCXVVBS6z8GuSIoDmD1aYP9Eut8Zm0XxAYb14/KzN+rwQTyxFhHdZJN9DCa1xuwCdZMRizpw0KpnBjSMu1E3ZSsEfxfvJlSnchQeLO9M/mEi/VUWO5HxrystLEyhzxKft1ucptEXEFzBTmyMRyLSD3VMKo2hpKXnRWdBjy2KN1gBR1edtUmDvptz4AupjVxBjawqQfwFwuPej5hpJ4IYw38Lx+DovzWOxiPObppaKvg3SV0OGQhmRdmHUbdyTuNS6ntlUbnJFyWCeOQCP8s/o+PXzUzOpeVmgIL8UkESrPaDzO8dLfTFpJRszmXTjRIlDN7sulwPHV8jDUkb1EsSJ5pV1SPrzSO8SQUs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(1800799009)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(36756003)(7416002)(40460700003)(40480700001)(41300700001)(86362001)(4326008)(7696005)(5660300002)(8936002)(8676002)(26005)(1076003)(16526019)(426003)(6666004)(36860700001)(47076005)(2616005)(336012)(82740400003)(110136005)(81166007)(356005)(478600001)(2906002)(70586007)(54906003)(316002)(70206006)(921005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 09:33:31.8866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e76fc58-6ac3-4538-88ec-08dbaa05575e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797

From: Antonio Caggiano <antonio.caggiano@collabora.com>

The feature can be enabled when a backend wants it.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Tested-by: Alyssa Ross <hi@alyssa.is>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

This patch is already under review as part of the "rutabaga_gfx + gfxstream"
series (already in v13) and has been included here because of dependency.

 hw/display/virtio-gpu-base.c   | 3 +++
 include/hw/virtio/virtio-gpu.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index ca1fb7b16f..4f2b0ba1f3 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -232,6 +232,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_context_init_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
+    }
 
     return features;
 }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 390c4642b8..8377c365ef 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -93,6 +93,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -105,6 +106,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_context_init_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
-- 
2.34.1


