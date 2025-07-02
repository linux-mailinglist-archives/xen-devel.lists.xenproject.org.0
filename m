Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA8CAF5B58
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031267.1405076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeV-0000KY-5J; Wed, 02 Jul 2025 14:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031267.1405076; Wed, 02 Jul 2025 14:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeU-0000Dt-VT; Wed, 02 Jul 2025 14:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1031267;
 Wed, 02 Jul 2025 14:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWyeT-0007qI-OW
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:41:33 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a54f0113-5752-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:41:32 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4537fdec39fso15338115e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:41:32 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm230946905e9.20.2025.07.02.07.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 07:41:30 -0700 (PDT)
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
X-Inumbo-ID: a54f0113-5752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751467291; x=1752072091; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxIVNczZ1rIA2YAlLtpWMc3jJY/ZNCuwxwnSmoLdJTc=;
        b=QQs/R/gGg5vFfbmPazfAM/w8sqCZAiENDbj2vwNdOMM4xoi5cNLbP1DgEZ/9zzIdYJ
         3GJlscCOdHW0s7wlht2WPjRavKRuasUNDJn1m1X/Fq7FxUMf3qLrG3QssXA8LjboPAUe
         guZCxMWmY9cOx4h6r6nfhelGfW977PFze6ZDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467291; x=1752072091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxIVNczZ1rIA2YAlLtpWMc3jJY/ZNCuwxwnSmoLdJTc=;
        b=TZ36NIQI092IIikwIrMVBSGhh5NFyNa+rk3dRmbZ737rCorFTWzZ8onDQi5wyI/5Yd
         UUWz571GgaWACFw9ne8EtjIfnJfjU/Qhpn9Tcd9PKCqHogiFg2mpedfg92giYw87q2jf
         r9np3U/flCIQu+g39FMS1/EUXvtuvEPiC+mwqxVO3NsvOE2nSykM5EhktOtnoMiX7UXl
         rWUkTmYYARUghf40vuxytH4mk6Z/nD1E80lWK0DQ5x6ivlqjKJ2nwEwHvaueCIop5Dcq
         Abf3zysOg/IX3joD0bJcF46dqA49q4WQwJRCXJg/cpg8iures6kt1SJkiBm3pX/1OjDg
         RRyw==
X-Gm-Message-State: AOJu0Yxgi2+jTV4fNJZSnVujY1m5GZEQ5T5czoLiZkqdbvCAnk8HrGP4
	145Bd2jYdx8IZKgi8A/nyBbvh3LCE9EUXr5yufnQluweJUcGxTWYRQeRLYz2/2/hZsbZNEsPrDM
	M+v7lNk+t4w==
X-Gm-Gg: ASbGncuWYWR37A/ELPrnyv+1kzeGDo6jyYSh20Tu2Bb6EmgRmu8ts58jZZ+iYCefOZC
	jQx7LHQeYFgenbG4TTroTqiESpOhh6sbmciOzPogj5fhe2bWJvRzOOsiSSdGNfVLb4GRnh+31As
	hQehj24Xz9BOnCapAM/FpxMubqR0gUfI2VUSP5Db5xPRMcPzxxuuoxXTfp43eozEi+SP6DypSyw
	e5deM6mt5qahLBj4gG7SVoc9pdK62LnVBpfay6qaAgwP31QtlZZkzf16PfTYUkILTA8kbn/gXH3
	YSak9JuEu/1OynpavCjUUM6irLuFcIg21ISISiAYOZ7nQPcquzaAR7QlfnWYvX2g31ymHWCODMU
	/Jkt6smNhWIAtuMVINlj2oXkwhRjC6eBjzqwFVSZXVQRWRA==
X-Google-Smtp-Source: AGHT+IHPfekVRNza1oHlHHApBPWw80wB98FcLF5N54CE2FrBTKMCr5qBmn3s7N87TlH53I2ia8v4cA==
X-Received: by 2002:a05:600c:1d1a:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-454a372e257mr30396825e9.25.1751467291320;
        Wed, 02 Jul 2025 07:41:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/6] x86/idle: Drop incorrect smp_mb() in mwait_idle_with_hints()
Date: Wed,  2 Jul 2025 15:41:20 +0100
Message-Id: <20250702144121.1096448-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the recent simplifications, it becomes obvious that smp_mb() isn't the
right barrier; all we need is a compiler barrier.

Include this in monitor() itself, along with an explantion.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/acpi/cpu_idle.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 13040ef467a0..de020dfee87f 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -66,8 +66,12 @@ static always_inline void monitor(
     alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR,
                       [addr] "a" (addr));
 
+    /*
+     * The memory clobber is a compiler barrier.  Subseqeunt reads from the
+     * monitored cacheline must not be hoisted over MONITOR.
+     */
     asm volatile ( "monitor"
-                   :: "a" (addr), "c" (ecx), "d" (edx) );
+                   :: "a" (addr), "c" (ecx), "d" (edx) : "memory" );
 }
 
 static always_inline void mwait(unsigned int eax, unsigned int ecx)
@@ -456,7 +460,6 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
                    [in_mwait] "=m" (stat->in_mwait));
 
     monitor(this_softirq_pending, 0, 0);
-    smp_mb();
 
     if ( !*this_softirq_pending )
     {
-- 
2.39.5


