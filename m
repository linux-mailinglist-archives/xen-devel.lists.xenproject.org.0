Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC509C8D71
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 15:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836528.1252460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIe-0008L9-1O; Thu, 14 Nov 2024 14:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836528.1252460; Thu, 14 Nov 2024 14:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbId-0008Il-Tm; Thu, 14 Nov 2024 14:58:23 +0000
Received: by outflank-mailman (input) for mailman id 836528;
 Thu, 14 Nov 2024 14:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBbIc-0007K6-K6
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 14:58:22 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1c922a2-a298-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 15:58:18 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5ceb75f9631so930257a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 06:58:18 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b89d47sm644059a12.16.2024.11.14.06.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 06:58:16 -0800 (PST)
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
X-Inumbo-ID: e1c922a2-a298-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUxYzkyMmEyLWEyOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTk2Mjk4LjAzNTMxNywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731596297; x=1732201097; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfpsHIVO6Ujko5JTUzFKmfq4KuJWIJOR8vcz6fn/jLQ=;
        b=cnqcxds1qtP2pyFMnL1MG8tLPF3qWU7iJ6g/gj8AM6qVeLZKvBKDUDIkOlUI9uL1G6
         2Aq//huKlP3fogmcHWI7btFlFAyCShbYS1EsV7lEnspOeVes3zx1/Ja34qlQOuHif9N6
         jTQfoFZnCEPgFwTFDPKiu3px3EicagwuFqs4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596297; x=1732201097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfpsHIVO6Ujko5JTUzFKmfq4KuJWIJOR8vcz6fn/jLQ=;
        b=vNvvkyTYGwp3Kl+7QLv3BN24UCNpmiwnvMhTUz/JzF2feHdI6V1CPrp2a5yiJ15sap
         vXTaME7IkFit7CPvFyO+8RhPBN+kTO/KWEWHHgXpYYZRyv0HsTjePgOjvHomRF8/Jsag
         IlpSg6spAmB3vCjfs3eVu65y8yVrW9hF7MkCdRFzBud4wrdM/7k0aBGNMgYNLzP0z7LU
         UfNOcbD5N0Q1exxt8XR7P+wfbm5Cox7KlEocjyRYmhfU/JmHvnJd2GHhVEYCDuDLNBhK
         ODbWd4Bgpn8aXRQi6bHs8uFdPVSTgAco1i18ZnFcFvKizumIO5tnNJV4uh2aDQEZx7SF
         VRYw==
X-Gm-Message-State: AOJu0Yzc2gpNAHdymXc/gkOhwL5GnWQ6s5tqcnlJ/jqJlt+T3s4rlwK0
	SWQ9uiwqG5PDZYDEqAQC7QMMQTCfq819xB9q5pfbO+z3EazcP7nFkIg4mg1lPUJb68AtSk4A4zJ
	4
X-Google-Smtp-Source: AGHT+IGAixFOlUsgApJqtZWaUF0eQhjY3/QjMY1cv8HYc0dJtkEutXuf3diur3jYqzlxSNZQxau3Bw==
X-Received: by 2002:a05:6402:2794:b0:5ce:dc4e:57ff with SMTP id 4fb4d7f45d1cf-5cf0a43ee61mr19861825a12.24.1731596297164;
        Thu, 14 Nov 2024 06:58:17 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 4/4] x86/mm: ensure L2 is always freed if empty
Date: Thu, 14 Nov 2024 15:57:15 +0100
Message-ID: <20241114145715.59777-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241114145715.59777-1-roger.pau@citrix.com>
References: <20241114145715.59777-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic in modify_xen_mappings() allows for fully empty L2 tables to
not be freed and unhooked from the parent L3 if the last L2 slot is not
populated.

Ensure that even when an L2 slot is empty the logic to check whether the whole
L2 can be removed is not skipped.

Fixes: 4376c05c3113 ('x86-64: use 1GB pages in 1:1 mapping if available')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b9a2234b53e1..5d7e8d78718c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5989,7 +5989,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             v &= ~((1UL << L2_PAGETABLE_SHIFT) - 1);
-            continue;
+            goto check_l3;
         }
 
         if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
-- 
2.46.0


