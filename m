Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300DAF7F04
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032355.1406040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqv-0003Oy-5H; Thu, 03 Jul 2025 17:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032355.1406040; Thu, 03 Jul 2025 17:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqv-0003LS-1H; Thu, 03 Jul 2025 17:36:05 +0000
Received: by outflank-mailman (input) for mailman id 1032355;
 Thu, 03 Jul 2025 17:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXNqt-00021t-IR
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:36:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30d467a0-5834-11f0-a315-13f23c93f187;
 Thu, 03 Jul 2025 19:36:03 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d54214adso613665e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:36:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97481sm324603f8f.63.2025.07.03.10.36.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 10:36:01 -0700 (PDT)
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
X-Inumbo-ID: 30d467a0-5834-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751564162; x=1752168962; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZwQanFWBRxwl5aAhr4ZCK6o5mkA78r32e7Wtw3A5EI=;
        b=jM5Oifv3D35XyLru2PfHtTyPLMkWLvabysiKflCAhcqwvDWtAJfZNDLznnkfUYnCGm
         SsjDxqAnZcR9n/+Zs/ecHWRCLJnMdI3PbJvwgsJ75DGRw4BVjHVXa7csi/JzBaJRrduH
         uMEO0wXVHlQ+Pc7FSPEpcikQ+FDJw99Wdcajb7U/EOYTiWfB660ggNfzMl2ybDC/yKL9
         cFUUSiQoKINIglAejaY3yI1f0fVXKJw7aH4m2NObxfKrWZG7CveluXaZhYp5wSC/0qV4
         PdHJ0/VcQiECi4k6D3st3ZquCk4t83mzzdJoAcGzJmHNQnN8M8cKhdi3uL6cKW/3FZkn
         pS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564162; x=1752168962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZwQanFWBRxwl5aAhr4ZCK6o5mkA78r32e7Wtw3A5EI=;
        b=tIahBy0Bfg2IMKbAvI+VRMHjb86G09z6TKeSK896oeNUeOxhjTO2W5bqv/89gl+CxA
         CKhMNidUQawpZGp1hLRl4dtm+bVdezdozwq1gKKvX4T5DQj49sfCs8UK3GzBri93Th3I
         auFRFi6J/fu+JlFrr3kVl5mmUpXggOjIy5vuPHLjpGN97FZbiXPyQFmCoPld0PhRxf/H
         AMHMBXsTCIWtQ6V8lPNRUDC65pa2Sr26fhV2jiB9ASjMUbXEahvv9ondok0IqYydkFa5
         f8ZZjxTWEUrQHxAw/Ias6DHP5j5WAeg/4Y9x5NmtB8wzA1S9rd10RzrK0pDQTTLUqcD3
         2pSw==
X-Forwarded-Encrypted: i=1; AJvYcCXFJb/fDK3lk81e9k3C5KOJJM5+dip0jN2hzgfFzWf3eWeBHLzCFpSt+7K7ZNKggGHU3HWjdOsN5Io=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydbmVGQyPMNHC9zBRBJl78AL1dSEh5s2UeN3cqoVgTXHLITsz3
	NzQAX8fw606Ldvgs/1Ut1cAUVBsW0FuZEyjyDHeTmeJRLjkaHLrNxmbD0EWrMLj5sDU=
X-Gm-Gg: ASbGncsILqIGdRaPEb5ti7mp8NqWuSmjIKqEb3c+S0C1AYP9sqVIKreIqA/V1v/ygk+
	iao8xXlo4xQiwOjsYKSQzLdl5MDPelFWGelV6NqfzqDFFlv3ubctfXA7JVJwWuG47v7l3cYDiFG
	KzrfYfHJXlb7+GM0be3qr/2ewdl8b8HgZI5L9XdICqD3ta6H6pPd1jkJ2SfAegrrxVbbn5GrvAH
	ee9yDO1biijo468dTeSkUr3pwLnEPQyQT4iS7awa2NM0SMA36peVqvCjuvTfR/PaNdEamgXELHl
	zJ2MReUE8PoEQXT4DPAfoSD29o5zY2ScSQOqvdKe7UHIAKdcvje+HJjmJmjSJZ0yzhwLiVkR2TE
	Ad7NgiJcI+3l+aZjjGl+JjpQ+9sypR7yjWxP1
X-Google-Smtp-Source: AGHT+IFlGs8qe7BnVu94UCy3WqtQJpzJU7HgdWJZtFJUmkIJbvAs7L+AWB+WvKsRQQGdwDgHXZ8jPA==
X-Received: by 2002:a05:600c:8b43:b0:453:6424:48a2 with SMTP id 5b1f17b1804b1-454a3d23106mr87720105e9.10.1751564162373;
        Thu, 03 Jul 2025 10:36:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 35/39] accel: Remove unused MachineState argument of AccelClass::setup_post()
Date: Thu,  3 Jul 2025 19:32:41 +0200
Message-ID: <20250703173248.44995-36-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703173248.44995-1-philmd@linaro.org>
References: <20250703173248.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This method only accesses xen_domid/xen_domid_restrict, which are both
related to the 'accelerator', not the machine. Besides, xen_domid aims
to be in Xen AccelState and xen_domid_restrict a xen_domid_restrict
QOM property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/accel.h | 2 +-
 accel/accel-system.c | 2 +-
 accel/xen/xen-all.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 44189b77daa..19ccc5ef6a1 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -45,7 +45,7 @@ typedef struct AccelClass {
     void (*cpu_common_unrealize)(CPUState *cpu);
 
     /* system related hooks */
-    void (*setup_post)(MachineState *ms, AccelState *accel);
+    void (*setup_post)(AccelState *as);
     bool (*has_memory)(AccelState *accel, AddressSpace *as,
                        hwaddr start_addr, hwaddr size);
     bool (*cpus_are_resettable)(AccelState *as);
diff --git a/accel/accel-system.c b/accel/accel-system.c
index fb8abe38594..637e2390f35 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -58,7 +58,7 @@ void accel_setup_post(MachineState *ms)
     AccelState *accel = ms->accelerator;
     AccelClass *acc = ACCEL_GET_CLASS(accel);
     if (acc->setup_post) {
-        acc->setup_post(ms, accel);
+        acc->setup_post(accel);
     }
 }
 
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 8279746f115..bd0ff64befc 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -64,7 +64,7 @@ static void xen_set_igd_gfx_passthru(Object *obj, bool value, Error **errp)
     xen_igd_gfx_pt_set(value, errp);
 }
 
-static void xen_setup_post(MachineState *ms, AccelState *accel)
+static void xen_setup_post(AccelState *as)
 {
     int rc;
 
-- 
2.49.0


