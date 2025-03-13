Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312A7A5FC23
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912968.1319176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslc9-0008Lg-AJ; Thu, 13 Mar 2025 16:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912968.1319176; Thu, 13 Mar 2025 16:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslc9-0008Jk-6y; Thu, 13 Mar 2025 16:40:57 +0000
Received: by outflank-mailman (input) for mailman id 912968;
 Thu, 13 Mar 2025 16:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaf-0000Wy-NO
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:25 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b854ee65-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:24 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so33218475ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:24 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:22 -0700 (PDT)
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
X-Inumbo-ID: b854ee65-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883963; x=1742488763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=Pm7oW0p9MOxprCME69CgtVTfDnw4FA8rQ/HTzhFn3XMxplPt/BDl6nVjtA1jrNzu5p
         1+5BXXgm9lAnSx16vtPJAGcCllfZTd+jU/Et/fYeG+r4/MA9f4Nx43e79Vu6hDhKEi74
         Rvc4DKUSaNIos86Zi6JlKOfbGjtC/SZqQz8zRK4LMbCTSoffqfwQx9bBHjq8oaFiD+Yj
         pZvUC3ctXseoSasoObzJwDG5viI9ivSjDKJGDgfq1tnoWjRg1KLxgfU2xi8RXhdjf5cP
         ICqR6C/7rEXqgD4t4Ye0mmA78998kt4dP7eO3R1ogZFWqrDEVv3KZzk6tNUX208eJqvw
         /09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883963; x=1742488763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=veWgchPav7V57eti4aRmeK18rg4Oxh5lDg/xsTruD5INQ8poOpz9StxOUamfAY3xtp
         QVCBztGYBH3ZiXSI9ZObOyz5oZJ82tCbTU1YIEXPSTR939dBaR1irjAU0F1Vb9Dwaxn6
         AjPOE9DTq5AD1UkMBFAuhFM4ZVHh5HBV8tDfp4XnOIg2ysSv8Ic94do731ACtj9sRPay
         xb+SepH7ymXKnklsv39GeVj32DO27styObFZhHuMI7JvR7upS8zWZg20ikRVeMRAjsc3
         doHS7Qxivvmunka++MlujwFBEDacWG771uP1w6Gl0F69jhU36fsRYA7afMkonQXRN3Ao
         evYA==
X-Forwarded-Encrypted: i=1; AJvYcCXUrtK2geJw/8zfxqBHJMQ9yXo0yPXC9m2h+Kau3PeRkFA7Dxa/+7PW94bLow/wD5lgCdw1qIbeBGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOKcfsxDX7cYhPY88Gr4pxsAfkplhJ3SX0Mr8F2yNSn7TzrWZu
	8it7XiBIr28zSvZrgtUYow+w4QXwxKWdB9a42459DZzVpejXo8T9pna9R28sVzk=
X-Gm-Gg: ASbGncs7udeE79uDRTMU01zbtrlfKhz1BqVikAwwrdQTzCb3DeijLW4vq6o+YqAEaM8
	HUss3b2xqPQ7wAnXEQCZByxMXF3emrdiDkAgIcO9O64qo6mrpz3whRz5Uvxfbc2xM9Z+AP1VyWV
	mgMAz6qXzP+eGhxbWNRYNqkQd0jVtRdkFNFZrG+uJHchC4bjQBqgUXwkeYes8H0UYczzYnbV0u7
	VRKduUpf+7bL5VB4YZRjYVvKgHZnsrq5e6LKFptUVQAyuafSQiqBYyo8iA51SfC9eD+1gvgCWXB
	gD1cc/pd3+2CP8N5pYTuhtLaYaQb41XH/lFBuDMW26AyhPLm5ox1AX4=
X-Google-Smtp-Source: AGHT+IFA5iTR0M+uWE9BgHbKNSK5QhTOV/p9oDq/Jx41glVxwyMkriyoe5Nv+AlfRyMJQR/e/whMeQ==
X-Received: by 2002:a17:902:d4c8:b0:224:1074:638e with SMTP id d9443c01a7336-225dd8ec5f6mr2405345ad.52.1741883962943;
        Thu, 13 Mar 2025 09:39:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 10/17] system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for common code
Date: Thu, 13 Mar 2025 09:38:56 -0700
Message-Id: <20250313163903.1738581-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is used by system/physmem.c will be turn into common code
in next commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index ab17c09a551..21da3b8b052 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -210,11 +210,11 @@ bool kvm_arm_supports_user_irq(void);
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 int kvm_on_sigbus(int code, void *addr);
 
-#ifdef COMPILING_PER_TARGET
-#include "cpu.h"
-
 void kvm_flush_coalesced_mmio_buffer(void);
 
+#ifdef COMPILING_PER_TARGET
+#include "cpu.h"
+
 /**
  * kvm_update_guest_debug(): ensure KVM debug structures updated
  * @cs: the CPUState for this cpu
-- 
2.39.5


