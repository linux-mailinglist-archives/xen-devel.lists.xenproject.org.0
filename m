Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036CE213745
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 11:09:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrHge-0005Kl-FC; Fri, 03 Jul 2020 09:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI2g=AO=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jrHgd-0005Ii-HV
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 09:08:47 +0000
X-Inumbo-ID: c8680668-bd0c-11ea-8952-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.113]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8680668-bd0c-11ea-8952-12813bfff9fa;
 Fri, 03 Jul 2020 09:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEXBFWXolDSfynR9N5L4t8RaSCh6a4M4GlO0Uq/4ssKuJMmEuGikukMKvCoq+zS1rj6nhHnZdsAUmYltRV9toOKrn/GixbjwWNOZRJvyQr64eeNDfCNG/WbbbnAcC+YRYYrexU0IjIpLRO/7GMQnQU0hPXl17Mub1nxQ5M1zlkBH7OqRyh5JHEy2Gi0KmWBhO42d/PWVM7BBqWD0fYY7otSWRfjdAza6pfZeYrCSGGYOrSIfyqVY8pe2kIRQyKIb0H4bbtA+QTZYLAm0ndkIucn3q1brnLyg8ECHv/HvtI6iIRwaENIR4O4CcifDn/ipXA4vj5FTXCUP8CPiwna91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3kGYHvlNVVBkZs5SrhRbcEeydQhpoNgVqChlyjDEQc=;
 b=jzuBFyVTi6nAIGkq+o5nFSLO2CkadTeb23dX+gArX2ry3gAfQ6QdZF0xmkppoWIjg/iDPhXXyQGTdpbnP2bwoU7Vg+sOBW4pE9MIuvIQu2yclWZ+nGm2Tez8gfzLoELJU4EA4u0edSAVpUrJag/0v9EnR6tMn9ybDH4nI8RUKYnw/btuDgW/ONqdWso9iH6l3krl5l73Je1y35P/f2VNVFwmzRu0jNrIdAtg/UWIQMc90stZupvbFAgyG9yDE1xXcXMNkhQ+4t94yZjthOEyVkGcDDsHS1g/juI/qkjGbkZOw7pJ/DSWBSybLVBJRB3Hsz8GynEQFhurZDKi3rjYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3kGYHvlNVVBkZs5SrhRbcEeydQhpoNgVqChlyjDEQc=;
 b=MmX8+GFG+7VmKxkygdLlcYAFXKe+BzwVrKp77UJZvRyQ3fix8dQJ4ZkE2sv+N0APEoQAnYP1ic6fd0SY8iXwMLUqQZMxCgZbZ0Uf+5cK0ExoyPk6lH/M9CDocqI1jUD91Hv4ySUvIQt0+5A+6bF469Z+NCa34yknY+9//7wRxrk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5448.eurprd08.prod.outlook.com (2603:10a6:20b:106::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Fri, 3 Jul
 2020 09:08:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%4]) with mapi id 15.20.3131.028; Fri, 3 Jul 2020
 09:08:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 8/8] xen: introduce ERRP_AUTO_PROPAGATE
Date: Fri,  3 Jul 2020 12:08:16 +0300
Message-Id: <20200703090816.3295-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200703090816.3295-1-vsementsov@virtuozzo.com>
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.15) by
 AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Fri, 3 Jul 2020 09:08:36 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e43f4e21-3220-4e9b-4abb-08d81f30abbd
