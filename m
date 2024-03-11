Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD26878989
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 21:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691576.1077683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjmMI-0001ra-TJ; Mon, 11 Mar 2024 20:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691576.1077683; Mon, 11 Mar 2024 20:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjmMI-0001p2-Qg; Mon, 11 Mar 2024 20:34:54 +0000
Received: by outflank-mailman (input) for mailman id 691576;
 Mon, 11 Mar 2024 20:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jdo/=KR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rjmMG-0001ow-SA
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 20:34:53 +0000
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com
 [103.168.172.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce29361c-dfe6-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 21:34:50 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id 81CDC13800E3;
 Mon, 11 Mar 2024 16:34:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 11 Mar 2024 16:34:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Mar 2024 16:34:46 -0400 (EDT)
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
X-Inumbo-ID: ce29361c-dfe6-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1710189288; x=1710275688; bh=74vwePx3WEhU7l3h5g3gLZcoeZX9foYd
	q3QjMD24POI=; b=IYNsRgZMyfs9CcAFDynyjopk3xmKUTNOCVCOngFy7ToliwTN
	ZqSeAkl7X4+zrRlbPVn7HW5wKB8O8KRCq6fCu/hadTXPxwSqXRFZVo5t+IQoRfe9
	/RC+eUJWKni0Ukx3Pc79K/R/e27QE9JzraYrgSn0Yc96KML7jDxUZiE4BDPtLtj9
	HX/0j4ak2dTiTRXHDmcmWNC6+z4KWuXDEDg0s4h4XT6sb3MxrFBv4mUMzO3uvds2
	YIyi/P0C1cxrWbiy+MGF9DvGnhRYXOAHFWCMTVIa/rQ6ye8uLujumqCXK7KikVIj
	JHY2tU9mNXSYladL2I/YRmaf2hPwQdd01CAn4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1710189288; x=1710275688; bh=74vwePx3WEhU7
	l3h5g3gLZcoeZX9foYdq3QjMD24POI=; b=f7xSKMhDmdqFJMouWsnPOCVTUDcGM
	E2bJ3+GEkHCf43sL5GndPTuB6tEtg6ewr0ksNe8mhtPNRDbJxtJlzXumiN2QvdbB
	qv+GRrnW5BaWUFGqHJfUxGIa80jj29zxNuZsL4Vz3qM20K18t53aVll+1rh6zK0o
	rgRnA9nkdmo01BHy7Sy17R8mtGg9ry+wsdqi2CagNEKDcyGtMH1Dc83sPyXVjYHQ
	T68tcbXzuBI/a9GvMDSZf+fMWi0ZyNyhca/axC/RRo7II53X1YTDLFbz93/1C5ws
	2ZXaSm7Z+yyaul3hBGBwDMp+2PLODs3QAvXTYbLJTdkugezr0Ie28XvbQ==
X-ME-Sender: <xms:6GrvZQ18Ckpzq37wmwDHJpJrMlm07aSDDzP1FUqvHx2zHBI3MDW0NQ>
    <xme:6GrvZbGb3Nu_It7KSG1Yqv_yfEQTsi9qefBFuOtlvGr8-vN9qTYvaxfrO_au-4vuT
    pH1v8lwtpk_UA>
X-ME-Received: <xmr:6GrvZY6oW8257cPoZUWXGl1xN0kLQdvoChXcfWLdF4wbM7SE2w90lk-3Q9HCPAWBwTK8dhnkjPTI1To7k6vLQkcTmQKnWlOojleQHTSlcBp0w7J8Yo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedugddufeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:6GrvZZ3EQZVd0a25ltN5E0jlWrzxm8-LR-Br2zIMiYzN2CmUkW52jw>
    <xmx:6GrvZTGJpUaaqZSY6NnImM5sotA_1sXJNKpo3Ei61su2ppyBSVJOMA>
    <xmx:6GrvZS8M0EXBWJbqW9hUpSyKOvc5oL-IIoqmS_rklmC8RiJQ1rv5Qg>
    <xmx:6GrvZZbQnbM01FP2fyz6A_lbm2flU0UBZtVpmDdGXY9hvdSZc8IyqQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory map
Date: Mon, 11 Mar 2024 21:33:11 +0100
Message-ID: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IOMMU driver checks if RMRR/IVMD are marked as reserved in memory
map. This should be true for addresses coming from the firmware, but
when extra pages used by Xen itself are included in the mapping, those
are taken from usable RAM used. Mark those pages as reserved too.

Not marking the pages as reserved didn't caused issues before due to
another a bug in IOMMU driver code, that was fixed in 83afa3135830
("amd-vi: fix IVMD memory type checks").

Failing to reserve memory will lead to panic in IOMMU setup code. And
not including the page in IOMMU mapping will lead to broken console (on
due to IOMMU faults). Handling failure with panic() isn't the most user
friendly thing, but at this stage the alternative would require undoing
a lot of console init. Since the user can do it much easier - by simply
not enabling xhci console next time, say that and panic.

Fixes: 3a1a7b809ffa "drivers/char: mark DMA buffers as reserved for the XHCI"
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
As an alternative implementation I have considered changing
iommu_get_extra_reserved_device_memory() to modify memory map. But that
may hide (or cause) some other issues when this API will gain some more
users in the future.

The reserve_e820_ram() is x86-specific. Is there some equivalent API for
ARM, or maybe even some abstract one? That said, I have no way to test
XHCI console on ARM, I don't know if such hardware even exists...
---
 xen/arch/x86/setup.c        |  3 +++
 xen/drivers/char/xhci-dbc.c | 22 ++++++++++++++++++++++
 xen/include/xen/serial.h    |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a21984b1ccd8..8ab89b3710ed 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1806,6 +1806,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     mmio_ro_ranges = rangeset_new(NULL, "r/o mmio ranges",
                                   RANGESETF_prettyprint_hex);
 
+    /* Needs to happen after E820 processing but before IOMMU init */
+    xhci_dbc_uart_reserve_ram();
+
     xsm_multiboot_init(module_map, mbi);
 
     /*
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 3bf389be7d0b..e31f3cba7838 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -31,6 +31,9 @@
 #include <asm/io.h>
 #include <asm/string.h>
 #include <asm/system.h>
+#ifdef CONFIG_X86
+#include <asm/e820.h>
+#endif
 
 /* uncomment to have dbc_uart_dump() debug function */
 /* #define DBC_DEBUG 1 */
@@ -1426,6 +1429,25 @@ void __init xhci_dbc_uart_init(void)
     }
 }
 
