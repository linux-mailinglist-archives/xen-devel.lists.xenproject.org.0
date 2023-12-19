Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82308182CB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656556.1024842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFV0n-0005d1-Ok; Tue, 19 Dec 2023 07:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656556.1024842; Tue, 19 Dec 2023 07:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFV0n-0005at-L2; Tue, 19 Dec 2023 07:59:33 +0000
Received: by outflank-mailman (input) for mailman id 656556;
 Tue, 19 Dec 2023 07:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUxE-0000yA-Fl
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:55:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe59::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 063eb7e9-9e44-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 08:55:50 +0100 (CET)
Received: from MW4PR04CA0344.namprd04.prod.outlook.com (2603:10b6:303:8a::19)
 by SA1PR12MB8141.namprd12.prod.outlook.com (2603:10b6:806:339::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:55:46 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::81) by MW4PR04CA0344.outlook.office365.com
 (2603:10b6:303:8a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:55:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.7 via Frontend Transport; Tue, 19 Dec 2023 07:55:45 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:55:38 -0600
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
X-Inumbo-ID: 063eb7e9-9e44-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxH248a8VlMQAguQtWmaf/Oc/jwXb6GLZ6zDi8VFzT5Bq1aHQWymtG500mUtv44zW9X6VqOlQ+wg1ACYIW4QO7V9dFN+2l/n9sraBx+niuFgO3ur2jhbdvZiJdB/HcWoN2/qikcr9B31zrPPnwvLDLeCO38p5PwrWUZwPVzNbXBcwY4rWlQrLTDp0nVrdTmCjZCfNGoIetDRyMVifnvepTc8breZK/8i2DvJV4XaDv7qqRhJxEdnUR+bnrauU8wX9QYCRtQgO9Rd7hOHgOsnHua/TJ7c1563QlrPQq1mY0yYDE/6wKcvJVMC6tJcZ+GI5zIxu7jgQaOwGtXURwFdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bw1GHQ80hwkCkmkiyxUbfkBX9AiWfFOviT+2UNp4k4=;
 b=T83rQaw46Mg11PJZKYR736WaF5G57oeZ8ojfsbJUUHhEGMBT+QkDCKLKfaKWfgzehOfq1qRQAQAEjnKyVmyKnILih2Z8FIkupNJBSk8zV06MBKm5y18Usqo6BVi7LAtwP+kV276cMvlPEvYcvP1e30LtNPIIf4o3OJMbuwqhrs5o/wImYo9UKwV8el8yMddsI7ndbBXGJXtqIXU2E9wsk08aKvnKVzHMianr8oxlqQhDVa0OdgCx4jX+Qxxn8k/OTlwKFyv4+raUL4MxlYq6C/8f4ZzKDNZun+GnyHuG3bYfuHGciwbejGBw/PZ99y5Y0mNs+sApw+RfXApvFR4AQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bw1GHQ80hwkCkmkiyxUbfkBX9AiWfFOviT+2UNp4k4=;
 b=ogWVAZA1GUrvbiA1SpiHDqETImkkK1VQYA+vKjmm7rCxoiWNbazdWdfaLV7UKX+AC0Qu/lLzMEVzZKORwMb+28RX/vT+fEn+ry1y55vGjGoj23b4R4j72sUvDKIwelq9HdtqjDODLwfQ7RMskJeVjewvoEHvuQJzYMeeNojA+tA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Antonio Caggiano <quic_acaggian@quicinc.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, Robert Beckett
	<bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, <ernunes@redhat.com>, Alyssa Ross
	<hi@alyssa.is>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alex Deucher <alexander.deucher@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH v6 11/11] virtio-gpu: make blob scanout use dmabuf fd
Date: Tue, 19 Dec 2023 15:53:20 +0800
Message-ID: <20231219075320.165227-12-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219075320.165227-1-ray.huang@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SA1PR12MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b6ddd3-053f-4938-68f5-08dc0067e860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ju7LSNow33RojR281hoe4o+6CoqX1jc20JLHbzOSWR5Ld1uJF691cmiR3/wZzY3guM7PdtTTBw+oScGhpdpWPtOFgNDwKmxf2vNZ9ic6ua8G+cqF8AoyOKNaFtDZ4jIh+FNpMoMXJWez2kFGog+T2TatW+wKdLNGlnWReqwoOfXdaDnSFODRsGD8aR4yUTl45W7hWoldylopexd0kc7KLVtol8CeazsjzXupaS4ySVJgJYvJhlguXve3ORcXtV0iUey8NksmZDnTkPKHRE/11/VUKxAiFLXTAmYzLDzTWhied1m+uyeqArnrmk7t4/7g4v7VK3b0CwDiwpUSLwvbtYBLRIJwvpf2AEYjjsFuCc4/rHKKScus8fSmh13B71G7a8IaWL055wjJ3tvxChVUHOB1e4SoBEhmnwLtMV8yh606h7eWO6nbtHmKx3yhTafe1FGTaoMfo3dLDVRbmfNuPMeRH0BZ+OaoTZ2Dg1hjkUsa99uOT2od5d1V+c4ouHTppDuqlweybOxRs+uwpqv47sx/vgGdgxnfLf1nzo09iUHgfDUYJOSZTk2dngx5t4l9kNifdAS7IgLWSEuyHe5dY3TflcHzYJKgpUUaxDtPNaWO7nndqq9krUokgzkUD64WDmGJFhwBiADUOgzPk+Xeit+Fq2jdNr4xNVEmtYQvEM15ISM2+H/Whef7Ovadc/IqfiiHjcS40EpNFzkhzCwSOVvKOCYop6pxaOs7fvxqV0gEE9BR6TsoO6c0E1ulnRty80eW39oldDuFL9QXKgjOw+g5m6a9QJPRZqfN2o7Hj8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(478600001)(2616005)(1076003)(70586007)(336012)(426003)(6666004)(83380400001)(316002)(54906003)(110136005)(5660300002)(7696005)(47076005)(8676002)(8936002)(4326008)(26005)(36860700001)(70206006)(16526019)(7416002)(2906002)(40460700003)(81166007)(356005)(82740400003)(41300700001)(921008)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:55:45.8312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b6ddd3-053f-4938-68f5-08dc0067e860
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8141

