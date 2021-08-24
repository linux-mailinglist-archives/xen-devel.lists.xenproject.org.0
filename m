Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E13F5C5E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170894.311902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1A-0001Hm-0S; Tue, 24 Aug 2021 10:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170894.311902; Tue, 24 Aug 2021 10:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU19-0001EV-Ss; Tue, 24 Aug 2021 10:50:55 +0000
Received: by outflank-mailman (input) for mailman id 170894;
 Tue, 24 Aug 2021 10:50:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU17-0000wa-U1
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:50:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2500185c-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:50:50 +0000 (UTC)
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
X-Inumbo-ID: 2500185c-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7FQvY3N7Dn2gL79xi6cUz0Zwpk5522yieldEo41vf9E=;
  b=T1Ty6VnqgeKKmXZtGbatuyRsSEbY1oVdQ0iv35A7ERL/LtheyPmhaa2A
   OYYP/E2SjkiHNJ5OAYOPctk7S8BoF8+T7LY3PrgY6c3DouR3kRYsh0e2G
   bv9iS93wsseL1uYlP/sIIDIcT4SaFN72Qv82EJoG0KKOBrPXfCxiJtN0S
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yEjU0FBp9IJ/pt/cWd7MOMiQs/gaeXC7LKezZ8lzU2l8qghCsDt5kQMzl/yzQ+tnwFI6gz6Z9Z
 C19xRsa/J4k9/5wLWLWdmtnPiGkIsm9nHYGCMg6QbQuJZ0sxaNY4pFcQ4vC1wl5HTSoZzA+Eqf
 xzfaSBlMO8XLFCOKMn50hqb0NyZsTAUv++0dkgHLC2pcXHB1/zFiHySIwCLqjHjzZrB08kUZ7h
 RqZfvlPP7WDiP/bjUOXX1uwD40OMEl2Fi/xviKUuvVnBIKOwNToMQ9dM5yihL4vDF6Le8HeEwG
 uNh6lv5gLxDItdVITJDavX5U
X-SBRS: 5.1
X-MesageID: 50772160
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Z1PDxKljkOmbwsZwz9jBIhV7QIbpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772160"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 02/51] build: use if_changed on built_in.o
Date: Tue, 24 Aug 2021 11:49:49 +0100
Message-ID: <20210824105038.1257926-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In the case where $(obj-y) is empty, we also replace $(c_flags) by
$(XEN_CFLAGS) to avoid generating an .%.d dependency file. This avoid
make trying to include %.h file in the ld command if $(obj-y) isn't
empty anymore on a second run.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v7:
    - Display "CC" for cmd_cc_builtin instead of "LD".
    
    v6:
    - use $(if $(strip $(obj-y)),ld_builtin,cc_builtin)
      as suggested
    - rebased
    
    v4:
    - Have cmd_ld_builtin depends on CONFIG_LTO, which simplify built_in.o
      rule.

 xen/Rules.mk | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index c99c4a9475c9..5a6a5d63260f 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -147,17 +147,22 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
-built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y)
-ifeq ($(strip $(obj-y)),)
-	$(CC) $(c_flags) -c -x c /dev/null -o $@
-else
+quiet_cmd_cc_builtin = CC      $@
+cmd_cc_builtin = \
+    $(CC) $(XEN_CFLAGS) -c -x c /dev/null -o $@
+
+quiet_cmd_ld_builtin = LD      $@
 ifeq ($(CONFIG_LTO),y)
-	$(LD_LTO) -r -o $@ $(filter $(obj-y),$^)
+cmd_ld_builtin = \
+    $(LD_LTO) -r -o $@ $(filter $(obj-y),$(real-prereqs))
 else
-	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter $(obj-y),$^)
-endif
+cmd_ld_builtin = \
+    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter $(obj-y),$(real-prereqs))
 endif
 
+built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y) FORCE
+	$(call if_changed,$(if $(strip $(obj-y)),ld_builtin,cc_builtin))
+
 lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
-- 
Anthony PERARD


