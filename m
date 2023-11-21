Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647D7F3741
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638215.994562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XKv-0003fk-Ow; Tue, 21 Nov 2023 20:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638215.994562; Tue, 21 Nov 2023 20:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XKv-0003d5-LW; Tue, 21 Nov 2023 20:27:09 +0000
Received: by outflank-mailman (input) for mailman id 638215;
 Tue, 21 Nov 2023 20:27:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8a9=HC=citrix.com=prvs=682c61bdb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5XA7-0006aW-86
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:15:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7b7f944-88aa-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 21:15:58 +0100 (CET)
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
X-Inumbo-ID: c7b7f944-88aa-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700597758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5uiIRow6rh0vRvX5ViEOdcJuUhRBpUj5Jr2b1aBEl6g=;
  b=GlMeY4vTxkb18wvHkPmJQo4J/xW606ppGZLetB/Gbakda79v44z920ZO
   o4p5uamRLj1ruHCpj2tvtc4DmeJjTdFyvfMa87TGqj6XNrapBH2+ya+UO
   XkTKQWJV1i6Xg7wu9lm40jR6wInsF4PyZIa4T8sYI76ZalH4Apat3ZaEf
   c=;
X-CSE-ConnectionGUID: +GZ+UsK9SGatMSUbv7Cxvg==
X-CSE-MsgGUID: CqveYOQkQuCdJAkr8aVIhg==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127464602
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:+k3rQaAFvWjUHBVW/9Xjw5YqxClBgxIJ4kV8jS/XYbTApG5w3jZUz
 TYXC26EaPmIYGv9fIogPYmzoEIC7J/XyYVrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMt8pvlDs15K6p4WpC5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwuclFQlxV1
 q0jBzkRSyu+jfzp66KlRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdIL2U3BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKMIIPWG5kLxhzwS
 mTu1H3nDyA9Dd+m1BGJ0FuvnL/GowL7V9dHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGWfohcWVt5UEus7wAKA0KzZ50CeHGdsZhxrZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLnoY3iR7eS8d5J4S8hNb1BDLYz
 iiDqW41gLB7pcQGzbmh9FbLxTelvIHUTxUd7x/SGGmi62tRYY+uZ4Wsr1/B//tEBI+cQh+Ku
 31ss9KZ5u0UEZbLniWCRuwXFZmj+vmePTvTx1VoGvEJ8TWm/HqqO55d/Ct/IkZBONsLYjLvb
 wnYvgY52XNIFCL0N+ktOdv3Upl7i/e4fTj4ahzKRplhUNtMbyzWxw5neWur4mrzz2M8j65qb
 P93bv2Q4WYm5bVPlWXuH7pNi+J0lkgDKXXvqYcXJilLMIZyh1bPEN/pyHPUMogEAFqs+W05C
 ep3OcqQ0Al4W+bjeCTR+oN7BQlVdSBmVMmo9pwOL7Lrzu9a9IcJUae5LVQJItwNokiovr2Qo
 iHVtrFwlDITekEr2S3VMys+OdsDrL50rG4hPDxEALpb8yFLXGpb149GL8FfVeB+pIReIQtcE
 6FtlzOoXq4eFVwqOl01MfHAkWCVXE3y3lrXZ3r8PWRXklwJb1Whx+IItzDHrEEmZhdbf+Nny
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:+gZxO6BU4IwoRZjlHeibsceALOsnbusQ8zAXPhZKOFNom6uj5r
 aTdZUgpGjJYVMqKQsdcL+7Sde9qE3nhOdICOUqTMaftCePghrOEGhJ1/qB/9XYcxeOktK0P8
 9bAs5D4aTLfD1HZKTBkXuF+qcbsa26GfuT9J/jJh5WJGkABs0OgWYYNu/8KDwHeOBoP+tHKH
 P23Lszm9PPQwVlUi2TPAhKYwADz+e7967OUFopBwMD4ALLtDOw5Lv7FBTd/hp2aUIE/Z4StU
 bEjinw7eGbs+i2zx/a2yvp45s+oqqt9vJzQOKNl+0cIXHUih+lYYRnV/m5oTgpvPvH0idnrP
 D85zkhIuF64DfpZWe3rRHxsjOQmQoG2jvNyUK8iXCmmNf+Rz4xFo5giOtiA1PkwntlktFg9a
 pBm1uDsZlaBw6FpSzh5rHzJlpXv3vxgX0/leUUy1xzOLFuE4O45eQkjT5o+N1pJlOH1KkXVM
 9zEc7Y7PFVNXeTb3Xctm4H+raRYkg=
X-Talos-CUID: =?us-ascii?q?9a23=3AFcgXCGt56C9WCmr6hjoAK5se6ItmXU+e8WzzcnS?=
 =?us-ascii?q?XAHpMc4CfVwC76L1rxp8=3D?=
X-Talos-MUID: 9a23:lI9pJgYfkKies+BTnCbyiQBFDcRR/o+iKmkOi8UPheiEOnkl
X-IronPort-AV: E=Sophos;i="6.04,216,1695700800"; 
   d="scan'208";a="127464602"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 5/5] xen: Enable -Wwrite-strings
Date: Tue, 21 Nov 2023 20:15:40 +0000
Message-ID: <20231121201540.1528161-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The codebase is now -Wwrite-strings clean.  Activate the option to cause
string literals to have a const type, and prevent any violations of MISRA Rule
7.4 being reintroduced.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
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


