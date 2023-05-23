Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7B70E1F0
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538551.838567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1q-0006Fs-5n; Tue, 23 May 2023 16:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538551.838567; Tue, 23 May 2023 16:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1q-0006E7-2o; Tue, 23 May 2023 16:38:30 +0000
Received: by outflank-mailman (input) for mailman id 538551;
 Tue, 23 May 2023 16:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V1n-0006Dq-JL
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:27 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c3778e6-f988-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:38:25 +0200 (CEST)
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
X-Inumbo-ID: 3c3778e6-f988-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tpIIJAj41XN+i19+pdP8PgfnfYVAitDX3tJqFhm43yI=;
  b=J3c7VbvFVLD8QueeVmWJrbdMUpyIsKE38q/D9XeajBLb7HF+0D1Du+zr
   PanUGZtkWJc4cz0qOAtRDuhytpOz3xHhkNvsOOrjQQlyaDRlZjJwmZ/p7
   CE8Jw1OuSFdiipZqZnxrTmCU+Lv5/17Zk3CjPffOoOH+hysDLO3wYqhwp
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109422917
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8Aj1jq771o4ONcVCDwaPwAxRtAvHchMFZxGqfqrLsTDasY5as4F+v
 mYcD26AOvqPZTehfYwiPYnn9xhV6p/Uy4dlSwBupC83Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 /k+FjJSSjG/rfuT5pm5bc88huV6BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7J+
 jicrj2mav0cHP3Axze61k2Pvezoow/GaqUNJp2W98c/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1ZpasEitcIwbSwn0
 BmOhdyBLSd0rLSfRHaZ97GVhTC/Iy4YKSkFfyBsZRQBy8nupsc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nFk3N3/kPLnyY2d+Hb5gW2Ih6TjVysTzQfweDKlz1pQMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoSbLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNDKi8gjlmOMIZmOq7EMZGOyatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzOPGsCjk0/2iOLCDJJwdVviGALUBt3VEYve+FmFm
 zqhH5DiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/Fqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMSg5OeywBcYu8RrW/0UEZD6V5pTqWq73hI93Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:bPY3nalEYt96bfxg83iSVyEmnKrpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:6bZIKGMnnAj7Eu5DfixBykxLPuEZWGT46lzSBGnoCUcwYejA
X-Talos-MUID: 9a23:CF0FpwQ0F0JnVbKFRXTN2z9vC+NXwJ+tL34hrKchpPukGy1JbmI=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="109422917"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 01/15] build: hide that we are updating xen/lib/x86
Date: Tue, 23 May 2023 17:37:57 +0100
Message-ID: <20230523163811.30792-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Change of directory to xen/lib/x86 isn't needed to be shown. If
something gets updated, make will print the command line.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index edd5322e88..96d5f6f3c8 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -229,7 +229,7 @@ ifeq ($(XEN_TARGET_ARCH),x86_64)
 .PHONY: lib-x86-all
 lib-x86-all:
 	@mkdir -p $(obj)/xen/lib/x86
-	$(MAKE) -C $(obj)/xen/lib/x86 -f $(abs_srctree)/$(src)/xen/lib/x86/Makefile all
+	$(Q)$(MAKE) -C $(obj)/xen/lib/x86 -f $(abs_srctree)/$(src)/xen/lib/x86/Makefile all
 
 all: lib-x86-all
 endif
-- 
Anthony PERARD


