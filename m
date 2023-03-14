Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B902C6B9787
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509635.785795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RX-0006Y8-97; Tue, 14 Mar 2023 14:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509635.785795; Tue, 14 Mar 2023 14:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RX-0006Uf-4F; Tue, 14 Mar 2023 14:15:59 +0000
Received: by outflank-mailman (input) for mailman id 509635;
 Tue, 14 Mar 2023 14:15:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5RV-0004aK-Su
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:15:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc186cb0-c272-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:15:55 +0100 (CET)
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
X-Inumbo-ID: bc186cb0-c272-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/9L7vCCTMH++1ZUbrE71ZPsBvnajhXkBbzMQNg2Y4gQ=;
  b=BXllIWgH1j69vRCGyd762wrmvR3fkl1xvzW/smZbYnaBU2CP0Nhs37Za
   rco5/Hz8iSNSuGxG3C8UyxgeNBtasL8aB75VIM00MDZOgYX1DnzIaPO+C
   ehVadrJ44ZXhIvWoYA6bqeRl9liFm0/SBb87V5TzdGMXToSXUvIk3CnzR
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100156187
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:XbCDsaARLk3GLxVW/zHjw5YqxClBgxIJ4kV8jS/XYbTApDJ33jBWy
 mNKCmmAM//fajf1LY9yO4Wz8hhU6p/Ux4JnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwoc80EEcWy
 s0jCmo1bja+qsSx8LW6c7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4TSHJgLxxbHz
 o7A11ShHzcdaveT9SrG3nuS2dDuxDPwVI1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmIw7DR6hyUBUAFSCBAc90ssMIqRT0s2
 USNltmvDjtq2IB5UlrEqO3S92nrf3FIcylbP3RsoRY5D8fL+6hwnzSXcedYMvSNjvvINBf38
 zeLlX1r71kMtvIj26K+9FHBpjujoJnVUwI4jjnqsnKZAhBRP9D8OdHxgbTPxbMZddvCEAHd1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGpxZEdMKS
 BWJ0e+02HO0FCrCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6ywBd3y/5lY
 8rCKK5A6Er27ow2pAdaus9HieN7rszA7Tq7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ65TPHu2
 48HbaOikkwPONASlwGLqeb/23hWdylkbX03wuQLHtO+zv1OQzF5WqaBnO18K+SIXc19z4/1w
 510YWcAoHKXuJENAVzSMRiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:XFV++a5B3C85R6i8jgPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100156187"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH 6/7] tools/python: Improve unit test handling
Date: Tue, 14 Mar 2023 14:15:19 +0000
Message-ID: <20230314141520.3652451-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

 * Add X86_{CPUID,MSR}_POLICY_FORMAT checks which were missed previously.
 * Drop test_suite().  It hasn't been necessary since the Py2.3 era.
 * Drop the __main__ logic.  This can't be used without manually adjusting the
   include path, and `make test` knows how to do the right thing.
 * For `make test`, use `-v` to see which tests have been discovered and run.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/python/Makefile               |  2 +-
 tools/python/xen/migration/tests.py | 14 ++------------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/tools/python/Makefile b/tools/python/Makefile
index 511e7deae409..697299bf2802 100644
--- a/tools/python/Makefile
+++ b/tools/python/Makefile
@@ -36,7 +36,7 @@ uninstall:
 
 .PHONY: test
 test:
-	LD_LIBRARY_PATH=$$(readlink -f ../libs/ctrl):$$(readlink -f ../xenstore) $(PYTHON) -m unittest discover
+	LD_LIBRARY_PATH=$$(readlink -f ../libs/ctrl):$$(readlink -f ../xenstore) $(PYTHON) -m unittest discover -v
 
 .PHONY: clean
 clean:
diff --git a/tools/python/xen/migration/tests.py b/tools/python/xen/migration/tests.py
index ff2768946bb5..f22e2c2b7cf0 100644
--- a/tools/python/xen/migration/tests.py
+++ b/tools/python/xen/migration/tests.py
@@ -26,6 +26,8 @@ class TestLibxc(unittest.TestCase):
                          (libxc.X86_TSC_INFO_FORMAT, 24),
                          (libxc.HVM_PARAMS_ENTRY_FORMAT, 16),
                          (libxc.HVM_PARAMS_FORMAT, 8),
+                         (libxc.X86_CPUID_POLICY_FORMAT, 24),
+                         (libxc.X86_MSR_POLICY_FORMAT, 16),
                          ):
             self.assertEqual(calcsize(fmt), sz)
 
@@ -40,15 +42,3 @@ class TestLibxl(unittest.TestCase):
                          (libxl.EMULATOR_HEADER_FORMAT, 8),
                          ):
             self.assertEqual(calcsize(fmt), sz)
-
-
-def test_suite():
-    suite = unittest.TestSuite()
-
-    suite.addTest(unittest.makeSuite(TestLibxc))
-    suite.addTest(unittest.makeSuite(TestLibxl))
-
-    return suite
-
-if __name__ == "__main__":
-    unittest.main()
-- 
2.30.2


