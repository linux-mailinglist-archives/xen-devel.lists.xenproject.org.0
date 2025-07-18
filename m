Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA53B0A3DF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 14:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048620.1418817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjvp-0004Tu-5t; Fri, 18 Jul 2025 12:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048620.1418817; Fri, 18 Jul 2025 12:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucjvp-0004Rz-3K; Fri, 18 Jul 2025 12:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1048620;
 Fri, 18 Jul 2025 12:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ry9=Z7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ucjvn-0004Rq-UT
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 12:11:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c636212-63d0-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 14:11:13 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45600581226so21059875e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 05:11:13 -0700 (PDT)
Received: from localhost.localdomain (146.225.6.51.dyn.plus.net.
 [51.6.225.146]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2d4fsm79456135e9.4.2025.07.18.05.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 05:11:12 -0700 (PDT)
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
X-Inumbo-ID: 4c636212-63d0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1752840673; x=1753445473; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=su1dCWXQqLQxV366md38J6qCHVR0RJFqfdadrIiCgaA=;
        b=QbdUo8YvUzyOLScdu46ufPFywTjq2F2JoKnS2Vh1jHaavt4X9frC0OI+7+HyOsjOBq
         s4fEkNzxsAGFbKYC70NxpaGphqvk9JC65wxmmy916R2Xz/Hkt4qV08Gd0KMoxPACz25V
         BD7nD9/iIoJMBBpmnFuortTf26Zfv/p/LX/k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752840673; x=1753445473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=su1dCWXQqLQxV366md38J6qCHVR0RJFqfdadrIiCgaA=;
        b=QPsBzDwjCiQtkPYKEHqwJqZscY8LXr7Ui5BhvytWPq2qdXS2rqeLpJeDigSXlwvV5q
         vucQ2TxAHE7BmaBfaw57Pqoyh65i/W2qxe1mFZ5Zn9g2uJQPEpu326H9kJkKu26WXUNl
         FyBhd/Z++/d2cIK0e5M1+CI7U0/F0x1dq09eCjvsRh+4MnlLcxGF6V+2odI7Og9jLUQE
         zwPmyvr8iVphW+BlXow09IBQEgHJp/xXfCtCh57bh4MPnT2TYD0nPTgC/mKuhMyQ0AOw
         CiTUM0ayQc2mHnh6JvF8igGGkMfgfTU1l4WLfg3EBZswfxSISJZcdphe2Rgav2NQ6xvf
         4UhQ==
X-Gm-Message-State: AOJu0Yx5G9HxTSbxdTuz/4Hl2xFebe1TXsaAplIcmSJSFWGv9rBKoiit
	Kl6MFFpL2K1fVDnm1l+iWka4DVF0hEaFLmLyarwFg7yQft5MnxOaTX1rBSgCK5gTRKrILE4+Jy+
	ffAgA
X-Gm-Gg: ASbGncvvrG2Bt8MbYidXvSdZBQaQQrz3KO2oooYdeu1cpb3izHogNxeq0PNw9oe178C
	aob4eg22u9BEVl6daA1XvPq4UXXDLtns5ZZ7fYj8jtK/o69+e0bFgSpGP4D9h5YMENoMvceBgVn
	rY3hbih//3FNKm5pULWQ/MGsX/ggt2qvxIRlR22edpg8jnXP0cuu1x0noMwHKo8kRFp/t4T6Xdq
	etsl5KJof/DTegL+z8OghN/ppRTZFHDnvw1K8WNlrZZy619zDlazPxyvU9vLw+iAPR4V4/am5e8
	lZTSkM3m6a/PLi7LdYTYJEQ/pknLDfDdz3Sy9rNAyEJY3Gw+luq76U90UYCCun+LR5fw3BhA6iz
	C8mSTjfYqwMr3cXxlvj4VPhZ/heXZPxogvlVkDW+8rB05sWX+ckO+NbKkSQT7PNPaAw==
X-Google-Smtp-Source: AGHT+IF2aAvVZ7rs5KvllYUScGozgM6qI9hT+1d1EIfajHghi/onj1T+MnrZdbFahUD2CY/pF1tD8Q==
X-Received: by 2002:a05:600c:3b86:b0:456:fd4:5322 with SMTP id 5b1f17b1804b1-4562e04538bmr107328895e9.11.1752840672675;
        Fri, 18 Jul 2025 05:11:12 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2] xen/efi: Remove PrintMessage function
Date: Fri, 18 Jul 2025 13:11:03 +0100
Message-ID: <20250718121106.34915-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is similar to PrintStr with an implicit newline
added to the string.
In Xen this is not a common pattern and this is used in EFI
ARM code only making it not much coherent with X86 code
so use PrintStr directly to make the code more coherent.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- reuse PrintStr instead of reusing PrintMessage.
---
 xen/arch/arm/efi/efi-boot.h | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 7dd2528a17..e469245e5b 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -48,7 +48,6 @@ void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
 void __flush_dcache_area(const void *vaddr, unsigned long size);
 
 static int get_module_file_index(const char *name, unsigned int name_len);
