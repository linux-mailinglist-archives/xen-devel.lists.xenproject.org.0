Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7949B277
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260063.449098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZe-0006we-26; Tue, 25 Jan 2022 11:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260063.449098; Tue, 25 Jan 2022 11:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZd-0006tc-Uf; Tue, 25 Jan 2022 11:01:17 +0000
Received: by outflank-mailman (input) for mailman id 260063;
 Tue, 25 Jan 2022 11:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZc-0006Mn-Bk
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d3f8ca3-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:15 +0100 (CET)
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
X-Inumbo-ID: 1d3f8ca3-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BQQxaNtHjaB4s6bgGMTJeDKh5VP55qhth25rnaVHdt0=;
  b=cmywaDTfABhODL640CkRt5caCjUW+M80rvkmWg60/PnT6Kc4wP6Uan/G
   b8VuV+BBGb0CxaGS+ZrDqpmj6AEhVYFyYiw4pDtSKgNYnE9ptD6kT5YXP
   0a1c9UTsnyTaZ9tS4Tt1C7nB/tjDP6n7LfSRZsmymxY3Q/VzGPht/D91G
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8/DHCZfW3/eg9CITvGhUnWHCu+UduepdIVTdNZn3/v0TMv4v4d80Db34jfX73NQcvN5rLzmF71
 C3R6+YoLbdTT9eIaFlpx2O3gcUlpr/jbfu/THwIHisT9e2lyO++tlrgT9d7rh5k6KLF9pegczS
 kWLB7VDkRfiCb+x2CUK0McJDS8BZHd2GSh8m+oe/P7nyN8psjEdQuWbJT69koxILgwqkc9MJ2b
 DMw4W+UESyfBGBoj6xNbkyfYZrG8g2WcpHhUXtmZHUW4ARTbtkWmUBjFhoo2sCC89jXheSRssC
 9Cx60K3IihD5MpOKC6d9/CBu
X-SBRS: 5.2
X-MesageID: 62618912
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ArZRgq3WKoxh/TFYs/bD5Qd2kn2cJEfYwER7XKvMYLTBsI5bp2ACn
 2YbWT+DM/qCZWb2KN9xb4Ti80NXvseEzYRnHFQ9pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbNh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqh2M50x
 /hLlpyMaQY4YJHHlegMTwMJKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3J4XTaeHP
 aL1bxJwQjGRYkVLK2tUJ5Z9zfa6pWPWXmBh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKallkCXtV9Fc461CGM2/To6AuVF3QeHwcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFAXpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2kidRg2bJdVIVcFh
 XM/XysLuPe/21PxNcdKj3+ZUZx2ncAM6/y7PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeJqZtJRmCvt/09ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:j1DnpqlCh6uGt1Yhq8Z3g14Ut/zpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62618912"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v9 03/30] build: fix exported variable name CFLAGS_stack_boundary
Date: Tue, 25 Jan 2022 11:00:36 +0000
Message-ID: <20220125110103.3527686-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Exporting a variable with a dash doesn't work reliably, they may be
striped from the environment when calling a sub-make or sub-shell.

CFLAGS-stack-boundary start to be removed from env in patch "build:
set ALL_OBJS in main Makefile; move prelink.o to main Makefile" when
running `make "ALL_OBJS=.."` due to the addition of the quote. At
least in my empirical tests.

Fixes: 2740d96efd ("xen/build: have the root Makefile generates the CFLAGS")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v9:
    - new patch

 xen/arch/x86/Rules.mk     | 4 ++--
 xen/arch/x86/arch.mk      | 4 ++--
 xen/arch/x86/efi/Makefile | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
index 56fe22c979ea..7aef93f5f3a0 100644
--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/Rules.mk
@@ -6,5 +6,5 @@ object_label_flags = '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$@'
 else
 object_label_flags = '-D__OBJECT_LABEL__=$(subst /,$$,$(subst -,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))'
 endif
-c_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
-a_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
+c_flags += $(object_label_flags) $(CFLAGS_stack_boundary)
+a_flags += $(object_label_flags) $(CFLAGS_stack_boundary)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index a93fa6d2e4c9..fa7cf3844362 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -49,8 +49,8 @@ CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
-$(call cc-option-add,CFLAGS-stack-boundary,CC,-mpreferred-stack-boundary=3)
-export CFLAGS-stack-boundary
+$(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundary=3)
+export CFLAGS_stack_boundary
 
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 87b927ed865b..abae493bf344 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -12,7 +12,7 @@ EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
 EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
-$(EFIOBJ-y): CFLAGS-stack-boundary := $(cflags-stack-boundary)
+$(EFIOBJ-y): CFLAGS_stack_boundary := $(cflags-stack-boundary)
 
 obj-y := stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
-- 
Anthony PERARD


