Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570BA855EE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 09:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946728.1344521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39EN-0001Bp-EJ; Fri, 11 Apr 2025 07:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946728.1344521; Fri, 11 Apr 2025 07:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39EN-00019a-BH; Fri, 11 Apr 2025 07:55:19 +0000
Received: by outflank-mailman (input) for mailman id 946728;
 Fri, 11 Apr 2025 07:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3ez=W5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u39EM-0000vb-6c
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 07:55:18 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e63f798-16aa-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 09:55:16 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so1170552f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 00:55:16 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eaf4458a8sm1246178f8f.99.2025.04.11.00.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 00:55:15 -0700 (PDT)
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
X-Inumbo-ID: 4e63f798-16aa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744358116; x=1744962916; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA9JXMeZq0Q7AJalYvUyV3B17ebPEAq0r09wkDkoj2k=;
        b=LrAZS0EoOrq9YJTdoHQ0JX2BKWNgSy8CzOvwExFwN6CFATapnTKkjYn6NT0ruSWL0p
         fi1ufDS0FE7NwEi+EnLk82vNS+1eumkgLkZ7iYyOJTlJpsMaF8PFjfkwTa6K5GCf1ypa
         Pkc8gRMfn72XgPzwn+DMs5hhpV5D4AmjhSfzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358116; x=1744962916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA9JXMeZq0Q7AJalYvUyV3B17ebPEAq0r09wkDkoj2k=;
        b=hcAtg4x4eAx/ThwFqOtrmHf2xJLGXoeQ+OtG2wmMgUPoXOUNhjr5CQAe7XklCfQO7M
         g/6wLESVAizAjdWWCw/mf3N77oY/fjbw8RuOjkJwCPI/gNN9CejMfa4OWnNKXhqRDAHt
         +JT0Ohn0yYtVcnjjXlH4mFlQko6Ab+iYjYB6D3Xegdww2NAixWCZitGux9a84TVN+yww
         Y2vBEZXXCHlJ1z49WpOd9/xHUth1V8UYpEAlpEH6IOvmA04t0QzkNaBZRDGBItUsH9HY
         ptSezpi31c02uBQkdRb8fT/fl0sbuRg7lIWP+JwXOrAI9+365uQWnS2MZaqnfzXkh6U0
         KcFQ==
X-Gm-Message-State: AOJu0YwA2iFg2TMA1o3Aec2pwQMCSqgSd542Pou+TMFebupylKdZxqLV
	xqsCWf9tOITV9Zcbi4weCByWmj3Hc/nyjJagyKilnswa3fZ5IHyBSyoT0pZSUK2ywwlwKMAZFgp
	p
X-Gm-Gg: ASbGncstf0yYk9Pec8TAiIdcvLxvYh8xLze6iDmRfzdlQnzntiUQvAJGyOZJ/zMMLVl
	W6MODQJAA1anUbRHBDU66jXskofOFJjAXfenhcHmYG+Xiy7IPpI7Lb4fnlp3WizcA6XDvbnvG/H
	XpcBbRxIaVD98O4pGbFIsVPQQMfYJA+/atLLKzlUQNB+DMfVkS0TLovuR52S2SJvrLvKFDRnZf6
	nATzr7AwmTZ9oT2mCrxji9tTtDSi1y1W8CqltmtQFPmQqXAE+g+DW0+CBSov6hmP2j739Uk02v/
	SjnJ3UUhf2Z6U3HOiRC6NOxcdmjjUodoiPrjAytRJgOgVg==
X-Google-Smtp-Source: AGHT+IFAj3qs9Qnj4aJ9djTepnSLakf+wwYwqPlCcPyHHPVF9E6tRBzZSlo46eazD6P3RX6tC4FPNw==
X-Received: by 2002:a05:6000:1acc:b0:390:e9b5:d69c with SMTP id ffacd0b85a97d-39ea54fd090mr1256354f8f.25.1744358115783;
        Fri, 11 Apr 2025 00:55:15 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] xen/rangeset: fix incorrect subtraction
Date: Fri, 11 Apr 2025 09:55:01 +0200
Message-ID: <20250411075502.19926-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411075502.19926-1-roger.pau@citrix.com>
References: <20250411075502.19926-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Given the following rangset operation:

{ [0, 1], [4, 5] } - { [3, 4] }

The current rangeset logic will output a rangeset:

{ [0, 2], [5, 5] }

This is incorrect, and also has the undesirable property of being bogus in
a way that the resulting rangeset is expanded.

Fix this by making sure the bounds are correctly checked before modifying
the previous range.

Fixes: 484a058c4828 ('Add auto-destructing per-domain rangeset data structure...')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/rangeset.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index b75590f90744..e75871039087 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -227,7 +227,8 @@ int rangeset_remove_range(
 
         if ( x->s < s )
         {
-            x->e = s - 1;
+            if ( x->e >= s )
+                x->e = s - 1;
             x = next_range(r, x);
         }
 
-- 
2.48.1


