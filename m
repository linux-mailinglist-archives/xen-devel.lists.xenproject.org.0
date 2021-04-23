Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CBE3696BF
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116487.222360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTX-0008DB-3O; Fri, 23 Apr 2021 16:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116487.222360; Fri, 23 Apr 2021 16:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTW-0008Be-Tn; Fri, 23 Apr 2021 16:16:14 +0000
Received: by outflank-mailman (input) for mailman id 116487;
 Fri, 23 Apr 2021 16:16:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTV-00082q-GU
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:13 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce440170-617b-44de-9b89-b1e343738080;
 Fri, 23 Apr 2021 16:16:04 +0000 (UTC)
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
X-Inumbo-ID: ce440170-617b-44de-9b89-b1e343738080
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6JE1Ba2kHKFU49wB1sMfUR0XT1WWVSsakxmysofkZWc=;
  b=Mg7lFc9JwfYrX5IoJaiQwhWEiqD3it+l7X/D/tis4xoBZb/BGNb2kV/L
   A4QMFIQAgCiIlliKdmiQJYp5S+3P0Rb1reiHr15XzLxjgY64C9Na5QHTv
   e8MOaSkJnWCywdFceVR5VH923TML4oea6NoALPxi7tkrSXl6FZeSrehsc
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +zFP/7K3fTyk/y9qliyS+NZJy/a07PW4Th7efl0L3pvA+uXSrNVKcp+yJmfHD1e/y/4r/6KSwF
 FKLJQEYvq5Xw7Y5zmqR3C+36/IEr/h7IvHOujfSdmtsM4A5+oSade060+gTvG33g9eBkD8Kcp0
 w7mRjX5LUxNTdrA6EF9MWFAqodGEMKzE3+PZ8XcKyamAmIcx+//gJ1flyzAqejUTVH4ARnyCtK
 Ush4GZfJV+ccOqLo+BUCooQENbOAKgbXo3xV62YmZ0NeKP0wnpkKMeKFm046DER56Ey6TmjfMP
 ghw=
X-SBRS: 5.1
X-MesageID: 42290092
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6iN34KzGZrT95DE3+VaEKrPxpe4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmKJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheVysd07o
 0lSaR3DbTLZmRSpczx7BCkV/Mpx9ea+K6l7N2utEtFZysCUdAC0y5SDAGHHkpqACxPApQkHJ
 SRj/A33QaIU3IRc8i9Gz05T/HOzue73q7OTDwnI1oc6AeIhS6187KSKXSl9zoXTj8n+8ZEzU
 HriAr8j5/Dj9iazVvm23bX/9BqnrLau6N+LeitruRQFTn2kAavY+1aKvC/lRQ4uvum5lpvsP
 SkmWZHA+1J53ncfn64rHLWsmGOvgoG0HPsxUSVhnHuu6XCNUsHIvBcjoFUeAax0TtDgPhA0b
 lG12/cl51bAQKoplWY2/H0VgpnnkfxnHw6keR7tQ07baIibtZqzbA3zQdwKtMtDSj64IcoHK
 1FF8fH/stbdluccjTwonRv6MbEZAV9Ij62Bmw5/uCF2Tlfm350i2ECwtYEo3sG/JUhD7FZ+u
 X/NLhynr0mdL5ZUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77n6/asy/+PvXJAT1pM9lN
 DgXTpjxC8PUnOrLffL8IxA8xjLTmn4dy/q0Nti659wvaC5S6HsNSGFVVAyg8qtq/gSGaTgKr
 WOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+W1/mmLOIFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqkSiWnryhgnNS2rgE3aPuK5YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gxZ0
 txILTul6uhvmmo9WPU72FkUyAtTnp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1tiVc/MCR
 VeoF524KqzKJSVyUkZepaaG1Pfq0FWiGOBTp8alKHG2NzsfYkgCI06HIZrEx/QKhBzkQF2iW
 tKZQMeXHXDHjf2hajNtu1SOMjvM/1HxCaiO4p9tG/Wv0T0n7BTelIrGxqVFfOxrSlrbTxOnV
 F1+7IYm9O76EqSAFp6pv85Pl1KYHmQG5RcAm2+Fclps7j2ZQB9SnqLjzSGixc1PnHn7VkWm3
 aJF1zqRdjbRlVaoXxWyaDs7Rd9cXicZVt5bjRgvZR6DnmugAc67cabIq6y2XCWcF0M36UUNy
 zEeyIbJmpVtqaK/Q/QnDaJDnM9wJoyeuTbEbQ4arnWnnegMpeBm61DH/ha+v9eRZnTm/5OVe
 KUYAmOKjzkT+svxgyOv34gfDBut2NMq4Kc5DT1qGyjmHIvC/vbJ1prA7kdPtGH9mDhA/KFyo
 9wg945tfa5W1+BIeKu2OXSdXpOOxnTqWm5Q6UzpZdYsbk7ubFzE5PYOAG4o01vzVE7NoP5hU
 keSKN07PTdIYdpZdUVYD8c8VwzltiDRXFbwDDeE6s7ZxUqgHDaNd/SvOaNprorH0GbpAz/fV
 OY6DZQ+v/ZXy2Fkb4WYphAUVh+eQw58jBl+ujHaojbTAOtfOtH9EChMnC8fKRGIZL1bYk4v1
 J/+ZWQg+STdyDkwwjesjtwP7JW/w+cMLKPKRPJHfQN7sezNluNiLa7+cK/jD/4Tj2gdkQT7L
 c1BnA4f4BEkTktjIo+zyi0ROj2uyse4iVj3Q0=
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42290092"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/8] libxl: Replace deprecated "cpu-add" QMP command by "device_add"
Date: Fri, 23 Apr 2021 17:15:53 +0100
Message-ID: <20210423161558.224367-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
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
---
 tools/libs/light/libxl_domain.c | 87 ++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 8c003aa7cb04..e130deb0757f 100644
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
@@ -1969,6 +2015,43 @@ static void set_vcpuonline_qmp_add_cpu(libxl__egc *egc,
 
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
+                                       int rc) { STATE_AO_GC(qmp->ao);
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


