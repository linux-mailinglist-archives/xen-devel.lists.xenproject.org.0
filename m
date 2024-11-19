Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5F9D3031
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 22:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840830.1256358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDWF2-0001mt-Uk; Tue, 19 Nov 2024 21:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840830.1256358; Tue, 19 Nov 2024 21:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDWF2-0001kX-Rv; Tue, 19 Nov 2024 21:58:36 +0000
Received: by outflank-mailman (input) for mailman id 840830;
 Tue, 19 Nov 2024 21:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDWF1-0001j1-6J
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 21:58:35 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a2adf61-a6c1-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 22:58:31 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cf9ef18ae9so438815a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 13:58:31 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4b9357088sm257347366b.23.2024.11.19.13.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 13:58:29 -0800 (PST)
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
X-Inumbo-ID: 6a2adf61-a6c1-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZhMmFkZjYxLWE2YzEtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDUzNTExLjQzMzM3Mywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732053510; x=1732658310; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4Tx40p/pcQzp9i9bKe4qDKeOuzdAJlJfoFrtC7E+UY=;
        b=pxmtX3FNwVR07DuuA/Mg9qTQST3WDa+GN5Pvdp4JF0LAp2VqJSHutg/6cb5VL+Gb30
         kwImlM8Pl2j7Z5KhLcmMucuoTOi56eOXjRITg/kHF6zXkldl6wlGVlEpJT9nTuhq4BlA
         VU/EddOPltrPOr++v8jC1NRFB/R/Rd0RV+Qro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732053510; x=1732658310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4Tx40p/pcQzp9i9bKe4qDKeOuzdAJlJfoFrtC7E+UY=;
        b=IH8SCyRdP+cZMsJNAre0pJoXhENwTwfpgVfdtkyqhzb14uqKS3cgnLCDmzRXY3jtqc
         KF4/d+QfVXtpg3Byhp69AKfPgel/UOdno/DM9qnFOQ+8RedpkaNptSSFQbHEiyvPzvYC
         Ad6w4xq7r+7kF17dDvn1GOC6rizHBlbWd7nTV6ATTKloUFqaWrQm1mjDXhqx6qKBNbYQ
         Bh8lnC2DdgCrO196LcNNSV1qDQDbjHTBYi60nAn8WYLtG8dpjq5ONsRmrc+GZNT1DBQk
         6pJ3OcoOKK/jg7MxRUrf1Oz+D4esZK6yi6ywuk8WvfwYM1usil75yWnBXaiWI3ruSKZn
         T39Q==
X-Gm-Message-State: AOJu0YxftQfxchlZDhE29JC9WsvCSQJwGcQKYA/0F6NS8PWbJg6qGO4n
	0otC6bvWzLa676GypLS8ftNm63ryQKBlBxZFD62f0WKehlD07ED6InGbWcA41/FE+tyjHZ366qa
	N
X-Google-Smtp-Source: AGHT+IG4Lp1bXImRAxW8kuCUc3FPutR9gAMOMnEhrrNflgK5ZvBxgTWjJtLjSTLIIGIWZhZKruAkeg==
X-Received: by 2002:a17:907:3f10:b0:a99:4045:c88a with SMTP id a640c23a62f3a-aa4dc4f9cfcmr66146866b.0.1732053509841;
        Tue, 19 Nov 2024 13:58:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ucode: Only rescan features on successful microcode load
Date: Tue, 19 Nov 2024 21:58:27 +0000
Message-Id: <20241119215827.2891332-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no point rescanning if we didn't load something new.  Take the
opportunity to make the comment a bit more concise.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 4811b5ffb11c..2bf462bf0c2e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -860,6 +860,10 @@ static int __init early_microcode_load(struct boot_info *bi)
 
     rc = ucode_ops.apply_microcode(patch, 0);
 
+    if ( rc == 0 )
+        /* Rescan CPUID/MSR features, which may have changed after a load. */
+        early_cpu_init(false);
+
  unmap:
     bootstrap_unmap();
 
@@ -911,14 +915,5 @@ int __init early_microcode_init(struct boot_info *bi)
 
     rc = early_microcode_load(bi);
 
-    /*
-     * Some CPUID leaves and MSRs are only present after microcode updates
-     * on some processors. We take the chance here to make sure what little
-     * state we have already probed is re-probed in order to ensure we do
-     * not use stale values. tsx_init() in particular needs to have up to
-     * date MSR_ARCH_CAPS.
-     */
-    early_cpu_init(false);
-
     return rc;
 }
-- 
2.39.5


