Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD005A7E499
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940461.1340226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oVG-0008Ee-VL; Mon, 07 Apr 2025 15:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940461.1340226; Mon, 07 Apr 2025 15:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oVG-0008Bz-Sl; Mon, 07 Apr 2025 15:35:14 +0000
Received: by outflank-mailman (input) for mailman id 940461;
 Mon, 07 Apr 2025 15:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1oVF-0008Ad-OD
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:35:13 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e55db4de-13c5-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 17:35:12 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2450586f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 08:35:12 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b760bsm12497082f8f.55.2025.04.07.08.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:35:11 -0700 (PDT)
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
X-Inumbo-ID: e55db4de-13c5-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744040112; x=1744644912; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lOSnfH6jnpRJxIMHKnMmnOK0Srqm7H7qqh801FjeR24=;
        b=uMvce9sGY7odMnt+YML5/MrAqFZI+HZjoh1RVyRxkGLXpNlSGNSLFCmgkLqVyg/Nrb
         3rUldlogdYLd3S5UDyxT9j+2r6+7s+9JUlFjIUgU1hf8YrOH7CNXcT+H9pkIXYJdZUis
         T9guNmNwxds3fKSl9dt/AAqVulQjNhdyCitVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744040112; x=1744644912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOSnfH6jnpRJxIMHKnMmnOK0Srqm7H7qqh801FjeR24=;
        b=l8mntx5GV78dXug1WocM4/3RtQDIC95lQV+mLMqIpc9mYjdZa2huA8Hrg9e8dsfqK1
         76Q5gU2WNo58ObBK5I66Y/8ty3l8oFZNTD2NUWHSXntlsuMVMLWiykATanBH0J0zmDnL
         2S1fq1nybyRpg9gpW+MgTDsRpTcz/XNzxeLcqLKWje5dxTx4rHeJRZHOiuEkGaYx5h0U
         bRR+sAj6mpl+7moQnvGwBNwBAaKmxe2PqE3oelvd2gj9ivPKjPuyXA3342LWnpTWZ+1B
         xqoJ9DqUxvuV4Th1BaZzHVecdSLwuJPrqqFByOFhqFsyfIljT4CNVKCYp2lDafMFlCnu
         n04A==
X-Gm-Message-State: AOJu0YxVVB+qN/51+kdcKWcXm+4rERcdoN1u2It3+eAGBnnkt3pf8x2V
	9ubrU320hlv2FHeDJ9B5VZjqu4+eCTVcrBXOzmBkWvr/adGfirkxwmmB9ji/TU4ztwe2P6Wfyru
	Unh0=
X-Gm-Gg: ASbGncuHjh9qqa2ezQ2cPOYMTjjWgmki7sFZ2t87uTUDkM8WPdjHWXU5EU63vA6xTBx
	8cZHAgElZGF8/48DDmWAlO+vfJhSLBN3C3bb8osZU/ke64FMuZppMoh5mguJxA7ToMRWfp76d/z
	ghTYikwZ4f+pjTljBpPNjGhgy2CRLwaaSQWaJShY3yI+kxHY9zR6sa9ZQMi5HWsy8dCs03hJ+ZE
	FniRwmlqPqYZkO1WCT4mF/wwU/CD1I61IceJNUVf1247OCZHukr4+RKPhNS2yxnyq9bI5MnSXnk
	SS9OAIZ3o8ssqeimdM5wNq73XXA1GXcn5d8ypsFiNYxivg4keIp3N4Nhwhq+yBsM2fazgpAirGE
	kt6NE2H3qR1SQnOo3ncZzje+nlRW9
X-Google-Smtp-Source: AGHT+IHQtgBFapJRgLoE/iktSa6bJseOjVn8WzeXFufPfiHRT7Y4CXbB7uUNHy5nCwPrGOQhl+bfEg==
X-Received: by 2002:a05:6000:1acb:b0:391:3028:c779 with SMTP id ffacd0b85a97d-39cba933284mr11170879f8f.45.1744040111950;
        Mon, 07 Apr 2025 08:35:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/AMD: Convert rdmsr_amd_safe() to use asm goto()
Date: Mon,  7 Apr 2025 16:35:10 +0100
Message-Id: <20250407153510.1863243-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Unlike the WRMSR side, we can't use asm goto() unconditionally, because our
toolchain baseline doesn't support asm goto with outputs.

Detect support, and use asm goto() when available.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Condensing these two to a single Kconfig symbol is prohibitively difficult.

Also, there's a different errata workaround we'll need if we want to use asm
goto() with "+" constraints:

config CC_HAS_ASM_GOTO_TIED_OUTPUT
	depends on CC_HAS_ASM_GOTO_OUTPUT
	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)

I'm tempted to put it in straight away, lest we forget about it.
---
 xen/Kconfig            | 14 ++++++++++++++
 xen/arch/x86/cpu/amd.c | 13 +++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index 2128f0ccfc0b..a367337cafa5 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -41,6 +41,20 @@ config CC_SPLIT_SECTIONS
 config CC_HAS_UBSAN
 	def_bool $(cc-option,-fsanitize=undefined)
 
+# Fixed in GCC 14, 13.3, 12.4 and 11.5
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
+config GCC_ASM_GOTO_OUTPUT_BROKEN
+	bool
+	depends on CC_IS_GCC
+	default y if GCC_VERSION < 110500
+	default y if GCC_VERSION >= 120000 && GCC_VERSION < 120400
+	default y if GCC_VERSION >= 130000 && GCC_VERSION < 130300
+
+config CC_HAS_ASM_GOTO_OUTPUT
+	def_bool y
+	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
+	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
+
 # Set code alignment.
 #
 # Allow setting on a boolean basis, and then convert such selection to an
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ce4e1df71064..37d67dd15c89 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -59,6 +59,18 @@ static bool __read_mostly fam17_c6_disabled;
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
 {
+#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
+    asm goto ( "1: rdmsr\n\t"
+               _ASM_EXTABLE(1b, %l[fault])
+               : "=a" (*lo), "=d" (*hi)
+               : "c" (msr), "D" (0x9c5a203a)
+               :
+               : fault );
+    return 0;
+
+ fault:
+    return -EFAULT;
+#else
 	int err;
 
 	asm volatile("1: rdmsr\n2:\n"
@@ -71,6 +83,7 @@ static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 		     : "c" (msr), "D" (0x9c5a203a), "2" (0), "i" (-EFAULT));
 
 	return err;
+#endif
 }
 
 static inline int wrmsr_amd_safe(unsigned int msr, unsigned int lo,

base-commit: a235f856e4bbd270b085590e1f5fc9599234dcdf
prerequisite-patch-id: 2874d23382cbbc2ec8eaad596b6f49f14b990b8a
prerequisite-patch-id: fdc7cdec843e4d24fc64006c977fa83a55d98910
-- 
2.39.5


