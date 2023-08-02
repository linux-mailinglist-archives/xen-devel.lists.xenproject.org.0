Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55176CE08
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 15:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574927.900553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRBcW-00035X-9k; Wed, 02 Aug 2023 13:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574927.900553; Wed, 02 Aug 2023 13:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRBcW-00033C-6q; Wed, 02 Aug 2023 13:10:32 +0000
Received: by outflank-mailman (input) for mailman id 574927;
 Wed, 02 Aug 2023 13:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vke=DT=citrix.com=prvs=571ca8ae6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRBcU-000331-RH
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 13:10:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2d6ea2d-3135-11ee-b25f-6b7b168915f2;
 Wed, 02 Aug 2023 15:10:29 +0200 (CEST)
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
X-Inumbo-ID: f2d6ea2d-3135-11ee-b25f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690981828;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pN+ikulm61CRL3YUYcg8p+iLYA0x8CIURTvBSYwIGuQ=;
  b=GkK7mVBSq2u6IEJqziNio0zFX9sY2bQrOS+aPxQVwxtLtufrx6SM5cTe
   yLnv57sr08mnrN8IDy1KipyjWj0AKNTI7Q/m9CEKVfSr3cAizEnxXN+Uw
   sfadLEWuNIJ/EUEFAYtwz6DjwX3LxuIZAvunqcBO/9iXDa6Ewg7yBVhca
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120889552
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:kdUL3K0nU1Q7GZNya/bD5cxxkn2cJEfYwER7XKvMYLTBsI5bpzwGm
 DAWWjuFbP2LamDzetkiPI6/oB4BuZeEyNUxGwtlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxmP6gS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfQkJF0
 NAVCj02Qy+8htCUn4qJdvMvv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8NzhbJ+
 z+cl4j/KiMCM9Cw9QWiy2ClrKyfjD72aak0SrLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC0
 F6CmNfgQyJirKeUT3O1/Kqbtj60Nm4eKmpqWMMfZVJbuZ+5+th110+RCI85S8ZZk+EZBxmz4
 DuvgCUcio4+svEK5YfkxWL7mXGV882hohEO2unHYo60xlonNdb0Ptb0sQCzAeVod9jAEATY1
 JQQs43Htb1VU8nQ/MCYaL9VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+yzMUJVJdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDBhzG0zBh9wPBmY
 P93lPpA6l5DWMxaIMeeHb9BgdfHOAhgrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+W3oH
 yJkH5LSkX13CbSuChQ7BKZPdTjm21BnX8GpwyGWH8bfSjdb9JYJVqeNmuh+INM790mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:54CkdK6zOTmgfuTqCwPXwUGBI+orL9Y04lQ7vn2ZESYlCvBxl6
 iV/MjzpiWEygr5OUtQ3OxoXZPqfZqyz+8Q3WB8B9mftUzdyRKVxeJZnPzfKl/bakrDH4dmvM
 8LH8dD4Z/LfD5HZK3BkWqF+qMbsby6GdeT9IXjJhlWLD2DxspbgjtRO0K+KAlbVQNGDZ02GN
 63/cxcvQetfnwRc4CSGmQFd/KrnayDqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 n+lRDj7KnLiYDy9vac7R6Z031loqqt9jJxPr3BtiHTEESitu+cXvUqZ1RFhkF6nAjg0idqrD
 CGmWZaAy060QKqQokzyiGdmDUJBF0Vmj/fIBmj8A3eiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfGH9dQnGlqj1vitR5zmJiGtnlfRWg21UUIMYZrMUpYsD/FlNGJNFGC7h8ogoHO
 RnEcmZvZ9tACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39F/pMgTJtP4f
 jCL81T5cRzZ95Tabg4CPYKQMOxBGCISRXQMHiKKVCiD60DM2Klke+H3Fz03pDVRHUl9upMpH
 2aaiIkiYcbQTOTNfGz
