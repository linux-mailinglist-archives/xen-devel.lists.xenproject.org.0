Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629B68F46D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 18:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491939.761305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPoBg-0006wc-Cn; Wed, 08 Feb 2023 17:24:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491939.761305; Wed, 08 Feb 2023 17:24:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPoBg-0006uz-8w; Wed, 08 Feb 2023 17:24:52 +0000
Received: by outflank-mailman (input) for mailman id 491939;
 Wed, 08 Feb 2023 17:24:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8nB3=6E=citrix.com=prvs=396cc5531=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pPoBe-0006ut-Ow
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 17:24:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c2c7801-a7d5-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 18:24:48 +0100 (CET)
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
X-Inumbo-ID: 7c2c7801-a7d5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675877088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AtAO9c64dKZK6SM8dqDsLsQe7o2Imlohacu+oBEsSsk=;
  b=DiatRwQn86wOFSTON8IizGE2lbeUXh515jPwv5q2nPYB983AVgRHV7ok
   bT3F4odtiqbIdouy+Ikjx7xm6/Hdy3zMrO3lnsDvoVtTMgEZq6ynxObpr
   1/q/oyYOBZp2Ex+ty2wENd4/i/C6uk45u37B4dw86nZE4460aKwCJL/vz
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95073846
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:uBehLqMV2dNHXZTvrR2fl8FynXyQoLVcMsEvi/4bfWQNrUoj3zUCz
 jMXWjiObqveYmHzfdkgadixox4B65XXxoJjTAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5gxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t9+HCIV9
 /A1FB4uTQmZv8KQ/qq7G8A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLokm/yzwH32fDBCt1uRoYI84nTJzRw327/oWDbQUo3XHZoOzhrGz
 o7A137rMDYRGoWu8Aiqq1iJuKzOgXyicqtHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceRyEu1
 1KPt8PkA3poqrL9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0qhNNIjKe30GzpoBG1vKDpaDAt5lT+CzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCl/CI+TfNDKq8gj9yjn9ZKme6ENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+B2mXFimz2OH8+lp/hC7VZ4TCTNIVviGALRBt3VEYve+FmFm
 zqhH5viJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbaSjeK7FoJUqeLqZt4ItwNokigvruQl
 p1LchMCmQWXaLyuAVniV02Pn5u2DM0h8SpkY3xE0JTB8yFLXLtDJZw3L/MfFYTLPsQ5pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:vuwCd61aMQW7bujxvjSTFgqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.97,281,1669093200"; 
   d="scan'208";a="95073846"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH] build: Make FILE symbol paths consistent
Date: Wed, 8 Feb 2023 17:24:16 +0000
Message-ID: <20230208172416.725028-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The FILE symbols in out-of-tree builds may be either a relative path to
the object dir or an absolute path depending on how the build is
invoked. Fix the paths for C files so that they are consistent with
in-tree builds - the path is relative to the "xen" directory (e.g.
common/irq.c).

This fixes livepatch builds when the original Xen build was out-of-tree
since livepatch-build always does in-tree builds.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/Rules.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 70b7489ea8..6b9269a70c 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -228,8 +228,9 @@ quiet_cmd_cc_o_c = CC      $@
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
     cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
     ifneq ($(CONFIG_CC_IS_CLANG)$(call clang-ifversion,-lt,600,y),yy)
+        rel_path = $(patsubst $(abs_srctree)/%,%,$(call realpath,$(1)))
         cmd_objcopy_fix_sym = \
-	    $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@ && rm -f $(dot-target).tmp
+           $(OBJCOPY) --redefine-sym $(<F)=$(call rel_path,$<) $(dot-target).tmp $@ && rm -f $(dot-target).tmp
     else
         cmd_objcopy_fix_sym = mv -f $(dot-target).tmp $@
     endif
-- 
2.31.1


