Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56919571F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 13:32:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHo74-00069B-MI; Fri, 27 Mar 2020 12:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o0RR=5M=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHo72-00067w-Il
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 12:29:24 +0000
X-Inumbo-ID: 9422b1ce-7026-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9422b1ce-7026-11ea-bec1-bc764e2007e4;
 Fri, 27 Mar 2020 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585312158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ooXOEb6013sZBrN5C8AYlh9+wFporvBvVrqbei2wcDA=;
 b=IK/CkETvgsGpDNEA+JdHHKIz1ClE+dG/WZMxoOSsZqj+ZOBkcak5t+Xr
 ToOQ5d41d9tHiLdxCmcbWtY3jIumKFdlM2s5pWHqDxb80RJFsWfQYUko4
 tEHbJbRP9ndR+Orn/e9yBuoNxbCIcIGE8HtlEkKpW1n6OK2jqnJwXPwye 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: toLcN1Mrfc/d0RmtnpsU+UxxSF6LeB4NWpB1EG6NyjDX2ZzqoiP+Ymi0Nqqmn5aFdjpozxyBoo
 UX/qjoggZliHMnizW3gGhJzQihdP4skzSdH8l4HKkR0zZ+PMoGP1CaATphrqP/lzpADYrS6adp
 1e5qtVuSvsj7bmuVdUQegnOaVomELmx/k5bS6iEP/kJPYxn+giJU/0LFFb5QGf1EutJIqQm1iT
 SJbNfG6jsN3HDIlhTmtmYv/CiQoUNZ43xxvuX0/GGo5K1erDZr3tD0zR0ZL7PwV+5AsW5Zth3E
 Hhs=
X-SBRS: 2.7
X-MesageID: 15405104
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,312,1580792400"; d="scan'208";a="15405104"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 27 Mar 2020 12:29:00 +0000
Message-ID: <20200327122901.11569-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327122901.11569-1-andrew.cooper3@citrix.com>
References: <20200327122901.11569-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v2 6/7] x86/ucode/intel: Clean up
 microcode_sanity_check()
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

Rewrite the size checks in a way which doesn't depend on Xen being compiled as
64bit.

Introduce a check missing from the old code, that total_size is a multiple of
1024 bytes, and drop unnecessary defines/macros/structures.

No practical change in behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over struct microcode_patch re-work
 * Retain constness on cast through void *
 * Reinstate printk()s for bad data
