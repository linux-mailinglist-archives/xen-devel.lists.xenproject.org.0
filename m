Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A06A5D0A8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909106.1316163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts665-0002X6-Dn; Tue, 11 Mar 2025 20:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909106.1316163; Tue, 11 Mar 2025 20:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts665-0002U1-At; Tue, 11 Mar 2025 20:21:05 +0000
Received: by outflank-mailman (input) for mailman id 909106;
 Tue, 11 Mar 2025 20:21:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kG-0007Uu-KQ
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:32 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31f0f0a3-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:27 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-223a7065ff8so18598585ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:27 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:25 -0700 (PDT)
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
X-Inumbo-ID: 31f0f0a3-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723105; x=1742327905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q89mBu4b5JYOE58WB93/V2zR/jXmfpOvKMtRO3aXK0o=;
        b=dsdnGNSEYje4UEjJnscMMBnu65Bd60XmcOVP67m7D7ORX2nLRiliplijRaZ2VOSF8N
         foGeNBdFsIwbwpdVLtFPrNwPgfnFII72zWtp7d3QEvYve7np82C+URjq3XEZsUBybJG7
         iv3G6V/06ra4lJODBjrcH8J15nlSQduFhQoXU6SfKsfZm8uYNg+FfGOrWZpVmFlzF8nM
         q6bOUH8ufsEmw1CWmGiikwHKuz1R5KCDtyrK2iDZN1vMwCqCCaopM361tri93MogrBlg
         Zf1a5eZUXpq0+7pvwZ8kuQe91OdhrtCQVzhVmk+h0Fp1Ksh+BY9zT6FkPE61CZ68OenJ
         hS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723105; x=1742327905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q89mBu4b5JYOE58WB93/V2zR/jXmfpOvKMtRO3aXK0o=;
        b=nxw79/3YsLMmMCp5/1AWhPZ7247joxd2wv4ZZlHVUz5OWwG2UKLvARf1N3I9gI/JJ/
         xXfcaC7EudjH4WgXiPijd1GV9Rkfa3cX1MktQyzfGFMO0/lzjyXZpf9m5/h8KW8B9T/T
         5hrxX6w4pptPc8nXVPs76qen+89Y2obNSyvKPgfKI0kPZGMmf9r5V+im5Lfb0AhF0LjK
         Ywhkkwgi62ATdr0bbpPcgM+keno4GMNjkUcT2LZODo8qD6QEBbtHbieEQ52fQF8ahV+V
         dm3BqmQmwLNvSPucErRxbkX6z5h8zlcAasCJ+xn1lqcUlxsIzx6GFvK6eFZ14ctrX4U5
         PWuA==
X-Forwarded-Encrypted: i=1; AJvYcCXve8DV3H/JO8oYp/kbcTor8J5UWQmvEzadWICx24PPg46f8X3yyjMiXeVEUtryqX3xG8ADxgsu2xA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxawJpc9JVY/zs99epblXo4Evhl8BjOQbOoWdctHS+9u/z4Pb7G
	BWH543MQ96mwKUuoZskn5E9+erwfPmYl9BDuQ09XdLxIx4X0tg7YKhb5OnfNfkE=
X-Gm-Gg: ASbGncush5SozhbASmrH4bOxL3tuLbI+9BVNRrgDaXZuhMhh5yRqeD1UWUG1be8wUVd
	ZPK35mqgr1vkr11f96qcZ87ZWO07ErIUqGONgKdiatfH7L/gUD9w2t4Vb3x9VG43Fqaxp+UX5i+
	KiQCICaxkAXsjOFoaBsXtYzx+hU1s++iUJp7H7uAM2G/+WqrgxJMD8g8U1E2nPNiDHXCFzN/+eP
	IR4U78cq1e2zGVDc45gkNOoD93gcCJ6nnLTgQdMn1ZrWb7BmXXBFB4jAMttsjWedbgtxKJa/2W2
	jrdTsNBR3Zjd0PzSwKiypc+WdfZb+ACiv1a7s6FammsG
X-Google-Smtp-Source: AGHT+IGPxcxao/HSElseyaTLTAghrvJ2csxsBfbQ4Udwa0eEZtZIt5xFFqgWZBrC6WgJmJp7FceqHA==
X-Received: by 2002:a05:6a00:4b4a:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-736aa9bc0e9mr26082176b3a.2.1741723105679;
        Tue, 11 Mar 2025 12:58:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 13/17] system/physmem: compilation unit is now common to all targets
Date: Tue, 11 Mar 2025 12:57:59 -0700
Message-Id: <20250311195803.4115788-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


