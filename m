Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C6158A989
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 12:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381025.615520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJujU-00018W-TJ; Fri, 05 Aug 2022 10:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381025.615520; Fri, 05 Aug 2022 10:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJujU-000150-Pn; Fri, 05 Aug 2022 10:39:08 +0000
Received: by outflank-mailman (input) for mailman id 381025;
 Fri, 05 Aug 2022 10:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIDu=YJ=citrix.com=prvs=2098568dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJujT-0000g3-IP
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 10:39:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a447cc-14aa-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 12:39:06 +0200 (CEST)
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
X-Inumbo-ID: d3a447cc-14aa-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659695946;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lqB3xQU+A2yYIjTyl1oqGJaxhEwCyRZkCLnoN3kmAh0=;
  b=SOKNEq7Qai43rbVaCDAisSAJfJ+0DBpEMYxmb6cJ/WRMMNtwrAua5utW
   R06qU1UuPwYzRd2J8KTuoxJjVnL0Rdn0AhinTh/oSuHCq0yXRs3vwopu3
   VZ4LehyOXB3frcshVnXYZNYwhkVm1B8FxGxOA4N/Tj7eYAuvf17rig2/u
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77215048
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aXToTqy2gZGQGtED8J16t+dZxirEfRIJ4+MujC+fZmUNrF6WrkUOm
 GtLUGyOPa6KZzDzKN9xbISz9ksAuMDXytUyHVRuqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Esz5K+aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1fFnttE40o2N1ZJlBz5
 6JCATYGYjyq0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzpZRFVN0hRI5U5hOqy3VH0ciFCqULTrq0yi4TW5FMuiuGwaIaFEjCMbf97uEqHv
 m7nxn/wWRg7CoWA6hbY90v504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTg9O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9eGinrZmUnRGJFw8kEH1cPwYCRgcpyoy2yG0stS4jXuqPAYbs0ICkR2+tn
 GnWxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5FIPv88KbSrwMf4fj2eN5yMCncDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5Rrpns/PV+liEr
 ow32gnj40w3bdASqxL/qeY7RW3m51BibXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:R8Gfha1zD36yff5xi8ku5QqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77215048"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/wait: Describe RSB safety
Date: Fri, 5 Aug 2022 11:38:40 +0100
Message-ID: <20220805103840.23796-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It turns out that we do in fact have RSB safety here, but not for obvious
reasons.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/wait.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index e45345ede704..1a3b348a383a 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -210,6 +210,26 @@ void check_wakeup_from_wait(void)
     }
 
     /*
+     * We are about to jump into a deeper call tree.  In principle, this risks
+     * executing more RET than CALL instructions, and underflowing the RSB.
+     *
+     * However, we are pinned to the same CPU as previously.  Therefore,
+     * either:
+     *
+     *   1) We've scheduled another vCPU in the meantime, and the context
+     *      switch path has (by default) issued IPBP which flushes the RSB, or
+     *
+     *   2) We're still in the same context.  Returning back to the deeper
+     *      call tree is resuming the execution path we left, and remains
+     *      balanced as far as that logic is concerned.
+     *
+     *      In fact, the path though the scheduler will execute more CALL than
+     *      RET instructions, making the RSB unbalanced in the safe direction.
+     *
+     * Therefore, no actions are necessary here to maintain RSB safety.
+     */
+
+    /*
      * Hand-rolled longjmp().
      *
      * check_wakeup_from_wait() is always called with a shallow stack,
-- 
2.11.0


