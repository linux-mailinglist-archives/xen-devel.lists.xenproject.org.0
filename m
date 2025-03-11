Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31203A5B7CC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907037.1314420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvp-0004N5-5B; Tue, 11 Mar 2025 04:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907037.1314420; Tue, 11 Mar 2025 04:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvo-0004JJ-Ui; Tue, 11 Mar 2025 04:09:28 +0000
Received: by outflank-mailman (input) for mailman id 907037;
 Tue, 11 Mar 2025 04:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvm-0003IE-Eo
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:26 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92c27126-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:09:06 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2239c066347so87017815ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:06 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:04 -0700 (PDT)
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
X-Inumbo-ID: 92c27126-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666145; x=1742270945; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJTMw6tkQg2gyyv9VopXfGbD8re6/gGFQNon8Npv7Ak=;
        b=nUY7vh9cTpLoU7q8EJJVt+ubn7hqFkzNgXua6XjS9FoZMbizVUtkBxFBuA5j3MbMvq
         q22A7WVnisSX7ZlxwHiXzlQJsD8VLCTJ7ef5WGmndAZ9sAy49o4MhWovrKaZK/gMXGPG
         MrGF90SoZtUcTJQnXT30Sj/XGA/jVRDEm36RjEfq3GhjDE4RPFhQROy3/5hCt7+CAO2S
         V9GeguvO3d3Gwn9BKxI5VPF1lop/M+hFn4cazRRgY8TNqneuO3Ej3OdW6V3g1x4Kkgjk
         iW5CkR3zwvGRXKNoJCoOaVpKIYiwrSJVmjUeqa3IdicTxCxuVEZNXSb8vWU6XsQCfH7y
         JH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666145; x=1742270945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJTMw6tkQg2gyyv9VopXfGbD8re6/gGFQNon8Npv7Ak=;
        b=EBel0w4iv4FUTs4nCtN0qNqWQ5/BNyR+GLetZI34sdaaGYVf0qQ+uzilm+WLzp7tBn
         k67v+B4RudG6CpsCvhNhiJdfYeF6lOf/yBWcveehacwoFuCd8aHlT5W+uLswZVB9hPHe
         wQqiV4w82lslJVM8BLGg4VvkIb/LK1QKIZmp0BMaaxuzE7KNLVFQw3gr0Q7B+lrPMICx
         dk33bVMmWlfKDToIcFd7sYRiyyQLk3tyfCi/6lQkIQ+vDQLyiMQkSBdWdxSxMvhfywwC
         IzXVjSl1lF3fYamj19iQB8NJ/NGSlDDHxQHbhoVxeoDE+RpCxDng8mRT9ilu3c8xcuJp
         MHjg==
X-Forwarded-Encrypted: i=1; AJvYcCU0boarhT9S6C8t35jfek7e/VbSny/jsmgecMJEDxPZfUNgkv6iRGCbreyhQzvYtFVnaj5L9tA33AQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6nyWcZ7bLrnPk0C47rHuRWapnNyKC1zKgJDf+Ph/rc2aNFKSB
	59oxGCRhZW33jDu1oH++YHinlRyHehd8WtkBaa/onoQM5iKgIQE2nyZ3RWytjCA7LYvaMVhpZXG
	En6I=
X-Gm-Gg: ASbGnctUqkM9wUALN871syyyYD9PY+W7GlrREQ+bbP00RikdJDvlUrHXdgARFDq67we
	9gvJZiCSVRrNv0SM39/3QotqKYeJFP+I2OlT9FPGrL1FoUQk0JJC1lPocDiforEpJibh0ytXyTK
	+Y2fuKNMsF8zvNVbpFCY9onNP2vaobw2WHZrFaAkDeKL3OfaH5I1GTkBVcolqQRt2CXxGi7AQLP
	waem/HVsxhG9/1lLeaSY1YW76EA8s/1n5cqXd9mwlEZwrGoRM4VW7StfoG1+dyBOcbgReMP/2Hs
	QDzuJaiZIErDc8yX6Geir80qANAnxp4fCwe6Me+OYhNXmQS5VgqasG4=
X-Google-Smtp-Source: AGHT+IEZQz4PbmDcJ14zbyjAyAYIBXfqlvYCPkEDTZUS00hzo0yd+SRkwBCunP0Y6iJa+tBGNAcErA==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:8221:d68c with SMTP id adf61e73a8af0-1f58221fee5mr8742647637.3.1741666145118;
        Mon, 10 Mar 2025 21:09:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 07/16] exec/exec-all: remove dependency on cpu.h
Date: Mon, 10 Mar 2025 21:08:29 -0700
Message-Id: <20250311040838.3937136-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