-static void PrintMessage(const CHAR16 *s);
 
 #define DEVICE_TREE_GUID \
 {0xb1b621d5U, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0}}
@@ -490,7 +489,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *cmdline_options,
 
     if ( cfgfile_options )
     {
-        PrintMessage(L"Using bootargs from Xen configuration file.");
+        PrintStr(L"Using bootargs from Xen configuration file.\r\n");
         prop_len += snprintf(buf + prop_len,
                                EFI_PAGE_SIZE - prop_len, " %s", cfgfile_options);
         if ( prop_len >= EFI_PAGE_SIZE )
@@ -503,7 +502,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *cmdline_options,
                                                    "xen,xen-bootargs", NULL);
         if ( dt_bootargs_prop )
         {
-            PrintMessage(L"Using bootargs from device tree.");
+            PrintStr(L"Using bootargs from device tree.\r\n");
             prop_len += snprintf(buf + prop_len, EFI_PAGE_SIZE - prop_len,
                                  " %s", dt_bootargs_prop);
             if ( prop_len >= EFI_PAGE_SIZE )
@@ -634,12 +633,6 @@ static int __init get_module_file_index(const char *name,
     return ret;
 }
 
-static void __init PrintMessage(const CHAR16 *s)
-{
-    PrintStr(s);
-    PrintStr(newline);
-}
-
 /*
  * This function allocates a binary and keeps track of its name, it returns the
  * index of the file in the modules array or a negative number on error.
@@ -661,7 +654,7 @@ static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_image,
      */
     if ( !modules_available )
     {
-        PrintMessage(L"No space left for modules");
+        PrintStr(L"No space left for modules\r\n");
         return ERROR_ALLOC_MODULE_NO_SPACE;
     }
 
@@ -674,7 +667,7 @@ static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_image,
     if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(char),
                               (void**)&file_info->name) != EFI_SUCCESS )
     {
-        PrintMessage(L"Error allocating memory for module binary name");
+        PrintStr(L"Error allocating memory for module binary name\r\n");
         return ERROR_ALLOC_MODULE_NAME;
     }
 
@@ -754,14 +747,14 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
     /* Rename the module to be module@{address} */
     if ( fdt_set_name(fdt_efi, module_node_offset, mod_string) < 0 )
     {
-        PrintMessage(L"Unable to modify module node name.");
+        PrintStr(L"Unable to modify module node name.\r\n");
         return ERROR_RENAME_MODULE_NAME;
     }
 
     if ( fdt_set_reg(fdt_efi, module_node_offset, reg_addr_cells, reg_size_cells,
                      file->addr, file->size) < 0 )
     {
-        PrintMessage(L"Unable to set module reg property.");
+        PrintStr(L"Unable to set module reg property.\r\n");
         return ERROR_SET_REG_PROPERTY;
     }
 
@@ -777,7 +770,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
             */
             if ( kernel.addr )
             {
-                PrintMessage(L"Dom0 kernel already found in cfg file.");
+                PrintStr(L"Dom0 kernel already found in cfg file.\r\n");
                 return ERROR_DOM0_ALREADY_FOUND;
             }
             kernel.need_to_free = false; /* Freed using the module array */
@@ -788,14 +781,14 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
                   (fdt_node_check_compatible(fdt_efi, module_node_offset,
                                              "multiboot,ramdisk") == 0) )
         {
-            PrintMessage(L"Dom0 ramdisk already found in cfg file.");
+            PrintStr(L"Dom0 ramdisk already found in cfg file.\r\n");
             return ERROR_DOM0_RAMDISK_FOUND;
         }
         else if ( xsm.addr &&
                   (fdt_node_check_compatible(fdt_efi, module_node_offset,
                                              "xen,xsm-policy") == 0) )
         {
-            PrintMessage(L"XSM policy already found in cfg file.");
+            PrintStr(L"XSM policy already found in cfg file.\r\n");
             return ERROR_XSM_ALREADY_FOUND;
         }
     }
@@ -821,7 +814,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
     prop = fdt_get_property(fdt_efi, domain_node, "#address-cells", &len);
     if ( !prop )
     {
-        PrintMessage(L"#address-cells not found in domain node.");
+        PrintStr(L"#address-cells not found in domain node.\r\n");
         return ERROR_MISSING_DT_PROPERTY;
     }
 
@@ -830,7 +823,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
     prop = fdt_get_property(fdt_efi, domain_node, "#size-cells", &len);
     if ( !prop )
     {
-        PrintMessage(L"#size-cells not found in domain node.");
+        PrintStr(L"#size-cells not found in domain node.\r\n");
         return ERROR_MISSING_DT_PROPERTY;
     }
 
@@ -868,7 +861,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
     chosen = setup_chosen_node(fdt_efi, &addr_len, &size_len);
     if ( chosen < 0 )
     {
-        PrintMessage(L"Unable to setup chosen node");
+        PrintStr(L"Unable to setup chosen node\r\n");
         return ERROR_DT_CHOSEN_NODE;
     }
 
-- 
2.43.0


