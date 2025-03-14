Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3EA6185D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915104.1320712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt941-0003Y2-G4; Fri, 14 Mar 2025 17:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915104.1320712; Fri, 14 Mar 2025 17:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt941-0003Vh-D3; Fri, 14 Mar 2025 17:43:17 +0000
Received: by outflank-mailman (input) for mailman id 915104;
 Fri, 14 Mar 2025 17:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t4-0000Ih-Py
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:58 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a7f9c9b-00fa-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:31:58 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-223fd89d036so50298055ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:58 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:56 -0700 (PDT)
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
X-Inumbo-ID: 3a7f9c9b-00fa-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973516; x=1742578316; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=Ps8DwMv30OnOS1pr8llj0bYh339y0ndrO1BaV7/V3E2W2TlLE37W7c/+5Lfdf/ZAMR
         /payVKpsFrGWd4VEri8sw89YgK7mrhSSEpyyuuM6N6hyaT1I6v3VX73/F8HsFninIM0f
         q3uRU527iFq0dD3b+Y6C4e1zS74sqjt4XHXpNG8WNh+vCDO6mxhv0baXswRzJbGNSFOy
         XeHV53yvtrN+rm/ciFZoq2n8rfmipjviNPY/j6miQVs5ypy0w8F9QyibcnzIY+RDAcn3
         3UjZb1hp44SEwupVslRKqd40o731o8EBqiN0mCNPNmB1Xeqc5kJxF/NKjKag7LxVqkZ/
         czdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973516; x=1742578316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsftdeZcZ0LsVJ43Vlgc1kB7SrUHDvnjwuIeYSteybs=;
        b=iicepINbLKbcFjGUYVKbLHWDPxkU1tJpIBYpleA/9iLqbTTB49wSKqS9KdrfprcyK7
         iomm/lw+MFVNwt0/AvD1pA1gbpSB/8XQFIlmAHrU/eVGy19lp70/oBTWGilwa5VDdTNF
         hyL6q0Tsi6Vzccj3WwBwBf1ujlXP1eKzu7H2AF/lKDWx/ajJ8gOYYwFn0awqOHHGn+eg
         vZwS+QRTbwj3Fu3mY8gOEo4TPCUC7XM+1UnsguBd0nmmhuwyq9+PiXTJBpYKUYDd1DGt
         XFb3A037mKXGqz6HoG4U36Py8FEBT85TYSW81QFCxVIQP1LCOUkOxMRTifwYPCmdDi5t
         ZtRg==
X-Forwarded-Encrypted: i=1; AJvYcCX9AL7OVCnbfdIKHJlUgk9G/8BnMnIwBeDgho1QnZbtlYs/KXp+TmXtGFoVmS3LIAGIS9rokiaRo6U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwTv/hjgshi5nHQHHIpmc7/xg1sg2XM5I4Fl2FaReqxfrGTyVT
	0AHYWX6NsTEDyUcCiwd4Nv7nXHtEM9FEvHKpDkRBxlw1PZPRxFj4YW+Y5868oVs=
X-Gm-Gg: ASbGncuW2G7Py7ehAIG5H6dN9dX16IX0eZqIy9WqOQaWnq2kEX63A4ii+pTkbw1KqpD
	kF3wZg1BgftPNeB43zagwPH0LGGFdADMMorjRWGAIHuDIhg3vDR6HdGmfckPhDRRrU57SG5+QPT
	RQzgnY+kijOicpo+PHB5WTmzPBMMeXkn7Sie/nv3YkWi1nnNqlzOA4CXcoNmnLLIgJANktGeKnp
	pAV90584VwVtq4y4jUBAvEDMq5Zej6MOPeMY41hQ2cqLljTHvUGjmvmT3Xp8FKUFQSeRySfGyec
	weBWaAcy8LfNQsmmoNficRlZgcYo32bGWKAg9ODn1Arr
X-Google-Smtp-Source: AGHT+IHMleMJwhfQuIw2SImS8wKBtMic5A4ELNmhk5zJYoh3vglYg1/X+SLV/IgTuYLv0/Y4ZISJug==
X-Received: by 2002:a05:6a20:1595:b0:1f5:8622:5ecd with SMTP id adf61e73a8af0-1f5c12c78aamr4816767637.32.1741973516583;
        Fri, 14 Mar 2025 10:31:56 -0700 (PDT)
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
Subject: [PATCH v5 10/17] system/kvm: make kvm_flush_coalesced_mmio_buffer() accessible for common code
Date: Fri, 14 Mar 2025 10:31:32 -0700
Message-Id: <20250314173139.2122904-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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


