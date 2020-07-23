Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418B322B5A1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 20:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyfvl-0005W7-3t; Thu, 23 Jul 2020 18:26:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jyfvk-0005W1-60
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 18:26:56 +0000
X-Inumbo-ID: 153a8c80-cd12-11ea-876c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 153a8c80-cd12-11ea-876c-bc764e2007e4;
 Thu, 23 Jul 2020 18:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595528814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U2+CiKFwpvLxh4d4IMieke3JfjjRWJo1j+sz6ZqIRBQ=;
 b=OHJFG2IdBBse5EnsfH2vLIoCxgPazZWr9VM9brC+EcLgFRmp5OSA1j2a
 4rIpERm5FbV5xNETHV2zMvN31HCsze6sXI0diYGBpY8ajznCNrACwFD9K
 Im0wgNCXwha1IsjlI+i3GfrTsRXTOjnt1fglb0FWFeohUCiXTLgU0iQcx E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: huDvZPas59Cux8i69MV9rDin8lFZkNRXN/fcYdCLfJNG6dTzbtnmBbZXSyObCLxPGbU6sz0uqR
 DrnU3jqSjlqgTzHUwuuDVm4Ime9uq6gqGSRXCSShg1CySsJe3aDnCNLzzJBKf89svGttKGIWEG
 Rkxwq+zlgFSeWJ57k5ksdgCjz+W6uazB+b9o5A7ryYNW+pBsD0fw7uJdKtO4nbNGsU8wPCFUqS
 CNdtugG1M36GOiWc+1QLMR1Wa2qzDLVvB6otzOI9GZCdA5CgzFWD7GTkdTx6Gnpk9ndvrhy5vT
 zzg=
X-SBRS: 2.7
X-MesageID: 23086844
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,387,1589256000"; d="scan'208";a="23086844"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/pv: Make the PV default WRMSR path match the HVM default
Date: Thu, 23 Jul 2020 19:26:26 +0100
Message-ID: <20200723182626.7500-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

The current HVM default for writes to unknown MSRs is to inject #GP if the MSR
is unreadable, and discard writes otherwise. While this behaviour isn't great,
the PV default is even worse, because it swallows writes even to non-readable
MSRs.  i.e. A PV guest doesn't even get a #GP fault for a write to a totally
bogus index.

Update PV to make it consistent with HVM, which will simplify the task of
making other improvements to the default MSR behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index f14552cb4b..efeb2a727e 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1113,7 +1113,10 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
-        if ( (rdmsr_safe(reg, temp) != 0) || (val != temp) )
+        if ( rdmsr_safe(reg, temp) )
+            break;
+
+        if ( val != temp )
     invalid:
             gdprintk(XENLOG_WARNING,
                      "Domain attempted WRMSR %08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
-- 
2.11.0


