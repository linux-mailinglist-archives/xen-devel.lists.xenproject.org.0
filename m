Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E145DB89
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231290.400260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6A-0005de-M8; Thu, 25 Nov 2021 13:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231290.400260; Thu, 25 Nov 2021 13:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF69-0005Ez-Vi; Thu, 25 Nov 2021 13:47:37 +0000
Received: by outflank-mailman (input) for mailman id 231290;
 Thu, 25 Nov 2021 13:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0h-0007NX-KW
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75dbf48d-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:58 +0100 (CET)
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
X-Inumbo-ID: 75dbf48d-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B5VOkpfrwP2eJU5CJkGnpLSWbZA0WNl/g37hS+zmyXc=;
  b=d2QVA48Js5vVqo0r6uSFIXckwuE6nBulUwHSSK8EbK2Il8ibs+1CRRoR
   wjCbAFBZ1lN3UAhzqxXCKB9y9w1kVktFG0XcbJJaflhLK7lh2HQJ2RbCt
   PS8OAVa61Zzxip/ICATPxpwUQtvhmkY9l4xe4TOGL87I6oNllDMn0AJsp
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r23o05NSS7N9utzX3GZjNdfn8NR2ahYDzERWs2Mvd9EoEvJm8StOqMdOmNZHWOmlR/mPybolMn
 nHTiW5TPhM9OPESq+BRKvzy2mighS0Ex+Os19efb5BwOKU1QrTvEiNgXn4Lglarfzl3yMU1sp0
 Lwp5aU7xiy6qx03yLY4bzHWjO0LakUWvf+SznyBVEj9go7fuJ6gNzbRmSQqWFv0F0rH5JpKCly
 c/66nvr/NIppMXR9RMGVMsN3v/hHr6L+yqF/7AyrucywPqP3d0RcoClDnLnIS4lZ6J23F+NUSF
 gezsM3C33jAgriFKkBbdVqiK
X-SBRS: 5.1
X-MesageID: 60634184
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fcohw6IBeLswchRXFE+RApIlxSXFcZb7ZxGr2PjKsXjdYENS0TQCy
 zNKDDiFbKrcZmukL49+ad60px5XvZHQnNAwQAplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Svssvk
 tx3sKeUQF8qBpXcuccyC0lhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glo2JsSRKaCD
 yYfQQhvdRviWUV1AGwwNZwlnfeYl0PDQQQN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKg4eHMySz3yC6H3Erv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWUtRDK
 0sS62w2oLI77kCDQdz0Xhn+q3mB1iPwQPIJTbd8slvUjPOJvUDJXQDoUwKtdvQ9ldRoHzUQ0
 2StlovqPQR/kZ66ESKko+L8QSyJBQAZKmoLZCkhRAQD4sX+rIxbsi8jXuqPA4bu0ISrRGiYL
 ySi6XFn2u5N1ZJjO7CTpAif21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshSUvlhdwTXGY3h+Y1FAN7fbVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusQMYyT7Pf8mOdzgYyjP8UQHPY67Ps04k/IUOsQhHON51H0GibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OS7EIZ9YYQDmRr1os8u5TPD9r
 o832z2ikE4EDoUTo0D/rOYuELz9BSRhWM2t9ZUILrXrz8gPMDhJNsI9CIgJI+RN95m5XM+Sl
 p1kckMHmlf5m1PdLgCGNiJqZL/1BM4tpnMnJy08e12v3iF7M4qo6a4ecboxfKUmq7M/naIlE
 aFddpXSGOlLRxTG5y8ZMcv3ort9eUn5ngmJJSekPmQyJsYyWwzT99b4VQLz7y1SXDGvvM4zr
 uT4hAPWSJYOXSp4C8PSZK79xl+9pyFFyulzQ1HJMp9Yf0C1qNpmLCn4j/kWJcAQKEqcmmvGh
 ljOWRpB/LvDuY449tXNlJuolYbxHrssBFdeEkna8a2yaXvQ8F28zNISS+2PZz3cCj/5of3we
 eVPwvjgG/Qbh1IW4ZFkGrNmwK9itdvio7hWklZtEHnRNgn5D7phJj+N3NVVt70Lzbhc4FPkV
 kWK89hcGLOIJMK6TwJBeFt7NryOhaMOhz3fzfUpO0GrtiZ48Y2OXVhWIxTR2jdWK6F4Md99z
 Oos0CLMB9dTVvb+3g66sx1p
IronPort-HdrOrdr: A9a23:ZHUwNavuVD1sNTzoGtU0F8DW7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634184"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v8 39/47] RFC, no-VPATH: x86/boot: workaround gcc including the wrong file
Date: Thu, 25 Nov 2021 13:39:58 +0000
Message-ID: <20211125134006.1076646-40-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

we generate cmdline.S and reloc.S, so we should include those
generated file as presented in the build tree, but for file included
with quote, gcc will first look into the directory where the source
file is, that is where head.S is located and thus include cmdline.S
that is present in the source tree when it is dirty. But that the
wrong file as we want to include the file from the build tree. Work
around by using <> to include those file as if the come from the
system, as gcc will first look in directories listed with '-I' on the
command line.

So now we also need to add -I when building in the source tree.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/boot/Makefile | 4 +++-
 xen/arch/x86/boot/head.S   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 04ee9da83333..4fc6b1d8ffc2 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -8,7 +8,9 @@ targets += $(head-objs:.S=.o)
 head-objs := $(addprefix $(obj)/, $(head-objs))
 
 ifdef building_out_of_srctree
-$(obj)/head.o: CFLAGS-y += -iquote $(obj)
+$(obj)/head.o: CFLAGS-y += -I$(obj)
+else
+$(obj)/head.o: CFLAGS-y += -I$(src)
 endif
 $(obj)/head.o: $(head-objs)
 
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index dd1bea0d10b3..66acd2e9bfc0 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -772,10 +772,10 @@ trampoline_setup:
         lret
 
 cmdline_parse_early:
-#include "cmdline.S"
+#include <cmdline.S>
 
 reloc:
-#include "reloc.S"
+#include <reloc.S>
 
 ENTRY(trampoline_start)
 #include "trampoline.S"
-- 
Anthony PERARD


