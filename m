Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D03A5FC56
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:43:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913048.1319237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslej-0004b8-0L; Thu, 13 Mar 2025 16:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913048.1319237; Thu, 13 Mar 2025 16:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslei-0004Xt-TU; Thu, 13 Mar 2025 16:43:36 +0000
Received: by outflank-mailman (input) for mailman id 913048;
 Thu, 13 Mar 2025 16:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaq-0000Wy-Pm
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:36 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd1b2dcf-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:32 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-22349bb8605so27429805ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:32 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:30 -0700 (PDT)
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
X-Inumbo-ID: bd1b2dcf-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883971; x=1742488771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
        b=TxSHTWyR6ffb/dYZWYK4mXb6uEP8mhP0+qBMxJiv0LqQOas0KsRXfK20+u+tgGvr9M
         U/WPpLS1wFS+pMq2Azxrff6ifDo5Q32CCM6ROCrt2P5XQWDMz36KvC6XSskXy5/3F1nm
         qk+Dp6s/QFVZwPYd1L9zjBXUlNVyC/7WQ96NSD5fjASApd53zh6dVQ2tQYeYUFfbERCj
         aCs6fHv+uqQ3Ns1aPnqB2dimwEEUpx9lN+gAyLF82IdIZ3kiRusjh5sKbkZg0nX7IW2N
         RzEdbhbiljVnOW86qh8u3rXzoWlCapZKStUDB1+RbIka5mGLfC4/1efthR955yfFaaSH
         mgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883971; x=1742488771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
        b=p9enphWgA6/C5/voR/y83PYNgHaJRV+4JpUO0NhP1hrO+wrK6EVZ0VxC0otV4LApI4
         NXRDeVMWS1FSm9gyQpy3rX1G//sQC9UHcMP49D/lF+RZgGoeyhesZdwUngMDK4WLVW3M
         nfbxwjxyISORUKZc12rMhMhJdsPz7gZ1Y7dRBWo+l+nXuRvn87eXn1Ae1syz63tvMnJi
         krypqTGXPMOhApsfWYWDMGCK7/alPv3VNr/JoUI6LubOmrVR3wBYzX9UORWHwGLPn08I
         ksACSxQjr0sSdVAHD+zNC2qxyua5uYKe3lgzADKAid5Yiz86WRZ1fHM3CKbBAVh04n85
         xLHA==
X-Forwarded-Encrypted: i=1; AJvYcCUF6yMZv49N5pThq3vzyqoQ7u3k/c2jtaMX6CJyg3GdqK00x7a12SPbkpQaB0yPPRqnvwOJLYmW+O8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOlchs20hOhUcWVrVvRkJPctSvyy7TBad5mnKf32I6yu0TkciD
	luqBTqhtiG+1w+LJbmp091FpiUiAJFmcENBLEAUhaMHEl8qrT9YGTthzvx9jTwc=
X-Gm-Gg: ASbGncu7G4Ko4DAvHRD5NsSZ6wPbnpjf+DZ8p2AEVI/47JLfAkCCUkEnYyR85t+m4qe
	Cv79MzRrwd4nDiASVGrDYVSLelBxN3EHDdpkAyGm3eHmKHmLInNWjKnEkv0s4TB3+voMWjq5PEQ
	5qKiDtqm5wpBLGWaEPJk5YwTcBV4A5X1RCwsUkN4jjN4CNZepUiUtQOJqqhn/pqCH++ApGxqdbk
	t1COZrRtb0ZBu4rTtBiRMDK0rHjdRbnNSWMGlAd2Tl2NNaIygnndO+A2tvx1d/wB1g7Rjvex/yd
	zGmWm44JJ9hgGgxsEt8tcRhty45mreOCNEVjHAbA9H8p
X-Google-Smtp-Source: AGHT+IGwkoEmUkadWWuwDPp5K+cQQMib7Zg2jJHfpZBwTIoZ4S09vzdl8DeRv7aJJJyLYJnLE9fiwQ==
X-Received: by 2002:a17:90a:d604:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-3014e735345mr385635a91.0.1741883970945;
        Thu, 13 Mar 2025 09:39:30 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 17/17] system/ioport: make compilation unit common
Date: Thu, 13 Mar 2025 09:39:03 -0700
Message-Id: <20250313163903.1738581-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/ioport.c    | 1 -
 system/meson.build | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/system/ioport.c b/system/ioport.c
index 55c2a752396..89daae9d602 100644
--- a/system/ioport.c
+++ b/system/ioport.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
diff --git a/system/meson.build b/system/meson.build
index 4f44b78df31..063301c3ad0 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
   'globals-target.c',
 )])
 
@@ -13,6 +12,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


