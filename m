Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C971A067
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542592.846616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jRZ-0004OS-L1; Thu, 01 Jun 2023 14:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542592.846616; Thu, 01 Jun 2023 14:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jRZ-0004Lb-Hp; Thu, 01 Jun 2023 14:38:25 +0000
Received: by outflank-mailman (input) for mailman id 542592;
 Thu, 01 Jun 2023 14:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFRJ=BV=citrix.com=prvs=509590c99=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4jRX-0004LV-FA
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:38:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3da69a4-0089-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 16:38:21 +0200 (CEST)
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
X-Inumbo-ID: f3da69a4-0089-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685630301;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cS9WCOWJlS5yb6BIhP47joZYK01KQc2UU5TXtJ5OnQ0=;
  b=QowgW3k9uFKmLtO2VDJpJU9RKHsQrz5NC8tnvFbxe9cZgUkUSMUutsgg
   acZHviKkAhFHpbxLJ4L7ggVmd369dPHNOChNwcp4JRaje7fwpATtQtBOP
   v6CAHyY6+7Q6ngncP7BbXxjOeOIF2tx1xIFl6LJpRcD8S3KHB9F9b8typ
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109990665
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JYjSFKmKBY8ZpHFx8V29bJLo5gydJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXjyOO66PY2LzKY9wYY2y/E8PupCGzN9rSQE9qH89QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5AaGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aUUIhZSch2Ivu6V64unQdJr28McJta+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A9
 zOXpzqnX3n2MvSw6yGj+Synwdbyuh7bdq1JTpSf/8Vl1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewddQQEjvMXuq7g/rTn2Ut1YF/OysdfqTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4uWAWyKRBaJxsldrVj
 Kj752tsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonEzOBPPjz21yBV8+U3aB
 Xt9WZz2ZZr9If02pAdaus9HieN7rszA7T67qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uzw/Cikk0FOMWnO3m/zGLmBQxSRZTNLcys+pM/my/qClYOJVzN/NeKmut/K9w0wv0J/goKl
 1nkMnJlJJPErSWvAW23hrpLM9sDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:XIuZS6jQCNLYvOe12cluiBsrK3BQX6p23DAbv31ZSRFFG/FwyP
 re+cjzhCWE6gr5BktQ+uxoYJPwMk80laQZ3WEQVY3SJzUOy1HYXr2KjLGSgwEIfheVh4pgPM
 hbAtdD4bHLfCFHZIPBkXmF+rUbsZq6GcKT9JnjJh5WJGkAB84PjmcJbXf8LqQ1fng2OXNTLu
 vn2iMznUvdRZ1hVLXHOpBqZZm6m/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4knEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXQISaCUmREXee
 v30k4d1vdImivsl6aO0EDQMjzboXATArnZuAWlaDXY0JHErXkBer98bMpiA2/kAgwbzZNB+Z
 MO5nmesZVPCxPGgWDS2/jkPisayHackD4aiugUgGVYUYwCLJlrjaJa0n90Pf47bX3HAKZOKp
 g/MCgZ3ocLAAKnRmGcsW91zNO2WHMvWh+AX0gZo8SQlyNbhXZj0iIjtYMid9g7hdoAorR/lq
 n5255T5f1zZ95Tabg4CPYKQMOxBGCISRXQMHiKKVCiEK0cIXrCp5P+/b1wvYiRCd015Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA8sLzhQ7jgNzGFVTkV4oWdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7QJVWIWl2arxehj/6YSPEnivmEPyiigWASoelGFPEK0dTZl/C
X-Talos-CUID: 9a23:rsQqhWzwFcaGEM7briKABgVNFsoDLWHQx07cAGSBFW1ST+CSdlWPrfY=
X-Talos-MUID: 9a23:iFPG3gYvRO4GIeBTmB33ojo8P4BR3oOTKG4iys8vnMC/Onkl
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="109990665"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>
Subject: [PATCH] x86/ucode: Exit early from early_update_cache() if loading not available
Date: Thu, 1 Jun 2023 15:38:13 +0100
Message-ID: <20230601143813.1553740-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If for any reason early_microcode_init() concludes that no microcode loading
is available, early_update_cache() will fall over a NULL function pointer:

  (XEN) Xen call trace:
  (XEN)    [<ffff82d04037372e>] R show_code+0x91/0x18f
  (XEN)    [<ffff82d040373a49>] F show_execution_state+0x2d/0x1fc
  (XEN)    [<ffff82d040374210>] F fatal_trap+0x87/0x19a
  (XEN)    [<ffff82d040647f2c>] F init_idt_traps+0/0x1bd
  (XEN)    [<ffff82d04063854f>] F early_page_fault+0x8f/0x94
  (XEN)    [<0000000000000000>] F 0000000000000000
  (XEN)    [<ffff82d040628c46>] F arch/x86/cpu/microcode/core.c#early_update_cache+0x11/0x74
  (XEN)    [<ffff82d040628e5c>] F microcode_init_cache+0x5a/0x5c
  (XEN)    [<ffff82d04064388f>] F __start_xen+0x1e11/0x27ee
  (XEN)    [<ffff82d040206184>] F __high_start+0x94/0xa0

which is actually parse_blob()'s use of ucode_ops.collect_cpu_info.

Skip trying to cache anything if microcode loading is unavailable.

Fixes: dc380df12acf ("x86/ucode: load microcode earlier on boot CPU")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Found while doing something unrelated, but this is going to interact poorly
with MCU_CONTROL_DIS_MCU_LOAD.
---
 xen/arch/x86/cpu/microcode/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 5a5c0a8c70db..9029301107d6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -789,6 +789,9 @@ int __init microcode_init_cache(unsigned long *module_map,
 {
     int rc = 0;
 
+    if ( !ucode_ops.apply_microcode )
+        return -ENODEV;
+
     if ( ucode_scan )
         /* Need to rescan the modules because they might have been relocated */
         microcode_scan_module(module_map, mbi);

base-commit: 59d0bf62861f5c9b317ccf89f8b5c8b4d19927ad
prerequisite-patch-id: c3f6ae7def85b63808449493e3b5185bc40c405d
prerequisite-patch-id: 59a20dfb4778c62bf512f746e36b1bea0949b0a8
prerequisite-patch-id: a70c8dd42245affe402b08cacd5872b5a32a6d69
prerequisite-patch-id: 3efc26e008858670286c173f77f8ec34ddfd9df1
prerequisite-patch-id: 5f6ddddf7dd6029f401d13bbb87ac3bb88c15700
prerequisite-patch-id: 4133b7d49c978a89042e95f899f46c4ec4ac4498
prerequisite-patch-id: d2d3a24a650f6b1b50e279be158cdd097eb43a4b
prerequisite-patch-id: 358299b6b56983e3c069ea1f30e7cf214b0a2c54
prerequisite-patch-id: b17530cf5672ada3e7792606b7a3bef55c8aa372
prerequisite-patch-id: e9bc40cc80e61b24d90eeb7097cd9b703f0170a6
-- 
2.30.2


