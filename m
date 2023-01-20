Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022306755F4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 14:37:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481784.746903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrZS-00083P-E5; Fri, 20 Jan 2023 13:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481784.746903; Fri, 20 Jan 2023 13:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrZS-00081C-B5; Fri, 20 Jan 2023 13:36:42 +0000
Received: by outflank-mailman (input) for mailman id 481784;
 Fri, 20 Jan 2023 13:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIrZR-000816-DH
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:36:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76d5cf46-98c7-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 14:36:39 +0100 (CET)
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
X-Inumbo-ID: 76d5cf46-98c7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674221799;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U2vyEDsXtFKkNXikJRmtfrMERJCdL0+Q0DPDGdG9Ax4=;
  b=SOjgmM7/42qDXo0OE5nqzvv1kVZBoCJW3xgGDVY8GT9+T5C1dzVCs8ES
   OBhpgWEKJ9oSAoYU9k2hsWnu7MmhT4L7nxY6PKPvK78SuqCxujl31LN2C
   mepF+byOtgjgJH29sWmZUKxMRF7j88SucWazQFIDvnLa7LejB7VXGVE9R
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93554171
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/enUAaNMs/M6mtTvrR3cl8FynXyQoLVcMsEvi/4bfWQNrUongTJRz
 GAaW2CAb/3eZGb2eN5wOtyw8BsD7JLVytJgTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5ARmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sh3X1NFr
 tYGEXMuZzrTmuCp66/ja9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3RGJgJxxnBz
 o7A10bBOhsqFdDP8D2m4mu+pcHX3iikBbtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaIpgUZWsZQO+Qi5RuR17HP5AKEGmkDSCUHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvMEyn1GqqoQS2aFyhLH2RZTzE9DigMyYn+op4Yk0rud4M2eEKqteEZCQ0c0
 hjT8ndi3uVK1pVbv0mo1QuZ2mzx//AlWiZwv1yKBTz9s2uVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwYnY1RfHNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0MvMuPtnrUpp7k/mI+THZuhf8N4omX3SMXFXfoHEGibC4gQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eZD+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid9408OCbyuMnWNqOb+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:zBFy96wy4LkwDUMrDSXDKrPx0ugkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBepTlEAtjyfZvdnaQFhrX5To3SIjUO2VHYZ72KiLGP/9SOIVyEygcw79
 YET0E6MqyNMbEYt7ex3ODbKadb/DDvysnBuQrH9RlQpENRGtxdBmxCe2Cm+zhNNXF77O0CZe
 OhD6R81l6dkEAsH4iG7iBvZZmTm/T70L72axsPBxoq8yiJly6l5YT7HR+RwwsEXykK5bs562
 DKnzXj4K+uqeu2x3bntlP73tB7idHlwttGCNetjtEPKjLwogy0ZIJnMofy3gwdkaWC+VwumN
 nJrwwBO91p63TNW2mprRzmy2DboVUTwk6n5U6ThHPipcDjfSk9GtpljZ9UdRHIgnBBgDgw6t
 MP44pX36AnRS/orWDY3ZzlRhtqnk27rT4LlvMStWVWVc8zeaJctosW+WJSCdMlEDjh4I4qPe
 FyBIWEjcwmNm+yXjT8hC1C0dasVnM8ElOvRVUDgNWc13x7jW101EwRwe0YhzMl+IgmQ5dJyu
 zYOuBDla1ITOURcaVhbd1xBfefOyjoe1bhIWiSKVPoGOUuPG/MkYf+5PEP6OSjaPUzvewPcM
 CqajxlnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRZLwWBfzFWwGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5PwknXR4RSE38DS8cY0+xLAW5mmvi7drECi9arKMo7ZYCdSArMY1mPRE
 friQKDf/mp7SiQKwvFaVbqKj6dJXAWO/pLYefnFqMoufkw37Z3w30oYY7Q3LDLFdRziN15QK
 I3GsKWrkqanxj0wY+a1RQqBvKqZnwlqYkJpBtx1Hk32gXPAOg+Uv2kCBJv9WrCPBN5UsXQCR
 VSo1Rs9cuMXtyt+Rw=
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93554171"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH] build: fix building flask headers before descending in flask/ss/
Date: Fri, 20 Jan 2023 13:36:26 +0000
Message-ID: <20230120133626.55680-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Unfortunatly, adding prerequisite to "$(obj)/ss/built_in.o" doesn't
work because we have "$(obj)/%/built_in.o: $(obj)/% ;" in Rules.mk.
So, make is allow to try to build objects in "xsm/flask/ss/" before
generating the headers.

Adding a prerequisite on "$(obj)/ss" instead will fix the issue has
that the target used to run make in this subdirectory.

Unfortunatly, that target is also used when running `make clean`, so
we need to ignore it in this case. $(MAKECMDGOALS) can't be used in
this case as it is empty, but we can guess which operation is done by
looking at the list of loaded makefiles.

Fixes: 7a3bcd2babcc ("build: build everything from the root dir, use obj=$subdir")
Reported-by: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/xsm/flask/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index d25312f4fa..2d24346ee3 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -16,7 +16,11 @@ FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
 AV_H_FILES := av_perm_to_string.h av_permissions.h
 ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
 
-$(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
+# Adding prerequisite to descending into ss/ folder only when not running `make
+# clean`.
+ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
+$(addprefix $(obj)/,$(obj-y)) $(obj)/ss: $(addprefix $(obj)/,$(ALL_H_FILES))
+endif
 extra-y += $(ALL_H_FILES)
 
 mkflask := $(srcdir)/policy/mkflask.sh
-- 
Anthony PERARD


