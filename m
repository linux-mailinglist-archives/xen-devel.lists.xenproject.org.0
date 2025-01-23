Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F814A1AD68
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:45:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876402.1286787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sQ-000110-5I; Thu, 23 Jan 2025 23:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876402.1286787; Thu, 23 Jan 2025 23:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sQ-0000yz-0a; Thu, 23 Jan 2025 23:44:46 +0000
Received: by outflank-mailman (input) for mailman id 876402;
 Thu, 23 Jan 2025 23:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sP-0007w9-3J
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:44:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c54f2a-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:44:44 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so936156f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:44:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4d29cesm6991745e9.35.2025.01.23.15.44.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:43 -0800 (PST)
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
X-Inumbo-ID: 05c54f2a-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675884; x=1738280684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89WHzW+ji4rB+60gFYzeRD9ADgUNDHjcXvYSPMINgc0=;
        b=LOKpZaohNaPsXqTNFqQma82C7DJalWUqbkHFlFZ8ABdwhIlFNbJK3U7JI7Su+jHxfS
         zjtwuzU+lJ06EXc40EKFIQn3p8J0WCyMsqwcnuI6HqBedFZdLQ5p4e3PwxXhohQ9/SKB
         y0Kb7aZIdxcqNQIF7sB0RrMm96URup/Z3UBabnpUEnrNBbKontJHdX2DzfKKu4mIR/pb
         le1+C6hUtwdk6Gts9okLl9FzNZUHfFD6O8We9X8327gFMRsNJV9jUQYkOIjceD/hqVBE
         /pa4A4MNQ+qqKZfNsTCnv3nFt6ZzFpC/3y4lHfZUgcQ4oUo8OtK4LusAGNg/mUQcLBi0
         AUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675884; x=1738280684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89WHzW+ji4rB+60gFYzeRD9ADgUNDHjcXvYSPMINgc0=;
        b=ld6H4Uba5NrXjyQHH9UcTy8RV/Bappf4KvC3cHdzC+Ar9v44/hdLWXwLXTgDUj0V5j
         EJ57En1F8/YY8+JyRckDp49DfS7gcRL3lVQjeVuqMQ/ck8GgAQ7UzCmUkjSJZbfItDs0
         g6UTpkp2wXCrSMx4b1jLP0w37dW5SmFFmP7RM+kelJrrWzM/H5F18BKirmZFjyXttXWN
         cDWh5wfWwDFktbtFxqAFF8cIhWDmdLCSxij/6IZFXsrz/sMcgtkFYU9znfLWrZZQOYoU
         vwjRth1YmsNwqPhgGyjcT392JUPpZPZEwtLEuv/t+hpIsiKu+jYQh31qqSBlzqdDmE3j
         aObg==
X-Forwarded-Encrypted: i=1; AJvYcCXHIKfOmdBOaVK3kJOiQxlrmt2uo/c2vr+2GMlSifSmy54/EH3XorJ50blZpe+Y6jDtbs0h0EEmC2w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgWEYLR7Gh1qnf7wpTOSEC11GbV74pXMAKHTWC8oW16ilO+j1I
	gvKoMUCFdMeUU2/pqyqGEq4wYXzQ5hx002e1LH9MdWWHFa8qHSL35LBlevFkyPU=
X-Gm-Gg: ASbGnctosNAIDijgdrxe3qETQfEyBS78tcdA3c7Fz92+1KoFitFMWUuR3wH7Hnb4bEc
	Xh9YN1t7Lqu5QPEFhigWTfBvflUDKk1LgLtX9Z5GvNDjoefNsOXk/Z2PvIAGC7QE1y/MqGpGbBC
	dXBeMjfuER72qwudn48zXsay0pUr5i2KGWvkMCA8PX1E7GzRN1cD99KiLL0uqvF2c7qqMri3+Vn
	u2m2G/ehthPrix+8Q0uBBRpn8FliNZRrZ1E/PnUXmSjp/Nj9+rIcTZF13pv4s4d+vue9ZE/IYpQ
	vrCpGlDtfneyY5Vtam6GdF2V4Bgbezv4xS4AgCZ7gbsg2cRyqvkMSFE=
X-Google-Smtp-Source: AGHT+IHfcp2D5aSm8Sn0VT4IidLdBYhD/KSzWcZHka724j1qpNfMP/dVIsxPCprx8nPoBb5TgAtEpw==
X-Received: by 2002:a05:6000:1fa9:b0:38b:f4dc:44ad with SMTP id ffacd0b85a97d-38c2b65ebf8mr997845f8f.5.1737675884076;
        Thu, 23 Jan 2025 15:44:44 -0800 (PST)
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
Subject: [PATCH 05/20] cpus: Keep default fields initialization in cpu_common_initfn()
Date: Fri, 24 Jan 2025 00:43:59 +0100
Message-ID: <20250123234415.59850-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_common_initfn() is our target agnostic initializer,
while cpu_exec_initfn() is the target specific one.

The %as and %num_ases fields are not target specific,
so initialize them in the common helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c         | 3 ---
 hw/core/cpu-common.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 89874496a41..75501a909df 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -234,9 +234,6 @@ void cpu_class_init_props(DeviceClass *dc)
 
 void cpu_exec_initfn(CPUState *cpu)
 {
-    cpu->as = NULL;
-    cpu->num_ases = 0;
-
 #ifndef CONFIG_USER_ONLY
     cpu->memory = get_system_memory();
     object_ref(OBJECT(cpu->memory));
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ff605059c15..71425cb7422 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -244,6 +244,8 @@ static void cpu_common_initfn(Object *obj)
     gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
+    cpu->as = NULL;
+    cpu->num_ases = 0;
     /* user-mode doesn't have configurable SMP topology */
     /* the default value is changed by qemu_init_vcpu() for system-mode */
     cpu->nr_threads = 1;
-- 
2.47.1


