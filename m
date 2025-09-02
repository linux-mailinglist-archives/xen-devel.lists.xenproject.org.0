Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1855B407C6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106778.1457431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSLc-0007t5-9e; Tue, 02 Sep 2025 14:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106778.1457431; Tue, 02 Sep 2025 14:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSLc-0007oN-2l; Tue, 02 Sep 2025 14:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1106778;
 Tue, 02 Sep 2025 14:50:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utSKN-0002MQ-Me
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:49:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ec5ff89-880c-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 16:49:42 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b8e28b3c5so12722245e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 07:49:42 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fb9431sm19919809f8f.44.2025.09.02.07.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 07:49:40 -0700 (PDT)
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
X-Inumbo-ID: 0ec5ff89-880c-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756824581; x=1757429381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KpBnT7I8p7FGPb0FeHkvOUb1B4lVXyTx0EhHtDjZ/gk=;
        b=F4K9n091ZSqImpqPqnF/nta1pOFb228xQyD4GloexrK1tZFvOZq1GwljHg40nxjYAH
         SPwj6xG3CU30isemBbwyeht3bx0ictM1RmhSc7soS8RbiN3d/tBfmtn4C1qmIQUfhr4y
         cN3N07FnhEKjPpFZRjLUvSinn1aBUXr1o+KVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824581; x=1757429381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpBnT7I8p7FGPb0FeHkvOUb1B4lVXyTx0EhHtDjZ/gk=;
        b=VuZK8I178vZtqQGSMZGIrG64ypX8jBIJNAIvV14npehhNCxg+mu7pHOppvM/OsWTeI
         fBeO77bgH7X6N738i0zBtOmFvYPYn2UAGZXH7eoddRg51Mh3TG20DiQd6w0nxcjoT11l
         YN3WKiwc4a7KqLYcPL9o8UqV6kd2C1cqKTALpHWYesTB00nrGtA1U0HUaOFoTdjU3QYm
         cbomqStrcRpYCSIv92hAgxQbBY0RPpqpw3OQ1+yRNuQ2pDpKMQI3L+/+l3FjxNkbvzf6
         y0su+udFq084m+AvI/6e+U+YigdzwSAo4LlB5raIoC1R/Xti33N2O9LxgYjhChe131SY
         sUqA==
X-Gm-Message-State: AOJu0Yw83C1uJ41sHDw1vTXFdov1Pgvsj0issSiBqeYCTHaNbvtcUlCy
	NkS2PPSvZs8Xrg7s56xrhPWoXpwY2N0sjTxPuTQr92U1CVkoh7exUPIXrAeGG4KTVvymuPzpuxv
	S6Try
X-Gm-Gg: ASbGnctJ4XUFVyJXzepkpLSizm4Td7sNbUKxd1Tnr9CGunD+P3XTQjUnWDfH3ca5XgY
	kTXOkcVV17+x4sH/KpZ4UVPWl9QRPFeB3+F34JdTuF7+ujP50fn8IC2U9ql4E8gSkS1j5vH0qmP
	qfn10U1ERGR94DvBtmg2b+miSOj4FyqaMeShh/hllNw5IE6Zrk2NROEXKbJd0DHS+5v8XTRi/cK
	p0iGFwJf+wJ1OrMKGVan8urmkrqaq3ccociUluAZz3er9K1RjXUlAv6Wv9Xq75qItz1KSt4nGG3
	AT/DI16LPgFFXTEwbKrT8TVVx5zONkrfSqpuj+ElQBT0XV5qsIUeK/dkctAiK2H3/66szDidf+Q
	Nqsc8SEScghj8CbuW6XY0nUU+AL9XxH4JukUJ+XAkVvuAg2c7nzV06gabLwLzue8iGEnls7qvjP
	+536dyXg+K74o=
X-Google-Smtp-Source: AGHT+IH7++S7yfO6nacueI2+WT/DeIbZ1fpbJq1Rc6I0UNJFkpUfi3x1f3TfZrPibuif+CVEFCe6jQ==
X-Received: by 2002:a05:600c:1713:b0:45b:9548:c1a2 with SMTP id 5b1f17b1804b1-45b9548c1eamr21865175e9.3.1756824580760;
        Tue, 02 Sep 2025 07:49:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] Tidy up .gitignore
