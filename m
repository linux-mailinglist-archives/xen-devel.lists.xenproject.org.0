Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE136F5C13
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 18:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529381.823740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOl-0004Ff-RV; Wed, 03 May 2023 16:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529381.823740; Wed, 03 May 2023 16:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFOl-0004Ay-Hc; Wed, 03 May 2023 16:32:11 +0000
Received: by outflank-mailman (input) for mailman id 529381;
 Wed, 03 May 2023 16:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1puFOj-0003pk-UX
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 16:32:09 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c6e7a89-e9d0-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 18:32:08 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac79d4858dso1400431fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 May 2023 09:32:09 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h20-20020a2e9ed4000000b002a634bfa224sm6074321ljk.40.2023.05.03.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 09:32:08 -0700 (PDT)
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
X-Inumbo-ID: 0c6e7a89-e9d0-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683131529; x=1685723529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf2FBCUITLNv92K79Iv4iXww3Xtu3EP3+kJgTTV/WyQ=;
        b=Wwb8m+A/MBKxX8/aWnWoEAimCvThAmY/wZKelw/NuyBSqjIs8K3Lh/c9Sq/1t/ME/B
         ksePu5gs7LyHEmnqWN/5snSwFgID7DcOdjRzLgdyz6UeQ2TvdJq3H43a1PqnL468docT
         nIyX+mzpXdJRddfjR681v6+JpEBQU55RJmGrZdq8eWhr+7EytTMr2nkRF2an9QIDFhY/
         2hmGYZkQhzdVs8kMqWkfcGYopmM/kPsfP8H2SCeonQNHF/NcwTvMQLYvzD5OFOuQTX/W
         /3u4WkPKpUYJ7j0GoR1w93PxgQBL26pniiLXqZ5ZlNj6fXtAn8Qc7MkjTJNl4CnIuwhx
         NYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683131529; x=1685723529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf2FBCUITLNv92K79Iv4iXww3Xtu3EP3+kJgTTV/WyQ=;
        b=itYgQfLeDAabNWq+STTHVqECHBZTPPusIWluzEq7TGW4478FN7Cp/Iui5ygvamzwUz
         JUAV66xWxSEX948KZk1GevSBgnhGzWI4xMzE2DaS/igSZXBJFae2SySdBfRDtfYf1n+p
         u1U4c+HRXJw6kukM/QewFONLXP9uONwT4eGZoO+uUbujyWcn+jLRXn25d5sQ5C6qndwp
         mi2ln2SezsltZD7ZZ9GKCbbStixHj+y0aBBtlJRY1F2mgOI4zM2rrUN0Z9j4Yqo45IxC
         8GW+IddELgLi9StkoUKABfyXscAJc377tDztVnlcEzkPPYj1NatWf4vTf2fsg4SI411L
         3kUQ==
X-Gm-Message-State: AC+VfDxoM+imqHaFJOZOmag6SnuTtLl9gmWnpP4NIvC1PoOHA3oqFq5C
	4nYv+Mx2UskN5h5v9qaDfnCOHnQpTKA=
X-Google-Smtp-Source: ACHHUZ5ONYjmDZJcXbTYja7oYhZ9BtG1XHn25ZZdgX5rmJ5PlsbPBv4Yf2u9gk6gVigp38rrlLOaxA==
X-Received: by 2002:a2e:2c13:0:b0:2a7:6812:ed9d with SMTP id s19-20020a2e2c13000000b002a76812ed9dmr149304ljs.50.1683131528551;
        Wed, 03 May 2023 09:32:08 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 4/4] xen/riscv: remove dummy_bss variable
Date: Wed,  3 May 2023 19:32:01 +0300
Message-Id: <b651cf8d8f5aaa3e5b3ab57e41befc666b7629f1.1683131359.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1683131359.git.oleksii.kurochko@gmail.com>
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Nothing changed. Only rebase
---
Changes in V5:
 - Nothing changed. Only rebase
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 * patch was introduced in the current one patch series (v3).
---
Changes in V2:
 * patch was introduced in the current one patch series (v2).
---
 xen/arch/riscv/setup.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index cf5dc5824e..845d18d86f 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,14 +8,6 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
-/*  
- * To be sure that .bss isn't zero. It will simplify code of
- * .bss initialization.
- * TODO:
- *   To be deleted when the first real .bss user appears
- */
-int dummy_bss __attribute__((unused));
-
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
-- 
2.40.1


