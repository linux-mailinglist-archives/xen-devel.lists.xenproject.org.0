Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607FA58C2B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905980.1313532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqx-0003g1-Rl; Mon, 10 Mar 2025 06:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905980.1313532; Mon, 10 Mar 2025 06:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqx-0003KR-71; Mon, 10 Mar 2025 06:43:07 +0000
Received: by outflank-mailman (input) for mailman id 905980;
 Mon, 10 Mar 2025 04:59:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEN-000735-7K
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:11 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f23026-fd6c-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 05:59:10 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2f44353649aso5724934a91.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:10 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:08 -0700 (PDT)
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
X-Inumbo-ID: 66f23026-fd6c-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582749; x=1742187549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo5TAW5cQeh1DHP1d5HtuffIuVKJac+rUoQhULbtd80=;
        b=S2adxy8Nd/4OmJZD51feUMSKWHs/gsUxnwaWATXLKof9d6pL4LXlCHEQ2nXqMR0HQL
         1lOjaCqZA+toQZy/r0w2aPKinmNkMWogDFTRJaA57w2WxewXVuoFiXDbFJrtYM1kh+9Z
         0bVDbuaGtuEUzKqt04ngkRu33xWnkTSTbKaWhfsDoGpHScULSByHClbS2vpL3XHB/r8V
         6yG7g1bPYomWnsZh68k+oBvX9kqNCSA/b2vtUUX2x0QfYpQatgRJBPeeocyc53g6GCKS
         xkvjqTjnN5aL4X8Rc7Y0/bdNSRejl5Fc6kC+cTADxayRhF8wipLGkuTzGN6RZIIAV4jN
         T4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582749; x=1742187549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yo5TAW5cQeh1DHP1d5HtuffIuVKJac+rUoQhULbtd80=;
        b=pRHaEXHSgrPfkcaGeFZQaTzM40yaXogJ1y65+YbHJKShBPvpOc5BL+i2Y7Q3vQpns+
         AsF6JWn9exge8oQe9Fadcogayfld+HQpfR3CWPYx1YIOrq6eAXzVEWJCGN2ieI28cDhO
         CCIUbeXWC04dYmIuubD7qqvuBMm7z9sG41RRRQd70JZsMtt2O9kJx5rMHiP2uMrgi0nM
         K3jWIWTVLS4JUkDPJ7l5K7SeqTTQou/2zSAy0DgPcY9aml9Uo89mKy9SWQW8upHBWCj3
         NTa4RygWiZtPuqO5hIMy7sy+CaBkX/AZDk75jWVelEaxVm8/Qtf8Zps1a4w0tqFK+6ac
         W8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXCoMhldYcVdGa4Qy2KoZnekX7J5yHVThKELxVusn/D+u/sIywlX/HMEedy6wxAC7Y+nnWeapJ1rNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtuXWa6Sfju/6E0h2JYUew4MzzqVkF+RPl6pApJRDEqY2XcpRC
	9QYP0AI3AA9b0SYWttxyi1hg5mRzOrNVOoYGgOj6/CMHVNxSZ0cnR805DhfUnSw=
X-Gm-Gg: ASbGncvcSA6M7MQwxDri1eug5pTL6nOLnuXYdM7InYyTxe/zKalh66VsmoP/WNSWEHy
	ShACHimFp+ZAs7En5TiBvnBzkz9So3b0arlJ6OB2K6nGwxkPkeDaEETYMIGDDccsyF5u7SD+Dxi
	A2f54hjlR35mT8kdQBesvGvYaNXFeFTN2hN2gXNU62/HoTpzf1w2vdgwRQhBpyie6xvaONREVn8
	hCV/D0wyGvxcZcnUeMub0+CmUK0ALVVPpoXHHSq33HwW9bk/7iZaEfhhFgUNtN4Rz6JVaw8dvRM
	l2zbBk6MYSbyq047z/vX/KOyEsRSV933XhWObFoJDC3n
X-Google-Smtp-Source: AGHT+IE5gWrqVh7MPBsCW9xpH4WbBfOw86WZFsUWQXQSa3FRghy/XQpC1OkuRKA1xd7a02NCd2RqPg==
X-Received: by 2002:a05:6a21:6e93:b0:1f5:6e00:14da with SMTP id adf61e73a8af0-1f56e0016d7mr7868375637.40.1741582749217;
        Sun, 09 Mar 2025 21:59:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 16/16] system/ioport: make compilation unit common
Date: Sun,  9 Mar 2025 21:58:42 -0700
Message-Id: <20250310045842.2650784-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 881cb2736fe..3faec7e4dfb 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
 )])
 
 system_ss.add(files(
@@ -12,6 +11,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


