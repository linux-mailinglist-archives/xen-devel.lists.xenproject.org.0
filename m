Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1FC7E2DB6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 21:10:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628433.979949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05vA-0002H5-MT; Mon, 06 Nov 2023 20:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628433.979949; Mon, 06 Nov 2023 20:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r05vA-0002CN-Hh; Mon, 06 Nov 2023 20:10:04 +0000
Received: by outflank-mailman (input) for mailman id 628433;
 Mon, 06 Nov 2023 20:10:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHvK=GT=casper.srs.infradead.org=BATV+7ad6dfa9aff48d363c6b+7379+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r05hQ-00024f-Ot
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 19:55:52 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 785e257f-7cde-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 20:55:44 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r05fd-007tb4-AH; Mon, 06 Nov 2023 19:54:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r05fd-001GPy-1n; Mon, 06 Nov 2023 19:54:01 +0000
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
X-Inumbo-ID: 785e257f-7cde-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Z8O29x0pWQhZMVbX+dyJJms7pdOJv3y/EsgO2DOPUaY=; b=teESO/RtJYYuQVVx1IuFV0fYHO
	QYkJ+WGnPXZGnQb1cse22y5yOxa7n7e0Kz9gFUDvPXwOrQ9QSYu4Ovjg0hvBHAzorWNmcxX8W8dC0
	x87OOZSgAuxGCv05xk2sxU/hWkqL0IJNMWnplS8QUNwg4DDtGsMhPKdCNYRhSn6/w/mEAsw80nSGO
	Yhpresf2n6tgaRnolyiqGAYkjI4+MQu9W54FKMH8udpcer0iA4y8o8+GsniLtFQBClqEJHf0SN35I
	Qc3+cijtHnuNn01n3lUiCUsvyaNlcvNMpoPx6tLeT2rU/MhC43rFjcvlYrZ+/d5dzyzaxOxLw8cOS
	2rB2sH3w==;
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
Subject: [PATCH for-8.3 v2 46/46] net: make nb_nics and nd_table[] static in net/net.c
Date: Mon,  6 Nov 2023 19:49:51 +0000
Message-ID: <20231106195352.301038-47-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106195352.301038-1-dwmw2@infradead.org>
References: <20231106195352.301038-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/net/net.h | 4 ----
 net/net.c         | 3 +++
 system/globals.c  | 2 --
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 290e604f03..5a38766942 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -245,10 +245,6 @@ struct NICInfo {
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
index a3532a71a5..957daad58d 100644
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


