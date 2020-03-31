Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB52199351
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:20:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDxO-0007i7-Sv; Tue, 31 Mar 2020 10:17:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDxO-0007hw-Ba
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:17:18 +0000
X-Inumbo-ID: cc17a1a6-7338-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc17a1a6-7338-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HSKZ3OMvp/7K7T9ZRXW7lMybpFT8eMk17SlQVN7Z5zQ=;
 b=aheJTwknl03Q5IOfEipPXHSKSg4TTz80Bzn7CkgwUS3XjX8tFj0lvWe4
 CLQMX6vlpE42l3LjmhD4qoKc+z8wYsyVsMu6JTdBYRuXIhzf/qy77tTvH
 EGZAD4bhk7+R240FwhLxkliKtahD8qaTo8vVSu3ttOzz0zQOh05x5JMH+ w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pdpA6ofa7fgicRboqqYoeuMfgs6cIv1oudwzviWO3E4dPHh0hNtxYlzFFsVtovVAKJ/Ud8jj93
 8MzbvK+uEdd8jhcaBPHXmH+xwmrtWoZLdO4bTfOWBi+n8YSDtLW8IvFmJkuxYK/Gsmv3RtJwXe
 nxvymjK94KFWf+E0B8bJSViHt09HjOXTGIbmJsmMlujo/tSaN2r02m6N3eoKNQQklyxLpZn+yJ
 ySBHALfy5z/kJhWlG9PCHNRNV2GGfYj5icoDFKJRv9cwjNvDrh8MmkGdaI+ZwEzfMPCNkrKFVw
 35g=
X-SBRS: 2.7
X-MesageID: 14903418
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14903418"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 11/11] x86/ucode/amd: Rework parsing logic in
 cpu_request_microcode()
Date: Tue, 31 Mar 2020 11:05:31 +0100
Message-ID: <20200331100531.4294-12-andrew.cooper3@citrix.com>
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

cpu_request_microcode() is still a confusing mess to follow, with sub
functions responsible for maintaining offset.  Rewrite it so all container
structure handling is in this one function.

Rewrite struct mpbhdr as struct container_equiv_table to aid parsing.  Drop
container_fast_forward() entirely, and shrink scan_equiv_cpu_table() to just
its searching/caching logic.

container_fast_forward() gets logically folded into the microcode blob
scanning loop, except that a skip path is inserted, which is conditional on
whether scan_equiv_cpu_table() thinks there is appropriate microcode to find.

With this change, we now scan to the end of all provided microcode containers,
and no longer give up at the first applicable one.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 169 ++++++++++-----------------------------
 1 file changed, 44 insertions(+), 125 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index f9c50b43bf..0ada50797b 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -25,10 +25,6 @@
 
 #define pr_debug(x...) ((void)0)
 
