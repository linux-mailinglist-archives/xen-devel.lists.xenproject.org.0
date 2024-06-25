Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6115E9170E3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 21:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748026.1155603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVq-0000vT-84; Tue, 25 Jun 2024 19:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748026.1155603; Tue, 25 Jun 2024 19:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVq-0000sg-3M; Tue, 25 Jun 2024 19:07:30 +0000
Received: by outflank-mailman (input) for mailman id 748026;
 Tue, 25 Jun 2024 19:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMBVo-0000O1-72
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 19:07:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28f46f20-3326-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 21:07:26 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso500994766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 12:07:26 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725d7b190fsm180434766b.50.2024.06.25.12.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:07:24 -0700 (PDT)
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
X-Inumbo-ID: 28f46f20-3326-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719342445; x=1719947245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlzSBBPH1Fz0L1myZVLvo6vrKf8kQ291bZGAOZ0GC5A=;
        b=FmdYg87xCxpvnGbBTo2Atgbfbcu+ZvBCuaRsXAJUIVJzLq/2OgiPhKTibAN+TSRp6+
         qierkuHmkRKXsWTQa003Jms50RLSnxyO5s+f2ZA8dcRxntGBkVplhcbAEWpYfujacZAd
         WE4W8SNLA5SsSYZGF/Odkmi9WXcXQQxS/5cIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342445; x=1719947245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlzSBBPH1Fz0L1myZVLvo6vrKf8kQ291bZGAOZ0GC5A=;
        b=TWbsYcCSc80bjn873FDm411QgLVIeqgmQ+IXKl/tOivyCzIqLTtq9Nqr0ouc8TT2XD
         5MEWhrTvQGsxF6itcm04la0xpV02/Z7QVYYpnELcKv9Y0itiWWc3YhQJeKB4cbKlyi8W
         tdnFqBZAmDIiPg703lY0F9zFdUwtUJj+U3YwxwzoiO3MNqnsyQZuTDKjXwkthBZyhlgL
         TviwJ0vsMMtX2Y0f19LGdJpAiMg3Mom1H1NnxGbBSFx4Az8LMjo3dPnkCd45DifiO/bY
         wynVBLoQ7o+1KPVUhoaYJDYkbM4doUzxmGw9lDi0fQSTcm8WnQbdI56TbtDPph9upM07
         iL0g==
X-Gm-Message-State: AOJu0Yw++e+9794HuqMzdbV4MaAXkmVzT3wpqG4POmGt65mm9zFWOxyG
	smnNcWESV6oemD917OpLROlip5QTni+3xNYPgFPtwZdm634UdVwoR6sRWBmJgH0D04OydJuQ7vN
	AspU=
X-Google-Smtp-Source: AGHT+IGuRz/nm8gKauLNQIF038k6w2NBrZxpsGF7hd8yXlcJSlVujS8VN+uqtC7rvaEif9/JFVCvqg==
X-Received: by 2002:a17:907:8dc6:b0:a6f:e25d:f6a4 with SMTP id a640c23a62f3a-a7245c642e5mr589513666b.76.1719342445256;
        Tue, 25 Jun 2024 12:07:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19? 3/6] xen/macros: Introduce BUILD_ERROR()
Date: Tue, 25 Jun 2024 20:07:16 +0100
Message-Id: <20240625190719.788643-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625190719.788643-1-andrew.cooper3@citrix.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and use it in self-tests.h.

This is intended to replace constructs such as __bitop_bad_size().  It
produces a better diagnostic, and is MISRA-friendly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

RFC for-4.19.  This can be used to not introduce new MISRA violations when
adjusting __bitop_bad_size().  It's safe to pull out of this series.

---
 xen/include/xen/macros.h     | 2 ++
 xen/include/xen/self-tests.h | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index ec89f4654fcf..8441d7e7d66a 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -59,6 +59,8 @@
 #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
 #endif
 
+#define BUILD_ERROR(msg) asm ( ".error \"" msg "\"" )
+
 /* Hide a value from the optimiser. */
 #define HIDE(x)                                 \
     ({                                          \
diff --git a/xen/include/xen/self-tests.h b/xen/include/xen/self-tests.h
index 42a4cc4d17fe..4bc322b7f2a6 100644
--- a/xen/include/xen/self-tests.h
+++ b/xen/include/xen/self-tests.h
@@ -22,9 +22,9 @@
         typeof(fn(val)) real = fn(val);                                 \
                                                                         \
         if ( !__builtin_constant_p(real) )                              \
-            asm ( ".error \"'" STR(fn(val)) "' not compile-time constant\"" ); \
+            BUILD_ERROR("'" STR(fn(val)) "' not compile-time constant"); \
         else if ( real != res )                                         \
-            asm ( ".error \"Compile time check '" STR(fn(val) == res) "' failed\"" ); \
+            BUILD_ERROR("Compile time check '" STR(fn(val) == res) "' failed"); \
     } while ( 0 )
 #else
 #define COMPILE_CHECK(fn, val, res)
-- 
2.39.2


