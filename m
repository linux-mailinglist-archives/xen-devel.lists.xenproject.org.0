Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA2C9B3D4
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 11:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176071.1500639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4P-0007Z2-D8; Tue, 02 Dec 2025 10:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176071.1500639; Tue, 02 Dec 2025 10:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4P-0007Wy-8u; Tue, 02 Dec 2025 10:57:21 +0000
Received: by outflank-mailman (input) for mailman id 1176071;
 Tue, 02 Dec 2025 10:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQLy=6I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQO4O-0007Nh-HB
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 10:57:20 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaccb00d-cf6d-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 11:57:17 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so31027195e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 02:57:17 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791164d365sm289825795e9.12.2025.12.02.02.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:57:16 -0800 (PST)
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
X-Inumbo-ID: aaccb00d-cf6d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764673037; x=1765277837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3F0v8B5tAKK2oIAslcDrKA97kPJ4tzxA9EyhzU5Mmg=;
        b=wKnwYpRB3LL7Mw6aTy/TF4x/TSSlJez7GcXwFLKDO34xr5rS6JC+R/fDWRDtfmoe8B
         JV99Br7g336lLv4z0xVfBnRh0Hy92iE4m9p0vZK3y64cBrI12+vgzCKy53BD7kutRbJW
         CCdrx3892q4Ayn7VPj7mZxsNJBxNlCVYCahjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673037; x=1765277837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y3F0v8B5tAKK2oIAslcDrKA97kPJ4tzxA9EyhzU5Mmg=;
        b=bLEHcKllmr52zWAMrcVAEjWLnY4dCrQUdJGSCYrB1q4jvnljOUYYAmVFw18tfWKCeR
         mKZ95j+Qe9lwwep03dmgan0hA/QMzCEDxPlHWCumV5FSguB0C9iCPdjurTftHrfY4aSw
         Fd+KojDGd1b0HQCSMQ1DogaYfw3hSLOAsm6C/XTA4M1TON/CQ2tWiVPRE0TjMFIHTm+2
         w4Cel4auz5IWirLDDuWHOGXR4xG4sokBsPR25KRqYtYVE9AWlaJxa3jrwxp+syqcYBBs
         IRGNKMbfFSvGrpxUhfgnuy/H9j9zoDaiS0I0tPPcF7dZmTPXeUHwG1cPU6Zv8rmZX9UH
         BGFg==
X-Gm-Message-State: AOJu0YxWmkjxoRaz0fNo58aRrBRgFfnWNSY049epcBUtAFVFuE14zcF+
	MnGCAu/2p3PJ9VsThXoMpQJs4zWnZ4veJDoedTvMYzQ9oM8J3Bbh/bVIZZI2Bze5diOrOg8rGtz
	r9PE5
X-Gm-Gg: ASbGnctGLMiduUcrsz6yYaRKm0keiGrQ9rbTdF1SwGuA3NU3M7ChKfYpoROB7To+xhy
	BJRc+jZ1FT/BQ01ZB7bbthxqpWdPTluIaMzjkKYP92F0KVQgygRzZTy/WcRjNsyoMFCGBf5x5oo
	8otgCobqmZTdwL9xREZUnro8Q0gAtpTMdKrjKotU0KBX2sRvy7Bo76mFnhuUFJwCvYX4aAUwZ64
	F5S1KnVckVROk51gLsjSPbLY+PZ+36begO2vfMtQG+wFjqrPcndPrjK528HWNoAljxOcWco+cfE
	T7jB1GZm2MSdf3/dkmXNkgu0BDh5G23yXONbFkjJjgBLGWWVWtQZZzksXO0KA04apq41MyFd5jb
	kYX0cBJOyT/cI5o/KQBHQ3zgelcuQe23NMM9TEMmetSSzYkHpf3b0nLw5dgAf1INdshM3UEjLCb
	C5BJtZ7Hp+4iOIQE5eqTq6kYXySarM/3pkXd14rvxoziT6Cr9r9ppewIlIJYcxeA==
X-Google-Smtp-Source: AGHT+IEaso1pVFzc+d42WVIjUWuuXqzVjN0XMUbvo93FY2+XATOdq6XNtm++GWgxF/aHqfUMAshfCA==
X-Received: by 2002:a05:600c:19ca:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-477c1143073mr407258435e9.22.1764673036572;
        Tue, 02 Dec 2025 02:57:16 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/amd: Exclude K8 RevD and earlier from levelling
Date: Tue,  2 Dec 2025 10:57:09 +0000
Message-Id: <20251202105710.1472927-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Between RevD and RevE silicon, the feature MSRs moved location.  This property
is highlighted by the suggested workaround for Erratum #110 which gives the
two different MSRs for the extended feature leaf.

The other feature MSRs are not given and while they're easy enough to figure
out I don't have any K8's to test the result with.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4dc9157836ad..73f43b0f9174 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -117,10 +117,12 @@ static void __init noinline probe_masking_msrs(void)
 	/*
 	 * First, work out which masking MSRs we should have, based on
 	 * revision and cpuid.
+	 *
+	 * Fam11h doesn't support masking at all.  FamFh RevD and earlier had
+	 * the feature MSRs in different locations, as can be seen by the
+	 * suggested workaround for Erratum #110, docID 25759.
 	 */
-
-	/* Fam11 doesn't support masking at all. */
-	if (c->x86 == 0x11)
+	if (c->family == 0x11 || (c->family == 0xf && c->model < 0x20))
 		return;
 
 	cpuidmask_defaults._1cd =
-- 
2.39.5


