Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA663647AE1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 01:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457511.715438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3RSU-0007BW-B7; Fri, 09 Dec 2022 00:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457511.715438; Fri, 09 Dec 2022 00:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3RSU-00078g-7l; Fri, 09 Dec 2022 00:41:46 +0000
Received: by outflank-mailman (input) for mailman id 457511;
 Fri, 09 Dec 2022 00:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAZn=4H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p3RST-00078a-07
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 00:41:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40580e27-775a-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 01:41:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44AFD620B8;
 Fri,  9 Dec 2022 00:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE7AC433EF;
 Fri,  9 Dec 2022 00:41:40 +0000 (UTC)
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
X-Inumbo-ID: 40580e27-775a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670546501;
	bh=UalrQTlD0FA6AK7t2SGUWE8haxP/419RHD7N/pGGdvg=;
	h=Date:From:To:cc:Subject:From;
	b=p1DMQKJUcWT7bZvPV2mt8bZ+ToT0+U8daAIUO/YcNZeuSFweC78sD32qMmGU5OI+s
	 fC0bj8vwyb32jeNS+0CJvHNrf3rOskw2HTS1tfZyPDfWd3inpI9e1jw5tiaF6PMriN
	 Nhx+gyFuQUXg11F5xzjqycNjghNmA2k5QvItps/tlVkgkaJ13rzZS6Uq2g4+KB0m69
	 RTTpY1Cug/h3LV/FCDZy/COfzpTXT1kq7miq8vijnPjOXVFZ+MoxPur44l7eKoFxfa
	 wfaBwX10Ou4et59iYMwQWlo2ek1OtrZ5W2irfyxbwZWZOlyxbJTnhYejJRR3au3Q4N
	 ykQ+Vr/KffiTg==
Date: Thu, 8 Dec 2022 16:41:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: julien@xen.org, bertrand.marquis@arm.com
cc: sstabellini@kernel.org, Volodymyr_Babchuk@epam.com, 
    xen-devel@lists.xenproject.org
Subject: [PATCH] xen/arm: efi-boot misra rule 4.1 fix
Message-ID: <alpine.DEB.2.22.394.2212081538310.2965472@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

We have 3 violations of MISRA C Rule 4.1 ("Octal and hexadecimal escape
sequences shall be terminated") in xen/arch/arm/efi/efi-boot.h. Fix
them.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 43a836c3a7..822c0a1462 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -542,7 +542,7 @@ static void __init efi_arch_handle_module(const struct file *file,
 
     if ( file == &ramdisk )
     {
-        char ramdisk_compat[] = "multiboot,ramdisk\0multiboot,module";
+        char ramdisk_compat[] = "multiboot,ramdisk\0" "multiboot,module";
         node = fdt_add_subnode(fdt, chosen, "ramdisk");
         if ( node < 0 )
             blexit(L"Unable to add ramdisk FDT node.");
@@ -555,7 +555,7 @@ static void __init efi_arch_handle_module(const struct file *file,
     }
     else if ( file == &xsm )
     {
-        char xsm_compat[] = "xen,xsm-policy\0multiboot,module";
+        char xsm_compat[] = "xen,xsm-policy\0" "multiboot,module";
         node = fdt_add_subnode(fdt, chosen, "xsm");
         if ( node < 0 )
             blexit(L"Unable to add xsm FDT node.");
@@ -568,7 +568,7 @@ static void __init efi_arch_handle_module(const struct file *file,
     }
     else if ( file == &kernel )
     {
-        char kernel_compat[] = "multiboot,kernel\0multiboot,module";
+        char kernel_compat[] = "multiboot,kernel\0" "multiboot,module";
         node = fdt_add_subnode(fdt, chosen, "kernel");
         if ( node < 0 )
             blexit(L"Unable to add dom0 FDT node.");

