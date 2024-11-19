Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F719D23A7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839918.1255699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZP-0000dJ-OM; Tue, 19 Nov 2024 10:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839918.1255699; Tue, 19 Nov 2024 10:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLZP-0000aN-KC; Tue, 19 Nov 2024 10:34:55 +0000
Received: by outflank-mailman (input) for mailman id 839918;
 Tue, 19 Nov 2024 10:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDLZO-0000aB-4l
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:34:54 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e88b4cb5-a661-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 11:34:51 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa20c733e92so583494366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 02:34:51 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0812aesm630324366b.176.2024.11.19.02.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 02:34:50 -0800 (PST)
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
X-Inumbo-ID: e88b4cb5-a661-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU4OGI0Y2I1LWE2NjEtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDEyNDkxLjY5MTE3LCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732012491; x=1732617291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJBBbyuIQCYsK6rK43EbpJKOGh50/Oq+iOYqEx2dg9s=;
        b=fXkC5NrZmnM9U7cvOlecLCjenG4Op1/h7rRq2BIMgX/vi62A91Exgoft6bJFJfuxh4
         Hyb0V0ssPfRBKLWWo7iAB7I8rlHbFInsN6LKS/Kg4RyE8B2oC16uDOyyIlH+ABn0a80Z
         40/jjaRaFCBbmYJ931wfkZq6AKkPlYL+4YFg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012491; x=1732617291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJBBbyuIQCYsK6rK43EbpJKOGh50/Oq+iOYqEx2dg9s=;
        b=mnyLgKrp9NNGvic4IO8x9lPaLKVhUA+WAr7KP7YnpXIelDyDXunQSVUKgXbDi/MiNo
         Y6ElWoNkacHkcVxrbdNgv2VGaRyIami/MrWKFqjo7RR42bM498gTkX76YoENYVP6KqOQ
         J/4lpHqgIGj3v+pUgQ/M1lK9jDLO6MxFWwX5C4XcDj7MLBo3O7EdL3NSI59Uq6d4WNn8
         d+VgUZYxdBzGLiJ2pV7O7crOYxiNOyasYUGSmXWKefJktlEECCrfCnbns9xqaJClQmeT
         phFoXFieaSRltWzokMissfC7d6WENYz1c2xDrNmmBI33EL9HLYgzNsg9N0JvPrWebohP
         cACw==
X-Gm-Message-State: AOJu0Yy46QuJiHtxfH5ebO/jxefnp/+ix3KPT9LWL8Znl7paOaGbE+mi
	unZqqGpE9FTAQDWc2aiUiMKJ0v8GyCW0/JWee+/Cjy16zFurDRU4/n2ysjbcG7GXkrEYyWbMcYy
	T
X-Google-Smtp-Source: AGHT+IEo1WtFxaf15RLq3BAAYzsbXhcsmW7mBp1090g41vITBvFhcqdFiYAEXLtb1V+KvevboAFnrQ==
X-Received: by 2002:a17:907:2cc2:b0:a9a:46f5:d6d7 with SMTP id a640c23a62f3a-aa4833ec1damr1489691666b.5.1732012490846;
        Tue, 19 Nov 2024 02:34:50 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/4] x8&/mm: fix IS_LnE_ALIGNED() to comply with Misra Rule 20.7
Date: Tue, 19 Nov 2024 11:34:41 +0100
Message-ID: <20241119103444.23296-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241119103444.23296-1-roger.pau@citrix.com>
References: <20241119103444.23296-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While not strictly needed to guarantee operator precedence is as expected, add
the parentheses to comply with Misra Rule 20.7.

No functional change intended.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: 5b52e1b0436f ('x86/mm: skip super-page alignment checks for non-present entries')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 494c14e80ff9..fa21903eb25a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5498,7 +5498,7 @@ int map_pages_to_xen(
  * be INVALID_MFN, since alignment is only relevant for present entries.
  */
 #define IS_LnE_ALIGNED(v, m, n) ({                              \
-    mfn_t m_ = m;                                               \
+    mfn_t m_ = (m);                                             \
                                                                 \
     ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
     IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \
-- 
2.46.0


