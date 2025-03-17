Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677CA65D0D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917942.1322731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFQr-0001XH-9b; Mon, 17 Mar 2025 18:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917942.1322731; Mon, 17 Mar 2025 18:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFQr-0001Vn-6r; Mon, 17 Mar 2025 18:43:25 +0000
Received: by outflank-mailman (input) for mailman id 917942;
 Mon, 17 Mar 2025 18:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIf-0006uj-JH
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:57 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ff93322-035e-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 19:34:46 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-22580c9ee0aso83029745ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:46 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:44 -0700 (PDT)
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
X-Inumbo-ID: 7ff93322-035e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236485; x=1742841285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
        b=FjBymkTHfff2RMvzLyGjlCHHgDIF3LvcR90UbIpi5/j7fU8dS1ZatYaReOvbWTg/cZ
         rcKTZm0rmNtOErdqRvbRdkEOwNj11nsmMHblzVklCrMTXY13B/GEXjx3k+e9bR8O0UXQ
         yUmPKIq1u6JAVg0KY/cWccjGQgfK8YVWZr914wAjTmC5rPsPg81LfvL9X7rzocGyAnvx
         ZjqF7SNb8n9z6Z0VoFruw7VlG+zj+6lFtvA6lmHfxI057JGl1fF+O6VQKe2XiWkN2jnO
         oE8mYf7gmZbi8hIrdxUZ3GkICBHHeUCtlKpgUTBS4XVnJ6zer8qnBOs2ghzp+FCrNj4i
         SmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236485; x=1742841285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
        b=Lp8buqyBaYwRzMVXVMjKyaePngqv9RFWGM5cTO5o7QBEpBrBHy8BVV1zuTb66wa/Se
         7e+J7tzYITH7tkTPv8p172ERE617xmN9ysmNKHLpOJdAyLr4GzcDqQ+Yl+lt6A+wPBsQ
         S6Hd9kUi6Dwh5wvssXkS7ZZ68n/MeLv7kj1y/L8Hd0Mh/j1J7nASwGzsuCBup2qk/Eui
         +Ip1qRSGlwbHgkboW9O89+ddF7qbP8QMUEQAgsFywJqX90Oan5s2A1JFSqHjeXVMMiaS
         r1YF6d6wmUpLs/O8fiw74pDplpMp3/7SEhDq/YXyg3VJUm4XPULY9DLymI8O5rtfPB61
         kVXg==
X-Forwarded-Encrypted: i=1; AJvYcCWSCR3j4EhB6e7eLJkrkcLJKFL80JhHIKpLnZhoq0xLM3R92cNgnJ77G566xzeSaBKkdfDs/Pwi2Bs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOL9N2WmNQ1n5IXsbSwMM2j/MEvTFKMJ/+a8LOCg3ch6DCCkGy
	hh8TimAkEaGgtfsHEZsyJjfjbUzTEYg3tYVap72G3WTy5zVO65ksiK5kdyslTPc=
X-Gm-Gg: ASbGnct6NBC1HVcW8UXEJSs97JSbeo1zOmI6IqLky2zcMtNiZxJtEaRRuVX+526EmWX
	8ZYwJKfjyhj8h7i16batejqXaGb6UIN5X8BHivJ90KvXQFOTZe8vJQrVAcRGqIpIBXLAkXTUs+U
	ZLKIG7dhn4eN3hqOnGjzMURMbVBXL9TX22Z6kgWXvEbWGJGVjRaqtfqWHXoDW9G+wRKiZcl28Fd
	lRHCE+Du2381g0F/aMaI9RFIot3LNh+krd7VIrO5axM3z+wuaGksj9yAogFgXZQeGbBowbNLWra
	dXU1MgpOPPkMnfD/fTdFp5Hwd2JeftFvFryJjsTtVj2a
X-Google-Smtp-Source: AGHT+IHzNNUW3sLQt1T364FsCohrjLgSsBCXmjd/XRyR5B72Si2GIa2LUJ+5Zkf6gr6cDVKPRd/CWg==
X-Received: by 2002:a05:6a00:b95:b0:736:3d7c:2368 with SMTP id d2e1a72fcca58-73722353269mr15820164b3a.7.1742236485130;
        Mon, 17 Mar 2025 11:34:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 18/18] system/ioport: make compilation unit common
Date: Mon, 17 Mar 2025 11:34:17 -0700
Message-Id: <20250317183417.285700-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


