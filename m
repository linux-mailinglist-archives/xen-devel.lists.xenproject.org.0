Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B3A1ADAA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876510.1286946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6z2-0001y6-Ob; Thu, 23 Jan 2025 23:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876510.1286946; Thu, 23 Jan 2025 23:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6z2-0001si-Jh; Thu, 23 Jan 2025 23:51:36 +0000
Received: by outflank-mailman (input) for mailman id 876510;
 Thu, 23 Jan 2025 23:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6tM-0007hN-Cb
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:44 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 287cc262-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:45:42 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso1183751f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bad87sm971133f8f.74.2025.01.23.15.45.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:40 -0800 (PST)
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
X-Inumbo-ID: 287cc262-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675942; x=1738280742; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOf7cXhzVFnELwvvE/9oD0dVEdIwULgdsVx2rdQEX18=;
        b=UjpOKTqFMt9XT+aoip/pjX329ZtQSOIaPeKr0YHIr7ui8vdtiEoKHcxM5Rsz+plUzH
         /vPRYrvsEMUZrA34aJSUmWyYOXyNz28Ji7F5BEM2ReIipdND5Fy5ABgeLFX4WCTtmO4+
         zFQCUmCgeIf6pSxkEBmav88beevHst7D1k8xSZ75loTV1xXozuZn/5DiWcgj7gFdAwHk
         pA08ebhwX7VoHpQBHMvW5sIY84ygXcI17VUasocIq4bo4nFv9/fow0owd25gcibnLmfY
         n6Hx5K06B3xfC+79Yh4vstczdgBDksBNiNjpFSSIAOaxQG8aPzNEyjBHEybAkuCZ1FZb
         fYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675942; x=1738280742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOf7cXhzVFnELwvvE/9oD0dVEdIwULgdsVx2rdQEX18=;
        b=Qh7NuHSVOl2jGe4kY9CuB/K0/j3X3Ns+nIzGUGcgjBUYeNHf+hd5yO+M0hB8UdJBzt
         Rsa1ohNViqc9W4tvGRDnE7zSBYkXHaZ/KvNCktNrM5rRr8MFuwRMNLCZxOduIKBNrmgR
         ikYOWcp6VxnFXv9tZ0j/qEr6LvjRNIDowhsn43ocoA6ZIfiXuPfw8XPxms7WDHwq3sMr
         uYlgUeiiejJs7uyutUrhu6GCrCZWDTMDr/5U4mP8PszxZRQlqJhixN+yuyr0/s11vyy0
         ZPk5D1dZSkvWAqu6uXETqU17U+CbVT/1gm/tjSFecCjwmK7HRfyv3/SgSxPIVhHteeYq
         ODxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUxWF5lp3vb/U4DOZeB48Rhu/gs2hqFFoSUkocVOZ4wGdCsKHKA3rOo6XKLOusYNT9S3yoTUMKwBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgwBK8a12ROh4NxXH27r/JJLPRSpjJ2fOdQs6lW8k1fuJLit/G
	UBwukAMmQMVK2SaQd89aXqsXAi0jzallEESA9cOxus1stIY8H0zhPplxws8Dz3c=
X-Gm-Gg: ASbGncuUYByADoZLlxo/aexeUICBe5Rt1OPskO4yQKeuXGIwUjr2iWsfeK9D1KpxKxY
	GuDj8AWRiU/5m37C/maroJ4NtvPdsVyrNGe64fsB5fPK9vTHZa/EwnBjZGXlPghZ8E7mOGunnqY
	1O541/tWLxlXMCfTGCGcaCZZw7Nf5ZhYWuTousqYmbgENAvE7nPZzS9pgKviDQjdeIb7D+WFg+o
	FWU15QtgB0ngZGfxsewaex4poSdTa6S17OHzaVgcRp9pqf9xC4r9tY7+bo5R/cOG4laYoTZ9AW9
	z7cSwCxgex2wcM6BlMVNN03ebsjajRl6L6CHg5+p0DYyvW6dqdcq8CI=
X-Google-Smtp-Source: AGHT+IFFvdlRkBEFpuvRapz+0/bX2s0BjBYZ6M4itb1IiIpdMWapxxpC9ppUNuB95mK5m+Q7pE4GZw==
X-Received: by 2002:a5d:47c9:0:b0:385:fb56:5596 with SMTP id ffacd0b85a97d-38bf5663956mr20431872f8f.19.1737675942270;
        Thu, 23 Jan 2025 15:45:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/20] cpus: Fix style in cpu-target.c
Date: Fri, 24 Jan 2025 00:44:09 +0100
Message-ID: <20250123234415.59850-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix style on code we are going to modify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 6d8b7825746..a2999e7c3c0 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -47,12 +47,15 @@ static int cpu_common_post_load(void *opaque, int version_id)
 {
     CPUState *cpu = opaque;
 
-    /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
-       version_id is increased. */
+    /*
+     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
+     * version_id is increased.
+     */
     cpu->interrupt_request &= ~0x01;
     tlb_flush(cpu);
 
-    /* loadvm has just updated the content of RAM, bypassing the
+    /*
+     * loadvm has just updated the content of RAM, bypassing the
      * usual mechanisms that ensure we flush TBs for writes to
      * memory we've translated code from. So we must flush all TBs,
      * which will now be stale.
-- 
2.47.1


