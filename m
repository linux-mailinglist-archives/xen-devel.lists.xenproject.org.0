Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6349B285
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260080.449186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJaG-00037p-Pf; Tue, 25 Jan 2022 11:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260080.449186; Tue, 25 Jan 2022 11:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJaG-00033W-MH; Tue, 25 Jan 2022 11:01:56 +0000
Received: by outflank-mailman (input) for mailman id 260080;
 Tue, 25 Jan 2022 11:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaE-0006t5-9Y
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 330f2d7b-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:52 +0100 (CET)
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
X-Inumbo-ID: 330f2d7b-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UTtvWGWnsc4Kfk8uqbFvH6lyw4/Lc7jsKNMziS1Unkw=;
  b=Pw4XOPmqNx0g5Tx4JaDBtCEMYxEVxv1j4c9pSiSlGfZsKiX0jNe4Mz/g
   o0TmibnBzItdnhHFxnz/SzCSaNi+xXV5+8yzIpGbNNrJbiejnIpQU/K39
   xhreuSfeuXCWZtz/bZcb6JHPX0jVwBWHtqenzGyBm3OhYCQdVIZxhD+Dr
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fnPv028Dv8hxYFLvrtDw7flu2U67JvA+YF9uzrD8YmhIvPRreOqdNY5nfqPV6gOaM7kGusQTuU
 cZt4fTObB4XtYlCNMNb1PdwDB6oaKqDFkOHli6HAOrDg/U6nHCzSON5Ow0YW7AEc9MGofiLjbl
 CwhQlUj/8KB45ZBsFec4Q3+vRIlBzIct8NyGnzNe+BmTk+DoTdzgn7aC44A7sV960eAIsFhnb5
 zeR2tuDDaHKf8bvsyUaKlqi5+BBusVdzfL5WlW4zSQ0AAPoSkhYheSMsEUzH2fHh/wW67ocrTX
 /Cy0U7Tk7X430j6Kr4nf8h/a
X-SBRS: 5.2
X-MesageID: 64860857
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q3iuzaw5/N4AiDkvpQF6t+c+wCrEfRIJ4+MujC+fZmUNrF6WrkVTy
 WIYXmuDMqvfNjHwfY90YdjkoR9TscWBmNVhTANrrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRk2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+5By
 fUStZWBcCIKGoGLo78tAz9+AggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JweQ66OO
 pVxhTxHcz3GeDREIXUtOb0vg9uE3mf2VThppwfAzUYwyzeKl1EguFT3C/Lfd8aWX8xTkgCdr
 3jf4mXiKhgAMZqUzj/t2kyrgujDjCbqQrU4Hbez9uNpqFCLz2lVAxoTPXOxpvOzm0OlW9ZSL
 kUS0iUrpKk2skesS7HVVBq+pnmGshcCWsF4HOgz6QXLwa3Riy6QAmkfUjdAcpoorsYwTj0x/
 kCFlJXiAjkHmKKRYWKQ8PGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vqzCjvJHNSiY84wzFWWTj5QR8DKa+fJCh41Xf6fdGLa6aQ0OHs
 XxCnNKRhMgMEJWMmSqlUOgLWraz6J643Cb02AA1WcN7rnL0piDlLds4DCxCyFlBDPYFWWDpa
 X7qnCB1yNhoZ0v6S4lmStfkYyg19pTIGdPgX/HSS9NBZJltaQOKlB1TiV6sM3PFyxZ1z/xmU
 XuPWYP1VCtBV/w7pNajb7pFidcWKjYCKXQ/rHwR5zCuyvKgaXGcUt/p23PeP7livMtoTOg4m
 uuz1vdmKT0CCIUSgQGNqOb/yGzmy1BhWfgaTOQMLoa+zvJOQj1JNhMo6epJl3ZZt6pUjPzU2
 Xq2R1VVzlHy7VWed1nRMiwyN+yxDMcnxZ7eAcDKFQz0s5TESd33hJrzirNtJeV3nACd5aAco
 wY5lzWoXa0UF2WvF8U1Zpjhto1yHClHdirVVxdJlAMXJsY6LySQo4eMVlK2qEEmU3Tr3eNj/
 ezI/l6LEPIrGlU5ZO6LOa3H8r9ElSVH8A6EdxGWcoA7lYSF2NUCFhEdedduc5hTck2Sn2XDv
 +tUaD9BzdTwT0YO2IGhrci5Q02BSIOSx2JWQDvW66iYLy7f8jbxyINMSr/QLzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IKnB55GHjrbkiwDu8yKHexwsQS5LZGwaVUuFXqV
 xvXqMVaI7iAJOjsDEUVeFg+du2G2PxNwmvS4P05LV/U/ihy+LbbA0xeMwPV0H5WLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q78hIDpXqhwwnzkB5TabdUiKmsouSb9hsM1UxJ
 mPGjqT1mLkBlFHJdGA+FCaR0LMF14gOoh1D0HQLO0+NxojenvYy0RBcrWY3QwBSwkkV2u5/I
 DE2ZUh8JKHI9DZ0nslTGWurHlgZVhGe/0XwzXoPlXHYEBb0BjCccjVlNLbf5l0d/kJdYiNfr
 eORx2vSWDr3eN38g3kpUkl/pv2/FdF8+2UuQix88xhpy3XiXQfYvw==
IronPort-HdrOrdr: A9a23:GRDRuqvO9fbScbBbzpG153FT7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860857"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v9 17/30] build: add headers path to CFLAGS once for all archs
Date: Tue, 25 Jan 2022 11:00:50 +0000
Message-ID: <20220125110103.3527686-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This just remove duplication.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/Makefile           | 3 +++
 xen/arch/arm/arch.mk   | 3 ---
 xen/arch/riscv/arch.mk | 2 --
 xen/arch/x86/arch.mk   | 2 --
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 6c5c69d2e19b..65b09c20a599 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -312,6 +312,9 @@ CFLAGS += -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
 endif
 
+CFLAGS += -I$(srctree)/include
+CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
+
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
 ALL_OBJS-y                += drivers/built_in.o
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 4e3f7014305e..094b67072304 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,9 +1,6 @@
 ########################################
 # arm-specific definitions
 
-CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
-
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 694ba053ceab..ae8fe9dec730 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,5 +11,3 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
-CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index e39fa15be7e3..8bc0e01ceb2b 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,8 +3,6 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
-CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
 CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
 CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
-- 
Anthony PERARD


