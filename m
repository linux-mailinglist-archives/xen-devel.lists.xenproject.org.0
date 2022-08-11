Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D4590513
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384801.620368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBN7-0007Zz-8t; Thu, 11 Aug 2022 16:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384801.620368; Thu, 11 Aug 2022 16:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBN6-0007KG-IJ; Thu, 11 Aug 2022 16:49:24 +0000
Received: by outflank-mailman (input) for mailman id 384801;
 Thu, 11 Aug 2022 16:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBN3-0003Aq-DN
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b44c487-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:20 +0200 (CEST)
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
X-Inumbo-ID: 8b44c487-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OlPVmttWbfxru1ipdHV5J3q6iQpuewLRL8Acv8ppp/4=;
  b=DGMyvuWFQm9J9AsKIUTS1WRxQ4igH+5ijF57Bkx8jdfgPUFM6hRC/DZ7
   ea/NcbpqkcLny9FqH9JBXblfUX1mPvxyvGWRYUFoPqA9zYqlS4uMu6w7i
   W+DYGKPdTgF5THZl5wUOeJKml4+llKpzv4gdm/0FAGaed5C/WQEwfq7wg
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80449013
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Yy9cUaDLkqfJnhVW/y/jw5YqxClBgxIJ4kV8jS/XYbTApDgi0DUAy
 WFNCmuBbP6CZ2b1co8kPYvg/U4Bu8LRxtVqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsvvb8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW2Du6PlvE1wTBK8d/fZTLGhv1
 uAgIglYO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fszCPkF0pieOF3Nz9VdmFaOdTr3+ig
 kH07WPLCykWMO2h4G/Qmp6rrrCWxn6qMG4IL5Wy++R2mlSVyioWAQcPSFqgifCjjwi1XNc3A
 1MQ0jojq+417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatM8s9QtbSc3z
 VLPlNTsbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMe4fLvoZ4uqyvtS9FzNIO8r/7pITvJl
 mXiQDcFu1kDsSIa//zlowif0m31/8ahoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoJiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa+TYy6DqmFPocUOPCdkTNrGwkwDXN8Iki3yBR8+U3BE
 c7znTmQ4YYyVv08kWveqxY12r433CEurV7uqWTA503+idK2OS/KIYrpxXPUMYjVGovY/1iOm
 zueXuPWoyhivBrWPnCLrdJOdgBWdBDWx/ne8qRqSwJKGSI+cElJNhMb6ehJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:us/JbqMoefBe4cBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3/qy
 nOpoVi6faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrJ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="80449013"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v4 14/32] libs/libs.mk: Rework target headers.chk dependencies
Date: Thu, 11 Aug 2022 17:48:27 +0100
Message-ID: <20220811164845.38083-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need to call the "headers.chk" target when it isn't
wanted, so it never need to be .PHONY.

Also, there is no more reason to separate the prerequisites from the
recipe.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/libs/libs.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 7aee449370..f778a7df82 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -55,22 +55,20 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: headers.chk $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
-headers.chk:
+all: headers.chk
+
+headers.chk: $(LIBHEADERS) $(AUTOINCS)
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror $(CFLAGS_xeninclude) \
 	          -S -o /dev/null $$i || exit 1; \
 	    echo $$i; \
 	done >$@.new
 	mv $@.new $@
-else
-.PHONY: headers.chk
 endif
 
-headers.chk: $(LIBHEADERS) $(AUTOINCS)
-
 headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
 	@$(call move-if-changed,$@.tmp,$@)
-- 
Anthony PERARD


