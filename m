Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7686D6B3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 23:16:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687426.1070865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfog5-0002FI-Vo; Thu, 29 Feb 2024 22:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687426.1070865; Thu, 29 Feb 2024 22:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfog5-0002Cu-Sp; Thu, 29 Feb 2024 22:14:57 +0000
Received: by outflank-mailman (input) for mailman id 687426;
 Thu, 29 Feb 2024 22:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPQN=KG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfog4-0002Co-J2
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 22:14:56 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f71cc6c7-d74f-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 23:14:54 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56648955ac5so2041538a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 14:14:54 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 vo14-20020a170907a80e00b00a44223c2c87sm1077619ejc.30.2024.02.29.14.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 14:14:50 -0800 (PST)
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
X-Inumbo-ID: f71cc6c7-d74f-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709244893; x=1709849693; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YWh8kcKPGDNRrSVVwkO2zWFYbs9veRI7tHYSK9K2FI=;
        b=g/AL2txnnoRcjGy8u3zigktjNZ9JRM7moC27YdX9pgW9uR3mmz2q3d0PLDgMgoc5sl
         pSqfKxSdwAw7xvz9GLxELwN2dioqUYrhe2b0uJzN2kOnZ35XLuw9HtFbk5IfY045D3nZ
         usK2hWuPOHqgLuw7EwE4XrJ6f2O1lr9JybJZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709244893; x=1709849693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YWh8kcKPGDNRrSVVwkO2zWFYbs9veRI7tHYSK9K2FI=;
        b=ANeDZ+tuOhM9YRl3I8yi1VmQ3iS6URnGVR3rz0emuIMKCQawy90IBbczj+J64dxU1g
         UjLp+PZYF0U2cRbmy08pNp+sscgTdhFYbCj8VvKTWvQh2mevHOdRVroGolHesHGpTdZG
         2Itpvv6AKtJ128Hjv93zoRYZflEogpzdUkDBi327GPlwws68N/zMmhazwsSa6ZlZO6Jb
         WNykMV+0FZO9//teVjVb5o0M+ACKZ92znSaTNBsSjYPztF4pcy21zjjDdvHNmUNZOSXJ
         29apzg+lcBVsEMm6ELspOQxuWBrzqFWlNTHBKS8DA9Sh7bQJ3FDTqH8k7HBBRGuF8LIS
         vTMQ==
X-Gm-Message-State: AOJu0YxIAJErr9YM49SEEQcZ/P7ihUrrhlyoNjrP4zqSO73wrvMCSChn
	+vqgfsCuBxDWn5m/2PmtZGZUcC+Cw+sNIiT7/VY//CMTELam2l2RuNht7cVwRK3pWIL6SeMuZJu
	K
X-Google-Smtp-Source: AGHT+IHqGZ/jLWjVRR72h6d0eXydWfJ6YLNQO8K+lurvOfG/OEIFALUm0Va4hpBj9LIyTb9m5mQT2w==
X-Received: by 2002:a17:906:ca46:b0:a3f:2ef9:598a with SMTP id jx6-20020a170906ca4600b00a3f2ef9598amr5284ejb.36.1709244892820;
        Thu, 29 Feb 2024 14:14:52 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpu-policy: Hide x2APIC from PV guests
Date: Thu, 29 Feb 2024 22:14:48 +0000
Message-Id: <20240229221448.2593171-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PV guests can't write to MSR_APIC_BASE (in order to set EXTD), nor can they
access any of the x2APIC MSR range.  Therefore they mustn't see the x2APIC
CPUID bit saying that they can.

Right now, the host x2APIC flag filters into PV guests, meaning that PV guests
generally see x2APIC except on Zen1-and-older AMD systems.

Linux works around this by explicitly hiding the bit itself, and filtering
EXTD out of MSR_APIC_BASE reads.  NetBSD behaves more in the spirit of PV
guests, and entirely ignores the APIC when built as a PV guest.

Change the annotation from !A to !S.  This has a consequence of stripping it
out of both PV featuremasks.  However, as existing guests may have seen the
bit, set it back into the PV Max policy; a VM which saw the bit and is alive
enough to migrate will have ignored it one way or another.

Hiding x2APIC does also change the contents of leaf 0xb, but as the
information is nonsense to begin with, this is likely an improvement on the
status quo.  The blind reporting of APIC_ID = vCPU_ID * 2 isn't interlinked
with the host's topology structure, and the APIC_IDs are useless without an
MADT to start with.  Dom0 is the only PV VM to get an MADT but it's the host
one, meaning the two sets of APIC_IDs are from different address spaces.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Set x2APIC in PV max after applying the featuremask.
 * Drop the hunk for the default policy as it's handled by the A->S transform.
 * Rewrite the commit message.
---
 xen/arch/x86/cpu-policy.c                   | 11 +++++++++--
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 15b49048fd55..c9b32bc17849 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -561,6 +561,14 @@ static void __init calculate_pv_max_policy(void)
     for ( i = 0; i < ARRAY_SIZE(fs); ++i )
         fs[i] &= pv_max_featuremask[i];
 
+    /*
+     * Xen at the time of writing (Feb 2024, 4.19 dev cycle) used to leak the
+     * host x2APIC capability into PV guests, but never supported the guest
+     * trying to turn x2APIC mode on.  Tolerate an incoming VM which saw the
+     * x2APIC CPUID bit and is alive enough to migrate.
+     */
+    __set_bit(X86_FEATURE_X2APIC, fs);
+
     /*
      * If Xen isn't virtualising MSR_SPEC_CTRL for PV guests (functional
      * availability, or admin choice), hide the feature.
@@ -854,11 +862,10 @@ void recalculate_cpuid_policy(struct domain *d)
     }
 
     /*
-     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
+     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
      * affect how to interpret topology information in other cpuid leaves.
      */
     __set_bit(X86_FEATURE_HTT, max_fs);
-    __set_bit(X86_FEATURE_X2APIC, max_fs);
     __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
 
     /*
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 7e184ce0e3f4..0374cec3a2af 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -123,7 +123,7 @@ XEN_CPUFEATURE(PCID,          1*32+17) /*H  Process Context ID */
 XEN_CPUFEATURE(DCA,           1*32+18) /*   Direct Cache Access */
 XEN_CPUFEATURE(SSE4_1,        1*32+19) /*A  Streaming SIMD Extensions 4.1 */
 XEN_CPUFEATURE(SSE4_2,        1*32+20) /*A  Streaming SIMD Extensions 4.2 */
-XEN_CPUFEATURE(X2APIC,        1*32+21) /*!A Extended xAPIC */
+XEN_CPUFEATURE(X2APIC,        1*32+21) /*!S Extended xAPIC */
 XEN_CPUFEATURE(MOVBE,         1*32+22) /*A  movbe instruction */
 XEN_CPUFEATURE(POPCNT,        1*32+23) /*A  POPCNT instruction */
 XEN_CPUFEATURE(TSC_DEADLINE,  1*32+24) /*S  TSC Deadline Timer */
-- 
2.30.2


