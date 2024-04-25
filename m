Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2068B1DDA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 11:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711960.1112315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvJq-0004Rk-W3; Thu, 25 Apr 2024 09:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711960.1112315; Thu, 25 Apr 2024 09:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvJq-0004PD-Sl; Thu, 25 Apr 2024 09:23:06 +0000
Received: by outflank-mailman (input) for mailman id 711960;
 Thu, 25 Apr 2024 09:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmW=L6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rzvJp-0004P7-7r
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 09:23:05 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a462913-02e5-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 11:23:03 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-78efd533a00so49078385a.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 02:23:03 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 ay10-20020a05620a178a00b007908917946csm1720792qkb.72.2024.04.25.02.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 02:22:57 -0700 (PDT)
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
X-Inumbo-ID: 6a462913-02e5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714036982; x=1714641782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNFk+B76A2WnLE/OrqFoD6eloYSE1lvTItkDQLMAwRM=;
        b=MWL7a7Y0jHNjV5xIIRP0d9O2v7jb/quYbzzL8VfgbK8n9G/kVTPg8S7zXUYqZC3ird
         9w6l82wZACUGj6N0ccrpfXZnLOBflj+gmo7MBLvqjlhv4T1i/vwJpwwV5naQhxd3Cp57
         ne5nNL3a5P3if+G7Msnb4QO4XhIUgZYfR1ftw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714036982; x=1714641782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNFk+B76A2WnLE/OrqFoD6eloYSE1lvTItkDQLMAwRM=;
        b=JFc4PU4I4JX8SHz/32yZZUAXW1mqOeO6qQ4/PisjXxe9kwLmk7RkXlBLEKL+dg9CbN
         ALqpIAR/rZxetHLUKSwlzuuKVeNhb2hGvZBFkLX6GtQnNa8DlKkcYSRNKcEHyFGpBnEf
         SwVOgtF4ZH7LEvxMSaeS8UbECTtFkcS+V8yGPvX3g/29REzUvJnCcIsEq9gBsDAzATVa
         IpqsOjONorhhtU+m+jhUoTwOeHr3lN91+2uE3l55esnn7WXxnuCZe/BPCCJfqB+ZeiEy
         Tdx/o98tu59CRfw3+K2qRg2bQHdWvJhi4Hdq98K5VhD4YqLatkbGDL3syQATcYL3P/rp
         LbJQ==
X-Gm-Message-State: AOJu0YxJrFyeNS7c6A6umWH0NawZ+SOb5dgWMOOWtyO74looau/v18Gc
	Is5gF1E4jUS4xvxS1fy+F21PtgXdGINWM/8j/grMRA3QIg570T+mTT8YqAPV2bxZe6O2mkBBmav
	+sk0=
X-Google-Smtp-Source: AGHT+IHE2MW85O2XUlIDaetpgcVvlYtDkEpWnA86Jl33ISntG99npi73Fpa+PkqiH8iTXVhAOBGHwQ==
X-Received: by 2002:a05:620a:4485:b0:78e:e9bb:c0ec with SMTP id x5-20020a05620a448500b0078ee9bbc0ecmr7017110qkp.42.1714036977719;
        Thu, 25 Apr 2024 02:22:57 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] svm: Fix MISRA 8.2 violation
Date: Thu, 25 Apr 2024 10:12:49 +0100
Message-Id: <20240425091249.2639809-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Misra 8.2 requires named parameters in prototypes.  Use the name from
the implementaiton.

Fixes 0d19d3aab0 ("svm/nestedsvm: Introduce nested capabilities bit").

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@cloud.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/hvm/nestedhvm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index 0568acb25f..ea2c1bc328 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -83,7 +83,7 @@ static inline bool vvmcx_valid(const struct vcpu *v)
 }
 
 
-void start_nested_svm(struct hvm_function_table *);
-void start_nested_vmx(struct hvm_function_table *);
+void start_nested_svm(struct hvm_function_table *hvm_function_table);
+void start_nested_vmx(struct hvm_function_table *hvm_function_table);
 
 #endif /* _HVM_NESTEDHVM_H */
-- 
2.25.1


