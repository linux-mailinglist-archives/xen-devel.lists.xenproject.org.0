Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200297F20B2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 23:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637329.993090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D5A-0006Ir-Ne; Mon, 20 Nov 2023 22:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637329.993090; Mon, 20 Nov 2023 22:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D5A-00069C-HP; Mon, 20 Nov 2023 22:49:32 +0000
Received: by outflank-mailman (input) for mailman id 637329;
 Mon, 20 Nov 2023 22:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5D59-0005pp-0K
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 22:49:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fd74cc1-87f7-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 23:49:29 +0100 (CET)
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
X-Inumbo-ID: 0fd74cc1-87f7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700520568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3sQs0NPyCIz2F9DlyYtFEywO02GaqviYPBmMjYsQYss=;
  b=dLHAXekwU4/8cDc8QBozO3tlmyc6zRMxWzD+rhWzcaAuoi/3ZebGK2uA
   SZUq/woY/PZBKbvfR0VDcwJzE7c6OFQvwpTh9Nj2VMOi9+r1Mj26vRoRe
   tmMpPgrqnUOxdVKa6Wk55xkcZjnLU4/0SsExL8NmSMxFLO+ukJ0VP9oHr
   Y=;
X-CSE-ConnectionGUID: LtYo8xJLRvC+jqiF6E23hw==
X-CSE-MsgGUID: MYjbWUHGQ3Of01rMr+BAKQ==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127436306
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ViszRKnytzLpQl+33q/RHQLo5gx9JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbW22CafaMYmD0KNElaonk9xlT6pDUxtI2SwVrqy41RSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KiaVA8w5ARkPqkS5geGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dgEGTddfjKnvfydg7CiS8cyq554LNa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzH+
 jmYpDynav0cHPmuyzC6z1KDv7Tok3uiQqcIV5eR1cc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqZzIATAYDy8nupsc0lB2nZuhkFKm5n9jkAwbay
 jqBrDU9r7gLhMtN3KK+lXjNjiiwvJHPQkgw7x/OQ2O+xgpjYciuYInAwV3a5vZJKMCeVEuMu
 FANnsTY5+cLZbmXkyaAWvkKWrug6PCMKjT0i0NgBJQn+HKm/HvLVYZR6zZ6LQF3P9oeeDnoS
 EXOthhc4pAVN3yvBZKbeKroVZ5sl/K5U424B7aLNrKif6Sdaiej4BBpNV6y+1rzuwsuiKARZ
 7rBKsazWCNy5btc8NamewsM+eZ0nnhilD2JHM6T8vix7VaJiJeopVY53LimNLlRAFus+lm9z
 jqmH5LiJ+9jeOP/eDLL1oUYMEoHK3M2bbiv9JQPK7beeFY/QT5/YxM0/V/HU9Y990iyvr2Ql
 kxRp2cCkAav7ZE5AVniho9fhEPHAs8k8CNT0d0ENle0wXkzCbtDH49GH6bbiYIPrbQ5pdYtF
 qltRil1KqgXItgx02hHPMaVQU0LXEjDuD9iyAL8MWRmIsY5H1OYkjImFyO2nBQz4uOMnZNWi
 9WdOsnzGPLvmywK4B7qVc+S
IronPort-HdrOrdr: A9a23:HeWtGK4ZLHCFQbq/1QPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AXzENrGiZe9EO+Vz12OZbakUkGjJuVmHsyyfAAWu?=
 =?us-ascii?q?CF00qSqSUZwG9ovhkjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AhQ7Htg5xisfcDZK0sJ6dIuetxoxN0qakN30tvqx?=
 =?us-ascii?q?dnMfcbDZVIXS3pReOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127436306"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 6/6] xen: Enable -Wwrite-strings
Date: Mon, 20 Nov 2023 22:49:12 +0000
Message-ID: <20231120224912.1421916-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The codebase is now -Wwrite-strings clean.  Activate the option to cause
string literals to have a const type, and prevent any violations of MISRA Rule
7.4 being reintroduced.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 7b869f4b3037..ca571103c868 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -392,7 +392,7 @@ endif
 CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
-CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
+CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
 CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
-- 
2.30.2


