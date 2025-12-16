Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B9CC44F8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188081.1509331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyZ-0001RK-Kz; Tue, 16 Dec 2025 16:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188081.1509331; Tue, 16 Dec 2025 16:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVXyZ-0001QY-F5; Tue, 16 Dec 2025 16:32:39 +0000
Received: by outflank-mailman (input) for mailman id 1188081;
 Tue, 16 Dec 2025 16:32:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6n8=6W=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vVXyY-0001Pz-2V
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:32:38 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e66c2f-da9c-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 17:32:37 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so36946905e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:32:37 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd994a221sm12994765e9.7.2025.12.16.08.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:32:35 -0800 (PST)
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
X-Inumbo-ID: d4e66c2f-da9c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765902756; x=1766507556; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgFzPujzf54tak0q7FrhW+uWSwtYPNMPJZRSoWURja8=;
        b=OdyqZT5RzzYpa+v0CIyxPoR0KCYb6eADDuSyJn44qjmFeB44qDrjt3uIXYucZlY5Pw
         mlL241m5tyJHkSOK7A3bbRa6POZoTYtPw57y4yKYfy5BIUa3M/S2rH4n13jauqcXpEM5
         lPf6OttoPeaRqnaIj0LYyZdfQceFY5TD1iPD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765902756; x=1766507556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgFzPujzf54tak0q7FrhW+uWSwtYPNMPJZRSoWURja8=;
        b=v9z8L4mTk+lnvL4MnPrv3/JgNkL4ZDyPkvDjFke3BL53BOfjNGQcWD6uqLMW7vnABv
         GYso1fLCGzmLDNxrXZHW1tgioWaYgoT2gLLBrmSkaiQgo39pdMgBEap08igu1Q6OvR7h
         1VMkKQ3arJeKQSDngfcm4ULORNesnr85qd6PaeJYcitNcnRJKPQ9h4jvShVtVMOWwT4e
         A2gE6cLa5MqJKb+lpKVGwk3Zoapm48SrbI9jFaF0wvuvqRZk8xLK9xbJmX+KIkiWhRSO
         iRfItzY9gmVUzF3WIZO4RJxMrxjFU1O+qYTRipd+tAynIP5e7uPLnIR3ZUdIIAoCJLpi
         CMOg==
X-Gm-Message-State: AOJu0YwrAGhXUFFIjJ3YuHDPp9FX+kPRr9qNXP5MgwLS28snQnV8QW7b
	6fvyNN87kx7r1tdqbW8IFd31NlQ4bbUjGbYEwuT0lfb/X8KZLPjyixUg7bB+/J+jytTIXuhbjIt
	OkwR1
X-Gm-Gg: AY/fxX5akFu8Qu8wVFcoHxPKs4kSpWQXofZ6y4Qe7uAHx1UiyiJ/QhJN9Vz2tiVMOtz
	JPZ54cuGuHZYh3e86ExNukMFcQda1S9C9cQwdAGNF5anKSQnwhd9LCRybCixbNldAR3ebydze3s
	AORQbG4RWPhUBy7r1/WtuEWOj55RwY7tN6BgWoL2SKzMQHja1n3HypI8BJc893bM+Im8JjBueH3
	JJtXw4iwTO3n4Oh4trfY+IyMn34OcrYcZWDm1o5X6EF0Of1rrN/vZO2zbcv5t8sCQ0rGy0DzEDt
	z45X2lfgzzwzdXq2WloHck6huYpPI5ZzznwPHy7e15koPv5VJWxRH1ssQ5W0WOhq1Qgi08GFnjD
	1BvuwIUYt90STnhwCi91YtAoqX1duZhojA0Dkibe50cB9Rjo4ujVZH6Zk7VGvXBktt4xs3euzoZ
	yN4Ym9VBpkYHwM3gsaVrMxyd5Imz5oGJM9HlHR8o9dqk+i/wgqFnrz4r/wOPgd8g==
X-Google-Smtp-Source: AGHT+IF8/pq5lRwmiKyouqxflWlhNHwkTUT8LmvNn8ZyikT3BUT1yxWKWhQ3I1pXvzHrRZJwrUXG3w==
X-Received: by 2002:a05:600c:4e91:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47a8f8ab745mr156950825e9.4.1765902756170;
        Tue, 16 Dec 2025 08:32:36 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/4] xen/domain: Disallow XENMEM_claim_pages on dying domains
Date: Tue, 16 Dec 2025 16:32:27 +0000
Message-Id: <20251216163230.2768186-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
References: <20251216163230.2768186-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XENMEM_claim_pages can be issued on a domain in the later stages of
domain_kill().  In that case, the claimed memory is leaked, as there's no way
to subsequently release the claim.

Claims are intended for use during domain construction; to reserve sufficient
RAM to construct the domain fully.  There's no legitimate reason to be calling
it on a dying domain.

Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/memory.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 3688e6dd5032..ae805ccbe4d1 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1681,6 +1681,9 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         rc = xsm_claim_pages(XSM_PRIV, d);
 
+        if ( !rc && d->is_dying )
+            rc = -EINVAL;
+
         if ( !rc )
             rc = domain_set_outstanding_pages(d, reservation.nr_extents);
 
-- 
2.39.5


