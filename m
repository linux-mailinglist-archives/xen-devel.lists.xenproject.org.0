Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F31BB3482
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135462.1472596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ewx-0004Hb-4Z; Thu, 02 Oct 2025 08:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135462.1472596; Thu, 02 Oct 2025 08:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Eww-0004Ey-Tc; Thu, 02 Oct 2025 08:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1135462;
 Thu, 02 Oct 2025 08:46:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Etf-00006C-4k
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:42:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0ab2ad3-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:42:39 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso6167545e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:42:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f50b2sm2597515f8f.56.2025.10.02.01.42.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:42:38 -0700 (PDT)
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
X-Inumbo-ID: c0ab2ad3-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394559; x=1759999359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPyvtamk/7TWz3NLD4QWdvW1Is4VocR+bm6o/kbYsjI=;
        b=dsuY0OOaPTlyrgbZGF0WuS/+sp5VweXGlFCnZOOlKA3PIdamaOar6QnlHD2mpUJdNW
         fMV4pnSoF4W3iV5Pm4bBUcpfiSkvhi/gxU4ukGV8qHazLZagNj0U7cxBYFdNnwp/pyRS
         JOrt8bmoUAl5Uvb7Mx8zZGTPbWbyanUynP5mFjNKdHNZFIuh6PtwaPdRlfCUg4rLoIdW
         z9uowP4/KijFiifCgrXitzRW9/E7bbVyh4LlV41tK4st5ipTQTb5WYVbJfN6qKbtwGQ8
         h486MBppLRGYFrJf3mlflDJ6iZ/h+2Pi+RcKp7L4uR4NDvjhRhxxEDEC5zY7RVGGU8ZE
         +OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394559; x=1759999359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPyvtamk/7TWz3NLD4QWdvW1Is4VocR+bm6o/kbYsjI=;
        b=tOn4tijI5Td16K8HooZLI6Bt7RUBO/iOkSrofAhTDZ421cGeeW8FH+wrsvG1Z+DU4E
         kQLDbXUMc7Y7HjjBN0IjXk8V+3iCsCtmGGZXy4pe5nNBcr8xqj1ssSoka4R3JU0xx+6n
         p4q6pBuek6IV1xAaFOZMtEl5GKVcE7j8dPyl3jJmNENkxGDwmMy/sNleK0m1jmz44ZGV
         Zv977c47YdJgTpYtF6dz6Y3fHZldpc7iA+6Ar4P8Ud9cGNnA6ZoPbI9RTZ8Kar7r7Dje
         qOuDw3FBgpvZ3PSTx/Vv9ua/adQkvXy4N8sqOwg4FgO/i3wKpn++WkhzVx/MDFzulxr1
         67lA==
X-Forwarded-Encrypted: i=1; AJvYcCU54pZ4Zk1DInGKWu/DLfRXOXpFELeOX+EHoVefGlnluRPonI2l8OaWtOoKgMrKyUQcngvUF1lKxfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHXRkJ9yjQjfDzNlUvUqh2y/wwUU1y+uaj4kJ88/6rXuB35W77
	dPCs3geKztikEHiZhYtwW2dXDD5Hc0qtCqL5a+Ioi6o3bHVgy6+Rng98SUe6uS2gZzI=
X-Gm-Gg: ASbGncvXJJ3Vq7GR2RC6CFnnOJo8Mwp+vOEqFBUyRk/ihXux9eFofKtD+Dw5WG4AWTU
	IBf5PGzphKSA+ZAVqtRrnpSKMOYgAdKqVxSBjLWpcj6K4FCrSxYDb1nmcSpaBMdFtWBZ5JGGpFp
	LTnU5iYNrePw+cJOlx/Sp3fX1SeNyCuxubY+vGfJEA5oiJhC0NZOJ3DAyCHh2hlUIEUOGZnqLH+
	VX63yE6BW8bFp6zy0K61SlBkM7U0xNwnT5Vyge97iHgcMcSkJ62Hst4FE+ZObzRXROD1RNQ9kXj
	iJa50IBSbPL4xTmohGPqln3LfWInGqna0a/5YlQeQxN7Zta9PBkBHNHdsS/EoJmffiOOxjrsAEn
	d7/VZa1ErmTrX+JkOHiUE4gBdP8707X140l4sV/5Y9cRMZNYqDv0AVZbbj1sKElN1GGlRf3JzwA
	taGaD2vzTK6HpMO7LDrIvUlO2O8fNDjuDOtrbdZeDe
X-Google-Smtp-Source: AGHT+IGiO2MQIF6Yep6y2/isH2QW+nXbG00es5/W6noyWTP2pD3nWUiti/7EsFpua85fKefjjBmssQ==
X-Received: by 2002:a05:600c:4fc6:b0:46e:1a07:7bd5 with SMTP id 5b1f17b1804b1-46e61285d7dmr48438525e9.29.1759394558687;
        Thu, 02 Oct 2025 01:42:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 07/17] hw/s390x/sclp: Replace [cpu_physical_memory -> address_space]_r/w()
Date: Thu,  2 Oct 2025 10:41:52 +0200
Message-ID: <20251002084203.63899-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_physical_memory_read() and cpu_physical_memory_write() are
legacy (see commit b7ecba0f6f6), replace by address_space_read()
and address_space_write().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/s390x/sclp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 16057356b11..d7cb99482b2 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -304,6 +304,7 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
     SCLPDeviceClass *sclp_c = SCLP_GET_CLASS(sclp);
     SCCBHeader header;
     g_autofree SCCB *work_sccb = NULL;
+    AddressSpace *as = CPU(cpu)->as;
 
     /* first some basic checks on program checks */
     if (env->psw.mask & PSW_MASK_PSTATE) {
@@ -318,7 +319,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
     }
 
     /* the header contains the actual length of the sccb */
-    cpu_physical_memory_read(sccb, &header, sizeof(SCCBHeader));
+    address_space_read(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                       &header, sizeof(SCCBHeader));
 
     /* Valid sccb sizes */
     if (be16_to_cpu(header.length) < sizeof(SCCBHeader)) {
@@ -331,7 +333,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
      * the host has checked the values
      */
     work_sccb = g_malloc0(be16_to_cpu(header.length));
-    cpu_physical_memory_read(sccb, work_sccb, be16_to_cpu(header.length));
+    address_space_read(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                       work_sccb, be16_to_cpu(header.length));
 
     if (!sclp_command_code_valid(code)) {
         work_sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_SCLP_COMMAND);
@@ -345,8 +348,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
 
     sclp_c->execute(sclp, work_sccb, code);
 out_write:
-    cpu_physical_memory_write(sccb, work_sccb,
-                              be16_to_cpu(work_sccb->h.length));
+    address_space_write(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                        work_sccb, be16_to_cpu(header.length));
 
     sclp_c->service_interrupt(sclp, sccb);
 
-- 
2.51.0


