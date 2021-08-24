Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10BE3F5CAE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171009.312263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBq-0002X5-L8; Tue, 24 Aug 2021 11:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171009.312263; Tue, 24 Aug 2021 11:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBp-0001zp-3n; Tue, 24 Aug 2021 11:01:57 +0000
Received: by outflank-mailman (input) for mailman id 171009;
 Tue, 24 Aug 2021 11:01:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4N-0003Ux-Ee
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 637f13da-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:35 +0000 (UTC)
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
X-Inumbo-ID: 637f13da-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YEQGvIYAxhCe5H6wIWepHfg/efcf3yv+PfASQNpjxxI=;
  b=DLVv2QQYrQwqAU0lix9wgBykVEIby+uQeQQWrnoRbmHr/sVja78u04oU
   tILpoQaUDUWeqMkBlTZG6OXtPhMAyeJWKy6O2/+e1FYdcdXT0NbxfBpF/
   +CjWsw5T+O5XZmk/p1VMpe3+1D04oejqP2t1mgeUVtS93UU4z6f3XtDul
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1jd2RLyJdsLUw7xBH6tEvn6hZ2r8TOw62HDrkvbwSG6H4IHuQHDxYJ0/o838D0LZZ8tw46Trpd
 Euk1QwcD3MXVFPJuy4SupGRqMNlPYdWz9xhfnwITTHTe7eQZSjqsE/Bzt4LqHui+L11KBB6xOM
 ab3Fl5fKfFB3F7uVMWcK8Qlg/UwZSULC8DkqKZSnpFsmb40puDnk6QYzPfkJaLk3m7Z6BQkRDG
 33cbz/yIyaZlhmhag/X0KZcwa3KjdrWbNZhel+UuhMNPPAX0Vt81EaptD+5lE2H9DfNRZm8Cj9
 nggmCTZ2WBXNen3og9rSKrIL
X-SBRS: 5.1
X-MesageID: 51540954
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LVvb+qsbCsTmq7RwlcfEHnEG7skCyoMji2hC6mlwRA09TyXGra
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
   d="scan'208";a="51540954"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 51/51] build: add %.E targets
Date: Tue, 24 Aug 2021 11:50:38 +0100
Message-ID: <20210824105038.1257926-52-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

I guess it's easier to remember that %.E does "$(CC) -E" or "$(CPP)".

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 4 ++--
 xen/Rules.mk | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index d27c213c3aa9..91b34d549970 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -586,10 +586,10 @@ cscope:
 _MAP:
 	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
 
-%.o %.i %.s: %.c tools_fixdep FORCE
+%.o %.i %.s %.E: %.c tools_fixdep FORCE
 	$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
-%.o %.s: %.S tools_fixdep FORCE
+%.o %.s %.E: %.S tools_fixdep FORCE
 	$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
 %/: tools_fixdep FORCE
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 6c97f539330a..7d6112a3cdec 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -289,6 +289,11 @@ $(obj)/%.s: $(src)/%.c FORCE
 $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
+$(obj)/%.E: $(src)/%.c FORCE
+	$(call if_changed_dep,cpp_i_c)
+$(obj)/%.E: $(src)/%.S FORCE
+	$(call if_changed_dep,cpp_s_S)
+
 # Linker scripts, .lds.S -> .lds
 quiet_cmd_cpp_lds_S = LDS     $@
 cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -DLINKER_SCRIPT -MQ $@ -o $@ $<
-- 
Anthony PERARD


