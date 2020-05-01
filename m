Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BFB1C2117
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 01:04:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUei3-0001JS-Do; Fri, 01 May 2020 23:04:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUei2-0001It-1o
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 23:04:42 +0000
X-Inumbo-ID: 224a49b9-8c00-11ea-9b70-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 224a49b9-8c00-11ea-9b70-12813bfff9fa;
 Fri, 01 May 2020 23:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588374281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yRFj9eeWE6eYBW6P5Xnzqp10Fr4wYOcVKuNdQFor0Io=;
 b=VNJPbmkvQgE5brThFiytUokhbVXDGIEIJEUABfEjVNjoaVr+PW33VVwu
 NL8Ju50UGhtNhW63wQXi0NFbAzGqtKifBYAP+K77LEhN+wNYkhQOfdzp0
 7L/X9lMAYrHKLboA6bkdOy8xlIADP4ehPprUHq0cVd/wRZAcvNOqqWUeE w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2i7piaTx+JM8Ul2K6o4UR4T0PTd0cCe5iJrxEMSC3awac4iuUrQcAQeGW7Yrs3Agn+wv4pZ2wa
 R1CTWdRp2YrDB3jQm8kZKJWX4qQVJyqaxzSaAJ8J1SBwQEx7SX407VXgjN3bBhhspUd1+qxrPx
 ARkljdaBFO6B3G6gw9/4al0M8dQ7BLBCxPURI3LCxQ/MuY+MVP8rFJCIckc6hymGNNkeVPlqiq
 2xUStgugFXq/EOTe2DKfhb1ajO4x5+zN8lFoBE1oul2xUeOxBmGCc3l2lt/VKSJV6pIEB59AJt
 BY0=
X-SBRS: 2.7
X-MesageID: 16995035
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16995035"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 11/16] x86/spec-ctrl: Adjust DO_OVERWRITE_RSB to be shadow
 stack compatible
Date: Fri, 1 May 2020 23:58:33 +0100
Message-ID: <20200501225838.9866-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The 32 calls need dropping from the shadow stack as well as the regular stack.
To shorten the code, we can use the 32bit forms of RDSSP/INCSSP, but need to
double up the input to INCSSP to counter the operand size based multiplier.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/spec_ctrl_asm.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/include/asm-x86/spec_ctrl_asm.h b/xen/include/asm-x86/spec_ctrl_asm.h
index c60093b090..cb34299a86 100644
--- a/xen/include/asm-x86/spec_ctrl_asm.h
+++ b/xen/include/asm-x86/spec_ctrl_asm.h
@@ -83,9 +83,9 @@
  * Requires nothing
  * Clobbers \tmp (%rax by default), %rcx
  *
- * Requires 256 bytes of stack space, but %rsp has no net change. Based on
- * Google's performance numbers, the loop is unrolled to 16 iterations and two
- * calls per iteration.
+ * Requires 256 bytes of {,shadow}stack space, but %rsp/SSP has no net
+ * change. Based on Google's performance numbers, the loop is unrolled to 16
+ * iterations and two calls per iteration.
  *
  * The call filling the RSB needs a nonzero displacement.  A nop would do, but
  * we use "1: pause; lfence; jmp 1b" to safely contains any ret-based
@@ -114,6 +114,16 @@
     sub $1, %ecx
     jnz .L\@_fill_rsb_loop
     mov %\tmp, %rsp                 /* Restore old %rsp */
+
+#ifdef CONFIG_XEN_SHSTK
+    mov $1, %ecx
+    rdsspd %ecx
+    cmp $1, %ecx
+    je .L\@_shstk_done
+    mov $64, %ecx                   /* 64 * 4 bytes, given incsspd */
+    incsspd %ecx                    /* Restore old SSP */
+.L\@_shstk_done:
+#endif
 .endm
 
 .macro DO_SPEC_CTRL_ENTRY_FROM_HVM
-- 
2.11.0


