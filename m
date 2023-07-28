Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D249776745A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 20:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571530.895605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPS20-0003Dn-HM; Fri, 28 Jul 2023 18:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571530.895605; Fri, 28 Jul 2023 18:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPS20-0003C5-CZ; Fri, 28 Jul 2023 18:17:40 +0000
Received: by outflank-mailman (input) for mailman id 571530;
 Fri, 28 Jul 2023 18:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPS1y-0003Bz-LO
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 18:17:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 066e8dd2-2d73-11ee-b24e-6b7b168915f2;
 Fri, 28 Jul 2023 20:17:36 +0200 (CEST)
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
X-Inumbo-ID: 066e8dd2-2d73-11ee-b24e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690568256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=53Becd7zOjdCL49sQjmjL6weiFSnrO2dmg85Si+Y4qw=;
  b=MJMBpc6hkVtpIXdQBsdD0C1TvdmGfCiAOCAXSTuXXSgapZxeP9PtBqnJ
   zKLGqMZUzujLwo46b0C+Hy6UpwklyFlUQJgENMQwfk5qoXzdUFZCGR5wy
   cm+Qx0hlDQ2p0rnSm8jOJU5JkKVfgc5Ff4oWb8+0E44n1UZjCiP0THYEy
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117824141
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:O+pExqIrBwwCgHh4FE+R0ZUlxSXFcZb7ZxGr2PjKsXjdYENSgzIEm
 GUdX26EaPqKZmqkL9AlYNiy9hkAsJbWndRlSAplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QZuPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5NPUQW0
 9hIdwsIRT+OoPu24J+xFuZF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJoFxBrB+
 juuE2LRLRYkb4G+62u+qHOKguvGui/5XIIbLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9F1MnPQkgHVQ+5vLMraYqjjLiRIpsOfvg5jHqIg0c0
 wxmvQBn2eRL0JBVifvrlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpMtrtW550nfa7T4uNuhXogjxmOMUZmOivpXEGWKJt9zq1zBhEfV8XZ
 /93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcmT8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2ddCdglTfSBrX8CeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:ykANl6PXskYv3MBcTs+jsMiBIKoaSvp037BL7TEXdfUxSKalfq
 +V8sjzuSWatN9zYgBDpTnjAtjlfZq0z/ccjbX5W43SPzUO0FHCEGgI1+rfKlPbexEWptQx6U
 8jG5IObeHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A7J2oeGh4qv8Mbc3u9DEgK6UCCTJuSEH4lFH0cxC?=
 =?us-ascii?q?DDE1GRZqMSX+98v9rup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aif5QSAwKBV+g0u8K4ig+alAKoxaaqIupNhtQsLd?=
 =?us-ascii?q?XgJOFEyh0MhCRjjC3S7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,238,1684814400"; 
   d="scan'208";a="117824141"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/amd: Fix DE_CFG truncation in amd_check_zenbleed()
Date: Fri, 28 Jul 2023 19:17:30 +0100
Message-ID: <20230728181730.3065977-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This line:

	val &= ~chickenbit;

ends up truncating val to 32 bits, and turning off various errata workarounds
in Zen2 systems.

Fixes: f91c5ea97067 ("x86/amd: Mitigations for Zenbleed")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The choice is between int or uint64_t.  This is one case where the insistence
on using unsigned int as a default data type is genuinely unsafe.
---
 xen/arch/x86/cpu/amd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 3ed06f670491..089038bf62c5 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -909,8 +909,9 @@ void __init detect_zen2_null_seg_behaviour(void)
 void amd_check_zenbleed(void)
 {
 	const struct cpu_signature *sig = &this_cpu(cpu_sig);
-	unsigned int good_rev, chickenbit = (1 << 9);
+	unsigned int good_rev;
 	uint64_t val, old_val;
+	int chickenbit = (1 << 9);
 
 	/*
 	 * If we're virtualised, we can't do family/model checks safely, and
-- 
2.30.2


