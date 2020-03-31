Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D525819931F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmN-0005si-RP; Tue, 31 Mar 2020 10:05:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmM-0005rq-95
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:54 +0000
X-Inumbo-ID: 2f649312-7337-11ea-ba0b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f649312-7337-11ea-ba0b-12813bfff9fa;
 Tue, 31 Mar 2020 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRv2ZDDEle7+rr6nLrEPeMqu4nRuzhy/4HYzc7luCQ8=;
 b=hXnV5v140EUolkCQLbiIo6Duo/L3K3E1vB9ozfLV8rhaBjnv0q5B6e8n
 OdknJXrMQBsE3r02JRkBsrt7y+H403wyp3Qx4QhI/YBlxOZjfDTyRJgJO
 MMR2qDiJggV5HdwTBe9O6/ijlTZFt/+MHj4BARRL+w0/MWXgst2N3EdNZ 4=;
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
IronPort-SDR: ImDgnuZpNV9ILuPcyTYVM1MpFFldmGAMbeW5w4EGwpxCKzxyTYxuIYz2YqlYKPTvaaEm4t6zI0
 Q0qZrRefWytWnnS+IuibknspytIO9OQjI0RuHV7FY+oWyZ1KA4jJCpDUP8oVICDX/1ar+Oj1cA
 7ftZVTeNZwS+edqdYJOOVzAGl876ghYuGOOgHteABnAtBLpbSwWMgJ5MMMI2jqe0x4iaLBIahz
 ePq4pFzPtlA2YBc5U3wqgRuYQqFXl6BIadfs6K3J4G5hrl3GZ/1TOLFXa2yLw6m3ktB2DruAWc
 SAo=
X-SBRS: 2.7
X-MesageID: 15245337
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15245337"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 06/11] x86/ucode/amd: Move verify_patch_size() into
 get_ucode_from_buffer_amd()
Date: Tue, 31 Mar 2020 11:05:26 +0100
Message-ID: <20200331100531.4294-7-andrew.cooper3@citrix.com>
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

We only stash the microcode blob size so it can be audited in
microcode_fits().  However, the patch size check depends only on the CPU
family.

Move the check earlier to when we are parsing the container, which avoids
caching bad microcode in the first place, and allows us to avoid storing the
size at all.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index d3439b0c6c..8318664f85 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -60,7 +60,6 @@ struct __packed microcode_header_amd {
 
 struct microcode_patch {
     struct microcode_header_amd *mpb;
-    size_t mpb_size;
 };
 
 /* Temporary, until the microcode_* structure are disentangled. */
@@ -184,12 +183,6 @@ static enum microcode_match_result microcode_fits(
          equiv.id  != mc_header->processor_rev_id )
         return MIS_UCODE;
 
-    if ( !verify_patch_size(mc_amd->mpb_size) )
-    {
-        pr_debug("microcode: patch size mismatch\n");
-        return MIS_UCODE;
-    }
-
     if ( mc_header->patch_id <= sig->rev )
     {
         pr_debug("microcode: patch is already at required level or greater.\n");
@@ -318,10 +311,15 @@ static int get_ucode_from_buffer_amd(
         return -EINVAL;
     }
 
+    if ( !verify_patch_size(mpbuf->len) )
+    {
+        printk(XENLOG_ERR "microcode: patch size mismatch\n");
+        return -EINVAL;
+    }
+
     mc_amd->mpb = xmemdup_bytes(mpbuf->data, mpbuf->len);
     if ( !mc_amd->mpb )
         return -ENOMEM;
-    mc_amd->mpb_size = mpbuf->len;
 
     pr_debug("microcode: CPU%d size %zu, block size %u offset %zu equivID %#x rev %#x\n",
              smp_processor_id(), bufsize, mpbuf->len, *offset,
@@ -439,7 +437,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
     struct microcode_amd *mc_amd;
     struct microcode_header_amd *saved = NULL;
     struct microcode_patch *patch = NULL;
-    size_t offset = 0, saved_size = 0;
+    size_t offset = 0;
     int error = 0;
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
@@ -516,7 +514,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
         {
             xfree(saved);
             saved = mc_amd->mpb;
-            saved_size = mc_amd->mpb_size;
         }
         else
         {
@@ -555,7 +552,6 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
     if ( saved )
     {
         mc_amd->mpb = saved;
-        mc_amd->mpb_size = saved_size;
         patch = mc_amd;
     }
     else
-- 
2.11.0


