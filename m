Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373D694952
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494610.764777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHR-0002SY-Me; Mon, 13 Feb 2023 14:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494610.764777; Mon, 13 Feb 2023 14:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHR-0002OT-IB; Mon, 13 Feb 2023 14:58:09 +0000
Received: by outflank-mailman (input) for mailman id 494610;
 Mon, 13 Feb 2023 14:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHP-00012P-AL
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2d8dd28-abae-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:58:07 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id cq19so10543156edb.5
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:06 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:06 -0800 (PST)
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
X-Inumbo-ID: d2d8dd28-abae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5v/N22n2LqrdW7DqMvxVswsNGoZiD6T9tF2GDu61pk=;
        b=idPIyCoiAFOpr5KMigzgO35lMseihPsh34sqaciuVp5Ygz9GLa7eWZonWDYfOCrxAB
         re2+zBMqX9MiMvnygNeaBpZEzON46mN3PH1gZ6OxBrf+QhyHdaS68SRvmlYgXx1j3P8x
         r49v//ABzPD4Pg/N50IMvXwTocp7/nlHqFR6KGf7ymZ4aANcKw6pSnzkLs4liqLTW97/
         MEtHTz0R+nvbw5NeNPVAobkgLQbsLh0NOUR6g92dk56bJriOT4PUpzTtb8j8lMbAm62E
         kkaUxlxtd+/c287k5fzOj6VepT8YAlGGsUZBA1SD5Nu8gBrKV28rMcnUJdTTUTe3QI9O
         VPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5v/N22n2LqrdW7DqMvxVswsNGoZiD6T9tF2GDu61pk=;
        b=sJM2SfcY7fj1CDlPTI2slfuoGfU9HBiBJzhtOQnTClF+8kpTuQ/DobKRHVF04JDjph
         yxooVRbk2fxq1f/LDzYOpNKvDBLpsQXAsrwaQCTb1o82FxwiqR8YaUGEEOeAsD6Qj5TI
         A1g0W5pIQi12dffY/gbxT2VUM6kLxlocvIRSJkJwAzXXBKdCgPIbbswrx393E3FVZ5QD
         1v7NawJSmqQIcjfK7suHIW2JUi1M7gPOjAI1iyDuLfZmSFVMTqf/o1vGBYtgIz0DVIZ1
         CQr+u4Jjih1K1zQ22rTzaUm2oZfxDuCsQNFd82urZqkZYgVqrdbMfgMZO6Tp9BTK2Ul8
         o80g==
X-Gm-Message-State: AO0yUKXeoBgOHRFrmSIEVfj7GIiTLWjp7sEFGTkFBanOV/xk73bFCLX+
	I0cuGqulNUerPoTy6BbE1hbPvIHYkUQ=
X-Google-Smtp-Source: AK7set+oN4N2dbUMeM0v4BVjErq8kcyFD7IfbCxSH+ypx9T+wfJHOSIhZukL+SrLDTQe0dn6y3ij+Q==
X-Received: by 2002:a50:cd48:0:b0:47e:eaae:9a69 with SMTP id d8-20020a50cd48000000b0047eeaae9a69mr25788468edj.41.1676300286331;
        Mon, 13 Feb 2023 06:58:06 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 05/10] x86/traps: guard vmx specific functions with INTEL_VMX
Date: Mon, 13 Feb 2023 16:57:46 +0200
Message-Id: <20230213145751.1047236-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions vmx_vmcs_enter() and vmx_vmcs_exit() are VT-x specific.
Guard their calls with INTEL_VMX.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/traps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8..77b4f772f2 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -694,7 +694,7 @@ void vcpu_show_execution_state(struct vcpu *v)
 
     vcpu_pause(v); /* acceptably dangerous */
 
-#ifdef CONFIG_HVM
+#ifdef CONFIG_INTEL_VMX
     /*
      * For VMX special care is needed: Reading some of the register state will
      * require VMCS accesses. Engaging foreign VMCSes involves acquiring of a
@@ -732,7 +732,7 @@ void vcpu_show_execution_state(struct vcpu *v)
         console_unlock_recursive_irqrestore(flags);
     }
 
-#ifdef CONFIG_HVM
+#ifdef CONFIG_INTEL_VMX
     if ( cpu_has_vmx && is_hvm_vcpu(v) )
         vmx_vmcs_exit(v);
 #endif
-- 
2.37.2


