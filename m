Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174625850E3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 15:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377531.610769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQ11-0007B2-4D; Fri, 29 Jul 2022 13:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377531.610769; Fri, 29 Jul 2022 13:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHQ11-000771-1G; Fri, 29 Jul 2022 13:26:55 +0000
Received: by outflank-mailman (input) for mailman id 377531;
 Fri, 29 Jul 2022 13:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bg2=YC=citrix.com=prvs=2023e7475=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oHQ0z-0006rA-9o
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 13:26:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a3a013f-0f42-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 15:26:52 +0200 (CEST)
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
X-Inumbo-ID: 1a3a013f-0f42-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659101212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xag00GhheHezUELouMZ36MTWxrrWM9y1zSsNJWcF1U8=;
  b=PQ8hzeZh5GHEJBYiE3fkrEmK+7IiqOP8NWM3nfe2x8W3DjPET7Y0tvL3
   olhXRCx4tRJ0m6a1jORLy2E9OS9581JvCcxD7i9ZpV2T0O8urp7dUiflo
   N8hg4ib0UFdSn+gOOPpYnApB15VaUUlza2iEvZOgX65K6ZR8kbib/HfZm
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76933073
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AdIrv+6KjlqATiKahFE//H55y3J0nRxNeGxL0i?=
 =?us-ascii?q?kilI80cnZWQUeEPdw9qPMoIMlI7Zkq1ybYU6pjk1CcKHzt1ght/QUK0NyA2K?=
 =?us-ascii?q?EpqG9lA2JNDUBPUje0YwoEHz3Ja7MxMpXWQ7QQlt0yKgMcZUAcEg5gMNkkTO?=
 =?us-ascii?q?fD2cQK/E294acydWC6odUkRQ/6V6RiSbpLfIHHDY9r0CF3pauzThPh+POmYy?=
 =?us-ascii?q?oL5TN3WsLCy6cAYIIKHz6GVwVC15dVudqtm3w1GOuFK3kxO7cBmMHg54luXF?=
 =?us-ascii?q?V7Ybo76rfLd8no1rUnRPXspg+z10KiapIFWAi5fHJfICtd2EfkNXlqk9PtEz?=
 =?us-ascii?q?fYLQWVg+OhkPAB2lHX2+aL8nJxcKBKR6GgactTX3VRAqOxZKHZrR6QVdzpFD?=
 =?us-ascii?q?Rn/JKV1m5zIWbSP98WdJHAtfibcOUOQRl9fYwSaGfCkXvD2yrfratdekFnU0?=
 =?us-ascii?q?O8CHrKJX+1AKbQfV5xc5zEAPeEVo3+EzPSUXqQWmFHVq8T8Ns5NcgNJbvRJp?=
 =?us-ascii?q?fUFvPmszQc/UAJV2d/2lFxnOcObWMif0f+Bo4QHBzC7sStI4rDC4VnjM/MsK?=
 =?us-ascii?q?uJbA/tgJd1YpwnBc+wrKnSh59QAtI0O6FbZ3qK8KGmsGfYcfbZa1VuR5Ddtn?=
 =?us-ascii?q?TcUqdxj1w9uvjGW1n92yrxiUGvwazgyzZsAaVXyvDHPRFRFL61iZx9Tht5Oy?=
 =?us-ascii?q?OS5Z0ou74xClZpfG7QOmMCZ5RYV7SICpP8yhG38HDEb3VGQfUXoPz0FuScGy?=
 =?us-ascii?q?OL59fJIM9294UyjKanKbcXkKxLKsTH2U5cq4zG0YaFFbGGQm8LJ0v/XSjPAV?=
 =?us-ascii?q?yb4Oo6gZp8DBnbKMlNjT2nZ5wU9AgxDgqmuTzcY53xsahir7vx9ckrR+k6Do?=
 =?us-ascii?q?xSMEcd1WJajeSI0XOso1rTnbKLGUIGvnCcBpkxuTuWTz0Wwn8qMQ6aiGZSw2?=
 =?us-ascii?q?0Qspq/kUOIzhsocWbx48lTc7V5hhFr7f6VeE4n3AAcmGNa/V3aqL0JO1sEfn?=
 =?us-ascii?q?uJrXhvUA6u8cOeQM5D4E0eCTnaLWEHJQ9mWK7VFcLtJsxrOg+0NmcXIQk+Tf?=
 =?us-ascii?q?7ZmSEvWqNKEqbe4RECbPbjU+NQhlQLKMX2YfRPnhS4LJZDflZP6PRy6JhfMa?=
 =?us-ascii?q?YwC1gO02R4F1m/7RBU+t1k+U1E2BnbmKmbclL1kwBA89KBgfypqeBKBDqumF?=
 =?us-ascii?q?Rh4VD5l46YK/ViFQTCd/muD0MVN10D8EbPplA2K4nsivseSBLpavASwH8N9t?=
 =?us-ascii?q?UevErGaZtBAAffwGDH7yQGiGigkfM3ZutesCbGoVapxdD9a2idmrpG7Lt1z5?=
 =?us-ascii?q?h8gAMpi+DkJhetLLMO1TEmtt7CuTt79v4xKqiZsdFL1LsQ1T28BRpZm39vhy?=
 =?us-ascii?q?O5Xh+yJN2Hdc7EiB7BT6WWwpBqtEKniOPGrgPFL9MUtmt3Y6VK2M29wRjJ4U?=
 =?us-ascii?q?0yd9Pefsdxe2+bTa5R6nvxL5AkIQWFGsIx/MwYNJRI5tPLoisZvWD8wcQXF6?=
 =?us-ascii?q?QcyJKwzBtCpdHp3RpyknTGV0UJW1WVCjQfyr2VSmZOgdAfZbiF30KkCyhZjN?=
 =?us-ascii?q?Vlj6GwhVRylNv43kswKnKhilLfwAsOvKd8FXKtx6mN9lj65kdA7exq9mSunp?=
 =?us-ascii?q?G5wNuaKRdu8aFe/UWTL9KIsc909Hko6HEUyBjB5pNEA0Z3ZQXH7sVNLJOGj5?=
 =?us-ascii?q?T8ryej2OmTH4IvXvdF3+lFnCxRFKZ0jU34GFlsg6FPP/2ghQy2ZeD+cl1L8v?=
 =?us-ascii?q?PDhbuj2haNwOfa6DfwW26tOiM4sv8sdCnaX/hg+///WiH7kz5cVNrD+xr9yK?=
 =?us-ascii?q?ZOxKg6n9fqAYbS25A6hYaNFP9Hk80jU/2zuZeVWwlg+gk1qED15RmPSlDEgs?=
 =?us-ascii?q?/yZQrIxcWU6Y1JdPt9jIldkiLxfW73q2U68prKLt3pa7YP3uIzB9USu+4Z0E?=
 =?us-ascii?q?66vQzq81+jtTsYcbyRdqXoX0gzNFNNJcdHJ2KA6CgHZNN+IETeHnCCrLmFJe?=
 =?us-ascii?q?5bQI+jWpJmpORQbU7NaHyxjYNlUA9IOVUBa/2G+DjaEQaFVJYVTAw2+xHuma?=
 =?us-ascii?q?4lh/Pl+/34+yZkvxRnUn6CDnYvpY9rb0+FkJb2THM6I7x/SYRbBl/Zk1w/bY?=
 =?us-ascii?q?CzgT7oVGTxXjJICPpXalL7m5hralhYWTPFnJu7bgsL3fLGiOSoy3B3oQiQuZ?=
 =?us-ascii?q?J5VJ3ZkGHWswnvyC1rn/y8vv2M+LTVr21iN/IwO5r3exsI527WoTfJW/p15+?=
 =?us-ascii?q?IB0FshXe+ihMs+UxL+PLiBkDLBS8BncdqpGuty37+z4HJ+myPAXA78qeAAHx?=
 =?us-ascii?q?m0/HRwzKD4y+3pKGI4d7GWL+hQ6ceiM4jBFuCpU2ClleDCtn/sn/0/78W/IO?=
 =?us-ascii?q?8XPE3KhW895dGRhS8XSa/Ou97UJBV4WC1TJxWIT/+vzEVFwkUHtW4bgH45so?=
 =?us-ascii?q?EDTBbZrVAtGW7qe3ycGbH7bdWFGZYTAJmbu3AH1pN2gAMRCVT1/+vcQf0tKS?=
 =?us-ascii?q?aEw7W/iJcOFVX09jTARq6alGE2nLZKKTKpV6ATwm+hJMzV/DMEMwwWF/w6N7?=
 =?us-ascii?q?OFP6MbejZV3KimGzhK78tuuOZaiJ3oHbeuINMqpsT8jnewG6NbAedGINA5BN?=
 =?us-ascii?q?ueqWz5S0FAjEfuJ4nl1ybLsrCUoHppPAbZy/zbiVkefFGGdWacQD4wZOtdIv?=
 =?us-ascii?q?ClT5LlJlKh8xnFeL/FPFJ7oaxRtE/do8lO+RArqI5YsEesVKmTaOOMGpWi6o?=
 =?us-ascii?q?n0q3YOnuaShQcll50ExwUqKzl9gQL2bIXGNBEPJ5kH1f4S5yPJRzz196EUGo?=
 =?us-ascii?q?X0knfh0yfU6k3FepGO0Nh6fsdTD4nvUlirBTFVf4NoU/M2L1w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="76933073"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Roger Pau
 Monne" <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH stable-4.16] tools/libxl: env variable to signal whether disk/nic backend is trusted
