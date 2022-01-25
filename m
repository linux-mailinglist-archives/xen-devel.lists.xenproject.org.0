Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3453449B280
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260073.449159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZv-0000hp-3D; Tue, 25 Jan 2022 11:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260073.449159; Tue, 25 Jan 2022 11:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZu-0000aH-LN; Tue, 25 Jan 2022 11:01:34 +0000
Received: by outflank-mailman (input) for mailman id 260073;
 Tue, 25 Jan 2022 11:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZs-0006t5-PB
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26246b71-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:31 +0100 (CET)
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
X-Inumbo-ID: 26246b71-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TsXcnBKYbccVmeII/8T5tHLE3sOCUvbLSaaju2n5u0A=;
  b=a2GW1CTlR+dBuuI/Vd31T0+0/AQ44p3fzDiYULtsNMBUONYySY9HEqpg
   XO+ENyZte8QlO10hWb36r+1PWPtrGfILEItmi/ii/R/Zbuj8KYuLyPK1E
   loNzBEuaSdnpLiKvxZ0nxNf2z6UvHvjcY3E/RudBFmreHh9w+H0ge8/Xg
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zZ3H5sbzZ05nXNIp5JqaX6rziwDlaETU/PX2Nve0EbsaGzzRJ/UAewF8tgWWpKV8yB69rlrEdH
 KWwie0BeHWxIvazj0jDQY0vHkD1pzym7sV9DcSQsuv2AZx4PnZtxWSKzbBt74F1bV30A572mJg
 rJ8gSTLmRlr3UPxOpfSOEgZLxs5MEVg8z/meNaCBfAiWrothYqvmyMmh7bCaQDtXYXAMsc5yG+
 WUlkatkvZfhwiOywa8Gtj7l55XMGGhzI+y+mvlYpt6axXiIPvKXT5J9GzMJENKhUhQLcI/7Bzo
 c6d6xsn7uOnd1Er3tzjETIAl
X-SBRS: 5.2
X-MesageID: 64860828
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WJz17a+AXpnmPdaGGK75DrUDfHmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 GofCzyDPfrYazbxLdojao+woUMDuJDVz4cyQVY6+Hw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhKl
 9VqtLKwQD0JBYvnp8UfUQVlAixXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4STaiGN
 5BJAdZpRA//ekYeY15GMsgdhOGOrUHmS2ZjqnvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6FqC89/NsqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmIbKSVWc2LedlxOJHwMqDG0AeRIVQCJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r4tlsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWW0bb1HRcBJG9GRF5iLJ9w4DNZWfx8BDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66INYISM8cuKl7WpEmCgHJ8OUi3zCDAdolkY
 f+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCgPkH/rNBCRXhXfSlTLc2n8KR/K7/cSjeK7Ul8UZc9N5t7Jdw890mU/8+Vl
 kyAtrhwkQqm2iafeFzUMxiOqtrHBP5CkJ7yBgR0VX7A5pTpSd/HAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:V8h3maODYRWuWsBcTv2jsMiBIKoaSvp037BN7TEUdfU1SL38qy
 nApoV56faZslcssRIb9+xoWpPwJk80nKQdieN9AV7LZniBhILCFvAB0WKN+V3d8gTFh5dgPf
 gKScND4afLYmSSJ/yKmDVQaOxN/OW6
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860828"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 08/30] build: fix enforce unique symbols for recent clang version
Date: Tue, 25 Jan 2022 11:00:41 +0000
Message-ID: <20220125110103.3527686-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
only the filename rather than the full path to the source file.

clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
(in our debian:jessie container) do store the full path to the source
file in the FILE symbol.

Also, based on commit 81ecb38b83 ("build: provide option to
disambiguate symbol names"), which were using clang 5, the change of
behavior likely happened in clang 6.0.

This means that we also need to check clang version to figure out
which command we need to use to redefine symbol.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

"enforce unique symbols" works by chance with recent clang version.
The few object built from source in subdir don't pose an issue.
---

Notes:
    v9:
    - checking for clang 6 instead of clang 4, based on 81ecb38b83, and
      update commit message.
    
    v8:
    - new patch, extracted from "build: build everything from the root dir, use obj=$subdir"

 xen/Rules.mk               | 2 +-
 xen/scripts/Kbuild.include | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 60d1d6c4f583..1e7f47a3d8a8 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -166,7 +166,7 @@ SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
 quiet_cmd_cc_o_c = CC      $@
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
     cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
-    ifeq ($(CONFIG_CC_IS_CLANG),y)
+    ifeq ($(CONFIG_CC_IS_CLANG)$(call clang-ifversion,-lt,600,y),yy)
         cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
     else
         cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 73caf238d42c..4875bb28c282 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -59,6 +59,8 @@ ld-option = $(call success,$(LD) -v $(1))
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
 cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
 
+clang-ifversion = $(shell [ $(CONFIG_CLANG_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
+
 # Shorthand for $(MAKE) clean
 # Usage:
 # $(MAKE) $(clean) dir
-- 
Anthony PERARD