-#define CONT_HDR_SIZE           12
-#define SECTION_HDR_SIZE        8
-#define PATCH_HDR_SIZE          32
-
 struct __packed equiv_cpu_entry {
     uint32_t installed_cpu;
     uint32_t fixed_errata_mask;
@@ -58,10 +54,10 @@ struct microcode_patch {
 #define UCODE_EQUIV_CPU_TABLE_TYPE 0x00000000
 #define UCODE_UCODE_TYPE           0x00000001
 
-struct mpbhdr {
-    uint32_t type;
+struct container_equiv_table {
+    uint32_t type; /* UCODE_EQUIV_CPU_TABLE_TYPE */
     uint32_t len;
-    uint8_t data[];
+    struct equiv_cpu_entry eq[];
 };
 struct container_microcode {
     uint32_t type; /* UCODE_UCODE_TYPE */
@@ -269,55 +265,25 @@ static int apply_microcode(const struct microcode_patch *patch)
     return 0;
 }
 
-static int scan_equiv_cpu_table(
-    const void *data,
-    size_t size_left,
-    size_t *offset)
+static int scan_equiv_cpu_table(const struct container_equiv_table *et)
 {
     const struct cpu_signature *sig = &this_cpu(cpu_sig);
-    const struct mpbhdr *mpbuf;
-    const struct equiv_cpu_entry *eq;
-    unsigned int i, nr;
-
-    if ( size_left < (sizeof(*mpbuf) + 4) ||
-         (mpbuf = data + *offset + 4,
-          size_left - sizeof(*mpbuf) - 4 < mpbuf->len) )
-    {
-        printk(XENLOG_WARNING "microcode: No space for equivalent cpu table\n");
-        return -EINVAL;
-    }
-
-    *offset += mpbuf->len + CONT_HDR_SIZE;	/* add header length */
-
-    if ( mpbuf->type != UCODE_EQUIV_CPU_TABLE_TYPE )
-    {
-        printk(KERN_ERR "microcode: Wrong microcode equivalent cpu table type field\n");
-        return -EINVAL;
-    }
-
-    if ( mpbuf->len == 0 || mpbuf->len % sizeof(*eq) ||
-         (eq = (const void *)mpbuf->data,
-          nr = mpbuf->len / sizeof(*eq),
-          eq[nr - 1].installed_cpu) )
-    {
-        printk(KERN_ERR "microcode: Wrong microcode equivalent cpu table length\n");
-        return -EINVAL;
-    }
+    unsigned int i, nr = et->len / sizeof(et->eq[0]);
 
     /* Search the equiv_cpu_table for the current CPU. */
-    for ( i = 0; i < nr && eq[i].installed_cpu; ++i )
+    for ( i = 0; i < nr && et->eq[i].installed_cpu; ++i )
     {
-        if ( eq[i].installed_cpu != sig->sig )
+        if ( et->eq[i].installed_cpu != sig->sig )
             continue;
 
         if ( !equiv.sig ) /* Cache details on first find. */
         {
             equiv.sig = sig->sig;
-            equiv.id  = eq[i].equiv_cpu;
+            equiv.id  = et->eq[i].equiv_cpu;
             return 0;
         }
 
-        if ( equiv.sig != sig->sig || equiv.id != eq[i].equiv_cpu )
+        if ( equiv.sig != sig->sig || equiv.id != et->eq[i].equiv_cpu )
         {
             /*
              * This can only occur if two equiv tables have been seen with
@@ -327,7 +293,7 @@ static int scan_equiv_cpu_table(
              */
             printk(XENLOG_ERR
                    "microcode: Equiv mismatch: cpu %08x, got %04x, cached %04x\n",
-                   sig->sig, eq[i].equiv_cpu, equiv.id);
+                   sig->sig, et->eq[i].equiv_cpu, equiv.id);
             return -EINVAL;
         }
 
@@ -338,101 +304,51 @@ static int scan_equiv_cpu_table(
     return -ESRCH;
 }
 
-static int container_fast_forward(const void *data, size_t size_left, size_t *offset)
-{
-    for ( ; ; )
-    {
-        size_t size;
-        const uint32_t *header;
-
-        if ( size_left < SECTION_HDR_SIZE )
-            return -EINVAL;
-
-        header = data + *offset;
-
-        if ( header[0] == UCODE_MAGIC &&
-             header[1] == UCODE_EQUIV_CPU_TABLE_TYPE )
-            break;
-
-        if ( header[0] != UCODE_UCODE_TYPE )
-            return -EINVAL;
-        size = header[1] + SECTION_HDR_SIZE;
-        if ( size < PATCH_HDR_SIZE || size_left < size )
-            return -EINVAL;
-
-        size_left -= size;
-        *offset += size;
-
-        if ( !size_left )
-            return -ENODATA;
-    }
-
-    return 0;
-}
-
 static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
 {
     const struct microcode_patch *saved = NULL;
     struct microcode_patch *patch = NULL;
-    size_t offset = 0, saved_size = 0;
+    size_t saved_size = 0;
     int error = 0;
-    unsigned int cpu = smp_processor_id();
-    const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
 
-    if ( size < 4 ||
-         *(const uint32_t *)buf != UCODE_MAGIC )
+    while ( size )
     {
-        printk(KERN_ERR "microcode: Wrong microcode patch file magic\n");
-        error = -EINVAL;
-        goto out;
-    }
-
-    /*
-     * Multiple container file support:
-     * 1. check if this container file has equiv_cpu_id match
-     * 2. If not, fast-fwd to next container file
-     */
-    while ( offset < size )
-    {
-        error = scan_equiv_cpu_table(buf, size - offset, &offset);
-
-        if ( !error || error != -ESRCH )
-            break;
+        const struct container_equiv_table *et;
+        bool skip_ucode;
 
-        error = container_fast_forward(buf, size - offset, &offset);
-        if ( error == -ENODATA )
+        if ( size < 4 || *(const uint32_t *)buf != UCODE_MAGIC )
         {
-            ASSERT(offset == size);
+            printk(XENLOG_ERR "microcode: Wrong microcode patch file magic\n");
+            error = -EINVAL;
             break;
         }
-        if ( error )
+
+        /* Move over UCODE_MAGIC. */
+        buf  += 4;
+        size -= 4;
+
+        if ( size < sizeof(*et) ||
+             (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
+             size - sizeof(*et) < et->len ||
+             et->len % sizeof(et->eq[0]) )
         {
-            printk(KERN_ERR "microcode: CPU%d incorrect or corrupt container file\n"
-                   "microcode: Failed to update patch level. "
-                   "Current lvl:%#x\n", cpu, sig->rev);
+            printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
+            error = -EINVAL;
             break;
         }
-    }
 
-    if ( error )
-    {
-        /*
-         * -ENODATA here means that the blob was parsed fine but no matching
-         * ucode was found. Don't return it to the caller.
-         */
-        if ( error == -ENODATA )
-            error = 0;
-
-        goto out;
-    }
+        /* Move over the Equiv table. */
+        buf  += sizeof(*et) + et->len;
+        size -= sizeof(*et) + et->len;
+
+        error = scan_equiv_cpu_table(et);
+        if ( error && error != -ESRCH )
+            break;
+
+        /* -ESRCH means no applicable microcode in this container. */
+        skip_ucode = error == -ESRCH;
+        error = 0;
 
-    /*
-     * It's possible the data file has multiple matching ucode,
-     * lets keep searching till the latest version
-     */
-    buf  += offset;
-    size -= offset;
-    {
         while ( size )
         {
             const struct container_microcode *mc;
@@ -440,13 +356,16 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
             if ( size < sizeof(*mc) ||
                  (mc = buf)->type != UCODE_UCODE_TYPE ||
                  size - sizeof(*mc) < mc->len ||
-                 !verify_patch_size(mc->len) )
+                 (!skip_ucode && !verify_patch_size(mc->len)) )
             {
                 printk(XENLOG_ERR "microcode: Bad microcode data\n");
                 error = -EINVAL;
                 break;
             }
 
+            if ( skip_ucode )
+                goto skip;
+
             /*
              * If the new ucode covers current CPU, compare ucodes and store the
              * one with higher revision.
@@ -459,6 +378,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
             }
 
             /* Move over the microcode blob. */
+        skip:
             buf  += sizeof(*mc) + mc->len;
             size -= sizeof(*mc) + mc->len;
 
@@ -478,7 +398,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
             error = -ENOMEM;
     }
 
-  out:
     if ( error && !patch )
         patch = ERR_PTR(error);
 
-- 
2.11.0


