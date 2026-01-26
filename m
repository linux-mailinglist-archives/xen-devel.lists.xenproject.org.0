Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3p+HFVGqd2k6kAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B08BC4B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213841.1524383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmq-00074P-Au; Mon, 26 Jan 2026 17:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213841.1524383; Mon, 26 Jan 2026 17:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmq-0006ps-01; Mon, 26 Jan 2026 17:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1213841;
 Mon, 26 Jan 2026 17:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmn-0004HX-BR
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:54:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe2434e2-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:59 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee4539adfso52102525e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:59 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:58 -0800 (PST)
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
X-Inumbo-ID: fe2434e2-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450039; x=1770054839; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9ikuESfoJcCbCA9QaHk2aoC+EFlVlVQjy3heIMiHxU=;
        b=cALF6zl3kNzFlDLkSd9pc7xG6FPIyrwSQjRlfPgY9YCNz/m3JgEIPKtOI/Arw6+/lz
         YsXq7aqN4kPUQ97Oj8FGjFiRb1pedE6slgcFJViDAIiBcaRRhLn3kRMI0SuDWkksHfc6
         kthTXxPMy2lB8dzi5cJFtLSHJOPXVF2JSzBZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450039; x=1770054839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9ikuESfoJcCbCA9QaHk2aoC+EFlVlVQjy3heIMiHxU=;
        b=ox4gDOe691eSC/9QjUtzRf4B+Mt/7GplsKqWRceZKZZBT+MVPeEAWLQFMpUAS+r6Qk
         KGRTUbbOEmMP6g0JWEWN8M4t3SimmdlxP1jIMhnWF27Z6eBE2Qn8RbePhInTzWlnxX5y
         kZfmIrSsO+9x3MQHYHFb19cwBurNINfzoNIK4ZFHIpLvzHZqhbY5dSJzmjeePcc5VVL7
         V4Io8ZJE7oNBSVbFMO0hyzStUBERmrNQ6JdNNCy9KXv9DGFTx6fuRobH1tWgwm7v6l2e
         166OUhYzR0mdZLuSwGiFlDl37pz5arx/iGzzrwjyY15VhIJxqcSoDszjqZi6a6HGlT9i
         4xXw==
X-Gm-Message-State: AOJu0YxqRGbKiEPiPfP7JVVBKG3v5cqPW3yJVUlgHPs62JG+sd49zh/U
	zMflVpoFTSzFqjjP/ysdtunYlnb/zSTPSPh3nnV1HeV9f3sAEgw7viIA+RgqmqHMS5X//eivREw
	IK4aV
X-Gm-Gg: AZuq6aJ69eRTkwFjxT6rGO6ShigR8OLot53Kggr0JYEaECGHnW4kSdzkvs+eg1lm/Fo
	lKWLhJLNPaoYwfNyoURQOGmqLAECq/xgDVBBC/OAmEQB+PuDLAkAAwkDRM5ffRvwoz4dgZJGG3r
	xSJcs3dXmubN3xrUlZ6NnhaCnQYRfz+5i9QrbQ5ornkBXh5eTJ+ADsDz++gGGvlaamb4kWDhuXY
	9MDNK4ciN52SHSrm6RSPyGq64mPpHpjpRAVNWpzMUOqGbwKlWK/fo9JwP02NX7ghX2b/8ju9V3q
	Gns7BO1w6Bx8q9cNEr2tzaP7mh466YX1Ftwko0pjJuU2V6DulCHoQLp4wOI+QzOsNb5q8BhCIZ3
	MRD3RL6PrlZrf6LngfBxdmHOzvNk7649tvtVAKhaIJHM7w8+HfOxF3sJqy3MWgpjbG75mJuNcSq
	0RoXxM1SUFuACKVGd18rKMI4POuargEFNqpiPMtAdw1EWQU25uJ2R4dpXGHPaqXQ==
X-Received: by 2002:a05:600c:528d:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-4805ce3f893mr82672025e9.1.1769450038902;
        Mon, 26 Jan 2026 09:53:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 13/16] x86/cpu: Drop NOISY_CAPS
Date: Mon, 26 Jan 2026 17:53:42 +0000
Message-Id: <20260126175345.2078371-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DC0B08BC4B
X-Rspamd-Action: no action

These were plausibly useful for debugging when there were 4 words in
x86_capability[], but it's currently 22 words and growing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>

Even I can't read it in hex any more.
---
 xen/arch/x86/cpu/common.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 0249bb4bf2dc..7674cca1ba93 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -598,13 +598,6 @@ void identify_cpu(struct cpuinfo_x86 *c)
 		c->x86_capability[FEATURESET_m10Ah] = val >> 32;
 	}
 
-#ifdef NOISY_CAPS
-	printk(KERN_DEBUG "CPU: After vendor identify, caps:");
-	for (i = 0; i < NCAPINTS; i++)
-		printk(" %08x", c->x86_capability[i]);
-	printk("\n");
-#endif
-
 	/*
 	 * Vendor-specific initialization.  In this section we
 	 * canonicalize the feature flags, meaning if there are
@@ -641,13 +634,6 @@ void identify_cpu(struct cpuinfo_x86 *c)
 
 	xstate_init(c);
 
-#ifdef NOISY_CAPS
-	printk(KERN_DEBUG "CPU: After all inits, caps:");
-	for (i = 0; i < NCAPINTS; i++)
-		printk(" %08x", c->x86_capability[i]);
-	printk("\n");
-#endif
-
 	/*
 	 * If RDRAND is available, make an attempt to check that it actually
 	 * (still) works.
-- 
2.39.5


