Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E2B45DB5E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231222.400046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzd-0002WU-CG; Thu, 25 Nov 2021 13:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231222.400046; Thu, 25 Nov 2021 13:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzd-0002Ld-4V; Thu, 25 Nov 2021 13:40:53 +0000
Received: by outflank-mailman (input) for mailman id 231222;
 Thu, 25 Nov 2021 13:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEza-0007NX-U2
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ce00f25-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:40:49 +0100 (CET)
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
X-Inumbo-ID: 4ce00f25-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PgvyZbdOc3nlYaOvddtDU/TV6+mitJD45Z6mpY4t0+Y=;
  b=gw5BkUtrm+K1w0LNcY8wZqbOHCdgESfaA6poLkDdclBNxv+5HwxslTsx
   p7+xMLwOBAid3rBrJLXPL0lStab/3eq6g3ATBgUUCwUlzJxTUcD0hjM7l
   +TzBUvw3k9XhBJZ4UCHThvltBy+eOiaXTdbH49lFYTQ9u+z+LvlFf+DUR
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZgxPPqrL9KXwdxCsv/YWw3ZHYfABpvGidD0NkFHjRTeTlbxMZFtGLMYYEPoHYU1CZ52DEfpdV4
 nBP5LUWMLpkCtLxk8AUiYWPGzQlSnHVkbJdJTMJB0BBxqve1vgPKtMnE7HWczIeGqWVQWZicJg
 9qPPMvfbUeosfhY/7/HCSmsoabM73DEoLOdIMhMQDlt0A1vU/EEMxc8pYo3N2K4OEd3tRChI0h
 NZ5W7tIS7eNviWHMhivR0UjOJi7Y/ynZESIfmdLq3zujQUQQbmp1EoR2kkyh0XUzqaneeqPEnJ
 FY06UrZhhw0lyn5/YuiOiSTX
X-SBRS: 5.1
X-MesageID: 60634112
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GQLaNKnIcGGtk3VOCDthRW/o5gx8IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDG2Gbv+KZjH9e4okYYi2pEIDu8TWztNrHFZtqHs3QiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PdmkIOJEQslAvPdoM4FSSFDMzNOHLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ66AP
 JZAMGAHgBLoMzxuKnpUB8kFnuLr1yLxbgZakBWNqv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYdRNh4A+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMnyPz8mdk/gi6RX+5JCLSNlf3nKRDvl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 SBcw6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm81ba7omhezO
 Sc/XD+9A7cJYROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTuyzxd9wfFuY
 8nKGSpJMZr9If45pAdaus9HieN7rszA7T+7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Om
 +uzw/Cikk0FOMWnO3G/2ddKcTgicChqbbir+pc/XrPSfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4Aal2CCcd1zVMisLhXGGdc8XkE/X9BcEZT6As0XPq671hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:XyUJXKtOnV7o0X8IYD5B4SYG7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634112"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 11/47] build: fix enforce unique symbols for recent clang version
Date: Thu, 25 Nov 2021 13:39:30 +0000
Message-ID: <20211125134006.1076646-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
only the filename rather than the full path to the source file.

clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
(in our debian:jessie container) do store the full path to the source
file in the FILE symbol.

This means that we also need to check clang version to figure out
which command we need to use to redefine symbol.

I don't know which version of clang change behavior, we will guess
4.0.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

"enforce unique symbols" works by chance with recent clang version.
The few object built from source in subdir don't pose an issue.

With checking for 4.0 or newer, build may fails with a version of
clang between 4.0 and 6.0.

With checking for 6.0 or newer, no build fails, but maybe that will
happen later with patch "build: build everything from the root dir,
use obj=$subdir" applied.
---

Notes:
    v8:
    - new patch, extracted from "build: build everything from the root dir, use obj=$subdir"

 xen/Rules.mk               | 2 +-
 xen/scripts/Kbuild.include | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 60d1d6c4f583..14b6e7fdd721 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -166,7 +166,7 @@ SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
 quiet_cmd_cc_o_c = CC      $@
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
     cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
-    ifeq ($(CONFIG_CC_IS_CLANG),y)
+    ifeq ($(CONFIG_CC_IS_CLANG)$(call clang-ifversion,-lt,400,y),yy)
         cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
     else
         cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 21030cfcfbc1..b4b77f85d8d5 100644
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


