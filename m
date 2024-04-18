Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC088A9F22
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708494.1107460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU4E-0004Pm-1a; Thu, 18 Apr 2024 15:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708494.1107460; Thu, 18 Apr 2024 15:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU4D-0004Ml-Uc; Thu, 18 Apr 2024 15:52:53 +0000
Received: by outflank-mailman (input) for mailman id 708494;
 Thu, 18 Apr 2024 15:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0X1s=LX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rxU4C-0004M8-Ru
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:52:52 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b57c07c8-fd9b-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 17:52:50 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78f049ddd7dso66867885a.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:52:50 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 z16-20020a0cda90000000b0069b0c9a81b5sm739013qvj.95.2024.04.18.08.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 08:52:49 -0700 (PDT)
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
X-Inumbo-ID: b57c07c8-fd9b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713455569; x=1714060369; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgZJsWC+V6vA1Vlcmi8D5n4+aJM93wZKHXM2K90e014=;
        b=vQnHdTBspBUaoedNZ/VscHpOAiZhpQA6E/+D+ovxuXt8XLBuW1WAsXtjt8eqGgwaNZ
         FJXt50yZ0ROeEZlLPzlf0htP/AkIA4WDE+/UydjbRPf2B5WPqDIf9qo/c7aM8I4hE53L
         3EyekKuvOD0mts0TTqsRL/kRnSeE4BsZn2bII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713455569; x=1714060369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgZJsWC+V6vA1Vlcmi8D5n4+aJM93wZKHXM2K90e014=;
        b=MRmh0JX1s4YhM1ITgfgXRa6fgA2YdrSr8cX5t1TKS90yxkT+1k7XcqWtxY9DI/wpNJ
         7aNUU3pb87thg99QVbg4mRXuyZ34thVKxjxeZ4WtjsA2kOmRLrGifyYm7XpSjBVRlJOy
         Z4/qO/nOvoP7hlzEw1xj6csknziMwKxL5iRMWokjaR/x5tFWPWSCX+4eJUrtY2DrdpVD
         nv9FA8hJ9yG1C1Zd0OjxOUkQvIwkY0z0bVfneh4WSiMr/OBj95beIHL48cX0mQRbgPHT
         eXaubNrIXFUYDgHMmNICOZo8rSpLrLCAnS50djng2LfnoACEQ0uGZlFmuMASD/NKcu60
         6QEA==
X-Gm-Message-State: AOJu0YzrPnpwfhA7UGHs4EAE1dZkOdXEy9TH4PPXt1vufS31SsLJYJSZ
	j6eFDijiw5rNOnotn5HrshawWVEcwID0bGd6UMFl1D24kEwLrdcIBQO1eJbXljAKWOdTUHjtBSE
	+
X-Google-Smtp-Source: AGHT+IG8t9u76ZRwiQqG7tf9z0HVbDVZ/4E4dyvgE+tuzI9ts+dT4kyGtA+gwYNuWQ8uNoyACI8itQ==
X-Received: by 2002:a0c:fca7:0:b0:69b:24f2:c2eb with SMTP id h7-20020a0cfca7000000b0069b24f2c2ebmr3391091qvq.59.1713455569367;
        Thu, 18 Apr 2024 08:52:49 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] x86/spec: fix reporting of BHB clearing usage from guest entry points
Date: Thu, 18 Apr 2024 17:52:07 +0200
Message-ID: <20240418155208.7771-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418155208.7771-1-roger.pau@citrix.com>
References: <20240418155208.7771-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reporting whether the BHB clearing on entry is done for the different domains
types based on cpu_has_bhb_seq is incorrect, as that variable signals whether
there's a BHB clearing sequence selected, but that alone doesn't imply that
such sequence is used from the PV and/or HVM entry points.

Instead use opt_bhb_entry_{pv,hvm} which do signal whether BHB clearing is
performed on entry from PV/HVM.

Fixes: 689ad48ce9cf ('x86/spec-ctrl: Wire up the Native-BHI software sequences')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Also fix usage of cpu_has_bhb_seq when deciding whether to print "None".
---
 xen/arch/x86/spec_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index dd01e30844a1..1e831c1c108e 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -634,7 +634,7 @@ static void __init print_details(enum ind_thunk thunk)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
-            cpu_has_bhb_seq || amd_virt_spec_ctrl ||
+            opt_bhb_entry_hvm || amd_virt_spec_ctrl ||
             opt_eager_fpu || opt_verw_hvm)           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
@@ -643,7 +643,7 @@ static void __init print_details(enum ind_thunk thunk)
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_hvm                              ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
-           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
+           opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
 
 #endif
 #ifdef CONFIG_PV
@@ -651,14 +651,14 @@ static void __init print_details(enum ind_thunk thunk)
            (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
-            cpu_has_bhb_seq ||
+            opt_bhb_entry_pv ||
             opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_pv                               ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
-           cpu_has_bhb_seq                           ? " BHB-entry"     : "");
+           opt_bhb_entry_pv                          ? " BHB-entry"     : "");
 
     printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
            opt_xpti_hwdom ? "enabled" : "disabled",
-- 
2.44.0


