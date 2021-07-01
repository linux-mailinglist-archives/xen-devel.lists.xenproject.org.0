Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89C3B92E9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148708.274854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOk-0006h8-DI; Thu, 01 Jul 2021 14:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148708.274854; Thu, 01 Jul 2021 14:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOk-0006bk-8f; Thu, 01 Jul 2021 14:10:34 +0000
Received: by outflank-mailman (input) for mailman id 148708;
 Thu, 01 Jul 2021 14:10:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOi-0005F9-Iq
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1306551c-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:22 +0000 (UTC)
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
X-Inumbo-ID: 1306551c-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pns9739RItoS5khKorq30ivslZu4OAvxwnMWwlNaAu0=;
  b=VRv/d+8Ab4l2j1QVYGgQcCxHaz8rTmAQeQrfE1oKYLgn5HNXE9mUXUjA
   rJp0lfZIAbEsB2ytZirznyASonnzg279ZlBq26kmCurs935yfhuJGmj1S
   GYNr2Mrhbnh5kpeKXW7Vc37rpRD5gmklejF83uIMOqVKEbuyZKmwBKd5K
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3rn9hvSyOIjLz1zTcJ0VvqoZ9PirUNBSml1KaMuBm1To5iUDM40jDpjk2yN3b96kmcikzwI4RA
 Xr1IRL8o9y59sV6bV14kzfBa3mxb3sEvKoOi2sZf63yle3ertoEX4j9QzuRASTeqgJ0Y/UzwCC
 xPGrTOKhsPmvaF5ZJwAZAnQ5KEPJW3WgLNMQyQQtTn+dnbaShaVYZ+mIlpBlIpWZP6A5uC1BKp
 YA/AnW17sGoh9nKyvdO5EBUdS37Og6FCULGh/TCTw1GGna1+ymE6WAN54Ez9rGPxPWHlut3gNS
 fv4=
X-SBRS: 5.1
X-MesageID: 47376079
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FEn/IagvOulIic/Rfb6eLCv9enBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47376079"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 03/31] build: use if_changed on built_in.o
Date: Thu, 1 Jul 2021 15:09:43 +0100
Message-ID: <20210701141011.785641-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
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
index f778058f80a6..6a0cdfde2eed 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -147,17 +147,22 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 c_flags += $(CFLAGS-y)
 a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
-built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y)
-ifeq ($(strip $(obj-y)),)
-	$(CC) $(c_flags) -c -x c /dev/null -o $@
-else
+quiet_cmd_cc_builtin = LD      $@
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


