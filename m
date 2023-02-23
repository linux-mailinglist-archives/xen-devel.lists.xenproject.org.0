Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927926A0883
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500309.771621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAcz-0005QM-Ob; Thu, 23 Feb 2023 12:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500309.771621; Thu, 23 Feb 2023 12:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAcz-0005Ny-L5; Thu, 23 Feb 2023 12:23:13 +0000
Received: by outflank-mailman (input) for mailman id 500309;
 Thu, 23 Feb 2023 12:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVAcx-0005Nq-RA
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:23:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d43fbb4a-b374-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 13:23:09 +0100 (CET)
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
X-Inumbo-ID: d43fbb4a-b374-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677154989;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k1spkpD+WpgAFzsOArAgnfm4RT8aCjKorF4WX/Yfd7Y=;
  b=Ai+tuO4A+zQaRXml7qfbDR/U51cYowh7WROYGFKZzVV06dJFZ6PoU8K9
   TpxizFiUr2lr/DDUmGPiZz907FLSdJK9d+dPsnKQpegCsvhfHof5xyn3+
   k4Nfjo8os3riWhO3rL3Xuqvazf3EGg/VKspKXxkomufFPPEONYpiovgYj
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98216639
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:F34VDqljhYvbuWiflNggm5Lo5gyXJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMW2jUPPyKNGLwf4wkbY6w8h5Q75PRyoJmSFBqqShhRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5gSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dgnKmwMdTObvM2dy7uFV9BqqM0vcda+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfI/
 DuYoT+oav0cHOeVlGeso3Szv+3KsBPkCIgvFLa02eE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTQs7T1cE+Pr7m64YhRvxU+9lPqe508KgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKvFmSx28zaK7onAMFh
 2eC0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZo342NBbBhjiyzxREfUQD1
 XCzK5vEMJrnIf4/kGreqxk1jNfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrlR0U9wmy2Mq
 4w3H5LTm31ivBjWPnG/HXg7cQpbchDWxPne96RqSwJ0ClM8RzpwUaGJkelJlk4Mt/09q9okN
 0qVAidwoGcTT1WedW1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:xeh4Bq2USvsok3SE2lfioAqjBLYkLtp133Aq2lEZdPUCSL39qy
 nOppQmPHDP4wr5NEtLpTniAsi9qBHnmqKdurNhWItKNTOO0FdASrsO0WKI+VPd8kPFmtK0es
 1bAs9D4HGbNykYsS5aijPIceod/A==
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="98216639"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/compiler: Clang 14 and later understands attribute((error))
Date: Thu, 23 Feb 2023 12:22:45 +0000
Message-ID: <20230223122245.2557228-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Adjust the ifdefary for `nocall`.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/xen/compiler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index a5631303348b..7d7ae2e5e4d9 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -31,7 +31,7 @@
 
 #define __weak        __attribute__((__weak__))
 
-#if !defined(__clang__)
+#if !CONFIG_CC_IS_CLANG || CONFIG_CLANG_VERSION >= 140000
 # define nocall       __attribute__((__error__("Nonstandard ABI")))
 #else
 # define nocall
-- 
2.30.2


