Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E1A6186B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915189.1320761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt965-0007Gd-Ra; Fri, 14 Mar 2025 17:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915189.1320761; Fri, 14 Mar 2025 17:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt965-0007Dz-O3; Fri, 14 Mar 2025 17:45:25 +0000
Received: by outflank-mailman (input) for mailman id 915189;
 Fri, 14 Mar 2025 17:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t2-0000Ih-PO
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:56 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3921d005-00fa-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:31:55 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-225df540edcso18252015ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:55 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:53 -0700 (PDT)
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
X-Inumbo-ID: 3921d005-00fa-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973514; x=1742578314; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=V5rmuXD8nWsXNhY1khpybNrFRHhbhyAbm2iaXi2z0QfGsXtUiQfab4cz/U+CORmBfv
         /fFdnkCWgx0r91eunHAvsL5cOCKg76acIGXdRcEu+pJQ4/J+X8OeiKjWUoq8HA5JNMh6
         vtvLFQ0Bs4c/pP1HX7ivEl7lEdy6vm99bzb0//j6j15z2TZOORSoUn6NXnFThaDlFI3t
         5BhlqNeivS6WqDaOKZ76lNEN9thE/ZckWnOMGFG0aYkON9qHzRrJwThB65vbLGe+CNck
         H7yBzhs3Bue8B0TnBrMO835E+b7FINaUdstcXN+dKsfmbHKF1ruVjoogVhnGxulO7Rjz
         Ys8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973514; x=1742578314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp8GQC6vA5rTxSSazblnkjuLZPjrJAYUOFg9uGM493s=;
        b=Mml7+KoCKt5HS2ExPRgpBkttETqAsjkuWXlpOLxCHDzOWnXYVZnVGik9FGq9fk8GPl
         0mtfYoEH7E7tw7Sq+HxdHb4dExur8/G2OMxvH0BEEHr2a0BAHAk5F7gnQNBdRit6MDOL
         AkIpN1mH8Bhj5p/hYDkE3RSHY6YXVi9czwRS91PUgBDDmnFUvomtC2plDZJj3I5nni5M
         hmxVKIWA1XrAsJR4reo+b58Ggh/1a2JeW+1W2pcQwTHqFlMQg/bmFnaRUEUCBYYUo2OK
         9Q2bN2z1KC8ILg1DbLCQL+bJEbYwxjoAI90qc2z99+ixdAkp2G1VnXY00hOIuJCvhh/n
         uiYw==
X-Forwarded-Encrypted: i=1; AJvYcCUhcJpP7RrIleIXl0dQ8wo7sj2Sud1I/mq1gCYBwRkzZDT4cnXx69fjoIvAfB/ktSMvjNErgdFsNKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygjxFEdc/VPH4bwpViAcmOpAb4x9eMlzyqoGdQc5U8K/3a84wd
	A4ssW69ydjqvEXwbQUyu4RWhUcC49FHgTiXgpUuYLQZrRHbEJV02udD1xgW3XIo=
X-Gm-Gg: ASbGncsfD5m/s3AaOmZriCNBbCam2D3wMFCF2cSNaILeCalGzlf526iIuZ6SD4ZRmZT
	zdDmY+4acAafS6jBupKgweCL3DyXrDD9TEuZpjHQTXmyJuMQ3vpdrEYxQfnTjes18UBxVpiV9YB
	zA7xBlsPcetCVjBEznA+utIeiHLOvZwJOM3OR8K/VrZ2aTMi1Wf+e2qc8RNUDe2lWjqKGucdWyP
	Pgi++nqPJf8zctdRohfc/QtRisCull4sFxhBvLMQusHYDX0lBvTgXzBrB3CQIpCc5sPU2y3F9xs
	t2kVR0FYVVnLXjN+iiSVBLpXs714nroJ9SsDjbPmZQp1
X-Google-Smtp-Source: AGHT+IGePgTU4KS0V7kjk76bTSqsHMsJJFpsZKEW9Y9cBbqNQCd9EST3S+oni0XLMdUtO/XVrzydIg==
X-Received: by 2002:a05:6a20:728d:b0:1f5:9cdc:54bb with SMTP id adf61e73a8af0-1f5b07bb133mr8380424637.11.1741973514284;
        Fri, 14 Mar 2025 10:31:54 -0700 (PDT)
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
Subject: [PATCH v5 08/17] exec/memory-internal: remove dependency on cpu.h
Date: Fri, 14 Mar 2025 10:31:30 -0700
Message-Id: <20250314173139.2122904-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


