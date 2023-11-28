Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB79E7FB69C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642875.1002653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwp-0002Xw-Kp; Tue, 28 Nov 2023 10:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642875.1002653; Tue, 28 Nov 2023 10:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwp-0002RO-HT; Tue, 28 Nov 2023 10:04:07 +0000
Received: by outflank-mailman (input) for mailman id 642875;
 Tue, 28 Nov 2023 10:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uwo-0002NP-3E
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:04:06 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7680d66b-8dd5-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 11:04:05 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-332f90a375eso1759750f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 02:04:05 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 b7-20020adfe307000000b00332fbf7ab21sm6937611wrj.60.2023.11.28.02.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 02:04:03 -0800 (PST)
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
X-Inumbo-ID: 7680d66b-8dd5-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701165844; x=1701770644; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCTCryaDRhdDFZ2oalNsQcOivJksIALZ3Jna08fl7Bk=;
        b=BFbmsOEqRnfiSSmRdJbi4fgJqRYvYw9vGVdy2ZCsQqc6qG2RFQAg2gFkf++R2i+hS+
         CZawD+bWdvidvvRuB0GGZSgQeyfHrxkcthPPYYggXqCDFFqN+YdlXiPM730VfyesN/gy
         zEVFstefYMM8j2KmsPnAaOkg7yDbPCv3FcsJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165844; x=1701770644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCTCryaDRhdDFZ2oalNsQcOivJksIALZ3Jna08fl7Bk=;
        b=wkyi6Y1V/SrYSxiPIU343B43pChi0iphG8urLMFq6uuS0LuUkYV5DbAo4v8O5ehsEc
         2EvC1rMPw4sFSDbK06uK1VHhXWhWtFM8UYQbZvo2ilL10iJkPhTPJ4SeQ25cGDtQLN92
         9PXqOQGBrDMQEoNpHyEzXKtzcuFXy036eW1lkydeya/fJ/v1m6jDg07EGp15+3XaAWCu
         Ab1sKdr7/o3TV5f+D6fVO7YopG0uvMLdxgcO1SyX311UNCTt4fap8M6XZC963mkuot5/
         wydrlvBBVUlPjHSx08e0e2BLsEo2FRu3s3dvZ65pyzB+MG1wDv7OeJIWIb7oQhiYlTDj
         2ZNA==
X-Gm-Message-State: AOJu0YyF8GouLfcjCwDXdYQRqlGBgdw7WdJ9u1A0IVO9pKTg0zSIk9u0
	f/+i2y+hwtWSpUTamX7R6ij5yF9R517sCRF/MCU=
X-Google-Smtp-Source: AGHT+IGQuUtgRkOf070NhCs+mSJ4aFuaA23C1fs1racT0rVWl/ek/z+YCDVIT4AF3eMZAlEaAGqmoA==
X-Received: by 2002:adf:ef4e:0:b0:331:4e5e:d9e7 with SMTP id c14-20020adfef4e000000b003314e5ed9e7mr10106417wrp.34.1701165843982;
        Tue, 28 Nov 2023 02:04:03 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure minimal function size
Date: Tue, 28 Nov 2023 11:03:48 +0100
Message-ID: <20231128100352.35430-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128100352.35430-1-roger.pau@citrix.com>
References: <20231128100352.35430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The minimal function size requirements for livepatch are either 5 bytes (for
jmp) or 9 bytes (for endbr + jmp).  Ensure that functions are always at least
that size by requesting the compiled to align the functions to 8 or 16 bytes,
depending on whether Xen is build with IBT support.

Note that it's possible for the compiler to end up using a higher function
alignment regardless of the passed value, so this change just make sure that
the minimum required for livepatch to work is present.

Since the option (-falign-functions) is supported by both minimal required
compiler versions of clang and gcc there's no need to add a test to check for
its presence.

The alignment is currently only implemented for livepatch on x86, I'm unsure
whether ARM has a mandatory function alignment high enough to cover for the
space required by the replacement instruction(s).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/Kconfig     | 6 ++++++
 xen/arch/x86/Makefile    | 2 ++
 xen/arch/x86/livepatch.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1acdffc51c22..612a4acf079b 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -47,6 +47,12 @@ config HAS_CC_CET_IBT
 	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
 	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
 
+# Set function alignment to ensure enough padding available
+config CC_FUNCTION_ALIGNMENT
+	int
+	default 16 if LIVEPATCH && XEN_IBT
+	default 8 if LIVEPATCH
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f3abdf9cd111..f629157086d0 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -82,6 +82,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
+CFLAGS-$(CONFIG_LIVEPATCH) += -falign-functions=$(CONFIG_CC_FUNCTION_ALIGNMENT)
+
 extra-y += asm-macros.i
 extra-y += xen.lds
 
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index ee539f001b73..4a6ba09e0ec5 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -109,6 +109,10 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
          */
         uint8_t needed = ARCH_PATCH_INSN_SIZE;
 
+        BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE +
+                     (IS_ENABLED(CONIFG_XEN_IBT) ? ENDBR64_LEN : 0) >
+                     CONFIG_CC_FUNCTION_ALIGNMENT);
+
         if ( is_endbr64(func->old_addr) || is_endbr64_poison(func->old_addr) )
             needed += ENDBR64_LEN;
 
-- 
2.43.0


