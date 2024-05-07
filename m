Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CDA8BE491
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 15:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718130.1120685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4L8b-0003Cz-RY; Tue, 07 May 2024 13:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718130.1120685; Tue, 07 May 2024 13:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4L8b-0003BT-Om; Tue, 07 May 2024 13:45:45 +0000
Received: by outflank-mailman (input) for mailman id 718130;
 Tue, 07 May 2024 13:45:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mcW=MK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4L8a-000385-Lr
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 13:45:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19959997-0c78-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 15:45:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59cf0bda27so242386466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 06:45:43 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 wr8-20020a170907700800b00a59be52ff98sm3390524ejb.191.2024.05.07.06.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 06:45:42 -0700 (PDT)
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
X-Inumbo-ID: 19959997-0c78-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715089543; x=1715694343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMHwRoPKPO1P7SvUfr7ww6qhGQBp9aeUszh+KmkrJg4=;
        b=UAWpAOH3TLz3OIaHxcTNbvhcw9JaI2xxDAfpp0rMBWKwjZfPR8Wd5dCkMdCPDR8aka
         Ivrl2/35Xbe/L3go/nLBBqbv0Np4eOFTha9onwOPRQMb5Uk0VqXqEp9qxODJU6mMxZXR
         j0wmF4lMwQehkMk1nU0G2bzTDL6L3wXkj/STo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715089543; x=1715694343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TMHwRoPKPO1P7SvUfr7ww6qhGQBp9aeUszh+KmkrJg4=;
        b=nqkyaPvdtvq1Yo+3j3FRL7yAhqUZ7qansijh/wbfzA331VpAPUMkDEvIo5GaCrbSul
         /PDV+lObBEdtD7oNzpfRSaurM2JbkNNkajUL+osRSFyxPZi2YOcPgltc0WDnliPdgG04
         ZXZ9wv2rF0vfjnYd1EVDJlkya6J0lGjvn//NMmCbDCo2fWSuldlnf9SpeahpIfkjOtHO
         NCLnTnc+rK1di3nLYAmbmar/rVXx/1upqYa15R+ZLyDUdWYKQPSGqQwUtixcxZ5l4r9u
         0QNXK/TAt1/ls/0Git0Mi+E5jO9ekLhfL/hNXg4xfdDIa2w+dxXWZRHBR137UPvdjwRD
         9rbw==
X-Gm-Message-State: AOJu0YygT9klCURrHCj3y80R+jK8ub4K8PI6KTn1bxdO0W8eYkBliEmB
	dINIhIwQA4Hv2fHnB2Pv/DXVc19sn4eqBz9+fYsoGcBk5v+2Jr/UrxBuKHFcMIyvCbPN2rm/6Au
	j
X-Google-Smtp-Source: AGHT+IGrAL8dcn9M7kkpZ9qMXztsIHogfUW/seJi3mKgm1ABBsd2rethPRIB+NdBhqYeAgITRYFVoQ==
X-Received: by 2002:a50:9f66:0:b0:572:67d9:6c3b with SMTP id b93-20020a509f66000000b0057267d96c3bmr10685330edf.26.1715089543043;
        Tue, 07 May 2024 06:45:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/cpu-policy: Fix migration from Ice Lake to Cascade Lake
Date: Tue,  7 May 2024 14:45:40 +0100
Message-Id: <20240507134540.1714274-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ever since Xen 4.14, there has been a latent bug with migration.

While some toolstacks can level the features properly, they don't shink
feat.max_subleaf when all features have been dropped.  This is because
we *still* have not completed the toolstack side work for full CPU Policy
objects.

As a consequence, even when properly feature levelled, VMs can't migrate
"backwards" across hardware which reduces feat.max_subleaf.  One such example
is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).

Extend the max policies feat.max_subleaf to the hightest number Xen knows
about, but leave the default policies matching the host.  This will allow VMs
with a higher feat.max_subleaf than strictly necessary to migrate in.

Eventually we'll manage to teach the toolstack how to avoid creating such VMs
in the first place, but there's still more work to do there.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Adjust max policies rather than the host policy.
---
 xen/arch/x86/cpu-policy.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 4b6d96276399..f7e2910c01b5 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -590,6 +590,13 @@ static void __init calculate_pv_max_policy(void)
     unsigned int i;
 
     *p = host_cpu_policy;
+
+    /*
+     * Some VMs may have a larger-than-necessary feat max_leaf.  Allow them to
+     * migrate in.
+     */
+    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+
     x86_cpu_policy_to_featureset(p, fs);
 
     for ( i = 0; i < ARRAY_SIZE(fs); ++i )
@@ -630,6 +637,10 @@ static void __init calculate_pv_def_policy(void)
     unsigned int i;
 
     *p = pv_max_cpu_policy;
+
+    /* Default to the same max_subleaf as the host. */
+    p->feat.max_subleaf = host_cpu_policy.feat.max_subleaf;
+
     x86_cpu_policy_to_featureset(p, fs);
 
     for ( i = 0; i < ARRAY_SIZE(fs); ++i )
@@ -666,6 +677,13 @@ static void __init calculate_hvm_max_policy(void)
     const uint32_t *mask;
 
     *p = host_cpu_policy;
+
+    /*
+     * Some VMs may have a larger-than-necessary feat max_leaf.  Allow them to
+     * migrate in.
+     */
+    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+
     x86_cpu_policy_to_featureset(p, fs);
 
     mask = hvm_hap_supported() ?
@@ -783,6 +801,10 @@ static void __init calculate_hvm_def_policy(void)
     const uint32_t *mask;
 
     *p = hvm_max_cpu_policy;
+
+    /* Default to the same max_subleaf as the host. */
+    p->feat.max_subleaf = host_cpu_policy.feat.max_subleaf;
+
     x86_cpu_policy_to_featureset(p, fs);
 
     mask = hvm_hap_supported() ?

base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
-- 
2.30.2


