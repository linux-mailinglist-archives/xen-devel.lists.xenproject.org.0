Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FB8195726
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:34:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo7A-0006DU-9a; Fri, 27 Mar 2020 12:29:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo78-0006Ce-UN
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:30 +0000
X-Inumbo-ID: 9ac2ef76-7026-11ea-92cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ac2ef76-7026-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGU0V8wb/kKur660Cw0sPJOBaW2AFi9mmU5wv+RAVjk=;
 b=KLSrl3PWFqJlT/xpJBX2p5Z1TIXZLQxvb5q7VPbZcgkTwE2GbzNtCKMP
 UNcSb5Nhhk/VhNLbfxuKUzBXHqMXGu1yHYcxv9rhb56wBin8bZKNVjGz+
 MbFbhRaUCp8U+BpgaYTJji282jtbySBUgspgnAi4cZZ3FHdj4HAX4kklV E=;
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
IronPort-SDR: Wvyy931gahX+gSObvGG2rqMl07bkQAS4CIOceqWUdtwr1BiTDUZJrSRAZGiRfHYVHdDaTdF8Ls
 ESv+AhwSXVu6WF/dUnGI8FoTlHWVwzn3Zxk9oRDCns7Dijuc8rEeNEHiAsrEwM+bGlWU9aVPP5
 cAqO1WngzxKK7Vuwj5F6Ijz19wo9yLbDH3KL1xpxWbzuLyf0v6D41N7gKkc3nfNSHtzG7z6BBN
 1jpLhJuy2SsUdtkC0oWxDNt9EOjUZPPcO5T269a2kFRLyHKHHlcf+tbjcJRIrdOYn0L5GJthhg
 D/k=
X-SBRS: 2.7
X-MesageID: 15078430
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="15078430"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:28:55 +0000
Message-ID: <20200327122901.11569-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327122901.11569-1-andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 1/7] x86/ucode: Remove unnecessary
 indirection in struct microcode_patch
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

Currently, each cpu_request_microcode() allocates a struct microcode_patch,
which is a single pointer to a separate allocated structure.  This is
wasteful.

Fixing this is complicated because the common microcode_free_patch() code is
responsible for freeing struct microcode_patch, despite this being asymmetric
with how it is allocated.

Make struct microcode_patch fully opaque to the common logic.  This involves
moving the responsibility for freeing struct microcode_patch fully into the
free_patch() hook.

