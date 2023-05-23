Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C470E1F5
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538558.838637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V26-00006O-FG; Tue, 23 May 2023 16:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538558.838637; Tue, 23 May 2023 16:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V26-0008Vc-BZ; Tue, 23 May 2023 16:38:46 +0000
Received: by outflank-mailman (input) for mailman id 538558;
 Tue, 23 May 2023 16:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V24-0006Dq-9a
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471c51cd-f988-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:38:43 +0200 (CEST)
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
X-Inumbo-ID: 471c51cd-f988-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UqV5mZcPJiexqI58U22QslwrAPllWJ5ALOxWdCDzORY=;
  b=O3tEw0qI4P5vtfAvRaAQ8FRNE2lHMLsnTPjy+UQ6yFDEW6qBgrgbpGJ+
   oOjqHpHfCDizEJa89+e1c5pJnR3oP0vkkHtZb4ALLEAhUdOUfaVF9/yzy
   qgG3s5+1Mu6LBfaAPgWhRpl2SGQDYMhpx0nXWsc4XEtXZ0r14pSgbAh9Q
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109422951
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jbqg+q/wFFznlahHhgozDrUDs36TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jFJCjqFPqqMa2fwKtgkaIiz901U6MeGn9JhGlNkrHw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoQ5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklnz
 9BGBDpSVymNpOuxyuujEbIviJgKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxhfE/
 DiXoj2R7hcyLMOH2HmPzlGQmebkpjP1Ca9JH4KU+as/6LGU7jNKU0BHPbehmtG7l0q/VtR3O
 0ESvC00osAa9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/4yB0Q7riW2Vn5bqRwk/vx2MBSGrsiosMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y/Dpg4jfIUOPCdkTNrGwkwDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglT+MFcinlEX+ieb2iJuppVAtaQHmUwzExPnc/FW9H
 yh3bKNmNCmzoMWhO3KKoOb/3HgBLGQhBICelvG7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3RMioyN+y3DccjxZ/5VAR1VWuVN7EYSd7HxM8im1EfJtHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:t42FNq4vKkCZFEnorQPXwPLXdLJyesId70hD6qkXc3Bom62j+P
 xG+c5x6faaslgssR0b+OxoWpPwIk80hKQU3WB5B97LNmTbUQCTXeNfBOXZslrdMhy72ulB1b
 pxN4hSYeeAa2SSVPyKhTVQxexQpOW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3Ad5rPLWqI5dEx0IXWotB7xTPmUekfXiPxxijpGkG?=
 =?us-ascii?q?bAGFjEaXOEhyepIoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1GlSBAyDVmlAkAEsrfuyGZ1UCtOaqLyxEFFOm6k?=
 =?us-ascii?q?lh9aNHhdgNWaw1z+IboByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="109422951"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 08/15] build: use $(filechk, ) for all compat/.xlat/%.lst
Date: Tue, 23 May 2023 17:38:04 +0100
Message-ID: <20230523163811.30792-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make use of filechk mean that we don't have to use
$(move-if-changed,). It also mean that will have sometime "UPD .." in
the build output when the target changed, rather than having "GEN ..."
all the time when "xlat.lst" happen to have a more recent modification
timestamp.

While there, replace `grep -v` by `sed '//d'` to avoid an extra
fork and pipe when building.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 96d5f6f3c8..2e61b50139 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -93,15 +93,13 @@ targets += $(patsubst compat/%, compat/.xlat/%, $(headers-y))
 $(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/compat-xlat-header.py FORCE
 	$(call if_changed,xlat_headers)
 
-quiet_cmd_xlat_lst = GEN     $@
-cmd_xlat_lst = \
-	grep -v '^[[:blank:]]*$(pound)' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new; \
-	$(call move-if-changed,$@.new,$@)
+filechk_xlat_lst = \
+	sed -ne '/^[[:blank:]]*$(pound)/d' -e 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' $<
 
 .PRECIOUS: $(obj)/compat/.xlat/%.lst
 targets += $(patsubst compat/%.h, compat/.xlat/%.lst, $(headers-y))
 $(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst FORCE
-	$(call if_changed,xlat_lst)
+	$(call filechk,xlat_lst)
 
 xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
-- 
Anthony PERARD


