Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28AA58C36
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905969.1313487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqt-0002Vh-Va; Mon, 10 Mar 2025 06:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905969.1313487; Mon, 10 Mar 2025 06:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqt-0002K1-IC; Mon, 10 Mar 2025 06:43:03 +0000
Received: by outflank-mailman (input) for mailman id 905969;
 Mon, 10 Mar 2025 04:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEI-00070S-Lb
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:06 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61f4d223-fd6c-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 05:59:02 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22409077c06so47319435ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:02 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:00 -0700 (PDT)
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
X-Inumbo-ID: 61f4d223-fd6c-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582741; x=1742187541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPEDYJNluDpPES/gm3SGsU7HvgYj8dBtSrlHoVBQ0cc=;
        b=OjiXXz1DPqdeSG/s2a39ISkjWnRfIMRl0XXkUAwV3g2k++CsT7A+keEfpP3GxNfwdN
         u/DPIfbve7P8koO1sH+muVDRmGWcQShNJ1ZTUHRbTT/xVzoej9216a2xiBS2oSagn2X0
         KwEUoX/qhbrC8UAYiCYufoF4CGl6xT92YeFzmEXggz89sl2hfio/BNHpEKxIySJcJdyF
         uAfsiITLFrqbo06uHIE10e+l7NsG6mvBQM6wAGjkPrLotJNi4yPZq0tf9+AyCbdi4RB1
         r2zKUVukU15jmDQAYgA9a4VFLsQ8dpQk0clEzpnDzHziISQrlGzU0/qFpD5Ct5WHwDjk
         U+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582741; x=1742187541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPEDYJNluDpPES/gm3SGsU7HvgYj8dBtSrlHoVBQ0cc=;
        b=VOr759h2yEpeU8IInp1WSwdAzgBjrCDoYjRPmamCdQHejwlP3T0ZSJXvXwzdSGRn6t
         MT3oEvA+cIB0wn2UFU4Pr6w9ptKpTk/SHtG3SRVnAZLeRGfQabvcNX74a80dV1thHXTV
         TMpU/GvwW4KcHwZGc9/SMFqUJh3rXHHqXP2cU6/4qIIijkiqkEnEc49vJMgOz/wFGU4y
         KKE/gW6lY7sjAKwYV5KBRQPA0qSYWkIN1pReE8e74K4zwTUI7BjJ4wxpPKdvpUKtQiox
         fKfUQQaxAMgTX0Ln4A0bHN4eK4yarlzPSlbsa2NbYqJR3LLMv30y0+1Vkoj1Z8sGsp+w
         OjHw==
X-Forwarded-Encrypted: i=1; AJvYcCW+hX9qTDMohwH5sQkaRmHzYZRoIfsxyqu7guN2SLWWAVpzF1FPwDacZKTM1jsPGA1wvcqUEm3zRu0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdJ4M60qGAulz8DUk6RisJJQpCQt9JUQKxvRXcbRWXhpMHVBIJ
	HBvSod3wZpmGaT+MtHX7+y9JQvbd00OalfwhCWIGjfJhHTldFKry9FvyjmEzqQM=
X-Gm-Gg: ASbGncuaJAfUJChXS/4jrOAAGoCEbyfelkmB8UsSRHsI7IOsJTCPYMxbjWZ7IuanuhT
	X/9HJ5umXw80ji8bjZJZA+lXc3BGFvRQtuAB64/AL/9hrEn+kQ5L65XN4rRhl5eM8diaAO8C9iX
	Eaful6UJcDBWanZirmYQ0MuBahFNXhAhvS7fo6vJ1rpU3UUXDjZ33tNFeFUehTNOTZrtdS847lP
	+mnYuE+PdZNHKIfESxLZbmddius9qKGQUBjEzIPAhqt88bA6T2uFTmcs2UGPcCt7N8tpVpzuAKH
	KrT3fz++VGXJduigIudCSCIanxSiZGkxu7dbD/78XEib
X-Google-Smtp-Source: AGHT+IGnRL2uatBuqKhV40BV7IK05QSeZki08kFFlneJ+DA+/in0OuYiAmS5NbuJabl8/7CaVrRM1Q==
X-Received: by 2002:a05:6a00:cc2:b0:736:4704:d5da with SMTP id d2e1a72fcca58-736aab14d5amr19552625b3a.22.1741582740826;
        Sun, 09 Mar 2025 21:59:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 09/16] exec/memory-internal: remove dependency on cpu.h
Date: Sun,  9 Mar 2025 21:58:35 -0700
Message-Id: <20250310045842.2650784-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory-internal.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 100c1237ac2..b729f3b25ad 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -20,8 +20,6 @@
 #ifndef MEMORY_INTERNAL_H
 #define MEMORY_INTERNAL_H
 
-#include "cpu.h"
-
 #ifndef CONFIG_USER_ONLY
 static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
 {
-- 
2.39.5


