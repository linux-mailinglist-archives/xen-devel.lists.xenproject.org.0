Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BA45DB9B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231331.400452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6r-0007Du-Uk; Thu, 25 Nov 2021 13:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231331.400452; Thu, 25 Nov 2021 13:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6r-00070d-1n; Thu, 25 Nov 2021 13:48:21 +0000
Received: by outflank-mailman (input) for mailman id 231331;
 Thu, 25 Nov 2021 13:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0B-0007NX-6U
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a71412-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:26 +0100 (CET)
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
X-Inumbo-ID: 62a71412-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eADHJIy3aZSo8eo5bCByBjcWS5FHvbhrDV1qn8IKzhs=;
  b=J1bP2hX3ue7UgV0C/HmGiR94NGGRsndn+5LaN/83v8dJgg5fK2PVZbf1
   VYnqyP5gac6zYPQCsLSkBH2jx3/U5nFaPgjcYFyfyjLjQXpypVOuTkYHX
   vE00ea8TW+R0TjsrIjvI+Oo3O9IsWHmdZ/z0tFUUh0HL6K3kZcTXqFr9v
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lnAmMJErsnuFCXmexossqfkUNChbCwu0blTDBVlvg4AIVZjyogaKaKYxje0FDWSnltqrk59x8d
 PkFXViq5ll6jvgib4yc+kKm+LurRLvezodMD2dEMecCeD6rod29eTWBp+Y198dPe7nPJbiBNWu
 nHGwhVfB2WAQ1MOHAOeVRiXMKW/Ai0T/4DU8dLXHRaBhbi4U2N9TAnZxZwJOUPHSAG5EqnhNWp
 3tcvUhHqPywnbRzMAxWocwg95TiKgcJkoh4njxeTfW1LGuCMeWLILrzM0IKNJ6oY4OLGJdJxlp
 lZ8U0lL6X/IzEJfePqMhMueo
X-SBRS: 5.1
X-MesageID: 58135476
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8xkN06CHutmy3hVW/xDkw5YqxClBgxIJ4kV8jS/XYbTApD0mhTRSz
 GIfUGzTPamJZzb2Lt1+ao6+9U5QuZ/dxoU2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kjvZutpX1
 +xxi7PqWV02N5Ock80AXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjG5r25wRQ54yY
 eIAW2BiV0//eSZlYHwlKZdlsvempSPWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiGeK7jsWfcVpL9MVshHX1aPqsw2wG2dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8mDGJGT9bxgbQ+0RqnBNzEJmRtR
 FBex6CjABkmVPlhbhClTuQXB62O7P2YKjDailMHN8B/rGvypC/zLdEKvmAWyKJV3iEsI2GBX
 aMukVkJuM870IWCMcebnL5d++x1lPO9RLwJp9jfb8ZUY4gZSeN01HoGWKJk5Ei0yBJEufhmY
 f+zKJ/wZV5HWfUP5GfnHI81jO50rh3SMEuOHPgXOTz8iuHADJNUIJ9YWGazghcRsPnZ/V6Lq
 okHbKNnCXx3CYXDX8UeyqZLRXhiEJTxLcqeRxV/erHRLwx4NnsmDvONk7otd5Y8x/Zel/vS/
 2H7UUhdkQKtiXrCIASMS3ZidLKwAsov8SNlZXQhbQSyxnwuQYez96NDJZE5SqYqqb54xvluQ
 vhbJ8jZWqZTSi7K8ig2ZIXmqNAwbwyigA+DZnL3YDU2c5N6aRbO/9voIlnm+CUUV3Llvsoiu
 bywkAjcRMNbFQhlCc/XbtOpzk+w4idByL4jAROQL4AKKkv28YVsJyjgtdMNIpkBeUfZ2z+X9
 weKGhNE9+PDlJA4rYvSjqeeoob3T+YnRhhGH3PW5KqdPDXB+jbx2pdJVeuFcGyPVG7w/6n+N
 +xZw+ulba8ClVdO9YF9D6xq3eQ14N62/+1WyQFtHXPqaVW3C+w/finajJcX7qAdlKVEvQaWW
 16U/ogIMLqED8rpDVoNKVd3de+Ez/wVxmHf4PldzJ8WP8OrEG5riXlvAiQ=
IronPort-HdrOrdr: A9a23:4vPBmq4WwIMT8y7T3wPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135476"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 24/47] build: use main rune to build host binary x86's mkelf32 and mkreloc
Date: Thu, 25 Nov 2021 13:39:43 +0000
Message-ID: <20211125134006.1076646-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
index 243ca17f701e..e8151bf4b111 100644
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


