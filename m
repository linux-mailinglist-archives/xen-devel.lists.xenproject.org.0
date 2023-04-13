Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6634C6E108D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 17:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520826.808859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmyQx-0008Pf-IZ; Thu, 13 Apr 2023 15:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520826.808859; Thu, 13 Apr 2023 15:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmyQx-0008NK-FL; Thu, 13 Apr 2023 15:00:23 +0000
Received: by outflank-mailman (input) for mailman id 520826;
 Thu, 13 Apr 2023 15:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9nQ=AE=citrix.com=prvs=46097603d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmyQw-0008NE-6T
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 15:00:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e76090a4-da0b-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 17:00:19 +0200 (CEST)
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
X-Inumbo-ID: e76090a4-da0b-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681398019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHcnmoXK+tJ5/GNdoQIGjtqmj4LyJsQsX2kB3uia3M0=;
  b=WL5vqUB2MMHn0jwqaKNt2JLkvJXrN3LtoiDKAT9XqgTT5qUI/rQVSdvd
   hlxFaqTVdr90sxnnDiyryQzLU24q41MNuIyFnOkB7LXn8MT6SzkS1Jlbb
   xbIrYGO460y2UWsx4wTV8Nzl6h1PPi7Pq7zXfuYcndAHM2t0T3ZOsaT50
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 104748591
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:a0Tiqaz/316ncZtG0qp6t+dNxirEfRIJ4+MujC+fZmUNrF6WrkUBm
 zYZD22DPKuJNGH8Kdl3OYTj8xgO6JOBx9M3SFA5+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiPKsT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU0Vr
 fxDdW8TVxeKhMWN7Zjhbfhnm8t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNwhnE9
 j+XpgwVBDkRHYOn6iOJwE6yoazJhgbiXropOOOBo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cuPncEFlZa/eDkqYIUtT/lFPFyG7O624id9S7L/
 9yakMQvr+xN3ZdRifvkrAyvbyGE/caQEFNsjunDdif8t14iOtb4D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XC3273k5JbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzhUp9wkfW5TYu7CJg4i+aihbAoLWe6ENxGPxbMjwgBbmB3+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHcqT503+idK2PSfFIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHOPrdVPdAhUdhDWx/ne8qRqSwJKGSI+cElJNhMb6ehJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:ObCwBaGfzMtUP9j1pLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3APkA5vWuRpWH8pP6eb+LplTm76IsJKSXdlyqPPXa?=
 =?us-ascii?q?/AGVOc5C/E3iB875rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEK7gQw8cWNudRHMjvmL3i+iQf8xBvJyNEUw/rYs?=
 =?us-ascii?q?h+M+fEDV2Awyx0g3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,194,1677560400"; 
   d="scan'208";a="104748591"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/hvm: Disallow CR0.PG 1->0 transitions when CS.L=1
Date: Thu, 13 Apr 2023 16:00:09 +0100
Message-ID: <20230413150009.3145462-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
References: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
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
but were 15 years late to document it.

Xen was written to the AMD spec, and misses the check.  Follow the Intel
behaviour, because it is more sensible and avoids hitting a VMEntry failure.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Restrict to when Long Mode is enabled.
---
 xen/arch/x86/hvm/hvm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 1454c1732d95..c63c7d4d6bcf 100644
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
+        if ( (v->arch.hvm.guest_efer & EFER_LME) && cs.l )
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


