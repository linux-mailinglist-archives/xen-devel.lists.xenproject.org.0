Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94BD19BF45
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:22:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwwZ-0000sd-Lb; Thu, 02 Apr 2020 10:19:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJwwY-0000sH-Dm
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 10:19:26 +0000
X-Inumbo-ID: 66a5fd6a-74cb-11ea-bba1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66a5fd6a-74cb-11ea-bba1-12813bfff9fa;
 Thu, 02 Apr 2020 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585822754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AD6n+KBMI4yDtXDNza0GnMzi5v0BBwM+iL+cgl/2+J8=;
 b=FPgqf9REoOlZW3iJfOwKvCf8O98HDotAbKo3JERkafijXPWJB58onOIq
 FN8MtG/5Mm+CzWpD740ZHRQTpWfnT7Fw7+jYTMZXWYUpHS2QK+2fGT30X
 hEQNYePvtDOeldDa/SeHTnZaiha/sKOtbYlY676D7HFMVHTGgv9hYZJWW c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LXGnhvtl0LbEKYegPnMWbxg6dYtw0N7TNPt4EZQAh/8iAKR2rFHd2I9HolsRhvtgw4fZiAlj8b
 G+RZmsKc+Ic7TlvjWBxq55+4YggPVrv/U2+XhlIXTELmyp3c5bXsT4wuAlD3OoiwK35PtK6ahy
 2d7ln0lRIwKlYKpicb7jhKCk7DfID8rC1SzfAk6H9wBp85JFAARrqFOFw7epqEXx6brU4Ie2YS
 6Q85Xy72RLcXbwOXjSm28V6rgf+L7F8UWQoJ+Ve7ZmO5NH1amoe3CRHUHfZLYPo+EmHyIP7cqh
 4vQ=
X-SBRS: 2.7
X-MesageID: 15068042
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15068042"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 4/5] x86/ucode: Drop ops->free_patch()
Date: Thu, 2 Apr 2020 11:19:01 +0100
Message-ID: <20200402101902.28234-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200402101902.28234-1-andrew.cooper3@citrix.com>
References: <20200402101902.28234-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With the newly cleaned up vendor logic, each struct microcode_patch is a
trivial object in memory with no dependent allocations.

This is unlikely to change moving forwards, and function pointers are
expensive in the days of retpoline.  Move the responsibility to xfree() back
to common code.  If the need does arise in the future, we can consider
reintroducing the hook.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c     | 6 ------
 xen/arch/x86/cpu/microcode/core.c    | 4 ++--
 xen/arch/x86/cpu/microcode/intel.c   | 6 ------
 xen/arch/x86/cpu/microcode/private.h | 5 +----
 4 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 0ca0e9a038..e23bdef6f2 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -188,11 +188,6 @@ static enum microcode_match_result microcode_fits(
     return NEW_UCODE;
 }
 
-static void free_patch(struct microcode_patch *patch)
-{
-    xfree(patch);
-}
-
 static enum microcode_match_result compare_header(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
@@ -418,6 +413,5 @@ const struct microcode_ops amd_ucode_ops = {
     .start_update                     = start_update,
     .end_update_percpu                = svm_host_osvw_init,
 #endif
-    .free_patch                       = free_patch,
     .compare_patch                    = compare_patch,
 };
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index b3e5913d49..53e447ea9a 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -243,9 +243,9 @@ static struct microcode_patch *parse_blob(const char *buf, size_t len)
     return NULL;
 }
 
-static void microcode_free_patch(struct microcode_patch *microcode_patch)
+static void microcode_free_patch(struct microcode_patch *patch)
 {
-    microcode_ops->free_patch(microcode_patch);
+    xfree(patch);
 }
 
 /* Return true if cache gets updated. Otherwise, return false */
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 9cb077b583..29745ed55f 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -245,11 +245,6 @@ static enum microcode_match_result microcode_update_match(
     return mc->rev > cpu_sig->rev ? NEW_UCODE : OLD_UCODE;
 }
 
-static void free_patch(struct microcode_patch *patch)
-{
-    xfree(patch);
-}
-
 static enum microcode_match_result compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
@@ -356,6 +351,5 @@ const struct microcode_ops intel_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
-    .free_patch                       = free_patch,
     .compare_patch                    = compare_patch,
 };
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index d31bcf14b1..878f8d805f 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -25,7 +25,7 @@ struct microcode_ops {
      *
      * If one is found, allocate and return a struct microcode_patch
      * encapsulating the appropriate microcode patch.  Does not alias the
-     * original buffer.
+     * original buffer.  Must be suitable to be freed with a single xfree().
      *
      * If one is not found, (nothing matches the current CPU), return NULL.
      * Also may return ERR_PTR(-err), e.g. bad container, out of memory.
@@ -56,9 +56,6 @@ struct microcode_ops {
      */
     void (*end_update_percpu)(void);
 
-    /* Free a patch previously allocated by cpu_request_microcode(). */
-    void (*free_patch)(struct microcode_patch *patch);
-
     /*
      * Given two patches, are they both applicable to the current CPU, and is
      * new a higher revision than old?
-- 
2.11.0


