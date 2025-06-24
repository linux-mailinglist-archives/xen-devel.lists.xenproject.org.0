Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A3AE6CA0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 18:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023955.1400050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gm-0001Ax-3S; Tue, 24 Jun 2025 16:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023955.1400050; Tue, 24 Jun 2025 16:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU6gm-00017o-04; Tue, 24 Jun 2025 16:40:04 +0000
Received: by outflank-mailman (input) for mailman id 1023955;
 Tue, 24 Jun 2025 16:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7et=ZH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uU6gj-00006A-S0
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 16:40:01 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df0343e9-5119-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 18:40:00 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so40926f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 09:40:00 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e810caefsm2295472f8f.87.2025.06.24.09.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 09:39:59 -0700 (PDT)
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
X-Inumbo-ID: df0343e9-5119-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750783200; x=1751388000; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/Exz2bivC2q38JdIgYrIA5jvOxR/miT030/PESaUcw=;
        b=gm6FLfdU+BxicPVG9Gvx41u+JmUdVP0W4eEaDDIlLr2+uvQf37l4GL0gweL9kWkDP/
         lXZKcyivk4CbMPOVmLS0Mmc3TEnhAqbScJHdtnTKONcmJpS9HsQBf9Emft0znJFDqelW
         0j2s0Qcrq28iOoMeKSBjY/fCeQjSdtlE/Fzcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750783200; x=1751388000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/Exz2bivC2q38JdIgYrIA5jvOxR/miT030/PESaUcw=;
        b=uscgkfJKa1KtlupqYRykESt/JoNhsKkd2JJoLtgp+EuIL79azjEcwYk07tuF7ZHRMP
         3l4HcvCi0hWY1hne+RhfgQioug/dZONgWiE8fwXJhYQJ4a69KHd4GB5ujLObvVxAex7E
         ucKgl5t2wEdRGpejYzSpXf4Ion693HmEgRkRDg/67dQBb+UkrAANsUCdX4Cdr4Rmh5pd
         0xtiLU6sl4zPngC45kPvxyeSjgbBo+3NBs3H2pQatleP8ZPlSIhMWA4VcL9m39ePn1qO
         FNALLlQZQqojVWaGx88xZOJF2hP/PQCWVGOtGDWPZrhhLwgZswLqGqnOiJzbcVDhIjF9
         vPuQ==
X-Gm-Message-State: AOJu0Yy3lHpduld9qRWJREjHfpxpNNW+FZQW+XEn+3zO7+2Eq8CCDp3T
	bom7UWGXNvPoD+nXOi7DR8Umep7AtZRQ5DeiAA0TUXrGU7JNU+Q/C996rFQ/50smVgYaRz52GRW
	0O3GyaaDyCA==
X-Gm-Gg: ASbGncsiwX2wibqH1GRtBaL0Zt+LUkvyXLgCVJ3S3Y24SgAj8BMFOMfEuYjROUIfcv/
	yj77PCilvmU1qesJwfzIH+FapCILgi9V0K9lLISAX1t5Ftlt0nrG3hp3WMOLdgPhNDK7ZHkvmJx
	4wnQ4bf+5X7ew128nbH40ST+9GSZYN5n/nGVMvAeuIQxfS97wCvM+umSpp+kH0mFb1mj9sFTuij
	vbfwpx6asbqwK0cocUL8KEy4H3skWDHWnIoYHZHMRChPIRITtm9CJQRk7bOZzQKvhC8kE9OYLCr
	jmz38pdiyzmWYQ/ngrfJXVWkEoT8YuC5xJ7gYPhA8vkwDL9TkBJHlFeknDqv4347s9rYrkT8UUW
	ay78JLSoZmZw7mLAbyAKRr7s3cLJL0ncgfGQ=
X-Google-Smtp-Source: AGHT+IEWwnwjZMnetPkRyNK2jxOgOVLQiDgmZsM7QZSOCXMVV5F2wHw2iIdEDAE/G/vmiSZefTPDpA==
X-Received: by 2002:a05:6000:2882:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3a6e71ddb32mr4541424f8f.21.1750783199904;
        Tue, 24 Jun 2025 09:39:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] Revert part of "x86/mwait-idle: disable IBRS during long idle"
Date: Tue, 24 Jun 2025 17:39:50 +0100
Message-Id: <20250624163951.301743-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624163951.301743-1-andrew.cooper3@citrix.com>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of the patch (handling of CPUIDLE_FLAG_IBRS) is fine, but the
adjustements to mwait_idle() are not.

spec_ctrl_{enter,exit}_idle() do more than just alter MSR_SPEC_CTRL.IBRS.  The
VERW and RSB stuff are **unsafe** to omit.

The only reason this doesn't need an XSA is because no changes were made to
the lower level mwait_idle_with_hints(), and thus it remained properly
protected.

I.e. This change only served to double the expensive operations in the case it
was trying to optimise.

I have an idea of how to plumb this more nicely, but it requires larger
changes to legacy IBRS handling to not make spec_ctrl_enter_idle() vulnerable
in other ways.  In the short term, simply take out the perf hit.

Fixes: 08acdf9a2615 ("x86/mwait-idle: disable IBRS during long idle")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mwait-idle.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 9c16cc166a14..5c16f5ad3a82 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -875,7 +875,6 @@ static const struct cpuidle_state snr_cstates[] = {
 static void cf_check mwait_idle(void)
 {
 	unsigned int cpu = smp_processor_id();
-	struct cpu_info *info = get_cpu_info();
 	struct acpi_processor_power *power = processor_powers[cpu];
 	struct acpi_processor_cx *cx = NULL;
 	unsigned int next_state;
@@ -902,6 +901,8 @@ static void cf_check mwait_idle(void)
 			pm_idle_save();
 		else
 		{
+			struct cpu_info *info = get_cpu_info();
+
 			spec_ctrl_enter_idle(info);
 			safe_halt();
 			spec_ctrl_exit_idle(info);
@@ -928,11 +929,6 @@ static void cf_check mwait_idle(void)
 	if ((cx->type >= 3) && errata_c6_workaround())
 		cx = power->safe_state;
 
-	if (cx->ibrs_disable) {
-		ASSERT(!cx->irq_enable_early);
-		spec_ctrl_enter_idle(info);
-	}
-
 #if 0 /* XXX Can we/do we need to do something similar on Xen? */
 	/*
 	 * leave_mm() to avoid costly and often unnecessary wakeups
@@ -964,10 +960,6 @@ static void cf_check mwait_idle(void)
 
 	/* Now back in C0. */
 	update_idle_stats(power, cx, before, after);
-
-	if (cx->ibrs_disable)
-		spec_ctrl_exit_idle(info);
-
 	local_irq_enable();
 
 	TRACE_TIME(TRC_PM_IDLE_EXIT, cx->type, after,
-- 
2.39.5


