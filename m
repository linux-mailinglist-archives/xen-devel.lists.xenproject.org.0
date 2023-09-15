Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03EE7A1D3B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603041.939945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6nr-0000Fw-SJ; Fri, 15 Sep 2023 11:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603041.939945; Fri, 15 Sep 2023 11:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh6nr-0000D2-P2; Fri, 15 Sep 2023 11:16:03 +0000
Received: by outflank-mailman (input) for mailman id 603041;
 Fri, 15 Sep 2023 11:16:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGil=E7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1qh6lP-0002xb-5h
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:13:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eab::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5a23351-53b8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 13:13:30 +0200 (CEST)
Received: from DM6PR02CA0043.namprd02.prod.outlook.com (2603:10b6:5:177::20)
 by LV8PR12MB9406.namprd12.prod.outlook.com (2603:10b6:408:20b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Fri, 15 Sep
 2023 11:13:24 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::bb) by DM6PR02CA0043.outlook.office365.com
 (2603:10b6:5:177::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.22 via Frontend
 Transport; Fri, 15 Sep 2023 11:13:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 11:13:23 +0000
Received: from hr-test6.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 06:13:17 -0500
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
X-Inumbo-ID: e5a23351-53b8-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+PmToRAZ22IXx9RuQXK2ST3CSDa7hyDTLoWx93wa7o/X3gaHbOoP02DZK8fLR/8uf95KcpzDlHr4Qn2CO87Yp5YxZqiUhoWXQQ7YI6d8nUPjuQVcK8QoAjxlwC/Zje+a0V5ZmSB88RPdKMMqsQAw3ednH8H29OBNy7OieEQVolMYeTeCGYCx+gCzPk3XpwXseatLC/MI9/LsH3vk3ioUQo3d40jL/21mmWbJSPFDRean8YTarpgOwktrHpPb/THTLgQe5j8Of7IdKVI8PBiXYWq4KCPCJUiH+XnjMuXMAZcr8+FhwcDFuWrZczul2NqKgIqq+C71LnKhKvKVpQ3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quNgyx8sLQYdRUOKh2lHcxSCvwJ/Gs8OZw0KqZsqGkE=;
 b=XQLhNPTxmslh6zAbLmJUrXK/vm0hny5Sn0vLxkY/9YCAHw5To+s79Fa3P0u9xmoIZDAWsdemou0lNTZzME+d4u2lb7/uj2IyJL6NkrT4Nb7N2Bce23GhtEToi3KrY3Rp2TKFH8/pi0BSEJFDGyVtdnktqQOTa8AWeD2yYdohKJf6mQ/FdcrWx/NmzGOs588MMOk8a+x+yn08+RBgBeoqC8poNV9td34fE/+pfBZtOQoHlXMl33/8bHwLdk7qQaex1U8/B1Zo25Fjk7PZcpT1/aYnYZblbg0/ieEpwiy1avWdlGYvVDTLDIlSspO0mSzDcqrT92mq6UD8US1YmQG+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quNgyx8sLQYdRUOKh2lHcxSCvwJ/Gs8OZw0KqZsqGkE=;
 b=ZEefhonbjcmhC1kokH1o93PVeSxUQ1Yus5QC03UnTFKTuc9Uzg5kB/nGPpCuqp1IgDWEZmCQBdIWfGRBxCJVtRyzS18O6XBRsCH77xDzp8p15nBpMs6llh/S8vCKg5YpaaqQtftv5jSAlf9EicifKbgQLADObOjuy+207a8vILM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Antonio Caggiano" <quic_acaggian@quicinc.com>, "Dr . David Alan Gilbert"
	<dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>, "Dmitry
 Osipenko" <dmitry.osipenko@collabora.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, Gurchetan Singh
	<gurchetansingh@chromium.org>, Albert Esteve <aesteve@redhat.com>,
	<ernunes@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, Alyssa Ross <hi@alyssa.is>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Honglei
 Huang" <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Antonio Caggiano
	<antonio.caggiano@collabora.com>, Huang Rui <ray.huang@amd.com>
Subject: [QEMU PATCH v5 10/13] virtio-gpu: Resource UUID
Date: Fri, 15 Sep 2023 19:11:27 +0800
Message-ID: <20230915111130.24064-11-ray.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915111130.24064-1-ray.huang@amd.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|LV8PR12MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 415fb7bd-8e7f-4477-9200-08dbb5dcc70e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TV7L0dSpc9+RG+zqytEuk2ScpZm3DXBUQonJ2iaXkpWuhczfNspy7BsdSUdRI4nnrMEPue6Xp3XSSG9eY1aL47xF2ZaEF/J1UhbxnLHDa+wx8cKqiYqs0521J50AkqQ3Dp/+OyDsEpkOLCeviCMBJJHk3Pj1ONYuv98//7F+EDRpGmdrsns9E4Onoa11GfAIKm/B9AACjN0UoFapPhDTSxor02GoPxNJhHzwm4oYcXFrEi8s0ikNunK2eGYlBbAFZIU94Hr2lGc14stTtbqLXGsjQRihBY92WJy3GFOgfh0zhiUuKN4nLUHv5baSoIC3iFoSvCvZ6gRyvMW06Rv4/smoGHirI8d7UkgokS8H0s8lAgtsmiPQuYFzkWKmP+hxCGYocN11swQkQpjrGvZSmcGLKqnO482Tf8MeyNM4Qvx9N71N0myB3aFY/mqbZj0jQ7Q5e8fsToBE8GE7W/xmPEvjJ3Qx2yzDYQd7ISGAX/VEY03HYZTc1PTFrnKc0t/guVUwuRxV1qXfGB2NVLJ/72yX4qlH6DCuzWgSj9fXxkdVIsrkkGJU9iVH3k8+LxC28JLxQAS7kE+Kh5XTK3XQcGOxhKv1pJvUrxat3QekymlfGj6sPSq/Vnh30b8aANrBrxILU1LoHssZOLoVCjQP+OmW/VnxHEMts/HoBEOEtLlSzrNHi/GgRKrUau9wefLUbwF6vxf1c+xwKlDFntSZB5kBz8kveMNAec8LmbiqBnuOxNWE9pVg0u90Qe1y+jnTAYaBnv3lOQu659nGNkBIZF6hBi4ddV8qmiqdxkyb+eY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(83380400001)(70206006)(2906002)(6666004)(36756003)(7416002)(4326008)(54906003)(70586007)(8676002)(8936002)(40460700003)(41300700001)(5660300002)(86362001)(47076005)(81166007)(110136005)(2616005)(356005)(921005)(478600001)(7696005)(336012)(36860700001)(316002)(426003)(26005)(16526019)(82740400003)(1076003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 11:13:23.9329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 415fb7bd-8e7f-4477-9200-08dbb5dcc70e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9406

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Enable resource UUID feature and implement command resource assign UUID.
This is done by introducing a hash table to map resource IDs to their
UUIDs.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---

V4 -> V5:
    - Add virtio migration handling for uuid (Akihiko)
    - Adjust sequence to allocate gpu resource before virglrender resource
      creation (Akihiko)
    - Clean up (Akihiko)

 hw/display/trace-events        |  1 +
 hw/display/virtio-gpu-base.c   |  2 ++
 hw/display/virtio-gpu-virgl.c  | 21 ++++++++++++
 hw/display/virtio-gpu.c        | 58 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  6 ++++
 5 files changed, 88 insertions(+)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 2336a0ca15..54d6894c59 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
 virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 4f2b0ba1f3..f44388715c 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -236,6 +236,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
     }
 
