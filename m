Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF4A199325
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmV-00060A-QZ; Tue, 31 Mar 2020 10:06:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmU-0005yp-4u
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:06:02 +0000
X-Inumbo-ID: 3227e9c6-7337-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3227e9c6-7337-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+goJqvpvmGqGZD1x/qIZwuQWNz0zmMiWRwF4m9iscHc=;
 b=eKhJ0VVAV1TaBI9MvhxHTcgFa+ELfXerWO75cirO/DhJa53bZgthyOUJ
 MK1PYroG59fd9zyyICwX19um1mwrhOdwpN71xM4FXRK6qjKj4foK8VcZR
 T5U6TMvHyRgdK3NpT7qTCxoIvrg/8Iq3ls9b+9nTQWjejIYMrE+ZTVzpY 0=;
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
IronPort-SDR: O8X6k0mJS9C/QIl5W+npqArkraNq0mX+20v63LmYZsWDs904NWhswITkfkXddI7tvNKfraRhxQ
 GU66pbG20KrDBLKzW43RHNdWMi+Khh89aP8T4EQVMCPtfGZAsF1Grl+5LvoIbhvIyqg6BW8BOQ
 GoczDJx20uIfs2+Je3UIpp4FH987qlZSgul73fUwXmOMVzLGUdNzYbj5asRJZtc0sCC5Nt11yo
 0jx8Xowb+9n96+EqqM3QejxNsUSUL4aYRBAOVCCyo6uAdyHc8j1ZUUFP6GZOEVT55cfHPunvwl
 SoY=
X-SBRS: 2.7
X-MesageID: 14930062
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14930062"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 09/11] x86/ucode/amd: Remove gratuitous memory allocations
 from cpu_request_microcode()
Date: Tue, 31 Mar 2020 11:05:29 +0100
Message-ID: <20200331100531.4294-10-andrew.cooper3@citrix.com>
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

Just as on the Intel side, there is no point having
get_ucode_from_buffer_amd() make $N memory allocations and free $N-1 of them.

Delete get_ucode_from_buffer_amd() and rewrite the loop in
cpu_request_microcode() to have 'saved' point into 'buf' until we finally
decide to duplicate that blob and return it to our caller.

Introduce a new struct container_microcode to simplify interpreting the
container format.  Doubly indent the logic to substantially reduce the churn
in a later change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 138 +++++++++++++--------------------------
 1 file changed, 47 insertions(+), 91 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 980e61c547..ae1276988f 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -70,6 +70,11 @@ struct mpbhdr {
     uint32_t len;
     uint8_t data[];
 };
