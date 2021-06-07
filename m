Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8339DCB7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 14:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137911.255420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEZM-00085M-Q4; Mon, 07 Jun 2021 12:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137911.255420; Mon, 07 Jun 2021 12:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEZM-00082p-Mm; Mon, 07 Jun 2021 12:41:28 +0000
Received: by outflank-mailman (input) for mailman id 137911;
 Mon, 07 Jun 2021 12:41:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Idvh=LB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqEZL-00082j-Bv
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 12:41:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb71e5c2-4264-4af1-a06d-f5e1b5f5b3ba;
 Mon, 07 Jun 2021 12:41:25 +0000 (UTC)
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
X-Inumbo-ID: fb71e5c2-4264-4af1-a06d-f5e1b5f5b3ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623069684;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e21/IGcWymo5MIqD1rnrm7qEJJUELfd/4foTt5tkdmY=;
  b=eXYPe5ZLS29F1kqJwUL41WIGflAx3bIY2WsUkECCGOX5xI24ukiKDgfY
   tRlHCLlA7IhxFiPI3ud4LdMk18XN8lkJdbLyQkccWtTkONQ1dTr+bcWk/
   qcs3EJ9yy6OAejwna+ya5HJwPpjPMdqK7X6hJWN6iaLTjiKg1Wu7E96yU
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fiVjXspTC+it6lcBUkjP2Oto3/hNkUH99pmvJs7QBmN9c3U0HLGyIMxwSVGXnQKf39T6r2RRCE
 uK/WCtExn2HTB9t8rfyS7m/Ni86TSMH1FuNjbj7tOoEtbTGA+31YIJ03CknguXtMN5PL5NK4JU
 TgvAxOQudR3x103kWk4oaDiTygLToZ+aWzxBIduxlGYiqzqRdHhZNr7ToNnPVPrtxNb92BbRYk
 mlZvbtRSwZN00ZwhTg4Z5zY1eYfRfXYwbP9svncVLjSuWo+Fh4CHv+l2BXCSGqfkIA42T35Mjn
 UdU=
X-SBRS: 5.1
X-MesageID: 45278750
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pjRvOqA++2VDlGnlHemL55DYdb4zR+YMi2TDtnoBKiC9Hfb0qy
 nDppsmPHzP6Ar5OktLpTnoAsDpfZq7z/BICOEqVotKNzOLhILHFuBfxLqn7gSlPhbT2YdmpM
 VdWpk7JdHrD2FAq4LQ/Am8Hr8bsb262ZHtqOvFzU5Xa0VPZ7t75wl0MQqVe3cGITV7OQ==
X-IronPort-AV: E=Sophos;i="5.83,255,1616472000"; 
   d="scan'208";a="45278750"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpuid: Fix HLE and RTM handling (again)
Date: Mon, 7 Jun 2021 13:41:16 +0100
Message-ID: <20210607124116.24250-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For reasons which are my fault, but I don't recall why, the
FDP_EXCP_ONLY/NO_FPU_SEL adjustment uses the whole special_features[] array,
not the two relevant bits.

HLE and RTM were recently added to the list of special features, causing them
to be always set in guest view, irrespective of the toolstacks choice on the
matter.

Rewrite the logic to refer to the features specifically, rather than relying
on the contents of the special_features[] array.

Fixes: 8fe24090d9 ("x86/cpuid: Rework HLE and RTM handling")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reported-by: Edwin Török <edvin.torok@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpuid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index f3c8950aa3..958caf35da 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -672,9 +672,11 @@ void recalculate_cpuid_policy(struct domain *d)
     sanitise_featureset(fs);
 
     /* Fold host's FDP_EXCP_ONLY and NO_FPU_SEL into guest's view. */
-    fs[FEATURESET_7b0] &= ~special_features[FEATURESET_7b0];
+    fs[FEATURESET_7b0] &= ~(cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
+                            cpufeat_mask(X86_FEATURE_NO_FPU_SEL));
     fs[FEATURESET_7b0] |= (host_cpuid_policy.feat._7b0 &
-                           special_features[FEATURESET_7b0]);
+                           (cpufeat_mask(X86_FEATURE_FDP_EXCP_ONLY) |
+                            cpufeat_mask(X86_FEATURE_NO_FPU_SEL)));
 
     cpuid_featureset_to_policy(fs, p);
 
-- 
2.11.0


