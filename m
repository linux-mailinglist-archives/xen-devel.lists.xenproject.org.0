Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB149B2AB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:08:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260110.449372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJg3-0002qD-Cu; Tue, 25 Jan 2022 11:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260110.449372; Tue, 25 Jan 2022 11:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJg1-0002LU-Qi; Tue, 25 Jan 2022 11:07:53 +0000
Received: by outflank-mailman (input) for mailman id 260110;
 Tue, 25 Jan 2022 11:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaT-0006Mn-7b
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bc265e0-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:02:08 +0100 (CET)
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
X-Inumbo-ID: 3bc265e0-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DT8jr5aifqPBIpo7W2QZQ/eIkETukYAewr3aG6uBNnI=;
  b=Knr3roInQEL7FBbcQ37fscBZaXb6isaRO5umQJI6BAuAHrnFSLBFJmmU
   6+rQukNe4D/vxPwwDOYeiQm/Nf0lWWwXg3ep/XNbtT+m5X9t+RRAsGQ+c
   5cer9uOy5NDCrQ8JV3cVhfa6910rwgh5OOgI5w7r59F/JMzCobgZMysFb
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hnvqllHpzr7bvuFODE7sdj8HBx92ESShGQcx6XqXkpO0MfDC53K15tW1tIWUwfda9/VJqa3NSo
 DysdsN4AiC8siqX6ow5gPJBl6ncFarlXWL8KvuIFMJWxJ8LvVC4OxirJfBMzAjR64S28GbpDx/
 Wunt8q+wbXDL0sVVzKk7YNE8JF3DSc3vDGPLE/zLJbDYHZ91KlltvSpg85XfvWh6RYwbyWWQ0h
 +Icgou7SUrehrcWHPiXlPTXdG/crGfCv6FqynvApHdqaKkcXGm1PykrtyoPlH6/hTLwPzSa6Os
 mQlPRKl3AaPd0vaA1pV8xQR+
X-SBRS: 5.2
X-MesageID: 63107000
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:imnOaq1Jd7VDVgkHxvbD5Qd2kn2cJEfYwER7XKvMYLTBsI5bp2QGn
 WJJC2yDPKuLYWL2c9pya9++oUIH75TQz9JqGwtvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbNh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhrdl9k
 PlRtKSLTgpwOZL1xeYTDCdcDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3ZkWQq6GP
 6L1bxJJPBXgUUdIIG4ZCZN5lruFp13vLTJx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mDM8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaliwVV4J8D+wC0waAk63r2lubCDc6SiEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFAXpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2kidRg2bJdVIVcFh
 XM/XysLuPe/21PxNcdKj3+ZUZx2ncAM6/y7PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeJqZtJRmCvt/s9ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:yZ9s06vgrsXSR7IBGw7sFnbk7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="63107000"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v9 21/30] build: use main rune to build host binary x86's mkelf32 and mkreloc
Date: Tue, 25 Jan 2022 11:00:54 +0000
Message-ID: <20220125110103.3527686-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Also, remove the HOSTCFLAGS "-g" from "mkreloc" command line.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v8:
    - acked
    - remove the cflags "-g" from "mkreloc"

 xen/arch/x86/Makefile | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index bb57ed5096d5..c94b4092d4c1 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -83,6 +83,9 @@ subdir- += boot
 extra-y += asm-macros.i
 extra-y += xen.lds
 
+hostprogs-y += boot/mkelf32
+hostprogs-y += efi/mkreloc
+
 # Allows usercopy.c to include itself
 $(obj)/usercopy.o: CFLAGS-y += -iquote .
 
@@ -253,17 +256,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
-$(obj)/boot/mkelf32: $(src)/boot/mkelf32.c
-	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-
-$(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
-	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
-
 clean-files := \
-    boot/mkelf32 \
     include/asm/asm-macros.* \
     $(objtree)/.xen-syms.[0-9]* \
     $(objtree)/.xen.elf32 \
     $(objtree)/.xen.efi.[0-9]* \
-    efi/*.efi \
-    efi/mkreloc
+    efi/*.efi
-- 
Anthony PERARD


