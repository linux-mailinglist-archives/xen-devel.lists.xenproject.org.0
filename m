Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714D841F02
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673242.1047540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC4-00055V-FD; Tue, 30 Jan 2024 09:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673242.1047540; Tue, 30 Jan 2024 09:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkC4-00052T-AU; Tue, 30 Jan 2024 09:14:12 +0000
Received: by outflank-mailman (input) for mailman id 673242;
 Tue, 30 Jan 2024 09:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUkC2-0003rb-Hn
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:14:10 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec992eb0-bf4f-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 10:14:09 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40eacb6067dso50835015e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 01:14:09 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bn7-20020a056000060700b0033946c0f9e7sm10289572wrb.17.2024.01.30.01.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 01:14:07 -0800 (PST)
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
X-Inumbo-ID: ec992eb0-bf4f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706606048; x=1707210848; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+oR8czXs/bOwfRvEg8m8bx8xQuQWdKcdIWuFikFvoM=;
        b=IeWBBMoHt0bjMe5C39T+PHCQC0pZBBBcqyilLAIj72/H1lYNHWqMl6Npeu551nbM49
         WYhoPQi16TevkAT1nfHbm/XCTSv7xrsIvz7wh3l+KXiPnRDh3iZwweHXJnYHQ03fDHRG
         8QSBTSYyLjdmwG926n087H9wDLEDcCpQtMO6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606048; x=1707210848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+oR8czXs/bOwfRvEg8m8bx8xQuQWdKcdIWuFikFvoM=;
        b=cTo2kwzeqgjxQsChDRGAjQd6kjhWauMdFRNPmab5GXk8Qr0NKPHlvPmLOdEIrkBcMo
         XPCjB0Km4ZKOkj2EmfrWWLKWnu26fkpO2+35z2yd9MiYSvCIK0lKrykvdopmBT2EJOOg
         ZBKmdh2YHCybvz+1y5LvBj0oW4DRa00h9RTww8EXU2gsC6fREclsB/JWO6GY0i5aoiVr
         Y8kiP4jWq1s+7JMIQEQAywwrCh6qcriz9o+8Z5EoU8bldxTNHsmqUeLd1NVuk02Ou8GT
         TuRLOYgBuClyQQ2vp2FsEqxVOI3Z/7oeqyOORunoNKabgVyiUraJ8G232j4zT0K8EYNg
         bE4w==
X-Gm-Message-State: AOJu0YwxDQ1giWT6g14TtdRhFWrdGJfstzeZrtRkUWC3jMjDWfJXe0vS
	hmcGQ1e047dEvO5o/vRypjRw4XRxQyWqwysyDv3N6vPwJ49o58cJLcJATbwOkjhcsdA/OUegfDo
	6
X-Google-Smtp-Source: AGHT+IGLO5rXBuj/zg3rp1lzBBGTk1Tt7ulOK5LYlgTh0tPl6x5P5UkASQ219JAQYPmkJ58gS5M7Gg==
X-Received: by 2002:a05:600c:1f83:b0:40e:b1f6:2ed7 with SMTP id je3-20020a05600c1f8300b0040eb1f62ed7mr7606054wmb.32.1706606047683;
        Tue, 30 Jan 2024 01:14:07 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
Date: Tue, 30 Jan 2024 10:13:58 +0100
Message-ID: <20240130091400.50622-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130091400.50622-1-roger.pau@citrix.com>
References: <20240130091400.50622-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
SPEC_CTRL MSR.

Note that those controls are not used by the hypervisor.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c                          | 3 +++
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 xen/tools/gen-cpuid.py                      | 3 ++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index c33dc78cd8f6..d500f87a5fd1 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
     return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
             (ssbd       ? SPEC_CTRL_SSBD       : 0) |
             (psfd       ? SPEC_CTRL_PSFD       : 0) |
+            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
+                                    SPEC_CTRL_IPRED_DIS_S)
+                                 : 0) |
             0);
 }
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index c897c2040136..e586e141c329 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -302,7 +302,7 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory
 
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
-XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
+XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*A  MSR_SPEC_CTRL.IPRED_DIS_* */
 XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
 XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
 XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index df5222a3cdd0..45fab5e75d1c 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -319,7 +319,8 @@ def crunch_numbers(state):
         # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
         # as dependent features simplifies Xen's logic, and prevents the guest
         # from seeing implausible configurations.
-        IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS],
+        IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS,
+                IPRED_CTRL],
         IBRS: [AMD_STIBP, AMD_SSBD, PSFD, AUTO_IBRS,
                IBRS_ALWAYS, IBRS_FAST, IBRS_SAME_MODE],
         IBPB: [IBPB_RET, SBPB, IBPB_BRTYPE],
-- 
2.43.0