From: Robert Beckett <bob.beckett@collabora.com>

This relies on a virglrenderer change to include the dmabuf fd when
returning resource info.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Changes in v6:
- Add scanout_blob function for virtio-gpu-virgl.
- Update for new virgl_gpu_resource.

 hw/display/virtio-gpu-virgl.c  | 104 +++++++++++++++++++++++++++++++++
 hw/display/virtio-gpu.c        |   4 +-
 include/hw/virtio/virtio-gpu.h |   6 ++
 3 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index c523a6717a..c384225a98 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -18,6 +18,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
+#include "hw/virtio/virtio-gpu-pixman.h"
 
 #include "ui/egl-helpers.h"
 
@@ -726,6 +727,106 @@ static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
     object_unparent(OBJECT(mr));
 }
 
+static void virgl_cmd_set_scanout_blob(VirtIOGPU *g,
+                                       struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virgl_gpu_resource *vres;
+    struct virtio_gpu_framebuffer fb = { 0 };
+    struct virtio_gpu_set_scanout_blob ss;
+    struct virgl_renderer_resource_info info;
+    uint64_t fbend;
+
+    VIRTIO_GPU_FILL_CMD(ss);
+    virtio_gpu_scanout_blob_bswap(&ss);
+    trace_virtio_gpu_cmd_set_scanout_blob(ss.scanout_id, ss.resource_id,
+                                          ss.r.width, ss.r.height, ss.r.x,
+                                          ss.r.y);
+
+    if (ss.scanout_id >= g->parent_obj.conf.max_outputs) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
+                      __func__, ss.scanout_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
+        return;
+    }
+
+    if (ss.resource_id == 0) {
+        virtio_gpu_disable_scanout(g, ss.scanout_id);
+        return;
+    }
+
+    if (ss.width < 16 ||
+        ss.height < 16 ||
+        ss.r.x + ss.r.width > ss.width ||
+        ss.r.y + ss.r.height > ss.height) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout %d bounds for"
+                      " resource %d, rect (%d,%d)+%d,%d, fb %d %d\n",
+                      __func__, ss.scanout_id, ss.resource_id,
+                      ss.r.x, ss.r.y, ss.r.width, ss.r.height,
+                      ss.width, ss.height);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    if (!console_has_gl(g->parent_obj.scanout[ss.scanout_id].con)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: unable to scanout blot without GL!\n", __func__);
+        return;
+    }
+
+    vres = virgl_gpu_find_resource(g, ss.resource_id);
+    if (!vres) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: illegal resource specified %d\n",
+                      __func__, ss.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+    if (virgl_renderer_resource_get_info(ss.resource_id, &info)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: illegal virgl resource specified %d\n",
+                      __func__, ss.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+    if (!vres->res.dmabuf_fd && info.fd)
+        vres->res.dmabuf_fd = info.fd;
+
+    fb.format = virtio_gpu_get_pixman_format(ss.format);
+    if (!fb.format) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: host couldn't handle guest format %d\n",
+                      __func__, ss.format);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    fb.bytes_pp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(fb.format), 8);
+    fb.width = ss.width;
+    fb.height = ss.height;
+    fb.stride = ss.strides[0];
+    fb.offset = ss.offsets[0] + ss.r.x * fb.bytes_pp + ss.r.y * fb.stride;
+
+    fbend = fb.offset;
+    fbend += fb.stride * (ss.r.height - 1);
+    fbend += fb.bytes_pp * ss.r.width;
+    if (fbend > vres->res.blob_size) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: fb end out of range\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    g->parent_obj.enable = 1;
+    if (virtio_gpu_update_dmabuf(g, ss.scanout_id, &vres->res,
+                                 &fb, &ss.r)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: failed to update dmabuf\n", __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+    virtio_gpu_update_scanout(g, ss.scanout_id, &vres->res, &ss.r);
+}
+
 #endif /* HAVE_VIRGL_RESOURCE_BLOB */
 
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
@@ -807,6 +908,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
         virgl_cmd_resource_unmap_blob(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_SET_SCANOUT_BLOB:
+        virgl_cmd_set_scanout_blob(g, cmd);
+        break;
 #endif /* HAVE_VIRGL_RESOURCE_BLOB */
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 466debb256..492f578b4b 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -380,7 +380,7 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
     QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
-static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
+void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
     struct virtio_gpu_simple_resource *res;
@@ -592,7 +592,7 @@ static void virtio_unref_resource(pixman_image_t *image, void *data)
     pixman_image_unref(data);
 }
 
-static void virtio_gpu_update_scanout(VirtIOGPU *g,
+void virtio_gpu_update_scanout(VirtIOGPU *g,
                                       uint32_t scanout_id,
                                       struct virtio_gpu_simple_resource *res,
                                       struct virtio_gpu_rect *r)
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 76b410fe91..ac2adfb607 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -332,6 +332,12 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              struct virtio_gpu_framebuffer *fb,
                              struct virtio_gpu_rect *r);
 
+void virtio_gpu_update_scanout(VirtIOGPU *g,
+                               uint32_t scanout_id,
+                               struct virtio_gpu_simple_resource *res,
+                               struct virtio_gpu_rect *r);
+void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id);
+
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
-- 
2.25.1


