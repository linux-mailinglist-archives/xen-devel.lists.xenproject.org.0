Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C412199320
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:08:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJDmE-0005mF-Dm; Tue, 31 Mar 2020 10:05:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fshn=5Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJDmC-0005lP-8g
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:05:44 +0000
X-Inumbo-ID: 2b9d0b55-7337-11ea-ba0b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b9d0b55-7337-11ea-ba0b-12813bfff9fa;
 Tue, 31 Mar 2020 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585649139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fEEGaZOBZD3UVLJz2S52FnWKJLru30PNLNWhLEp6KAs=;
 b=asVgDJxbhoKuYtdj9ndvzTAtrtnjHt93sXJCOKHBsAhBHiq7iSmlk4G4
 xF4WFBjZHsYKmRH9ZPUGsK/1vyP1lIf4JwnpdTK2RudRXJhXr8sxf9lLD
 b4+V2sGG4DKl3RoCU8stCEML8J5TY7RF683ZLTpIFoCh8IxGEYpmoPR8q U=;
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
IronPort-SDR: GsjU/RcR6AiK+7Kduvde5iFt+SCw1SEVd3/ghRbUnoBV34SqZZaRO1kMUmurqOBn6QqoHyII4E
 tvnZJg7mazZOCir5eGXqtZX+N62AoIItawmhoNMPe8/FI5XBLlngKtdtrjBFGbgMea593aAEAf
 qiXHG+1yUoBsoMksAo9TPQ2rGfj84XlMfHMoFp3oH21vO9rltIBEbzyx4m0g0p5xbEX8Q/Lptm
 6Rib95iwy8q3WZxMVzjKS/KfX1zGtzeZ5dgxi3tTBqfe/etAU0nbHOE8HlAlVBU6FeBQaaFVVZ
 zpY=
X-SBRS: 2.7
X-MesageID: 15137743
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15137743"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 01/11] x86/ucode/amd: Fix more potential buffer overruns with
 microcode parsing
Date: Tue, 31 Mar 2020 11:05:21 +0100
Message-ID: <20200331100531.4294-2-andrew.cooper3@citrix.com>
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

cpu_request_microcode() doesn't know the buffer is at least 4 bytes long
before inspecting UCODE_MAGIC.

install_equiv_cpu_table() doesn't know the boundary of the buffer it is
interpreting as an equivalency table.  This case was clearly observed at one
point in the past, given the subsequent overrun detection, but without
comprehending that the damage was already done.

Make the logic consistent with container_fast_forward() and pass size_left in
to install_equiv_cpu_table().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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


