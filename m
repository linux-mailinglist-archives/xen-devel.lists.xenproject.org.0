Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59FC49B2AA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260113.449383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJg5-0003QJ-Ai; Tue, 25 Jan 2022 11:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260113.449383; Tue, 25 Jan 2022 11:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJg4-0002yV-7Y; Tue, 25 Jan 2022 11:07:56 +0000
Received: by outflank-mailman (input) for mailman id 260113;
 Tue, 25 Jan 2022 11:07:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaJ-0006t5-HJ
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b275f1-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:57 +0100 (CET)
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
X-Inumbo-ID: 36b275f1-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rFaZW7mRzfBSV5uf8cyeoRt2R7qXKVYTWGVFMDqbVAg=;
  b=CamKIbdK+xAOVtnNms66opDSYX5JnRTM3rCZJOBRjgLGELqNTu2a2WCP
   C8rIu/kTMuxiWOcaR70u64zcykBfCgJxUYsRywP6wyEh3VgkwoIqlrPdT
   ct3L02kD39T42ETevBRpqc72eLVaoj5vPTlhUeL+qoH/yibz6KIhkuUgG
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KQOre+bDc8j2ju/tl3jLxenfsDqebvq7t3AQo1d/VLTqs3s2pRqIaqkVOiBcJtv8yNp2/JUJ3J
 mpVb6H/DIfrQPB9tSWIiop/PK9jkcfuQujM267DPGMp3x9GhI62DAY9NtjB3bSXi7MkXQ5Y35H
 NwTDkfvyJpt2Rm/cMsROe9LYJcmca5X6sC7vxrpZ0CkwLJOmHdsFSV8vAJV5jqAKqdAGYChxwg
 cK0ABMTujNmdn6+sqsUipnyjG6uecfT6ht3ezAT4eooKB1k+KftitgQ50THw0p8bsuH4bGkYeX
 PSn17ESg8TYbj6RPTxdi+RmX
X-SBRS: 5.2
X-MesageID: 64860866
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iqoPLKDlRI9uIRVW/yPlw5YqxClBgxIJ4kV8jS/XYbTApDtz3jQGm
 2pLUGuOOPeJamChL4p/YIXi8U9XsMPTzN9rQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940087wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/1BPOoftui
 9t26ZW2T1YsAL/nmbVAekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcGgGdu3pAQQ54yY
 eI9eChiQzD+MyRhEXtUCtVk38u1o2jWJmgwRFW9+vNsvjm7IBZK+LLgKsbPc9qGA8BchF+Fp
 3nu9n78RBodMbS39z2B9X69g/7VqgnyUokSCb6Q++ZjhRuYwWl7IB4RU0Gyrb+mi0q9c9VFI
 kcQ92wlqq1a3ECzVdz8Qx2QqWaJpAIBQMFXF/Am6QaL0ezf5APxLmQLQjNOctUOqN49RTts0
 ESA2dzuG1RHr7m9WX+bsLCOoluaOyIYMGsDbi8sVhYe7p/op4RbpgLCSJNvHbC4ivXxGCrs2
 HaaoS4mnbIRgMUXkaKh8jjvgT22r5zNZgcw7xfQWCSu6QYRTJW+e4Wi5Fzf7PBBBIWUVF+Mu
 D4Dgcf2xOITCZCAkgSdTeNLG6umj8tpKxWF3wQpRcN4sW3wpTjzJui8/Q2SOm82FIE6UiCqb
 nSPsAVXtZptLlCrPPJeNtfZ59sR8YDsEtHsV/bxZ9VIY4RseALvwByCdXJ8zEi2zhFyzPhX1
 YOzNJ/1UC1EUfgPIC+eGr9FuYLH0BzS0o86qXrT6x28mYSTa3eOIVvuGAvfN7tphE9oTei8z
 jq+Cydo40gHOAEdSnOOmWL2EbzsBSJnbXwRg5cPHtNv2iI8RAkc5wb5mNvNgbBNkaVPjfvv9
 XqgQEJew1eXrSSZdV7SNiE8N+2+DM4XQZcH0coEZwrAN58LOt7H0UviX8FvIelPGBJLk5aYs
 MXpi+3fW68SG1wrChwWbIXnrZwKSfhYrVnmAsZRWxBmJ8QIb1WQorfMJ1KznAFTUHbfnZZg8
 tWIi1OKKbJeFl8KJJuHN5qSI6aZ4CJ1dBRaBRWYe7G+uSzEreBXFsAGpqZnep5XcUSamGLyO
 sT/KU5wmNQharQdqLHh7Z1oZa/zewenNkYFTWTd85isMizWojiqzYNaCb7adjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3qu8I1BlgEVXKc0+vVuFqLE6Z0JQdraZK3LJY51e7A
 xrd5tlANLyVE8r5C1pNdhE9Z+GO2KhMyDnf5Pg4Omvg4ypz8ObVWEleJUDU2idcMKF0IMUux
 uJ44Jwa7Am2ixwLNNeaj38LqzTQfyJYC6h+78MUGo7mjAYv22puW52EB3+k+oyLZvVNLlIuf
 m2eip3diukO3UHFaXcySyTAhLIPmZQUtRlW51YePFDVyMHdj/o60RANozQ6SgNZkkdO3+5pY
 zU5MkR0IeOF/ityhdgFVGepQlkTCBqc80336l0IiGyGEBX4Cj2TdDUwabSX4UQU02NAZTwKr
 riXxVHsXSvuYMysjDA5XlRoqqC7QNF8nuEYdBtLwyhR80EGXAfY
IronPort-HdrOrdr: A9a23:PjXlS60gj6n63lLOc7Y40AqjBI4kLtp133Aq2lEZdPUzSL39qy
 nOpoV/6faaskdzZJhNo7G90cq7L080l6QFhrX5VI3KNGOKhILBFvAF0WKI+UyDJ8SRzI5gPI
 5bAtFD4IKaNzNHZLzBjzVQuexQuOVvi5rFudvj
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860866"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, "Ross Lagerwall" <ross.lagerwall@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH v9 19/30] build: clean-up "clean" rules of duplication
Date: Tue, 25 Jan 2022 11:00:52 +0000
Message-ID: <20220125110103.3527686-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

All those files to be removed are already done in the main Makefile,
either by the "find" command or directly (for $(TARGET).efi).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/Makefile                | 2 +-
 xen/arch/arm/Makefile       | 1 -
 xen/arch/x86/Makefile       | 5 ++---
 xen/test/livepatch/Makefile | 2 +-
 xen/xsm/flask/Makefile      | 2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 65b09c20a599..b2df072d2a62 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -425,7 +425,7 @@ _clean:
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
index de7f7ce07b98..60e802ba9503 100644
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


