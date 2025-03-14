Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86983A61871
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915190.1320768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt966-0007Nb-4V; Fri, 14 Mar 2025 17:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915190.1320768; Fri, 14 Mar 2025 17:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt966-0007Gg-0S; Fri, 14 Mar 2025 17:45:26 +0000
Received: by outflank-mailman (input) for mailman id 915190;
 Fri, 14 Mar 2025 17:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8tD-0000Ih-Rq
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:32:07 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f6763f4-00fa-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:32:06 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-225e3002dffso13001315ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:32:06 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:32:04 -0700 (PDT)
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
X-Inumbo-ID: 3f6763f4-00fa-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973525; x=1742578325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
        b=WswtqiDOjjyqH1FZhOiRRlf8vyvPmyfFHu3YMvOJO4G5ypHBQ7zRXqPAK6eo8p1MK8
         fsWM+gyq2gLkyYbTPkfQPmgTv7vZvMhdeNQN5VGPPFaEf4TdvBw9jjzyz3phJbWAd+Fx
         CySvCzRALBhz568snOCpyyRoQlWZRBsZLgVbCxCQmfL52jDfkSbgg/jA7UWVGvKxhu7o
         GX0B85RXXcuWqCoD14gE5ckzoG0VivtqW+lQ6XmfHky/JUjZ3ovRp/OdK9gvsDALdMvB
         Pb7RuAcJlV27IlFCI93/PlLAKZUT0RkI7tTlLw/6nkHH+ITzab2P/9jWksUSfyulTNQ3
         6iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973525; x=1742578325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdsNHldr91xnqdGHk1DTLXuYnmkD/cCe/HKmA2EoKL4=;
        b=VQPZ95oUEJgV5tpT7+9V7fYvJqNNNdSxdjCrx4TrJj2cHWrbHHU2D/3YQCuJyWbpja
         fHQ5B1tWGq31Q91BF+sRAK5TegufHgMdmYrhgz6Lm53u7qGOrOaauN+5DTlnmh7AxQyf
         7oK6Ck4Qte4zcAqemCM/eUEvH1uKY36NNCJLbY9yp2LyPyAmozn+SEENP05YWXVad1+Z
         HozLm41AV1p5nqQcH8r+j5xQDkkkWh5A/l9/c6pN2h2AJuJB1fXc51acnoJ4Ntos+nyx
         ov/Y/ip8JlwiUuuPCOqSfkSwFGpcVnwoon0Yum42bKwztXxx2EkKlBIykAGED+JEkdLK
         NIRw==
X-Forwarded-Encrypted: i=1; AJvYcCWgQ/GOeRpL3a4e4N1EYFr+7cOKuZjwV6BMiYWdrlcK7Nn/TWcstAUloOnWbD9/jcPHG3lJ4UB4mjg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEzhzpfKt6RfWz5Os44prg7GqzvC9ujXtNRzMeEiXbu/fBuX3u
	JJQ+iI+Vk7rCwoGTTfZlEcYXXxHtJRodjceurw+kSxbrwjpxaYtPQAXZ9+ODInuyH75NxjJNF1y
	7oW8=
X-Gm-Gg: ASbGncsu+T9QHyuZ93yftegTEWJYs9kJzEXNU3Oxon/aT3x3FklbBNGRm9n95CttW07
	kEus7pKORgHHj5KkGjNcjcWUAVipAI7j6g8DEYaiRakupRQPpahXfdxaROKgot41IrVzfLnxDGk
	peI6SghwPXk2UFA4rJejEwIgh9jMEDWWkRd1vlWxM2ByGSturan9YFV9pxlZJygZJq9ynVKMn82
	I32kwwuwpeZtjE9WmBrSpnPEBiQBlCIz/AF0t6Y9QLYUcYRKOzfZ2Ec2gIRae5dopla3uYT6zv1
	Zx8nur0x1zdkBJCvQuLx12fwh/aHWL9ix73bMnQkYeZO
X-Google-Smtp-Source: AGHT+IHKE9NhNFaDqc44peROMWsjYJioKgZvs6KA5f3lAVTw3ISh5g4Lmu4Vqxy0jtgBCp9rXQffRQ==
X-Received: by 2002:a05:6a21:1f81:b0:1f5:75a9:5257 with SMTP id adf61e73a8af0-1f5c1174fd0mr5240657637.13.1741973524846;
        Fri, 14 Mar 2025 10:32:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 17/17] system/ioport: make compilation unit common
Date: Fri, 14 Mar 2025 10:31:39 -0700
Message-Id: <20250314173139.2122904-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


