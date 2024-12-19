Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BD9F88BA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 00:56:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861544.1273520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOQMa-0000sG-Cx; Thu, 19 Dec 2024 23:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861544.1273520; Thu, 19 Dec 2024 23:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOQMa-0000qc-9R; Thu, 19 Dec 2024 23:55:28 +0000
Received: by outflank-mailman (input) for mailman id 861544;
 Thu, 19 Dec 2024 23:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om7t=TM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tOQMZ-0000c1-C6
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 23:55:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b814a902-be64-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 00:55:26 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3862e2c9bb5so86479f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 15:55:26 -0800 (PST)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6dd3sm2628996f8f.96.2024.12.19.15.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 15:55:24 -0800 (PST)
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
X-Inumbo-ID: b814a902-be64-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734652526; x=1735257326; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4D++oBXK5nnYb4cn7GeUmCP5459fQygu93iRr5qfas=;
        b=AKU4fV4pcNIYmnyDhL+T2a2tfNP30UAF2dU/C64JOFRYiMFq0NydvCUD+omHSmabJw
         uEgodVl8+Jy2wlOczzY5oVqXvVKt1rUJ57/DY8z7idP0GpCR42mmyKOYgGIr28NZzHN4
         YRPhQNFUnoVbv+E1p4QVPdt2fKCuAevKoDu7C1zkygThdt+AhBDIn6vBXPCuxst4Y9KG
         OEwQffRWjPNFfLRwA2p1mYwFKLJC37Ylt5DMtYXhwK3j2LQJReSEdF20HOyEl+ZKVQfk
         MKGr+MIFdGOGiMI+zL5PJUm+gx6swmGt/r3lvwLZdw+O5Siqf4ty0bzw9GJ5r98SSeQR
         8hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734652526; x=1735257326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4D++oBXK5nnYb4cn7GeUmCP5459fQygu93iRr5qfas=;
        b=S+ZJgkIT4qNqQcr8QlMAQ9bkoD3I7qV78h9z1okLAaeqNUmtjDoI16FMTyeX8V69ph
         +DFtQnKGxOi49SvM3sCI5IqVW2jHnGt2PX4mxwtw1BpgQWw/9YjW1HeeYXfquBkwJXr+
         gX0q8Pbk/TgCuQF7RUV8HJAbmp8nK8FxdAXEqLxkt7pHxTWa4+eQaWpGwbkfrWcG/xOL
         kkAEpn9UHmy/GllEkrLLklAbtgEyHISHLdfRRuhnH/2Pc2RxtMPokxBJrsqq2pQvqsIv
         k1i8Fnm+9yTSBpPtFr4QfnWUd205q3T2113JNn3wY9wT6mSm0OEQ12MVruW2UV/wiI+6
         ayTw==
X-Gm-Message-State: AOJu0YwMPIJm3tQX4Kh617R/1+sU/IZtI92lIHacipHmRakyLyL8L7XI
	/4/ppmAEybGl7R8uE1/S5CIu6bpbTVLY64CQOc4zPMWzOcjkzYCh10U59Q==
X-Gm-Gg: ASbGncvK0w/t/zn5fAx4jIF2Zmk3y8M/56V06UaHPJ0+JzkfZSBihxIHXlqbPqoIhzB
	skWnoeXN0OFQsNV2DNBCgI2qUp43WtB67cx9paNYTRwsfrye+qtZfjmfK0Rsin42Tg+/sAccChm
	ZeTGfhtClhFP3cwqzcLtbyOcuzYkI6rZSudOd+ZWNSOnnvY8AYblieTjTk8RyYG5EjwdMR6OTgO
	4CXzKHR1VQlW8gP/qDqTbpAzhgEQh2DORjEVxQkHNdC+tbvVlWOE3jMS/xLEwOTKXuG/ooUb+aD
	mDVhVN6512t8oMc/9hUtpojST69ud8Mbx1PN4sNON1hwSNjteJVVNSBl
X-Google-Smtp-Source: AGHT+IExPdJoDGnroTJOpIyAQALEK/cHEbyLaeZGfeJwiY7mRsUAu5D1LiA9hpAIXQXdI1f/hamcJQ==
X-Received: by 2002:a05:600c:a0a:b0:42c:aeee:e604 with SMTP id 5b1f17b1804b1-43668b93b4fmr2109995e9.8.1734652525548;
        Thu, 19 Dec 2024 15:55:25 -0800 (PST)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] x86: Rename _rsvd field to pw and move it to the bit 58
Date: Thu, 19 Dec 2024 23:55:01 +0000
Message-Id: <bddb36cdf6a8d222fba7d5973512ebfdb86b0c0a.1734652343.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734652343.git.w1benny@gmail.com>
References: <cover.1734652343.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

The EPT Paging-write feature (when enabled by the TERTIARY_EXEC_EPT_PAGING_WRITE bit) uses bit 58 of the EPT entry to indicate that guest paging may update the page, even if the W access is not set.

This patch is a preparation for the EPT Paging-write feature.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index f0ec459622..d920de96b7 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -34,8 +34,8 @@ typedef union {
                                EPT/VT-d usage */
         mfn         :   40, /* bits 51:12 - Machine physical frame number */
         sa_p2mt     :   6,  /* bits 57:52 - Software available 2 */
-        access      :   4,  /* bits 61:58 - p2m_access_t */
-        _rsvd       :   1,  /* bit 62 - reserved */
+        pw          :   1,  /* bit 58 - Paging-write access */
+        access      :   4,  /* bits 62:59 - p2m_access_t */
         suppress_ve :   1;  /* bit 63 - suppress #VE */
     };
     u64 epte;
-- 
2.34.1


