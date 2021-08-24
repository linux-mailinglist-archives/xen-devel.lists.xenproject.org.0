Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BEB3F5CAB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171007.312254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBo-00022j-Sn; Tue, 24 Aug 2021 11:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171007.312254; Tue, 24 Aug 2021 11:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBn-0001a7-7f; Tue, 24 Aug 2021 11:01:55 +0000
Received: by outflank-mailman (input) for mailman id 171007;
 Tue, 24 Aug 2021 11:01:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU35-0003Ux-CH
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:55 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ac0f07c-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:54 +0000 (UTC)
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
X-Inumbo-ID: 4ac0f07c-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e9beWPLZ66LkDKWINmxWgPLa0xieM3oPvCgwItf4tcI=;
  b=XmzDOKnGR9pzdJKVHd5HoinLupX8I3u04pKIjcv7rgxsV/XGV1dE3MQR
   cQxMWbYuoV8bvqWh73ExoyWqV6c5sXWIUndRzBo+ZWR1A/ubp6UtYXTfn
   Nv6JH3EYRXXraCZf8Amddv1Esq38A1vCExfidRJ1ml4LYg2LnecT8m9z/
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uQI0xWw6n21OdE3SYcrHMrutDgUY0LW5tnZ4E0nWQw+8NYsU9hTv0iD8Zhazxx7FQc6hkn/Rz6
 PQUOJyBpNUfWWf2XaFY03Hfj449KayKP5NqcB8xdGI18HuZJr2oijSawHFElU+al4avT/XSeJx
 mEilWVJuL+64xokcryCy92sAyGgmynCDTmmCNJxzQZLaprJalCm94F7uzh530KwvF24evO9Qzw
 x8oXka3JxEMVLiaeaHa6oK/2oJ9+Y3wcwrj9Je8fbK+R6ajXFLaTeWuOxkJY7ipt1H5mM4Rp4e
 uIxk78KhSaLEGwEMzuq6nD2S
X-SBRS: 5.1
X-MesageID: 51166397
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EoqMxKv1c282+cDtTctFItgn7skCyoMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6HnBEGBKUm9yXcH2/hpAV7CZnishILGFvAH0WKP+VPd8k7Fh6RgPM
 VbAs9D4bTLZDAX4voSizPIcOrIteP3lZxA8t2urUuFIzsKV4hQqyNCTiqLGEx/QwdLQbAjEo
 CH28ZBrz28PVwKc8WSHBA+LqT+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwI0l7X
 POn2XCl+qeWrCAu1HhPl3ontRrcejau5h+7Qu3+4oowwDX+0eVjUJaKvi/VX4O0aWSAR0R4a
 HxSl8bTr9OAjXqDyyISFLWqnPd+Sdr5Hn4xVCCh3z/5cT/WTIhEsJEwZlUax3D9iMbzadBOY
 9wrhakXqBsfGT9deXGlqn1fgAvklDxrWspkOYVgXAaWYwCaKVJpYha+E9OCp8PEC/z9YhiSY
 BVfYnhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdzs0CmXUL8o47VvB/lq
 35G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJK26WKUSPLtBzB5sMke+E3FwR3pDVRHUl9upPpH
 3xaiIqiYdpQTOSNSSn5uw1zjndBH66QSngjtpD4pQRgMyNeIbW
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51166397"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 33/51] build: handle always-y and hostprogs-always-y
Date: Tue, 24 Aug 2021 11:50:20 +0100
Message-ID: <20210824105038.1257926-34-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will be used for xen/tools/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk               | 10 +++++++++-
 xen/scripts/Makefile.clean |  3 ++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 760ccff0e8f1..1e1839c4b629 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -83,9 +83,17 @@ else
 obj-y    := $(filter-out %/, $(obj-y))
 endif
 
+# hostprogs-always-y += foo
+# ... is a shorthand for
+# hostprogs-y += foo
+# always-y  += foo
+hostprogs-y += $(hostprogs-always-y)
+always-y += $(hostprogs-always-y)
+
 # Add subdir path
 
 extra-y         := $(addprefix $(obj)/,$(extra-y))
+always-y        := $(addprefix $(obj)/,$(always-y))
 targets         := $(addprefix $(obj)/,$(targets))
 lib-y           := $(addprefix $(obj)/,$(lib-y))
 obj-y           := $(addprefix $(obj)/,$(obj-y))
@@ -288,7 +296,7 @@ targets += $(call intermediate_targets, .init.o, .o) \
 # Build
 # ---------------------------------------------------------------------------
 
-__build: $(targets-for-builtin) $(subdir-y)
+__build: $(targets-for-builtin) $(subdir-y) $(always-y)
 	@:
 
 # Descending
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 156d6307cf83..c2689d4af5fa 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -18,7 +18,8 @@ subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
               $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
 __clean-files := \
-    $(clean-files) $(hostprogs-y) $(hostprogs-)
+    $(clean-files) $(hostprogs-y) $(hostprogs-) \
+    $(hostprogs-always-y) $(hostprogs-always-)
 
 __clean-files := $(wildcard $(__clean-files))
 
-- 
Anthony PERARD


