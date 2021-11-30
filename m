Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB94630A0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234955.407719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00f-00007N-Cm; Tue, 30 Nov 2021 10:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234955.407719; Tue, 30 Nov 2021 10:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00f-0008SE-5U; Tue, 30 Nov 2021 10:05:13 +0000
Received: by outflank-mailman (input) for mailman id 234955;
 Tue, 30 Nov 2021 10:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00c-0007QZ-GH
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffefa7a9-51c4-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 11:05:09 +0100 (CET)
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
X-Inumbo-ID: ffefa7a9-51c4-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tDRmWPYoenWIe1ospZDKOXn6f22HabGgSyG7x1uHVLQ=;
  b=HOTjMiJzZM2RqgBtEvSzKyR2tFY4xmRvrrfc21+QAhJXp9UFthDlnbGX
   dKgBWdfpPm9qB3c2qS6I4S/yjNujs5XNAMKNBJA6wr3SgKvDRPK9nZ/2y
   lerCQo/xPvkBb+yyuiclP/CLszC3QgVTXWZ8SmmoYUQQhl9Qejp/fexhe
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pNoiC8DWjaVXj+ZVau4jBv68Xw8eyiwlnTRDO0KtZp8bMCBworqDPGk0Wr93geebcBw3ElyX0H
 Gh3u06hhYtvos8oDj+SMYFN94rPbRV+JVbscZ4JrHZl787aUG0VGcwDgmOaZQ3LucKcw24GrET
 UDf/I97/w7P999fYaBsltS+7rnqwBy7m5lyBxjZp0S85a7d315mInvHCJfCKl4xDwjoYEy6Nh1
 5SPZMDUrLhA5NWsRucJ9SOXgYnkWNTLjO8pcJ1cG/knlHDjpY73lxCkFwlODePBZ753sMp07x5
 aFqDmo9QxGSIF5cTqqeVAUjT
X-SBRS: 5.1
X-MesageID: 59281588
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qtG/UK+IEdbO4Ug3R/vqDrUDTXmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 TEfCj3QOveKZmSnKdt3b4qy/U9T75eAytQ1TgRvqCA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdi2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgum
 c5zp62KRj0tN72LkcE/VTcBPXBXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0fR6aHO
 ppJAdZpRDPxRF5WYUg3MpgZkvikgymjUgRfml3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0BItLLf8L0g63zqPEpA+8JG4qFxAQQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 yNsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ldB0wa51fJ2W1O
 ic/XD+9ArcIZxNGioctPuqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClIOMAkc5zX5m9vNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:bE+UWKy+d6y3eswqWlWYKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="59281588"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 7/8] x86/boot: Support __ro_after_init
Date: Tue, 30 Nov 2021 10:04:44 +0000
Message-ID: <20211130100445.31156-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211130100445.31156-1-andrew.cooper3@citrix.com>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For security hardening reasons, it advantageous to make setup-once data
immutable after boot.  Borrow __ro_after_init from Linux.

On x86, place .data.ro_after_init at the start of .rodata, excluding it from
the early permission restrictions.  Re-apply RO restrictions to the whole of
.rodata in init_done(), attempting to reform the superpage if possible.

For architectures which don't implement __ro_after_init explicitly, variables
merges into .data.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/setup.c        | 12 +++++++++++-
 xen/arch/x86/xen.lds.S      |  6 ++++++
 xen/include/asm-x86/setup.h |  1 +
 xen/include/xen/cache.h     |  2 ++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8329263430ed..3bbc46f244b9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -663,6 +663,11 @@ static void noreturn init_done(void)
     init_xenheap_pages(__pa(start), __pa(end));
     printk("Freed %lukB init memory\n", (end - start) >> 10);
 
+    /* Mark .rodata/ro_after_init as RO.  Maybe reform the superpage. */
+    modify_xen_mappings((unsigned long)&__2M_rodata_start,
+                        (unsigned long)&__2M_rodata_end,
+                        PAGE_HYPERVISOR_RO);
+
     startup_cpu_idle_loop();
 }
 
@@ -1541,8 +1546,13 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                         (unsigned long)&__2M_text_end,
                         PAGE_HYPERVISOR_RX);
 
+    /* Mark .data.ro_after_init as RW.  Maybe shatters the .rodata superpage. */
+    modify_xen_mappings((unsigned long)&__ro_after_init_start,
+                        (unsigned long)&__ro_after_init_end,
+                        PAGE_HYPERVISOR_RW);
+
     /* Mark .rodata as RO. */
-    modify_xen_mappings((unsigned long)&__2M_rodata_start,
+    modify_xen_mappings((unsigned long)&__ro_after_init_end,
                         (unsigned long)&__2M_rodata_end,
                         PAGE_HYPERVISOR_RO);
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 87e344d4dd97..4db5b404e073 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -97,6 +97,12 @@ SECTIONS
   __2M_rodata_start = .;       /* Start of 2M superpages, mapped RO. */
   DECL_SECTION(.rodata) {
        _srodata = .;
+
+       __ro_after_init_start = .;
+       *(.data.ro_after_init)
+       . = ALIGN(PAGE_SIZE);
+       __ro_after_init_end = .;
+
        /* Bug frames table */
        __start_bug_frames = .;
        *(.bug_frames.0)
diff --git a/xen/include/asm-x86/setup.h b/xen/include/asm-x86/setup.h
index eb9d7b433c13..34edea405f85 100644
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -6,6 +6,7 @@
 
 extern const char __2M_text_start[], __2M_text_end[];
 extern const char __2M_rodata_start[], __2M_rodata_end[];
+extern const char __ro_after_init_start[], __ro_after_init_end[];
 extern char __2M_init_start[], __2M_init_end[];
 extern char __2M_rwdata_start[], __2M_rwdata_end[];
 
diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
index 6ee174efa439..f52a0aedf768 100644
--- a/xen/include/xen/cache.h
+++ b/xen/include/xen/cache.h
@@ -15,4 +15,6 @@
 #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
 #endif
 
+#define __ro_after_init __section(".data.ro_after_init")
+
 #endif /* __LINUX_CACHE_H */
-- 
2.11.0