+void __init xhci_dbc_uart_reserve_ram(void)
+{
+    struct dbc *dbc = &dbc_uart.dbc;
+
+    if ( !dbc->enable )
+        return;
+
+#ifdef CONFIG_X86
+    if ( !reserve_e820_ram(
+            &e820,
+            virt_to_maddr(&dbc_dma_bufs),
+            virt_to_maddr(&dbc_dma_bufs) + sizeof(dbc_dma_bufs) - 1) )
+        panic("Failed to reserve XHCI DMA buffers (%"PRIx64"-%"PRIx64"), "
+              "disable xhci console to work around\n",
+              virt_to_maddr(&dbc_dma_bufs),
+              virt_to_maddr(&dbc_dma_bufs) + sizeof(dbc_dma_bufs) - 1);
+#endif
+}
+
 #ifdef DBC_DEBUG
 static void dbc_dump(struct dbc *dbc)
 {
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 3d21207a3d7a..bb48eb8e8bd9 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -162,8 +162,10 @@ void ns16550_init(int index, struct ns16550_defaults *defaults);
 void ehci_dbgp_init(void);
 #ifdef CONFIG_XHCI
 void xhci_dbc_uart_init(void);
+void xhci_dbc_uart_reserve_ram(void);
 #else
 static void inline xhci_dbc_uart_init(void) {}
+static void inline xhci_dbc_uart_reserve_ram(void) {}
 #endif
 
 void arm_uart_init(void);
-- 
2.43.0


