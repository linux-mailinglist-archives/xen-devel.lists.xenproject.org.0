Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7757D7452
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623190.970797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZq-0001FC-KZ; Wed, 25 Oct 2023 19:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623190.970797; Wed, 25 Oct 2023 19:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZq-0001Ce-GA; Wed, 25 Oct 2023 19:30:02 +0000
Received: by outflank-mailman (input) for mailman id 623190;
 Wed, 25 Oct 2023 19:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZp-0000YO-9H
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3990980-736c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:30:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so19301666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:00 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:29:59 -0700 (PDT)
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
X-Inumbo-ID: e3990980-736c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262200; x=1698867000; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AV8cFJRyXmuzAeVTWIZF+6fXtuxkE7JeXBoOk4GQqQ8=;
        b=V/jd0DiPJPJKN3g1eoVykvl5A/YVdmmGz2H3XsZHtWsaMe2Xa5ty2rqPg3k+D0r9ef
         2uaNPhSPcyy7m78YmgwGajYkfyr1uvXcdnTr0aoSCGNvtjFRTbdfpHMwQSRSK6mzkkT0
         3BAnPfdMND2AifhfbuqUzgimLo9kJg13MQA1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262200; x=1698867000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AV8cFJRyXmuzAeVTWIZF+6fXtuxkE7JeXBoOk4GQqQ8=;
        b=uNM+D314ZyHry0IuVEG5icCPDOR6dadA0T3lnsxtUuYyMfDsEFuRBpy+Ardt2XMFTC
         BQVSCU/C1ECGWz6bWxtwqtGULZ51n5ORyxekkbpPLSV3qr9RY18c1aGsT0KpVSGqmujv
         HSu4mZEXYSTZNJ6KUPjmU82vuyDEhZOm1NiCG2ZsFJ3d1nPQfOigTUI78wTGJr+IrwM7
         fpShYJfo5KAyxCXYLeYtH7U6bjMogFsbHwe1P5RHTSpQdh9/cgqEE+NFo9Y+8dQVlLgF
         k7R06Ae1kj4bbTKt+P2lV+SXY1/upL1iPl9eE3VCHT401NcQwP5DsoUBHZ7//ID1J8Mc
         Inkw==
X-Gm-Message-State: AOJu0YxWXIdT8bAJ5t5nhnuued8BaMxu3j2KPDcykx8LPZ0gJQgnnFBX
	b/Bb1UWuhENCsFzP9dr2VbCZkuQ43TJl4NYbdszeqRVp
X-Google-Smtp-Source: AGHT+IFSB91m9XecdFlMZKXJ8BhUA1FJUNNvHyj1W5JVQeJmoQQHkNyOpxuPm6OLRRZhj961GioxLQ==
X-Received: by 2002:a17:906:fe48:b0:9c4:4b20:44a1 with SMTP id wz8-20020a170906fe4800b009c44b2044a1mr12987267ejb.65.1698262200084;
        Wed, 25 Oct 2023 12:30:00 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 03/22] x86/msr: always allow a pinned Dom0 to read any unknown MSR
Date: Wed, 25 Oct 2023 20:29:33 +0100
Message-Id: <4c04e5661688cf1de3e3fd668b0a78b23b6d7b2e.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

This can be useful if you realize you have to inspect the value of an
MSR in production, without having to change into a new Xen first that
handles the MSR.

E.g. SMI count didn't use to be explicitly allowed in the past
(it now is, see a previous commit), but there could be other MSRs that
are useful when tracking down issues.

Backport: 4.15+

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c     | 3 +++
 xen/arch/x86/hvm/vmx/vmx.c     | 3 +++
 xen/arch/x86/pv/emul-priv-op.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 24c417ca71..45f8e1ffd1 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1933,6 +1933,9 @@ static int cf_check svm_msr_read_intercept(
         break;
 
     default:
+        if ( is_hwdom_pinned_vcpu(v) && !rdmsr_safe(msr, *msr_content) )
+            break;
+
         if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
         {
             *msr_content = 0;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1edc7f1e91..f6e5123f66 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3377,6 +3377,9 @@ static int cf_check vmx_msr_read_intercept(
         if ( vmx_read_guest_msr(curr, msr, msr_content) == 0 )
             break;
 
+        if ( is_hwdom_pinned_vcpu(curr) && !rdmsr_safe(msr, *msr_content) )
+            return X86EMUL_OKAY;
+
         if ( is_last_branch_msr(msr) )
         {
             *msr_content = 0;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 0d9f84f458..978ae679a2 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -985,6 +985,9 @@ static int cf_check read_msr(
         }
         /* fall through */
     default:
+        if ( is_hwdom_pinned_vcpu(curr) && !rdmsr_safe(reg, *val) )
+            return X86EMUL_OKAY;
+
         if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
         {
             *val = 0;
-- 
2.41.0


