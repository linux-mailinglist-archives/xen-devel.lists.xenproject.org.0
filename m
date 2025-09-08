Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99219B49B9D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 23:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115538.1462126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9b-0000H3-J9; Mon, 08 Sep 2025 21:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115538.1462126; Mon, 08 Sep 2025 21:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvj9b-0000FG-BW; Mon, 08 Sep 2025 21:11:59 +0000
Received: by outflank-mailman (input) for mailman id 1115538;
 Mon, 08 Sep 2025 21:11:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvj9Z-0008QT-Um
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 21:11:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9Z-000FT2-1m;
 Mon, 08 Sep 2025 21:11:57 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvj9Z-000gMD-1x;
 Mon, 08 Sep 2025 21:11:57 +0000
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
	bh=TefMi+8qYWJ3sWp2Jmhd2ppEtx/E0etNYFj1pW73ooo=; b=RMrlGjVZwWJhwisdIpfyGQezh/
	j8FyprAHyc3RVkYgK75iO9XUlEb0qzIUafCBitw5W9uK7ove5z4B8g4I+/xloaXFZRIK3umNtUu+E
	+yxga2J46i5Km9ti7PzcwdCiKZq84Az/cyKeO9LM4mSWQid53qBKYoNulhHaA1gR4vSI=;
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
Subject: [PATCH v7 05/16] emul/ns16x50: implement SCR register
Date: Mon,  8 Sep 2025 14:11:38 -0700
Message-ID: <20250908211149.279143-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908211149.279143-1-dmukhin@ford.com>
References: <20250908211149.279143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add SCR register emulation to the I/O port handler.
Firmware (e.g. OVMF) may use SCR during the guest OS boot.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v6:
- default handling of non-DLL/DLM registers moved to the previous patch
---
 xen/common/emul/vuart/ns16x50.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index da8583a1dc93..5643ef4cc01e 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -106,6 +106,11 @@ static int ns16x50_io_write8(
     {
         switch ( reg )
         {
+        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
+        case UART_SCR:
+            regs[UART_SCR] = val;
+            break;
+
         default:
             rc = -EINVAL;
             break;
@@ -177,6 +182,10 @@ static int ns16x50_io_read8(
     {
         switch ( reg )
         {
+        case UART_SCR:
+            val = regs[UART_SCR];
+            break;
+
         default:
             rc = -EINVAL;
             break;
-- 
2.51.0


