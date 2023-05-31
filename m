Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640D718662
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 17:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541881.845106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4NnC-0004e8-5w; Wed, 31 May 2023 15:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541881.845106; Wed, 31 May 2023 15:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4NnC-0004bw-34; Wed, 31 May 2023 15:31:18 +0000
Received: by outflank-mailman (input) for mailman id 541881;
 Wed, 31 May 2023 15:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sC/f=BU=citrix.com=prvs=508b7ea43=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4NnA-0004bo-N1
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 15:31:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aa24a06-ffc8-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 17:31:14 +0200 (CEST)
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
X-Inumbo-ID: 2aa24a06-ffc8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685547074;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x/kGhRmaCQ9yLV1zhMt3H3YzU8lRSSys04lMtxP7CR0=;
  b=MDCQ5YB7YYZ5nKqX/bLgxFnuxqRO3wZRu7jgH/L5weHT/Mbpo2YmNpsl
   gnzxFbQ+m1/Skg9GXZIzpyFpd5V8WLFN7O4zjPTVEgt2riJMe+8OlZd/o
   HHR2cJcfliC5xJdGm6ucYdILlylpjcMbHz0NATaHlRS8QwYOVcQQFKrGT
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110425760
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3HH0/qrhadyCLsKT06VJus3+Ks5eBmIEZRIvgKrLsJaIsI4StFCzt
 garIBnQaP3ZZDGkedsna4++9kIGvJDVmIVhTQtqqS1gQi0SpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzCBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABUNfDmsquOM/K3hRrBQndl+HZbnPLpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jufpzijX05EbLRzzxK50SywpNPLsRrXXaYSM5Li5M9JkHOqkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMg48vKj6wytC7QFNo6LLWo0+yqFTHJl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWfh8B3iUsI2WBj
 KrvVeR5uvdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox7Ngz+0zhB9wf1mU
 Xt+TSpKJSxCYUiA5GPnL9rxLJdxnnxurY8tbcyTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6K9Y4xvQEx72Vl
 px/M2cBoGfCabT8AV3iQhhehHnHDf6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:iZU0f6lv4XMEuUeBMPg8K+DERLzpDfIX3DAbv31ZSRFFG/Fw9v
 re/sjzsCWetN9/YhwdcK+7SdC9qB/nmaKdmLNhWotKBTOW3ldAT7sSjrcKoQeAJ8SWzIc0v5
 uIFZIQNDSaNzhHZKjBjjVRZ70bsb26GNLCv5a680tQ
X-Talos-CUID: =?us-ascii?q?9a23=3AMXpNu2iuvJENBkb0g15kLc13azJuV33P5Vj9InW?=
 =?us-ascii?q?EFjxlEYGOVAKhp69kqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AGEsqZQ3jemC9lejYOmhstU7jJzUj34fwFGIxlbk?=
 =?us-ascii?q?/l8ygNQtfYSWsrySZe9py?=
X-IronPort-AV: E=Sophos;i="6.00,207,1681185600"; 
   d="scan'208";a="110425760"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>
Subject: [PATCH] xen/cpu-policy: Add an IBRS -> AUTO_IBRS dependency
Date: Wed, 31 May 2023 16:30:28 +0100
Message-ID: <20230531153028.1224147-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

AUTO_IBRS is an extention over regular (AMD) IBRS, and needs hiding if IBRS is
levelled out for any reason.

Fixes: defaf651631a ("x86/hvm: Expose Automatic IBRS to guests")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

This was an oversight of mine when reviewing the aformentioned patch.
---
 xen/tools/gen-cpuid.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index f28ff708a2fc..973fcc1c64e8 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -319,7 +319,7 @@ def crunch_numbers(state):
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
         IBRSB: [STIBP, SSBD, INTEL_PSFD],
-        IBRS: [AMD_STIBP, AMD_SSBD, PSFD,
+        IBRS: [AMD_STIBP, AMD_SSBD, PSFD, AUTO_IBRS,
                IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
         AMD_STIBP: [STIBP_ALWAYS],
 

base-commit: 465217b0f872602b4084a1b0fa2ef75377cb3589
-- 
2.30.2


