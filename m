Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B669495B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494612.764794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHU-0002qw-GZ; Mon, 13 Feb 2023 14:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494612.764794; Mon, 13 Feb 2023 14:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHU-0002mt-7K; Mon, 13 Feb 2023 14:58:12 +0000
Received: by outflank-mailman (input) for mailman id 494612;
 Mon, 13 Feb 2023 14:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHS-00012P-K0
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:10 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d22d39-abae-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:58:10 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id dz21so1248919edb.13
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:10 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:09 -0800 (PST)
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
X-Inumbo-ID: d4d22d39-abae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTOuRMzovcu9U8yHdgtcg1aC/lNK90HeqMCP2DHSHtQ=;
        b=Uhk4AJdyUbsybuROvfNH7szECAyg6hEOSh/H07XBFIwbnYN6q6PxvBa6FQiCoot/MO
         VEM/q9LQtmW6uhQeHAALxuWc1w0fBsOCEWYU8iiZu1/gs4jaR5bVl7XfxnG1E2S1RM8/
         Xg1BYvAS1CxV9tITTRaWtGZHy8C2GSRTu4ILaTWIPQmbbo5JTggo++dWJOemx72etxTK
         jRTKnaL5+1UOXBbTVD+fqN2tgUhz4VM8PT0HYp2pv9LBwq76+wYnSdUOLm/zgDVjyBEK
         Pm3DtKO6QhdHT8hRlNhYYfbGwgQDlMuDCwe/zZAM9SSs2f8GgpPQhi4lZssgPqJDI4LA
         fkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTOuRMzovcu9U8yHdgtcg1aC/lNK90HeqMCP2DHSHtQ=;
        b=hcYQiLXBz/aSBMpeFmWsXAuioN2ld5NvMiYM4pHnweI5ForoKDGyk0KoNijajFJ3UC
         bN3BzlBBxzjd9s56J/3msGGtrljiA2057Q8912Hs0/uPDNZxJdaEUSl7Ewp+X33MKEZo
         4PC/mhTidy4M2H12hH0NYuCWbYMXYcWA+KhDpNoHAbIsuBq3NQEmiAlvZ9cnagvEFHLT
         XVUMGMh7yxrrB17gcG+d6fbBwPqk7+dB6SM342On3znb3yUoiThtgBnpliSU4FUlQG1w
         qOrvUxphyuCUrIPgOR2oZHn+Xny/tG7o5RG4K1yzC+SVyaMtZEovarJ/3fazbg36ojuR
         UTQg==
X-Gm-Message-State: AO0yUKX934p0U1V73HdMvLHkEeIgplpwVi2pXzAjyPmTsDW9qtdQVZ0G
	0UfnSvYNVYOvB0n3yNZDRuEGWY15hGA=
X-Google-Smtp-Source: AK7set9hXBu2M70GkVjxBxm3e15BzI8avJlnuyZR2dQq6aszC7C4QNGHdcTvn/vrdCT7HnC9og3zOQ==
X-Received: by 2002:a50:d69b:0:b0:4ac:b866:7ebb with SMTP id r27-20020a50d69b000000b004acb8667ebbmr7971508edi.9.1676300289730;
        Mon, 13 Feb 2023 06:58:09 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 07/10] x86/oprofile: guard svm specific symbols with AMD_SVM
Date: Mon, 13 Feb 2023 16:57:48 +0200
Message-Id: <20230213145751.1047236-8-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The symbol svm_stgi_label is AMD-V specific so guard its usage in common code
with AMD_SVM.

Since AMD_SVM depends on HVM, it can be used alone.
Also, use #ifdef instead of #if.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/oprofile/op_model_athlon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
index 69fd3fcc86..782fa606ee 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -320,7 +320,7 @@ static int cf_check athlon_check_ctrs(
 	struct vcpu *v = current;
 	unsigned int const nr_ctrs = model->num_counters;
 
-#if CONFIG_HVM
+#ifdef CONFIG_AMD_SVM
 	struct cpu_user_regs *guest_regs = guest_cpu_user_regs();
 
 	if (!guest_mode(regs) &&
-- 
2.37.2


