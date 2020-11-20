Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246BD2BA687
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31840.62642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg32Y-0005QK-E5; Fri, 20 Nov 2020 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31840.62642; Fri, 20 Nov 2020 09:49:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg32Y-0005PI-1b; Fri, 20 Nov 2020 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 31840;
 Fri, 20 Nov 2020 09:49:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg32W-0005Mr-Dk
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32V-0002bN-Jp; Fri, 20 Nov 2020 09:49:11 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg32V-0003d1-Bu; Fri, 20 Nov 2020 09:49:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32W-0005Mr-Dk
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ur98iexNlxW3wPnCoGH5R8tJsU4anFW0cgN61u59s58=; b=EbmX6KfTkfVSVhcM7nRxkqW8q1
	cP83sNOja9lntToF+lbfAB3WxN/n4OG8WM/rBZz55JBZvx3uqvq/S5dgGVU4ZtpzS/WERLLDgFUTM
	F8kf/CA4Gm7mPnxLhbcE8GQQkycbRgDjWAVmPv8yuB5bKBv3k5gDPF5UFcV6VBHOZ5tg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32V-0002bN-Jp; Fri, 20 Nov 2020 09:49:11 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg32V-0003d1-Bu; Fri, 20 Nov 2020 09:49:11 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 07/12] xen/include: import sizeof_field() macro from Linux stddef.h
Date: Fri, 20 Nov 2020 09:48:55 +0000
Message-Id: <20201120094900.1489-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120094900.1489-1-paul@xen.org>
References: <20201120094900.1489-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Co-locate it with the definition of offsetof() (since this is also in stddef.h
in the Linux kernel source). This macro will be needed in a subsequent patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
---
 xen/include/xen/compiler.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index c0e0ee9f27be..676c6ea1b0a0 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -76,6 +76,14 @@
 
 #define offsetof(a,b) __builtin_offsetof(a,b)
 
+/**
+ * sizeof_field(TYPE, MEMBER)
+ *
+ * @TYPE: The structure containing the field of interest
+ * @MEMBER: The field to return the size of
+ */
+#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
+
 #if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 201112L
 #define alignof __alignof__
 #endif
-- 
2.20.1


