Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DC199324
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:09:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmL-0005qV-9Z; Tue, 31 Mar 2020 10:05:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmK-0005pv-3t
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:52 +0000
X-Inumbo-ID: 31a5b08c-7337-11ea-b4f4-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31a5b08c-7337-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 10:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMB7T+dj7zC/QyKtt2kmS9SEaLLZn8QGcuALGV7Ulcc=;
 b=hIvbH5wyN7xTQP6sYk8L6QtGQNfwh2j87otNW3WprDFgt4IIVgH5fC01
 2vCgL0HV4lxz1ZB8Mm5DCThAVPKvxo4CiriWd3Vy5/YJCCrEo1wfqol2Z
 qASwgFn5T3rtfdJwlmKArOq43D/k5y94IdBQ1BAKmuSzwCzoDkoMDyX5S 8=;
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
IronPort-SDR: OZvT4CtbzMC6atAegqKPQ/qTtEDz+nCE6LA1IKEpiAamEE2Zix31WH7hbguAZ9KRMr+humNlLc
 WRQOOCCY8oAnc72tqfvjkO5D2x8KZ+o6MUOcfixUKkxnP5RrGuS33tMVAh2+uHJbbDV12EDl/d
 AYx9ALHWQHSZcmVgLvqhOzq2RrirjxK8FzW0hsAlFMA2I9ZFucS0/gdIp6QN7W4b54/xy/+n15
 uLcMnbQAXbKVJGjfvT56Le6OQGeoC/ywgkW22k8S3ezi666OMdXzGdElii9YK734T6gomiIZuG
 GI8=
X-SBRS: 2.7
X-MesageID: 14930059
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14930059"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 04/11] x86/ucode/amd: Collect CPUID.1.EAX in collect_cpu_info()
Date: Tue, 31 Mar 2020 11:05:24 +0100
Message-ID: <20200331100531.4294-5-andrew.cooper3@citrix.com>
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

... rather than collecting it repeatedly in microcode_fits().  This brings the
behaviour in line with the Intel side.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 11 +++--------
 xen/include/asm-x86/microcode.h  |  2 +-
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 3f3a05fad2..d2ecc7ae87 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -79,6 +79,7 @@ static int collect_cpu_info(struct cpu_signature *csig)
 {
     memset(csig, 0, sizeof(*csig));
 
+    csig->sig = cpuid_eax(1);
     rdmsrl(MSR_AMD_PATCHLEVEL, csig->rev);
 
     pr_debug("microcode: CPU%d collect_cpu_info: patch_id=%#x\n",
@@ -177,12 +178,9 @@ static enum microcode_match_result microcode_fits(
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     const struct microcode_header_amd *mc_header = mc_amd->mpb;
     const struct equiv_cpu_entry *equiv_cpu_table = mc_amd->equiv_cpu_table;
-    unsigned int current_cpu_id;
     unsigned int equiv_cpu_id;
 
-    current_cpu_id = cpuid_eax(0x00000001);
-
-    if ( !find_equiv_cpu_id(equiv_cpu_table, current_cpu_id, &equiv_cpu_id) )
+    if ( !find_equiv_cpu_id(equiv_cpu_table, sig->sig, &equiv_cpu_id) )
         return MIS_UCODE;
 
     if ( (mc_header->processor_rev_id) != equiv_cpu_id )
@@ -419,13 +417,10 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
     struct microcode_patch *patch = NULL;
     size_t offset = 0, saved_size = 0;
     int error = 0;
-    unsigned int current_cpu_id;
     unsigned int equiv_cpu_id;
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
 
-    current_cpu_id = cpuid_eax(0x00000001);
-
     if ( bufsize < 4 ||
          *(const uint32_t *)buf != UCODE_MAGIC )
     {
@@ -456,7 +451,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
             break;
         }
 
-        if ( find_equiv_cpu_id(mc_amd->equiv_cpu_table, current_cpu_id,
+        if ( find_equiv_cpu_id(mc_amd->equiv_cpu_table, sig->sig,
                                &equiv_cpu_id) )
             break;
 
diff --git a/xen/include/asm-x86/microcode.h b/xen/include/asm-x86/microcode.h
index 3a8e4e8221..cbbe28cb45 100644
--- a/xen/include/asm-x86/microcode.h
+++ b/xen/include/asm-x86/microcode.h
@@ -7,7 +7,7 @@
 #include <public/xen.h>
 
 struct cpu_signature {
-    /* CPU signature (CPUID.1.EAX).  Only written on Intel. */
+    /* CPU signature (CPUID.1.EAX). */
     unsigned int sig;
 
     /* Platform Flags.  Only applicable to Intel. */
-- 
2.11.0