X-Talos-CUID: 9a23:elNd/2yW2z7EziqLijI5BgVXOcsAXnD/wUz9HHC5O0Q2cI+pUxyprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AGea6gQxldMitsp1cmVbUITasMnOaqJa2D0wirao?=
 =?us-ascii?q?hgtuNH28gKiqQvR+RHIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,249,1684814400"; 
   d="scan'208";a="120889552"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2] x86/gen-cpuid: Avoid violations of Misra rule 1.3
Date: Wed, 2 Aug 2023 14:10:03 +0100
Message-ID: <20230802131003.166670-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add the script to the X86 section in ./MAINTAINERS.

Structures or unions without any named members aren't liked by Misra
(nor the C standard). Avoid emitting such for leaves without any known
bits.

The placeholders are affected similarly, but are only visible to MISRA in the
middle of a patch series adding a new leaf.  The absence of a name was
intentional as these defines need to not duplicate names.

As that's not deemed acceptable any more, move placeholder processing into the
main loop and append the the word number to generate unique names.

  $ diff cpuid-autogen-{before,after}.h
  @@ -1034,7 +1034,7 @@
       bool intel_psfd:1, ipred_ctrl:1, rrsba_ctrl:1, ddp_ctrl:1,     ...

   #define CPUID_BITFIELD_14 \
  -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
  +    uint32_t _placeholder_14

   #define CPUID_BITFIELD_15 \
       bool :1, :1, :1, :1, avx_vnni_int8:1, avx_ne_convert:1, :1,    ...
  @@ -1043,19 +1043,19 @@
       bool rdcl_no:1, eibrs:1, rsba:1, skip_l1dfl:1, intel_ssb_no:1, ...

   #define CPUID_BITFIELD_17 \
  -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
  +    uint32_t _placeholder_17

   #define CPUID_BITFIELD_18 \
  -    uint32_t :32 /* placeholder */
  +    uint32_t _placeholder_18

   #define CPUID_BITFIELD_19 \
  -    uint32_t :32 /* placeholder */
  +    uint32_t _placeholder_19

   #define CPUID_BITFIELD_20 \
  -    uint32_t :32 /* placeholder */
  +    uint32_t _placeholder_20

   #define CPUID_BITFIELD_21 \
  -    uint32_t :32 /* placeholder */
  +    uint32_t _placeholder_21

   #endif /* __XEN_X86__FEATURESET_DATA__ */

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * Write it more pythonically.  Fix up the placeholders too.
---
 MAINTAINERS            |  1 +
 xen/tools/gen-cpuid.py | 11 ++++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8a02a6c1918..a0805d35cd71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -601,6 +601,7 @@ F:	xen/arch/x86/
 F:	xen/include/public/arch-x86/
 F:	xen/include/xen/lib/x86
 F:	xen/lib/x86
+F:	xen/tools/gen-cpuid.py
 F:	tools/firmware/hvmloader/
 F:	tools/firmware/rombios/
 F:	tools/firmware/vgabios/
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 72cf11654ba9..5797bc64c803 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -363,8 +363,8 @@ def crunch_numbers(state):
     state.deep_features = deps.keys()
     state.nr_deep_deps = len(state.deep_deps.keys())
 
-    # Calculate the bitfield name declarations
-    for word in range(state.nr_entries):
+    # Calculate the bitfield name declarations.  Leave 4 placeholders on the end
+    for word in range(state.nr_entries + 4):
 
         names = []
         for bit in range(32):
@@ -382,7 +382,10 @@ def crunch_numbers(state):
 
             names.append(name.lower())
 
-        state.bitfields.append("bool " + ":1, ".join(names) + ":1")
+        if any(names):
+            state.bitfields.append("bool " + ":1, ".join(names) + ":1")
+        else:
+            state.bitfields.append("uint32_t _placeholder_%s" % (word, ))
 
 
 def write_results(state):
@@ -464,8 +467,6 @@ def write_results(state):
 
 """)
 
-    state.bitfields += ["uint32_t :32 /* placeholder */"] * 4
-
     for idx, text in enumerate(state.bitfields):
         state.output.write(
             "#define CPUID_BITFIELD_%d \\\n    %s\n\n"

base-commit: 51588938e0cd0e02dbc1d6d8c697c577135ff666
-- 
2.30.2


