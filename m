Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F183E0E0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 18:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672409.1046474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQJH-000735-I3; Fri, 26 Jan 2024 17:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672409.1046474; Fri, 26 Jan 2024 17:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQJH-000712-Eg; Fri, 26 Jan 2024 17:48:11 +0000
Received: by outflank-mailman (input) for mailman id 672409;
 Fri, 26 Jan 2024 17:48:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46+y=JE=desiato.srs.infradead.org=BATV+5cc348fc898a3f56ac6c+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTQ54-0004Zo-G9
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 17:33:30 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04989073-bc71-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 18:33:29 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ4B-000000069V8-2yGf; Fri, 26 Jan 2024 17:32:36 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ4B-00000001eoX-07cN;
 Fri, 26 Jan 2024 17:32:35 +0000
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
X-Inumbo-ID: 04989073-bc71-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4MfAr1yLI5YhElasbf+xYz8slg97fPxYAJHsYCE6HR0=; b=QCcaZ/6C5Iz4cXurFdCGdwPkbs
	Tx+OFOX65z8WZLMrj3r1M1OMa1uCBfhIBkcTalLwyCSVgdp6MRC0yngtPLUk5QQopCNkJxAPjr8jV
	gHBfM+h8Ivnb1jSyeRCUQN44kMg1saXw8rCMBiZrSz0X4jfd6xIpolJgUrAOJCJSl5DCO184V81xQ
	YRJVYKJmmArP7BgFHFDffL11xggxzqvuYlMBM/FYtZ++qK5KeLTkvIsQV7g7OmUG8MlMaO9v2/PFx
	5M7WoyLiczrNts5+qs1F+3zrEq194HhwpwIokm0ghvWCjhXCW0mVX+pXANYl+JThRACU+DCvFtyGJ
	gN/pe2eA==;
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
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
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
	xen-devel@lists.xenproject.org,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v4 46/47] net: remove qemu_show_nic_models(), qemu_find_nic_model()
Date: Fri, 26 Jan 2024 17:25:23 +0000
Message-ID: <20240126173228.394202-47-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

These old functions can be removed now too. Let net_param_nic() print
the full set of network devices directly, and also make it note that a
list more specific to this platform/config will be available by using
'-nic model=help' instead.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h |  3 ---
 net/net.c         | 39 ++++++---------------------------------
 2 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 00ee1af7ab..588ee55f28 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -203,9 +203,6 @@ void qemu_set_vnet_hdr_len(NetClientState *nc, int len);
 int qemu_set_vnet_le(NetClientState *nc, bool is_le);
 int qemu_set_vnet_be(NetClientState *nc, bool is_be);
 void qemu_macaddr_default_if_unset(MACAddr *macaddr);
-int qemu_show_nic_models(const char *arg, const char *const *models);
-int qemu_find_nic_model(NICInfo *nd, const char * const *models,
-                        const char *default_model);
 /**
  * qemu_find_nic_info: Obtain NIC configuration information
  * @typename: Name of device object type
diff --git a/net/net.c b/net/net.c
index ffd4b42d5a..d705e9b0fd 100644
--- a/net/net.c
+++ b/net/net.c
@@ -977,38 +977,6 @@ GPtrArray *qemu_get_nic_models(const char *device_type)
     return nic_models;
 }
 
-int qemu_show_nic_models(const char *arg, const char *const *models)
-{
-    int i;
-
-    if (!arg || !is_help_option(arg)) {
-        return 0;
-    }
-
-    printf("Available NIC models:\n");
-    for (i = 0 ; models[i]; i++) {
-        printf("%s\n", models[i]);
-    }
-    return 1;
-}
-
-int qemu_find_nic_model(NICInfo *nd, const char * const *models,
-                        const char *default_model)
-{
-    int i;
-
-    if (!nd->model)
-        nd->model = g_strdup(default_model);
-
-    for (i = 0 ; models[i]; i++) {
-        if (strcmp(nd->model, models[i]) == 0)
-            return i;
-    }
-
-    error_report("Unsupported NIC model: %s", nd->model);
-    return -1;
-}
-
 static int net_init_nic(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
@@ -1791,9 +1759,14 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
         }
         if (is_help_option(type)) {
             GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
+            int i;
             show_netdevs();
             printf("\n");
-            qemu_show_nic_models(type, (const char **)nic_models->pdata);
+            printf("Available NIC models "
+                   "(use -nic model=help for a filtered list):\n");
+            for (i = 0 ; nic_models->pdata[i]; i++) {
+                printf("%s\n", (char *)nic_models->pdata[i]);
+            }
             g_ptr_array_free(nic_models, true);
             exit(0);
         }
-- 
2.43.0


