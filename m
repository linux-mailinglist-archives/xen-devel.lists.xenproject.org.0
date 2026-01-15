Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62822D23B63
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:51:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204605.1519232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgK0P-0000JY-KW; Thu, 15 Jan 2026 09:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204605.1519232; Thu, 15 Jan 2026 09:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgK0P-0000HG-HJ; Thu, 15 Jan 2026 09:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1204605;
 Thu, 15 Jan 2026 09:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/TfB=7U=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vgK0N-0000H8-OA
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:51:03 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c898c2-f1f7-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:51:02 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4327555464cso367518f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:51:02 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a650sm4874422f8f.4.2026.01.15.01.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:51:01 -0800 (PST)
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
X-Inumbo-ID: b3c898c2-f1f7-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1768470662; x=1769075462; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJRL9dWZYYSFhfbfgxjey3dNtDOXM5WXHk14eiGhqrU=;
        b=ZwrFxAwn8DelPCuJfDrdaeiWA5Y8E2Cb4WVRcJNgPpg+iZmPGG4iPFjMmS4TdAY70u
         mzk4PDh4I3Z7plsY4qjUZmiU/kSu4Lx+cLicQEGNPvhXaXRiaCaCkKcYsl64asWCh6+q
         lbcfY0gPsvs0S8UJd8VwmCO53YDAQjy+vsZBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470662; x=1769075462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJRL9dWZYYSFhfbfgxjey3dNtDOXM5WXHk14eiGhqrU=;
        b=J5qq8tSCOzAHu/o3qoIN2qwm3XLuwp6aS8f4RJ9f1DdHNNuZMP00pFjWGcXeQpX8Pm
         fR2wQlhcF4pCjO4Ysaw/pH12JkEz4g24BRxCrgqvBM3jKJl9kjmNPdWrJ5hxEjmVzQJX
         JIaNJEh/7uuyn5H8nzQBtE4iC32edqhvxerjHf9ianeBAPuNBW0BoBOcnpZwJUsEYQaS
         jQQu8ZEV0yMMZG2BZK3LvAgYHgADsijPErnzwiglJ+B4zRbGWRDO7rgEZDiUV/FN2ylr
         nw11fHjbTnAUJdlBWfD7Zm76a74rg083YFUt4oIAfwI6Ig6KQTf2wJBv/2vADdwdvDf2
         bxgg==
X-Gm-Message-State: AOJu0YxdlyQamLMyfCHCDzv7jPeL8KslCHE6cm1aIahUx2QvQ+o83N80
	s/TuwSlZwAuoon5/+danIWMScQgtKQc5hrsgXHKD2kE3R7RRFYvzcP5EsAnbQkBJN8B5LiCVT1I
	GTHsL
X-Gm-Gg: AY/fxX5wXLBtNwT/eSTGmfG4x2PIoLPv9Gwge+Rugfqj1dMmrnHBrqORY79AbuDEDq9
	1aFzjbqBulANs7fhHmtGaWIac/fzYRLvZFz4y5rL0MaFutGaKx5f0pLAiIr1y95aiquJWYBA/PA
	CaP3q3poK6ZIgHslS7jNNbYkbsqVraKwwwFy2gw/Rc8es2itOIIIyEmesPPZ0RSS+Y5XyhsySWy
	U/jPrBTr59QrokcpG414e1zhzzqV8ozUEuO7mQ1rNcKFM26PW25NXqXSiDgNZDA+YrfH47q0lqi
	RFvP097MKRB1Tvwk+5jy33guJX4jptITTuEoKEXmZDNODRSTCSzE2IMjZMaBy9hrY+5Qi8t52LG
	7nC9uZfTXcqJXhEOxvXjetINxfU6Ho5Srr8FFF3QyyPUpoX7HZgJ23G8JKflwosLBEKcu59JPdG
	9FUJMzhbmwVzyv9m5dXH6dSp4bg8p9DbQmc1WD0T094BdxE94ZC5d5VCtMB3fDXg==
X-Received: by 2002:a05:6000:1865:b0:431:8f8:7f1e with SMTP id ffacd0b85a97d-4342c548320mr7052654f8f.48.1768470661630;
        Thu, 15 Jan 2026 01:51:01 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/time: Drop unused parameter from soft_rdtsc()
Date: Thu, 15 Jan 2026 09:50:47 +0000
Message-Id: <20260115095047.1201825-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes: a6ed4543222a ("x86/time: pv_soft_rdtsc() is PV-only")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index c970e16152f4..bf3c92d9ee29 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -874,8 +874,7 @@ static uint64_t guest_efer(const struct domain *d)
     return val;
 }
 
-static uint64_t soft_rdtsc(
-    const struct vcpu *v, const struct cpu_user_regs *regs)
+static uint64_t soft_rdtsc(const struct vcpu *v)
 {
     s_time_t old, new, now = get_s_time();
     struct domain *d = v->domain;
@@ -934,7 +933,7 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_IA32_TSC:
-        *val = currd->arch.vtsc ? soft_rdtsc(curr, ctxt->regs) : rdtsc();
+        *val = currd->arch.vtsc ? soft_rdtsc(curr) : rdtsc();
         return X86EMUL_OKAY;
 
     case MSR_EFER:
-- 
2.39.5


