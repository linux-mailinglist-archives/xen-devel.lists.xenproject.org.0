Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C988182A3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 08:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656527.1024801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwL-000255-44; Tue, 19 Dec 2023 07:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656527.1024801; Tue, 19 Dec 2023 07:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFUwL-00022r-0n; Tue, 19 Dec 2023 07:54:57 +0000
Received: by outflank-mailman (input) for mailman id 656527;
 Tue, 19 Dec 2023 07:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oURO=H6=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1rFUwJ-0008Dp-EY
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 07:54:55 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe59::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4f70a64-9e43-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 08:54:54 +0100 (CET)
Received: from MW2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:907::24) by
 CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 07:54:47 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:907:0:cafe::7) by MW2PR16CA0011.outlook.office365.com
 (2603:10b6:907::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 07:54:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.8 via Frontend Transport; Tue, 19 Dec 2023 07:54:46 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 01:54:39 -0600
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
X-Inumbo-ID: e4f70a64-9e43-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGmax1MMDMZaZkGrKK3BKhXgX8wXJBI+AiEiSSKAaP0EPo4b02z+lQPa0yOpWKHRAAEN2j37nQhg7XCYToNtCYpIxxWTy0LGZdbWGw51C5VcVDHTnliHO0kPrzwFNsnPC5055nfpYYxSB5Qz9X4xE5oCQ4xS7hJdUnQlui2TPnBd+QfDaSziYkQFJ7idXYW4o7WzvPMkCT61H1jIsvhggHrCqz/y++UKWXzLv2VRg6CGKz8mI4kEq9pwWmDq5YmOV050S4nTOW8IUlgJhcTDSo/X7OIxL7D2FMpL6hTXoNh5pLi1mI2QI3ZfrrNFdKHnE7Mg0VYp+nGbgE7qMEWReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gjQXkZmdUlI5mi+HNsQt6K/uSUkTS4zo4/9zOqeuPo=;
 b=QozNBOIoMul1LU8Uu2SNcQeUPBNVTqQzusWejVPegsmKSihHehn9Jm7flbxrXS9Bxnek2kjqna70bQjho5oaCuM9EnNckyjyrSsoGSkvqzSc52B/RgPfCktchm+Q5ibZ4pHPRcMsFKATlSR1I97oRE4D9GSKwlhxONdjkVuZ8AKXcKQVhky2YSSBWQSZAv7q7eol+vKIkCItkDCLksEmffmltgeEq85deG7uAC/oJ6IYePTD4LI+QcZOgRAMz6d21MZIn252j+01Lf1sU620D3cIVWOrv4nJ2mVCtw3R/j32We+c2sA+06BKO1nFINluPlUG4jTiouQPYwIUvrELjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=daynix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gjQXkZmdUlI5mi+HNsQt6K/uSUkTS4zo4/9zOqeuPo=;
 b=kLQb6M+9jDxrgyIYoH1Zuafj2Wnmnupf3SOlaIW5fpgi+yYtrxOwjqbXT8mWO6DHunwBKZaVa+mshdI6f5oSO8mds4AKIapIYcWXEQHwAsydy4hrDfsPjuRgOf/i+jVus/1Z8NxnrOJfCT+VHdbXsR7x69jNC+oMopsSGrKmZhw=
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
Subject: [PATCH v6 05/11] virtio-gpu: Introduce virgl_gpu_resource structure
Date: Tue, 19 Dec 2023 15:53:14 +0800
Message-ID: <20231219075320.165227-6-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db3e0b3-32b2-47c1-1214-08dc0067c528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lAtoYfukDt1MoY3K87nkoXbs8OUr8IJKcEtYvVh7Ak/2MI9XmWnnr+scICo+UjOK69CmSgW9o0azfHo7I5CbxVO43ZvVa6xXHsLAH3ERDuumER+j4vrTcRBG6oBqmsIQWzegDKm10fSjJWUcQp2wr1hFxK0ofkgmDIxNizQTfgSNfstMgsT7wzPNXaeRK87dNT/oeJ4XQg7g5PfuSfQSrTps8uJ0uE4KdvqQRxuDz90xVMXONK6EtV6njRkcvG+/PJaE6jAbonL2IIQUm8WTUiCZYEyN+DDlPKZGCUAKHpUMWHCuIVPKCgOjh/VTkdvaopwqVZHaYBJ5GyqepowMql6+ktSn0ufMWlXwK/civTnM8IpzlJvUfHTq/c/bnwj6S0Mn1C52FNjw0cd4hl4J94hujTNstW0oMspJudR68otJxf12/ORbaW7syjZIWJh+z0e4Vfpz8ZKHx7IZvHhu825a0YEl9ntakKVKcTWlz7y+Uu6bDtZmsNaHVpGpxQqPT03r7SKxBDdvrb+yqoDaMER/7LOEl+Ja9aLol4XsN+uIhzA2Twqr2nAvF7I80ujkzI5mSDBRyhah6XLquXArSrjL9Ssugv2nPQy+Et/lONl3Cylnl8H0S/OPA58MTewSVsj0dDdaVkrOTk3wbP8/AvrXxUGQZXhAlcbMjIDBsUtJdyPCaZWSszyYgqYAZCy8uGbW2ycXOT+81/Evn5VYZ9dR45/yVr0ockhulz8VUlDwsj9ABYC/VCVMeOtIrN8tD689harnnlKAsXUdA0+4K2PdLYiCppLm5s6qV2kLpH4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(40480700001)(6666004)(1076003)(2616005)(426003)(16526019)(336012)(26005)(40460700003)(356005)(81166007)(82740400003)(921008)(36756003)(86362001)(47076005)(83380400001)(5660300002)(7696005)(36860700001)(8936002)(8676002)(4326008)(316002)(70586007)(70206006)(54906003)(110136005)(7416002)(2906002)(41300700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 07:54:46.7574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db3e0b3-32b2-47c1-1214-08dc0067c528
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689

Introduce a new virgl_gpu_resource data structure and helper functions
for virgl. It's used to add new member which is specific for virgl in
following patches of blob memory support.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---

New patch:
- Introduce new struct virgl_gpu_resource to store virgl specific members.
- Move resource initialization from path "virtio-gpu: Resource UUID" here.
- Remove error handling of g_new0, because glib will abort() on OOM.
- Set iov and iov_cnt in struct virtio_gpu_simple_resource for all types
  of resources.

 hw/display/virtio-gpu-virgl.c | 84 ++++++++++++++++++++++++++---------
 1 file changed, 64 insertions(+), 20 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 5bbc8071b2..faab374336 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -22,6 +22,23 @@
 
 #include <virglrenderer.h>
 
+struct virgl_gpu_resource {
+    struct virtio_gpu_simple_resource res;
+};
+
+static struct virgl_gpu_resource *
+virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
+{
+    struct virtio_gpu_simple_resource *res;
+
+    res = virtio_gpu_find_resource(g, resource_id);
+    if (!res) {
+        return NULL;
+    }
+
+    return container_of(res, struct virgl_gpu_resource, res);
+}
+
 #if VIRGL_RENDERER_CALLBACKS_VERSION >= 4
 static void *
 virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
@@ -35,11 +52,19 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
 {
     struct virtio_gpu_resource_create_2d c2d;
     struct virgl_renderer_resource_create_args args;
+    struct virgl_gpu_resource *vres;
 
     VIRTIO_GPU_FILL_CMD(c2d);
     trace_virtio_gpu_cmd_res_create_2d(c2d.resource_id, c2d.format,
                                        c2d.width, c2d.height);
 
+    vres = g_new0(struct virgl_gpu_resource, 1);
+    vres->res.width = c2d.width;
+    vres->res.height = c2d.height;
+    vres->res.format = c2d.format;
+    vres->res.resource_id = c2d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
+
     args.handle = c2d.resource_id;
     args.target = 2;
     args.format = c2d.format;
@@ -59,11 +84,19 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
 {
     struct virtio_gpu_resource_create_3d c3d;
     struct virgl_renderer_resource_create_args args;
+    struct virgl_gpu_resource *vres;
 
     VIRTIO_GPU_FILL_CMD(c3d);
     trace_virtio_gpu_cmd_res_create_3d(c3d.resource_id, c3d.format,
                                        c3d.width, c3d.height, c3d.depth);
 
+    vres = g_new0(struct virgl_gpu_resource, 1);
+    vres->res.width = c3d.width;
+    vres->res.height = c3d.height;
+    vres->res.format = c3d.format;
+    vres->res.resource_id = c3d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, &vres->res, next);
+
     args.handle = c3d.resource_id;
     args.target = c3d.target;
     args.format = c3d.format;
@@ -82,19 +115,23 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
                                      struct virtio_gpu_ctrl_command *cmd)
 {
     struct virtio_gpu_resource_unref unref;
-    struct iovec *res_iovs = NULL;
-    int num_iovs = 0;
+    struct virgl_gpu_resource *vres;
 
     VIRTIO_GPU_FILL_CMD(unref);
     trace_virtio_gpu_cmd_res_unref(unref.resource_id);
 
-    virgl_renderer_resource_detach_iov(unref.resource_id,
-                                       &res_iovs,
-                                       &num_iovs);
-    if (res_iovs != NULL && num_iovs != 0) {
-        virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
+    vres = virgl_gpu_find_resource(g, unref.resource_id);
+    if (!vres) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
     }
+
+    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
     virgl_renderer_resource_unref(unref.resource_id);
+
+    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
+    virtio_gpu_cleanup_mapping(g, &vres->res);
+    g_free(vres);
 }
 
 static void virgl_cmd_context_create(VirtIOGPU *g,
@@ -310,44 +347,51 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
                                           struct virtio_gpu_ctrl_command *cmd)
 {
     struct virtio_gpu_resource_attach_backing att_rb;
-    struct iovec *res_iovs;
-    uint32_t res_niov;
+    struct virgl_gpu_resource *vres;
     int ret;
 
     VIRTIO_GPU_FILL_CMD(att_rb);
     trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
 
+    vres = virgl_gpu_find_resource(g, att_rb.resource_id);
+    if (!vres) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
     ret = virtio_gpu_create_mapping_iov(g, att_rb.nr_entries, sizeof(att_rb),
-                                        cmd, NULL, &res_iovs, &res_niov);
+                                        cmd, NULL, &vres->res.iov,
+                                        &vres->res.iov_cnt);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
     }
 
     ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
-                                             res_iovs, res_niov);
+                                             vres->res.iov, vres->res.iov_cnt);
 
