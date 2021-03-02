Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBC532A8B6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92538.174478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9M7-0001Ak-W3; Tue, 02 Mar 2021 18:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92538.174478; Tue, 02 Mar 2021 18:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9M7-0001AL-So; Tue, 02 Mar 2021 18:02:47 +0000
Received: by outflank-mailman (input) for mailman id 92538;
 Tue, 02 Mar 2021 18:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fwSr=IA=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lH9M6-0001A7-Q0
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 18:02:46 +0000
Received: from forwardcorp1p.mail.yandex.net (unknown [77.88.29.217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34ed40f2-4132-4554-974b-eafb4724af79;
 Tue, 02 Mar 2021 18:02:44 +0000 (UTC)
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 6CF852E09D4;
 Tue,  2 Mar 2021 21:02:42 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 lmUsbFKo90-2fxmmeFt; Tue, 02 Mar 2021 21:02:42 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8002::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 onVeXhLyoo-2Yo0BdQP; Tue, 02 Mar 2021 21:02:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 34ed40f2-4132-4554-974b-eafb4724af79
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1614708162; bh=TClaDRzxQB4h6SlKaYxQXAsUYr6qhA7dXnvUiqCeKqs=;
	h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
	b=o9ZrIKFKO4+fYG4dn+TTQGvl83wVWrPDV0Dx3djfpLfMIK1k8O4wIpzPMbmmGAdtq
	 NXq07ecOb+0Ut+mx+DAy9nVCdCtj3dsskrr3ciSIXblKxenAZyZIt5YANUACJPgLEH
	 98+/NK09wDtO1WPdpXoiUlsELSxqvkl0Uskqt/M0=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Luigi Rizzo <rizzo@iet.unipi.it>,
	Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
	Vincenzo Maffione <v.maffione@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org,
	yc-core@yandex-team.ru
Subject: [PATCH v6 2/5] tests: Add tests for query-netdev command
Date: Tue,  2 Mar 2021 21:02:02 +0300
Message-Id: <20210302180205.5009-3-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302180205.5009-1-lekiravi@yandex-team.ru>
References: <20210302180205.5009-1-lekiravi@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A simply qtest that checks for correct number of netdevs in the response
of the query-netdev.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build         |   3 +
 tests/qtest/test-query-netdev.c | 120 ++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 tests/qtest/test-query-netdev.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ba6ecaed32..fefe3da3c3 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -17,6 +17,9 @@ qtests_generic = [
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
 endif
+if slirp.found()
+  qtests_generic += [ 'test-query-netdev' ]
+endif
 
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
diff --git a/tests/qtest/test-query-netdev.c b/tests/qtest/test-query-netdev.c
new file mode 100644
index 0000000000..1118537a9f
--- /dev/null
+++ b/tests/qtest/test-query-netdev.c
@@ -0,0 +1,120 @@
+/*
+ * QTest testcase for the query-netdev
+ *
+ * Copyright Yandex N.V., 2019
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qlist.h"
+
+/*
+ * Events can get in the way of responses we are actually waiting for.
+ */
+GCC_FMT_ATTR(2, 3)
+static QObject *wait_command(QTestState *who, const char *command, ...)
+{
+    va_list ap;
+    QDict *response;
+    QObject *result;
+
+    va_start(ap, command);
+    qtest_qmp_vsend(who, command, ap);
+    va_end(ap);
+
+    response = qtest_qmp_receive(who);
+
+    result = qdict_get(response, "return");
+    g_assert(result);
+    qobject_ref(result);
+    qobject_unref(response);
+
+    return result;
+}
+
+static void qmp_query_netdev_no_error(QTestState *qts, size_t netdevs_count)
+{
+    QObject *resp;
+    QList *netdevs;
+
+    resp = wait_command(qts, "{'execute': 'query-netdev'}");
+
+    netdevs = qobject_to(QList, resp);
+    g_assert(netdevs);
+    g_assert(qlist_size(netdevs) == netdevs_count);
+
+    qobject_unref(resp);
+}
+
+static void test_query_netdev(void)
+{
+    const char *arch = qtest_get_arch();
+    QObject *resp;
+    QTestState *state;
+
+    /* Choosing machine for platforms without default one */
+    if (g_str_equal(arch, "arm") ||
+        g_str_equal(arch, "aarch64")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M virt "
+            "-netdev user,id=slirp0");
+    } else if (g_str_equal(arch, "tricore")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M tricore_testboard "
+            "-netdev user,id=slirp0");
+    } else if (g_str_equal(arch, "avr")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M mega2560 "
+            "-netdev user,id=slirp0");
+    } else if (g_str_equal(arch, "rx")) {
+        state = qtest_init(
+            "-nodefaults "
+            "-M gdbsim-r5f562n8 "
+            "-netdev user,id=slirp0");
+    } else {
+        state = qtest_init(
+            "-nodefaults "
+            "-netdev user,id=slirp0");
+    }
+    g_assert(state);
+
+    qmp_query_netdev_no_error(state, 1);
+
+    resp = wait_command(state,
+        "{'execute': 'netdev_add', 'arguments': {"
+        " 'id': 'slirp1',"
+        " 'type': 'user'}}");
+    qobject_unref(resp);
+
+    qmp_query_netdev_no_error(state, 2);
+
+    resp = wait_command(state,
+        "{'execute': 'netdev_del', 'arguments': {"
+        " 'id': 'slirp1'}}");
+    qobject_unref(resp);
+
+    qmp_query_netdev_no_error(state, 1);
+
+    qtest_quit(state);
+}
+
+int main(int argc, char **argv)
+{
+    int ret = 0;
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/net/qapi/query_netdev", test_query_netdev);
+
+    ret = g_test_run();
+
+    return ret;
+}
-- 
2.25.1


