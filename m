Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E669F3D2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499397.770524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnY-0000Ww-4r; Wed, 22 Feb 2023 12:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499397.770524; Wed, 22 Feb 2023 12:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnY-0000Uz-1X; Wed, 22 Feb 2023 12:00:36 +0000
Received: by outflank-mailman (input) for mailman id 499397;
 Wed, 22 Feb 2023 12:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnW-0000FF-Fu
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:34 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82e0f6a4-b2a8-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:00:34 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id b12so29314480edd.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:34 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:33 -0800 (PST)
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
X-Inumbo-ID: 82e0f6a4-b2a8-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doY9xB02Xms2D/8hQa289Ytj+RDMjA/uK7oMTVWbZgo=;
        b=U01QLToEtjBNMZh9WqRp9v+HSVHnkWs+YwojM6x6vSUy6QnYLBIaUFYT6/TpGwGKD2
         F7bifHF+YvytZcMjjsv2loVKnPQHL1jFrRC4zN7eWGfDyJRL30yzBFmJ3S7pybshAAye
         65TbBN6PMQ1G+vBKN8q6+2VQ7hI6BaTLSND0sGiI1OSBKlqq1kHY9GkdiiveDQnErCmw
         4HUyZ506GrbMIKSyMj8J8FpqXL7eZ/r3ow6pMJiK1CqqD5rl5nSjcSs133F7KSEpHee4
         6WIZB6iL5wju/lTCdcn+50FtVEXcT7LvezOjLdgKmF+pbZiO/WPFVdMfkQ7G1Xmc9aDg
         GmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doY9xB02Xms2D/8hQa289Ytj+RDMjA/uK7oMTVWbZgo=;
        b=7mZYGS4XKwjQjFA7Zkuz4OqfNWf1v5wnKSdSlTBHlp9BsqfRuqpikGheETc8Zc0Dss
         v4zUaMN9kBGDpkf7pOwsT9oAAvuVj6po/GimlOid5f7WiB5HEaxj7fYfUL/SfMHLZrgG
         j4kHkA4HyqtC+zkuMfW3u4J+uKlEBxBtOnDoJ1XczHc3817yie6oZnJW1VHxKXx8PtQA
         DJ8QEqJs7DKeylx5wmASFYRYY4PylhAliMkPTwuLUXc8UURemQGzOQeD+cp69knysPCX
         J8qZjgkIoJ596ILwPjX6Kjpk5xAplCiItDnid/rXhNsVdbhNFdKMZTYesqkiLdBuCoTA
         mviQ==
X-Gm-Message-State: AO0yUKX+mHHwWwtTZX0x9Qj0JOqG/NXz0fBaktvMFBKeI7qqN3vLVX5q
	+fd04BBncOnorLT45UP7xfQeH8XClgc=
X-Google-Smtp-Source: AK7set9bqpqNZCoEv9JQGLkQyFa19l0Q5ZONZVxe7iSweBiYxtsg1iScHoerVH7dvrHpSHxmAUhmVg==
X-Received: by 2002:a17:906:f0d1:b0:8b1:3009:536b with SMTP id dk17-20020a170906f0d100b008b13009536bmr14613232ejb.29.1677067233378;
        Wed, 22 Feb 2023 04:00:33 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/9] x86/svm: opencode SVM_PAUSE{FILTER,THRESH}_INIT
Date: Wed, 22 Feb 2023 14:00:16 +0200
Message-Id: <20230222120023.3004624-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete the macros SVM_PAUSE{FILTER,THRESH}_INIT from svm.h and opencode
their values, since they are used in a single place and using macros is
just unnecessary obfuscation.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - opencode instead of moving the macros in vmcs.c, suggested by Andrew

 xen/arch/x86/hvm/svm/vmcb.c            | 4 ++--
 xen/arch/x86/include/asm/hvm/svm/svm.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 305d4767e3..ba93375e87 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -169,11 +169,11 @@ static int construct_vmcb(struct vcpu *v)
 
     if ( cpu_has_pause_filter )
     {
-        vmcb->_pause_filter_count = SVM_PAUSEFILTER_INIT;
+        vmcb->_pause_filter_count = 4000;
         vmcb->_general1_intercepts |= GENERAL1_INTERCEPT_PAUSE;
 
         if ( cpu_has_pause_thresh )
-            vmcb->_pause_filter_thresh = SVM_PAUSETHRESH_INIT;
+            vmcb->_pause_filter_thresh = 1000;
     }
 
     /*
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index fa39d4d76a..c62d0caa32 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -95,9 +95,6 @@ extern u32 svm_feature_flags;
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
 
-#define SVM_PAUSEFILTER_INIT    4000
-#define SVM_PAUSETHRESH_INIT    1000
-
 /* TSC rate */
 #define DEFAULT_TSC_RATIO       0x0000000100000000ULL
 #define TSC_RATIO_RSVD_BITS     0xffffff0000000000ULL
-- 
2.37.2


