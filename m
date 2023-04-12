Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284196DFD97
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520305.807748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfJY-0007uK-Mh; Wed, 12 Apr 2023 18:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520305.807748; Wed, 12 Apr 2023 18:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfJY-0007sb-I7; Wed, 12 Apr 2023 18:35:28 +0000
Received: by outflank-mailman (input) for mailman id 520305;
 Wed, 12 Apr 2023 18:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPvI=AD=citrix.com=prvs=459801679=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmfJX-0007sT-AS
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:35:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9410ef3-d960-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 20:35:25 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c9410ef3-d960-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681324524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rHGJGCPiZIDqX0+lu5FAg42KZJHmVLthhNzInWrh6ko=;
  b=JTnx8lsgQgYALHW74mPmonm5yV2xD4IUxdSMW4mmKSJ3GbMztdMxgWOR
   vk24XrM6IPh54tWc9gsKzU7k0g2I59NbACcZLORkmqCHO+np81Y6+T2DC
   ugGqVirZV7Fqz4FpxMJBEdX+GPAyIcoyLp6oWieYG1AtIvdxo3m2n6OTb
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 105184657
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6GDp8qtmGQVdYTdyklliJzYym+fnVFZeMUV32f8akzHdYApBsoF/q
 tZmKWzXOPaNMGqjfN50YIrg/B5QuJfUydUwSgVo/yBhQXgX+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOHzSFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBBk0aiG+jruNzui3euxOu80Tc9LWM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zqbpjSlXExFXDCZ4TmAzmq1uN7dp3LmUqsvP6ab/aZmskLGkwT/DzVJDADm8JFVkHWWRNZ3O
 0ESvC00osAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZScs2t3SnYhqtRyVQuZmMpO8voLuJD6ll
 lhmsxMCa6UvYd8jjvvrpAqZ3W39+vAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9o4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/i5T4+6B62JNoUSCnSUSONh1Hs2DaJ39zm0+HXAbIllY
 cvLGSpSJS1y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfNE98taQLWBshgtfPsnekg2
 4sGXyd8404EC7OWj+i+2dN7EG3m2lBgVMGo8pAGKbHfSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:EhX1qqlgtBNjPhU/oGZfCDIwM2vpDfJP3DAbv31ZSRFFG/Fw9v
 rPoB1/73TJYVkqNU3I9errBEDiexLhHOBOjrX5VI3KNDUO01HFEGgN1+Xf/wE=
X-Talos-CUID: =?us-ascii?q?9a23=3A2CCosWkAxiHU4wQUanEnph4RncDXOVH09XPhHkb?=
 =?us-ascii?q?hMmgzRI2Qa2KZyPx/rsU7zg=3D=3D?=
X-Talos-MUID: 9a23:Ua085AZTnZX5FuBTtDrQnChcBdVSsrmkIX0mirYN48W2Knkl
X-IronPort-AV: E=Sophos;i="5.98,339,1673931600"; 
   d="scan'208";a="105184657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Disallow CR0.PG 1->0 transitions when CS.L=1
Date: Wed, 12 Apr 2023 19:35:19 +0100
Message-ID: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The Long Mode consistency checks exist to "ensure that the processor does not
enter an undefined mode or state that results in unpredictable behavior".  APM
Vol2 Table 14-5 "Long-Mode Consistency Checks" lists them, but there is no row
preventing the OS from trying to exit Long mode while in 64bit mode.  This
could leave the CPU in Protected Mode with an %rip above the 4G boundary.

Experimentally, AMD CPUs really do permit this state transition.  An OS which
tries it hits an instant SHUTDOWN, even in cases where the truncation I expect
to be going on behind the scenes ought to result in sane continued execution.

Furthermore, right from the very outset, the APM Vol2 14.7 "Leaving Long Mode"
section instructs peoples to switch to a compatibility mode segment first
before clearing CR0.PG, which does clear out the upper bits in %rip.  This is
further backed up by Vol2 Figure 1-6 "Operating Modes of the AMD64
Architecture".

Either way, this appears to have been a genuine oversight in the AMD64 spec.

Intel, on the other hand, rejects this state transition with #GP.

Between revision 71 (Nov 2019) and 72 (May 2020) of SDM Vol3, a footnote to
4.1.2 "Paging-Mode Enable" was altered from:

  If CR4.PCIDE= 1, an attempt to clear CR0.PG causes a general-protection
  exception (#GP); software should clear CR4.PCIDE before attempting to
  disable paging.

to

  If the logical processor is in 64-bit mode or if CR4.PCIDE= 1, an attempt to
  clear CR0.PG causes a general-protection exception (#GP). Software should
  transition to compatibility mode and clear CR4.PCIDE before attempting to
  disable paging.

which acknowledges this corner case, but there doesn't appear to be any other
discussion even in the relevant Long Mode sections.

So it appears that Intel spotted and addressed the corner case in IA-32e mode,
but where 15 years late to document it.

Xen was written to the AMD spec, and misses the check.  Follow the Intel
behaviour, because it is more sensible and avoids hitting a VMEntry failure.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/hvm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 1454c1732d95..3c8d28a2d8be 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2340,6 +2340,21 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
     }
     else if ( !(value & X86_CR0_PG) && (old_value & X86_CR0_PG) )
     {
+        struct segment_register cs;
+
+        hvm_get_segment_register(v, x86_seg_cs, &cs);
+
+        /*
+         * Intel documents a #GP fault in this case, and VMEntry checks reject
+         * it as a valid state.  AMD permits the state transition, and hits
+         * SHUTDOWN immediately thereafter.  Follow the Intel behaviour.
+         */
+        if ( cs.l )
+        {
+            HVM_DBG_LOG(DBG_LEVEL_1, "Guest attempts to clear CR0.PG while CS.L=1");
+            return X86EMUL_EXCEPTION;
+        }
+
         if ( hvm_pcid_enabled(v) )
         {
             HVM_DBG_LOG(DBG_LEVEL_1, "Guest attempts to clear CR0.PG "
-- 
2.30.2


