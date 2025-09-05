Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D37AB4672A
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112636.1460904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq5-00034D-Hs; Fri, 05 Sep 2025 23:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112636.1460904; Fri, 05 Sep 2025 23:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufq5-00030M-9H; Fri, 05 Sep 2025 23:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1112636;
 Fri, 05 Sep 2025 23:27:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufq3-0002ZE-Lu
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:27:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq3-008ABf-0o;
 Fri, 05 Sep 2025 23:27:27 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufq3-0005DI-0m;
 Fri, 05 Sep 2025 23:27:27 +0000
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
	bh=lacCZFGmXlDfnSAS6hfC6DHktgzcKHiHe+PObjndGXg=; b=G1pmnoo+ZEN+TcIqdFDsQKGgdJ
	/FWLeg0iGHix2iDuRi7baQP0ogmDPvUJRw4ImgEaZvvRGI0SXTSDeyylCrx4RcKqZzkKcxLudUQz4
	x/4SLMrstkpsstf3VrTMp0lYGWCz8De8XFbMJgRCS1YCGifOYrBxBuFiwwkPXQOOIc2A=;
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
Subject: [PATCH v6 08/15] emul/ns16x50: implement MCR/MSR registers
Date: Fri,  5 Sep 2025 16:27:07 -0700
Message-ID: <20250905232715.440758-9-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add MCR/MSR registers emulation to the I/O port handler.

Add implementation of ns16x50_iir_check_msi().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes in v5:
- Moved earlier in the series
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-10-dmukhin@ford.com/
---
 xen/common/emul/vuart/ns16x50.c | 62 ++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 9d1fe0284362..a8ec9f6c3a04 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -108,7 +108,7 @@ static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
 
 static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
 }
 
 /*
@@ -230,12 +230,63 @@ static int ns16x50_io_write8(
             regs[UART_LCR] = val;
             break;
 
+        case UART_MCR: {
+            uint8_t msr_curr, msr_next, msr_delta;
+
+            msr_curr = regs[UART_MSR];
+            msr_next = 0;
+            msr_delta = 0;
+
+            if ( val & UART_MCR_RESERVED0 )
+                ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %x\n",
+                             UART_MCR_RESERVED0);
+
+            if ( val & UART_MCR_TCRTLR )
+                ns16x50_warn(vdev, "MCR: not supported: %x\n",
+                             UART_MCR_TCRTLR);
+
+            if ( val & UART_MCR_RESERVED1 )
+                ns16x50_warn(vdev, "MCR: attempt to set reserved bit: %x\n",
+                             UART_MCR_RESERVED1);
+
+            /* Set modem status */
+            if ( val & UART_MCR_LOOP )
+            {
+                if ( val & UART_MCR_DTR )
+                    msr_next |= UART_MSR_DSR;
+                if ( val & UART_MCR_RTS )
+                    msr_next |= UART_MSR_CTS;
+                if ( val & UART_MCR_OUT1 )
+                    msr_next |= UART_MSR_RI;
+                if ( val & UART_MCR_OUT2 )
+                    msr_next |= UART_MSR_DCD;
+            }
+            else
+                msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
+
+            /* Calculate changes in modem status */
+            if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
+                msr_delta |= UART_MSR_DCTS;
+            if ( (msr_curr & UART_MSR_DSR) ^ (msr_next & UART_MSR_DSR) )
+                msr_delta |= UART_MSR_DDSR;
+            if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
+                msr_delta |= UART_MSR_TERI;
+            if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
+                msr_delta |= UART_MSR_DDCD;
+
+            regs[UART_MCR] = val & UART_MCR_MASK;
+            regs[UART_MSR] = msr_next | msr_delta;
+
+            break;
+        }
+
         /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
         case UART_SCR:
             regs[UART_SCR] = val;
             break;
 
         case UART_LSR: /* RO */
+        case UART_MSR: /* RO */
         default:
             rc = -EINVAL;
             break;
@@ -321,11 +372,20 @@ static int ns16x50_io_read8(
             val = regs[UART_LCR];
             break;
 
+        case UART_MCR:
+            val = regs[UART_MCR];
+            break;
+
         case UART_LSR:
             val = regs[UART_LSR] | UART_LSR_THRE | UART_LSR_TEMT;
             regs[UART_LSR] = val & ~UART_LSR_MASK;
             break;
 
+        case UART_MSR:
+            val = regs[UART_MSR];
+            regs[UART_MSR] &= ~UART_MSR_CHANGE;
+            break;
+
         case UART_SCR:
             val = regs[UART_SCR];
             break;
-- 
2.51.0


