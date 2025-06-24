Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE88AE5CE6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 08:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023130.1399057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxGT-0004AB-55; Tue, 24 Jun 2025 06:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023130.1399057; Tue, 24 Jun 2025 06:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxGT-00046q-1s; Tue, 24 Jun 2025 06:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1023130;
 Tue, 24 Jun 2025 06:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uTxGR-0003q6-Ma
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 06:36:15 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86e8becf-50c5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 08:36:15 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45310223677so37319385e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 23:36:15 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80f2670sm1076535f8f.49.2025.06.23.23.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 23:36:13 -0700 (PDT)
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
X-Inumbo-ID: 86e8becf-50c5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750746974; x=1751351774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QCeevMLk6yzxVIfNbN3B3ZRcu1Hfw38zoD9YhXS6dA=;
        b=jgCkddqRhahPD7mc2/VOPISexqwMA4MFVj05VhExm9dJ8QpvPpEFXOlSlibKcnJopO
         hVVTfHTqJ5sXcephVevSIxJ+eVPNP1GdMjJxY2X4c65CTik07/f5Ux4pfThSWw4BhyXB
         SObB0BOY435DAamK98irU0nFN8RcsbFYBBFSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750746974; x=1751351774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QCeevMLk6yzxVIfNbN3B3ZRcu1Hfw38zoD9YhXS6dA=;
        b=iNEYcQ1ApVtjIHmixOKCPnb+Du2s9+mJHydEiocObpIKVhezc42MZDla/eWJDd/QNF
         uIqD1Sjd6Aj8fC8XeEcRcUvFFm0FO4Z+Ym010P4gNBImSjFtU78c1yEhnBbbKwMWBYFj
         +qU86rrdhH/nSXVmNYrxBlEjCh5nzU8AaFtJ+Ki1TUDpFxcBHttrxaAJ+guAkOPMp+KE
         Lh732XLhd68Eo5eqLwB/AsYVYLywxHbSYUkAgILpNkWeFEczjYMQDpEgQtWfJEFvSLA9
         obOq8+IN3+IQ0bepfgUeLgoCJe9FVCpxBfQKarfhy889u+B+L+4PIyLIPTQMh58dxVI+
         r6Ug==
X-Gm-Message-State: AOJu0YxIGM1cvJYqXglhUpUnmiua0anOsaor9KhdMnEDXqkgBF+Grm31
	DwnU3QAD33h3jXPexRBQH7rFr4ol1dI8S54MAJ1Noi0QIjAtqd8mSUSEYbuRYQulqI4jRO4KtFx
	GCsG/IiD4Pw==
X-Gm-Gg: ASbGnct6OWF0/+IVTBkuzvD0wSvWWC3zYGMkFIEvurdp8zd7qTQzLJ3sgnxme1wpTlu
	lIJ/yo8UW4JsQen3bGi1bcZrfO9WkYfumpy+qsm2/d3znjQtXkheOJfZwzfKLpvj+aVPrji8BWj
	dhGCiejTkDTrMLaABgqHFnhrPqdl5q4+b/mEiHOzW+BArZq5llEtSA57wxupLFxtXSO+IsLCkvb
	M+oem1wZDp+yANZMJfw6BHVyuYfOUrRFCywLJPYM8f0qdKTW5T0Lqsx65MOe7fZ4WCnBVrIRUur
	nHxsCFYoOFl9ha0Nzjuu/EVTcGSHe4iLQbDAdFIpsxP/7/Ti0Qya7hvoc3Pnr8/rqxMrTUC9RD2
	OhyeMdvWI9far1V8F8bSmZO9b0jXrXQ==
X-Google-Smtp-Source: AGHT+IEePzjjQsOay9KgxV6MpmsYHGc8FdxFVTBdoBSX70CvVUpEDTJyZKj0ZuSb1HzcnNNIZ14uYA==
X-Received: by 2002:a05:600c:528c:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-45373265d1dmr61915025e9.7.1750746974302;
        Mon, 23 Jun 2025 23:36:14 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/efi: Do not undefined not defined macro
Date: Tue, 24 Jun 2025 07:36:08 +0100
Message-ID: <20250624063611.236876-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "buffer" macro is not defined.
It was defined till commit 59e087bf6a9c8ad805294c32dfd7c77068d81eff
(cfr "xen/keyhandler: Drop keyhandler_scratch").

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/efi/boot.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index ded7cc129d..1a9b4e7dae 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -513,7 +513,6 @@ static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_i
     else
         *leaf = buffer;
 #undef BUFFERSIZE
-#undef buffer
 
     return dir_handle;
 }
-- 
2.43.0


