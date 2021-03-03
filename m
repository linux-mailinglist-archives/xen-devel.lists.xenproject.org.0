Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF16532B664
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92801.174933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOHy-0001Ry-F2; Wed, 03 Mar 2021 09:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92801.174933; Wed, 03 Mar 2021 09:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHOHy-0001RJ-Aw; Wed, 03 Mar 2021 09:59:30 +0000
Received: by outflank-mailman (input) for mailman id 92801;
 Wed, 03 Mar 2021 09:59:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4P7r=IB=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lHOHx-0001PK-CC
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:59:29 +0000
Received: from forwardcorp1o.mail.yandex.net (unknown [2a02:6b8:0:1a2d::193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03bc414c-1d27-4163-aa22-dc3a6fffd42b;
 Wed, 03 Mar 2021 09:59:24 +0000 (UTC)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 778DD2E159D;
 Wed,  3 Mar 2021 12:59:23 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 3wSchzD0qs-xNx0Kbbh; Wed, 03 Mar 2021 12:59:23 +0300
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:107:880d:3c89:fcd8:ca75])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 w0BjtEeJGw-xNnKfM56; Wed, 03 Mar 2021 12:59:23 +0300
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
X-Inumbo-ID: 03bc414c-1d27-4163-aa22-dc3a6fffd42b
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1614765563; bh=TClaDRzxQB4h6SlKaYxQXAsUYr6qhA7dXnvUiqCeKqs=;
	h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
	b=ECfrZx48XAaCBOEwbhj1JgVAsg8v9direbd7oanzOnhLwMqHZ+vl/7eqref57HsGc
	 xmQgPHA8N5kCiM0H3sB8+XjNNdnPOYdsKcocuHkg0MI6kTNlPFbf4p0Bk36Uwr3TL9
	 Br3swnWxJY+Ny5qVkGUwSzkLtVnpKRnCZfxCu76Y=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
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
Subject: [PATCH v7 2/5] tests: Add tests for query-netdev command
Date: Wed,  3 Mar 2021 12:59:07 +0300
Message-Id: <20210303095910.78277-3-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303095910.78277-1-lekiravi@yandex-team.ru>
References: <20210303095910.78277-1-lekiravi@yandex-team.ru>
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


