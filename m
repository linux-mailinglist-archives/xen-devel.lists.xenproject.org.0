Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816259C1C34
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 12:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832466.1247806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE8-00070I-F5; Fri, 08 Nov 2024 11:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832466.1247806; Fri, 08 Nov 2024 11:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE8-0006xd-AB; Fri, 08 Nov 2024 11:32:32 +0000
Received: by outflank-mailman (input) for mailman id 832466;
 Fri, 08 Nov 2024 11:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9NE6-00060f-Ql
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 11:32:30 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22024e07-9dc5-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 12:32:27 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so2868034a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 03:32:27 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d7f1sm1951138a12.8.2024.11.08.03.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 03:32:26 -0800 (PST)
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
X-Inumbo-ID: 22024e07-9dc5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIyMDI0ZTA3LTlkYzUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDY1NTQ3LjgyOTIxNCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731065547; x=1731670347; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hy1rkOMw7x1rLXXuXX/nNUCuXlBj0Xy8KQUl33hR/Gg=;
        b=Ja4n9ROREEHM3ZMjA7sGNZqP+H4vdMeVgLmzDkWKzah3/TZih2RGK1fCnWk9zk0H72
         yHf416R9Y2nGsycFfUcoVkQTKuNZtyidReQFATDW2HpbWlX58x2xy1zubLSWNseC7Kjm
         i7V4DfgtopXQ1veAY3HFEwmtX/7RvUxu3Ti9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065547; x=1731670347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hy1rkOMw7x1rLXXuXX/nNUCuXlBj0Xy8KQUl33hR/Gg=;
        b=BeeMjJwOIe6hXaC8Mkuzn/g7Km5m/JbwiigKa3EGMO9aCfm4zuntrczXM/2e4bMwoU
         Iwg93YsLdsTd6akGoIa+w/45AEbI86gUOUOLgabYW4Cg1fqNJ/sSKPEuobfaFhSSADZ5
         uQjdwCnGY7FfbHMSqcavV8++OFfuZBEuigzfeCdzTbUws1PG2uaRkwTbT0MZHuqDcCj/
         v+n2XCDeVTQJPyXIWgP4xARRVaK+CQepbYkbhn4GJJzWaT2DJZyX07jKEu+JrHXpDY+2
         GEfXO3qh6pxGaM6tYtJIyPdboLiwot7xFvNZzQhHpfozpoHWN82LMKpO2bZnGVQF10BH
         GYhQ==
X-Gm-Message-State: AOJu0YwdXd4kLIC4EZmCbO5hDW3yPJEfYDghbo8cfVQaNxkJYJu9MIDu
	ozGfnJ0prMzuvSngctN7Jn6seMNem7vVvxVAaA4u/IzSQ3CDerSb1Zo6AZ+FEiGBM9qPibXS9Br
	L
X-Google-Smtp-Source: AGHT+IFjecNCao5lsL7w1bkyUj5XNZbq0NAXdF5qofiHRnPek57Q64WqXdld3mSVYG/gwB4xgXQT0Q==
X-Received: by 2002:a05:6402:3547:b0:5cb:acfa:61ee with SMTP id 4fb4d7f45d1cf-5cf0a441833mr1683126a12.23.1731065546957;
        Fri, 08 Nov 2024 03:32:26 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 4/4] x86/mm: ensure L2 is always freed if empty
Date: Fri,  8 Nov 2024 12:31:44 +0100
Message-ID: <20241108113144.83637-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108113144.83637-1-roger.pau@citrix.com>
References: <20241108113144.83637-1-roger.pau@citrix.com>
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
index 64b8054891da..489c71150255 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5731,7 +5731,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             v &= ~((1UL << L2_PAGETABLE_SHIFT) - 1);
-            continue;
+            goto check_l3;
         }
 
         if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
-- 
2.46.0


