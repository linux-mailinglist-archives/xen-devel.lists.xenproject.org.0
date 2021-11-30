Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E680246309D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234953.407691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00d-0007lX-9a; Tue, 30 Nov 2021 10:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234953.407691; Tue, 30 Nov 2021 10:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00c-0007h6-Tg; Tue, 30 Nov 2021 10:05:10 +0000
Received: by outflank-mailman (input) for mailman id 234953;
 Tue, 30 Nov 2021 10:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00b-0007QZ-AU
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff3a9e16-51c4-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 11:05:08 +0100 (CET)
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
X-Inumbo-ID: ff3a9e16-51c4-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pi8aH3JRK86CaSMRjaSHXycx0FZbeTLBq9iyeIqfZcI=;
  b=J5H/XgscneGkd0Lds4oA4aJwqg0pmnODLmWjvZ54hgw7AGgdqCOiJIKr
   kJkzny5t4M+qFAHPoHNIZNuoFlaQkvjElGldvhU6qYqpDOQGLvDR1y2lx
   DyhKLBRPb2DNUBuLzvbqXe+1x9PYnQqOcGoP39b5o3C1EUV27Xhee/MZD
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: edmLOWAtT1zvkYvZldukRnXMN/RlH+LzAUacSEoBEelEMOiVii1IfN9/2Eq7DmFlJAetKTqucU
 n35l4hOMtuNPzCJqC0MAVI+/9kuZmAZgvut7HoDZHABpps0rpLqm08KsYoUpLDbueT4F90MCRV
 3/QkQojmPMtYdM7FZ3hVWXSE9L2FRpJ1AyaatVw8dPpCRLRSvcD27/f7oqDzBK5ebHG4Wz4rQG
 BUc2+DvGXRuARY9X+Wb4cihaaJkI4db4XPsAeiObteSTJoKbqoP851HH07Hn8EAmALEZjBOxIb
 SgEDxaGAAv39JRfiFk2Wqp8B
X-SBRS: 5.1
X-MesageID: 59281587
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q4ny9KPMw8sZCjbvrR1okMFynXyQoLVcMsEvi/4bfWQNrUon1DNVm
 GMZUWjSPPvYMGD2LYt2aY6yoR9Q7ZXTndA1GQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Ek7w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2rYhO5j+
 e9Cj5i5WUAgG4/Ktr0zAjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWZq1pkTTam2i
 8wxQ2ZmVT3cQBJ1H1oXWNExsuWC2GTBbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbb7wUiSetqHNc+4RHKw4/25SjAKDktG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7CFTFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sAumgnfxw3aJpeEdMMX
 KM1kVgKjHO0FCH3BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:u6lbbaigHaAv71ZdvVWq0vnDS3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="59281587"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH RFC 8/8] x86/boot: Check that permission restrictions have taken effect
Date: Tue, 30 Nov 2021 10:04:45 +0000
Message-ID: <20211130100445.31156-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

RFC.  I don't know if this is something we'd want to keep or not.

Getting extable handling working for test_nx_data is proving tricky, and while
I can't spot anything that should stop the extable from working with NX
faults, from a security hardening perspective, there really ought to
be.

(Spurious faults aside), there are no circumstances where an NX fault is
legitimate, and restricting extable's ability to interfere with the fatality
of an NX fault provides a better security posture.
---
 xen/arch/x86/setup.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3bbc46f244b9..7cb530a7528f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -668,6 +668,45 @@ static void noreturn init_done(void)
                         (unsigned long)&__2M_rodata_end,
                         PAGE_HYPERVISOR_RO);
 
+    if ( IS_ENABLED(CONFIG_DEBUG) )
+    {
+        static const char test_rodata = 1;
+        static char __ro_after_init test_ro_after_init = 1;
+
+#define PROBE(insn, c, p)                       \
+    ({                                          \
+        bool fault = 0;                         \
+        asm ( "1:" insn "[ptr]\n\t"             \
+              "2:\n\t"                          \
+              ".section .fixup,\"ax\"\n\t"      \
+              "3: movb $1, %[fault]\n\t"        \
+              "jmp 2b\n\t"                      \
+              ".previous"                       \
+              _ASM_EXTABLE(1b, 3b)              \
+              : [fault] "+r" (fault)            \
+              : [ptr] c (p)                     \
+            );                                  \
+        fault;                                  \
+    })
+
+        if ( !PROBE("notb %", "m", test_rodata) )
+            panic("No fault from test_rodata\n");
+
+        if ( !PROBE("notb %", "m", test_ro_after_init) )
+            panic("No fault from test_ro_after_init\n");
+
+        if ( !PROBE("notb %", "m", init_done) )
+            panic("No fault from modifying init_done\n");
+
+        if ( 0 /* RFC */ && cpu_has_nx )
+        {
+            static char test_nx_data[1] = { 0xc3 };
+
+            if ( !PROBE("call %c", "i", test_nx_data) )
+                panic("No fault from test_nx_data\n");
+        }
+    }
+
     startup_cpu_idle_loop();
 }
 
-- 
2.11.0


