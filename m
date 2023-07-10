Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4D74E5BF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 06:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561378.877961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ4rN-0006lo-GX; Tue, 11 Jul 2023 04:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561378.877961; Tue, 11 Jul 2023 04:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ4rN-0006jj-D3; Tue, 11 Jul 2023 04:20:21 +0000
Received: by outflank-mailman (input) for mailman id 561378;
 Mon, 10 Jul 2023 19:25:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6PHc=C4=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qIwVI-0005bW-Qk
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 19:25:00 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 755fe682-1f57-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 21:24:59 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso967871366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 12:24:59 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a170906480f00b0096a6be0b66dsm110076ejq.208.2023.07.10.12.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 12:24:57 -0700 (PDT)
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
X-Inumbo-ID: 755fe682-1f57-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689017098; x=1691609098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z71M3kv4pOhHERmm48IRm9ZZKlLgpwDQJ/Fo9wvNP5c=;
        b=ASZ3K3ti6Bg/EbHuGo8ohRbr1fAme2CHAabDjiV/uN16VxosIlNQ6g9LHfm3xurH/c
         lnEZhyrQ5BpkOGbo0OVMsFbLSGtiKDrFdhS6Ct/trK1XyUBMl1sIPlDvaueYOklhMhBH
         LsVtQTFSqIldpa1nRu8firvs9QmQG5792VyW0EmunqskCC0IpXzSYyeRT0PPVsQJGoxM
         fDsla/SjoRdP5k4jl7hEMhe59+kRMbneOuStHbBmghQORD9WGjdtlwlFWnQ00Cj2jwFa
         DOLb86EDnRYJ+z6nA8mxVcwoLtAeiY1TLcjNh7CVzxtevL1YQ+y9jdX23HC5SvWfanjW
         Hhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689017098; x=1691609098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z71M3kv4pOhHERmm48IRm9ZZKlLgpwDQJ/Fo9wvNP5c=;
        b=fsc/aTCW0yehx1jvWedpGi3eafptN6m/YcPxsXaIV90e3x6ZMV7OGJ4T2CNdlIuPpg
         v6L7Ee7FM2ovnDfrZ9RRdlZO0iSpphpsEnlApthb8x90UI21kmIunV9W6POglcRhRZNM
         jlSMzKVpxXkWni7j3lB3k5+cG9goL+q+vKgc2Y8EccdWWboJ1L0oy2Ac5BqnzAb9/x9G
         UryyrUL/VBR4dg1FzL8vPYvSO2FmPt99CCCMJ5meZqZaiMbHwQVeD+SU6FGPBbNHsKVe
         ylGqYZf8/FkwyzC37GO90HHBNww2g84PW8wOn1+MncqK/E2Gd1Srcopa+Z/SIM0t8roc
         LDKQ==
X-Gm-Message-State: ABy/qLbwH3ScH3H7G8o+B9txfNCNe89Ml1ySaICquSsqjY4isoaaAkv3
	dTvvgSJ6YoOenQgFaA/yyjU=
X-Google-Smtp-Source: APBJJlGthri1wuPEMGs27pEajcM7hryhEfxctXKvA699qawtyhyGJ5wNksSwjTUqpLoTCr/9vPqPrw==
X-Received: by 2002:a17:907:3c0a:b0:98e:370c:be69 with SMTP id gh10-20020a1709073c0a00b0098e370cbe69mr15702590ejc.6.1689017098266;
        Mon, 10 Jul 2023 12:24:58 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 2/3] locking/x86: Wire up sync_try_cmpxchg
Date: Mon, 10 Jul 2023 21:21:55 +0200
Message-ID: <20230710192440.47140-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710192440.47140-1-ubizjak@gmail.com>
References: <20230710192440.47140-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement target specific support for sync_try_cmpxchg.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index d53636506134..5612648b0202 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -221,12 +221,18 @@ extern void __add_wrong_size(void)
 #define __try_cmpxchg(ptr, pold, new, size)				\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
 
+#define __sync_try_cmpxchg(ptr, pold, new, size)			\
+	__raw_try_cmpxchg((ptr), (pold), (new), (size), "lock; ")
+
 #define __try_cmpxchg_local(ptr, pold, new, size)			\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), "")
 
 #define arch_try_cmpxchg(ptr, pold, new) 				\
 	__try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
 
+#define arch_sync_try_cmpxchg(ptr, pold, new) 				\
+	__sync_try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
+
 #define arch_try_cmpxchg_local(ptr, pold, new)				\
 	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
 
-- 
2.41.0


