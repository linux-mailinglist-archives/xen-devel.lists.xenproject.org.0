Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D688F6D5C88
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517768.803602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRm-0004sQ-9Z; Tue, 04 Apr 2023 09:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517768.803602; Tue, 04 Apr 2023 09:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRm-0004qn-4K; Tue, 04 Apr 2023 09:59:26 +0000
Received: by outflank-mailman (input) for mailman id 517768;
 Tue, 04 Apr 2023 09:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdMG-00056d-FQ
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:53:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9433838d-d2ce-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 11:53:42 +0200 (CEST)
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
X-Inumbo-ID: 9433838d-d2ce-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680602022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ChH0mv0WlkWt8mC9RVpMxMqX69igiduH8qj4IJ/OTlE=;
  b=SQUbV8GVwRO3uvUSYpX7wEh1Eu7H6jlNWovrOVwJbiFjpOHwF7RePZTB
   phvODEYxBcx1TfzkB4RH9RqXaWEF/I5fQwyXJN7cXiI4EOk7RjFMqWrpA
   fc3UkJ16A2c6Ri52zsC0abLudmRSLCb6FNap6UuDq7+HlyNFBuskcu6ts
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104275209
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jOR9b6rJqOdbVVFSZpebUQeba2NeBmJnZRIvgKrLsJaIsI4StFCzt
 garIBmFMvyOZmSmctF2bo+w8h5QuZCBzdM1SVBvqSo3FCpHoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzyVNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABE1cyvcwN+d+4OmEuBi2f94IMvOOLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jueoz6mX0tCZbRzzxKGqHGNgM/DzBjaY4EYSoGRyfpj2UO6kzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMk28TY/8YOpSn+U45qHvGO1dH3PDXJl
 mXiQDcFu1kDsSIa//zlrQia3Gz2+cGhoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTYm5CKGONYAQMvCdkTNrGwk3PSatM53FyhBwwcnTx
 7/AGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+ieD2TCfMGd843K6mMrhRAFWs/F+Er
 L6y9qKil31ibQEJSnKIrtJJdAxVdChT6FKfg5U/S9Nv6zFOQAkJY8I9C5t6E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:VwSaD63tK3JQsKmUXOpa4QqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104275209"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 13/15] tools/fuzz: Rework afl-policy-fuzzer
Date: Tue, 4 Apr 2023 10:52:20 +0100
Message-ID: <20230404095222.1373721-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With cpuid_policy and msr_policy merged to form cpu_policy, merge the
respective fuzzing logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c | 57 ++++++++---------------
 1 file changed, 20 insertions(+), 37 deletions(-)

diff --git a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
index 0ce3d8e16626..466bdbb1d91a 100644
--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -16,16 +16,19 @@ static bool debug;
 
 #define EMPTY_LEAF ((struct cpuid_leaf){})
 
-static void check_cpuid(struct cpuid_policy *cp)
+static void check_policy(struct cpu_policy *cp)
 {
-    struct cpuid_policy new = {};
+    struct cpu_policy new = {};
     size_t data_end;
     xen_cpuid_leaf_t *leaves = malloc(CPUID_MAX_SERIALISED_LEAVES *
                                       sizeof(xen_cpuid_leaf_t));
-    unsigned int nr = CPUID_MAX_SERIALISED_LEAVES;
+    xen_msr_entry_t *msrs = malloc(MSR_MAX_SERIALISED_ENTRIES *
+                                   sizeof(xen_cpuid_leaf_t));
+    unsigned int nr_leaves = CPUID_MAX_SERIALISED_LEAVES;
+    unsigned int nr_msrs = MSR_MAX_SERIALISED_ENTRIES;
     int rc;
 
-    if ( !leaves )
+    if ( !leaves || !msrs )
         return;
 
     /*
@@ -49,12 +52,19 @@ static void check_cpuid(struct cpuid_policy *cp)
     x86_cpuid_policy_recalc_synth(cp);
 
     /* Serialise... */
-    rc = x86_cpuid_copy_to_buffer(cp, leaves, &nr);
+    rc = x86_cpuid_copy_to_buffer(cp, leaves, &nr_leaves);
+    assert(rc == 0);
+    assert(nr_leaves <= CPUID_MAX_SERIALISED_LEAVES);
+
+    rc = x86_msr_copy_to_buffer(cp, msrs, &nr_msrs);
     assert(rc == 0);
-    assert(nr <= CPUID_MAX_SERIALISED_LEAVES);
+    assert(nr_msrs <= MSR_MAX_SERIALISED_ENTRIES);
 
     /* ... and deserialise. */
-    rc = x86_cpuid_copy_from_buffer(&new, leaves, nr, NULL, NULL);
+    rc = x86_cpuid_copy_from_buffer(&new, leaves, nr_leaves, NULL, NULL);
+    assert(rc == 0);
+
+    rc = x86_msr_copy_from_buffer(&new, msrs, nr_msrs, NULL);
     assert(rc == 0);
 
     /* The result after serialisation/deserialisaion should be identical... */
@@ -76,28 +86,6 @@ static void check_cpuid(struct cpuid_policy *cp)
     free(leaves);
 }
 
-static void check_msr(struct msr_policy *mp)
-{
-    struct msr_policy new = {};
-    xen_msr_entry_t *msrs = malloc(MSR_MAX_SERIALISED_ENTRIES *
-                                   sizeof(xen_msr_entry_t));
-    unsigned int nr = MSR_MAX_SERIALISED_ENTRIES;
-    int rc;
-
-    if ( !msrs )
-        return;
-
-    rc = x86_msr_copy_to_buffer(mp, msrs, &nr);
-    assert(rc == 0);
-    assert(nr <= MSR_MAX_SERIALISED_ENTRIES);
-
-    rc = x86_msr_copy_from_buffer(&new, msrs, nr, NULL);
-    assert(rc == 0);
-    assert(memcmp(mp, &new, sizeof(*mp)) == 0);
-
-    free(msrs);
-}
-
 int main(int argc, char **argv)
 {
     FILE *fp = NULL;
@@ -144,8 +132,7 @@ int main(int argc, char **argv)
     while ( __AFL_LOOP(1000) )
 #endif
     {
-        struct cpuid_policy *cp = NULL;
-        struct msr_policy *mp = NULL;
+        struct cpu_policy *cp = NULL;
 
         if ( fp != stdin )
         {
@@ -160,22 +147,18 @@ int main(int argc, char **argv)
         }
 
         cp = calloc(1, sizeof(*cp));
-        mp = calloc(1, sizeof(*mp));
-        if ( !cp || !mp )
+        if ( !cp )
             goto skip;
 
         fread(cp, sizeof(*cp), 1, fp);
-        fread(mp, sizeof(*mp), 1, fp);
 
         if ( !feof(fp) )
             goto skip;
 
-        check_cpuid(cp);
-        check_msr(mp);
+        check_policy(cp);
 
     skip:
         free(cp);
-        free(mp);
 
         if ( fp != stdin )
         {
-- 
2.30.2


