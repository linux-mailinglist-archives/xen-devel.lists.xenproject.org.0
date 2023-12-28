Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1881FAC8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Dec 2023 20:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660224.1029781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIwDw-00057b-Hj; Thu, 28 Dec 2023 19:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660224.1029781; Thu, 28 Dec 2023 19:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rIwDw-00055p-E7; Thu, 28 Dec 2023 19:39:20 +0000
Received: by outflank-mailman (input) for mailman id 660224;
 Thu, 28 Dec 2023 19:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuD1=IH=citrix.com=prvs=7195a922f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rIwDv-00055j-TS
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2023 19:39:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c839eec5-a5b8-11ee-98ed-6d05b1d4d9a1;
 Thu, 28 Dec 2023 20:39:17 +0100 (CET)
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
X-Inumbo-ID: c839eec5-a5b8-11ee-98ed-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1703792357;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g5gpe4nyKoOIU7XqVpUqtUSSTMTjNB4hiO+3YbZpQzc=;
  b=BM2qgWWlvQf8bI0qyc8lhAEivcpXBix4hdGceVkbzKwa05VZLDySok/1
   nZMT5aqqeDvidNGFMrP/D03Rdc0KRyL+3cDJApSmZoLeLi/Q+APoBvZde
   5MX5mK/WDkUX01WDiMtalqhoAXcmveNSRLT7qU1Ilhh9dR7Ay2J6Fm3GJ
   I=;
X-CSE-ConnectionGUID: Ts0QKIAOS0OK2ULd90NQLw==
X-CSE-MsgGUID: qw4etHXxTOW9qnzqGCkRqQ==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127630642
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:nQnJA67GFCA55wd6qw0IegxRtHvHchMFZxGqfqrLsTDasY5as4F+v
 mIYXG6HP/yJYDCmeNp2bd7jo0IO7ZeDyIBmGwo5/isyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34JwehBtC5gZlPKoR7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 edAERMsRze438WVmo+fRrg0oP0HM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBnG/
 TqYoz6R7hcyLcPDxCalwmKQodCehCXpQa05F4ehz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAp/HL9VteJBT5M0c+fnc9biosxOK7h6JpszbDH45FKYqq24id9S7L/
 9yakMQvr+xM1ZVUh/TkpAyvvt66mnTeoucICuTrsoGNtFoRiHaNPdDA1LQixa8owHylZleAp
 mMYvMOV8foDC5qA/ATUH71WQ+H5uKjVa2CD6bKKI3XG3239k0NPgKgKuG0uTKuXGplslcDVj
 L/75loKuc470IqCZq5reYOhY/nGPoC5fekJosv8N4IUCrAoLV/vwc2bTRLIt4wbuBR2wP5X1
 FbyWZrEMEv2/ow+lmfuF7hEie5xrs38rEuKLa3GI92c+eL2TBaopX0taTNisshRAHu4nTjo
IronPort-HdrOrdr: A9a23:vQUMG6zN7iAZdPFq3OxOKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-Talos-CUID: 9a23:f9fTwWGcyzu2nnDgqmJb7xYtOeEMVUaF61SKHmu0WD5PcZmKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AUthiZQxZ7wCI2Hh/QEFBW+GA1ZaaqL2xVE0RsaU?=
 =?us-ascii?q?Wh+67ZDV2KS6ypzeNW7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,312,1695700800"; 
   d="scan'208";a="127630642"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen: Use -Wuninitialized and -Winit-self
Date: Thu, 28 Dec 2023 19:39:07 +0000
Message-ID: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The use of uninitialised data is undefined behaviour.  At -O2 with trivial
examples, both Clang and GCC delete the variable, and in the case of a
function return, the caller gets whatever was stale in %rax prior to the call.

Clang includes -Wuninitialized within -Wall, but GCC only includes it in
-Wextra, which is not used by Xen at this time.

Furthermore, the specific pattern of assigning a variable to itself in its
declaration is only diagnosed by GCC with -Winit-self.  Clang does diagnoise
simple forms of this pattern with a plain -Wuninitialized, but it fails to
diagnose the instances in Xen that GCC manages to find.

GCC, with -Wuninitialized and -Winit-self notices:

  arch/x86/time.c: In function ‘read_pt_and_tsc’:
  arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
    297 |     uint32_t best = best;
        |              ^~~~
  arch/x86/time.c: In function ‘read_pt_and_tmcct’:
  arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
   1022 |     uint64_t best = best;
        |              ^~~~

and both have logic paths where best can be returned while uninitalised.  In
both cases, initialise to ~0 like the associated *_min variable which also
gates updating best.

Fixes: 23658e823238 ("x86/time: further improve TSC / CPU freq calibration accuracy")
Fixes: 3f3906b462d5 ("x86/APIC: calibrate against platform timer when possible")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Full Gitlab:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1121715339
---
 xen/Makefile        | 3 ++-
 xen/arch/x86/time.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 21832d640225..81861bc41867 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -393,8 +393,9 @@ CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
-CFLAGS += -Wdeclaration-after-statement
+CFLAGS += -Wdeclaration-after-statement -Wuninitialized
 $(call cc-option-add,CFLAGS,CC,-Wvla)
+$(call cc-option-add,CFLAGS,CC,-Winit-self)
 CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 6d33edd0addc..3fd90e9b78bc 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -294,7 +294,7 @@ static uint32_t __init read_pt_and_tsc(uint64_t *tsc,
                                        const struct platform_timesource *pts)
 {
     uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
-    uint32_t best = best;
+    uint32_t best = ~0;
     unsigned int i;
 
     for ( i = 0; ; ++i )
@@ -1019,7 +1019,7 @@ static u64 __init init_platform_timer(void)
 static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
 {
     uint32_t tmcct_prev = *tmcct = apic_tmcct_read(), tmcct_min = ~0;
-    uint64_t best = best;
+    uint64_t best = ~0;
     unsigned int i;
 
     for ( i = 0; ; ++i )
-- 
2.30.2