-    if (ret != 0)
-        virtio_gpu_cleanup_mapping_iov(g, res_iovs, res_niov);
+    if (ret != 0) {
+        virtio_gpu_cleanup_mapping(g, &vres->res);
+    }
 }
 
 static void virgl_resource_detach_backing(VirtIOGPU *g,
                                           struct virtio_gpu_ctrl_command *cmd)
 {
     struct virtio_gpu_resource_detach_backing detach_rb;
-    struct iovec *res_iovs = NULL;
-    int num_iovs = 0;
+    struct virgl_gpu_resource *vres;
 
     VIRTIO_GPU_FILL_CMD(detach_rb);
     trace_virtio_gpu_cmd_res_back_detach(detach_rb.resource_id);
 
-    virgl_renderer_resource_detach_iov(detach_rb.resource_id,
-                                       &res_iovs,
-                                       &num_iovs);
-    if (res_iovs == NULL || num_iovs == 0) {
+    vres = virgl_gpu_find_resource(g, detach_rb.resource_id);
+    if (!vres) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
     }
-    virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
+
+    virgl_renderer_resource_detach_iov(detach_rb.resource_id, NULL, NULL);
+    virtio_gpu_cleanup_mapping(g, &vres->res);
 }
 
 
-- 
2.25.1