---
 xen/arch/x86/cpu/microcode/intel.c | 147 +++++++++++++++++--------------------
 1 file changed, 66 insertions(+), 81 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 9d8d5bfc6e..1358a25032 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -69,24 +69,19 @@ struct microcode_patch {
 #define microcode_intel microcode_patch
 
 /* microcode format is extended from prescott processors */
-struct extended_signature {
-    unsigned int sig;
-    unsigned int pf;
-    unsigned int cksum;
-};
-
 struct extended_sigtable {
     unsigned int count;
     unsigned int cksum;
     unsigned int reserved[3];
-    struct extended_signature sigs[0];
+    struct {
+        unsigned int sig;
+        unsigned int pf;
+        unsigned int cksum;
+    } sigs[];
 };
 
 #define PPRO_UCODE_DATASIZE     2000
 #define MC_HEADER_SIZE          (sizeof(struct microcode_header_intel))
-#define EXT_HEADER_SIZE         (sizeof(struct extended_sigtable))
-#define EXT_SIGNATURE_SIZE      (sizeof(struct extended_signature))
-#define DWSIZE                  (sizeof(u32))
 
 static uint32_t get_datasize(const struct microcode_patch *patch)
 {
@@ -134,8 +129,6 @@ static bool signature_matches(const struct cpu_signature *cpu_sig,
     return cpu_sig->pf & ucode_pf;
 }
 
-#define exttable_size(et) ((et)->count * EXT_SIGNATURE_SIZE + EXT_HEADER_SIZE)
-
 static int collect_cpu_info(struct cpu_signature *csig)
 {
     uint64_t msr_content;
@@ -160,93 +153,85 @@ static int collect_cpu_info(struct cpu_signature *csig)
     return 0;
 }
 
-static int microcode_sanity_check(const struct microcode_patch *mc)
+/*
+ * Sanity check a blob which is expected to be a microcode patch.  The 48 byte
+ * header is of a known format, and together with totalsize are within the
+ * bounds of the container.  Everything else is unchecked.
+ */
+static int microcode_sanity_check(const struct microcode_patch *patch)
 {
-    const struct microcode_header_intel *mc_header = &mc->hdr;
-    const struct extended_sigtable *ext_header = NULL;
-    const struct extended_signature *ext_sig;
-    unsigned long total_size, data_size, ext_table_size;
-    unsigned int ext_sigcount = 0, i;
-    uint32_t sum, orig_sum;
-
-    total_size = get_totalsize(mc);
-    data_size = get_datasize(mc);
-    if ( (data_size + MC_HEADER_SIZE) > total_size )
+    const struct extended_sigtable *ext;
+    const uint32_t *ptr;
+    unsigned int total_size = get_totalsize(patch);
+    unsigned int data_size = get_datasize(patch);
+    unsigned int i, ext_size;
+    uint32_t sum;
+
+    /*
+     * Total size must be a multiple of 1024 bytes.  Data size and the header
+     * must fit within it.
+     */
+    if ( (total_size & 1023) ||
+         data_size > (total_size - MC_HEADER_SIZE) )
     {
-        printk(KERN_ERR "microcode: error! "
-               "Bad data size in microcode data file\n");
+        printk(XENLOG_WARNING "microcode: Bad size\n");
         return -EINVAL;
     }
 
-    if ( (mc_header->ldrver != 1) || (mc_header->hdrver != 1) )
-    {
-        printk(KERN_ERR "microcode: error! "
-               "Unknown microcode update format\n");
+    /* Checksum the main header and data. */
+    for ( sum = 0, ptr = (const uint32_t *)patch;
+          ptr < (const uint32_t *)&patch->data[data_size]; ++ptr )
+        sum += *ptr;
+
+    if ( sum != 0 )
         return -EINVAL;
-    }
-    ext_table_size = total_size - (MC_HEADER_SIZE + data_size);
-    if ( ext_table_size )
+
+    /* Look to see if there is an extended signature table. */
+    ext_size = total_size - data_size - MC_HEADER_SIZE;
+
+    /* No extended signature table?  All done. */
+    if ( ext_size == 0 )
     {
-        if ( (ext_table_size < EXT_HEADER_SIZE) ||
-             ((ext_table_size - EXT_HEADER_SIZE) % EXT_SIGNATURE_SIZE) )
-        {
-            printk(KERN_ERR "microcode: error! "
-                   "Small exttable size in microcode data file\n");
-            return -EINVAL;
-        }
-        ext_header = (void *)mc + MC_HEADER_SIZE + data_size;
-        if ( ext_table_size != exttable_size(ext_header) )
-        {
-            printk(KERN_ERR "microcode: error! "
-                   "Bad exttable size in microcode data file\n");
-            return -EFAULT;
-        }
-        ext_sigcount = ext_header->count;
+        printk(XENLOG_WARNING "microcode: Bad checksum\n");
+        return 0;
     }
 
-    /* check extended table checksum */
-    if ( ext_table_size )
+    /*
+     * Check the structure of the extended signature table, ensuring that it
+     * fits exactly in the remaining space.
+     */
+    ext = (const void *)&patch->data[data_size];
+    if ( ext_size < sizeof(*ext) ||
+         (ext_size - sizeof(*ext)) % sizeof(ext->sigs[0]) ||
+         (ext_size - sizeof(*ext)) / sizeof(ext->sigs[0]) != ext->count )
     {
-        uint32_t ext_table_sum = 0;
-        uint32_t *ext_tablep = (uint32_t *)ext_header;
-
-        i = ext_table_size / DWSIZE;
-        while ( i-- )
-            ext_table_sum += ext_tablep[i];
-        if ( ext_table_sum )
-        {
-            printk(KERN_WARNING "microcode: aborting, "
-                   "bad extended signature table checksum\n");
-            return -EINVAL;
-        }
+        printk(XENLOG_WARNING "microcode: Bad sigtable size\n");
+        return -EINVAL;
     }
 
-    /* calculate the checksum */
-    orig_sum = 0;
-    i = (MC_HEADER_SIZE + data_size) / DWSIZE;
-    while ( i-- )
-        orig_sum += ((uint32_t *)mc)[i];
-    if ( orig_sum )
+    /* Checksum the whole extended signature table. */
+    for ( sum = 0, ptr = (const uint32_t *)ext;
+          ptr < (const uint32_t *)&ext->sigs[ext->count]; ++ptr )
+        sum += *ptr;
+
+    if ( sum != 0 )
     {
-        printk(KERN_ERR "microcode: aborting, bad checksum\n");
+        printk(XENLOG_WARNING "microcode: Bad sigtable checksum\n");
         return -EINVAL;
     }
-    if ( !ext_table_size )
-        return 0;
-    /* check extended signature checksum */
-    for ( i = 0; i < ext_sigcount; i++ )
-    {
-        ext_sig = (void *)ext_header + EXT_HEADER_SIZE +
-            EXT_SIGNATURE_SIZE * i;
-        sum = orig_sum
-            - (mc_header->sig + mc_header->pf + mc_header->cksum)
-            + (ext_sig->sig + ext_sig->pf + ext_sig->cksum);
-        if ( sum )
+
+    /*
+     * Checksum each indiviudal extended signature as if it had been in the
+     * main header.
+     */
+    sum = patch->hdr.sig + patch->hdr.pf + patch->hdr.cksum;
+    for ( i = 0; i < ext->count; ++i )
+        if ( sum != (ext->sigs[i].sig + ext->sigs[i].pf + ext->sigs[i].cksum) )
         {
-            printk(KERN_ERR "microcode: aborting, bad checksum\n");
+            printk(XENLOG_WARNING "microcode: Bad sigtable checksum\n");
             return -EINVAL;
         }
-    }
+
     return 0;
 }
 
-- 
2.11.0