X-MS-TrafficTypeDiagnostic: AM7PR08MB5448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54480D6AF6D6246E0CF7C03BC16A0@AM7PR08MB5448.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:111;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCLB8Bed3qM7GO6hyN2mOaPrFDo/sJnWcVg4Fmw4b0NEsqdiavpu3nXFvLG55Q6maiexFIWBisQjssFRg8t0Oz7oQ5f3DQYFI2tujPB4gGWiiK8Ie7FYZkFmrO0feoJ3540aR8Enn5W6dsMD+GFcL6lG++JhqylfXZ9/fVyT+S3hcNo7YWpkJh5xDcP2JE1h/bR3J0XoNqFz9/Egg7YT3KrmXPcQyhPDH1ogdnnMPkWzH++KkfkydKh6GxjdBx4XbTmi/+N1WPCPF6RVcjAFGmj5bkVEjqkvIlSJU42mtEJNCXpxRjsMNDDjOdmiauaqWX6Cc5EE9mPwZM/h+ackB/UxhSMhhJ/RWlRYr72qzqBk8ywJyYZ8pbGeBIe6mPY5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(69590400007)(66946007)(66476007)(66556008)(2906002)(86362001)(1076003)(30864003)(8676002)(83380400001)(6512007)(5660300002)(8936002)(6666004)(186003)(36756003)(4326008)(6506007)(16526019)(6486002)(6916009)(7416002)(26005)(478600001)(956004)(52116002)(316002)(54906003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 2qnLOqbaUiCJ0+ghjPDCHzZQ0tKyhmIciNrS2b9aAeMOV02kT9O3OA4g7alFe2VcRGp+IgEWV6XtXRrnhS70zUTH8l2Vlqpj/uymP9gprTmz9RwmMBSd6K6EbPF5vHBXwDhTk4Qf2H4scMd+HbWBWhsXgNxgJWlp2foMgpIC5m9sdD9fbjNi7fagUoJrNRG1hNYymPNxQz9KjZfydS1073EO1PEiEdYuy2L862FKoOnCg74aXajDyOJhw2J4mJj6DPmbso8rgTpcomuo2c/GA//078pfuL8FQ+wUSpQzP+jH7zdX+nRpx58ghvECp09+pcYnjgRElKzWjJFhAKV4B1P9Bx5JvjaeCUQChKE/CNE6EuRjLX5hq7ZZpD/UW1e0JpKxtIE4NZzE3G6eXBlD0ojYbWuO3yJZxWZxWXAF3rZ8b8bDpVKe/gYZrOg32e3L8GiMf3jTXCfQ0Y0HaBBWEAwsCAG6rChRV6zdz5lKmkY=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43f4e21-3220-4e9b-4abb-08d81f30abbd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 09:08:37.5166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSuU19i+Fp1FIeAVShwRmY9QGqFdrJc//j+Ok0ju92d4m+P83i3oDUqii9J9tK3PbgYoTLxVPr9M9FTwnX2FgreYws1GuXAJnWOkQ3NYoeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5448
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, armbru@redhat.com,
 groug@kaod.org, vsementsov@virtuozzo.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, eblake@redhat.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If we want to add some info to errp (by error_prepend() or
error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
Otherwise, this info will not be added when errp == &error_fatal
(the program will exit prior to the error_append_hint() or
error_prepend() call).  Fix such cases.

If we want to check error after errp-function call, we need to
introduce local_err and then propagate it to errp. Instead, use
ERRP_AUTO_PROPAGATE macro, benefits are:
1. No need of explicit error_propagate call
2. No need of explicit local_err variable: use errp directly
3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
   &error_fatal, this means that we don't break error_abort
   (we'll abort on error_set, not on error_propagate)

This commit is generated by command

    sed -n '/^X86 Xen CPUs$/,/^$/{s/^F: //p}' MAINTAINERS | \
    xargs git ls-files | grep '\.[hc]$' | \
    xargs spatch \
        --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
        --macro-file scripts/cocci-macro-file.h \
        --in-place --no-show-diff --max-width 80

Reported-by: Kevin Wolf <kwolf@redhat.com>
Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/block/dataplane/xen-block.c |  17 +++---
 hw/block/xen-block.c           | 102 ++++++++++++++-------------------
 hw/pci-host/xen_igd_pt.c       |   7 +--
 hw/xen/xen-backend.c           |   7 +--
 hw/xen/xen-bus.c               |  92 +++++++++++++----------------
 hw/xen/xen-host-pci-device.c   |  27 +++++----
 hw/xen/xen_pt.c                |  25 ++++----
 hw/xen/xen_pt_config_init.c    |  17 +++---
 8 files changed, 128 insertions(+), 166 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 5f8f15778b..1a077cc05f 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -723,8 +723,8 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
                                unsigned int protocol,
                                Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenDevice *xendev = dataplane->xendev;
-    Error *local_err = NULL;
     unsigned int ring_size;
     unsigned int i;
 
@@ -760,9 +760,8 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
     }
 
     xen_device_set_max_grant_refs(xendev, dataplane->nr_ring_ref,
-                                  &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                                  errp);
+    if (*errp) {
         goto stop;
     }
 
@@ -770,9 +769,8 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
                                               dataplane->ring_ref,
                                               dataplane->nr_ring_ref,
                                               PROT_READ | PROT_WRITE,
-                                              &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                                              errp);
+    if (*errp) {
         goto stop;
     }
 
@@ -805,9 +803,8 @@ void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
     dataplane->event_channel =
         xen_device_bind_event_channel(xendev, event_channel,
                                       xen_block_dataplane_event, dataplane,
-                                      &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                                      errp);
+    if (*errp) {
         goto stop;
     }
 
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index a775fba7c0..623ae5b8e0 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -195,6 +195,7 @@ static const BlockDevOps xen_block_dev_ops = {
 
 static void xen_block_realize(XenDevice *xendev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenBlockDevice *blockdev = XEN_BLOCK_DEVICE(xendev);
     XenBlockDeviceClass *blockdev_class =
         XEN_BLOCK_DEVICE_GET_CLASS(xendev);
@@ -202,7 +203,6 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     XenBlockVdev *vdev = &blockdev->props.vdev;
     BlockConf *conf = &blockdev->props.conf;
     BlockBackend *blk = conf->blk;
-    Error *local_err = NULL;
 
     if (vdev->type == XEN_BLOCK_VDEV_TYPE_INVALID) {
         error_setg(errp, "vdev property not set");
@@ -212,9 +212,8 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     trace_xen_block_realize(type, vdev->disk, vdev->partition);
 
     if (blockdev_class->realize) {
-        blockdev_class->realize(blockdev, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        blockdev_class->realize(blockdev, errp);
+        if (*errp) {
             return;
         }
     }
@@ -280,8 +279,8 @@ static void xen_block_frontend_changed(XenDevice *xendev,
                                        enum xenbus_state frontend_state,
                                        Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     enum xenbus_state backend_state = xen_device_backend_get_state(xendev);
-    Error *local_err = NULL;
 
     switch (frontend_state) {
     case XenbusStateInitialised:
@@ -290,15 +289,13 @@ static void xen_block_frontend_changed(XenDevice *xendev,
             break;
         }
 
-        xen_block_disconnect(xendev, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        xen_block_disconnect(xendev, errp);
+        if (*errp) {
             break;
         }
 
-        xen_block_connect(xendev, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        xen_block_connect(xendev, errp);
+        if (*errp) {
             break;
         }
 
@@ -311,9 +308,8 @@ static void xen_block_frontend_changed(XenDevice *xendev,
 
     case XenbusStateClosed:
     case XenbusStateUnknown:
-        xen_block_disconnect(xendev, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        xen_block_disconnect(xendev, errp);
+        if (*errp) {
             break;
         }
 
@@ -665,9 +661,9 @@ static void xen_block_blockdev_del(const char *node_name, Error **errp)
 static char *xen_block_blockdev_add(const char *id, QDict *qdict,
                                     Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     const char *driver = qdict_get_try_str(qdict, "driver");
     BlockdevOptions *options = NULL;
-    Error *local_err = NULL;
     char *node_name;
     Visitor *v;
 
@@ -688,10 +684,9 @@ static char *xen_block_blockdev_add(const char *id, QDict *qdict,
         goto fail;
     }
 
-    qmp_blockdev_add(options, &local_err);
+    qmp_blockdev_add(options, errp);
 
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (*errp) {
         goto fail;
     }
 
@@ -710,14 +705,12 @@ fail:
 
 static void xen_block_drive_destroy(XenBlockDrive *drive, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     char *node_name = drive->node_name;
 
     if (node_name) {
-        Error *local_err = NULL;
-
-        xen_block_blockdev_del(node_name, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        xen_block_blockdev_del(node_name, errp);
+        if (*errp) {
             return;
         }
         g_free(node_name);
@@ -731,6 +724,7 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
                                              const char *device_type,
                                              QDict *opts, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     const char *params = qdict_get_try_str(opts, "params");
     const char *mode = qdict_get_try_str(opts, "mode");
     const char *direct_io_safe = qdict_get_try_str(opts, "direct-io-safe");
@@ -738,7 +732,6 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     char *driver = NULL;
     char *filename = NULL;
     XenBlockDrive *drive = NULL;
-    Error *local_err = NULL;
     QDict *file_layer;
     QDict *driver_layer;
 
@@ -817,13 +810,12 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
 
     g_assert(!drive->node_name);
     drive->node_name = xen_block_blockdev_add(drive->id, driver_layer,
-                                              &local_err);
+                                              errp);
 
     qobject_unref(driver_layer);
 
 done:
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (*errp) {
         xen_block_drive_destroy(drive, NULL);
         return NULL;
     }
@@ -848,8 +840,8 @@ static void xen_block_iothread_destroy(XenBlockIOThread *iothread,
 static XenBlockIOThread *xen_block_iothread_create(const char *id,
                                                    Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenBlockIOThread *iothread = g_new(XenBlockIOThread, 1);
-    Error *local_err = NULL;
     QDict *opts;
     QObject *ret_data = NULL;
 
@@ -858,13 +850,11 @@ static XenBlockIOThread *xen_block_iothread_create(const char *id,
     opts = qdict_new();
     qdict_put_str(opts, "qom-type", TYPE_IOTHREAD);
     qdict_put_str(opts, "id", id);
-    qmp_object_add(opts, &ret_data, &local_err);
+    qmp_object_add(opts, &ret_data, errp);
     qobject_unref(opts);
     qobject_unref(ret_data);
 
-    if (local_err) {
-        error_propagate(errp, local_err);
-
+    if (*errp) {
         g_free(iothread->id);
         g_free(iothread);
         return NULL;
@@ -876,6 +866,7 @@ static XenBlockIOThread *xen_block_iothread_create(const char *id,
 static void xen_block_device_create(XenBackendInstance *backend,
                                     QDict *opts, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenBus *xenbus = xen_backend_get_bus(backend);
     const char *name = xen_backend_get_name(backend);
     unsigned long number;
@@ -883,7 +874,6 @@ static void xen_block_device_create(XenBackendInstance *backend,
     XenBlockDrive *drive = NULL;
     XenBlockIOThread *iothread = NULL;
     XenDevice *xendev = NULL;
-    Error *local_err = NULL;
     const char *type;
     XenBlockDevice *blockdev;
 
@@ -915,16 +905,15 @@ static void xen_block_device_create(XenBackendInstance *backend,
         goto fail;
     }
 
-    drive = xen_block_drive_create(vdev, device_type, opts, &local_err);
+    drive = xen_block_drive_create(vdev, device_type, opts, errp);
     if (!drive) {
-        error_propagate_prepend(errp, local_err, "failed to create drive: ");
+        error_prepend(errp, "failed to create drive: ");
         goto fail;
     }
 
-    iothread = xen_block_iothread_create(vdev, &local_err);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to create iothread: ");
+    iothread = xen_block_iothread_create(vdev, errp);
+    if (*errp) {
+        error_prepend(errp, "failed to create iothread: ");
         goto fail;
     }
 
@@ -932,32 +921,29 @@ static void xen_block_device_create(XenBackendInstance *backend,
     blockdev = XEN_BLOCK_DEVICE(xendev);
 
     if (!object_property_set_str(OBJECT(xendev), "vdev", vdev,
-                                 &local_err)) {
-        error_propagate_prepend(errp, local_err, "failed to set 'vdev': ");
+                                 errp)) {
+        error_prepend(errp, "failed to set 'vdev': ");
         goto fail;
     }
 
     if (!object_property_set_str(OBJECT(xendev), "drive",
                                  xen_block_drive_get_node_name(drive),
-                                 &local_err)) {
-        error_propagate_prepend(errp, local_err, "failed to set 'drive': ");
+                                 errp)) {
+        error_prepend(errp, "failed to set 'drive': ");
         goto fail;
     }
 
     if (!object_property_set_str(OBJECT(xendev), "iothread", iothread->id,
-                                 &local_err)) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to set 'iothread': ");
+                                 errp)) {
+        error_prepend(errp, "failed to set 'iothread': ");
         goto fail;
     }
 
     blockdev->iothread = iothread;
     blockdev->drive = drive;
 
-    if (!qdev_realize_and_unref(DEVICE(xendev), BUS(xenbus), &local_err)) {
-        error_propagate_prepend(errp, local_err,
-                                "realization of device %s failed: ",
-                                type);
+    if (!qdev_realize_and_unref(DEVICE(xendev), BUS(xenbus), errp)) {
+        error_prepend(errp, "realization of device %s failed: ", type);
         goto fail;
     }
 
@@ -981,31 +967,29 @@ fail:
 static void xen_block_device_destroy(XenBackendInstance *backend,
                                      Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenDevice *xendev = xen_backend_get_device(backend);
     XenBlockDevice *blockdev = XEN_BLOCK_DEVICE(xendev);
     XenBlockVdev *vdev = &blockdev->props.vdev;
     XenBlockDrive *drive = blockdev->drive;
     XenBlockIOThread *iothread = blockdev->iothread;
-    Error *local_err = NULL;
 
     trace_xen_block_device_destroy(vdev->number);
 
     object_unparent(OBJECT(xendev));
 
     if (iothread) {
-        xen_block_iothread_destroy(iothread, &local_err);
-        if (local_err) {
-            error_propagate_prepend(errp, local_err,
-                                    "failed to destroy iothread: ");
+        xen_block_iothread_destroy(iothread, errp);
+        if (*errp) {
+            error_prepend(errp, "failed to destroy iothread: ");
             return;
         }
     }
 
     if (drive) {
-        xen_block_drive_destroy(drive, &local_err);
-        if (local_err) {
-            error_propagate_prepend(errp, local_err,
-                                    "failed to destroy drive: ");
+        xen_block_drive_destroy(drive, errp);
+        if (*errp) {
+            error_prepend(errp, "failed to destroy drive: ");
             return;
         }
     }
diff --git a/hw/pci-host/xen_igd_pt.c b/hw/pci-host/xen_igd_pt.c
index efcc9347ff..29ade9ca25 100644
--- a/hw/pci-host/xen_igd_pt.c
+++ b/hw/pci-host/xen_igd_pt.c
@@ -79,17 +79,16 @@ static void host_pci_config_read(int pos, int len, uint32_t *val, Error **errp)
 
 static void igd_pt_i440fx_realize(PCIDevice *pci_dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     uint32_t val = 0;
     size_t i;
     int pos, len;
-    Error *local_err = NULL;
 
     for (i = 0; i < ARRAY_SIZE(igd_host_bridge_infos); i++) {
         pos = igd_host_bridge_infos[i].offset;
         len = igd_host_bridge_infos[i].len;
-        host_pci_config_read(pos, len, &val, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        host_pci_config_read(pos, len, &val, errp);
+        if (*errp) {
             return;
         }
         pci_default_write_config(pci_dev, pos, val, len);
diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
index da065f81b7..1cc0694053 100644
--- a/hw/xen/xen-backend.c
+++ b/hw/xen/xen-backend.c
@@ -98,9 +98,9 @@ static void xen_backend_list_remove(XenBackendInstance *backend)
 void xen_backend_device_create(XenBus *xenbus, const char *type,
                                const char *name, QDict *opts, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     const XenBackendImpl *impl = xen_backend_table_lookup(type);
     XenBackendInstance *backend;
-    Error *local_error = NULL;
 
     if (!impl) {
         return;
@@ -110,9 +110,8 @@ void xen_backend_device_create(XenBus *xenbus, const char *type,
     backend->xenbus = xenbus;
     backend->name = g_strdup(name);
 
-    impl->create(backend, opts, &local_error);
-    if (local_error) {
-        error_propagate(errp, local_error);
+    impl->create(backend, opts, errp);
+    if (*errp) {
         g_free(backend->name);
         g_free(backend);
         return;
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index c4e2162ae9..2ea5144ef0 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -53,9 +53,9 @@ static char *xen_device_get_frontend_path(XenDevice *xendev)
 
 static void xen_device_unplug(XenDevice *xendev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
     const char *type = object_get_typename(OBJECT(xendev));
-    Error *local_err = NULL;
     xs_transaction_t tid;
 
     trace_xen_device_unplug(type, xendev->name);
@@ -69,14 +69,14 @@ again:
     }
 
     xs_node_printf(xenbus->xsh, tid, xendev->backend_path, "online",
-                   &local_err, "%u", 0);
-    if (local_err) {
+                   errp, "%u", 0);
+    if (*errp) {
         goto abort;
     }
 
     xs_node_printf(xenbus->xsh, tid, xendev->backend_path, "state",
-                   &local_err, "%u", XenbusStateClosing);
-    if (local_err) {
+                   errp, "%u", XenbusStateClosing);
+    if (*errp) {
         goto abort;
     }
 
@@ -96,7 +96,6 @@ abort:
      * from ending the transaction.
      */
     xs_transaction_end(xenbus->xsh, tid, true);
-    error_propagate(errp, local_err);
 }
 
 static void xen_bus_print_dev(Monitor *mon, DeviceState *dev, int indent)
@@ -205,15 +204,13 @@ static XenWatch *watch_list_add(XenWatchList *watch_list, const char *node,
                                 const char *key, XenWatchHandler handler,
                                 void *opaque, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenWatch *watch = new_watch(node, key, handler, opaque);
-    Error *local_err = NULL;
 
     notifier_list_add(&watch_list->notifiers, &watch->notifier);
 
-    xs_node_watch(watch_list->xsh, node, key, watch->token, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-
+    xs_node_watch(watch_list->xsh, node, key, watch->token, errp);
+    if (*errp) {
         notifier_remove(&watch->notifier);
         free_watch(watch);
 
@@ -255,11 +252,11 @@ static void xen_bus_backend_create(XenBus *xenbus, const char *type,
                                    const char *name, char *path,
                                    Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     xs_transaction_t tid;
     char **key;
     QDict *opts;
     unsigned int i, n;
-    Error *local_err = NULL;
 
     trace_xen_bus_backend_create(type, path);
 
@@ -314,13 +311,11 @@ again:
         return;
     }
 
-    xen_backend_device_create(xenbus, type, name, opts, &local_err);
+    xen_backend_device_create(xenbus, type, name, opts, errp);
     qobject_unref(opts);
 
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to create '%s' device '%s': ",
-                                type, name);
+    if (*errp) {
+        error_prepend(errp, "failed to create '%s' device '%s': ", type, name);
     }
 }
 
@@ -692,9 +687,9 @@ static void xen_device_remove_watch(XenDevice *xendev, XenWatch *watch,
 
 static void xen_device_backend_create(XenDevice *xendev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
     struct xs_permissions perms[2];
-    Error *local_err = NULL;
 
     xendev->backend_path = xen_device_get_backend_path(xendev);
 
@@ -706,30 +701,27 @@ static void xen_device_backend_create(XenDevice *xendev, Error **errp)
     g_assert(xenbus->xsh);
 
     xs_node_create(xenbus->xsh, XBT_NULL, xendev->backend_path, perms,
-                   ARRAY_SIZE(perms), &local_err);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to create backend: ");
+                   ARRAY_SIZE(perms), errp);
+    if (*errp) {
+        error_prepend(errp, "failed to create backend: ");
         return;
     }
 
     xendev->backend_state_watch =
         xen_device_add_watch(xendev, xendev->backend_path,
                              "state", xen_device_backend_changed,
-                             &local_err);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to watch backend state: ");
+                             errp);
+    if (*errp) {
+        error_prepend(errp, "failed to watch backend state: ");
         return;
     }
 
     xendev->backend_online_watch =
         xen_device_add_watch(xendev, xendev->backend_path,
                              "online", xen_device_backend_changed,
-                             &local_err);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to watch backend online: ");
+                             errp);
+    if (*errp) {
+        error_prepend(errp, "failed to watch backend online: ");
         return;
     }
 }
@@ -866,9 +858,9 @@ static bool xen_device_frontend_exists(XenDevice *xendev)
 
 static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
     struct xs_permissions perms[2];
-    Error *local_err = NULL;
 
     xendev->frontend_path = xen_device_get_frontend_path(xendev);
 
@@ -885,20 +877,18 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
         g_assert(xenbus->xsh);
 
         xs_node_create(xenbus->xsh, XBT_NULL, xendev->frontend_path, perms,
-                       ARRAY_SIZE(perms), &local_err);
-        if (local_err) {
-            error_propagate_prepend(errp, local_err,
-                                    "failed to create frontend: ");
+                       ARRAY_SIZE(perms), errp);
+        if (*errp) {
+            error_prepend(errp, "failed to create frontend: ");
             return;
         }
     }
 
     xendev->frontend_state_watch =
         xen_device_add_watch(xendev, xendev->frontend_path, "state",
-                             xen_device_frontend_changed, &local_err);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to watch frontend state: ");
+                             xen_device_frontend_changed, errp);
+    if (*errp) {
+        error_prepend(errp, "failed to watch frontend state: ");
     }
 }
 
@@ -1247,11 +1237,11 @@ static void xen_device_exit(Notifier *n, void *data)
 
 static void xen_device_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenDevice *xendev = XEN_DEVICE(dev);
     XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
     XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
     const char *type = object_get_typename(OBJECT(xendev));
-    Error *local_err = NULL;
 
     if (xendev->frontend_id == DOMID_INVALID) {
         xendev->frontend_id = xen_domid;
@@ -1267,10 +1257,9 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
         goto unrealize;
     }
 
-    xendev->name = xendev_class->get_name(xendev, &local_err);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "failed to get device name: ");
+    xendev->name = xendev_class->get_name(xendev, errp);
+    if (*errp) {
+        error_prepend(errp, "failed to get device name: ");
         goto unrealize;
     }
 
@@ -1293,22 +1282,19 @@ static void xen_device_realize(DeviceState *dev, Error **errp)
     xendev->feature_grant_copy =
         (xengnttab_grant_copy(xendev->xgth, 0, NULL) == 0);
 
-    xen_device_backend_create(xendev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    xen_device_backend_create(xendev, errp);
+    if (*errp) {
         goto unrealize;
     }
 
-    xen_device_frontend_create(xendev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    xen_device_frontend_create(xendev, errp);
+    if (*errp) {
         goto unrealize;
     }
 
     if (xendev_class->realize) {
-        xendev_class->realize(xendev, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        xendev_class->realize(xendev, errp);
+        if (*errp) {
             goto unrealize;
         }
     }
diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 1b44dcafaf..02379c341c 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -333,8 +333,8 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
                              uint8_t bus, uint8_t dev, uint8_t func,
                              Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     unsigned int v;
-    Error *err = NULL;
 
     d->config_fd = -1;
     d->domain = domain;
@@ -342,36 +342,36 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     d->dev = dev;
     d->func = func;
 
-    xen_host_pci_config_open(d, &err);
-    if (err) {
+    xen_host_pci_config_open(d, errp);
+    if (*errp) {
         goto error;
     }
 
-    xen_host_pci_get_resource(d, &err);
-    if (err) {
+    xen_host_pci_get_resource(d, errp);
+    if (*errp) {
         goto error;
     }
 
-    xen_host_pci_get_hex_value(d, "vendor", &v, &err);
-    if (err) {
+    xen_host_pci_get_hex_value(d, "vendor", &v, errp);
+    if (*errp) {
         goto error;
     }
     d->vendor_id = v;
 
-    xen_host_pci_get_hex_value(d, "device", &v, &err);
-    if (err) {
+    xen_host_pci_get_hex_value(d, "device", &v, errp);
+    if (*errp) {
         goto error;
     }
     d->device_id = v;
 
-    xen_host_pci_get_dec_value(d, "irq", &v, &err);
-    if (err) {
+    xen_host_pci_get_dec_value(d, "irq", &v, errp);
+    if (*errp) {
         goto error;
     }
     d->irq = v;
 
-    xen_host_pci_get_hex_value(d, "class", &v, &err);
-    if (err) {
+    xen_host_pci_get_hex_value(d, "class", &v, errp);
+    if (*errp) {
         goto error;
     }
     d->class_code = v;
@@ -381,7 +381,6 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     return;
 
 error:
-    error_propagate(errp, err);
 
     if (d->config_fd >= 0) {
         close(d->config_fd);
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index ab84443d5e..baa25eb91a 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -777,12 +777,12 @@ static void xen_pt_destroy(PCIDevice *d) {
 
 static void xen_pt_realize(PCIDevice *d, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     XenPCIPassthroughState *s = XEN_PT_DEVICE(d);
     int i, rc = 0;
     uint8_t machine_irq = 0, scratch;
     uint16_t cmd = 0;
     int pirq = XEN_PT_UNASSIGNED_PIRQ;
-    Error *err = NULL;
 
     /* register real device */
     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
@@ -793,10 +793,9 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
     xen_host_pci_device_get(&s->real_device,
                             s->hostaddr.domain, s->hostaddr.bus,
                             s->hostaddr.slot, s->hostaddr.function,
-                            &err);
-    if (err) {
-        error_append_hint(&err, "Failed to \"open\" the real pci device");
-        error_propagate(errp, err);
+                            errp);
+    if (*errp) {
+        error_append_hint(errp, "Failed to \"open\" the real pci device");
         return;
     }
 
@@ -823,11 +822,10 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
             return;
         }
 
-        xen_pt_setup_vga(s, &s->real_device, &err);
-        if (err) {
-            error_append_hint(&err, "Setup VGA BIOS of passthrough"
-                    " GFX failed");
-            error_propagate(errp, err);
+        xen_pt_setup_vga(s, &s->real_device, errp);
+        if (*errp) {
+            error_append_hint(errp, "Setup VGA BIOS of passthrough"
+                              " GFX failed");
             xen_host_pci_device_put(&s->real_device);
             return;
         }
@@ -840,10 +838,9 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
     xen_pt_register_regions(s, &cmd);
 
     /* reinitialize each config register to be emulated */
-    xen_pt_config_init(s, &err);
-    if (err) {
-        error_append_hint(&err, "PCI Config space initialisation failed");
-        error_propagate(errp, err);
+    xen_pt_config_init(s, errp);
+    if (*errp) {
+        error_append_hint(errp, "PCI Config space initialisation failed");
         rc = -1;
         goto err_out;
     }
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index d0d7c720a6..af3fbd1bfb 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -2008,8 +2008,8 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
 
 void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     int i, rc;
-    Error *err = NULL;
 
     QLIST_INIT(&s->reg_grps);
 
@@ -2067,13 +2067,14 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
 
                 /* initialize capability register */
                 for (j = 0; regs->size != 0; j++, regs++) {
-                    xen_pt_config_reg_init(s, reg_grp_entry, regs, &err);
-                    if (err) {
-                        error_append_hint(&err, "Failed to init register %d"
-                                " offsets 0x%x in grp_type = 0x%x (%d/%zu)", j,
-                                regs->offset, xen_pt_emu_reg_grps[i].grp_type,
-                                i, ARRAY_SIZE(xen_pt_emu_reg_grps));
-                        error_propagate(errp, err);
+                    xen_pt_config_reg_init(s, reg_grp_entry, regs, errp);
+                    if (*errp) {
+                        error_append_hint(errp, "Failed to init register %d"
+                                          " offsets 0x%x in grp_type = 0x%x (%d/%zu)",
+                                          j,
+                                          regs->offset,
+                                          xen_pt_emu_reg_grps[i].grp_type,
+                                          i, ARRAY_SIZE(xen_pt_emu_reg_grps));
                         xen_pt_config_delete(s);
                         return;
                     }
-- 
2.21.0


