Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E019A6E93
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823732.1237781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc0-0007BJ-IP; Mon, 21 Oct 2024 15:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823732.1237781; Mon, 21 Oct 2024 15:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc0-00078p-FC; Mon, 21 Oct 2024 15:46:28 +0000
Received: by outflank-mailman (input) for mailman id 823732;
 Mon, 21 Oct 2024 15:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uby-00072f-Ul
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:26 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a144706c-8fc3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:46:26 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso28000366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:26 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:24 -0700 (PDT)
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
X-Inumbo-ID: a144706c-8fc3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525585; x=1730130385; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBassmQzkQGjGcGX6CCW94tabGk8bt3HmbNpfye2CBI=;
        b=fQVisM99hOGDTBagGT7JvBbBDzaIQopRXIbcYHrceNr/Z3GDkQ8ykeYmYyfWVbAsva
         9GBOqsIBnTMRzIvgHWaMv3NaivkTIKX9xgKNfvJ+uKLe1gUdNWvBHN87ej6Bylum4MEn
         pOV6h05uG9H7SHpt38z5JPjMt+oLcmgpeUEg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525585; x=1730130385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBassmQzkQGjGcGX6CCW94tabGk8bt3HmbNpfye2CBI=;
        b=sc8AX5vH+JSc9Hgibno9jTZTvKS8Jw1Sm5xVzdECyr3IH7g8C0Xjh99FIEKjHOFsRP
         wlH27CEoxOLSfVd4ExvPkxKUhYXTk+06kNaJIzhgyAGPPShuW9nE9Ob6kd5Q0yju3VxU
         iafCFwigOvYQDF1XAWYB61pgxxuNAKP40NDQywrPLre7Eek6BKiDg8iX84IKfzmpclIP
         vJ4jUSfpnmiEg0eRhYCA/pGZBLDGMYaWT5R4MDsDjzC5Ue9bq7ZXwF6Eq+02WRCcnacy
         HeHFseHrA1SH8wq0CLUc0ii2Dp9zx0KZuyrf1KIEXdLLXcrReCcebe99sxxmBLguQwoj
         pi1A==
X-Gm-Message-State: AOJu0YzlV9mUz4V4yQxjhM9fX6CFNOuPOvG3xU/0UaTca+ygiBSBnMWM
	XAMkaAqvjlf0kK2y45JauQSm4b/Y6yir/XcZEhCXz5bXHC74FWo7kwecxfsxDX23mGPmPEJx6fz
	x
X-Google-Smtp-Source: AGHT+IEihvHwwhqYr+uHOEPw6bXq1/E4z6qPAHQE2TFcRK7PeBA8wIjJHn08cy5toE54HuoyOx+a0Q==
X-Received: by 2002:a17:907:7fab:b0:a99:e505:2089 with SMTP id a640c23a62f3a-a9a69c92299mr1103020666b.45.1729525585037;
        Mon, 21 Oct 2024 08:46:25 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 01/10] lib/x86: Bump max basic leaf in {pv,hvm}_max_policy
Date: Mon, 21 Oct 2024 16:45:51 +0100
Message-ID: <20241021154600.11745-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump it to ARRAY_SIZE() so toolstack is able to extend a policy past
host limits (i.e: to emulate a feature not present in the host)

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
  * Replaces v6/patch1("Relax checks about policy compatibility")
  * Bumps basic.max_leaf to ARRAY_SIZE(basic.raw) to pass the
    compatibility checks rather than tweaking the checker.
---
 xen/arch/x86/cpu-policy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index b6d9fad56773..715a66d2a978 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -585,6 +585,9 @@ static void __init calculate_pv_max_policy(void)
      */
     p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
 
+    /* Toolstack may populate leaves not present in the basic host leaves */
+    p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
+
     x86_cpu_policy_to_featureset(p, fs);
 
     for ( i = 0; i < ARRAY_SIZE(fs); ++i )
@@ -672,6 +675,9 @@ static void __init calculate_hvm_max_policy(void)
      */
     p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
 
+    /* Toolstack may populate leaves not present in the basic host leaves */
+    p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
+
     x86_cpu_policy_to_featureset(p, fs);
 
     mask = hvm_hap_supported() ?
-- 
2.47.0


