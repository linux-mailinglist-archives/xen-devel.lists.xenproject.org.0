Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0EA2D1DD
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 01:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884156.1293990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLO-0002bV-W5; Sat, 08 Feb 2025 00:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884156.1293990; Sat, 08 Feb 2025 00:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLO-0002YB-SZ; Sat, 08 Feb 2025 00:05:10 +0000
Received: by outflank-mailman (input) for mailman id 884156;
 Sat, 08 Feb 2025 00:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lbac=U7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgYLM-00022W-TY
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 00:05:08 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ae5cbea-e5b0-11ef-a073-877d107080fb;
 Sat, 08 Feb 2025 01:05:07 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4361f796586so31213115e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 16:05:07 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9656fsm72336295e9.3.2025.02.07.16.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:05:06 -0800 (PST)
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
X-Inumbo-ID: 5ae5cbea-e5b0-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738973107; x=1739577907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XBm5j6ovtjFP/ueMrH+LLKAL+E/KD6k9CCT9TTP67k=;
        b=CCRPzPRI6Lzw84Widh77uvGcxqBe0DUcNe6aXJVhRJMfXfZ4VS32OLeNUYpdhQk55d
         6E7oAlXTwIjBqTEnEZ3Kb7DpszwiPsfqnt5sTCnAp0Hqopj3S8qKp8sk9zM9oPTOs+eM
         pFevEYYwNJ5vjv9fmQ0pwbirJ+ID/53czUpvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738973107; x=1739577907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XBm5j6ovtjFP/ueMrH+LLKAL+E/KD6k9CCT9TTP67k=;
        b=Hxq+F3ON8jDdk0w00MOLm76cg0dLS0zdQ1C9h+7qRzBCC0RcTHRXjrv1PrLpvxinH4
         KP5yKRIPbqMbajnEVEp+t3ti/72gMYdTmrEZhIMx0IRmFDh4wwazsmnGba3xxmH134lC
         HZcmoAJkmZlcY7NMTZvTCjbByiiYkmi3/xpg37uqe2an+11JuMd4q4+k8Fdz9xB4LB0E
         EjpRRY/JcLi55JDqBfMAfJmLvojiIpM1VVQSWWTfoJyb5mHYNm7P+jmCK4ei3OkMfr9T
         WZcAq2n1+MyH9Vptmbla/Rz6bXbGsGnxJ3IymW2DBPqbvggw73Q/KvDs9KaYMQmaLT1K
         xfPg==
X-Gm-Message-State: AOJu0YydAKTVKFaBymLoCg+XLhUAj7jdo3sE9D8xaaDYlCo1ea4L38Cz
	kTOz2CARjasuqsp/zKK0MKJ6LBYuM0wyySist7P8VlZEgFnierlaov9pg0oM2BlI4spfZ9Omxqu
	P8PkgNA==
X-Gm-Gg: ASbGncvHmddAlNWK6Y9wD9sMYe+A0E83wyUASp4YBsXWsDm/qdhKwkBTJUh6Rnw8qKg
	edViiAlOV7KNh6BMtd1TrXW3DAUsu/ZRaNuDrAEUnMQAUWqKLrcDGQMOUoKGMO5z0oYN7GFSuou
	LWo9Wb3rrWqUG04RkXJt0g0RgiVtMG38kygut1A4gJgGTbtAGCFl2UjNMQILCmRFNa25TfHV/rY
	27DRsoI/t/2Ul6vmuhigPbx6UDCQWIkcwV7NP0dA8LZk8VJKIo/1jN5dAznGV3Z2Q+AqH9bjt49
	vTSA3Dm4akPKul/mptC7DE3Pk5qkDX1rIxZ3d7HBes+euO4az9XP/v/SbL2CaRK+6Qt+LEo=
X-Google-Smtp-Source: AGHT+IHczOdSHsviYLLMgvYKf+bJrqZzTPJyL1pvJ7dr78Qm9NyAC/l4tWgOjjl78mGXmCjL/6jqLw==
X-Received: by 2002:a05:600c:b86:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-439249a7aaamr50794555e9.24.1738973106728;
        Fri, 07 Feb 2025 16:05:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 4/4] [BROKEN] PPC: Activate UBSAN in testing
Date: Sat,  8 Feb 2025 00:02:56 +0000
Message-Id: <20250208000256.431883-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208000256.431883-1-andrew.cooper3@citrix.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

This compiles, but something is up with the console and nothing useful comes
out.

Sample:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9079440897
---
 automation/gitlab-ci/build.yaml | 3 +++
 xen/arch/ppc/Kconfig            | 1 +
 xen/arch/ppc/stubs.c            | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 35e224366f62..6a2e491534d3 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -352,6 +352,9 @@ debian-12-ppc64le-gcc-debug:
     CONTAINER: debian:12-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG: |
+      CONFIG_UBSAN=y
+      CONFIG_UBSAN_FATAL=y
 
 debian-12-riscv64-gcc-debug:
   extends: .gcc-riscv64-cross-build-debug
diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index 6db575a48d34..917f5d53a6c3 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -2,6 +2,7 @@ config PPC
 	def_bool y
 	select FUNCTION_ALIGNMENT_4B
 	select HAS_DEVICE_TREE
+	select HAS_UBSAN
 	select HAS_VMAP
 
 config PPC64
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index fff82f5cf3cc..671e71aa0a60 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -47,7 +47,7 @@ void send_timer_event(struct vcpu *v)
 
 void show_execution_state(const struct cpu_user_regs *regs)
 {
-    BUG_ON("unimplemented");
+    printk("TODO: Implement show_execution_state(regs)\n");
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
-- 
2.39.5


