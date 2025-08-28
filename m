Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B4B3AEAB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 01:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100183.1453827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRn-0006Wy-4t; Thu, 28 Aug 2025 23:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100183.1453827; Thu, 28 Aug 2025 23:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urmRm-0006PR-Oa; Thu, 28 Aug 2025 23:54:26 +0000
Received: by outflank-mailman (input) for mailman id 1100183;
 Thu, 28 Aug 2025 23:54:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1urmRk-0005zF-E6
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 23:54:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRj-00B9uP-27;
 Thu, 28 Aug 2025 23:54:23 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1urmRj-006h8x-27;
 Thu, 28 Aug 2025 23:54:23 +0000
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
	bh=/0KeKgcVmU8n8dMjHO23J9fIrZ07FVfbQbieqtJvywI=; b=sIZyNR3e756B2WBmeXKiNVdCcm
	70rRRo5DlRmK8T4D4aJmwnkGWj5UQg0HVakpasJmB03Br9bdkXIOZ2qbz/U1Y0LWd/xQ+9od6LnSi
	YMfFTlCGIbcUYzJit8pu8ZmchH0HsL+a4SnXtsz8MTQQfTJoKtteZTYTwI52bWhaaVMI=;
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
Subject: [PATCH v5 10/15] emul/ns16x50: implement SCR register
Date: Thu, 28 Aug 2025 16:54:04 -0700
Message-ID: <20250828235409.2835815-11-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828235409.2835815-1-dmukhin@ford.com>
References: <20250828235409.2835815-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add SCR register emulation to the I/O port handler.
Firmware (e.g. OVMF) may use SCR during the guest OS boot.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/common/emul/vuart/ns16x50.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 670c3c6dba9d..d57695564329 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -444,6 +444,11 @@ static int ns16x50_io_write8(
             break;
         }
 
+        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
+        case UART_SCR:
+            regs[UART_SCR] = val;
+            break;
+
         case UART_LSR: /* RO */
         case UART_MSR: /* RO */
         default:
@@ -566,6 +571,10 @@ static int ns16x50_io_read8(
             regs[UART_MSR] &= ~UART_MSR_CHANGE;
             break;
 
+        case UART_SCR:
+            val = regs[UART_SCR];
+            break;
+
         default:
             rc = -EINVAL;
             break;
-- 
2.51.0


