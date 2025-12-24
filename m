Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715BCDCEC3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193083.1512108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSKp-000371-2k; Wed, 24 Dec 2025 17:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193083.1512108; Wed, 24 Dec 2025 17:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSKo-00036b-Uw; Wed, 24 Dec 2025 17:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1193083;
 Wed, 24 Dec 2025 17:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSHB-0003b7-1D
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:53 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 852d0b02-e0ea-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 18:03:51 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64b61f82b5fso8046046a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:51 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:45 -0800 (PST)
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
X-Inumbo-ID: 852d0b02-e0ea-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595830; x=1767200630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwTK78uer5FqwaU5f51ewDsBN5tAldzPPMkL2zu2Q7s=;
        b=hXvsCXcI4svtdYfylJXCsw4dx8MxbJd7aWco5vwlCob+Lwtu2tK8/C1AyGIn704hzB
         F9HtV6k91wVpOEjtdTmdPXtfGB5z990AMFbQTrCsZ4twhxOnoqbZ7oSuJuL9GAQNcJR7
         S6okmXKSUvOo4wxERaP1hxGk7dgVi9P4ZM7t5s6LVNVgfeyK9yX/+f4yy8+qaaSrsS3H
         uCqszC5mCh6QuwWtAzgRGxWxK2IX2LwcbaD0aL95KAhCV5tKnjg4jOn/SReJjdIX+j6h
         qv+dXiyNtCJIhRV3eBP2xGjP5SrI+5gIEH0pJ5QU4WT0dULK7wDLBW0+8OXDCbI46mt1
         7Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595830; x=1767200630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwTK78uer5FqwaU5f51ewDsBN5tAldzPPMkL2zu2Q7s=;
        b=Tu6rWkoxnMrLwF6chMe65tpwIEuAO46YMpfj5XyfGBEyM8/5uhNAIjhlnvczUtejSm
         TqA1HqdxWb15qwQoOQe4yeVLkTGXb/oETGZNY94ukhxZiuQTX6f/nYUkn/tj3CPLQXjS
         0927dTWd3gOixz8xGJkrZkhMtLSDue7GttrJ2ILARXueBTzCqUWJ4FP6CX7mx+dlwniX
         HkKYHpqCj5vCNkWOTzv0bcQK4LpiiTvNqEd1gefJWNgkAZodlEQeTzesdD4l+4z9FpuI
         DQLNdiX8UfdDT8YmlhkZQrzZ42aDdnn6QMhI2HJt/1xQifrKb3Jo36IwLNRT8KkFBQgO
         5lMg==
X-Gm-Message-State: AOJu0YyOOq+OqxuEtbvkr+NNFWXYoJ+R8gHFcRxZ08jF4tzwSzkazrHF
	W6JYK2jQ0jyq1CvYeKaFAfXG12sgfwoZsTkpBP61FlLS59q2Jwugczf4pehksA==
X-Gm-Gg: AY/fxX48F5hCg1CoVoFwIAUCNhNmpZIMGwzMuiB/2yQFJvL0XJ6YRCfvdMgRJVTT2gi
	arLaLfDhmUjkrtRfnzTB19uirqX2xB56Vm3QN/gkC4MSsoNxtT2YM+m7SlxyW+x4XD9ID5LXkw/
	TOGQFLAU6OHhbR5ww5xdFjgFqYBTW2GA29sR0ggrBwYmqO6uz+5rfRTgC/GvBi+NeV7rIDM3CU6
	ahrW67gSRD7aJIHIRLJaou9WpOBggHNCM2zOwLmJykw3Yf5nPmvspAyAEgvh8ORepRJm1/mu83B
	TJgjx5DgYHYKBUSPiWCJf5k8uRvKC7MadhjvWj8E9vvHOoBarouH0CMK+1Qppw0+gbeX3jAO2Jd
	o5e5YyOOjdwuO36ZW+XP3zWR0Mfd8pGRf7nb/VyRnSkFntR6FPowdJl6AupIVSMH+WLtUTdGmzb
	K98jFN+7N+QDbEvTxcwiDfQ5ereDWlIOeG6FJVqTrpdazUwIQ1+izA7N8p7TD5UzYAHQ==
X-Google-Smtp-Source: AGHT+IGl54jmOAYUGkIE1+LHb8Ib0Ru38nQPIsZR8jHbOJogShCm59AuodegHYJUA176Df1F0Piu+A==
X-Received: by 2002:a17:907:9801:b0:b73:6838:802c with SMTP id a640c23a62f3a-b80371d8c9bmr1801488066b.42.1766595825667;
        Wed, 24 Dec 2025 09:03:45 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 10/15] xen/riscv: implement SBI legacy SET_TIMER support for guests
Date: Wed, 24 Dec 2025 18:03:23 +0100
Message-ID: <dfead0f29d2b93350acc5a20b9f75d534dde5d25.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766595589.git.oleksii.kurochko@gmail.com>
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
extension ecall handler. The handler now programs the vCPU’s virtual
timer via vtimer_set_timer() and returns SBI_SUCCESS.

This enables guests using the legacy SBI timer interface to schedule
timer events correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/vsbi/legacy-extension.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
index ca869942d693..7eb3a1f119d8 100644
--- a/xen/arch/riscv/vsbi/legacy-extension.c
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -7,6 +7,7 @@
 
 #include <asm/processor.h>
 #include <asm/vsbi.h>
+#include <asm/vtimer.h>
 
 static void vsbi_print_char(char c)
 {
@@ -44,6 +45,11 @@ static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
         ret = SBI_ERR_NOT_SUPPORTED;
         break;
 
+    case SBI_EXT_0_1_SET_TIMER:
+        vtimer_set_timer(&current->arch.vtimer, regs->a0);
+        regs->a0 = SBI_SUCCESS;
+        break;
+
     default:
         /*
          * TODO: domain_crash() is acceptable here while things are still under
-- 
2.52.0