+    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 563a6f2f58..8a017dbeb4 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -36,11 +36,20 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
 {
     struct virtio_gpu_resource_create_2d c2d;
     struct virgl_renderer_resource_create_args args;
+    struct virtio_gpu_simple_resource *res;
 
     VIRTIO_GPU_FILL_CMD(c2d);
     trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
                                        c2d.width, c2d.height);
 
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    if (!res) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+        return;
+    }
+    res->resource_id = c2d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
+
     args.handle = c2d.resource_id;
     args.target = 2;
     args.format = c2d.format;
@@ -60,11 +69,20 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
 {
     struct virtio_gpu_resource_create_3d c3d;
     struct virgl_renderer_resource_create_args args;
+    struct virtio_gpu_simple_resource *res;
 
     VIRTIO_GPU_FILL_CMD(c3d);
     trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
                                        c3d.width, c3d.height, c3d.depth);
 
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    if (!res) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
+        return;
+    }
+    res->resource_id = c3d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
+
     args.handle = c3d.resource_id;
     args.target = c3d.target;
     args.format = c3d.format;
@@ -682,6 +700,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         /* TODO add security */
         virgl_cmd_ctx_detach_resource(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
         virgl_cmd_get_capset_info(g, cmd);
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index cc4c1f81bb..44414c1c5e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -966,6 +966,38 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_assign_uuid assign;
+    struct virtio_gpu_resp_resource_uuid resp;
+    QemuUUID *uuid;
+
+    VIRTIO_GPU_FILL_CMD(assign);
+    virtio_gpu_bswap_32(&assign, sizeof(assign));
+    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
+
+    res = virtio_gpu_find_check_resource(g, assign.resource_id, false, __func__, &cmd->error);
+    if (!res) {
+        return;
+    }
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
+
+    uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id));
+    if (!uuid) {
+        uuid = g_new(QemuUUID, 1);
+        qemu_uuid_generate(uuid);
+        g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);
+        res->has_uuid = true;
+    }
+
+    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
 void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
                                    struct virtio_gpu_ctrl_command *cmd)
 {
@@ -1014,6 +1046,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
@@ -1208,6 +1243,7 @@ static int virtio_gpu_save(QEMUFile *f, void *opaque, size_t size,
     VirtIOGPU *g = opaque;
     struct virtio_gpu_simple_resource *res;
     int i;
+    QemuUUID *uuid;
 
     /* in 2d mode we should never find unprocessed commands here */
     assert(QTAILQ_EMPTY(&g->cmdq));
@@ -1224,9 +1260,17 @@ static int virtio_gpu_save(QEMUFile *f, void *opaque, size_t size,
         }
         qemu_put_buffer(f, (void *)pixman_image_get_data(res->image),
                         pixman_image_get_stride(res->image) * res->height);
+
+        qemu_put_byte(f, res->has_uuid);
+        if (res->has_uuid) {
+            uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(res->resource_id));
+            qemu_put_buffer(f, (void *)uuid, sizeof(QemuUUID));
+        }
     }
     qemu_put_be32(f, 0); /* end of list */
 