+struct container_microcode {
+    uint32_t type; /* UCODE_UCODE_TYPE */
+    uint32_t len;
+    struct microcode_header_amd patch[];
+};
 
 /*
  * Microcode updates for different CPUs are distinguished by their
@@ -280,52 +285,6 @@ static int apply_microcode(const struct microcode_patch *patch)
     return 0;
 }
 
-static int get_ucode_from_buffer_amd(
-    struct microcode_amd *mc_amd,
-    const void *buf,
-    size_t bufsize,
-    size_t *offset)
-{
-    const struct mpbhdr *mpbuf = buf + *offset;
-
-    /* No more data */
-    if ( *offset >= bufsize )
-    {
-        printk(KERN_ERR "microcode: Microcode buffer overrun\n");
-        return -EINVAL;
-    }
-
-    if ( mpbuf->type != UCODE_UCODE_TYPE )
-    {
-        printk(KERN_ERR "microcode: Wrong microcode payload type field\n");
-        return -EINVAL;
-    }
-
-    if ( (*offset + mpbuf->len) > bufsize )
-    {
-        printk(KERN_ERR "microcode: Bad data in microcode data file\n");
-        return -EINVAL;
-    }
-
-    if ( !verify_patch_size(mpbuf->len) )
-    {
-        printk(XENLOG_ERR "microcode: patch size mismatch\n");
-        return -EINVAL;
-    }
-
-    mc_amd->mpb = xmemdup_bytes(mpbuf->data, mpbuf->len);
-    if ( !mc_amd->mpb )
-        return -ENOMEM;
-
-    pr_debug("microcode: CPU%d size %zu, block size %u offset %zu equivID %#x rev %#x\n",
-             smp_processor_id(), bufsize, mpbuf->len, *offset,
-             mc_amd->mpb->processor_rev_id, mc_amd->mpb->patch_id);
-
-    *offset += mpbuf->len + SECTION_HDR_SIZE;
-
-    return 0;
-}
-
 static int scan_equiv_cpu_table(
     const void *data,
     size_t size_left,
@@ -430,9 +389,9 @@ static int container_fast_forward(const void *data, size_t size_left, size_t *of
 static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
 {
     struct microcode_amd *mc_amd;
-    struct microcode_header_amd *saved = NULL;
+    const struct microcode_header_amd *saved = NULL;
     struct microcode_patch *patch = NULL;
-    size_t offset = 0;
+    size_t offset = 0, saved_size = 0;
     int error = 0;
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
@@ -497,57 +456,54 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
      * It's possible the data file has multiple matching ucode,
      * lets keep searching till the latest version
      */
-    while ( (error = get_ucode_from_buffer_amd(mc_amd, buf, size,
-                                               &offset)) == 0 )
+    buf  += offset;
+    size -= offset;
     {
-        /*
-         * If the new ucode covers current CPU, compare ucodes and store the
-         * one with higher revision.
-         */
-        if ( (microcode_fits(mc_amd->mpb) != MIS_UCODE) &&
-             (!saved || (compare_header(mc_amd->mpb, saved) == NEW_UCODE)) )
+        while ( size )
         {
-            xfree(saved);
-            saved = mc_amd->mpb;
-        }
-        else
-        {
-            xfree(mc_amd->mpb);
-            mc_amd->mpb = NULL;
-        }
+            const struct container_microcode *mc;
+
+            if ( size < sizeof(*mc) ||
+                 (mc = buf)->type != UCODE_UCODE_TYPE ||
+                 size - sizeof(*mc) < mc->len ||
+                 !verify_patch_size(mc->len) )
+            {
+                printk(XENLOG_ERR "microcode: Bad microcode data\n");
+                error = -EINVAL;
+                break;
+            }
 
-        if ( offset >= size )
-            break;
+            /*
+             * If the new ucode covers current CPU, compare ucodes and store the
+             * one with higher revision.
+             */
+            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
+                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
+            {
+                saved = mc->patch;
+                saved_size = mc->len;
+            }
 
-        /*
-         * 1. Given a situation where multiple containers exist and correct
-         *    patch lives on a container that is not the last container.
-         * 2. We match equivalent ids using find_equiv_cpu_id() from the
-         *    earlier while() (On this case, matches on earlier container
-         *    file and we break)
-         * 3. Proceed to while ( (error = get_ucode_from_buffer_amd(mc_amd,
-         *                                  buf, size, &offset)) == 0 )
-         * 4. Find correct patch using microcode_fits() and apply the patch
-         *    (Assume: apply_microcode() is successful)
-         * 5. The while() loop from (3) continues to parse the binary as
-         *    there is a subsequent container file, but...
-         * 6. ...a correct patch can only be on one container and not on any
-         *    subsequent ones. (Refer docs for more info) Therefore, we
-         *    don't have to parse a subsequent container. So, we can abort
-         *    the process here.
-         * 7. This ensures that we retain a success value (= 0) to 'error'
-         *    before if ( mpbuf->type != UCODE_UCODE_TYPE ) evaluates to
-         *    false and returns -EINVAL.
-         */
-        if ( offset + SECTION_HDR_SIZE <= size &&
-             *(const uint32_t *)(buf + offset) == UCODE_MAGIC )
-            break;
+            /* Move over the microcode blob. */
+            buf  += sizeof(*mc) + mc->len;
+            size -= sizeof(*mc) + mc->len;
+
+            /*
+             * Peek ahead.  If we see the start of another container, we've
+             * exhaused all microcode blobs in this container.  Exit cleanly.
+             */
+            if ( size >= 4 && *(const uint32_t *)buf == UCODE_MAGIC )
+                break;
+        }
     }
 
     if ( saved )
     {
-        mc_amd->mpb = saved;
-        patch = mc_amd;
+        mc_amd->mpb = xmemdup_bytes(saved, saved_size);
+        if ( mc_amd->mpb )
+            patch = mc_amd;
+        else
+            error = -ENOMEM;
     }
     else
         free_patch(mc_amd);
-- 
2.11.0


