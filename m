Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163797DE6C2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 21:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626638.977064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyHyL-0006Dg-Ds; Wed, 01 Nov 2023 20:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626638.977064; Wed, 01 Nov 2023 20:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyHyL-0006BN-BF; Wed, 01 Nov 2023 20:37:53 +0000
Received: by outflank-mailman (input) for mailman id 626638;
 Wed, 01 Nov 2023 20:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHih=GO=citrix.com=prvs=662d42e6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qyHyJ-00069g-Hy
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 20:37:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83bdd2b2-78f6-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 21:37:48 +0100 (CET)
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
X-Inumbo-ID: 83bdd2b2-78f6-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698871068;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=43oVt6N/8ogtMsgBl8YGeSvERYHwZG0JWTOITrW6Y7g=;
  b=DW7Mi79DlHKYHc+bDGgLdvnNyFb7BMkt/qw1Mk7PlD+gkAsENrsShtI0
   dTPpOmA5lpUn2GCrcqdQtc66gHZz8lcQ1Gj6hdsYFtwQdymS/LOs5o7rH
   Y2ieXHHqkgiyE2UYL30YJy1ovdNqiydlkVcVUhqVzDgFV5y+KNmN6mKK0
   0=;
X-CSE-ConnectionGUID: sTpmSzHmT+SNwEUQVNKDUA==
X-CSE-MsgGUID: SxSyzxVlRpWdjgCVXsYdWA==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127170898
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:qPZUIazbDUWTvaCivER6t+cjxirEfRIJ4+MujC+fZmUNrF6WrkVVm
 jYfXGuHOK6OZGbzeNF3YdyxpBtS7J+GndJrHAs9/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVnPakT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXpy7
 fkjOhAIUlO4of2b/YuFbMpAu+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8KxxnA9
 jOWl4j/KioKD82N2QSByGqTiu3Ath3LQ7MeK5Tto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC9
 lKPhcKvOjVpv5WcU3fb/bCRxQ5eIgBMczVEP3VdC1JYsp+8+Onfky4jUP54LLawtc/VHA2z+
 BaVgRUHuZMwofMigvDTEU/8v968mnTYZldrt1WHBzr9tFMRiJ2NPdLytQaBhRpUBMPJFgPf4
 SJsd922tbhWVfmweDqxrPLh9V1Dz92CKjTYyWV3BZgn+C/FF5WLJtsIv2gWyKuEKK85ld7Vj
 Kz741g5CGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonA+NRDLgT6zwBF8+U3aB
 Xt8WZ/yZUv29Iw+kWHoLwvj+eRDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/LL7dfVE7RDB9V5c8A9oJIuRYokicrc+Ql
 lnVZ6OS4AOXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:4NtU1K7WrjUk6CwdzAPXwMXXdLJyesId70hD6qkRc20wTiT7//
 rFoB1/73LJYVkqNE3I9ervBEDiewK4yXcW2/hzAV7KZmCP01dASrsC0WKI+UyDJ8SRzI5g/J
 YlV5JeYeeeMWRH
X-Talos-CUID: 9a23:Mh/sQGH0MSLAtOPYqmJ8yFYRIdIFd0Ge91HPDnKBN0BKZIC8HAo=
X-Talos-MUID: 9a23:pZRUZgmvsHJKsOP7mNg6dnpZJPx58bSQDHoVrpkEtOK6BTdBNwi02WE=
X-IronPort-AV: E=Sophos;i="6.03,269,1694750400"; 
   d="scan'208";a="127170898"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18] x86/time: Fix UBSAN failure in __update_vcpu_system_time()
Date: Wed, 1 Nov 2023 20:37:37 +0000
Message-ID: <20231101203737.3441425-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As reported:

  (XEN) ================================================================================
  (XEN) UBSAN: Undefined behaviour in arch/x86/time.c:1542:32
  (XEN) member access within null pointer of type 'union vcpu_info_t'
  (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d040345036>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
  (XEN)    [<ffff82d0403456e8>] F __ubsan_handle_type_mismatch+0x133/0x49b
  (XEN)    [<ffff82d040345b4a>] F __ubsan_handle_type_mismatch_v1+0xfa/0xfc
  (XEN)    [<ffff82d040623356>] F arch/x86/time.c#__update_vcpu_system_time+0x212/0x30f
  (XEN)    [<ffff82d040623461>] F update_vcpu_system_time+0xe/0x10
  (XEN)    [<ffff82d04062389d>] F arch/x86/time.c#local_time_calibration+0x1f7/0x523
  (XEN)    [<ffff82d0402a64b5>] F common/softirq.c#__do_softirq+0x1f4/0x31a
  (XEN)    [<ffff82d0402a67ad>] F do_softirq+0x13/0x15
  (XEN)    [<ffff82d0405a95dc>] F arch/x86/domain.c#idle_loop+0x2e0/0x367
  (XEN)
  (XEN) ================================================================================

It is not valid to derive a pointer from vcpu_info() prior to checking that
the underlying map pointer is good.

Reorder actions so the NULL pointer check is first.

Fixes: 20279afd7323 ("x86: split populating of struct vcpu_time_info into a separate function")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>

4.18 blocker, or we'll need to issue an XSA/CVE.
---
 xen/arch/x86/time.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index d0b0986509b2..6d33edd0addc 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1539,12 +1539,14 @@ static void collect_time_info(const struct vcpu *v,
 
 static void __update_vcpu_system_time(struct vcpu *v, int force)
 {
-    struct vcpu_time_info *u = &vcpu_info(v, time), _u;
+    struct vcpu_time_info *u, _u;
     const struct domain *d = v->domain;
 
     if ( !v->vcpu_info_area.map )
         return;
 
+    u = &vcpu_info(v, time);
+
     collect_time_info(v, &_u);
 
     /* Don't bother unless timestamp record has changed or we are forced. */

base-commit: 7befef87cc9b1bb8ca15d866ce1ecd9165ccb58c
-- 
2.30.2


