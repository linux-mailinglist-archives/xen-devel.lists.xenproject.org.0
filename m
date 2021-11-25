Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AD445DB9C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231329.400445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6q-00070X-FS; Thu, 25 Nov 2021 13:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231329.400445; Thu, 25 Nov 2021 13:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6q-0006ur-2C; Thu, 25 Nov 2021 13:48:20 +0000
Received: by outflank-mailman (input) for mailman id 231329;
 Thu, 25 Nov 2021 13:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0s-00076i-H2
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:42:10 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b739584-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:42:09 +0100 (CET)
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
X-Inumbo-ID: 7b739584-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o70thL8LZfXVGN0BO7FVeJVHlQxVD96SJrfgO735CIw=;
  b=Z75/qpFCXf+PG1EyVL2smPIxEojmFvfSdIiDMGQ2WvHHGke+AUt4hM9F
   WK54DRos6L+MBntxPeEP1RCEx5LdPgTI8h8HqMZTNtcF8EQszUy09QDbi
   MRHwzXaAQV/5uUUQz098CkNZKPKV4VdsAWFWPJu09cbSuGd4e3V6tIBpA
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NuhfKlMtoiYjL7hI3xnhJJk2ng5kkY1GC7m9UKJeO4kPabWG7I1YbRETyTtAskKQ4MZDvrYky6
 Nl6n7cFbwssCn3yCfIKOtiDxXil1ZCM4WBWAnCKWUotJV8KK+yuoyOXjBwcxWJ00qGSDeXQo3I
 Re4C4Vx8yuzYMgwPJDe/3CxpAwuHKWsEj2P2tMRS+Hvw4Vw4SVTN3rIKjziTwesxPdFkaUo2Yq
 f23HL+eMlXWaWNmT99Zk3pcRkPrmajvA47S7TcAHuGrhgV3zqXm9ln4MeWCfqqQBs91nzcVVRe
 7O7dgnCq6BEMZNNlGNhOuBBy
X-SBRS: 5.1
X-MesageID: 58576724
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yTl/Xa6GhV+/DuOF8XzF1gxRtMXAchMFZxGqfqrLsTDasY5as4F+v
 jQfUD3Xbq3bYTH1L9wjaY6/pxtQvJbXmoRmHgJr/ykyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 PddhKe+ZxUQH4bXwOUwXiBKAXlXBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTauBO
 ZVDNVKDajztRkRfJWxKWakBu72GnnykKwdmgQis8P9fD2/7k1UqjemF3MDuUt6XQcRYmG6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZ1hHWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslh8DWfJAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZVcn8+jYrq8htzPkVY5iPaOMnM+tMAill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3HY5
 CBc8/Vy+tziGn1keMalZOwWVI+k6P+eWNE3qQ4+RsJxn9hBFpPKQGyx3N2cDBs2WirnUWWwC
 KM2he+2zMUOVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOhD+yzxl8wfBlZ
 8bznSOQ4ZEyU/oP8dZLb71Fje9DKt4WmQs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iF69z
 jqrDOPTk083eLSnOkH/qNdPRXhXfSlTLc2n8KR/K7/cSjeK7Ul8Upc9N5t6INc790mU/8+Vl
 kyAtrhwlACi2CaZcFrSMRiOqtrHBP5CkJ7yBgR0VX7A5pTpSdzHAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:HjttuqPPh/mKFMBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58576724"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 43/47] WIP, no-VPATH: build object from generated assembly source file
Date: Thu, 25 Nov 2021 13:40:02 +0000
Message-ID: <20211125134006.1076646-44-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gen-objs-c and gen-objs-S can't have the list of targets.

Alternative, merge both list and use $(filter ).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk | 6 ++++++
 xen/build.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 44af005fd57e..2d8d32f5fd72 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -26,6 +26,7 @@ lib-y :=
 targets :=
 ## targets made from generated sources
 gen-objs-c :=
+gen-objs-S :=
 subdir-y :=
 CFLAGS-y :=
 AFLAGS-y :=
@@ -99,6 +100,7 @@ lib-y           := $(addprefix $(obj)/,$(lib-y))
 obj-y           := $(addprefix $(obj)/,$(obj-y))
 obj-bin-y       := $(addprefix $(obj)/,$(obj-bin-y))
 gen-objs-c      := $(addprefix $(obj)/,$(gen-objs-c))
+gen-objs-S      := $(addprefix $(obj)/,$(gen-objs-S))
 subdir-y        := $(addprefix $(obj)/,$(subdir-y))
 nocov-y         := $(addprefix $(obj)/,$(nocov-y))
 noubsan-y       := $(addprefix $(obj)/,$(noubsan-y))
@@ -255,6 +257,10 @@ $(obj)/%.o: $(srctree)/$(src)/%.c FORCE
 quiet_cmd_cc_o_S = CC      $@
 cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $@
 
+ifdef building_out_of_srctree
+$(gen-objs-S): $(obj)/%.o: $(obj)/%.S FORCE
+	$(call if_changed_dep,cc_o_S)
+endif
 $(obj)/%.o: $(src)/%.S FORCE
 	$(call if_changed_dep,cc_o_S)
 
diff --git a/xen/build.mk b/xen/build.mk
index 7b48b7eb1404..2f2cbbbeabf8 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -83,6 +83,13 @@ prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
 	$(call if_changed,ld)
 endif
 
+# Source generated in arch/*/Makefile to build $(TARGET)-syms
+gen-objs-S += .$(TARGET)-syms.0.o
+gen-objs-S += .$(TARGET)-syms.1.o
+# Source generated in arch/*/Makefile to build $(TARGET).efi
+gen-objs-S += .$(TARGET).efi.0r.o .$(TARGET).efi.0s.o
+gen-objs-S += .$(TARGET).efi.1r.o .$(TARGET).efi.1s.o
+
 targets += prelink.o
 
 $(TARGET): prelink.o FORCE
-- 
Anthony PERARD


