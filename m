Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A9199321
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmJ-0005p0-0s; Tue, 31 Mar 2020 10:05:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmH-0005o6-8x
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:49 +0000
X-Inumbo-ID: 2f649310-7337-11ea-ba0b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f649310-7337-11ea-ba0b-12813bfff9fa;
 Tue, 31 Mar 2020 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Rpc+u7yewDKCwasBqxPdMtiKb7w5ItgKOuQREKX64k=;
 b=MlS1y7ZzkI85eiQiiHF4PvDTodsN3LztDnH5CuKnTHkRUQYENuyji75d
 +MaWKOpRyneaF1hTBZgAW/92FlEHCM68+SpPYQXfi8PIA/3IMND00yH/F
 VFGve12kTHcHuxYK3pCu37j22yoXns4Pi1vgDWXcDt8m3EZMElPU9Plw+ s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tW0ZKWaHqITBnQUfNXWyyeP5LgTUL9itJB1I3I63diIB+Q8ORzkjBwhZtdumqQDWN86wXLJjNp
 rdb7qQ/gRgIOdSjlcP3qkNnHZyYaEXJRI0Jx/noDsFH5SUtpGWYKWIZRoblGGoOND45AxfELHp
 Pu3i9lM52Exgeu5hggS0oLBy4Z9dFqfiFAJ3hYPRf8YMPFr4cBSz7YEcuH5SQzik5+N5ZHGike
 +ACKIH83Fa83xxch6md5Svpe0Yd4edwCyPSvYqyTWRNJ3+EscP5qVeXEMwH4GQsiPybmX7X57K
 NPk=
X-SBRS: 2.7
X-MesageID: 15245336
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15245336"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 05/11] x86/ucode/amd: Overhaul the equivalent cpu table
 handling completely
Date: Tue, 31 Mar 2020 11:05:25 +0100
Message-ID: <20200331100531.4294-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200331100531.4294-1-andrew.cooper3@citrix.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
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

We currently copy the entire equivalency table, and the single correct
microcode.  This is not safe to heterogeneous scenarios, and as Xen doesn't
support such situations to being with, can be used to simplify things further.

The CPUID.1.EAX => processor_rev_id mapping is fixed for an individual part.
We can cache the single appropriate entry on first discovery, and forgo
duplicating the entire table.

