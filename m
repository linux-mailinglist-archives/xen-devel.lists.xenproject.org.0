Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5619B6066
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828041.1242838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66Bm-0000uD-Hk; Wed, 30 Oct 2024 10:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828041.1242838; Wed, 30 Oct 2024 10:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66Bm-0000rx-DY; Wed, 30 Oct 2024 10:44:34 +0000
Received: by outflank-mailman (input) for mailman id 828041;
 Wed, 30 Oct 2024 10:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXHf=R2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t66Bl-0000rj-3e
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:44:33 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0120920-96ab-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 11:44:28 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5cbb6166c06so6231675a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:44:28 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629f3c8sm4674107a12.37.2024.10.30.03.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 03:44:27 -0700 (PDT)
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
X-Inumbo-ID: f0120920-96ab-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYwMTIwOTIwLTk2YWItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg1MDY4LjQ3NDc3OCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730285068; x=1730889868; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KsbfI1/ckGtkeMcdcR9rQRj5pZNXNSVLvvG6C1Ohs1U=;
        b=OetU9WwIBtMjwt6Z/G6bLzNzZYJzUBbV0s+yjq6DXKOq1TMG5M7DQKwBzufq/Z4E4I
         6rJCuVGvcTHDkAwoD/7IsFtPncEN4pW39nLAakBJI6nEQsX/vwucKKTocxLNMtPhcFDY
         N6Z6wqaFZj6t46vE47YFWZcel6R27sI6wbtAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730285068; x=1730889868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsbfI1/ckGtkeMcdcR9rQRj5pZNXNSVLvvG6C1Ohs1U=;
        b=PCgK+XRK6tiiImkc0pbD8sv64GZWYJ4SuFryTzGw0u7kAc0djV9vg3Y6v54fD2Ia7H
         S7fUfFAcl8tRjGG5RILIcvAhHyNL5Gt49HJQocWlqWtiNAsRmVvi6+N27GJMz4dr2pGw
         payc3C30blEAD9mOtUf94L5PzBgY5kttxohdBfta0PFDX+8RECdQhecj9Oic/DRV+brA
         dv3TuPrT9AbE4Y7qMDXTvK7dTwUN0ZAHmQFnra0BxeyzraCHEig0TfdgcbDUjuEF5zRH
         RZvRHDjxr3cLTBHf8eM4ieiky3m4GXlpgQVKDE/FhW1n/2V9lNkRFDIAcca6H2S3msGH
         biZQ==
X-Gm-Message-State: AOJu0YxAy/Pw+bvSusrRP+U+MaJRUfI1mo+SScNRNqDx9JnrqimpRUzy
	3+Sny6Pmz58ulltHOeyJLtS8TBzmI+CpemaWR/HgLHh3MvNOyVgOyRRA2AGYbQ0vBRwrz2Y6nG+
	l
X-Google-Smtp-Source: AGHT+IFu/i5m/dxLXhDcCGrhE0vLX8905Cqul3JnecwbrOAuqtCDdHGwicomn1OQ38afXAWnGcSprQ==
X-Received: by 2002:a05:6402:4407:b0:5c9:74e3:acbb with SMTP id 4fb4d7f45d1cf-5cbbf8a2109mr13108106a12.10.1730285067454;
        Wed, 30 Oct 2024 03:44:27 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/setup: Make setup.h header self contained
Date: Wed, 30 Oct 2024 10:44:05 +0000
Message-Id: <20241030104406.2173357-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header uses rangeset structure typedef which definition
is not included.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/setup.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 4874ee8936..e4e96b36bd 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -2,6 +2,7 @@
 #define __X86_SETUP_H_
 
 #include <xen/multiboot.h>
+#include <xen/rangeset.h>
 #include <asm/numa.h>
 
 extern const char __2M_text_start[], __2M_text_end[];
-- 
2.34.1


