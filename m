Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012181D1693
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 15:56:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYrrz-0007R1-5i; Wed, 13 May 2020 13:56:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYrrx-0007Qp-Iw
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:56:21 +0000
X-Inumbo-ID: 81f0bc89-9521-11ea-a380-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81f0bc89-9521-11ea-a380-12813bfff9fa;
 Wed, 13 May 2020 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589378175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yfsuuBspMmNC3kof03e5m6UQEyNDgBOVgEXM/dKmV24=;
 b=hJy2tvJvOMHdG0iiAU2z6tWCSXW0SIdk3cGuJzWU33eHZsNfwtdJbONd
 dwjoueCo/W7D6g4xpV79cBlHYYrgFFlyAICVNTWHE9GKvfvJ8e/QWOoAZ
 1KOJo6wN7n8rhZXHldDOysF9GNY6G27LkbSFI1g2E/2OTVPWnH6ZswrfT o=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: JRMroCWzhFP36YLcddszmc8gqNxC9Wj3k0V3CzzK2SCMCzz1nBMsO7hP+fg5uNVEBuKl4Alg2z
 i2RefznLFaoW6Xr4iVgjISbV5aH5V6oIJ4IrsmTZ8xicSiX9/b3rfVssdbwhrtoMGEDsvBqD/t
 davD7CETOgkRXPdG8LWQErDbxemRXJA/dpEEyMorf4FZhXn/5jWYVDarhLWqI9QaCUOO/iSG8r
 /NP4kM6jUNYcXmMBf21hOo/7ZoCoMimaNgQA0s+8f3Y4B6RJTsU+u+gPf2ThFzOFmgMvJL3nU2
 5lY=
X-SBRS: 2.7
X-MesageID: 17688176
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="17688176"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/build: move -fno-asynchronous-unwind-tables into
 EMBEDDED_EXTRA_CFLAGS
Date: Wed, 13 May 2020 14:55:51 +0100
Message-ID: <20200513135552.24329-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200513135552.24329-1-andrew.cooper3@citrix.com>
References: <20200513135552.24329-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Users of EMBEDDED_EXTRA_CFLAGS already use -fno-asynchronous-unwind-tables, or
ought to.  This shrinks the size of the rombios 32bit stubs in guest memory.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 Config.mk                            | 2 +-
 tools/tests/x86_emulator/testcase.mk | 2 +-
 xen/arch/x86/arch.mk                 | 2 +-
 xen/arch/x86/boot/build32.mk         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.mk b/Config.mk
index 3621162ae4..b0f16680f3 100644
--- a/Config.mk
+++ b/Config.mk
@@ -204,7 +204,7 @@ APPEND_LDFLAGS += $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 
 EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
-EMBEDDED_EXTRA_CFLAGS += -fno-exceptions
+EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
 
 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
diff --git a/tools/tests/x86_emulator/testcase.mk b/tools/tests/x86_emulator/testcase.mk
index a565d15524..dafeb6caf7 100644
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
-CFLAGS += -fno-builtin -fno-asynchronous-unwind-tables -g0 $($(TESTCASE)-cflags)
+CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags)
 
 .PHONY: all
 all: $(TESTCASE).bin
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 2a51553edb..62b7c97007 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -56,7 +56,7 @@ $(call as-option-add,CFLAGS,CC,\
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
-CFLAGS += -mno-red-zone -fpic -fno-asynchronous-unwind-tables
+CFLAGS += -mno-red-zone -fpic
 
 # Xen doesn't use SSE interally.  If the compiler supports it, also skip the
 # SSE setup for variadic function calls.
diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
index 48c7407c00..5851ebff5f 100644
--- a/xen/arch/x86/boot/build32.mk
+++ b/xen/arch/x86/boot/build32.mk
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/Config.mk
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
-CFLAGS += -Werror -fno-asynchronous-unwind-tables -fno-builtin -g0 -msoft-float
+CFLAGS += -Werror -fno-builtin -g0 -msoft-float
 CFLAGS += -I$(XEN_ROOT)/xen/include
 CFLAGS := $(filter-out -flto,$(CFLAGS)) 
 
-- 
2.11.0


