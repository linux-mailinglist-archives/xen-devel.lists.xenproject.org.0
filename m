Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A24B5174
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272060.466883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEx-0004Yo-Be; Mon, 14 Feb 2022 13:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272060.466883; Mon, 14 Feb 2022 13:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEx-0004QW-1B; Mon, 14 Feb 2022 13:18:03 +0000
Received: by outflank-mailman (input) for mailman id 272060;
 Mon, 14 Feb 2022 13:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4C-0008IH-Pz
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fac7a096-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:55 +0100 (CET)
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
X-Inumbo-ID: fac7a096-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Iv+EtTL4QKtjYW+p8dU15rg4ZfKzEluz7BW9resL5q4=;
  b=MIOvzfYFH3hsCF5qV4kY75oZEsPT6fGIqSO/+yv/LTaLcslFABg07zGk
   OPSQfCGiQG97PSeqghe8oP9oYMjKP+rSz8JVLUkcvoM0pjsR4tpyn5m2S
   GPxsQJKz1dQ3H+9fjPQ9Xd4icrFYIGMdtlTVJIVmyzcXuYuoV0aUCaWHW
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4EaJ4De7JaIZS5ouqAPgjsMWIRv7Tz8YCPfBzzjGG2hm3vLKYI77/wBKvgkkAx7dgJiAceWgB4
 gVXoeIrMqMwy/waTtI3ePBtcckKASl4bj7FBgTHgXNkXuJNFqP1HECQ1X3RxJQpHQjtpZ1Ebqq
 tqRbfVxQJgLCm1re2xDCF9YiD0oa2xbB6wnPxEj8ubeMlTupvxRBUx8asAbM1pMuj41IFWlcNt
 xw/Rs13y8AUdBqTZKtVqYacfatkAkosu9mhLVWlNGXneimFyn6OJkQXvmxf0PGBpmz9HThCEDm
 qeNqADK5gRAMTy2lSQX86kSw
X-SBRS: 5.1
X-MesageID: 64554292
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/xJMjavt6chmy3R15TnBwqDhN+fnVE9ZMUV32f8akzHdYApBsoF/q
 tZmKT3UbKzbYmqkKd92Ot/i9U0GvJXWyYIxGlRorn83FiwS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplq7mybAIkOaP3kds/WDBzCQdQY6RJ5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5dENWA+NnwsZTUUGVMFU8g439v5xXOhaDZYg1y+poMOtj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+ov+KaQr6AwxgfJnypKVUNQBQDTTeSFZlCWRfddD
 kkZ/SQVpJcQ/2WAVP/TARS3vyvR1vIDYOZ4H+o/4QCL76Pb5QeFG2QJJgJ8hMwaWNweHmJzi
 ALQ9z/9LXk26eDOFyrBnluBhW7qYUAowXk+iTjopOfvy/3qu8kNgx3GVb6P+4bl34SuSVkcL
 91nxRXSZon/b+ZWjc1XHnid2lpAQ6QlqSZvuG3qspqNtF8RWWJcT9XABaLnxfhBNp2FaVKKo
 WIJncOThMhXU83Ry3zdHbhVRerzjxpgDNE7qQQxd6TNChz3oyLzFWyuyG0WyLhV3jYsJmayP
 R67VfJ5755PJnq6BZKbkKrqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskC1
 WKzLJ/E4YAyUv88klJbho41jNcW+8zJ7T2PG86rlUn7uVdcDVbMIYo43JK1RrhRxMu5TM/9q
 YwOXydT4xkAAuD4fAfN9osfcQIDIXQhXMikoM1LbO+TZAFhHTh5WfPWxLogfa1jnrhUybiUr
 i3sBBcAxQqtn2DDJCWLdmtnNOHlU6FgoC9pJicrJ1uphSQuON798KcFepIrVrA77+g/n+VsR
 vwIdpzYUPRCQzjK4RoHapz5oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdaHlZsFsfbbv6r3midh3lFlbIgRVbML/lSZF7orNpgJRvug6JlOMoLMxjCmGeXj
 l7EHRcCqODRiIYp692V17ucpoKkHuYiTEpXG27XseS/OSXApzfxxIZBVKCDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD6WLpvL06P0dRLqqAQlKRSvhG7W
 x7X99RXUVlT1BgJzLLFyNIZU9m+
IronPort-HdrOrdr: A9a23:k5pwYa0FptbJb7JbakFR2QqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554292"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 47/70] x86/logdirty: CFI hardening
Date: Mon, 14 Feb 2022 12:51:04 +0000
Message-ID: <20220214125127.17985-48-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm/hap/hap.c       |  6 +++---
 xen/arch/x86/mm/shadow/common.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index de4b13565ab4..ed5112b00b63 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -180,7 +180,7 @@ int hap_track_dirty_vram(struct domain *d,
  * NB: Domain that having device assigned should not set log_global. Because
  * there is no way to track the memory updating from device.
  */
-static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
+static int cf_check hap_enable_log_dirty(struct domain *d, bool log_global)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
@@ -211,7 +211,7 @@ static int hap_enable_log_dirty(struct domain *d, bool_t log_global)
     return 0;
 }
 
-static int hap_disable_log_dirty(struct domain *d)
+static int cf_check hap_disable_log_dirty(struct domain *d)
 {
     paging_lock(d);
     d->arch.paging.mode &= ~PG_log_dirty;
@@ -228,7 +228,7 @@ static int hap_disable_log_dirty(struct domain *d)
     return 0;
 }
 
-static void hap_clean_dirty_bitmap(struct domain *d)
+static void cf_check hap_clean_dirty_bitmap(struct domain *d)
 {
     /*
      * Switch to log-dirty mode, either by setting l1e entries of P2M table to
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 83dedc8870aa..071a19adce82 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -40,9 +40,9 @@
 
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
-static int sh_enable_log_dirty(struct domain *, bool log_global);
-static int sh_disable_log_dirty(struct domain *);
-static void sh_clean_dirty_bitmap(struct domain *);
+static int cf_check sh_enable_log_dirty(struct domain *, bool log_global);
+static int cf_check sh_disable_log_dirty(struct domain *);
+static void cf_check sh_clean_dirty_bitmap(struct domain *);
 
 /* Set up the shadow-specific parts of a domain struct at start of day.
  * Called for every domain from arch_domain_create() */
@@ -3016,7 +3016,7 @@ static int shadow_test_disable(struct domain *d)
 /* Shadow specific code which is called in paging_log_dirty_enable().
  * Return 0 if no problem found.
  */
-static int sh_enable_log_dirty(struct domain *d, bool log_global)
+static int cf_check sh_enable_log_dirty(struct domain *d, bool log_global)
 {
     int ret;
 
@@ -3044,7 +3044,7 @@ static int sh_enable_log_dirty(struct domain *d, bool log_global)
 }
 
 /* shadow specfic code which is called in paging_log_dirty_disable() */
-static int sh_disable_log_dirty(struct domain *d)
+static int cf_check sh_disable_log_dirty(struct domain *d)
 {
     int ret;
 
@@ -3058,7 +3058,7 @@ static int sh_disable_log_dirty(struct domain *d)
 /* This function is called when we CLEAN log dirty bitmap. See
  * paging_log_dirty_op() for details.
  */
-static void sh_clean_dirty_bitmap(struct domain *d)
+static void cf_check sh_clean_dirty_bitmap(struct domain *d)
 {
     paging_lock(d);
     /* Need to revoke write access to the domain's pages again.
-- 
2.11.0


