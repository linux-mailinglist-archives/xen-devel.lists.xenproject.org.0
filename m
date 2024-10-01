Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A498BC44
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808067.1219870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9D-0003Ck-Vw; Tue, 01 Oct 2024 12:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808067.1219870; Tue, 01 Oct 2024 12:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9D-0003A5-Sg; Tue, 01 Oct 2024 12:38:35 +0000
Received: by outflank-mailman (input) for mailman id 808067;
 Tue, 01 Oct 2024 12:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9C-0002va-1O
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:34 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f95c99-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:31 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a706236bfso450422566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:31 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:30 -0700 (PDT)
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
X-Inumbo-ID: 10f95c99-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786311; x=1728391111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CLVhmVmABNvSZWpsVfABNNcbL+sBo7kkWt6jjP+OBE=;
        b=NJ/szdGP36LpKNG2bVcKYbzIORaDGjl3I5iEdHoxURAQ+JQDnqAMWBSSWAd4XGInYj
         FUTUEwaXk46QijxCWi+MwoZna31DnD6ooBABZMFT0OfG2+QRx/Ei2vvvraqell4aAfMd
         WpgPdoe3mie20w0bFOYjwOAbdVcYY6XfD3XHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786311; x=1728391111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CLVhmVmABNvSZWpsVfABNNcbL+sBo7kkWt6jjP+OBE=;
        b=YsYFmaE5QVS03GvPJYvGQAMWwWBavPBxXVQRhUCyGJY7YvrTFicZns+6L4nuSlLSPf
         iV9yMc1qvfthAZOv/qYPPwax28NAG/S/5/9RmcGimBmbMiu12N4QVTZBD1KosjLASQSq
         espHzA95wfEoHV88j7DHRkwU7YSfLW5KdAF+PcJdgBXCfw2R4f3ShaGSEunpica7rWWS
         SYJUeoJpA0duHq9OAz9CDOBLjQgxfUKItlmmvUiiRRT8OsgYY8qHGJLDdIZYMy+sd20X
         dcaZ5m6WdCJTccguUVcPUHcA+NsJZjJFy8g9vZh5b3tXmM/13s13XlvzATAywNfuHhSp
         GJQA==
X-Gm-Message-State: AOJu0YzYinCn532Z0LEhSC4Dg12R30Adfnqi5AAxo3w46dTe9KQfNrdx
	Ag7SZz7+i02fsLxnJ+DzC3PO954TgJqB34i5RP95It9L1z6mO3IqeDwVvL7FoD/xzmSiL3yKuPo
	kA2U=
X-Google-Smtp-Source: AGHT+IGBeJtPNsZn+19IIMd92YMaOk91ubtWYoKiFy2/Ft20p7KGSCFMPdE+4Gfcl9TA9oN7LlEddw==
X-Received: by 2002:a05:6402:2743:b0:5c8:9553:a1fb with SMTP id 4fb4d7f45d1cf-5c89553a26emr13424439a12.9.1727786310712;
        Tue, 01 Oct 2024 05:38:30 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 01/11] lib/x86: Relax checks about policy compatibility
Date: Tue,  1 Oct 2024 13:37:57 +0100
Message-ID: <20241001123807.605-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow a guest policy have up to leaf 0xb even if the host doesn't.
Otherwise it's not possible to show leaf 0xb to guests we're emulating
an x2APIC for on old AMD machines.

No externally visible changes though because toolstack doesn't yet
populate that leaf.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/tests/cpu-policy/test-cpu-policy.c |  6 +++++-
 xen/lib/x86/policy.c                     | 11 ++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c00285..9216010b1c5d 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -586,6 +586,10 @@ static void test_is_compatible_success(void)
                 .platform_info.cpuid_faulting = true,
             },
         },
+        {
+            .name = "Host missing leaf 0xb, Guest wanted",
+            .guest.basic.max_leaf = 0xb,
+        },
     };
     struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
 
@@ -614,7 +618,7 @@ static void test_is_compatible_failure(void)
     } tests[] = {
         {
             .name = "Host basic.max_leaf out of range",
-            .guest.basic.max_leaf = 1,
+            .guest.basic.max_leaf = 0xc,
             .e = { 0, -1, -1 },
         },
         {
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785be..63bc96451d2c 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -15,7 +15,16 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->basic.max_leaf > host->basic.max_leaf )
+    /*
+     * Old AMD hardware doesn't expose topology information in leaf 0xb. We
+     * want to emulate that leaf with credible information because it must be
+     * present on systems in which we emulate the x2APIC.
+     *
+     * For that reason, allow the max basic guest leaf to be larger than the
+     * hosts' up until 0xb.
+     */
+    if ( guest->basic.max_leaf > 0xb &&
+         guest->basic.max_leaf > host->basic.max_leaf )
         FAIL_CPUID(0, NA);
 
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
-- 
2.46.0


