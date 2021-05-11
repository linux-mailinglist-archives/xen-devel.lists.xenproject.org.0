Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0637A39F
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 11:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125664.236548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgm-0004V5-Vs; Tue, 11 May 2021 09:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125664.236548; Tue, 11 May 2021 09:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgm-0004Sb-RA; Tue, 11 May 2021 09:28:28 +0000
Received: by outflank-mailman (input) for mailman id 125664;
 Tue, 11 May 2021 09:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOgk-0003CS-Px
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:26 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82d3ce8f-aaa5-4fa3-9509-4f83f14f2936;
 Tue, 11 May 2021 09:28:18 +0000 (UTC)
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
X-Inumbo-ID: 82d3ce8f-aaa5-4fa3-9509-4f83f14f2936
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K8gPTzU82ZOUTi54+69xvIkJJNm7Kwz13GZQD0G5vXM=;
  b=Uk/lZAlilwApqdLm6/Tk6abu6cQ1ESLp3dx82f4AnFizxUxeWtrUhH1p
   SH/LPWc2cg3NKigMeEltZLGcqFw4Qw+aWKMUUB0CxH8r2KMWYj7Nm0K6l
   5OryhWGec5s5oMR70fzQjaGmfx//g69GjqH4Wb77+PBKBMGNJ8k95GqLp
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Sp4KX4JisA/iWq0YvBzhRNcLG4kFU0wshITCFgIWluPdyDNEqYUIzIIlvjEatra8IOdhV+Kv6V
 N+u9jyfGD0QZ/mi+Ozd27aIWBs1jCRlzBA00Csj7zkqEx7zLhzfepNY0ECBFQmpGqgowjz20DO
 4gVQcGZPfRd3BS200wToEw1ssZXqYGVgNzbQvdzhumGbhmPZ1Agwj4ZK9bAHqkvGJ3y2SE/+RU
 vIch9P+FaYg6m+o8m7LrwbssnMMBa+oZzudRvE03uzyIEwAX20vM4pRT9ETy1I2jzXfrqPlCL/
 Pa4=
X-SBRS: 5.1
X-MesageID: 43313589
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DMcLoq1yECnHCjlGXA8tlwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="43313589"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/8] libxl: Replace deprecated "cpu-add" QMP command by "device_add"
Date: Tue, 11 May 2021 10:28:05 +0100
Message-ID: <20210511092810.13759-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The command "cpu-add" for CPU hotplug is deprecated and has been
removed from QEMU 6.0 (April 2021). We need to add cpus with the
command "device_add" now.

In order to find out which parameters to pass to "device_add" we first
make a call to "query-hotpluggable-cpus" which list the cpus drivers
and properties.

The algorithm to figure out which CPU to add, and by extension if any
CPU needs to be hotplugged, is in the function that adds the cpus.
Because of that, the command "query-hotpluggable-cpus" is always
called, even when not needed.

In case we are using a version of QEMU older than 2.7 (Sept 2016)
which don't have "query-hotpluggable-cpus", we fallback to using
"cpu-add".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---

