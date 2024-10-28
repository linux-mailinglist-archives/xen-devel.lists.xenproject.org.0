Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381709B3558
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826683.1241032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0K-0008SR-G8; Mon, 28 Oct 2024 15:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826683.1241032; Mon, 28 Oct 2024 15:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0K-0008Qw-Ad; Mon, 28 Oct 2024 15:50:04 +0000
Received: by outflank-mailman (input) for mailman id 826683;
 Mon, 28 Oct 2024 15:50:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0I-000874-IH
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:02 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aa7bcf2-9544-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:50:01 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so64668321fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:01 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:00 -0700 (PDT)
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
X-Inumbo-ID: 4aa7bcf2-9544-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130601; x=1730735401; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPLr0d8FwquAzKliN25Vvro3xH1NV3dTjQJhxaKuYlk=;
        b=gg2fIKTVONMRK8myfgOs7owVeKPQ27ZCGdE91TUesEJtkiR1SiIKRuhiA6JvGwCC+t
         oG1tHdzrwSwXGNeiI7HQ9Xx/V9PGL3VM86T7Aq4VFG4znGP51Kj8fLLnn5Ojtn4BZbam
         jUfawQoVqsmEVCBMrTP6bmYQtr1TvEjtfTZBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130601; x=1730735401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPLr0d8FwquAzKliN25Vvro3xH1NV3dTjQJhxaKuYlk=;
        b=hsCU2tBbStOk+vT0f9ivOVa4bNY0aMh1HlkQ18zxVLs2sZvty+1jmisAMxidXOel68
         VaRSx1yzkWn2EGJR0+sPYgdY6aLJWcKdmx/vLIHbze3Q/YlYPcfRZrkg9JciJTC/KReb
         h2H8rjAs9sb14eKEFOkvCl0H4m/qfbYgNGVF3Wv1nteB1aJNYmAKl3SgY5Pvw8KFeO0a
         8yE1DeWLj3rRqK9LXJKssJbuvN6bZ4uvB9LWyf/hafIEcz+1GuMhTUzZaWq26hSMErOm
         r6xZqdKby+l93wgcPRCRpPGzIk4GjGZgFWMzAxD4GwwYnyn8o3OtiCfjlvoQgWajE9Aa
         aGRw==
X-Gm-Message-State: AOJu0Yxff1ThNwvqEzoTzNtaYmyelF5LEGvEchkJrxkAXVTzLJxycIYS
	wX2mbYN49qKYd0aWJJiJ4nC0udcb90AmeJFEmEpJyS31QmHTWoGlGSU/P9Ahjc+aIhsJKEDdRsa
	Z
X-Google-Smtp-Source: AGHT+IFtmzmZV5fwObpGT1d2ilRoYu6/BvAiUMHd9PeBKgHP0k7Y5B9lU5THnhultSOFDHtQezy2ng==
X-Received: by 2002:a2e:2403:0:b0:2fb:357a:be4d with SMTP id 38308e7fff4ca-2fcbe0a35aemr45594251fa.43.1730130600675;
        Mon, 28 Oct 2024 08:50:00 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 01/14] x86/xstate: Update stale assertions in fpu_x{rstor,save}()
Date: Mon, 28 Oct 2024 15:49:19 +0000
Message-ID: <20241028154932.6797-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The asserts' intent was to establish whether the xsave instruction was
usable or not, which at the time was strictly given by the presence of
the xsave area. After edb48e76458b("x86/fpu: Combine fpu_ctxt and
xsave_area in arch_vcpu"), that area is always present a more relevant
assert is that the host supports XSAVE.

Fixes: edb48e76458b("x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu")
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
I'd also be ok with removing the assertions altogether. They serve very
little purpose there after the merge of xsave and fpu_ctxt.
---
 xen/arch/x86/i387.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 83f9b2502bff..375a8274f632 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -24,7 +24,7 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
 {
     bool ok;
 
-    ASSERT(v->arch.xsave_area);
+    ASSERT(cpu_has_xsave);
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
@@ -136,7 +136,7 @@ static inline void fpu_xsave(struct vcpu *v)
     uint64_t mask = vcpu_xsave_mask(v);
 
     ASSERT(mask);
-    ASSERT(v->arch.xsave_area);
+    ASSERT(cpu_has_xsave);
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
-- 
2.47.0


