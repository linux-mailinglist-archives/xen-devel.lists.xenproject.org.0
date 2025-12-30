Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A26CE9D18
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194176.1512612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7n-0004P5-US; Tue, 30 Dec 2025 13:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194176.1512612; Tue, 30 Dec 2025 13:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7n-0004Kh-OO; Tue, 30 Dec 2025 13:50:59 +0000
Received: by outflank-mailman (input) for mailman id 1194176;
 Tue, 30 Dec 2025 13:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaa7m-0003x2-Lg
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:50:58 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e37f5f-e586-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 14:50:56 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47d3ffa5f33so18279435e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:50:56 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm609436115e9.12.2025.12.30.05.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:50:55 -0800 (PST)
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
X-Inumbo-ID: 90e37f5f-e586-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102656; x=1767707456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtIxME32IcIk9TL5Lyl1j6oY1OupajCDrpTY+bON6y0=;
        b=rxYGKRtY5KyM8OBR2oFd7WllbmBKLIc99mmihfHiRLZjTFni0ajRKKQGuKjTBw/fmM
         BDaMMP2vG4azqyIJKAfP1nf7ic4jsycJci18xPdn6O2/CPHgKh4gzHAgb7UzJC+NZYf4
         vG13Gd0SqKw+asx9ISUV3dDN9rIZpTpJ6B2oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102656; x=1767707456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QtIxME32IcIk9TL5Lyl1j6oY1OupajCDrpTY+bON6y0=;
        b=jAw6RNYsZGWKJWLIrOBL6ZmeBMWsfwnkAcLhBvnFOePvHr1vvcflTLzTZJ8+qhRn2Q
         fPIjYFFhM8QAefNUB3++jKllh0lYUY010sgpA8fBaGVeRrATqZcQZcdwDeqCtrZ8No+E
         Ssxe73JDX9QfHcq4gRuTYFI0wLpPwPInA59Ng8l1FNlfDu9dHbNkZ5nsSxmZR+XBNoIj
         StRIlx6D2iXOJPf7YQI/9hJJQCaQaTHvsguNaCh9nVzjDZVseviRbO9m50cpbyKuu4UZ
         v6m9lTu0dw88GsijRmB7EwJdenVOD7aAYpYWlYK9JO+l06v0a3f4AM7eeXQwC0X9a9Es
         ajJg==
X-Gm-Message-State: AOJu0YxPfR7fB6yktP/qoUzOB1XUa5nezWvsgQlw+861tSrmQWshTwrl
	lWch084WzwohnYvrujcZPVuF8ZAudc9IaZE8d06sozQPmTmVR6g++BEw4IhPqbLw11mCCVIRHyo
	UK1d8
X-Gm-Gg: AY/fxX6VeQ2OP3gNbMoRYl8MNao7xnh2hJLm+hLAId0QnsM90tetukqdzi+CLT91btd
	ItNYVgg7VR1vrgdbXeIqfz5NzckG7UU7KfuMWTLprE3LHjyzjQoPtlhq0ZxYBLhLMw3h1kwjp3k
	fs8W5OJ1QSjeVnsyJDXnPYb2uHWlTPK1S9lFIRldCtA0KtO1i8PgXGmbzPmMn3Hacmx8qxt2QXo
	aaPrtYuEbUgx5GJJqjRuw5C62609VARgcHfQKPJMszqNmk3Wkd3tcNIS8idyt/wNfwEjvXMDKqF
	9tQo2Y41pC/LnLJHXTaLSBMnhpTjG8AzQ76K/0EFNWf4a2WR7xZ3PEfG681kX1coibMuflaGe+z
	C3FzMPx8nZxnUNQWbpstNy7IqAZhigwz5a/VBGO0npngZPuSicJgpdm4OzsEcIi4uo6mw3CaxhU
	N6j1cUxhrKQ1Gp7X5ijqi9Y57Hl3ALVjTfMCbrblrdLGYn47aqjNvo6tGjraBFRg==
X-Google-Smtp-Source: AGHT+IGz0VmipjnUFVNKm5p4tVaOUfiltMaYqpjQFXB0M9G7EvjahUMK1UkSoaBtRX248rO2/cvc+A==
X-Received: by 2002:a05:600c:4e8f:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-47d1957da79mr353493175e9.18.1767102655949;
        Tue, 30 Dec 2025 05:50:55 -0800 (PST)
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
Subject: [PATCH 1/5] xen: Fix endian handling in muldiv64.c
Date: Tue, 30 Dec 2025 13:50:46 +0000
Message-Id: <20251230135050.188191-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135050.188191-1-andrew.cooper3@citrix.com>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

WORDS_BIGENDIAN is a QEMU-ism.  In the very dim and distant past, we had a
fork of QEMU living in xen.git which wired WORDS_BIGENDIAN in the userspace
part of the build, but nothing ever wired it up in the hypervisor build.

Fixes: 86d5da49a6f7 ("[HVM] Support multiple HVM time device models coming soon.")
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

I'm not sure that this wants backporting, seeing as we have no big-endian
architectures at all.  Otherwse, 4.20 and older can't rely on the existence of
__LITTLE_ENDIAN on older toolchains.
---
 xen/lib/muldiv64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/lib/muldiv64.c b/xen/lib/muldiv64.c
index 79411f5d59ea..f281578c09a4 100644
--- a/xen/lib/muldiv64.c
+++ b/xen/lib/muldiv64.c
@@ -13,10 +13,12 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
     union {
         uint64_t ll;
         struct {
-#ifdef WORDS_BIGENDIAN
+#if defined(__BIG_ENDIAN)
             uint32_t high, low;
-#else
+#elif defined(__LITTLE_ENDIAN)
             uint32_t low, high;
+#else
+# error Unknown Endianness
 #endif
         } l;
     } u, res;
-- 
2.39.5


