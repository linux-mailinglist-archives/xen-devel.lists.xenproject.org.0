Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EAC45DB8E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231302.400311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6K-0007yc-Kw; Thu, 25 Nov 2021 13:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231302.400311; Thu, 25 Nov 2021 13:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6K-0007ik-62; Thu, 25 Nov 2021 13:47:48 +0000
Received: by outflank-mailman (input) for mailman id 231302;
 Thu, 25 Nov 2021 13:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF07-00076i-0u
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f243f17-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:21 +0100 (CET)
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
X-Inumbo-ID: 5f243f17-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d7L+BRvnt90Hp6EYFj08PtOu1B6y0dzvxWI579G6mSU=;
  b=AUBcTIRS/MqUSTNhoo/FvR4nGQZtz1AaMGfzGeKV8skS0SWqy3VOk9ev
   nKr7shmRjvgBBvHIF12klRZIJFxxgsNi8XzMhFJE3XFVoljGc5wPe6PDN
   GA6qqlYnZFf/XOIdeTctGIAkmvlis0O2/JSO4Poa/KhchLFaztaZjfzPp
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xcR41wA12mhyuG6hnSih+BSTv6MWqH3VHV7A01w/odP3DYU/Vw0g1Yvp+38plcAxI/Ux6QuDCe
 z1kAV9vdIF+jPFTIaeZ7NcAqKhWxb/WJPedjE/5wqBKHUwr1sjb6t+k9jDTY0VydidkqB+Pvtu
 2g7+4n2+/kX4NqJY3zFGlOZ01e1usjKC/2ZrCrGKghtRbE3c7GZx+BjiV319G3GNEZ7GLDMKCV
 TQiY3zQWTCNcDiA+hZ393lzAzGfO8JwM1frmuwkwSdD7GjRws0GD3teA+iDoiQT0gIctkGKKN9
 oIEJgg2ilJXerFkfaHlcq9Uq
X-SBRS: 5.1
X-MesageID: 60634148
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:65SiDqmXsfM632oFlo0p07vo5gz/IERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWGyFbvmOMWX3Ktt0YIizp0MPu5aByodrGwJvqShhQSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 JZmu76QSwduB5fdisoWfyJJHwtQLLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ66AP
 JZANWoHgBLoczNrGkU6AZIHwdyIvynkUwZKhHGOjP9ii4TU5FMoi+W8WDbPQfSASN9JhE+eq
 iTD9n7gHxABHNWFzHyO9XfErtHImST3SYcDDoqS//RhgECQ7mELARhQXly+ydG6jUikUt4ZN
 E0Q+QIpt6E58EHtRd74NzW0uGWBvwIcc9NIHvcm9RqWza7J/weeAHNCRTlEAPQqu8M7SiYj/
 kOYlNPuQzp0ufuaTmz13qiQhSO/P24SN2BqTS0OQBYB4tLjiJoulR+JRdFmeIalg9uwFTzuz
 jSiqCklm65VncMNz7+8/13Mn3SrvJehZg8q5C3HU2S99AR7aYW5IYuy5jDz9u1cJYyUSl2Au
 nksmMWE6u0KS5aXm0SlQvgJHbyvz+aINnvbm1EHInU6323zoTj5J9kWuWwgYhcyWioZRdP3S
 Az4tyFx5p8UBUG7f4F8T7mgB+4E3Le1QLwJScvoRtZJZ5FwciqO8ydveVOc0gjRraQ8rU0sE
 czFKJjxVB72HYwilWPrHLlFjdfH0whnnTuLLa0X2ShLxlZ3iJS9bb4eeGWDYekihE9viFWEq
 o0PXydmJvg2bQEfXsU12dJMRbzpBSJibXwTlyCwXrTeSjeK4El7V5fsLUoJIuSJZZh9mObS5
 W2aUURF0lf5jnCvAVzUMS88N+K/Dccl8yNT0ckQ0bGAgSZLXGpSxP1HK8tfkUcPqISPMsKYv
 9FaIp7dU5yjuxzM+igHbImVkWCRXE/DuO56BAL8OGJXV8c5H2Tho4a4FiOypHhmJnfm7qMW/
 uz/vj43tLJeHmyO+u6NM6nxp75w1FBA8N9Ps7zgfoMOJR6yqdcycEQcTJYfeqkxFPkK/RPCv
 y7+PPvSjbOlT1Yd/IabiKaagZ2uFuciTENWE3OCteS9NDXA/3rlyohFCb7acTfYXWLy2aOje
 eQKkK2sbKxZxA5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiEYZu3EFMYKAc/QP6E0PUYxmvb4fgveR2o7y5r5ruXF05VOkDU2iBaKbJ0NqIjw
 Psg55FKu1Du1EJyP4/f3C5O9mmKIngRaIkdt8kXUN3xlw4m6lBeepiAWCX4146CNodXOU4wL
 z7K2Keb3+ZAxlDPemYYHGTW2bYPnowHvR1HwQNQJ1mNndaZ1PY70AcIrGYyRwVRiB5Gz/hyK
 i5gMEgsffeC+DJhhc5iWWGwGl4eWE3FqxKpk1ZZxnfES0SIV3DWKDxvMOmAy0kV7mZAc2UJ5
 7qf0mvkDW7nccyZMvHegqK5RygPleBMyzA=
IronPort-HdrOrdr: A9a23:ZJpig67Q2tvvGMQffAPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634148"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v8 22/47] build: clean-up "clean" rules of duplication
Date: Thu, 25 Nov 2021 13:39:41 +0000
Message-ID: <20211125134006.1076646-23-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

All those files to be removed are already done in the main Makefile,
either by the "find" command or directly (for $(TARGET).efi).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/Makefile                | 2 +-
 xen/arch/arm/Makefile       | 1 -
 xen/arch/x86/Makefile       | 5 ++---
 xen/test/livepatch/Makefile | 2 +-
 xen/xsm/flask/Makefile      | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index efd7538099f3..86bcedd7fa5b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -428,7 +428,7 @@ _clean:
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
-	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
+	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
 	rm -f .banner .allconfig.tmp include/xen/compile.h
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index fd24f0212ffa..3ce5f1674f6f 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -120,4 +120,3 @@ $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 clean::
 	rm -f $(obj)/xen.lds
 	rm -f $(BASEDIR)/.xen-syms.[0-9]*
-	rm -f $(TARGET).efi
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 873b32cc6945..0b0ef6205bc1 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -258,9 +258,8 @@ $(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
 
 .PHONY: clean
 clean::
-	rm -f *.lds boot/*.o boot/*~ boot/core boot/mkelf32
+	rm -f *.lds boot/mkelf32
 	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
-	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
+	rm -f $(BASEDIR)/.xen-syms.[0-9]* $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
 	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
-	rm -f note.o
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index afb8d589ecae..adb484dc5d2c 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -162,4 +162,4 @@ uninstall:
 
 .PHONY: clean
 clean::
-	rm -f *.o .*.o.d *.livepatch config.h expect_config.h
+	rm -f *.livepatch config.h expect_config.h
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 49cf730cf098..832f65274cc0 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -51,4 +51,4 @@ $(obj)/policy.bin: FORCE
 
 .PHONY: clean
 clean::
-	rm -f $(ALL_H_FILES) *.o $(DEPS_RM) policy.* $(POLICY_SRC) flask-policy.S
+	rm -f $(ALL_H_FILES) policy.* $(POLICY_SRC) flask-policy.S
-- 
Anthony PERARD


