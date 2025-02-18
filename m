Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C8A3A022
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891731.1300785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOlF-0001xG-JZ; Tue, 18 Feb 2025 14:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891731.1300785; Tue, 18 Feb 2025 14:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOlF-0001un-Fz; Tue, 18 Feb 2025 14:39:45 +0000
Received: by outflank-mailman (input) for mailman id 891731;
 Tue, 18 Feb 2025 14:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6eQ=VJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkOlD-0001uS-CD
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:39:43 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 309b8f9d-ee06-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 15:39:42 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f325ddbc2so2701451f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 06:39:42 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f771dsm15014318f8f.81.2025.02.18.06.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:39:41 -0800 (PST)
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
X-Inumbo-ID: 309b8f9d-ee06-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739889582; x=1740494382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yru+sjmSJ302ywgbFqZJaJTPd2E0qtSFc5YX3HWppXA=;
        b=uvuaXY02zJU+F69AGJNSpcdkTE6c68iZG//J+iqWmzmgMYbwLaI2sBHx6nH6kfdEs+
         n6dJrbTfiVPbbW1c3cEdR87ChK5J5iA+5o4ihpyBkde5wfHb9vY73DpGkeZdPPOajaEH
         2Du/V5AzJpUdcC0tBt4WNXFJT3xjfu0LV/wPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889582; x=1740494382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yru+sjmSJ302ywgbFqZJaJTPd2E0qtSFc5YX3HWppXA=;
        b=iz1ioL6Llsi6m3n2WZG9yigdtDwhSVCM5a5W0Rm3TVDJw1Ltlh2TGyCL5DJWY2Osh0
         vzx2bIaZKjDRUgmd4jT17T8j/owEgWTIlKs7Sbya0exVgwZ/6UhgSu/a+5AbKKP7O4bg
         0YDk+pDKC/23/r2TMWvOh4boE7km5GMD6GdnUvKqLe2NAZql5Sea2rLmk7v4Pc+E7wPE
         DoxiaRhqQ2hmKTRljPMyAqh7S0PmLj+F0MNtmKA4k9pf0/s+FOHgomkW7BOm/lFv1fuN
         h5WGiXWKXs1mqs8Ji94/u0CCoFr8yrKKHE+iIadjhgsTLeXkp03zepPOhNfUn0Zdb5Yl
         MZsg==
X-Gm-Message-State: AOJu0YxgKtuCW0+8stFpytkIB2VFhFDnektcVzuIC2cYuI1hmr8h/kT+
	LeKeDP+QN/p1NWOSfs9JuifJNzag9j4ulfIBqS/iPOtYRCrDGXqJEeUAAQnYQuGKJKBGZLQdQtn
	n
X-Gm-Gg: ASbGncsw/bYyBNSDbCOoB1u47nAONVfQICTqDVwDlDxpCgNh6gLWee38bHDPNYvja7U
	DA4zgQCi72MWwo6vG/a1oxYMRC/JxEDfBVgVkeStPxdJSudNJy8vgktLjrd3nCVdWmojz8wj+la
	UmOeclDBQlBITEOl5CpSNydoxDol+Nq90xWIvWaVMtR0mwwjNdo6hB8N+hoiNDQxmMCMzsm8so3
	EofrGoqAW40wGv+1FHCrP8R/3Zo+LpVg/5eXODZICGGvB91/T14pDPPxEdrxfcQ5AAzhX2+meDs
	NZs1JFQ0WdaNgnJECMDc/R1TzMEOzuI0KHvmITXaisCiN7C+rbCAMviT/ge/vHAKnEb9wdw=
X-Google-Smtp-Source: AGHT+IHo663xprWKWWEZV41hVIx9OjeJkdnWMku00pu99sWeEpZ3/cDN/7am+xdInZU/3wnBBKU3Cg==
X-Received: by 2002:adf:ef46:0:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-38f33f39223mr8904837f8f.17.1739889581749;
        Tue, 18 Feb 2025 06:39:41 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/svm: Separate STI and VMRUN instructions in svm_asm_do_resume()
Date: Tue, 18 Feb 2025 14:37:39 +0000
Message-Id: <20250218143739.623451-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217161241.537168-1-andrew.cooper3@citrix.com>
References: <20250217161241.537168-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a corner case in the VMRUN instruction where its INTR_SHADOW state
leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
example of this could be taking #NPF due to event injection.

Xen can safely execute STI anywhere between CLGI and VMRUN, as CLGI blocks
external interrupts too.  However, an exception (while fatal) will appear to
be in an irqs-on region (as GIF isn't considered), so position the STI after
the speculation actions but prior to the GPR pops.

Link: https://lore.kernel.org/all/CADH9ctBs1YPmE4aCfGPNBwA10cA8RuAk2gO7542DjMZgs4uzJQ@mail.gmail.com/
Fixes: 66b245d9eaeb ("SVM: limit GIF=0 region")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
 * Move after the speculation actions.

Emailed out just for completeness.  I've queued it in my for-4.21 branch.
---
 xen/arch/x86/hvm/svm/entry.S | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 6fd9652c04a1..91edb3345938 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -74,6 +74,14 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         ALTERNATIVE "", DO_SPEC_CTRL_DIV, X86_FEATURE_SC_DIV
 
+        /*
+         * Set EFLAGS.IF after CLGI covers us from real interrupts, but not
+         * immediately prior to VMRUN.  The VMRUN instruction leaks it's
+         * INTR_SHADOW into guest state if a VMExit occurs before VMRUN
+         * completes (e.g. taking #NPF during event injecting.)
+         */
+        sti
+
         pop  %r15
         pop  %r14
         pop  %r13
@@ -91,7 +99,6 @@ __UNLIKELY_END(nsvm_hap)
         pop  %rsi
         pop  %rdi
 
-        sti
         vmrun
 
         SAVE_ALL

base-commit: 81f8b1dd9407e4a3d9dc058b7fbbc591168649ad
prerequisite-patch-id: 838271a62e35fbc5b6696a9d331ba09fd1b54328
prerequisite-patch-id: e597e6f0f303962d4829ab0b8601daa5db15a9e6
prerequisite-patch-id: 2d19885bdacc98098fc44caf68fcd25ac1f19596
-- 
2.39.5


