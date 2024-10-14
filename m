Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2272499C424
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 10:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818524.1231865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpr-0000gt-Cr; Mon, 14 Oct 2024 08:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818524.1231865; Mon, 14 Oct 2024 08:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpr-0000ZN-7D; Mon, 14 Oct 2024 08:53:51 +0000
Received: by outflank-mailman (input) for mailman id 818524;
 Mon, 14 Oct 2024 08:53:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGCd=RK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0Gpp-000862-Qh
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 08:53:49 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d45a0fb5-8a09-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 10:53:49 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so291041266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 01:53:49 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2446sm551817766b.206.2024.10.14.01.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:53:48 -0700 (PDT)
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
X-Inumbo-ID: d45a0fb5-8a09-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728896029; x=1729500829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=S3NzKKMpV40iW4BWaXxT5dxu1M8okJE1cEEPRDmTxjr1s+dzivegcZTtJ6WqTsalF9
         hDy5j9kNEgYTyCTmasb6nkhoBWdJn19WQ+y7X35vaOtXtTkd6DbfF3gUkbSDrCMcMLfX
         VpV+JerDzWQw3TVBxrCVOYlUkDzeW18I7/G48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896029; x=1729500829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R9IwC5Rg/1YFlZU2XC6OhmnY2lp5++tA2yhEvcFGMk=;
        b=FrHgYpbOJxeb4Lx+bimIvb+yhU3aznLQBKFvVOmPWSbvQaqfU7Xa9N9pgtFHF+6+A5
         5fM8+bI761UOQW/T64Ti/kU2zlvRVkM06A94FAwB0cqZhsUXv852gFdads2ehPKsMKKm
         q16XaXDv82b4eTxpmAAi1D+HlDkp+pj4mxUAqCDtWGsKpGaUlEES1mtyVUyRUt2A577U
         9acZmR1a13IFdqgeVixFIP5ppzyrcKvOzVtWoF+kNJOnclZCkmNm7DfLxBhGZXba4pA4
         rG32LCui0LW+KC508GwDl0H5C3yiTo29u+k0mqx2wmLNBp3d+pYQO9yigARwX3cCznBo
         2Mxw==
X-Gm-Message-State: AOJu0YxW6PBxO5aY5NU6y9qxWgY5E0Iu8hJbSRf+rPwQcdMjlVe0fgH+
	KrgOwAMrNCceQhfOpxuGAST49F/niuwO33hLVit2i3/V17DI8x/1FVznrUQgUSGMWn+nJjYPCHI
	2
X-Google-Smtp-Source: AGHT+IGc3uopgrUcXO4DHv75cFKwBrzFVJ3Kwh7nYK4pEV18S6bEUtErDpN+I2e6t4ivAXmmg7nm9A==
X-Received: by 2002:a17:906:6a07:b0:a99:f9fa:5c01 with SMTP id a640c23a62f3a-a99f9fa6707mr463195766b.32.1728896028631;
        Mon, 14 Oct 2024 01:53:48 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 6/6] x86/boot: Clarify comment
Date: Mon, 14 Oct 2024 09:53:32 +0100
Message-Id: <20241014085332.3254546-7-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/reloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e50e161b27..e725cfb6eb 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -65,7 +65,7 @@ typedef struct memctx {
     /*
      * Simple bump allocator.
      *
-     * It starts from the base of the trampoline and allocates downwards.
+     * It starts on top of space reserved for the trampoline and allocates downwards.
      */
     uint32_t ptr;
 } memctx;
-- 
2.34.1


