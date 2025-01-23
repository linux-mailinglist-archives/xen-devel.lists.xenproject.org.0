Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBFA1ADA5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876492.1286893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yq-0008G3-Ng; Thu, 23 Jan 2025 23:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876492.1286893; Thu, 23 Jan 2025 23:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yq-00088C-FR; Thu, 23 Jan 2025 23:51:24 +0000
Received: by outflank-mailman (input) for mailman id 876492;
 Thu, 23 Jan 2025 23:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6t4-0007w9-0j
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1deee438-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:45:25 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso10798485e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:25 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4fa416sm6932195e9.6.2025.01.23.15.45.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:24 -0800 (PST)
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
X-Inumbo-ID: 1deee438-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675924; x=1738280724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdlpzTogAHHu3L1/GbHJ1cNEJlm92RpTH1AYDuj/6CU=;
        b=E/CYzjAolE2ZZSP2yfZBtY9ejZvn8LQqaLfaf5oZVlAG2O0Oiipu6hyie6XBz6g4nH
         pN3G5d4XeKS/q0jBWAJetK0jz9hy2vK/ATofWd3TztYIksLfuBO0uywEc3VNELzETNbt
         +YRKfRGZo4QIE5vlS4zPEezHn/Ku4/G+O3C1nLlx2KG/Bn9TbR/g3LsA0ol7+vsnofYT
         PeEaxvgul99KKn2PMIcfjPnDMLju6vbNfxOF3Zn09qHmArvGvbw6PHHwDLQjw72EFBAZ
         jIytylXYStR0gSpYBgAYyKlYBKEUMvbtpoCDqFY8RaI7fP2+K4gc+iIk/rETUVdEZlcR
         +qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675924; x=1738280724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdlpzTogAHHu3L1/GbHJ1cNEJlm92RpTH1AYDuj/6CU=;
        b=K/etY77RdTZ9TspTkG4BHZN/vDT0D7XlKvRoGZryuvWcZvQkIJXbdj/4+kJtYeGEZR
         Q4QK6KBhmsuZqatbK2eJjgUE2e2Wk+axvMcXc0Xy7dTFPZtlDZipeu/B/a6NM9rXv7SO
         DR5yT07rcE1TbVJo+wWd2KF7T4t8tgIlHQQsVcG4Jj7dbTSNekb8EN+/8bTl64oWmgDE
         kgHs2Mvjj44dA1yfq+QnBr8umk/6vG4YiTvWelpjrj8GBm0uodiQVV30Y/Wh1vIADhzY
         QWKmG7wdt9bFa4FXamfSwmtuTff9mLrjiJL5xHCXambN/7I2xyPy5vrgTbBTAvXFmndW
         RiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiiIalxGbOQYHuQwKKLqPRCH6IqAWWhOMu+WXKymMvoZBfLLQONFP7Knl+tiU0DEPbZI80dh4LX3I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMab9eMIaGviwKY1PX6rngN9wdMh2TvtjPO3YI6YE9ezPoKLmp
	UCU9v3Q3aBm7WsGCIANqZ87RFfS4zzS3eDi1siaeAfDGKq6J8uDhZeta2tXm1UE=
X-Gm-Gg: ASbGnctxDv58Wi0Wdu+C+kFC7Hi7H6rvQST5YtUaImBk/aKFpDPhTKYsr/TzIPuMoR5
	Iut3h2wllwK/klfiKbe2DTYE3X5oINynuik0E/oYmtLpgNEoeKc7qUtZsp2bKHvMaZz/1pZJR7C
	XELmQTPdDbp9LSn9Ke/QVAgHiAZhPmUWceuLl1MIEGznm0HIHxMg17lQ/cYZcwEU7LaUYkkxWPe
	5SnQDxXbwFKWg2lQde97rxf1rJ5WBwwCBjmheUGfMMB0NWYZXlnAeHCxZj4AyAZ7tuLO9vYxlC4
	WGz+stZbXdX5oVMIq8T8lJm2VdltJMzsDVeQshmNkFYIndNRG5ScR8o=
X-Google-Smtp-Source: AGHT+IEwKoXpxcAtZxGgBrKoty0PAI7DEzj3vUSJHkmHg5BnQeEwYri/vD7fXqCVh16ykXZTkiP5lQ==
X-Received: by 2002:a05:600c:1987:b0:436:faf1:9da with SMTP id 5b1f17b1804b1-438913c68ebmr255744445e9.2.1737675924510;
        Thu, 23 Jan 2025 15:45:24 -0800 (PST)
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
Subject: [PATCH 12/20] accel/accel-cpu-target.h: Include missing 'cpu.h' header
Date: Fri, 24 Jan 2025 00:44:06 +0100
Message-ID: <20250123234415.59850-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CPU_RESOLVING_TYPE is declared per target in "cpu.h". Include
it (along with "qom/object.h") to avoid when moving code around:

  include/accel/accel-cpu-target.h:26:50: error: expected ')'
     26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
        |                                                  ^
  include/accel/accel-cpu-target.h:23:33: note: expanded from macro 'TYPE_ACCEL_CPU'
     23 | #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
        |                                 ^
  include/accel/accel-cpu-target.h:26:1: note: to match this '('
     26 | DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
        | ^
  include/qom/object.h:196:14: note: expanded from macro 'DECLARE_CLASS_CHECKERS'
    196 |     { return OBJECT_GET_CLASS(ClassType, obj, TYPENAME); } \
        |              ^
  include/qom/object.h:558:5: note: expanded from macro 'OBJECT_GET_CLASS'
    558 |     OBJECT_CLASS_CHECK(class, object_get_class(OBJECT(obj)), name)
        |     ^
  include/qom/object.h:544:74: note: expanded from macro 'OBJECT_CLASS_CHECK'
    544 |     ((class_type *)object_class_dynamic_cast_assert(OBJECT_CLASS(class), (name), \
        |                                                                          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu-target.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/accel/accel-cpu-target.h b/include/accel/accel-cpu-target.h
index 0a8e518600d..37dde7fae3e 100644
--- a/include/accel/accel-cpu-target.h
+++ b/include/accel/accel-cpu-target.h
@@ -20,6 +20,9 @@
  * subclasses in target/, or the accel implementation itself in accel/
  */
 
+#include "qom/object.h"
+#include "cpu.h"
+
 #define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
 #define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
 typedef struct AccelCPUClass AccelCPUClass;
-- 
2.47.1