Date: Fri, 29 Jul 2022 14:26:40 +0100
Message-ID: <20220729132641.21221-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729132641.21221-1-anthony.perard@citrix.com>
References: <20220729132641.21221-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

Introduce support in libxl for fetching the default backend trusted
option for disk and nic devices.

Users can set LIBXL_{DISK,NIC}_BACKEND_UNTRUSTED environment variable
to notify libxl of whether the backends for disk and nic devices
should be trusted.  Such information is passed into the frontend so it
can take the appropriate measures.

This is part of XSA-403.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
changes:
- envvar now upper case
- documentation in xl man page
- value "0" also mean "trusted"
---
 docs/man/xl.1.pod.in          | 18 ++++++++++++++++++
 tools/libs/light/libxl_disk.c |  5 +++++
 tools/libs/light/libxl_nic.c  |  7 +++++++
 3 files changed, 30 insertions(+)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index e2176bd696..45e1430aeb 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1946,6 +1946,24 @@ shows the decimal value. For non-linear mode, it shows hexadecimal value.
 
 =back
 
+=head1 ENVIRONMENT
+
+=over 4
+
+=item B<LIBXL_DISK_BACKEND_UNTRUSTED>
+
+Set this environment variable to "1" to suggest to the guest that the disk
+backend shouldn't be trusted. If the variable is absent or set to "0", the
+backend will be trusted.
+
+=item B<LIBXL_NIC_BACKEND_UNTRUSTED>
+
+Set this environment variable to "1" to suggest to the guest that the network
+backend shouldn't be trusted. If the variable is absent or set to "0", the
+backend will be trusted.
+
+=back
+
 =head1 IGNORED FOR COMPATIBILITY WITH XM
 
 xl is mostly command-line compatible with the old xm utility used with
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 93936d0dd0..67d1cc1857 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -246,6 +246,7 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
     libxl_domain_config d_config;
     libxl_device_disk disk_saved;
     libxl__flock *lock = NULL;
