Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12DD6CABB4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 19:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515390.798203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgqT3-0004d7-9H; Mon, 27 Mar 2023 17:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515390.798203; Mon, 27 Mar 2023 17:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgqT3-0004Xz-48; Mon, 27 Mar 2023 17:17:13 +0000
Received: by outflank-mailman (input) for mailman id 515390;
 Mon, 27 Mar 2023 17:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pgqT2-0004V7-2c
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 17:17:12 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 357665bb-ccc3-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 19:17:10 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id q14so9796728ljm.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Mar 2023 10:17:10 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2e9804000000b002a03f9ffecesm2463322ljj.89.2023.03.27.10.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:17:09 -0700 (PDT)
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
X-Inumbo-ID: 357665bb-ccc3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679937430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbeKnvVUMcAJnxyhEQPs0rd3V5kkb0qYLldQD4puS1A=;
        b=eVgC80Jsj0cPzOSnLePaPyKYJfNWCw/3FWy+Myb3XlCPv4GhkiR52oW2owD+CaZL8Z
         GL+PU+iDtzMlHrdlD8YOPywlT76dVBc9jUmMMYa3HrTwpqtD5vnKa7PAWHFFP2YHo5os
         gXb3CyHRustHiwmBtv4elfTYGIxzZT5vMBjZA6+Fqmxlm0FhdKez7GOpPTlZ578cXPKS
         2rSbTABzHkEYzNvT7/pgeCOfY9lwKRhmh+YtKEBeO16fJ9jQRAEfUklALDodY1uf0akL
         QOOwq7Bonb/StystfewURdZxB9WPPEPMtrf+aE1c/cGIl/EbGbdHsNB6BHIaLx+DduKi
         cbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679937430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbeKnvVUMcAJnxyhEQPs0rd3V5kkb0qYLldQD4puS1A=;
        b=Ko083rRn00JjDGabvvXRm6OqwyOPZfCgjtPSeKAhXxldjcCPzLdyv8mrJYBpgCorMX
         6Fy2S06oGTmqetOJDB+Ul6zlNcYjrGcpKerAhwD8RSdoW5Qu2tufKS46pWCRG9l087HQ
         AgUHLM6wRfOZorf+vgVO8saNe/zhuiMemkUi3kK3jqw+dIoEV3Fgo9AvdJG4VPbF1BwK
         fDlHtsIklwuqoPRbsQEXEwPwOBH7KcfgzjfAqE5kBYDVXApPCpD5DHCUGPRGxuuDxjFT
         Wfpa+nRVJY8cgoslZN1XKsFAx26YND3uhnqOIEfAfExy3ENqQvOKMA56+Qletiv8DWeY
         5xvg==
X-Gm-Message-State: AAQBX9fAPp4a1fkeUaccx1QuBttsVbCou5NxHyOamSf6fhQxmjJHmxkf
	J8XhbzhzEItYE0DiYvlN/wl95brYEbrCfA==
X-Google-Smtp-Source: AKy350b5WQkGBv+fTEeQeW9i8xlTs0hm2AmzvhhBG/NRVq0ASdM2pREuYBylkwlkuB2gmKGtmt8dsQ==
X-Received: by 2002:a2e:9845:0:b0:29d:8a1d:35d with SMTP id e5-20020a2e9845000000b0029d8a1d035dmr3757623ljj.46.1679937430103;
        Mon, 27 Mar 2023 10:17:10 -0700 (PDT)
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
Subject: [PATCH v3 3/3] xen/riscv: remove dummy_bss variable
Date: Mon, 27 Mar 2023 20:17:05 +0300
Message-Id: <cd20a2127db8ac0893a1d84a9071d5dd7ba70efe.1679934166.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679934166.git.oleksii.kurochko@gmail.com>
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.39.2


