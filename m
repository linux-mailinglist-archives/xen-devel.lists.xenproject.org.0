Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C0A61863
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:44:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915142.1320731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt959-000583-0z; Fri, 14 Mar 2025 17:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915142.1320731; Fri, 14 Mar 2025 17:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt958-00054g-T5; Fri, 14 Mar 2025 17:44:26 +0000
Received: by outflank-mailman (input) for mailman id 915142;
 Fri, 14 Mar 2025 17:44:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8tC-0000xy-4O
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:32:06 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c86e576-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:32:01 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-225a28a511eso43038985ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:32:01 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:59 -0700 (PDT)
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
X-Inumbo-ID: 3c86e576-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973520; x=1742578320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
        b=IWAagrMlOK8AmQpFhjvRXFSmBR8zSB/lyokNU6vYmg1G/4pGaIMDV6mhAyoYWHTDGx
         Vnr2TC17ao0KgQ6Efw7sxwVLuwmoaC3n5TpMCpAEdY0dtcclTHzLDgzb9Rb924xyiBrh
         cQAliMa1ZXtXF4bmbhhz3Ug0CUodzSs6JVjfd+JwUJoi8dkG/2MgGA6lSBW3WUECunl8
         zDE6AM/9SoeH0vBRXl9WU0jGqZ0FSrRV+HzHN/KnQWrTREzCQKJuAoUbwUav22jyPbwt
         ujdIrTCLwK8Bxao+xBUFzmq/XZLDdBG8GX8mCYOd0VqtCFn2f9W0oYhN3mHtoZVafHHe
         ywkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973520; x=1742578320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOa15ppvF5kxsldjPkSIJYe5T0c824L9GaUvR3via0Q=;
        b=FPCuJ5zP7T9BmqBgkR6MQ6WOZqfhteZTn5lM18Z9ydo06hRk83eoU/fyhA1+YY9Xol
         Pkh2yI6QWUeLiQQUzXqpCcFTgUJsEnS+Ih+DRx2l0bgOLqHxInZrotwJOlbwcVR3k54A
         jLGe7DPQnpkStHrTauDOQOw6Et53h8K99kvx4HXRWDO3WouijylQFdO0Pr4x4v/Lbk6H
         SKxMu2BI3Huposc2z/h6KtngV7RSOZ5bLlRciNHHLwNEdzicln7f+YFfhrVp/fh9rth+
         HZx77Kxl5wtBEYM82Bh7w0TO/DSR0x0UBduqNZxT+AfFQ8wxnff/FBZSi49tk2nSxOt9
         4JKA==
X-Forwarded-Encrypted: i=1; AJvYcCUrOsKqkR3Ji4BbYarCetAwwCjg2LLDx/dVDlSkPhAPUPvAnKYPbpesJL4xMtxnIu/5l8Oj2OVm3Y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK2pFV8ZMk0FXrCLRUsCqzwyxTJvtOiE6HultAH5VKg8Tpv52Y
	Nt6M0vW/JtWzL75/0PAS+eAV6GNmCdSBXVFSgk8TY7NAiAlVAYfJWmA+UXW1ol0=
X-Gm-Gg: ASbGncu6Ak5Qlqzr5N4Khhnaba+BXOHD+aGaXTSpiGoKtTW0IdBRIxgEYWk9TOIVsIG
	ZU4Q1Qkjb2lq7QD18sgoxQiGR75VR2j4p74vojVT92UfcxV6EW+cQ4XZW8tmIYje5f3v2pC5qa6
	xZ8JepjZgyh3QxX2w9Sww5mLejtw3khk7EF4LIqzRxdX/XnAj/Yv7BnHN36Bt/SsXGtC9f4j73O
	41+fsKkPequJveba4viYvmbPssrqbhZitCMNagjb/FjfG/T6wFg37+LWxkuF4zplr3CR2/gln6N
	/yflgWVRHe7ayoe/ykvkW1CycJsiAfwrGNyrLFm1UkZMt6/vYyLzKUQ=
X-Google-Smtp-Source: AGHT+IFlQhNJcOD04DdXfXRzIQFpLw7YnyShzSPUUYA1tOEz0vWyEbVCk22Q9xZ8telIqsQxDa+sSQ==
X-Received: by 2002:a05:6a21:4a8c:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-1f5c1326a41mr6196288637.36.1741973520104;
        Fri, 14 Mar 2025 10:32:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 13/17] system/physmem: compilation unit is now common to all targets
Date: Fri, 14 Mar 2025 10:31:35 -0700
Message-Id: <20250314173139.2122904-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/meson.build b/system/meson.build
index eec07a94513..bd82ef132e7 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -3,7 +3,6 @@ specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'ioport.c',
   'globals-target.c',
   'memory.c',
-  'physmem.c',
 )])
 
 system_ss.add(files(
@@ -16,6 +15,7 @@ system_ss.add(files(
   'dma-helpers.c',
   'globals.c',
   'memory_mapping.c',
+  'physmem.c',
   'qdev-monitor.c',
   'qtest.c',
   'rtc.c',
-- 
2.39.5


