Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 453FF40375C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181615.328847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHr-00024q-DL; Wed, 08 Sep 2021 09:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181615.328847; Wed, 08 Sep 2021 09:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHr-00021L-93; Wed, 08 Sep 2021 09:54:35 +0000
Received: by outflank-mailman (input) for mailman id 181615;
 Wed, 08 Sep 2021 09:54:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FUO+=N6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mNuHp-0001EI-4K
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c177d7de-108a-11ec-b148-12813bfff9fa;
 Wed, 08 Sep 2021 09:54:28 +0000 (UTC)
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
X-Inumbo-ID: c177d7de-108a-11ec-b148-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631094868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AsZBJR8DqTXnM0J0C60Tfl9G1/1Dykb1qhx3aXLPQKA=;
  b=XFhnteq3B7TK12Iq7u47AlagKCEKuLPmZeTIteKciX2sJ2F7XbkOaaho
   0mkFKRdswyzlbxRj3WRpXHLhUFzFkKylXWqhw7dbWaVdPqkWVDHA85Ti4
   tHUd5RGfaSEg26wuJdVDayBm4O/t97R0PLvHgsf2+45G81oR0SlKJ5QlV
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5+r2TLm/n1r96Gjv2CZirI56HcpkfJGxmXSw1x1oAV2t8202ESGWCBYciVSTu1jDtTh5ZnXAhd
 +RuMZxzI+C06I7+2UGajzNuSPGRA+Ewv8wqQMEG5P76gdLwg7CC3azHyEdGu1Th6t+44fDdVcz
 56LHITxzjQbHwqXB6f/PZnQZvyHuwqoPJlNBnDlCJu46gL0HAKQa0AVc/RCA/YK9ZEjxHBqaS4
 8dbD83KwdFvvMv3AHliFmoBdH83FODY0MWG8NIQvM5M15SGv52813EGVj7pPFhhKSkRtQUfhTO
 BpwP/FEuN3G5HPNICzwNvt6i
X-SBRS: 5.1
X-MesageID: 51835828
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KULzgKmXcDch0cVoHxuZlxF/ccrpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.85,277,1624334400"; 
   d="scan'208";a="51835828"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, "Daniel De
 Graaf" <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH 1/2] build: set policy filename on make command line
Date: Wed, 8 Sep 2021 10:54:21 +0100
Message-ID: <20210908095422.438324-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210908095422.438324-1-anthony.perard@citrix.com>
References: <20210908095422.438324-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In order to avoid flask/Makefile.common calling `make xenversion`, we
override POLICY_FILENAME with the value we are going to use anyway.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/xsm/flask/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 637159ad8276..093ee50bf1c8 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -42,7 +42,7 @@ FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
 policy.bin: FORCE
-	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common -C $(XEN_ROOT)/tools/flask/policy FLASK_BUILD_DIR=$(FLASK_BUILD_DIR)
+	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common -C $(XEN_ROOT)/tools/flask/policy FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
 	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
 
 .PHONY: clean
-- 
Anthony PERARD


