Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC03919BF3E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:22:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwwU-0000px-Sn; Thu, 02 Apr 2020 10:19:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJwwS-0000pc-Vn
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 10:19:21 +0000
X-Inumbo-ID: 6a0cec34-74cb-11ea-9e09-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a0cec34-74cb-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585822761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZcKbBNzadTU2s5TsuGgFszMTPPeWk2mohwFyrTvSJM=;
 b=GtZaplkanE0grmFBn+4xj8xzuYu9ogeyuiEQWTzOhGumB+EDeG6D4MZp
 N4466XoCzuIgTroJUQmZOAwgLjJKJKKu0DHiHBroRS1TfaL7TiMHvpofk
 SU+jlufOls2JYcExQZ6p1AcqYL+2NkBZijbBqkBfO3d70IViOXf3fl02y 4=;
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
IronPort-SDR: mQ5ta3syU40qCuRiz25H7IFZHcb5LaPTsLyu+OecTg5uFvaosagAGd3/k9ggn2tYW8SZcAqiXm
 gzXSFg7f4/7NABosLqKGIVLBZbOxWWN4kuScVVVKwFszZymiE4btkFSZ+MOj3rcGYibhLI7PBm
 mvEeuEAF9ilrFMhh1zvmUOxFNA5E028/P7aAuyoU2NM10l03UfNbgtvqtgvERVFaxBUklPMzZe
 pYDhgJgdIiqEBnG0RHgmGFtGZu4EYTHQaNCcXTcxIPEySsuDichfhSfmnrTFWbGnLkU5qdWftF
 TiE=
X-SBRS: 2.7
X-MesageID: 15041306
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15041306"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 5/5] x86/ucode: Simplify the ops->collect_cpu_info() API
Date: Thu, 2 Apr 2020 11:19:02 +0100
Message-ID: <20200402101902.28234-6-andrew.cooper3@citrix.com>
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

All callers pass &this_cpu(cpu_sig) for the cpu_sig parameter, and all
implementations unconditionally return 0.  Simplify it to be void.

Drop the long-stale comment on the AMD side, whose counterpart in
start_update() used to be "collect_cpu_info() doesn't fail so we're fine".

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c     |  7 +++----
 xen/arch/x86/cpu/microcode/core.c    | 14 ++++++--------
 xen/arch/x86/cpu/microcode/intel.c   |  5 ++---
 xen/arch/x86/cpu/microcode/private.h |  7 +++++--
 4 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index e23bdef6f2..13bf9f4dee 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -90,9 +90,10 @@ static struct {
     uint16_t id;
 } equiv __read_mostly;
 
-/* See comment in start_update() for cases when this routine fails */
-static int collect_cpu_info(struct cpu_signature *csig)
+static void collect_cpu_info(void)
 {
+    struct cpu_signature *csig = &this_cpu(cpu_sig);
+
     memset(csig, 0, sizeof(*csig));
 
     csig->sig = cpuid_eax(1);
@@ -100,8 +101,6 @@ static int collect_cpu_info(struct cpu_signature *csig)
 
     pr_debug("microcode: CPU%d collect_cpu_info: patch_id=%#x\n",
              smp_processor_id(), csig->rev);
-
-    return 0;
 }
 
 static bool_t verify_patch_size(uint32_t patch_size)
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 53e447ea9a..a220f908b8 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -237,10 +237,9 @@ static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
  */
 static struct microcode_patch *parse_blob(const char *buf, size_t len)
 {
-    if ( likely(!microcode_ops->collect_cpu_info(&this_cpu(cpu_sig))) )
-        return microcode_ops->cpu_request_microcode(buf, len);
+    microcode_ops->collect_cpu_info();
 
-    return NULL;
+    return microcode_ops->cpu_request_microcode(buf, len);
 }
 
 static void microcode_free_patch(struct microcode_patch *patch)
@@ -306,10 +305,9 @@ static bool wait_cpu_callout(unsigned int nr)
  */
 static int microcode_update_cpu(const struct microcode_patch *patch)
 {
-    int err = microcode_ops->collect_cpu_info(&this_cpu(cpu_sig));
+    int err;
 
-    if ( unlikely(err) )
-        return err;
+    microcode_ops->collect_cpu_info();
 
     spin_lock(&microcode_mutex);
     if ( patch )
@@ -737,7 +735,7 @@ int microcode_update_one(bool start_update)
     if ( !microcode_ops )
         return -EOPNOTSUPP;
 
-    microcode_ops->collect_cpu_info(&this_cpu(cpu_sig));
+    microcode_ops->collect_cpu_info();
 
     if ( start_update && microcode_ops->start_update )
     {
@@ -819,7 +817,7 @@ int __init early_microcode_init(void)
         return -ENODEV;
     }
 
-    microcode_ops->collect_cpu_info(&this_cpu(cpu_sig));
+    microcode_ops->collect_cpu_info();
 
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 29745ed55f..a9f4d6e829 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -115,8 +115,9 @@ static bool signature_matches(const struct cpu_signature *cpu_sig,
     return cpu_sig->pf & ucode_pf;
 }
 
-static int collect_cpu_info(struct cpu_signature *csig)
+static void collect_cpu_info(void)
 {
+    struct cpu_signature *csig = &this_cpu(cpu_sig);
     uint64_t msr_content;
 
     memset(csig, 0, sizeof(*csig));
@@ -133,8 +134,6 @@ static int collect_cpu_info(struct cpu_signature *csig)
     csig->rev = (uint32_t)(msr_content >> 32);
     pr_debug("microcode: collect_cpu_info : sig=%#x, pf=%#x, rev=%#x\n",
              csig->sig, csig->pf, csig->rev);
-
-    return 0;
 }
 
 /*
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index 878f8d805f..dc5c7a81ae 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -33,8 +33,11 @@ struct microcode_ops {
     struct microcode_patch *(*cpu_request_microcode)(const void *buf,
                                                      size_t size);
 
-    /* Obtain microcode-relevant details for the current CPU. */
-    int (*collect_cpu_info)(struct cpu_signature *csig);
+    /*
+     * Obtain microcode-relevant details for the current CPU.  Results in
+     * per_cpu(cpu_sig).
+     */
+    void (*collect_cpu_info)(void);
 
     /*
      * Attempt to load the provided patch into the CPU.  Returns an error if
-- 
2.11.0