In each vendor logic, use some temporary ifdef-ary (cleaned up in subsequent
changes) to reduce the churn as much as possible, and forgo allocating the
intermediate pointer in cpu_request_microcode().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/cpu/microcode/amd.c     | 30 ++++++++++++------------------
 xen/arch/x86/cpu/microcode/core.c    |  3 +--
 xen/arch/x86/cpu/microcode/intel.c   | 31 ++++++++++++-------------------
 xen/arch/x86/cpu/microcode/private.h | 11 +++--------
 4 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 122b8309af..1b9373f0d9 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -60,13 +60,16 @@ struct __packed microcode_header_amd {
 #define UCODE_EQUIV_CPU_TABLE_TYPE 0x00000000
 #define UCODE_UCODE_TYPE           0x00000001
 
-struct microcode_amd {
+struct microcode_patch {
     void *mpb;
     size_t mpb_size;
     struct equiv_cpu_entry *equiv_cpu_table;
     size_t equiv_cpu_table_size;
 };
 
+/* Temporary, until the microcode_* structure are disentangled. */
+#define microcode_amd microcode_patch
+
 struct mpbhdr {
     uint32_t type;
     uint32_t len;
@@ -177,13 +180,11 @@ static enum microcode_match_result microcode_fits(
 
 static bool match_cpu(const struct microcode_patch *patch)
 {
-    return patch && (microcode_fits(patch->mc_amd) == NEW_UCODE);
+    return patch && (microcode_fits(patch) == NEW_UCODE);
 }
 
-static void free_patch(void *mc)
+static void free_patch(struct microcode_patch *mc_amd)
 {
-    struct microcode_amd *mc_amd = mc;
-
     if ( mc_amd )
     {
         xfree(mc_amd->equiv_cpu_table);
@@ -206,12 +207,12 @@ static enum microcode_match_result compare_header(
 static enum microcode_match_result compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
-    const struct microcode_header_amd *new_header = new->mc_amd->mpb;
-    const struct microcode_header_amd *old_header = old->mc_amd->mpb;
+    const struct microcode_header_amd *new_header = new->mpb;
+    const struct microcode_header_amd *old_header = old->mpb;
 
     /* Both patches to compare are supposed to be applicable to local CPU. */
-    ASSERT(microcode_fits(new->mc_amd) != MIS_UCODE);
-    ASSERT(microcode_fits(old->mc_amd) != MIS_UCODE);
+    ASSERT(microcode_fits(new) != MIS_UCODE);
+    ASSERT(microcode_fits(old) != MIS_UCODE);
 
     return compare_header(new_header, old_header);
 }
@@ -230,7 +231,7 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( !match_cpu(patch) )
         return -EINVAL;
 
-    hdr = patch->mc_amd->mpb;
+    hdr = patch->mpb;
 
     BUG_ON(local_irq_is_enabled());
 
@@ -554,14 +555,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
     {
         mc_amd->mpb = saved;
         mc_amd->mpb_size = saved_size;
-        patch = xmalloc(struct microcode_patch);
-        if ( patch )
-            patch->mc_amd = mc_amd;
-        else
-        {
-            free_patch(mc_amd);
-            error = -ENOMEM;
-        }
+        patch = mc_amd;
     }
     else
         free_patch(mc_amd);
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 61150e04c8..b3e5913d49 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -245,8 +245,7 @@ static struct microcode_patch *parse_blob(const char *buf, size_t len)
 
 static void microcode_free_patch(struct microcode_patch *microcode_patch)
 {
-    microcode_ops->free_patch(microcode_patch->mc);
-    xfree(microcode_patch);
+    microcode_ops->free_patch(microcode_patch);
 }
 
 /* Return true if cache gets updated. Otherwise, return false */
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 78455aa0ae..a69f7fe1de 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -52,11 +52,14 @@ struct microcode_header_intel {
     unsigned int reserved[3];
 };
 
-struct microcode_intel {
+struct microcode_patch {
     struct microcode_header_intel hdr;
     unsigned int bits[0];
 };
 
+/* Temporary, until the microcode_* structure are disentangled. */
+#define microcode_intel microcode_patch
+
 /* microcode format is extended from prescott processors */
 struct extended_signature {
     unsigned int sig;
@@ -245,12 +248,12 @@ static bool match_cpu(const struct microcode_patch *patch)
     if ( !patch )
         return false;
 
-    return microcode_update_match(&patch->mc_intel->hdr) == NEW_UCODE;
+    return microcode_update_match(&patch->hdr) == NEW_UCODE;
 }
 
-static void free_patch(void *mc)
+static void free_patch(struct microcode_patch *patch)
 {
-    xfree(mc);
+    xfree(patch);
 }
 
 static enum microcode_match_result compare_patch(
@@ -260,11 +263,10 @@ static enum microcode_match_result compare_patch(
      * Both patches to compare are supposed to be applicable to local CPU.
      * Just compare the revision number.
      */
-    ASSERT(microcode_update_match(&old->mc_intel->hdr) != MIS_UCODE);
-    ASSERT(microcode_update_match(&new->mc_intel->hdr) != MIS_UCODE);
+    ASSERT(microcode_update_match(&old->hdr) != MIS_UCODE);
+    ASSERT(microcode_update_match(&new->hdr) != MIS_UCODE);
 
-    return (new->mc_intel->hdr.rev > old->mc_intel->hdr.rev) ? NEW_UCODE
-                                                             : OLD_UCODE;
+    return (new->hdr.rev > old->hdr.rev) ? NEW_UCODE : OLD_UCODE;
 }
 
 static int apply_microcode(const struct microcode_patch *patch)
@@ -281,7 +283,7 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( !match_cpu(patch) )
         return -EINVAL;
 
-    mc_intel = patch->mc_intel;
+    mc_intel = patch;
 
     BUG_ON(local_irq_is_enabled());
 
@@ -372,16 +374,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
         error = offset;
 
     if ( saved )
-    {
-        patch = xmalloc(struct microcode_patch);
-        if ( patch )
-            patch->mc_intel = saved;
-        else
-        {
-            xfree(saved);
-            error = -ENOMEM;
-        }
-    }
+        patch = saved;
 
     if ( error && !patch )
         patch = ERR_PTR(error);
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 230b935c94..df0d0852cd 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -11,13 +11,8 @@ enum microcode_match_result {
     MIS_UCODE, /* signature mismatched */
 };
 
-struct microcode_patch {
-    union {
-        struct microcode_intel *mc_intel;
-        struct microcode_amd *mc_amd;
-        void *mc;
-    };
-};
+/* Opaque.  Internals are vendor-specific. */
+struct microcode_patch;
 
 struct microcode_ops {
     /*
@@ -62,7 +57,7 @@ struct microcode_ops {
     void (*end_update_percpu)(void);
 
     /* Free a patch previously allocated by cpu_request_microcode(). */
-    void (*free_patch)(void *mc);
+    void (*free_patch)(struct microcode_patch *patch);
 
     /*
      * Is the microcode patch applicable for the current CPU, and newer than
-- 
2.11.0


