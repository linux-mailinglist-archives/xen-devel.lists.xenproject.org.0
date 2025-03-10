Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A37A58C2E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905974.1313515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqw-0003AL-3M; Mon, 10 Mar 2025 06:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905974.1313515; Mon, 10 Mar 2025 06:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqv-0002wT-D0; Mon, 10 Mar 2025 06:43:05 +0000
Received: by outflank-mailman (input) for mailman id 905974;
 Mon, 10 Mar 2025 04:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEK-000735-M2
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:08 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 658460b3-fd6c-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 05:59:08 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2255003f4c6so17804685ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:08 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:06 -0700 (PDT)
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
X-Inumbo-ID: 658460b3-fd6c-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582747; x=1742187547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMZho2jTEznhsPIS6UESQksv+KrJv0rJOAa8ZMe9/mc=;
        b=IsKsnidGxtIvsNR63CCYeXYz/4d/I8bWkAP4tpQsS5liiaMMKJ4YbdhhIvQaLnb7Yf
         6RGWuUFeNXxZrwbmNO+m9q+flgOFm+syKNoakOMx/i/FFNpQL7tLZjK3Na6oau8Pr7pl
         95gEP+cw64oYbFq0lUsPKkn0TvbseIFqr9nlfVi6BD5s3fwDNPGHXs2NqcY70zHaz+30
         zfBPTNYQKnY+ZspFyVVahHx4jO+JQsynX4QqEER7T5FALNuE/xCmg/uh6atTbkhvl/l8
         aZUPUHu/s4fNJvQbjYsThiCfSUv0P6UmT/i1yBNIdztUrGIlF96yoEHvsyZjHx693j6D
         u7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582747; x=1742187547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMZho2jTEznhsPIS6UESQksv+KrJv0rJOAa8ZMe9/mc=;
        b=rtEXPvvBv1S2AJK1XZqrm1uNTE3lexnnIeTPSihj9BvHoqmVNJY9yGfFAe2iRS+fIj
         wa7im4SLCmD8yRHzLL2I5mSzlsNSnDcOUFP4zWSZfQqRNHZirMJKQU1BpZ7cijJlVnKU
         Mjg0KEwbmN3saXxeiQFMs+OqRE2fyUjGwPjs5aYiDjt7fx58POKrDm9VAgMuTR85aKTZ
         ahveLoZNSRwmG1qYX4HJWnT1pq/TrKwa7W+ZDnNHvCKN6FBLHjfDXc8Blc/bwgWNaAyO
         CukvxzJs0JSrE35P3ovx5ZZs/OcC2NMzqN4f7XaxfspNloJqFgbcXxLTDWYVVkeU+OTQ
         xk3g==
X-Forwarded-Encrypted: i=1; AJvYcCUN4a7ECd8TqVPgG3UG+tTf0IsFMzznCzZSHR5I0c0RcZ0iZQbb7o2yaKroLqDgTLay+XYdjWT4f2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOUyctZKEV4XEdV2f7U950R7swpNj4GGECV+faab5aoWBWTwVe
	GeidEVJK1NyYqwg8F/5XHT6MAA+YxCDD7knQ1tzCzGFwPMVvQQcJlaoqbondrAA=
X-Gm-Gg: ASbGncsVJykq9S96g6qoVhuTWDX7Pwmd0NEPP7CykVdE31pdVxU601tiGRC1rqqBjSV
	VQSJB1OhaOICD5zJeMyTkGjbmHsC4NwTuin7KgMoFCcLjzbrP1CNFgEr5aFX7bIp91q2YtJVKo1
	F1hyvCr06h9Rrtub+djwh9j9yeGfjxJosibZl6fefOZmfUUw10RQE0Hq++0aI95HqO7Kau4QIpj
	rJ62731pt1FhmvgiHfjfRAefyYqreI6JG+8tsNvqgkwOhSTantZAfRlzS62cIDJLyiWiJ3VFIvD
	h5Pier9VFWU1dvgjqRuVsl30gAmkg60oj3fvN+XON6oR
X-Google-Smtp-Source: AGHT+IHbQ1zJTyihYPTNnOdjfB7Sf4JwjgD8pBM833NXOATM0his3HUH4Ux5tSFbwWsuCfmQbH8fWg==
X-Received: by 2002:a17:902:d488:b0:215:4a4e:9262 with SMTP id d9443c01a7336-2242887fd5cmr174335945ad.8.1741582746784;
        Sun, 09 Mar 2025 21:59:06 -0700 (PDT)
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
Subject: [PATCH 14/16] system/physmem: compilation unit is now common to all targets
Date: Sun,  9 Mar 2025 21:58:40 -0700
Message-Id: <20250310045842.2650784-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/meson.build b/system/meson.build
index c83d80fa248..9d0b0122e54 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -2,7 +2,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
   'ioport.c',
   'memory.c',
-  'physmem.c',
 )])
 
 system_ss.add(files(
@@ -15,6 +14,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
   'rtc.c',
-- 
2.39.5


