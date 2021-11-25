Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425345DB87
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231285.400252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF69-0005Gp-FC; Thu, 25 Nov 2021 13:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231285.400252; Thu, 25 Nov 2021 13:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF68-0004yO-Nr; Thu, 25 Nov 2021 13:47:36 +0000
Received: by outflank-mailman (input) for mailman id 231285;
 Thu, 25 Nov 2021 13:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzv-00076i-P6
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5816b795-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:09 +0100 (CET)
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
X-Inumbo-ID: 5816b795-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZCs/Xx5M756MIsDnJYXw+m9V8UisU6uX8z4z8/g/Ths=;
  b=WiVegfMAoCwRYivSU2ZTqyaubOCr1QY35zqMQhLs+WFMRZpjN9W1q5iy
   lKMzwQz1ume4s6jlZUbBU8qrvTx/neY2XHAi0c7K6RjFb1dFo9YPxlLYf
   oduimfdlx1anCCMDl+PhTMxnK6dRaCjImEPW9Rxhv2PcMs93HeTuzWmj6
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4tr52D3X9HWXH1iw01BXLR6ba5oDHtKx8Ef7AFctZoE/TgiC34JWwhwPzbwPKM8XqFmbgOk43n
 qvvrVOFDhgVvfTcwilUhRu673NXyD2ZcoUiD1Wui2UCqTelfKOSYEBCwIdBnuRE2kJYJGpxZWU
 gHBaHnOxXaNVHPf+2JgB3txYNyjWf9gr3RuxTcX/3lpgKodoZDoxvfnjmF1/cVakSSgBS8ADAs
 pXfmdRcjMpIAjgwnfL+Eh0EmtIXI35dG5AmGXNFJBKkYp86FrfFt6M3vJhqexBdy08dtC7vgHf
 PQVV2542W2I8meLjAhZEdSIF
X-SBRS: 5.1
X-MesageID: 58617668
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aPmGqqC3r2fKwBVW/9Tkw5YqxClBgxIJ4kV8jS/XYbTApDxw0DFSz
 WFKWW/XOPzeZGehL4gkOd+z9kpT6MKGzoVlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/uyu4n4hP2
 OdxtqOxalswEIDxns0BakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjGlp2Z4QTZ4yY
 eIfURhuVRPAQCcMEQ8VGo06paDr2nfWJmgwRFW9+vNsvjm7IBZK+LrwNNvYfPSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoNEJWo+/gsh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdx+yrWOAvxUcc8FNCOB84waIooLV/ASxFmUCViRGatEtqIkxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBV8cVC9ccxs339rcoaJvlzzic9BKDJfg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4ZdN7BJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdwPiN2dDB0wWirhRdMOS
 BWO0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZp34xOh/AjzG3zhlEfUQD1
 XCzK5jEMJrnIf4/kGreqxk1jdfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgo
 ivgBxQGkQWn3hUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6ELbdn94aEBWYEweLV7puVvweQtF
 6sOetmaA+QJQTPComxPYZ74pY1kVRKqmQPRYHb1PGlhJ8ZtF17T59vpXgrz7y1SXCC5gtQz/
 u+73QTBTJtdGwk7VJTKaOiixk+atGQGnL4gRFPBJ9ReIR2+8IVjJyHroOUwJsUAdUfKyjeAj
 l7EChYEv+jd5YQy9YCR16yDqo6oFcp4H1ZbQDaHverna3GC8zP6k4FaUeuOcTTMb0/O+f2vN
 bdP0vXxEPwbh1IW4YByJKlmkPAl7Nz1qr4Ekgk9RCfXb06mA69LK2Wd2ZUdrbVEw7JUtFfkW
 k+L/dUGa7yFNNm8TQwULQshKO+CyesVin/Z6vFseBf24yp+/bymV0ROPkbT1HwBfeUtaI51k
 /08vMM26hCkjkt4O9mLuSlY6mCQIyFSSK4grJwbXNfmhwdDJouuunAA5vsaOK2yVug=
IronPort-HdrOrdr: A9a23:4DuZ96O7XnbBsMBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617668"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 18/47] build: handle always-y and hostprogs-always-y
Date: Thu, 25 Nov 2021 13:39:37 +0000
Message-ID: <20211125134006.1076646-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will be used for xen/tools/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Rules.mk               | 10 +++++++++-
 xen/scripts/Makefile.clean |  3 ++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index f452a821cc86..9eb3093f43fb 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -78,9 +78,17 @@ else
 obj-y    := $(filter-out %/, $(obj-y))
 endif
 
+# hostprogs-always-y += foo
+# ... is a shorthand for
+# hostprogs-y += foo
+# always-y  += foo
+hostprogs-y += $(hostprogs-always-y)
+always-y += $(hostprogs-always-y)
+
 # Add subdir path
 
 extra-y         := $(addprefix $(obj)/,$(extra-y))
+always-y        := $(addprefix $(obj)/,$(always-y))
 targets         := $(addprefix $(obj)/,$(targets))
 lib-y           := $(addprefix $(obj)/,$(lib-y))
 obj-y           := $(addprefix $(obj)/,$(obj-y))
@@ -283,7 +291,7 @@ targets += $(call intermediate_targets, .init.o, .o) \
 # Build
 # ---------------------------------------------------------------------------
 
-__build: $(targets-for-builtin) $(subdir-y)
+__build: $(targets-for-builtin) $(subdir-y) $(always-y)
 	@:
 
 # Descending
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 156d6307cf83..c2689d4af5fa 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -18,7 +18,8 @@ subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
               $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
 __clean-files := \
-    $(clean-files) $(hostprogs-y) $(hostprogs-)
+    $(clean-files) $(hostprogs-y) $(hostprogs-) \
+    $(hostprogs-always-y) $(hostprogs-always-)
 
 __clean-files := $(wildcard $(__clean-files))
 
-- 
Anthony PERARD


