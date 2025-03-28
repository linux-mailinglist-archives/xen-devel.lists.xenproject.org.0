Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F20A74B67
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930658.1333236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0l-0005GD-HC; Fri, 28 Mar 2025 13:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930658.1333236; Fri, 28 Mar 2025 13:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0l-0005E5-By; Fri, 28 Mar 2025 13:44:39 +0000
Received: by outflank-mailman (input) for mailman id 930658;
 Fri, 28 Mar 2025 13:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0j-0005Dj-CT
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c901f076-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so1169295f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:35 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:33 -0700 (PDT)
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
X-Inumbo-ID: c901f076-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169474; x=1743774274; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7+32TIHFV1MVow5Y/aDHKdZapyIzqEiWxHNERaAAd4=;
        b=SXmubGYIo2Cg/pzaY30E3CJa8mTJOBWNHBnxc5SdaXkxibCpq6kyVgDZpc0wjaKe4A
         mZuOnoI8n6COwq5F3m1WP8j+Ktzq6kHDmG38z2u460+PhhyWUf/nS1WA+lQkWKTGtaPQ
         7QxsoY5+PWPmYtj5TI9nmO/fEc2gmw5MyPiOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169474; x=1743774274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7+32TIHFV1MVow5Y/aDHKdZapyIzqEiWxHNERaAAd4=;
        b=D4GNkp3RMy/oOcLEiiEuZ+bJW2oZluTgypiahml4GL9TzZcCdDE0SVB9iqzR78B1Zj
         CJ+5ckmfrr3WQBpN7z/IiMXgAhl3U7+UylWzr9cLnxD2CHRjXRISBEE4Aqmoc3kZvukF
         qi2gUCKQmwM17xuu45npPqLvMfUeAkAAOTO13DGkC+3sQu0cLx/6q+0NX1S7UIlGxlTM
         OpI5Bes+MR20FxaLZAOlGISe4RjOjn2bbVALTQEMSS1P3WPOOCOxEvAa3ORgjdTiqRFs
         4agqeiGr6FXKtjZNAmUhTmIqQYOYly8ujx8oOGeroGjJlFM7mhsz1ilbRNiOQyCDorkv
         Wraw==
X-Gm-Message-State: AOJu0Yxt8EeFY5bOIGp29/S6H1PpE3v7afZsLO7WouTOwSRy3FnsqeTz
	zrsHI2Eyk2+3Gwmaa08KnMbRIvGVEtqZ/yIICIoCg2mp7A27BA2lfKWWZxplOM2G9Hb2hSP30kv
	DX8g=
X-Gm-Gg: ASbGncu1/gJOJpI/ID5CwCyrU4424ETrBLWeUyLdR1j0vMzvuN0rqPKhmXzXkLtxOIp
	eawLfmw7eIA4gw5pBWWQqFad6uy6YzEPs5W5dWJ4iaZWVHjCstNNMJvOszc/kaOOZEtj5vNAyLv
	vkruznFAdiA82LJ6OxaCRzCHyO8FP9ne5JmdcAwxU0Lq+3OYi0tJN74nVN4SeRTUjzuzEUcU7IS
	kldJ7pk59swrPAwtTN56PJN01My+1OINgkR3ydVCKxESeaM9/u7Z4Uqz7XiJdwN3NCpfL7z4+g/
	rnWrLO8wZHq6RvSX9rB52zNUYJ3N9ZElblHsLFe9D+pqIQkwo2j4KJi41xnSb4tiXgSBUzdlZtU
	pkVzIAU/Rf6ZYTmkeryimosZfwLKF
X-Google-Smtp-Source: AGHT+IHgi8O89tYF4SvaCCsfyFwZsWLyhq00GhH7tdKUWImLZ5mbyFrglHJoukvZmhgGWsNMBN9kog==
X-Received: by 2002:a5d:6d0c:0:b0:391:2ab1:d4b8 with SMTP id ffacd0b85a97d-39ad173f9cemr5610377f8f.1.1743169474353;
        Fri, 28 Mar 2025 06:44:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v5 01/16] xen/lzo: Remove more remanants of TMEM
Date: Fri, 28 Mar 2025 13:44:12 +0000
Message-Id: <20250328134427.874848-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This logic was inserted by commit 447f613c5404 ("lzo: update LZO compression
to current upstream version") but was only relevant for the TMEM logic, so
should have been deleted in commit c492e19fdd05 ("xen: remove tmem from
hypervisor")

Fixes: c492e19fdd05 ("xen: remove tmem from hypervisor")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

Notably, this also removes the singular case where anything in Xen cares about
the value in __BYTE_ORDER, __LITTLE_ENDIAN and __BIG_ENDIAN, and even then it
was only an adaptation to the MiniOS environment.

v5:
 * New.
---
 xen/common/lzo.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/xen/common/lzo.c b/xen/common/lzo.c
index 3454ce4a7e24..07b4017812dc 100644
--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -28,27 +28,6 @@
 #define COPY4(dst, src) memcpy(dst, src, 4)
 #define COPY8(dst, src) memcpy(dst, src, 8)
 
-#ifdef __MINIOS__
-# include <lib.h>
-# if __BYTE_ORDER == __LITTLE_ENDIAN
-#  undef __BIG_ENDIAN
-# endif
-# if __BYTE_ORDER == __BIG_ENDIAN
-#  undef __LITTLE_ENDIAN
-# endif
-#endif
-
-#if defined(__BIG_ENDIAN) && defined(__LITTLE_ENDIAN)
-#error "conflicting endian definitions"
-#elif defined(__x86_64__)
-#define LZO_USE_CTZ64    1
-#define LZO_USE_CTZ32    1
-#elif defined(__i386__) || defined(__powerpc__)
-#define LZO_USE_CTZ32    1
-#elif defined(__arm__) && (__LINUX_ARM_ARCH__ >= 5)
-#define LZO_USE_CTZ32    1
-#endif
-
 #define M1_MAX_OFFSET 0x0400
 #define M2_MAX_OFFSET 0x0800
 #define M3_MAX_OFFSET 0x4000

base-commit: eecb9f437b2c3e2d22d0af93dc6b1f4d978313a7
-- 
2.39.5