Date: Tue,  2 Sep 2025 15:49:36 +0100
Message-Id: <20250902144937.1414411-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop unused or stale lines.

 * While it's necessary to have .git and .hg in each others ignore files if
   using multiple SCMs (as we did for a while), they should not be in their
   own.

 * The ignore for LibVNCServer* was added by commit a090ca495e7f ("VNC pasword
   authentication support for the paravirt framebuffer server.")  (2006) but
   without justification or any obvious reason.

 * The ignore for tools/misc/lowmemd was added in commit c812282081bb ("Low
   mem virq incremental adjustments") (2012), but xen-lowmemd (from the same
   author) already existed and was ignored properly.

 * tools/libs/guest/xc_* were added in commit af6c78d9dc68 ("tools: move
   libxenctrl below tools/libs") for bisectibility, but should have been
   dropped in the following change, commit e3dd624e487c ("tools/libxc: move
   libxenguest to tools/libs/guest").

 * tools/debugger/xenitp/ was dropped in commit e567964a54b8 ("tools: drop
   ia64 support") (2012).

 * tools/debugger/gdb/ was dropped in commit
   baa1aae9cfdd ("tools/debugger/gdb: Remove gdb") (2010).

 * tools/misc/cpuperf/ was dropped in commit ae95fdf65a72 ("[TOOLS] Remove the
   'cpuperf' misc tool.")  (2006).

 * tools/misc/xc_shadow was dropped in commit 7133144e3abf ("Remove xc_shadow
   tool") (2007).

 * tools/misc/xen_cpuperf was dropped in commit 60eba9b0d265 ("Delete some
   unused tools") (2004).

 * tools/misc/xen-tmem-list-parse was dropped in commit c588c002cc19 ("tools:
   remove tmem code and commands") (2018).

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>

I'm sure there's more to clean up, but I've already been playing archeology
too long on this.
---
 .gitignore | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/.gitignore b/.gitignore
index 7b7f5e7a4ad3..84a01e8afe6a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,3 @@
-.hg
 .*.cmd
 .*.d
 .*.d2
@@ -62,11 +61,6 @@ tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
-tools/libs/guest/xc_bitops.h
-tools/libs/guest/xc_core.h
-tools/libs/guest/xc_core_arm.h
-tools/libs/guest/xc_core_x86.h
-tools/libs/guest/xc_private.h
 tools/libs/light/_*.[ch]
 tools/libs/light/*.pyc
 tools/libs/light/_libxl.api-for-check
@@ -84,11 +78,7 @@ tools/libs/store/list.h
 tools/libs/store/utils.h
 tools/libs/store/xs_lib.c
 tools/libs/util/libxlu_cfg_y.output
-tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
-tools/debugger/gdb/gdb-6.2.1/*
-tools/debugger/gdb/gdb-6.2.1.tar.bz2
 tools/debugger/gdbsx/gdbsx
-tools/debugger/xenitp/xenitp
 tools/firmware/*/biossums
 tools/firmware/*.bin
 tools/firmware/*.sym
@@ -147,20 +137,14 @@ tools/include/_libxl*.h
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
-tools/misc/cpuperf/cpuperf-perfcntr
-tools/misc/cpuperf/cpuperf-xen
-tools/misc/xc_shadow
-tools/misc/xen_cpuperf
 tools/misc/xen-cpuid
 tools/misc/xen-detect
 tools/misc/xen-diag
-tools/misc/xen-tmem-list-parse
 tools/misc/xen-livepatch
 tools/misc/xenperf
 tools/misc/xenpm
 tools/misc/xen-hvmctx
 tools/misc/xenlockprof
-tools/misc/lowmemd
 tools/misc/xencov
 tools/pkg-config/*
 tools/qemu-xen-build
@@ -249,7 +233,6 @@ xen/suppression-list.txt
 xen/xen-syms
 xen/xen-syms.map
 xen/xen.*
-LibVNCServer*
 
 tools/qemu-xen-dir-remote
 tools/qemu-xen-dir
@@ -270,7 +253,6 @@ tools/include/xen-foreign/x86_64.h
 tools/include/xen-foreign/arm32.h
 tools/include/xen-foreign/arm64.h
 
-.git
 tools/misc/xen-hptool
 tools/misc/xen-mfndump
 tools/firmware/etherboot/eb-roms.h

base-commit: 437f07b2b52b32929c74c2e19a52437ce7e5b88f
-- 
2.39.5


