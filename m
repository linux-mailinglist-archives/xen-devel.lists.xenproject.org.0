Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C6A1AD9C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876449.1286827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yH-0004qh-Gu; Thu, 23 Jan 2025 23:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876449.1286827; Thu, 23 Jan 2025 23:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yH-0004oJ-DD; Thu, 23 Jan 2025 23:50:49 +0000
Received: by outflank-mailman (input) for mailman id 876449;
 Thu, 23 Jan 2025 23:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sW-0007hN-Qx
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:44:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 092ce7e6-d9e4-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:44:50 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38634c35129so1329304f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:44:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4161sm952291f8f.88.2025.01.23.15.44.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:48 -0800 (PST)
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
X-Inumbo-ID: 092ce7e6-d9e4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675890; x=1738280690; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK0JABDJF/QMP4ClWDlwjdLf62KvnH3DnM23ZO9feXo=;
        b=PPL2XawRCjzUxoIMFBJ6Kk5O2Z7HkLNf0lmLlIo+RlDD+LkTbMcUerHwlIcdDumtQO
         xLYp7d/eVA37N3AyUxF7UWqewgZJvS50cZ5szueUQEaaSWFy87e62a4TdsCepKYtpmfs
         H6NWe9sWWc6VkfiX8dNXPhmkCx1h5Ug1NJy017uPQVPwDOgi3s6WAXjetlmNHCSuy7Zi
         wmgZ8ip1vZvExdQb45YEcJ3jJJqb21eFw1DmMecbvcxXy92k/bGC+ubIslnXw+xAwZWc
         stbdvrogEuGPfpOtp715Svrm81sJ03yxaRcBrieoGz47Sk+v7CVLrsABIdrG4ps/lwuv
         40Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675890; x=1738280690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK0JABDJF/QMP4ClWDlwjdLf62KvnH3DnM23ZO9feXo=;
        b=eCVL8XpHDUWJI09VQpleD8W+30Y4xABl6hCjAO97V4ZRdGc1BlaJm+GS28lyhWj7nT
         UoJ4XxzYxKZC+JXO9rPLKD97aOj33y3kC7mBa38U/H4QuLrAsFmtq7kmfBtG23XXhRJ0
         grsr49+OOpfh85PegGzptsTS7YSdcpiDuqEkOKBhEhftHHBoZfOnl3sCnMYmWMxDa5UV
         Uqp/SGDpiSVxsVxOc9ES7j8D3FLhgNrACz6J793Ny5mf1iLtNMGUhwNacC4lWs44s7lZ
         sqx2rCpjxjenxU9sRjRMJHNyYPUPPTkw2dPm9HwRiFyJZ6BN8c+AokterC2phrApP8LB
         y59Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkDnW+tyWxX24JUnd0I4lXkKTCc6f+Pb/cYPCmN9GXh8fXzvrkHcSLpX9Ck65c3+2Lz4EvRKQife8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYVXZunykkBtN3WQ2aM7o2KA9QKWq5NaKuI+gyMVz8R9Jpc4Fy
	3dZIrWtwi31hhWGHIf13A8Xg9TASMzZKkfL2/WsfKl72bOAO1yNlGrBBzQO9xwA=
X-Gm-Gg: ASbGnctVe31StALCB4R4sD7qO3x7LqXYG6eCASsyde4cHlyqly5QbKpqR01eDlZKN1r
	TdPznka9cCAKalkJnn/JngHzQcTN8qX3RI6Dvblmga0i70Y25jYr9OT9rTHisxX5+IHiH1aNGMr
	g+qRE+LbgT3bOdcQfsvRqeMe9t3joTDxm0x2bFolJvvDLVGTMLh37KYCNJUVQt612p0pDzQ9FqY
	UUd1Y/ZGVdnsqXcOSll2stHgcql52uL+qYSux+zRw1YeJ211hcPsvJjid3kKsLY9k1cDFE48gsr
	Ej1u4eX0wvr7UvJR+l50H4460gYeLj50AEwoseKNASzf36dWkrRkw34=
X-Google-Smtp-Source: AGHT+IGSMRqXknIm20dxUVJ6YnBSj5qdwQEIsknPsDpqx1Ro9qYQKL2SDEG840LoeQHivalI7LVk8Q==
X-Received: by 2002:a5d:64a1:0:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-38bf5677c09mr24857649f8f.5.1737675889741;
        Thu, 23 Jan 2025 15:44:49 -0800 (PST)
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
Subject: [PATCH 06/20] accel/kvm: Remove unused 'system/cpus.h' header in kvm-cpus.h
Date: Fri, 24 Jan 2025 00:44:00 +0100
Message-ID: <20250123234415.59850-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Missed in commit b86f59c7155 ("accel: replace struct CpusAccel
with AccelOpsClass") which removed the single CpusAccel use.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-cpus.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index b5435286e42..688511151c8 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -10,8 +10,6 @@
 #ifndef KVM_CPUS_H
 #define KVM_CPUS_H
 
-#include "system/cpus.h"
-
 int kvm_init_vcpu(CPUState *cpu, Error **errp);
 int kvm_cpu_exec(CPUState *cpu);
 void kvm_destroy_vcpu(CPUState *cpu);
-- 
2.47.1


