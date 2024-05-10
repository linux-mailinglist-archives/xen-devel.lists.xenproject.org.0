Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895D8C2AA5
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 21:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720035.1122970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Vt7-0000Wd-O3; Fri, 10 May 2024 19:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720035.1122970; Fri, 10 May 2024 19:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Vt7-0000Ue-KF; Fri, 10 May 2024 19:26:37 +0000
Received: by outflank-mailman (input) for mailman id 720035;
 Fri, 10 May 2024 19:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5Vt6-0000UW-Au
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 19:26:36 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35efeb63-0f03-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 21:26:33 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59a64db066so632204866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 12:26:33 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733becfcccsm2126414a12.40.2024.05.10.12.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 12:26:32 -0700 (PDT)
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
X-Inumbo-ID: 35efeb63-0f03-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715369193; x=1715973993; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1zO85bs5eljBEee9OS77+rFx14ErRnjC85N7aXgk4I=;
        b=sJrgcjIa1trWeMP1i2RvNfRdWslT3uhJG3W57pmVRrTXvwbCo7j9tg1rZAhpDpg77Q
         Gf2fNSZHSsFmLfktPBGmMpfWs7lnYyqPD8tU+5FhZVU9Bgb5m4YdwPaQNCJNyegzjZhU
         dDOXJTVNVBiKuVx+6TbNwtUb/Qp5P9iHB2P3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715369193; x=1715973993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1zO85bs5eljBEee9OS77+rFx14ErRnjC85N7aXgk4I=;
        b=ozpiAXZsTGmXhwOBFDb9px8h0Okj2G18RhAmX2yNRp1/F70kvahWVZgDwMe/FVf8mD
         CrUXldDXuyk/7JkIZSVD2Y1enwuK1VlUixNdJ53NwpzIJQk+jDEn3ov6Y10KpxnqT3j0
         vuHgiWlS4hJXBrZxhMhsgr6iRrgkwl3/0fC6hRS5iF8Dp5zH8+dS8RAXSC6ahfEeHg7t
         ScJTRD6FKbjiEcvY2+oenZ8OAWWauuu62baF89f8nZjK2UFOGRIUTgT6pqv5S1GgB5gD
         X8KDqpeNxti0opDNNZJLHgQkNRLE26C27HXZHtSAn+xyxsJqfo+YvEuLBk3jPRzX+rdb
         /Rug==
X-Gm-Message-State: AOJu0Yzt+dlrBNASSE3SJZ8g3qaNihKcwQ5niJSUMbUQh10jgQ/7CKdS
	3eb5NnbnubOsI7fqWqsN5KxR9fKaIZMp3Cz6SvydLy9amg5nVgjyrFQOKNa/Fv3SkyhlDSSrx3a
	P
X-Google-Smtp-Source: AGHT+IE+6E5bagkzJq1ZWGqkrY22ZhIBGiY1ImI4WyxLzIQ7QwP/vbDCvTIW315SL3+aX6aLBUfbeA==
X-Received: by 2002:a50:ee86:0:b0:573:4f61:ca9c with SMTP id 4fb4d7f45d1cf-5734f61cafemr2001581a12.4.1715369192998;
        Fri, 10 May 2024 12:26:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] x86/io: Don't cast away constness in read{b..q}()
Date: Fri, 10 May 2024 20:26:31 +0100
Message-Id: <20240510192631.2296870-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Addresses various MISRA R11.8 violations.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
---
 xen/arch/x86/include/asm/io.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/io.h b/xen/arch/x86/include/asm/io.h
index 9b19d2d389ee..1cb4217cff39 100644
--- a/xen/arch/x86/include/asm/io.h
+++ b/xen/arch/x86/include/asm/io.h
@@ -4,10 +4,10 @@
 #include <xen/vmap.h>
 #include <xen/types.h>
 
-#define readb(x) (*(volatile uint8_t  *)(x))
-#define readw(x) (*(volatile uint16_t *)(x))
-#define readl(x) (*(volatile uint32_t *)(x))
-#define readq(x) (*(volatile uint64_t *)(x))
+#define readb(x) (*(const volatile uint8_t  *)(x))
+#define readw(x) (*(const volatile uint16_t *)(x))
+#define readl(x) (*(const volatile uint32_t *)(x))
+#define readq(x) (*(const volatile uint64_t *)(x))
 #define writeb(d,x) (*(volatile uint8_t  *)(x) = (d))
 #define writew(d,x) (*(volatile uint16_t *)(x) = (d))
 #define writel(d,x) (*(volatile uint32_t *)(x) = (d))

base-commit: b0082b908391b29b7c4dd5e6c389ebd6481926f8
-- 
2.30.2


