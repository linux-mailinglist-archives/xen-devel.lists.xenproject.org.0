Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE9A9BCF76
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830260.1245238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd3-0003Jv-Ih; Tue, 05 Nov 2024 14:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830260.1245238; Tue, 05 Nov 2024 14:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kd3-0003HX-ER; Tue, 05 Nov 2024 14:33:57 +0000
Received: by outflank-mailman (input) for mailman id 830260;
 Tue, 05 Nov 2024 14:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kd1-0002K5-Ig
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:55 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faffc597-9b82-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:33:53 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c94861ee25so2968683a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:53 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:50 -0800 (PST)
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
X-Inumbo-ID: faffc597-9b82-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZhZmZjNTk3LTliODItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjMzLjI0NjU3MSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817232; x=1731422032; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyqgbdCyqz7WQBq4sAipK7yHeendz1D8ul3qjvP/+g8=;
        b=HAITGYMUSd1lNIcdGPsrzp1k+itdrcqUkACAJWneEGU2TFJZBU/CMnfTOiJ/cJrrij
         JTSRqURZUSRTzNfRmXFlsYf8gecxKBze1d8KTMtIpm8X37lReZbBp3r5xHYgcHl1GCHu
         xFT8R1nxgrwS94imrr8uV/6Vynih48E8iSh0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817232; x=1731422032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyqgbdCyqz7WQBq4sAipK7yHeendz1D8ul3qjvP/+g8=;
        b=eUMdeZcUnqDNUHV/nLZd3jLloNFxCh6OGY5LYiv6lp8MSBOR0gYydVcVtLMLiUScQM
         NUI0fUr0J9SJd+cnrLzeeQbcWt9LKw4HL86tglxTq8vL6v67vBiYDFgKGmtKoFaTythc
         pM6t4Te//0WqvkWtWPQtLFocSk2Ayu0h69Tt2XvB45X2VVbzfpNDAL6gSRQvKG3lJAEW
         iCieZr21ikDaLuB2fbBNA4SWj4KVeSjLCBzq5pm2xrgkOHiT/Dj3DwU/LeGj83A+kZxY
         YAQw4DNPqqx6RgVd3kwEhjzSps4wYvnmHQ22n8O7X85HDhswsNJRr1TRZqCcIrcuxMvW
         eHXg==
X-Gm-Message-State: AOJu0YxZWv8zIUp/CrVWZa9S+pPd5nB0mJBMlsqwDWlP5AkL38H6n43C
	mUSfEAw1Q0BOwzn/9cq9WKToljU3r94Cq/JEUAr93gahGrA4iajLspprgGruWLCuwz1IenhlGNs
	P
X-Google-Smtp-Source: AGHT+IF1jV35urzB96D/9HqoIOs+dpJXaGQ8XIKeUjyC6ubT8ayqoooLczkbqx7hS4HjBq+ce64o4w==
X-Received: by 2002:a05:6402:5c9:b0:5ca:efe:10de with SMTP id 4fb4d7f45d1cf-5ceb9382a40mr18273172a12.30.1730817230969;
        Tue, 05 Nov 2024 06:33:50 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 03/13] x86/hvm: Map/unmap xsave area in hvm_save_cpu_ctxt()
Date: Tue,  5 Nov 2024 14:33:00 +0000
Message-ID: <20241105143310.28301-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * No change
---
 xen/arch/x86/hvm/hvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 018d44a08b6b..c90654697cb1 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -914,11 +914,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 
     if ( v->fpu_initialised )
     {
-        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) !=
-                     sizeof(v->arch.xsave_area->fpu_sse));
-        memcpy(ctxt.fpu_regs, &v->arch.xsave_area->fpu_sse,
-               sizeof(ctxt.fpu_regs));
+        const struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
 
+        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
+        memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
+        VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
         ctxt.flags = XEN_X86_FPU_INITIALISED;
     }
 
-- 
2.47.0


