Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1268D41B8DA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 23:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198467.351979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKDO-0003wI-7q; Tue, 28 Sep 2021 21:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198467.351979; Tue, 28 Sep 2021 21:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKDO-0003uJ-4G; Tue, 28 Sep 2021 21:00:38 +0000
Received: by outflank-mailman (input) for mailman id 198467;
 Tue, 28 Sep 2021 21:00:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEZ0=OS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVKDN-0003uD-7s
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 21:00:37 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0c79031-4ef4-4a9e-9bf8-90859dc81a44;
 Tue, 28 Sep 2021 21:00:36 +0000 (UTC)
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
X-Inumbo-ID: e0c79031-4ef4-4a9e-9bf8-90859dc81a44
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632862836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jyvMptSu2lickOgtgaBHZNpuR05J4lIWaQ3xth9DrgA=;
  b=I3C0iHZD6TPB8ZBhV3RnH/0A2SiGkHbn2K4HlzgRnSHuWoQMJik0+DmZ
   QL/ov4DVXOtEN5DdF73fbvy3np9fm2/emsljJsFWxYoVrMDljWWPw5M/H
   jTaJq9UBM757Zug2A7PrtbZXUeYfizSpdU50rnCbrZS+Qb6J3U7FeK70p
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3pGIScqYZWlgbvqDQXtR7T7VKGUC7awDT85X5Xoghm8WdobPJZYJd1aIOanEPcpgDLKdlA4gFl
 W72thHOZTLumNn0oBn7eMI2TIyA4b6aPkv1b65voIchKG1LTd9nsthm+xPrXZsvhb/9A6n74Ib
 07OwBluWObkPZPvWQCwe+ead25cCgfMjtLV7qzoNCHRO8HchTFrcFq6EP581xfg4t7AsCHxLwK
 tB9m87TW30uGDAueEHGxtyWt3UebQtF3ceIJU7xJVMC78jdMBfFaiU9HGGWgg1zEKkHLa6nnLP
 nPVS87u8qoBW4OJav3ixZ2VW
X-SBRS: 5.1
X-MesageID: 53842725
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ut9dFqvVwdwHbCcKxQj/BCIOa+fnVLZZMUV32f8akzHdYApBsoF/q
 tZmKTyOPKyKNDPwc9slPI+xpkwHuJXdz9A3S1E5ry80HiIQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524jhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliJm6EzpwJL/wh/0bSxB7MSojH6hv5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DP
 JpFM2U1MXwsZTUTMQcQF6wcv9uFm1zCTzleiXmvgqgetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhsdPtaOjzee8nahg+bJtSz+UYMWUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSJZNTgWxyzoFafowURHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC6
 1qDxe6wHy5Tr6STUXu+1LzJjzabJn1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 W7T83ln71kHpYtbj/zkoQCvbyeE/MChc+Ij2unAsotJBCtXY5S5L6ih9FTW9/pJKIvxorKp5
 yNfw5n2AAzjF/iweM2xrAclQO3BCxWtamS0bbtT838JrG/FF5mLJ9w43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa7T4S4Cq2LNYYRPfCdkTNrGgk1PiZ8OEi3zCARfVwXY
 8/HIa5A815AYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PxaopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt7INE6w/QJyL2Yl
 px/M2cBoGfCabT8AV3iQhhehHnHB/6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:lCcKT6AqXf70akHlHemi55DYdb4zR+YMi2TC1yhKKCC9Ffbo8f
 xG/c5rsiMc5wxhO03I9eruBEDiewK5yXcW2/hyAV7KZmCP0wHEQL2KhbGSugEIcBefygcy78
 ldmtBFebjNMWQ=
X-IronPort-AV: E=Sophos;i="5.85,330,1624334400"; 
   d="scan'208";a="53842725"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Bobby Eshleman
	<bobby.eshleman@gmail.com>
Subject: [PATCH] x86/traps: Fix typo in do_entry_CP()
Date: Tue, 28 Sep 2021 22:00:14 +0100
Message-ID: <20210928210014.27954-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The call to debugger_trap_entry() should pass the correct vector.  The
break-for-gdbsx logic is in practice unreachable because PV guests can't
generate #CP, but it will interfere with anyone inserting custom debugging
into debugger_trap_entry().

Fixes: 5ad05b9c2490 ("x86/traps: Implement #CP handler and extend #PF for shadow stacks")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/x86/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index c2e2603c394b..63676b0a68ff 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2047,7 +2047,7 @@ void do_entry_CP(struct cpu_user_regs *regs)
     const char *err = "??";
     unsigned int ec = regs->error_code;
 
-    if ( debugger_trap_entry(TRAP_debug, regs) )
+    if ( debugger_trap_entry(X86_EXC_CP, regs) )
         return;
 
     /* Decode ec if possible */
-- 
2.11.0


