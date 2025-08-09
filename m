Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC7B1F71B
	for <lists+xen-devel@lfdr.de>; Sun, 10 Aug 2025 00:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076301.1437948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnX-0006R4-2q; Sat, 09 Aug 2025 22:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076301.1437948; Sat, 09 Aug 2025 22:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukrnW-0006N9-Mg; Sat, 09 Aug 2025 22:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1076301;
 Sat, 09 Aug 2025 22:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSuF=2V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukrnU-0005qO-NM
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 22:12:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e72a9bba-756d-11f0-b898-0df219b8e170;
 Sun, 10 Aug 2025 00:12:14 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so1706392f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Aug 2025 15:12:14 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm35424323f8f.44.2025.08.09.15.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 15:12:12 -0700 (PDT)
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
X-Inumbo-ID: e72a9bba-756d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754777533; x=1755382333; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfND0zg2ZLDeX3cn2aUNtMfsNyhu9pemRzEnrfx6pMg=;
        b=RreJLoH9gntuJDdsOj+t1oAS0eRBG6E5qU0EkyGZZUTuLl4NZUwGIhELDDVLeUOuwb
         i8NiG+gs1JDc5Ot5+6+vzmyvtdtB7z2vhwHL/Q1OxQ4qRy4anHFtfU0j2abXR/HHjjah
         kA7TZyePuqTF6GXnfhV4h9DjTy6tbPKSRm8MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777533; x=1755382333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfND0zg2ZLDeX3cn2aUNtMfsNyhu9pemRzEnrfx6pMg=;
        b=ahvytwk78aYTSr+PFcSM2xhCVtBL9BeL+fhfNtBWobuf7CFWgjSBQPS2OWxMBy209G
         snAkj7g918+Bopg27KTtoBmNnW28Pd4l97Y1/mWXZVrFAxP+iCb5nCp9amPwPB/PE/tb
         tYcXIQyylTJPSQ9fDGAlQxKY61wob4w5+XKtrrLJCFB0mPI2gpZOm+/N92pRohWmPbti
         PvX1MhiLhwtuFCo39Mg38s9C/2NVd0aYDi0fxftNTSouel6Uxjnl9z4e9nYjQfQuEn1A
         fkX9pY4eG57Myv3OCa9iM5hoDlBPuCgyV24c06xHfQJSilFaC/PO3ykk7hW+inkZHlj3
         F0vw==
X-Gm-Message-State: AOJu0YzN1r4TVB3gHw8/3kJoCHb7TDd3jFUxyRDG1/nwHmwAQBAjQnHZ
	vCZl+rlM++ksBv8CrdNEwMwibs+iE+ksIio9BFcCoseYHi48XjXCCDUdKenv30pRi1kL7cgVSeS
	3oDtBuCY=
X-Gm-Gg: ASbGnctzoLx/y/R6y885OAN9Wl6557394XpAXwU2n3L3JDF6kafQL3ymZw1BFmoOALm
	jw4K6yg8LQd6FjonwJjU5MgV0fMmbjK6gJgorHbuiunsXimJ1j2PXwC18zRregtbnmdgOMnOUEQ
	Ea18rNpA3XjqWkHhsetVY+DV/pk3kW5pVTaj8w0nsdxT/FwG6KEecXpLl4WrHv+D0xGT6sJ2Zd+
	4EnDnY+DDJYsx5/zZq2jKx6LNKTcuzc/CiT21u1vOfDeDN+WNfFs76uHvCJoEHI9JRoj2c4IgBF
	I8j95LWHXbg470KPnjn2E2TfYVDx3o2LZ/U7od9yszawo8/qn8GoC2Bc97ib7a8L2zdbzep60Qh
	6Mck0IWzONCY6WI4zhXyBFhXPMC8gH+KLfpDlMNPU7X65eLNZn/1WRw1mLBzGItVaTgHvEyQHYL
	H+
X-Google-Smtp-Source: AGHT+IF56eny7f5TY2zNi77piWoa/BoaYTwZw+7F+6xe3Y3GzRAWxu7PyUIxjQbhhGnLBTyQpUHk+g==
X-Received: by 2002:a05:6000:288a:b0:3b8:d2d1:5c11 with SMTP id ffacd0b85a97d-3b900b56f28mr6273885f8f.51.1754777533210;
        Sat, 09 Aug 2025 15:12:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/5] stubdom: Fix -Wimplicit-int in newlib
Date: Sat,  9 Aug 2025 23:12:05 +0100
Message-Id: <20250809221206.1260861-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an error now Debian Trixie's gcc-14

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
CC: Juergen Gross <jgross@suse.com>

I really think we need to move onto Unikraft as a maintained base...
---
 stubdom/Makefile               |  1 +
 stubdom/newlib-fix-etext.patch | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 stubdom/newlib-fix-etext.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 666c3221dcd7..9aa0d3dee4de 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -94,6 +94,7 @@ newlib-$(NEWLIB_VERSION): newlib-$(NEWLIB_VERSION).tar.gz
 	patch -d $@ -p1 < newlib-cygmon-gmon.patch
 	patch -d $@ -p1 < newlib-makedoc.patch
 	patch -d $@ -p1 < newlib-fix-copy_past_newline.patch
+	patch -d $@ -p1 < newlib-fix-etext.patch
 	find $@ -type f | xargs perl -i.bak \
 		-pe 's/\b_(tzname|daylight|timezone)\b/$$1/g'
 	touch $@
diff --git a/stubdom/newlib-fix-etext.patch b/stubdom/newlib-fix-etext.patch
new file mode 100644
index 000000000000..e7bd4bb0cead
--- /dev/null
+++ b/stubdom/newlib-fix-etext.patch
@@ -0,0 +1,23 @@
+GCC-14 in Debian Trixie i386 complains:
+
+../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c: In function '_mcount':
+../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:227:14: error: type defaults to 'int' in declaration of '_etext' [-Wimplicit-int]
+  227 |       extern _etext();
+      |              ^~~~~~
+../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:228:14: error: type defaults to 'int' in declaration of '_ftext' [-Wimplicit-int]
+  228 |       extern _ftext();
+      |              ^~~~~~
+
+--- newlib-1.16.0/libgloss/i386/cygmon-gmon.c.orig	2025-08-09 22:48:09.864068481 +0100
++++ newlib-1.16.0/libgloss/i386/cygmon-gmon.c	2025-08-09 22:52:18.458393484 +0100
+@@ -224,8 +224,8 @@
+ 
+   if (! already_setup) 
+     {
+-      extern _etext();
+-      extern _ftext();
++      extern char _etext[];
++      extern char _ftext[];
+       already_setup = 1;
+       monstartup(_ftext, _etext);
+       atexit(_mcleanup);
-- 
2.39.5