Alter install_equiv_cpu_table() to be scan_equiv_cpu_table() which is
responsible for checking the equivalency table and caching appropriate
details.  It now has a check for finding a different mapping (which indicates
that one of the tables we've seen is definitely wrong).

A return value of -ESRCH is now used to signify "everything fine, but nothing
applicable for the current CPU", which is used to select the
container_fast_forward() path.

Drop the printk(), as each applicable error path in scan_equiv_cpu_table()
already prints diagnostics.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

Naming of 'equiv' subject to improvement.

An alternative would be to embed the full equivelancy table, but it is fairly
large, and would need adjusting every time a new model/stepping was released.
---
 xen/arch/x86/cpu/microcode/amd.c | 112 ++++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index d2ecc7ae87..d3439b0c6c 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -61,8 +61,6 @@ struct __packed microcode_header_amd {
 struct microcode_patch {
     struct microcode_header_amd *mpb;
     size_t mpb_size;
-    struct equiv_cpu_entry *equiv_cpu_table;
-    size_t equiv_cpu_table_size;
 };
 
 /* Temporary, until the microcode_* structure are disentangled. */
@@ -74,6 +72,31 @@ struct mpbhdr {
     uint8_t data[];
 };
 
+/*
+ * Microcode updates for different CPUs are distinguished by their
+ * processor_rev_id in the header.  This denotes the format of the internals
+ * of the microcode engine, and is fixed for an individual CPU.
+ *
+ * There is a mapping from the CPU signature (CPUID.1.EAX -
+ * family/model/stepping) to the "equivalent CPU identifier" which is
+ * similarly fixed.  In some cases, multiple different CPU signatures map to
+ * the same equiv_id for processor lines which share identical microcode
+ * facilities.
+ *
+ * This mapping can't be calculated in the general case, but is provided in
+ * the microcode container, so the correct piece of microcode for the CPU can
+ * be identified.  We cache it the first time we encounter the correct mapping
+ * for this system.
+ *
+ * Note: for now, we assume a fully homogeneous setup, meaning that there is
+ * exactly one equiv_id we need to worry about for microcode blob
+ * identification.  This may need revisiting in due course.
+ */
+static struct {
+    uint32_t sig;
+    uint16_t id;
+} equiv __read_mostly;
+
 /* See comment in start_update() for cases when this routine fails */
 static int collect_cpu_info(struct cpu_signature *csig)
 {
@@ -150,40 +173,15 @@ static bool check_final_patch_levels(const struct cpu_signature *sig)
     return false;
 }
 
-static bool_t find_equiv_cpu_id(const struct equiv_cpu_entry *equiv_cpu_table,
-                                unsigned int current_cpu_id,
-                                unsigned int *equiv_cpu_id)
-{
-    unsigned int i;
-
-    if ( !equiv_cpu_table )
-        return 0;
-
-    for ( i = 0; equiv_cpu_table[i].installed_cpu != 0; i++ )
-    {
-        if ( current_cpu_id == equiv_cpu_table[i].installed_cpu )
-        {
-            *equiv_cpu_id = equiv_cpu_table[i].equiv_cpu & 0xffff;
-            return 1;
-        }
-    }
-
-    return 0;
-}
-
 static enum microcode_match_result microcode_fits(
     const struct microcode_amd *mc_amd)
 {
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     const struct microcode_header_amd *mc_header = mc_amd->mpb;
-    const struct equiv_cpu_entry *equiv_cpu_table = mc_amd->equiv_cpu_table;
-    unsigned int equiv_cpu_id;
 
-    if ( !find_equiv_cpu_id(equiv_cpu_table, sig->sig, &equiv_cpu_id) )
-        return MIS_UCODE;
-
-    if ( (mc_header->processor_rev_id) != equiv_cpu_id )
+    if ( equiv.sig != sig->sig ||
+         equiv.id  != mc_header->processor_rev_id )
         return MIS_UCODE;
 
     if ( !verify_patch_size(mc_amd->mpb_size) )
@@ -213,7 +211,6 @@ static void free_patch(struct microcode_patch *mc_amd)
 {
     if ( mc_amd )
     {
-        xfree(mc_amd->equiv_cpu_table);
         xfree(mc_amd->mpb);
         xfree(mc_amd);
     }
@@ -335,14 +332,15 @@ static int get_ucode_from_buffer_amd(
     return 0;
 }
 
-static int install_equiv_cpu_table(
-    struct microcode_amd *mc_amd,
+static int scan_equiv_cpu_table(
     const void *data,
     size_t size_left,
     size_t *offset)
 {
+    const struct cpu_signature *sig = &this_cpu(cpu_sig);
     const struct mpbhdr *mpbuf;
     const struct equiv_cpu_entry *eq;
+    unsigned int i, nr;
 
     if ( size_left < (sizeof(*mpbuf) + 4) ||
          (mpbuf = data + *offset + 4,
@@ -362,19 +360,45 @@ static int install_equiv_cpu_table(
 
     if ( mpbuf->len == 0 || mpbuf->len % sizeof(*eq) ||
          (eq = (const void *)mpbuf->data,
-          eq[(mpbuf->len / sizeof(*eq)) - 1].installed_cpu) )
+          nr = mpbuf->len / sizeof(*eq),
+          eq[nr - 1].installed_cpu) )
     {
         printk(KERN_ERR "microcode: Wrong microcode equivalent cpu table length\n");
         return -EINVAL;
     }
 
-    mc_amd->equiv_cpu_table = xmemdup_bytes(mpbuf->data, mpbuf->len);
-    if ( !mc_amd->equiv_cpu_table )
-        return -ENOMEM;
+    /* Search the equiv_cpu_table for the current CPU. */
+    for ( i = 0; i < nr && eq[i].installed_cpu; ++i )
+    {
+        if ( eq[i].installed_cpu != sig->sig )
+            continue;
 
-    mc_amd->equiv_cpu_table_size = mpbuf->len;
+        if ( !equiv.sig ) /* Cache details on first find. */
+        {
+            equiv.sig = sig->sig;
+            equiv.id  = eq[i].equiv_cpu;
+            return 0;
+        }
 
-    return 0;
+        if ( equiv.sig != sig->sig || equiv.id != eq[i].equiv_cpu )
+        {
+            /*
+             * This can only occur if two equiv tables have been seen with
+             * different mappings for the same CPU.  The mapping is fixed, so
+             * one of the tables is wrong.  As we can't calculate the mapping,
+             * we trusted the first table we saw.
+             */
+            printk(XENLOG_ERR
+                   "microcode: Equiv mismatch: cpu %08x, got %04x, cached %04x\n",
+                   sig->sig, eq[i].equiv_cpu, equiv.id);
+            return -EINVAL;
+        }
+
+        return 0;
+    }
+
+    /* equiv_cpu_table was fine, but nothing found for the current CPU. */
+    return -ESRCH;
 }
 
 static int container_fast_forward(const void *data, size_t size_left, size_t *offset)
@@ -417,7 +441,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
     struct microcode_patch *patch = NULL;
     size_t offset = 0, saved_size = 0;
     int error = 0;
-    unsigned int equiv_cpu_id;
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
 
@@ -444,15 +467,9 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
      */
     while ( offset < bufsize )
     {
-        error = install_equiv_cpu_table(mc_amd, buf, bufsize - offset, &offset);
-        if ( error )
-        {
-            printk(KERN_ERR "microcode: installing equivalent cpu table failed\n");
-            break;
-        }
+        error = scan_equiv_cpu_table(buf, bufsize - offset, &offset);
 
-        if ( find_equiv_cpu_id(mc_amd->equiv_cpu_table, sig->sig,
-                               &equiv_cpu_id) )
+        if ( !error || error != -ESRCH )
             break;
 
         error = container_fast_forward(buf, bufsize - offset, &offset);
@@ -479,7 +496,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
         if ( error == -ENODATA )
             error = 0;
 
-        xfree(mc_amd->equiv_cpu_table);
         xfree(mc_amd);
         goto out;
     }
-- 
2.11.0


