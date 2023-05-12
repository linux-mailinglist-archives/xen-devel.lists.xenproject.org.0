Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9A700854
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 14:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533824.830773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxSA4-0003JY-BG; Fri, 12 May 2023 12:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533824.830773; Fri, 12 May 2023 12:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxSA4-0003Hi-6u; Fri, 12 May 2023 12:46:16 +0000
Received: by outflank-mailman (input) for mailman id 533824;
 Fri, 12 May 2023 12:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zhAz=BB=citrix.com=prvs=489789326=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pxSA2-0003Hc-Ti
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 12:46:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f92cf0c2-f0c2-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 14:46:13 +0200 (CEST)
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
X-Inumbo-ID: f92cf0c2-f0c2-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683895573;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WAWUD+wNEpNVus+oB8cf4wiPLRwZUJ4zcYOUBw6BpT8=;
  b=LSQHzwW8hC2li6k5j8QrCXgkRTHjKzdreItniUAkNySD7GOF/f/S0VHQ
   giUKa+o0bzAN/jzkImwNBhDGlXiY+y1eHXNMR1iRjps4ImGgeRtlb5Fo3
   rbDqwLUe84HiWZSYO/cuWALIEBjOE/hM8czyhrQ5MA9cXLkrReyRgZlO6
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107567557
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:C0KgG66nVGQVCoh5dL8OHwxRtDHHchMFZxGqfqrLsTDasY5as4F+v
 jYZCjvXb/+ONjOhctF2PNmw9EoB78ODm9c3Gwts+ykwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S5geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 PsDJi40X0+6nOPs0qmKZ+k2h8YqM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7H+
 zyZojmmav0cHMafzQOF7kqovc3ekizncZM5SKWk0sc/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTTIDVgUb2ui8mZoy1ADUf/tjSq+3h8KgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKuFmSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrHo+PhbKjz60zRVEfUQD1
 XCzL66R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5AMKLPcc1c9SAnMyZb5mNscRmCspIwN/s+gw
 513chMwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:/tXzxaGVUGLdllpmpLqEyceALOsnbusQ8zAXPiFKOGVom6mj9/
 xG885rtiMc5AxhOk3I4OrwXpVoIkmskKKdn7NhR4tKNTOO0ACVxedZnPPfKlbbakrDH4BmpN
 xdm68XMrPN5Q8Tt6rHCBvRKbcdKMruys+Vbfe39R1QpRsDUcxdBq5Ce2KmLnE=
X-Talos-CUID: 9a23:qngoxm7b2vDLXXZ7Otss6UkPFN4cQyLk13aKMVSJJGYzSb+cVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ACpPyKQwaYqwLLGrpT17onvJmAzSaqL6uDHkNja0?=
 =?us-ascii?q?CgOuVOiNsEia20CyrZrZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,269,1677560400"; 
   d="scan'208";a="107567557"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/cpuid: Calculate FEATURESET_NR_ENTRIES more helpfully
Date: Fri, 12 May 2023 13:45:51 +0100
Message-ID: <20230512124551.443139-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When adding new featureset words, it is convenient to split the work into
several patches.  However, GCC 12 spotted that the way we prefer to split the
work results in a real (transient) breakage whereby the policy <-> featureset
helpers perform out-of-bounds accesses on the featureset array.

Fix this by having gen-cpuid.py calculate FEATURESET_NR_ENTRIES from the
comments describing the word blocks, rather than from the XEN_CPUFEATURE()
with the greatest value.

For simplicty, require that the word blocks appear in order.  This can be
revisted if we find a good reason to have blocks out of order.

No functional change.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This supercedes the entire "x86: Fix transient build breakage with featureset
additions" series, but doesn't really feel as if it ought to be labelled v2
---
 xen/tools/gen-cpuid.py | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 0edb7d4a19f8..e0664e0defe1 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -50,13 +50,37 @@ def parse_definitions(state):
         "\s+([\s\d]+\*[\s\d]+\+[\s\d]+)\)"
         "\s+/\*([\w!]*) .*$")
 
+    word_regex = re.compile(
+        r"^/\* .* word (\d*) \*/$")
+    last_word = -1
+
     this = sys.modules[__name__]
 
     for l in state.input.readlines():
-        # Short circuit the regex...
-        if not l.startswith("XEN_CPUFEATURE("):
+
+        # Short circuit the regexes...
+        if not (l.startswith("XEN_CPUFEATURE(") or
+                l.startswith("/* ")):
             continue
 
+        # Handle /* ... word $N */ lines
+        if l.startswith("/* "):
+
+            res = word_regex.match(l)
+            if res is None:
+                continue # Some other comment
+
+            word = int(res.groups()[0])
+
+            if word != last_word + 1:
+                raise Fail("Featureset word %u out of order (last word %u)"
+                           % (word, last_word))
+
+            last_word = word
+            state.nr_entries = word + 1
+            continue
+
+        # Handle XEN_CPUFEATURE( lines
         res = feat_regex.match(l)
 
         if res is None:
@@ -94,6 +118,15 @@ def parse_definitions(state):
     if len(state.names) == 0:
         raise Fail("No features found")
 
+    if state.nr_entries == 0:
+        raise Fail("No featureset word info found")
+
+    max_val = max(state.names.keys())
+    if (max_val >> 5) + 1 > state.nr_entries:
+        max_name = state.names[max_val]
+        raise Fail("Feature %s (%d*32+%d) exceeds FEATURESET_NR_ENTRIES (%d)"
+                   % (max_name, max_val >> 5, max_val & 31, state.nr_entries))
+
 def featureset_to_uint32s(fs, nr):
     """ Represent a featureset as a list of C-compatible uint32_t's """
 
@@ -122,9 +155,6 @@ def format_uint32s(state, featureset, indent):
 
 def crunch_numbers(state):
 
-    # Size of bitmaps
-    state.nr_entries = nr_entries = (max(state.names.keys()) >> 5) + 1
-
     # Features common between 1d and e1d.
     common_1d = (FPU, VME, DE, PSE, TSC, MSR, PAE, MCE, CX8, APIC,
                  MTRR, PGE, MCA, CMOV, PAT, PSE36, MMX, FXSR)
@@ -328,7 +358,7 @@ def crunch_numbers(state):
     state.nr_deep_deps = len(state.deep_deps.keys())
 
     # Calculate the bitfield name declarations
-    for word in range(nr_entries):
+    for word in range(state.nr_entries):
 
         names = []
         for bit in range(32):
-- 
2.30.2


