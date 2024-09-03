Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CAD969AB2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 12:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788947.1198458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slR6c-00027X-Mw; Tue, 03 Sep 2024 10:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788947.1198458; Tue, 03 Sep 2024 10:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slR6c-00024M-Jd; Tue, 03 Sep 2024 10:49:50 +0000
Received: by outflank-mailman (input) for mailman id 788947;
 Tue, 03 Sep 2024 10:49:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slR6b-00024G-NV
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 10:49:49 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cd43c4c-69e2-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 12:49:47 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8679f534c3so538910466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 03:49:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a1bf41b29sm120149966b.83.2024.09.03.03.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 03:49:45 -0700 (PDT)
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
X-Inumbo-ID: 3cd43c4c-69e2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725360587; x=1725965387; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bNnGoVXFLfof9ecQUE2WnMPy0Xh1ncsIJEmwtEKVtA=;
        b=PtdpJfQHZTn+cWHQG8Jvk6tlQl5WecQqG17zq0mym0TLG7nmuRZgvViVi6lGI/DM84
         cfIWoXA7KwH3SgGpZmd+Q0dkQARgB7vgof6PNpcG9EaCTqJiXWXt2TeS9yxgXzh6Ps0n
         whhc3q7eyRJuDbt0VlfWvceXU6N1TEOxaEJ+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725360587; x=1725965387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bNnGoVXFLfof9ecQUE2WnMPy0Xh1ncsIJEmwtEKVtA=;
        b=DmPrEaPLo7hhJb1WKthC6AAstFBbpOEzjFj1X76qWsUaj++t1GwYE9mYXcIy0aj0x5
         eVaqlfa5L0r9D/IFrIeHtgDcLPYPx40TtIDlvtOMsMGP/0ue78AB403CtIBlj5G2IFhP
         cpSGN5P7cgBj5iNOhn1ruYUZm/LxZWRimwMXtE00gRnpfO/WWs50YJpcPAQs8x92KcCi
         Tij6GzmEE19SM9Emw6dOZ059/n7oc986xWPFt6EcCBp9k7m84MFCf4TusvsB+zEmo7mn
         kmfb1fU5GSS/LA1+5nQTJ+mBkKsUVWvqE+pbAEXMPPzQ/qwafmU+rbXLUAzkLk4/m6z2
         SD3w==
X-Gm-Message-State: AOJu0YwrTaC/jy1T1tqSkJMpO8Rot6WhqECCd6WKGm5rAq3EkD0UpjiL
	yz57CxHzG1PFtexeNOp5NUv5T+Us1MP1pAVSbYU8OZ9zri1GSjrplpJk41QobTrqOa3mXECOsGt
	n
X-Google-Smtp-Source: AGHT+IE/OpVatsAdSLJIyBGiI7Oytnn1jl+O7XmPoYspliEqFHPWqV8nPmXgm8zBSaMCnf6xD+BxjQ==
X-Received: by 2002:a17:907:970f:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a89d8ab4ac9mr613165966b.58.1725360586209;
        Tue, 03 Sep 2024 03:49:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] x86/boot: Reinstate -nostdinc for CFLAGS_x86_32
Date: Tue,  3 Sep 2024 11:49:40 +0100
Message-Id: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of Xen is build using -nostdinc and a fully specified include path.
However, the makefile line:

  $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic

discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.

Reinstate -nostdinc, and add the arch include path to the command line.  This
is a latent bug for now, but it breaks properly with subsequent include
changes.

Fixes: d58a509e01c4 ("build,x86: remove the need for build32.mk")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 xen/arch/x86/boot/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 03d8ce3a9e48..19eec01e176e 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -13,11 +13,11 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
-CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
+CFLAGS_x86_32 += -Werror -nostdinc -fno-builtin -g0 -msoft-float
 ifneq ($(abs_objtree),$(abs_srctree))
-CFLAGS_x86_32 += -I$(objtree)/include
+CFLAGS_x86_32 += -I$(objtree)/include -I$(objtree)/arch/$(SRCARCH)/include
 endif
-CFLAGS_x86_32 += -I$(srctree)/include
+CFLAGS_x86_32 += -I$(srctree)/include -I$(srctree)/arch/$(SRCARCH)/include
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=
-- 
2.39.2


