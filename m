Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054D0694951
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494606.764733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHM-0001Ka-6n; Mon, 13 Feb 2023 14:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494606.764733; Mon, 13 Feb 2023 14:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHM-0001IT-2Y; Mon, 13 Feb 2023 14:58:04 +0000
Received: by outflank-mailman (input) for mailman id 494606;
 Mon, 13 Feb 2023 14:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHK-00012P-2K
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:02 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfae58e8-abae-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 15:58:01 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id bt8so7469884edb.12
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:01 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:00 -0800 (PST)
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
X-Inumbo-ID: cfae58e8-abae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeAl2muVNr+xBWeBNqW6dkb9Qt1VF+mqagJ51IbAAUY=;
        b=glvTuglrnCswKeleHOErx9yowMgXTUBT9C0pWMfJ/xQX5AgnDJtZgE5M0GiQlOt1qL
         7HrGCJUw2pmCiV1UpKPIFD4kW3mOpkCzXx/kmSy61ZtBvCLXO2Dj4xXWzzOb1x/I0bq4
         qCX/6njhrE2hX23krceYh9+3FND6fh4co0mo2AfpEimXAayLXuK+wUtLl11yTgTcxoIS
         eRrEEOTBFQHHT4aLCATyl856hBfV5+8tqyzW5idxN2rLC6qoPLJvW305aodrUVr+AbSC
         UhgAqQRRKzC5s84GZXENX290OPo13cGrxnf95aPgUGZzRaax8fwTX1RCLpKceP2/g8FK
         aRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeAl2muVNr+xBWeBNqW6dkb9Qt1VF+mqagJ51IbAAUY=;
        b=V4DF7OKx+8wL8p1GrbTLeRRTeIvULoUQfgxb4GtHKbCmZzdMjuV8ZexS+NqdzlXODH
         qbYkgKT09XlCPUJ/avPnfhKMGkz4fZPqsKv4I34Y3bmKP6mWiqMLSJQMFW+gX/l0EcQG
         hjxhCzws3BaHdcLG6YNulRn4jO04lJrSbVXWkcI9Z9B4EEQJ7yeG/3gmBtM6fzLsoIHK
         YPHluiEPGrGCF4T+5zGsp0jEaK+3VZTV6q9oYCL2Fz/+mZ3QDJ82YsnkzSv8bctx1Sjq
         cAYrlGVPw3tGHK3gMJEAwc3TuqfUo0NF+tU4/HYgdELychHjPL2dHSQIMh5P55FFwyoM
         CFxA==
X-Gm-Message-State: AO0yUKV1fKi2UPHz6Kc539VszsfqFnX60auqy5trzZRqCkXe+m3HFGvK
	wR404Sa+6kRu9TgiXXScDIsbZhHjviU=
X-Google-Smtp-Source: AK7set9hI4WpTfinHmniGiBvx5mghdRr9a8iXiXXdwGMfGT7ZIOCMmJGN5cjSMJAOKkywpOEaF9zpw==
X-Received: by 2002:a50:9ea2:0:b0:4ac:bbaa:867a with SMTP id a31-20020a509ea2000000b004acbbaa867amr7556802edf.24.1676300281111;
        Mon, 13 Feb 2023 06:58:01 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 02/10] x86/hvm: separate AMD-V and Intel VT-x hvm_function_table initializers
Date: Mon, 13 Feb 2023 16:57:43 +0200
Message-Id: <20230213145751.1047236-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since start_svm() is AMD-V specific while start_vmx() is Intel VT-x specific,
need to be guarded with AMD_SVM and INTEL_VMX, respectively.
Instead of adding #ifdef guards around the function calls, implement them as
static inline null-returning functions when the respective technology is not
enabled.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/include/asm/hvm/hvm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 43d3fc2498..353e48f4e3 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -261,8 +261,16 @@ extern struct hvm_function_table hvm_funcs;
 extern bool_t hvm_enabled;
 extern s8 hvm_port80_allowed;
 
+#ifdef CONFIG_AMD_SVM
 extern const struct hvm_function_table *start_svm(void);
+#else
+static inline const struct hvm_function_table *start_svm(void) { return NULL; }
+#endif
+#ifdef CONFIG_INTEL_VMX
 extern const struct hvm_function_table *start_vmx(void);
+#else
+static inline const struct hvm_function_table *start_vmx(void) { return NULL; }
+#endif
 
 int hvm_domain_initialise(struct domain *d,
                           const struct xen_domctl_createdomain *config);
-- 
2.37.2


