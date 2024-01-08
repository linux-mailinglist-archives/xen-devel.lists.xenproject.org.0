Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7A4827A19
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 22:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664098.1034268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwxr-00067w-OL; Mon, 08 Jan 2024 21:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664098.1034268; Mon, 08 Jan 2024 21:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMwxr-00065K-L0; Mon, 08 Jan 2024 21:15:19 +0000
Received: by outflank-mailman (input) for mailman id 664098;
 Mon, 08 Jan 2024 21:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNLN=IS=desiato.srs.infradead.org=BATV+a33e3d7a5f0474923369+7442+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rMwai-0000R6-IQ
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 20:51:24 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd38ddf-ae67-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 21:51:20 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rMwYn-007wY5-1J; Mon, 08 Jan 2024 20:49:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1rMwYm-002NHR-08; Mon, 08 Jan 2024 20:49:24 +0000
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
X-Inumbo-ID: acd38ddf-ae67-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=eaAFW36JmxXWmDyL503PHxB2uidAX+ONS5eunDGunx4=; b=bXRZhmKqy0KMbxNQ2VqUTO4fz9
	scNM0xmLPjyWIYQ3Gl4ffbtEMSnh6B40MB53OrOF44rVR5KTqrbsIdpUv+PTciMO1S+sa9ElOmQI2
	byu39cOOJs179txlBRh6J9Y4NL61hEy96HNxOFAKccIkhndFEN3ADJ+wkJjhDk7k3VuuX1BXTYWZP
	Eip9ztAl8vl0duIqFNc1DBpbrw5MIp2r4Q/+9IEVC6J/ueW2VxOSOgs7sthH/5TNq6Z9QxjTn/shJ
	2UdqNMrSnCO8dkrClsFTOfSf2OeTekne0NFfasFqnq3fBvh/52IPDe/dYHEqTx0MfR+ctal3Hq3rv
	GugV2WmQ==;
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
Subject: [PATCH v3 46/46] net: make nb_nics and nd_table[] static in net/net.c
Date: Mon,  8 Jan 2024 20:27:15 +0000
Message-ID: <20240108204909.564514-47-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240108204909.564514-1-dwmw2@infradead.org>
References: <20240108204909.564514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h | 4 ----
 net/net.c         | 3 +++
 system/globals.c  | 2 --
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 19fb82833c..766201c62c 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -247,10 +247,6 @@ struct NICInfo {
     int nvectors;
 };
 
-extern int nb_nics;
-extern NICInfo nd_table[MAX_NICS];
-extern const char *host_net_devices[];
-
 /* from net.c */
 extern NetClientStateList net_clients;
 bool netdev_is_modern(const char *optstr);
diff --git a/net/net.c b/net/net.c
index 09ab0889f5..71cccb19da 100644
--- a/net/net.c
+++ b/net/net.c
@@ -77,6 +77,9 @@ static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
 
 static GHashTable *nic_model_help;
 
+static int nb_nics;
+static NICInfo nd_table[MAX_NICS];
+
 /***********************************************************/
 /* network device redirectors */
 
diff --git a/system/globals.c b/system/globals.c
index e83b5428d1..b6d4e72530 100644
--- a/system/globals.c
+++ b/system/globals.c
@@ -36,8 +36,6 @@ int display_opengl;
 const char* keyboard_layout;
 bool enable_mlock;
 bool enable_cpu_pm;
-int nb_nics;
-NICInfo nd_table[MAX_NICS];
 int autostart = 1;
 int vga_interface_type = VGA_NONE;
 bool vga_interface_created;
-- 
2.41.0


