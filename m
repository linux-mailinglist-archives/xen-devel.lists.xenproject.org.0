Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99FB7D6FB6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622967.970319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDw-0001eP-27; Wed, 25 Oct 2023 14:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622967.970319; Wed, 25 Oct 2023 14:51:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvfDv-0001T4-Qw; Wed, 25 Oct 2023 14:51:07 +0000
Received: by outflank-mailman (input) for mailman id 622967;
 Wed, 25 Oct 2023 14:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJSz=GH=casper.srs.infradead.org=BATV+85b1c44ac99574f3713d+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvfDu-0008W8-8V
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:51:06 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eca87b99-7345-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 16:51:05 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvfDZ-009Nmr-Th; Wed, 25 Oct 2023 14:50:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qvfDZ-002dFY-1e; Wed, 25 Oct 2023 15:50:45 +0100
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
X-Inumbo-ID: eca87b99-7345-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uSYMnEZDiwsPKPtr72ZyrADmBs8CT77t/B1qZONpFnk=; b=WfqXIU2zPItQyXKjZHl4Uu9nXh
	B6aWg7LSpwUF0ueOAIEJSHiIEOHrRCeloIWpDcQLn00ZXlpH77lXvOJaiaJ+/nYln7eLJrszaiTL/
	50b3+nHmNgCiey+dLbJhOYuEqpXAmelyhhNY+Jf93M/8ffQ/AW/ZaXJ6BdpbzfhFn3y5SEKA7L7bb
	5cxCrkxQM2ovzfSMvfuakvCgcXTE2C+qrxmRHBI/8yrS82PDGltHwhHIWhkoUKeTZMBz6cei2ZY1a
	i1qLV5q9D7zkuExZVKvvuuvpb5o+fOdDWtGJVQhuKAYVc8Ub6vIRyjQL7K53bgfylOkeRywegpm+R
	8CpeF+jw==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v3 23/28] net: report list of available models according to platform
Date: Wed, 25 Oct 2023 15:50:37 +0100
Message-Id: <20231025145042.627381-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231025145042.627381-1-dwmw2@infradead.org>
References: <20231025145042.627381-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

By noting the models for which a configuration was requested, we can give
the user an accurate list of which NIC models were actually available on
the platform/configuration that was otherwise chosen.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 net/net.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/net/net.c b/net/net.c
index f8b4973a1e..807220e630 100644
--- a/net/net.c
+++ b/net/net.c
@@ -75,6 +75,8 @@ typedef QSIMPLEQ_HEAD(, NetdevQueueEntry) NetdevQueue;
 
 static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
 
+static GHashTable *nic_model_help;
+
 /***********************************************************/
 /* network device redirectors */
 
@@ -1072,12 +1074,94 @@ static int net_init_nic(const Netdev *netdev, const char *name,
     return idx;
 }
 
+static gboolean add_nic_result(gpointer key, gpointer value, gpointer user_data)
+{
+    GPtrArray *results = user_data;
+    GPtrArray *alias_list = value;
+    const char *model = key;
+    char *result;
+
+    if (!alias_list) {
+        result = g_strdup(model);
+    } else {
+        GString *result_str = g_string_new(model);
+        int i;
+
+        g_string_append(result_str, " (aka ");
+        for (i = 0; i < alias_list->len; i++) {
+            if (i) {
+                g_string_append(result_str, ", ");
+            }
+            g_string_append(result_str, alias_list->pdata[i]);
+        }
+        g_string_append(result_str, ")");
+        result = result_str->str;
+        g_string_free(result_str, false);
+        g_ptr_array_unref(alias_list);
+    }
+    g_ptr_array_add(results, result);
+    return true;
+}
+
+static int model_cmp(char **a, char **b)
+{
+    return strcmp(*a, *b);
+}
+
+static void show_nic_models(void)
+{
+    GPtrArray *results = g_ptr_array_new();
+    int i;
+
+    g_hash_table_foreach_remove(nic_model_help, add_nic_result, results);
+    g_ptr_array_sort(results, (GCompareFunc)model_cmp);
+
+    printf("Available NIC models for this configuration:\n");
+    for (i = 0 ; i < results->len; i++) {
+        printf("%s\n", (char *)results->pdata[i]);
+    }
+    g_hash_table_unref(nic_model_help);
+    nic_model_help = NULL;
+}
+
+static void add_nic_model_help(const char *model, const char *alias)
+{
+    GPtrArray *alias_list = NULL;
+
+    if (g_hash_table_lookup_extended(nic_model_help, model, NULL,
+                                     (gpointer *)&alias_list)) {
+        /* Already exists, no alias to add: return */
+        if (!alias) {
+            return;
+        }
+        if (alias_list) {
+            /* Check if this alias is already in the list. Add if not. */
+            if (!g_ptr_array_find_with_equal_func(alias_list, alias,
+                                                  g_str_equal, NULL)) {
+                g_ptr_array_add(alias_list, g_strdup(alias));
+            }
+            return;
+        }
+    }
+    /* Either this model wasn't in the list already, or a first alias added */
+    if (alias) {
+        alias_list = g_ptr_array_new();
+        g_ptr_array_set_free_func(alias_list, g_free);
+        g_ptr_array_add(alias_list, g_strdup(alias));
+    }
+    g_hash_table_replace(nic_model_help, g_strdup(model), alias_list);
+}
+
 NICInfo *qemu_find_nic_info(const char *typename, bool match_default,
                             const char *alias)
 {
     NICInfo *nd;
     int i;
 
+    if (nic_model_help) {
+        add_nic_model_help(typename, alias);
+    }
+
     for (i = 0; i < nb_nics; i++) {
         nd = &nd_table[i];
 
@@ -1591,6 +1675,10 @@ void net_check_clients(void)
     NetClientState *nc;
     int i;
 
+    if (nic_model_help) {
+        show_nic_models();
+        exit(0);
+    }
     net_hub_check_clients();
 
     QTAILQ_FOREACH(nc, &net_clients, next) {
@@ -1670,6 +1758,12 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
     memset(ni, 0, sizeof(*ni));
     ni->model = qemu_opt_get_del(opts, "model");
 
+    if (!nic_model_help && !g_strcmp0(ni->model, "help")) {
+        nic_model_help = g_hash_table_new_full(g_str_hash, g_str_equal,
+                                               g_free, NULL);
+        return 0;
+    }
+
     /* Create an ID if the user did not specify one */
     nd_id = g_strdup(qemu_opts_id(opts));
     if (!nd_id) {
-- 
2.40.1


