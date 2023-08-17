Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F83E77F47C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 12:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585288.916371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWab9-0001Bg-OX; Thu, 17 Aug 2023 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585288.916371; Thu, 17 Aug 2023 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWab9-00019D-LY; Thu, 17 Aug 2023 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 585288;
 Thu, 17 Aug 2023 10:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKJa=EC=citrix.com=prvs=586b2f634=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qWab7-000197-PK
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 10:51:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0097ea06-3cec-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 12:51:23 +0200 (CEST)
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
X-Inumbo-ID: 0097ea06-3cec-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692269482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V5WOe4yk5HeIxVGmnhq2Jv7FJIe93jWc3o7VNRyDTV4=;
  b=Up2lfpWaQoVW7fZslTHRE+3YLZ1NX9/wqL/fqngoVppFpasRsLmbGtzO
   YoYXJZ2e6UIhltoM76jZ32els7XdFA7Q8qSM3iFJVTsbub3ccN4/RAm7j
   O9C+wvlb5Fk1K4DYru+f/XUOXBYVzpZiIRgIf4jLJULkzFhzsxkFz7Rks
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120193595
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Mx49/K2TIXHEadsAVfbD5dZxkn2cJEfYwER7XKvMYLTBsI5bpzEDy
 zEaXWuOPv2MYzb0Kd5waNi28hgF7JfSzNFjTwJspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxnOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJ0xP/
 6xIb3c2QyunmLruz+u5SeJhiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ8NxxfD+
 zObl4j/KiFGHtaTlAG/zmD2mPDTpy/AftMpBoTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPIJTbd8slvUjPOJvUDAXDNsoiN9hMIOkuI3T2x6k
 RiysujNGmQ3v+SXSnmQ+eLBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qqf6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xLpTZX1uvHbXKAnoIF1Pz6zYWNE7qQc2d6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0PPUtOtrvW5tylfiI+THZuhb8NIsmjn9ZLlPvwc2TTRTIgzCFfLYEwMnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Tq7eHwP9Dz+ieD2TCfMGd843K6mMrhRAFWs/F+Er
 L6y9qKil31ibQEJSnOMrddLcwlRfRDWx/ne8qRqSwJKGSI+cElJNhMb6ehJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:g/cQjKmQf9xO2o1nx5dtxUc0bmLpDfLr3DAbv31ZSRFFG/FwyP
 re/sjzhCWVtN9OYgBCpTnyAtjwfZq6z+8A3WBxB8bWYOCCggqVxe5ZnOzfKlHbal7DHgA079
 YYT0BRYOeAdWSSp/yKhjVRKr4bsaK6GErBv5al854Vd3AWV0gC1XYHNu/4KDwTeOAuP/NQf/
 DwiaQ3wgZIVk5nEvhTbUN1LdQryee75K4OLSR2eSLPhTPjsQ+V
X-Talos-CUID: =?us-ascii?q?9a23=3AURNyB2gdDAg9At6c7MNDUvSrRjJuVFDcxieAZAi?=
 =?us-ascii?q?DJF1NV+XNRgaS+6hpnJ87?=
X-Talos-MUID: 9a23:eeS3LQkREtKDKXnWvo1XdnpSaO1i7/mVMnwfy4sZp/OIDgohACWk2WE=
X-IronPort-AV: E=Sophos;i="6.01,179,1684814400"; 
   d="scan'208";a="120193595"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [XTF PATCH] xtf-runner: python3 fix
Date: Thu, 17 Aug 2023 11:51:11 +0100
Message-ID: <20230817105111.4413-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

issue:
  File "/home/xtf/xtf-runner", line 410, in interpret_selection
    if not line.startswith("xen_caps"):
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: startswith first arg must be bytes or a tuple of bytes, not str

Adding `universal_newlines` open stdout as text file, so line should
be a `str`. `universal_newlines` is available on python 2.7. A new
alias `text` is only available in python 3.7.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I've only tested the patch on Debian Bookworm, with python-is-python3
    package (python symlink) as osstest run `./xtf-runner ...`.
    
    I haven't tried python2.7.

 xtf-runner | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xtf-runner b/xtf-runner
index 6352a5b..5741e64 100755
--- a/xtf-runner
+++ b/xtf-runner
@@ -403,7 +403,7 @@ def interpret_selection(opts):
 
         host_envs = []
 
-        cmd = Popen(['xl', 'info'], stdout = PIPE)
+        cmd = Popen(['xl', 'info'], stdout = PIPE, universal_newlines=True)
         stdout, _ = cmd.communicate()
 
         for line in stdout.splitlines():
-- 
Anthony PERARD


