Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489A5F472A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 18:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415697.660340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkTK-0006cV-38; Tue, 04 Oct 2022 16:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415697.660340; Tue, 04 Oct 2022 16:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofkTJ-0006YC-UY; Tue, 04 Oct 2022 16:08:41 +0000
Received: by outflank-mailman (input) for mailman id 415697;
 Tue, 04 Oct 2022 16:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YyPd=2F=citrix.com=prvs=269269faf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ofkTJ-0006Sk-1t
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 16:08:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf0838a7-43fe-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 18:08:39 +0200 (CEST)
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
X-Inumbo-ID: cf0838a7-43fe-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664899719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JzNhcqciVpnoKEV6ma2MCgYp+/vDnI0tLk69rJMGEXk=;
  b=O++ivkWVztbeKBFM3g57wUigkZeEcKss7yF+qlpPzYw8442LQjBXzIx9
   S1L80Tv1sUt4GHLeSVSBqOQSuxmDsPba8s+6iPpl0k+OJ0aFQXV7qSgb6
   dAjqTnEvPT11k2T1vpDMhGq43HzCXCON+z5+FQkctjEQYpvs9m6pRe1hx
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 84478271
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q+wl+qvUysOPWi3eBaCGPFMz/efnVIFeMUV32f8akzHdYApBsoF/q
 tZmKWnSaPiPNjf9KdBxOoXlphgBvJHcy9RhT1NkqCk9EixD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPagX5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl23
 uBFDCorbSmnqMGd0Lfme8xMpe4aeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZUJwhnI/
 D2fl4j/KgwbZdOV7jqkzimlgbLuniDqd68dKrLto5aGh3XMnzdOWXX6T2CTgfS/kF/4ZNtZJ
 GQd4C9opq83nGSuR8P4Vge1o1aFuAAdQNtaF+Am6ACLxbHQ6gzfDW8BJhZNZdknnM4wWz0x1
 1WNks/pBDpgq7mcQzSW8bL8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXdOxv93
 jSLpygWnKgIgIgA0KDT1U/DqyKhoN7OVAFd2+nMdjv7tEUjPtfjPtH2rwiAhRpdEGqHZmGqo
 CUgge6d1cQhLrqdkXG8ZcUuNoj8sp5pLwbgqVJoGpAg8RGk9HiiYZ1c7VlCGat5DioXUWS3O
 RGO4Gu98LcWZSL3NvEvP+pdHuxwlcDd+cLZuuc4hzakSrx4b0e58S5nfiZ8NEi9wRF3wcnT1
 Xp2GPtA7Er264w9lVJapM9Hi9fHIxzSIkuMLa0XNzz9jdKjiIe9EN/pymemYOEj97+jqw7I6
 dtZPMbi40wBDrGuOHOMod5Ncw9iwZ0H6Xfe9KRqmhOreFI6SAnN9deIqV/eR2CVt/sMzbqZl
 p1MckRZ1ED+lRX6FOl+UVg6MeuHYHqKhShkVcDaFQr3hiNLjEfGxPt3SqbbipF+r707kqQkE
 qZtlgfpKq0ndwkrMg81NfHVxLGOvjzw7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:2VHCt6uEgNy0BHGMmJ8lGVl77skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.95,158,1661832000"; 
   d="scan'208";a="84478271"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
Subject: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature identifiers
Date: Tue, 4 Oct 2022 17:08:09 +0100
Message-ID: <20221004160810.25364-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221004160810.25364-1-andrew.cooper3@citrix.com>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A future change will want a cpuid-like identifier which doesn't have a mapping
to a feature bit.

 * Pass the feature name into the parse callback.
 * Exclude a feature value of ~0u from falling into the general set/clear bit
   paths.
 * In gen-cpuid.py, insert a placeholder to collect all the pseudo feature
   names.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/cpuid.c   | 17 +++++++++++++----
 xen/tools/gen-cpuid.py | 13 +++++++++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 822f9ace1087..112ee63a9449 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -39,7 +39,8 @@ static const struct feature_name {
  * function pointer call in the middle of the loop.
  */
 static int __init always_inline parse_cpuid(
-    const char *s, void (*callback)(unsigned int feat, bool val))
+    const char *s, void (*callback)(const char *name,
+                                    unsigned int feat, bool val))
 {
     const char *ss;
     int val, rc = 0;
@@ -81,7 +82,7 @@ static int __init always_inline parse_cpuid(
 
             if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
             {
-                callback(mid->bit, val);
+                callback(mid->name, mid->bit, val);
                 mid = NULL;
             }
 
@@ -101,8 +102,12 @@ static int __init always_inline parse_cpuid(
     return rc;
 }
 
-static void __init cf_check _parse_xen_cpuid(unsigned int feat, bool val)
+static void __init cf_check _parse_xen_cpuid(
+    const char *name, unsigned int feat, bool val)
 {
+    if ( unlikely(feat == ~0u) )
+        return;
+
     if ( !val )
         setup_clear_cpu_cap(feat);
     else if ( feat == X86_FEATURE_RDRAND &&
@@ -120,8 +125,12 @@ static bool __initdata dom0_cpuid_cmdline;
 static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
 static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
 
-static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
+static void __init cf_check _parse_dom0_cpuid(
+    const char *name, unsigned int feat, bool val)
 {
+    if ( unlikely(feat == ~0u) )
+        return;
+
     __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
     __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
 }
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 4f7c8d78cce7..f3045b3bfd36 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -297,6 +297,19 @@ def crunch_numbers(state):
         RTM: [TSXLDTRK],
     }
 
+    #
+    # Pseudo feature names.  These don't map to a feature bit, but are
+    # inserted into the values dictionary so they can be parsed and handled
+    # specially
+    #
+    pseduo_names = (
+    )
+
+    for n in pseduo_names:
+        if n in state.values:
+            raise Fail("Pseduo feature name %s aliases real feature" % (n, ))
+        state.values[n] = 0xffffffff
+
     deep_features = tuple(sorted(deps.keys()))
     state.deep_deps = {}
 
-- 
2.11.0


