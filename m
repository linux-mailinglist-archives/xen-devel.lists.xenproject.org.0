Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AD7AC51CD
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998528.1379251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJw0m-00061U-53; Tue, 27 May 2025 15:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998528.1379251; Tue, 27 May 2025 15:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJw0m-0005z0-2O; Tue, 27 May 2025 15:14:40 +0000
Received: by outflank-mailman (input) for mailman id 998528;
 Tue, 27 May 2025 15:14:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJw0k-0005ys-4m
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:14:38 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4da3cf0f-3b0d-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 17:14:37 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-32a6a1a5f6dso13814301fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:14:37 -0700 (PDT)
Received: from andrew-laptop.. ([46.149.103.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b297easm284079475e9.6.2025.05.27.08.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:09:13 -0700 (PDT)
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
X-Inumbo-ID: 4da3cf0f-3b0d-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748358876; x=1748963676; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VCodU9jGR8msSOdWdi9DvFF2loiFVgvwENQEVsCaS+Q=;
        b=M02Uhd4IE0pyOuu5zyosxBF+Gm+Ln2p0ShyJc160sKFdDMJ3Kbkiwh2+P7tS3ybfx0
         x3GsScoAq9F4VGqP5TUVXCoeWBqcdR3nzlr78JddLVuKesx9MXK8HhlBSi3OY4Q3ZmoE
         3nbHra12K5mnTqToJBB3O8pd76NDIbhNv5ylo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358876; x=1748963676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCodU9jGR8msSOdWdi9DvFF2loiFVgvwENQEVsCaS+Q=;
        b=IvWrsLeTA0Vcn5Tz6kaagVgba1udShSWWdcFHJOdFEDbS33XAoFNfMM/6/556ZMf58
         DuIFJV/Kpef9xrJZY6gQfejQo85v7jxin2trtsC7oF1z+8uWkGUu/rjzorZ5ms/pWvqG
         nSuGZdKa0owBmRc1i/wB6Lyd5x4F9INC8O4FEmxjbuYHR+z7k2OtyiE94M8dgjdZBo9n
         KWQoFCs8rsbZ0O/UDCPfvBbMiJVIYk4jq/EeCCO5m/YjXxaXtSWb7+uNVeLzvrzmSWFE
         wnl2f2M/9KuY9uDPMhSUj9Y/8BNNtB6aFmz0d1ULzHRPOxfw+7ciMPaYRVTAeAqGPdyJ
         GIeQ==
X-Gm-Message-State: AOJu0Yy8067Tyu1RXG6L64LcT+IrYyF5AsXVx4AGTiBsOmbwgckp0S0p
	rxI9+dS7DZF5iU3iESdUpCwBWI/AZmKz0KXvpK6FnRFhhDiZd4kG5t66Z4sSSb9/uAehufGdju5
	m0kHQ
X-Gm-Gg: ASbGncus2CKo7oPsh8tH6jucK5N5Z9ufLNzgy9e8WZlPDqHnu//Jz3/y6OBaVD76Cye
	lUm2YrEYJ+W7bhY6c3u3oEH8k9m6ev1uXU/NMoU5wAutj46Mhnknhkj+oRTXLVm8CQ3zUndPqq/
	EmCboxmcYe5BwpkKHgSh0hMy7uy9iEyV4U+tx31cRjvFyAW/A7uQbtwUoVhOyYsNF5JRk+X4fBM
	gfv6v9CwgWvPjfeyQz20bW+tJA+XnK585ngqog59gxGYL/7xprwVCE2UdITnumOfJZ6vA1SvgRs
	BiItMDoln0jCsKAw/7g+wRWKOTyhzOTmymlrdKpJZ1psA+poSBH4tlafCXvyd08=
X-Google-Smtp-Source: AGHT+IEE0z3ChNgO7reWEl9PjWTRTVrymGJ9o8Pf7TWX7UgdKFl3SosYdL2qFcqTl3g3B/KWjdYJzw==
X-Received: by 2002:a05:600c:3f07:b0:44a:4fe3:3a28 with SMTP id 5b1f17b1804b1-44c916fc5bamr104120465e9.1.1748358553822;
        Tue, 27 May 2025 08:09:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/traps: Trim includes
Date: Tue, 27 May 2025 16:09:11 +0100
Message-Id: <20250527150911.59744-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

None of these are used by traps.c today.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I'm experimenting with include-what-you-use but it's not the most
ergonomic of tools to use.

xen.git/xen$ wc -l arch/x86/traps-{before,after}.i
  29647 arch/x86/traps-before.i
  25355 arch/x86/traps-after.i
---
 xen/arch/x86/traps.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index f9e17e015947..092c7e419748 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -17,47 +17,25 @@
 #include <xen/console.h>
 #include <xen/delay.h>
 #include <xen/domain_page.h>
-#include <xen/err.h>
-#include <xen/errno.h>
-#include <xen/event.h>
 #include <xen/guest_access.h>
-#include <xen/hypercall.h>
 #include <xen/init.h>
-#include <xen/iocap.h>
-#include <xen/irq.h>
-#include <xen/kexec.h>
-#include <xen/lib.h>
-#include <xen/livepatch.h>
 #include <xen/mm.h>
 #include <xen/paging.h>
 #include <xen/param.h>
 #include <xen/perfc.h>
 #include <xen/sched.h>
-#include <xen/shutdown.h>
 #include <xen/softirq.h>
-#include <xen/spinlock.h>
-#include <xen/symbols.h>
 #include <xen/trace.h>
-#include <xen/virtual_region.h>
 #include <xen/watchdog.h>
 
-#include <xsm/xsm.h>
-
 #include <asm/apic.h>
-#include <asm/atomic.h>
-#include <asm/cpuid.h>
 #include <asm/debugreg.h>
 #include <asm/desc.h>
 #include <asm/flushtlb.h>
 #include <asm/gdbsx.h>
-#include <asm/hpet.h>
-#include <asm/hvm/vpt.h>
 #include <asm/i387.h>
-#include <asm/idt.h>
 #include <asm/io.h>
 #include <asm/irq-vectors.h>
-#include <asm/mc146818rtc.h>
-#include <asm/mce.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 #include <asm/pv/mm.h>
@@ -70,10 +48,7 @@
 #include <asm/system.h>
 #include <asm/traps.h>
 #include <asm/uaccess.h>
-#include <asm/vpmu.h>
-#include <asm/x86_emulate.h>
 #include <asm/xenoprof.h>
-#include <asm/xstate.h>
 
 /*
  * opt_nmi: one of 'ignore', 'dom0', or 'fatal'.
-- 
2.34.1