+    const char *envvar;
 
     libxl_domain_config_init(&d_config);
     libxl_device_disk_init(&disk_saved);
@@ -395,6 +396,10 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
         flexarray_append(front, GCSPRINTF("%d", device->devid));
         flexarray_append(front, "device-type");
         flexarray_append(front, disk->is_cdrom ? "cdrom" : "disk");
+        flexarray_append(front, "trusted");
+        envvar = getenv("LIBXL_DISK_BACKEND_UNTRUSTED");
+        /* Set "trusted=1" if envvar missing or is "0". */
+        flexarray_append(front, !envvar || !strcmp("0", envvar) ? "1" : "0");
 
         /*
          * Old PV kernel disk frontends before 2.6.26 rely on tool stack to
diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index 0b9e70c9d1..f87890d1d6 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -132,6 +132,8 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
                                    flexarray_t *back, flexarray_t *front,
                                    flexarray_t *ro_front)
 {
+    const char *envvar;
+
     flexarray_grow(back, 2);
 
     if (nic->script)
@@ -255,6 +257,11 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
     flexarray_append(back, "hotplug-status");
     flexarray_append(back, "");
 
+    flexarray_append(front, "trusted");
+    envvar = getenv("LIBXL_NIC_BACKEND_UNTRUSTED");
+    /* Set "trusted=1" if envvar missing or is "0". */
+    flexarray_append(front, !envvar || !strcmp("0", envvar) ? "1" : "0");
+
     return 0;
 }
 
-- 
Anthony PERARD


