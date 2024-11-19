Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9119D23A9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839922.1255740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZT-0001bM-TW; Tue, 19 Nov 2024 10:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839922.1255740; Tue, 19 Nov 2024 10:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZT-0001Xw-Ps; Tue, 19 Nov 2024 10:34:59 +0000
Received: by outflank-mailman (input) for mailman id 839922;
 Tue, 19 Nov 2024 10:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDLZS-0000aC-4b
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:34:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea9a4c6e-a661-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 11:34:55 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cefa22e9d5so949603a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 02:34:55 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfb2ae6e98sm3206096a12.46.2024.11.19.02.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 02:34:53 -0800 (PST)
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
X-Inumbo-ID: ea9a4c6e-a661-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVhOWE0YzZlLWE2NjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDEyNDk1LjE0MDkyLCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732012494; x=1732617294; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGEGshzGY38tWisNXdt9B5IgeekGw56Bfs63DZJjmS4=;
        b=OTrP9Irh8jo1eshHuV697DsfRIy+mlCcLfpnrzY2T4ZtUodA1O7VdUIsOaTTxeLXHB
         BTkHjPviezgGWIBCVAmbOpVZ9EHVhQ2q8DbMx7ZF8pyFza3DxsQwOhIVIZci9hXaed4B
         c+CAifL7KEVNnIndbjKn2JtR2C+YI9FQCYJEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012494; x=1732617294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGEGshzGY38tWisNXdt9B5IgeekGw56Bfs63DZJjmS4=;
        b=Mmy4gGG2kWa2Ub6XWDprPQ6TDV8s9y5elR5S6Za4Mc37HKxuJWeE7aw4nXgLo/CQLM
         EzKmVSI7rcsM7jsVeupcrqlvW2M66FOVNKtDIDehzand2rCgaiSkOXT27lBgbV3lH4P0
         DhYF2heemNA4uO2P3lCvBb8fuzag3aNm9v13oNeQHRKAsjjCHLDha26ZM8pLrNm004MH
         6t+deTfg2yGisrePam0qVvJ6KQGACwZVq+43C/KVYzo4AYlVEqaa5qpiYjThzCdpM4Hx
         3a0wgubl5xFTYaIEhX+0LeffihJ0PL1ISr7rQfFpk7so10ShiD3jz5WyRILBgvuNGaXJ
         zPFw==
X-Gm-Message-State: AOJu0YzjPPMmKDxyivEO54FUFdmm/PBDVKskxhbVbS0eMAM8pz7iRdyR
	cdiQvtGU6Yd0l+9If0VzKkhtMHSW9YBO4E5zF6NWTTRRyEpdlv5E1pGisiA63DpcUW0QEFdzrlL
	j
X-Google-Smtp-Source: AGHT+IF+mTzXLtDza3F7Ib3z/vI+mndFETLYxPvl9yQ8aIPt6jOoWBcfzYa+oAFlla6vtR6vaeO4gQ==
X-Received: by 2002:a05:6402:278d:b0:5cf:c321:d16e with SMTP id 4fb4d7f45d1cf-5cfc321d245mr5998376a12.0.1732012494245;
        Tue, 19 Nov 2024 02:34:54 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/4] automation/eclair: make Misra rule 20.7 blocking for x86 also
Date: Tue, 19 Nov 2024 11:34:44 +0100
Message-ID: <20241119103444.23296-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241119103444.23296-1-roger.pau@citrix.com>
References: <20241119103444.23296-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no violations left, make the rule globally blocking for both x86 and
ARM.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 9318e5b10ca8..dcddba2e061b 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -79,6 +79,7 @@ MC3R1.R20.2||
 MC3R1.R20.3||
 MC3R1.R20.4||
 MC3R1.R20.6||
+MC3R1.R20.7||
 MC3R1.R20.9||
 MC3R1.R20.11||
 MC3R1.R20.12||
@@ -115,7 +116,7 @@ if(string_equal(target,"x86_64"),
 )
 
 if(string_equal(target,"arm64"),
-    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6||MC3R1.R20.7"})
+    service_selector({"additional_clean_guidelines","MC3R1.R2.1||MC3R1.R5.3||MC3.R11.2||MC3R1.R16.6"})
 )
 
 -reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
-- 
2.46.0


