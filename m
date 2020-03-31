Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B74199322
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:08:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmQ-0005uk-6M; Tue, 31 Mar 2020 10:05:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmP-0005u6-3v
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:57 +0000
X-Inumbo-ID: 325bcb24-7337-11ea-b4f4-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 325bcb24-7337-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RXoGjwqxEgkEyP09KfWZrxI1cEHDPQ7pSyNUoM8V/OU=;
 b=O5eQBmwE5z3ShVtBnmfM6OMKB9FEn/LeTfHQkLZDVyHW1Kb8X630mQ0e
 KDFdRI82ifNX4qnhwAFcYhivCWIhC8pzZDCY9gG/gH3fsy2zCLk81ERlt
 1GUk5dz0p3kb1jQjKntRJZ43QqsHPhdKzsp0yeJ0UJGYYSCEHp5mU/2RK M=;
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
IronPort-SDR: f0qRLIDg9nvm10rai68Kr+qGElZNeUi9y18eICqWyi4uC0gXeLuJXVrzW39CU0xLEiRnoUiBiW
 2yn3ChCH3BEOQ90O/RLFjvkINEF3nTB80aEMb8MO5+KdppaAx1gJNFgpSmxyDQqurDuyAeIgzw
 Wvaas9WjzQJbWRyEj5vLKYrNoo1UFTO5/hiAq3cfGiXOj+ki+TBo97HcbNfm/FINvtMnLnbJSq
 cPTAl43CvCoi3tMUT8t3Jw54PlpgqH6RG+vSyaaMqtBp+wHvdORY4KPYZbdxxnFRn6l0sqVt2W
 jD0=
X-SBRS: 2.7
X-MesageID: 14930060
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14930060"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 08/11] x86/ucode/amd: Rename bufsize to size in
 cpu_request_microcode()
Date: Tue, 31 Mar 2020 11:05:28 +0100
Message-ID: <20200331100531.4294-9-andrew.cooper3@citrix.com>
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

To simplify future cleanup, rename this variable.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 254f3dd4d7..980e61c547 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -427,8 +427,7 @@ static int container_fast_forward(const void *data, size_t size_left, size_t *of
     return 0;
 }
 
-static struct microcode_patch *cpu_request_microcode(const void *buf,
-                                                     size_t bufsize)
+static struct microcode_patch *cpu_request_microcode(const void *buf, size_t size)
 {
     struct microcode_amd *mc_amd;
     struct microcode_header_amd *saved = NULL;
@@ -438,7 +437,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
     unsigned int cpu = smp_processor_id();
     const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
 
-    if ( bufsize < 4 ||
+    if ( size < 4 ||
          *(const uint32_t *)buf != UCODE_MAGIC )
     {
         printk(KERN_ERR "microcode: Wrong microcode patch file magic\n");
@@ -459,17 +458,17 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
      * 1. check if this container file has equiv_cpu_id match
      * 2. If not, fast-fwd to next container file
      */
-    while ( offset < bufsize )
+    while ( offset < size )
     {
-        error = scan_equiv_cpu_table(buf, bufsize - offset, &offset);
+        error = scan_equiv_cpu_table(buf, size - offset, &offset);
 
         if ( !error || error != -ESRCH )
             break;
 
-        error = container_fast_forward(buf, bufsize - offset, &offset);
+        error = container_fast_forward(buf, size - offset, &offset);
         if ( error == -ENODATA )
         {
-            ASSERT(offset == bufsize);
+            ASSERT(offset == size);
             break;
         }
         if ( error )
@@ -498,7 +497,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
      * It's possible the data file has multiple matching ucode,
      * lets keep searching till the latest version
      */
-    while ( (error = get_ucode_from_buffer_amd(mc_amd, buf, bufsize,
+    while ( (error = get_ucode_from_buffer_amd(mc_amd, buf, size,
                                                &offset)) == 0 )
     {
         /*
@@ -517,7 +516,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
             mc_amd->mpb = NULL;
         }
 
-        if ( offset >= bufsize )
+        if ( offset >= size )
             break;
 
         /*
@@ -527,7 +526,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
          *    earlier while() (On this case, matches on earlier container
          *    file and we break)
          * 3. Proceed to while ( (error = get_ucode_from_buffer_amd(mc_amd,
-         *                                  buf, bufsize,&offset)) == 0 )
+         *                                  buf, size, &offset)) == 0 )
          * 4. Find correct patch using microcode_fits() and apply the patch
          *    (Assume: apply_microcode() is successful)
          * 5. The while() loop from (3) continues to parse the binary as
@@ -540,7 +539,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
          *    before if ( mpbuf->type != UCODE_UCODE_TYPE ) evaluates to
          *    false and returns -EINVAL.
          */
-        if ( offset + SECTION_HDR_SIZE <= bufsize &&
+        if ( offset + SECTION_HDR_SIZE <= size &&
              *(const uint32_t *)(buf + offset) == UCODE_MAGIC )
             break;
     }
-- 
2.11.0