+    g_hash_table_destroy(g->resource_uuids);
+
     return vmstate_save_state(f, &vmstate_virtio_gpu_scanouts, g, NULL);
 }
 
@@ -1239,9 +1283,12 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
     uint32_t resource_id, pformat;
     void *bits = NULL;
     int i;
+    QemuUUID *uuid = NULL;
 
     g->hostmem = 0;
 
+    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
     resource_id = qemu_get_be32(f);
     while (resource_id != 0) {
         res = virtio_gpu_find_resource(g, resource_id);
@@ -1292,6 +1339,12 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
         qemu_get_buffer(f, (void *)pixman_image_get_data(res->image),
                         pixman_image_get_stride(res->image) * res->height);
 
+        res->has_uuid = qemu_get_byte(f);
+        if (res->has_uuid) {
+            qemu_get_buffer(f, (void *)uuid, sizeof(QemuUUID));
+            g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(res->resource_id), uuid);
+        }
+
         /* restore mapping */
         for (i = 0; i < res->iov_cnt; i++) {
             hwaddr len = res->iov[i].iov_len;
@@ -1393,12 +1446,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+
+    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
 }
 
 static void virtio_gpu_device_unrealize(DeviceState *qdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
+    g_hash_table_destroy(g->resource_uuids);
     g_clear_pointer(&g->ctrl_bh, qemu_bh_delete);
     g_clear_pointer(&g->cursor_bh, qemu_bh_delete);
     g_clear_pointer(&g->reset_bh, qemu_bh_delete);
@@ -1452,6 +1508,8 @@ void virtio_gpu_reset(VirtIODevice *vdev)
         g_free(cmd);
     }
 
+    g_hash_table_remove_all(g->resource_uuids);
+
     virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
 }
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index b9adc28071..67b39fccec 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -63,6 +63,8 @@ struct virtio_gpu_simple_resource {
     MemoryRegion *region;
 #endif
 
+    bool has_uuid;
+
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
@@ -208,6 +210,8 @@ struct VirtIOGPU {
         QTAILQ_HEAD(, VGPUDMABuf) bufs;
         VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
     } dmabuf;
+
+    GHashTable *resource_uuids;
 };
 
 struct VirtIOGPUClass {
@@ -285,6 +289,8 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
 void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                 struct virtio_gpu_simple_resource *res);
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
-- 
2.34.1


