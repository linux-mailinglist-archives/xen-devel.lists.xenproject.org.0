Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C0AA62B1
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 20:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974248.1362155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAYT4-0001gW-Bx; Thu, 01 May 2025 18:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974248.1362155; Thu, 01 May 2025 18:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAYT4-0001f4-9K; Thu, 01 May 2025 18:17:06 +0000
Received: by outflank-mailman (input) for mailman id 974248;
 Thu, 01 May 2025 18:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tswP=XR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uAYT2-0001ey-PC
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 18:17:04 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c7c6b2-26b8-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 20:16:59 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so1242705f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 11:16:59 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a095a4bd22sm1409067f8f.46.2025.05.01.11.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 11:16:58 -0700 (PDT)
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
X-Inumbo-ID: 78c7c6b2-26b8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746123418; x=1746728218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAH9Te2E+GDORnDRSzkoVXYr91QG3/tdbA/aoY+A3k0=;
        b=SIrN/fv2Fhlcp4grK7DtnBgRFYMIeQhvsiIO9aCszUmym0grzHOw7dSs/LqhUpuRx7
         +2os6aSBKPlVkUT42FcO28iuf7GzRfrANwww4qCtCzE7CneoLcMVsIpYfsT1l+e9Ises
         Qnm9gkMHWSn2W8Vxxsz7jhGvlpUeivTHnogcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123418; x=1746728218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAH9Te2E+GDORnDRSzkoVXYr91QG3/tdbA/aoY+A3k0=;
        b=kgPjpBAtRL3fFqD8JXxH1KyNRwCgh9niZtdL9qscyHjWucO1CesZ3dnmR8EbOoxrBl
         Kad7lf7T2S46yi3X0wXIO1zvXOwG3LqEsZJBeisk6scLOPRQiOLVQpqBg4iJnqNTAoOM
         5+zFwLtnzDQJkhAIwBaFlUruq0HYgXmA4Mu8LHDJ4HOCXDoJyggI4l4YYrx34EPg1RL5
         njurGHdP3/8uxzF2SI+Ghg2ul5CnMNH+f4TD7qZglFqNBau1oUZMx3cVqjvd0Fc20xSV
         27VRJiPri8uqTbX+/VbvUErYEWNC2CaYOy8/avCivqGDCZWjkw3mY0cZfHHnPN6vBQuT
         84Vw==
X-Gm-Message-State: AOJu0YwiTDlbRxmys411jbq48bapklUgTjH/u5gjixHZqqNhfn/pHiS8
	0lrn3ABEhKTz+metoPdS+2279kiM7VD3++hRCeWlgJbt5XMP+8W8NbMw1FSoVZO6adNfA8OjulR
	C
X-Gm-Gg: ASbGnctOINsSA7/p7z2OwWXg9jjHslwY8AzDxFgCa7plQHveiSO8fn7rWVfn3DvMlVu
	wPNQptep1i1MeZx+OQBbxw5MdIbJDz2LNfJEzwn5HUosFQnE6jWiuP9tBrF7O3udHX1TRynXwFh
	2tk1eGk52Sk2es5BBE2qFxKeqK1FQedndZUnGtNrDaG+Vn2KBRH1dQpKd9X8B3HN5EYJd97LR2p
	ntIPF+yhAQgR6JC/P6hLHooPbHpwZTAkW9CqT3Y8cw+ohFtVdFJ6iUR3u0pJVZM9sJYvwBhshg0
	pnMU8Bvzl2VCZz1dtOjXYLNdt150Zc0G3dvucPsyqcG8vu1UYSTQne9jL9e/IHlMMLURDfrjnMN
	O9lDH0DvHeonneQ==
X-Google-Smtp-Source: AGHT+IFBrpGwTBy2z3nZpqTX2sJdVAbckmwTeBLux71uYOSkM7ZT6rxn+PrIyyrLOQKr6WfEdIsjVQ==
X-Received: by 2002:adf:e34a:0:b0:39e:f9e8:d07d with SMTP id ffacd0b85a97d-3a09404c668mr2113589f8f.20.1746123418443;
        Thu, 01 May 2025 11:16:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/thunk: Don't opencode TSX instructions in clear_bhb_tsx()
Date: Thu,  1 May 2025 19:16:55 +0100
Message-Id: <20250501181655.711704-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new toolchain baseline understands the RTM instructions.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/bhb-thunk.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/bhb-thunk.S b/xen/arch/x86/bhb-thunk.S
index 678c00c5d06f..f5ac41834bbd 100644
--- a/xen/arch/x86/bhb-thunk.S
+++ b/xen/arch/x86/bhb-thunk.S
@@ -19,8 +19,8 @@
  * disabled for e.g. TAA mitigation reasons.
  */
 FUNC(clear_bhb_tsx)
-        .byte 0xc7, 0xf8; .long 1f - 0f /* xbegin 1f */
-0:      .byte 0xc6, 0xf8, 0             /* xabort $0 */
+        xbegin  1f
+        xabort  $0
         int3
 1:
         ret
-- 
2.39.5


