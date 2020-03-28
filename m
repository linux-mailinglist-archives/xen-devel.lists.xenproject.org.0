Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44731966F3
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 16:33:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIDPP-0002LU-QG; Sat, 28 Mar 2020 15:30:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n4CN=5N=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jIDPO-00029o-0Y
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 15:30:02 +0000
X-Inumbo-ID: fce89696-7108-11ea-a6c1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fce89696-7108-11ea-a6c1-bc764e2007e4;
 Sat, 28 Mar 2020 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585409401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g8gFnr0vlifHLe76yyY0foJsDip+yVT1RevcQEw5R9U=;
 b=Lad+4EzYicPVUIXfHf88nbs1WMiHBMEbVG6YODQRhswBAELM9Aj/72Np
 HpbHAmSB9kcm/cxmCQKQGUe8aLC1IwSnpIe67gMRVUeTqN0X5P40JXAPC
 ExKPgzLW/5qc5OvUr+N8qTSXoiK4OEHEaNi2Xhxr59dfcQtbZ9qq0gjjF M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R1x09Ym4NQhm1YzinpYuGHi5tfMRxIOnqbYpPsHAnLBv9Ile8tf1RTA3hCUe4+JgVPnbkgOkp5
 n7LLGajRJ1rpDlVazbivK+fGJuHu4XaFS/T0r9N8fKKhc535erHJLB/XogOI3zfy4EYFBs4eSf
 0pXlYWWQ0hAyP3vePZdFY6GtuZdbnoZNThvYHYgVUzD1gNkjTWtJLJZFFMpxvve1a9k7FRGS4o
 ZuZM2ejA0Xcubyi7sGL/nO/Dm4cie90rmjKLmu1VO2Jc2CqVyQJHguQPHDuwpP8Ol16V04QVhS
 d98=
X-SBRS: 2.7
X-MesageID: 15020862
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,316,1580792400"; d="scan'208";a="15020862"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 28 Mar 2020 15:29:54 +0000
Message-ID: <20200328152954.6224-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH] x86/ucode/amd: Fix more potential buffer
 overruns with microcode parsing
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

cpu_request_microcode() doesn't know the buffer is at least 4 bytes long
before inspecting UCODE_MAGIC.

install_equiv_cpu_table() doesn't know the boundary of the buffer it is
interpreting as an equivalency table.  This case was clearly observed at one
point in the past, given the subsequent overrun detection, but without
comprehending that the damage was already done.

Make the logic consistent with container_fast_forward() and pass size_left in
to install_equiv_cpu_table().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 6bf3a054d3..796745e928 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -303,11 +303,20 @@ static int get_ucode_from_buffer_amd(
 static int install_equiv_cpu_table(
     struct microcode_amd *mc_amd,
     const void *data,
+    size_t size_left,
     size_t *offset)
 {
-    const struct mpbhdr *mpbuf = data + *offset + 4;
+    const struct mpbhdr *mpbuf;
     const struct equiv_cpu_entry *eq;
 
+    if ( size_left < (sizeof(*mpbuf) + 4) ||
+         (mpbuf = data + *offset + 4,
+          size_left - sizeof(*mpbuf) - 4 < mpbuf->len) )
+    {
+        printk(XENLOG_WARNING "microcode: No space for equivalent cpu table\n");
+        return -EINVAL;
+    }
+
     *offset += mpbuf->len + CONT_HDR_SIZE;	/* add header length */
 
     if ( mpbuf->type != UCODE_EQUIV_CPU_TABLE_TYPE )
@@ -417,7 +426,8 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
 
     current_cpu_id = cpuid_eax(0x00000001);
 
-    if ( *(const uint32_t *)buf != UCODE_MAGIC )
+    if ( bufsize < 4 ||
+         *(const uint32_t *)buf != UCODE_MAGIC )
     {
         printk(KERN_ERR "microcode: Wrong microcode patch file magic\n");
         error = -EINVAL;
@@ -447,24 +457,13 @@ static struct microcode_patch *cpu_request_microcode(const void *buf,
      */
     while ( offset < bufsize )
     {
-        error = install_equiv_cpu_table(mc_amd, buf, &offset);
+        error = install_equiv_cpu_table(mc_amd, buf, bufsize - offset, &offset);
         if ( error )
         {
             printk(KERN_ERR "microcode: installing equivalent cpu table failed\n");
             break;
         }
 
-        /*
-         * Could happen as we advance 'offset' early
-         * in install_equiv_cpu_table
-         */
-        if ( offset > bufsize )
-        {
-            printk(KERN_ERR "microcode: Microcode buffer overrun\n");
-            error = -EINVAL;
-            break;
-        }
-
         if ( find_equiv_cpu_id(mc_amd->equiv_cpu_table, current_cpu_id,
                                &equiv_cpu_id) )
             break;
-- 
2.11.0


