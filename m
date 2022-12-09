Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86587648ABF
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 23:26:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458315.716223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lol-0004Ri-H4; Fri, 09 Dec 2022 22:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458315.716223; Fri, 09 Dec 2022 22:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lol-0004Pg-Dg; Fri, 09 Dec 2022 22:26:07 +0000
Received: by outflank-mailman (input) for mailman id 458315;
 Fri, 09 Dec 2022 22:26:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAZn=4H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p3loj-0004Pa-GM
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 22:26:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c1dac8-7810-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 23:26:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AE806235F;
 Fri,  9 Dec 2022 22:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CE6C433D2;
 Fri,  9 Dec 2022 22:25:59 +0000 (UTC)
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
X-Inumbo-ID: 76c1dac8-7810-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670624761;
	bh=Cy/cEwU8tKy+Z8VSGYn/Z8dnVOdEpC8SjqUidsTDLN8=;
	h=From:To:Cc:Subject:Date:From;
	b=ixmxKJaWzcQuDkw85v447u3lGQbF5wPuXeN8fWfUsPRDyjht5foAdGTI1nv0Yj7td
	 CMXrdKwX7tacu6ulm8IU7aaNE+Rui0SIMjiMTB4/ZCVzKn4Wew+tao7ZyBw9C1S91s
	 vYbvcJuDtm1Xt5JSMvajv+qT0OP8RgbL/6Vch+XU6LAL2irpOKqeJgdcSd6eFTAGJX
	 KDlnWAsJvQOG5dIWeDWWxril0Dp2vFWIZsWIk1sNSsUkf5XKJL39zKv3rhCZFEBdiW
	 7rJ9JkW+ETO/Qe4BulkH0rTvk2m4tVp2i0VZPHeiCNCMjo4ttTgR6P7VOSuHIZ/pjU
	 di8/demelTfTg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org,
	bertrand.marquis@arm.com
Cc: sstabellini@kernel.org,
	Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] xen/arm: efi-boot misra rule 4.1 fix
Date: Fri,  9 Dec 2022 14:25:52 -0800
Message-Id: <20221209222552.3353993-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have 3 violations of MISRA C Rule 4.1 ("Octal and hexadecimal escape
sequences shall be terminated") in xen/arch/arm/efi/efi-boot.h. Fix them
and take the opportunity to declare them as static const __initconst and
improve the style.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- add static const __initconst
- add blank newline for style
---
 xen/arch/arm/efi/efi-boot.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 43a836c3a7..223db0c4da 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -542,7 +542,9 @@ static void __init efi_arch_handle_module(const struct file *file,
 
     if ( file == &ramdisk )
     {
-        char ramdisk_compat[] = "multiboot,ramdisk\0multiboot,module";
+        static const char __initconst ramdisk_compat[] = "multiboot,ramdisk\0"
+                                                         "multiboot,module";
+
         node = fdt_add_subnode(fdt, chosen, "ramdisk");
         if ( node < 0 )
             blexit(L"Unable to add ramdisk FDT node.");
@@ -555,7 +557,9 @@ static void __init efi_arch_handle_module(const struct file *file,
     }
     else if ( file == &xsm )
     {
-        char xsm_compat[] = "xen,xsm-policy\0multiboot,module";
+        static const char __initconst xsm_compat[] = "xen,xsm-policy\0"
+                                                     "multiboot,module";
+
         node = fdt_add_subnode(fdt, chosen, "xsm");
         if ( node < 0 )
             blexit(L"Unable to add xsm FDT node.");
@@ -568,7 +572,9 @@ static void __init efi_arch_handle_module(const struct file *file,
     }
     else if ( file == &kernel )
     {
-        char kernel_compat[] = "multiboot,kernel\0multiboot,module";
+        static const char __initconst kernel_compat[] = "multiboot,kernel\0"
+                                                        "multiboot,module";
+
         node = fdt_add_subnode(fdt, chosen, "kernel");
         if ( node < 0 )
             blexit(L"Unable to add dom0 FDT node.");
-- 
2.25.1


