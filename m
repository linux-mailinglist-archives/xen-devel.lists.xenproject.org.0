Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D9F7E2D9F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:07:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628370.979808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05sS-0001Bx-Cj; Mon, 06 Nov 2023 20:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628370.979808; Mon, 06 Nov 2023 20:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05sS-00019c-9r; Mon, 06 Nov 2023 20:07:16 +0000
Received: by outflank-mailman (input) for mailman id 628370;
 Mon, 06 Nov 2023 20:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwd5=GT=desiato.srs.infradead.org=BATV+aa7b7dce24b49c47a83c+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hT-0001Ig-GE
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:55 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b871ac9-7cde-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 20:55:49 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r05fa-00AkFa-1s; Mon, 06 Nov 2023 19:53:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fZ-001GMf-1K; Mon, 06 Nov 2023 19:53:57 +0000
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
X-Inumbo-ID: 7b871ac9-7cde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NtM5dvM1hcy/esdporcv2SoK/3lYRmBKLdh9Syn+Wp0=; b=ngzUVgS4H/dtZV5qL2t7cAUpck
	uJlyiTRKkP7Yz7NAXqv7rY2nhJ1+lLV/L00BXYGxy9gXTakinwc94gdhlEafmtalVHp6TRK5lJjzj
	HA9LAMqTDMjc7Ql8v20cHvCxKBuVOYy1bXJwpFEzFEmGaDCCass7fnEmbXmXSLHh8u65qk+BLFsBz
	Q68O+4Q63xnhS37lChAigIDopyGum0MChZw2cddB0gtfkqmHFM1xK/DF8bljADrNkbIUNFT7AIl6H
	Tv4pjhaIrF8+f+PrZrY30XAqtUl8nHeBMzPfdXfnf5QcNFPbDcgGpLT4WgDRSKo7Et6DEVMaBH2hc
	ajduyDJA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	Thomas Huth <huth@tuxfamily.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jason Wang <jasowang@redhat.com>,
	Jia Liu <proljc@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH for-8.3 v2 02/46] net: report list of available models according to platform
Date: Mon,  6 Nov 2023 19:49:07 +0000
Message-ID: <20231106195352.301038-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

By noting the models for which a configuration was requested, we can give
the user an accurate list of which NIC models were actually available on
the platform/configuration that was otherwise chosen.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
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
2.41.0


