Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5079B49B92
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115549.1462201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9l-0002Se-Iw; Mon, 08 Sep 2025 21:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115549.1462201; Mon, 08 Sep 2025 21:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9l-0002Io-5h; Mon, 08 Sep 2025 21:12:09 +0000
Received: by outflank-mailman (input) for mailman id 1115549;
 Mon, 08 Sep 2025 21:12:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9i-0001qT-Hl
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:12:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9i-000FUt-0w;
 Mon, 08 Sep 2025 21:12:06 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9i-000gNQ-1A;
 Mon, 08 Sep 2025 21:12:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=KkUN0OllhKW27ZmsCBHTtMD+F/9dKnn+1KTiUiwT17c=; b=GbGd+yPlZZoKbzzS07p93lgEKd
	/XZqka49ao5ewWmTypg9sYU4phrlCfNqN+m1E/I6ATWtAkUxLj73rA7X57HPCylyyr9Q9vb4PkpWo
	2PbzxoE11vg7Quxvny1g5Fn3hvcYiiFttggU2fx6GUYMhvyFlbejQLc3Qz3JyREeIsV8=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v7 13/16] emul/ns16x50: add Kconfig options
Date: Mon,  8 Sep 2025 14:11:46 -0700
Message-ID: <20250908211149.279143-14-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add initial Kconfig options configure NS16550-capable emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- new patch
---
 xen/common/emul/vuart/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
index ce1b976b7da7..9a49a6528b5a 100644
--- a/xen/common/emul/vuart/Kconfig
+++ b/xen/common/emul/vuart/Kconfig
@@ -3,4 +3,23 @@ config VUART_FRAMEWORK
 
 menu "UART Emulation"
 
+config VUART_NS16X50
+	bool "NS16550-compatible UART Emulator" if EXPERT
+	depends on X86 && HVM
+	select VUART_FRAMEWORK
+	help
+	  In-hypervisor NS16550-compatible UART emulation.
+
+	  Only one legacy PC COM port is emulated for domain with a certain ID
+	  (set via 'vuart-domid=' command line setting).
+
+	  This is strictly for testing purposes (such as early HVM guest console),
+	  and not appropriate for use in production.
+
+config VUART_NS16X50_DEBUG
+	bool "Development: NS16550-compatible UART Emulator Debugging"
+	depends on VUART_NS16X50 && DEBUG
+	help
+	  Enable development debugging.
+
 endmenu
-- 
2.51.0


