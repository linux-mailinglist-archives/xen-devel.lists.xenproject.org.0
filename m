Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C4842BEF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 19:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673667.1048087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUszA-0007vf-87; Tue, 30 Jan 2024 18:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673667.1048087; Tue, 30 Jan 2024 18:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUszA-0007sl-5G; Tue, 30 Jan 2024 18:37:28 +0000
Received: by outflank-mailman (input) for mailman id 673667;
 Tue, 30 Jan 2024 18:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Trk4=JI=citrix.com=prvs=75271d196=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rUsz8-0007rI-Us
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 18:37:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b613398-bf9e-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 19:37:25 +0100 (CET)
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
X-Inumbo-ID: 9b613398-bf9e-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706639844;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HMH+BivxFKYscevT7fYuoktw2y/QdoOonEZ5XNa0xAo=;
  b=ZEJ7oAd7hf0cY3bS6qEU5WPiNdswQ1CDhoAAtPGMBlQpHXuM3eyFYjsH
   MId5csI++GEANOgVuVoVZS+jOpPp2eVRCzBnizUgj7Qbspiqj3uzArFBj
   XB9AW+Ke7tKaL44hpiksVT/hmHVYZGBcih48WC0flLfujt1O3j39dn7lC
   0=;
X-CSE-ConnectionGUID: SEPfN7VOSgqNqTsPueHzUw==
X-CSE-MsgGUID: W78XkaAPQqOu/nhq8N1O6w==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128344464
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ef9EQ6hoA1c53XO3YvV1OKeTX161ORAKZh0ujC45NGQN5FlHY01je
 htvWzyFPK2KZmHxKIxxYISxpx4HupPUm9VjGQFpqylgF3gb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyv0N8klgZmP6wT5QSGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQjBQgDSE+9oNm52ZSidvJUm8kDPvT0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkwJZQ9/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/C9
 jmaozinXnn2MvSglmq18XuFvtbWuj68XoILRJvh0aB11Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4D+Q/4Rql1qnQ7gCWF2UACDVGbbQOluU7WDgr3
 V+hhM7yCHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTXZaF01fuYCl+dxiyE2XJjp+LEKrpubYIT/Wn
 A6tlycnoawvlvYW2oWpwE+S1lpAuaP1oh4JChT/Bz39sF0gNd/6O+SVBU7nAeGsxbt1r2VtX
 1BewqByFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf8Jd4NvWoieRs5Y5hsldrVj
 Kn74185CHh7ZSXCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFrXXAZZoXY
 M/BGe71VCZyNEiS5GbuLwvr+eNxl39WKKK6bcyT8ilLJpLEOCLJFOtVbQHSBg37hYvdyDjoH
 x9kH5Pi431ivCfWO0E7LaZ7wYg2EEUG
IronPort-HdrOrdr: A9a23:xldJAKmUikwP14sVfeysM6R25r7pDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3AM3Ccf2pOmi+Pv2WrBMH4RcrmUfsISnP7k0n3GEC?=
 =?us-ascii?q?hL39VU4WIRH+Cxbwxxg=3D=3D?=
X-Talos-MUID: 9a23:1FKoywXTlBfyMFLq/ACz1AFhPe5Q2r2JFQcLkYxWnZCjazMlbg==
X-IronPort-AV: E=Sophos;i="6.05,230,1701147600"; 
   d="scan'208";a="128344464"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/hvm: Fix UBSAN failure in do_hvm_op() printk
Date: Tue, 30 Jan 2024 18:37:13 +0000
Message-ID: <20240130183713.24680-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Tamas reported this UBSAN failure from fuzzing:

  (XEN) ================================================================================
  (XEN) UBSAN: Undefined behaviour in common/vsprintf.c:64:19
  (XEN) negation of -9223372036854775808 cannot be represented in type 'long long int':
  (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d040307c1c>] R ubsan.c#ubsan_epilogue+0xa/0xd9
  (XEN)    [<ffff82d04030805d>] F __ubsan_handle_negate_overflow+0x99/0xce
  (XEN)    [<ffff82d04028868f>] F vsprintf.c#number+0x10a/0x93e
  (XEN)    [<ffff82d04028ac74>] F vsnprintf+0x19e2/0x1c56
  (XEN)    [<ffff82d04030a47a>] F console.c#vprintk_common+0x76/0x34d
  (XEN)    [<ffff82d04030a79e>] F printk+0x4d/0x4f
  (XEN)    [<ffff82d04040c42b>] F do_hvm_op+0x288e/0x28f5
  (XEN)    [<ffff82d04040d385>] F hvm_hypercall+0xad2/0x149a
  (XEN)    [<ffff82d0403cd072>] F vmx_vmexit_handler+0x1596/0x279c
  (XEN)    [<ffff82d0403d909b>] F vmx_asm_vmexit_handler+0xdb/0x200

The problem is an unsigned -> signed converstion because of a bad
formatter (%ld trying to format an unsigned long).

We could fix it by swapping to %lu, but this is a useless printk() even in
debug builds, so just drop it completely.

Reported-by: Tamas K Lengyel <tamas@tklengyel.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>

-Wformat-signedness would catch this, but Xen isn't remotely close to being
able to have this warning enabled.
---
 xen/arch/x86/hvm/hvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e3bd9157d761..e8deeb022216 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5147,12 +5147,9 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
 
     default:
-    {
-        gdprintk(XENLOG_DEBUG, "Bad HVM op %ld.\n", op);
         rc = -ENOSYS;
         break;
     }
-    }
 
     if ( rc == -ERESTART )
         rc = hypercall_create_continuation(__HYPERVISOR_hvm_op, "lh",

base-commit: cc6ba68edf6dcd18c3865e7d7c0f1ed822796426
-- 
2.30.2


