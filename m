Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED96A680D5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919983.1324309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugYH-0001jn-L4; Tue, 18 Mar 2025 23:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919983.1324309; Tue, 18 Mar 2025 23:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugYH-0001hD-H9; Tue, 18 Mar 2025 23:40:53 +0000
Received: by outflank-mailman (input) for mailman id 919983;
 Tue, 18 Mar 2025 23:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tugYF-0001ZU-Pz
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:40:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c752056-0452-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 00:40:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 37F7EA48EFE;
 Tue, 18 Mar 2025 23:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C25FC4CEDD;
 Tue, 18 Mar 2025 23:40:48 +0000 (UTC)
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
X-Inumbo-ID: 6c752056-0452-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742341249;
	bh=deL/onrfoVZsdhrm0u6AY3vrwa6Fo0KcjW7Cbt2wdeQ=;
	h=Date:From:To:cc:Subject:From;
	b=GjbEpTQ7YWH46u2+CaTC1FrA9kXYFCWs9BiivaCZIx2OaCLU/3OJSkaGgs5PNGQ3h
	 BzY3aiZnBLd2THAeS3xdM7zWX9cDH8bCSNojr8+msd1KvMOkgLHay4Cbt7H3rk/zp3
	 EGwy9wwri1P42Zk0Iv62TZyY7XqPDPcI8adMbBskkqkYFkn2GJZ4J8jb0OdHoN74I9
	 rZdDnH2LvDifUkRFO1+2fysDyrtp/I4MqlbdkwYIgxhPb19eYwcub3DRz5OWfftwFM
	 i2hNZy6UPbY/Oeoakuo9+KjyM3kweYekdcleUvlCoEk7Y3/d+i1/se8plohL9uFzEp
	 mXVozEGo7eGXw==
Date: Tue, 18 Mar 2025 16:40:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, michal.orzel@amd.com, 
    jbeulich@suse.com, julien@xen.org, roger.pau@citrix.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen: add kconfig for event_fifo
Message-ID: <alpine.DEB.2.22.394.2503181637100.2000798@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Evtchn fifos are not needed on smaller systems; the older interface is
lightweight and sufficient. Make it possible to disable evtchn fifo.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index a6aa2c5c14..14d82923c5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -23,6 +23,16 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config EVTCHN_FIFO
+	bool "Event Channel Fifo support" if EXPERT
+	default y
+	help
+	  The Event channel Fifo extends support for event channels
+	  beyond 1024 event channels for 32-bit guests and 4096 for
+	  64-bit guests.
+
+	  If unsure, say Y.
+
 config PDX_COMPRESSION
 	bool "PDX (Page inDeX) compression" if EXPERT && !X86 && !RISCV
 	default ARM || PPC
diff --git a/xen/common/Makefile b/xen/common/Makefile
index ac23120d7d..9da8a7244d 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -13,7 +13,7 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
 obj-y += event_channel.o
-obj-y += event_fifo.o
+obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
 obj-y += gzip/
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index 45219ca67c..a778ae775b 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -45,12 +45,27 @@ void evtchn_2l_init(struct domain *d);
 
 /* FIFO */
 
+#ifdef CONFIG_EVTCHN_FIFO
 struct evtchn_init_control;
 struct evtchn_expand_array;
 
 int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *d);
+#else
+static inline int evtchn_fifo_init_control(struct evtchn_init_control *init_control)
+{
+    return -EOPNOTSUPP;
+}
+static inline int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array)
+{
+    return -EOPNOTSUPP;
+}
+static inline void evtchn_fifo_destroy(struct domain *d)
+{
+    return;
+}
+#endif /* CONFIG_EVTCHN_FIFO */
 
 /*
  * Local variables:

