Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39AA5B7BF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907018.1314342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvV-0001Py-Vs; Tue, 11 Mar 2025 04:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907018.1314342; Tue, 11 Mar 2025 04:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvV-0001OF-SP; Tue, 11 Mar 2025 04:09:09 +0000
Received: by outflank-mailman (input) for mailman id 907018;
 Tue, 11 Mar 2025 04:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvU-0000fJ-52
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:08 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9369f46b-fe2e-11ef-9ab8-95dc52dad729;
 Tue, 11 Mar 2025 05:09:07 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-224171d6826so78753575ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:07 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:05 -0700 (PDT)
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
X-Inumbo-ID: 9369f46b-fe2e-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666146; x=1742270946; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S847jAMJoPTCQP5Yv6FtgKXIrkXeVt152gZ92AA3GhI=;
        b=P/uDzEgLFFDPAJuCgSzgH6+/Gc5qksYe5yqND+txAymV8k6z4vTFC8FtvUt+1WO25u
         lZdH4n+7QEsfwhkMfZf2gWriYo9TnCi2A6xBJiqByCdn1Vv/Gcq8CpWO/Mf57bSRnED1
         iuNOXS4ouywjXYqCD6xlIlU+AbWLP+IbEgcmW6VldtI14lu+kZeUz4FFt/4h2JeT75gr
         yIZibgRwonL9mObBh9YtvncaZFlQMN0kpMAv9KdEbG7yBA7x8gHhYkQixfP2MEPbIDav
         GayKr/cR3sKpd+AinsqLFyjmjqG3kJR/cF5rHgVuS6GSgh5FgMEaKTVTH6qwDvnrIVlI
         wYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666146; x=1742270946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S847jAMJoPTCQP5Yv6FtgKXIrkXeVt152gZ92AA3GhI=;
        b=D4iEtwTnnOzvpe7qqud2BuupOGpLHtixLZmJA5b9gQT2ZTe3O5zqU3pnXDV1tVybiM
         ZnYOVziEmFbWVIlJD1jA+PkiYUoFdQM/1ZaQDxAiC5Ya4M7YUvM541KveSdG2DNpHu1J
         a6Khopkt/RAeFWRqWKBnqJV3mYEzeGzfZyGGgxWmpnz41JFTVN8Z1SmjsXJPIfHxID5b
         mfWe+lKEw+fUIHkHanfhabyOFHQqi7jjbrlmure2u4M6WBpZ/zaUjVN116PdjAXQje/z
         Mmjgs2wxA45saFN7fSisMZ3fk6+PfzFe2zUxCgd7cprrY+0tY2O1vxhuCIyad+88dqFE
         8aIA==
X-Forwarded-Encrypted: i=1; AJvYcCV0JiSd0++U4FFOLRswvwLrhnz0vt6MzupBUozoOVBIJCI04XMpLZ3/giYQjH+q/efc4oUDozGlSqk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzQvrnExFUx+ku3uN9qZVmRkZioNZBiK7LBTV0aXOWK6KztUow
	fOZCYZLmIZ+eM6qGAUHGlfpzDNu9EyCPb1a4Qa7GBdjvP1ytIPEp4Nevej2t7hE=
X-Gm-Gg: ASbGnct9MbDO7K5oT8cYUo3/mRDBzh3CAVEJYIkhODTzUTQBItHsTG9IvvsOKYcgFcB
	i2woGKDq6vtZwV6notUMzPa57CHyXgxNk4/PSsBI/yVGqWTzjfNGHkPzNXluv2MqcAf7ceHHHlJ
	DVWQZAi5I21Uy377r0wGr9CO+4uW9o9UIyzukvIWVUj4j4KL9r6IqTJDpfg+ns+kGQDkscrdPLS
	FnTrfoyhQO88GAbYx0Z9ouyM4jkMh4SpZspbgc6Q279DXB3z5AjdC4PAtjf8YhHVJX6Oxabq+iO
	OxkQNgphNYfLhsk60Oq8S2ddfgwXqwCGbVSHCLWTp99Q
X-Google-Smtp-Source: AGHT+IE3Vl9B86Ve/DQiaAua/ITAo7nczT+bEsdawDqXZ5VAclVm0x5zL+4TIfw0f3xRMRf28fdfZw==
X-Received: by 2002:a05:6a21:516:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-1f5709de3e1mr11267027637.42.1741666146178;
        Mon, 10 Mar 2025 21:09:06 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 08/16] exec/memory-internal: remove dependency on cpu.h
Date: Mon, 10 Mar 2025 21:08:30 -0700
Message-Id: <20250311040838.3937136-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory-internal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 100c1237ac2..b729f3b25ad 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -20,8 +20,6 @@
 #ifndef MEMORY_INTERNAL_H
 #define MEMORY_INTERNAL_H
 
-#include "cpu.h"
-
 #ifndef CONFIG_USER_ONLY
 static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
 {
-- 
2.39.5