Notes:
    v2:
    - fix coding style

 tools/libs/light/libxl_domain.c | 89 ++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 8c003aa7cb04..c00c36c92879 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1805,6 +1805,7 @@ typedef struct set_vcpuonline_state {
     libxl_dominfo info;
     libxl_bitmap final_map;
     int index; /* for loop on final_map */
+    const char *cpu_driver;
 } set_vcpuonline_state;
 
 static void set_vcpuonline_qmp_cpus_fast_queried(libxl__egc *,
@@ -1814,6 +1815,10 @@ static void set_vcpuonline_qmp_cpus_queried(libxl__egc *,
 static void set_vcpuonline_qmp_query_cpus_parse(libxl__egc *,
     libxl__ev_qmp *qmp, const libxl__json_object *,
     bool query_cpus_fast, int rc);
+static void set_vcpuonline_qmp_query_hotpluggable_cpus(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
+static void set_vcpuonline_qmp_device_add_cpu(libxl__egc *,
+    libxl__ev_qmp *, const libxl__json_object *response, int rc);
 static void set_vcpuonline_qmp_add_cpu(libxl__egc *,
     libxl__ev_qmp *, const libxl__json_object *response, int rc);
 static void set_vcpuonline_timeout(libxl__egc *egc,
@@ -1951,13 +1956,54 @@ static void set_vcpuonline_qmp_query_cpus_parse(libxl__egc *egc,
         libxl_bitmap_reset(final_map, i);
     }
 
+    qmp->callback = set_vcpuonline_qmp_query_hotpluggable_cpus;
+    rc = libxl__ev_qmp_send(egc, qmp, "query-hotpluggable-cpus", NULL);
+
 out:
     libxl_bitmap_dispose(&current_map);
+    if (rc)
+        set_vcpuonline_done(egc, svos, rc); /* must be last */
+}
+
+static void set_vcpuonline_qmp_query_hotpluggable_cpus(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
+{
+    set_vcpuonline_state *svos = CONTAINER_OF(qmp, *svos, qmp);
+    const libxl__json_object *cpu;
+    const libxl__json_object *cpu_driver;
+
+    if (rc == ERROR_QMP_COMMAND_NOT_FOUND) {
+        /* We are probably connected to a version of QEMU older than 2.7,
+         * let's fallback to using "cpu-add" command. */
+        svos->index = -1;
+        set_vcpuonline_qmp_add_cpu(egc, qmp, NULL, 0); /* must be last */
+        return;
+    }
+
+    if (rc) goto out;
+
+    /* Parse response to QMP command "query-hotpluggable-cpus"
+     * [ { 'type': 'str', ... ]
+     *
+     * We are looking for the driver name for CPU to be hotplug. We'll
+     * assume that cpus property are core-id=0, thread-id=0 and
+     * socket-id=$cpu_index, as we start qemu with "-smp %d,maxcpus=%d", so
+     * we don't parse the properties listed for each hotpluggable cpus.
+     */
+
+    cpu = libxl__json_array_get(response, 0);
+    cpu_driver = libxl__json_map_get("type", cpu, JSON_STRING);
+    svos->cpu_driver = libxl__json_object_get_string(cpu_driver);
+
+    if (!svos->cpu_driver)
+        rc = ERROR_QEMU_API;
+
+out:
     svos->index = -1;
-    set_vcpuonline_qmp_add_cpu(egc, qmp, NULL, rc); /* must be last */
+    set_vcpuonline_qmp_device_add_cpu(egc, qmp, NULL, rc); /* must be last */
 }
 
-static void set_vcpuonline_qmp_add_cpu(libxl__egc *egc,
+static void set_vcpuonline_qmp_device_add_cpu(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
 {
     STATE_AO_GC(qmp->ao);
@@ -1969,6 +2015,45 @@ static void set_vcpuonline_qmp_add_cpu(libxl__egc *egc,
 
     if (rc) goto out;
 
+    while (libxl_bitmap_cpu_valid(map, ++svos->index)) {
+        if (libxl_bitmap_test(map, svos->index)) {
+            qmp->callback = set_vcpuonline_qmp_device_add_cpu;
+            libxl__qmp_param_add_string(gc, &args, "id", GCSPRINTF("cpu-%d", svos->index));
+            libxl__qmp_param_add_string(gc, &args, "driver", svos->cpu_driver);
+            /* We'll assume that we start QEMU with -smp %d,maxcpus=%d, so
+             * that "core-id" and "thread-id" are always 0 so that
+             * "socket-id" correspond the cpu index.
+             * Those properties are otherwise listed by
+             * "query-hotpluggable-cpus". */
+            libxl__qmp_param_add_integer(gc, &args, "socket-id", svos->index);
+            libxl__qmp_param_add_integer(gc, &args, "core-id", 0);
+            libxl__qmp_param_add_integer(gc, &args, "thread-id", 0);
+            rc = libxl__ev_qmp_send(egc, qmp, "device_add", args);
+            if (rc) goto out;
+            return;
+        }
+    }
+
+out:
+    set_vcpuonline_done(egc, svos, rc);
+}
+
+/* Fallback function for QEMU older than 2.7, when
+ * 'query-hotpluggable-cpus' wasn't available and vcpu object couldn't be
+ * added with 'device_add'. */
+static void set_vcpuonline_qmp_add_cpu(libxl__egc *egc, libxl__ev_qmp *qmp,
+                                       const libxl__json_object *response,
+                                       int rc)
+{
+    STATE_AO_GC(qmp->ao);
+    set_vcpuonline_state *svos = CONTAINER_OF(qmp, *svos, qmp);
+    libxl__json_object *args = NULL;
+
+    /* Convenience aliases */
+    libxl_bitmap *map = &svos->final_map;
+
+    if (rc) goto out;
+
     while (libxl_bitmap_cpu_valid(map, ++svos->index)) {
         if (libxl_bitmap_test(map, svos->index)) {
             qmp->callback = set_vcpuonline_qmp_add_cpu;
-- 
Anthony PERARD


