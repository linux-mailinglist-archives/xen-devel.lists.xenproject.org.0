Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF4BB348B
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135464.1472602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ewx-0004R6-Kl; Thu, 02 Oct 2025 08:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135464.1472602; Thu, 02 Oct 2025 08:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ewx-0004HX-CR; Thu, 02 Oct 2025 08:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1135464;
 Thu, 02 Oct 2025 08:46:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Eu9-000821-KD
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:43:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d374b3-9f6b-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 10:43:13 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e3ea0445fso3917985e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:43:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a0204fsm73877065e9.14.2025.10.02.01.43.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:43:12 -0700 (PDT)
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
X-Inumbo-ID: d4d374b3-9f6b-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394592; x=1759999392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32KTyTEIv4S+xafyswExVd2MIXheWFL9qAvbf+ZRZFI=;
        b=bBFovvI8b3IV9C57DVQH3M5cPOe9P8xaaAYdQihpD2SVlsJVyw/mNeaUWQKcWvkKTc
         c7TaD1Mx/YFj9tFwvPNHMc99rBFEDOj6RCm9QVnbEdZXmFqT+yRDx8kL/3ng/f+3uByh
         SZhdf8KzXClR14Rp5arJHNh04BJ2/AXeTn19ItA9Zcy0/S+rfM4d4VMwe5ZSIcyxSYWh
         0+WBfLuKyIAAHNYWht9WJYx1NBtiRhffAi7OSnmqlooSUBlQKOBBe7bAP6ZI7grwvDTL
         Gj4kkpL1kHNvAckNoXJHiroztjKsWnNShgNWCVUwLsk5vPnY2m/GJOreVgFX9zFGdTlb
         k8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394592; x=1759999392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32KTyTEIv4S+xafyswExVd2MIXheWFL9qAvbf+ZRZFI=;
        b=XIm7hEOaj/tPX7UPVJi7B0N0XZAnkrTlOxD79iffhlyojkdJqXR9I37iOqsl3LRSJW
         M6e7d8NCGFYDPsmjebW5ifeCMXTNIghqpMOER6tLKIUjuHlQkxxr6EFNyqBYbQXuHElb
         K0+SiPF/od9qfQZgpteXmnFHokOAKb43WxjCrMNPNxMSQqufj8FHJiuxWQln6HRcFoUY
         Q5NxUPOBg/FyEJdLHDE0g7uCCdMKMvUGSOnoMmPjtTddD7Y7STvVVI9N5hk+1kTIRaAE
         QxTxq/mX4OOeU3ryehGmoNVLd1e8OzG3AARLaRE4dRcF4KGARJxTgP2kgsz1Thn/a3GK
         io3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXizpdK6VRUFoL3WyOgAFsKtu6o2RsNxpWiXG06Rr4WsksHsbOEbGLKEjopHPxcf2ZGbf2vwPTd5w4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG1j8SOwkHi5PL+IoN/8hvIZAkL765H8R2YL1K19GfPkbno+th
	by7tYv9SNDH7Ti6PWgHXV+m1pA5mewn552sfHfu7KVYpXrvLr+stWEhdNGymg8iOMFI=
X-Gm-Gg: ASbGncvHF7UIFxHrmQvW8IGtyD33uHts+rtTSK4CCqEu7dkZgnrlAoJXnQKK7ISMKIn
	xgo+DxKMt8/DhXcAqkLhDlfUT4JKrI7Tc5dnA7CS4cl8fNAbAuePpPK1TOotSaJ2WeyCqY/VmRz
	oJo0/LjTr101V9xsUzpT6vHrDAodTjfF/aiwdSircYfoItHfSwoAv+dhZoUjwsVnc+CRPkZT6Qo
	6ELQiI9HofmVJ/QXqf8JOZxwtx35OK+wbYbimX3zWboeEck6cDAHh4HZ8tBSb+U7vrN0DdUOor3
	17u+enJlCf2Wh9BxwiV76tk+es0g5cC0vfsAA3hbH8U0Nxt6oYW2D8yKCgwM2jdnFfzCdel5z/V
	ovRm0uXk/SPkAvvGoDdjJFFc8xb/7ig4nc6jhVSizr+V7b2IjF4I2zRS2BshIDgZOxV8l0ASrSt
	Z9FljIM7PrQ4yB3BiHCd1055HD0dvKIw==
X-Google-Smtp-Source: AGHT+IEZQOIEqlGUv6pO69td5pzAzxUa79bMkjYW9qkw21+3BvVHY7MhQ8EnUXVp5wD/RikWOGCbpQ==
X-Received: by 2002:a05:600c:8b37:b0:46e:4329:a4d1 with SMTP id 5b1f17b1804b1-46e61202280mr56814795e9.4.1759394592450;
        Thu, 02 Oct 2025 01:43:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 14/17] system/physmem: Avoid cpu_physical_memory_rw when is_write is constant
Date: Thu,  2 Oct 2025 10:41:59 +0200
Message-ID: <20251002084203.63899-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following the mechanical changes of commit adeefe01671 ("Avoid
cpu_physical_memory_rw() with a constant is_write argument"),
replace:

 - cpu_physical_memory_rw(, is_write=false) -> address_space_read()
 - cpu_physical_memory_rw(, is_write=true)  -> address_space_write()

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/coccinelle/exec_rw_const.cocci | 12 ------------
 system/physmem.c                       |  6 ++++--
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/scripts/coccinelle/exec_rw_const.cocci b/scripts/coccinelle/exec_rw_const.cocci
index 1a202969519..35ab79e6d74 100644
--- a/scripts/coccinelle/exec_rw_const.cocci
+++ b/scripts/coccinelle/exec_rw_const.cocci
@@ -62,18 +62,6 @@ symbol true, false;
 + address_space_write(E1, E2, E3, E4, E5)
 )
 
-// Avoid uses of cpu_physical_memory_rw() with a constant is_write argument.
-@@
-expression E1, E2, E3;
-@@
-(
-- cpu_physical_memory_rw(E1, E2, E3, false)
-+ cpu_physical_memory_read(E1, E2, E3)
-|
-- cpu_physical_memory_rw(E1, E2, E3, true)
-+ cpu_physical_memory_write(E1, E2, E3)
-)
-
 // Remove useless cast
 @@
 expression E1, E2, E3, E4, E5, E6;
diff --git a/system/physmem.c b/system/physmem.c
index d5d320c8070..23932b63d77 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3190,12 +3190,14 @@ void cpu_physical_memory_rw(hwaddr addr, void *buf,
 
 void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len)
 {
-    cpu_physical_memory_rw(addr, buf, len, false);
+    address_space_read(&address_space_memory, addr,
+                       MEMTXATTRS_UNSPECIFIED, buf, len);
 }
 
 void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len)
 {
-    cpu_physical_memory_rw(addr, (void *)buf, len, true);
+    address_space_write(&address_space_memory, addr,
+                        MEMTXATTRS_UNSPECIFIED, buf, len);
 }
 
 /* used for ROM loading : can write in RAM and ROM */
-- 
2.51.0


