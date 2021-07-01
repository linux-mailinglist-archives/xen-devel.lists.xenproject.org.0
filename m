Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6DF3B92E6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148705.274820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOe-0005iz-6j; Thu, 01 Jul 2021 14:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148705.274820; Thu, 01 Jul 2021 14:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOe-0005g4-3I; Thu, 01 Jul 2021 14:10:28 +0000
Received: by outflank-mailman (input) for mailman id 148705;
 Thu, 01 Jul 2021 14:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOd-0005F9-Ie
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 115b20d1-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:21 +0000 (UTC)
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
X-Inumbo-ID: 115b20d1-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8wF1OZRVMN+i4dPl8jzrjodmwU9+O8uvhRvJWa7YhLU=;
  b=Gz3SFPxQKsGE1TkVWplAILoectsooQsY0ULsu7CldwrHwWfZW8V8qwQi
   c7PNBI5LYPj4YyWObbQ53qgXqG70Bn9ZIcH+6TcHfaMVroBSDz7gNlRHx
   VApIUhdwcmks6RoAt7I0Bar0J0pblA0EP6cYaI7Mu6LJfFQSYOPLtbe4u
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GfoBV98qFKEsx0+8+X25twMo7xYrQOCMiSGiXjJZB00zgSiOH6Lux/lC1O6UFX7cFaijWpt7+Y
 6YGank19UXg9Vy2SnUXE/ovuzUQzsCjw+Tp7a+CG+0IPS3imfW82NlbM0UNPi1PZaLzbtq6cL1
 XIn4nznTdeF4Urw+kOU4ii9xCz8WKrP9ajKMKRcj5wIDAx4Cv66KR/r6S4zVwIxIQ3zkxgrAtV
 /+vhiM9a03xW0Sggftt9t1CqRmL2S65JsVekG59dibwnpuVw1Jq3ke7lyH+tt1agKyfLzHYrKp
 y8k=
X-SBRS: 5.1
X-MesageID: 47376076
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:hmFiDqAkgXNXX0vlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47376076"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [XEN PATCH v6 02/31] build: introduce cpp_flags macro
Date: Thu, 1 Jul 2021 15:09:42 +0100
Message-ID: <20210701141011.785641-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v6:
    - switch to a macro as suggested
      which allows to be used with both a_flags and c_flags
    
    v5:
    - new patch

 xen/Rules.mk                    | 7 +++++--
 xen/arch/x86/mm/Makefile        | 2 +-
 xen/arch/x86/mm/hap/Makefile    | 2 +-
 xen/arch/x86/mm/shadow/Makefile | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index d65d6a48993b..f778058f80a6 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -133,6 +133,9 @@ endif
 # Always build obj-bin files as binary even if they come from C source. 
 $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
 
+# To be use with $(a_flags) or $(c_flags) to produce CPP flags
+cpp_flags = $(filter-out -Wa$(comma)%,$(1))
+
 # Calculation of flags, first the generic flags, then the arch specific flags,
 # and last the flags modified for a target or a directory.
 
@@ -222,13 +225,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o FORCE
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
-cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
+cmd_cpp_i_c = $(CPP) $(call cpp_flags,$(c_flags)) -MQ $@ -o $@ $<
 
 quiet_cmd_cc_s_c = CC      $@
 cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
 quiet_cmd_cpp_s_S = CPP     $@
-cmd_cpp_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
+cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 
 %.i: %.c FORCE
 	$(call if_changed,cpp_i_c)
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index b31041644fe8..2818c066f76a 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -15,7 +15,7 @@ guest_walk_%.o: guest_walk.c Makefile
 	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%.s: guest_walk.c Makefile
 	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 22e7ad54bd33..c6d296b51720 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -9,7 +9,7 @@ guest_walk_%level.o: guest_walk.c Makefile
 	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%level.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%level.s: guest_walk.c Makefile
 	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/shadow/Makefile b/xen/arch/x86/mm/shadow/Makefile
index 770213fe9d84..fd64b4dda925 100644
--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -10,7 +10,7 @@ guest_%.o: multi.c Makefile
 	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_%.i: multi.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(call cpp_flags,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_%.s: multi.c Makefile
 	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
-- 
Anthony PERARD


