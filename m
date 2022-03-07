Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE34D0009
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 14:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286037.485359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDOW-0007Xb-7P; Mon, 07 Mar 2022 13:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286037.485359; Mon, 07 Mar 2022 13:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDOW-0007VR-4S; Mon, 07 Mar 2022 13:27:24 +0000
Received: by outflank-mailman (input) for mailman id 286037;
 Mon, 07 Mar 2022 13:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NfF=TS=citrix.com=prvs=058fb9784=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRDOU-0007VL-V2
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 13:27:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5047a127-9e1a-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 14:27:21 +0100 (CET)
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
X-Inumbo-ID: 5047a127-9e1a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646659641;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8WBhbeFM83plyJRJ4bS9p+w4+qcZkh9ZBtc9lqg5Il0=;
  b=R/AhZsHXd00PMtd2D3DdRz5dDcTdRqQ+vuJB2A1fO1UIcZiACnfZazEM
   HfOE4uzi4ablmmi8vwcO6PAkKF2J1x4GjjQZB+birkL0iRWcxp5cOK1D+
   PN1+PT918Wkll+SXdhP7g+u8du71oq5VPoZMMww44qIZv2e2YbxaI4tf5
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65605479
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BQT+96yWp9c93w7XsaN6t+dHxirEfRIJ4+MujC+fZmUNrF6WrkVUz
 zQeW2qBOKzfYjGgLdsiPIm28R8FsceGyoJjGVZkrSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljMaMR18HfazwpOUxVzcbOHlxIIRn5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 pRBNGYwPXwsZTVWJXwnLb03tdz3j3bZegZXhm6QnfIotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9Rg1A/V5OnV3zqYKmwqDRUZZ8EPldBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAKzARVodt/xory9U
 J8swZT20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mvmwveh82aZZUJVcFh
 XM/XisLuPdu0IaCN/crM+pd9exwpUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Eb5rak0gECbamCsQVmKZKRW03wbEALcieg6RqmiSreGKKxElJ5yft/I4c
IronPort-HdrOrdr: A9a23:MM0rHKO6eOw0tMBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65605479"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cet: Force -fno-jump-tables for CET-IBT
Date: Mon, 7 Mar 2022 13:26:51 +0000
Message-ID: <20220307132651.25691-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Both GCC and Clang have a (mis)feature where, even with
-fcf-protection=branch, jump tables are created using a notrack jump rather
than using endbr's in each case statement.

This is incompatible with the safety properties we want in Xen, and enforced
by not setting MSR_S_CET.NOTRACK_EN.  The consequence is a fatal #CP[endbr].

-fno-jump-tables is generally active as a side effect of
CONFIG_INDIRECT_THUNK (retpoline), but as of c/s 95d9ab461436 ("x86/Kconfig:
introduce option to select retpoline usage"), we explicitly support turning
retpoline off.

Fixes: 3667f7f8f7c4 ("x86: Introduce support for CET-IBT")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/arch.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index f6fc852b5767..8e57476d6573 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -51,7 +51,10 @@ CFLAGS-$(CONFIG_CC_IS_CLANG) += -mretpoline-external-thunk
 endif
 
 ifdef CONFIG_XEN_IBT
-CFLAGS += -fcf-protection=branch -mmanual-endbr
+# Force -fno-jump-tables to work around
+#   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104816
+#   https://github.com/llvm/llvm-project/issues/54247
+CFLAGS += -fcf-protection=branch -mmanual-endbr -fno-jump-tables
 $(call cc-option-add,CFLAGS,CC,-fcf-check-attribute=no)
 else
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
-- 
2.11.0


