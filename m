Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2895B3A3A7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099163.1453123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHM-0008G6-Kr; Thu, 28 Aug 2025 15:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099163.1453123; Thu, 28 Aug 2025 15:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHM-00088o-AK; Thu, 28 Aug 2025 15:11:08 +0000
Received: by outflank-mailman (input) for mailman id 1099163;
 Thu, 28 Aug 2025 15:11:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCP-00035A-CQ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:01 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81a0a4e7-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:05:59 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b4d8921f2so9342025e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:05:59 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:05:57 -0700 (PDT)
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
X-Inumbo-ID: 81a0a4e7-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393559; x=1756998359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHqFRCTtzO6UfroeczTN/RrC/BWZwTDXn4irJ5OSRMs=;
        b=Q7Mj1+rM6Ftd8gjMrg7iSIgSOnS9YbprmliTZNc+Vh+7Fu8S3AJ9aX4WWY/fuJF1zQ
         WO9HMtF9GQ6FoQ4PUIanwY9nYhcRlWo3JYcPdzZ0eQoTsow9Eo4Au94+L/kknEb7VUyg
         7mw5dxotvH2AWneVK4IDXrrJEAOQJri7cFKjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393559; x=1756998359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHqFRCTtzO6UfroeczTN/RrC/BWZwTDXn4irJ5OSRMs=;
        b=DN2lYHBmKiBnAfmQXAS9RBR+HtUebvSKp+KRWHxY3f+IylqjScmICK/UHBpisLi8dH
         2F1n2UH5F02YgEoYMm6YtFUzxnQMF2oqw4cWlFEKSL1nUExkUM/o2q1LyHkeWaRMViN6
         UAq1WNUzN+SBm4NXjZc8L/JiwYfp9Di3DnFQBa3h9a4w2qT/+9CL+EObem/OATRMtRtS
         conO6vef1g86OaMD0uSfsMAoR0dZcHZA0TjXo9YbOqzXKTapPHzhdkipDB/RoSAKuvO0
         eck2DLGGSWEn88uoih5/K/SfiZTA3iH36SMwNKRrXNYcmNr3dIowVufoFv6/qhGUI9sp
         lC/Q==
X-Gm-Message-State: AOJu0YxSftK1BJIPTAe3l8XPwdKEPT6DYaCQh/bjbB+xc3I2817rBucF
	8IJXjwcBkddpLTouNhUOOb/zC2FzyiV2BBVcn7bv90QHx/1is2DvNhu57cPm50EY30/PF4KpTuX
	rWh/n
X-Gm-Gg: ASbGncsGELQNw+UCrRBLvSdQf8JVDBfCHbaczcfuiNnOUuLRvf3/UzTjLSl9DJlsVbH
	MZJ93YO/3x/YCADfm1qnXiNF013pY5k6bp2jZH8nl/cXOYj1uxK99fCWQ2zJULu4ZXGGAU3ev/5
	5jghRu1j2H7QjTEmrjv/ufXJyO8t1522Ti3xwpnoktq+SXBiBLcBfvY1dH1UJewqKHxjKW7VPbd
	8gxPI4U7DjgcOzc8t4O8WhYK9bqQTOccou+Q3fOZRiguU7qWYreByaQZgXaXNSnySl7QiNjE2so
	Ti40bjde52HmfD30rILuIVG93NDwol2ia0YqVBcCuy69N8yyq6sCytZUaP/iITLooW4EB7MNxpg
	+cZK82CQEKwiKYcHHDczsQOdk12mSeKVvGHXSB0K5c+0ERlRd3Xipc25jGrUlsjwIHsfbPqS4HW
	Ccp1KLMOjHojNSIqnEgnhwJQ==
X-Google-Smtp-Source: AGHT+IHWDZ+fqC72FcKzNTwvcG4VHFpkMyXlSzAgwlhtw10HW152wao9+hYXyrlb1/LS4P6qJn8hYA==
X-Received: by 2002:a05:600c:4caa:b0:45b:7185:9f0 with SMTP id 5b1f17b1804b1-45b71850b69mr43457575e9.31.1756393558917;
        Thu, 28 Aug 2025 08:05:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 08/23] x86/traps: Alter switch_stack_and_jump() for FRED mode
Date: Thu, 28 Aug 2025 16:03:54 +0100
Message-Id: <20250828150409.901315-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
means that switch_stack_and_jump() needs to discard one extra word when FRED
is active.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Use X86_FEATURE_XEN_FRED
---
 xen/arch/x86/include/asm/current.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index c1eb27b1c4c2..35cc61fa88e7 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
     "rdsspd %[ssp];"                                            \
     "cmp $1, %[ssp];"                                           \
     "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
-    "mov $%c[skstk_base], %[val];"                              \
+    ALTERNATIVE("mov $%c[skstk_base], %[val];",                 \
+                "mov $%c[skstk_base] + 8, %[val];",             \
+                X86_FEATURE_XEN_FRED)                           \
     "and $%c[stack_mask], %[ssp];"                              \
     "sub %[ssp], %[val];"                                       \
     "shr $3, %[val];"                                           \
-- 
2.39.5


