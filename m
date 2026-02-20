Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OQoCdc6mGkQDgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:43:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD2166F51
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237009.1539488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNyU-00056E-R4; Fri, 20 Feb 2026 10:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237009.1539488; Fri, 20 Feb 2026 10:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNyU-00053t-Nx; Fri, 20 Feb 2026 10:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1237009;
 Fri, 20 Feb 2026 10:43:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2tad=AY=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vtNyT-00053n-M3
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 10:43:05 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecca221b-0e48-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 11:43:00 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-48375f10628so11705535e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 02:43:00 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a3dfd3d6sm22028005e9.3.2026.02.20.02.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 02:42:58 -0800 (PST)
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
X-Inumbo-ID: ecca221b-0e48-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1771584179; x=1772188979; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pzVoneESGXvvOzUPiX+drad6Xn+qjY6oGfG1hwkXseU=;
        b=AI+ny7woVjInNpSXAJnkFdU29byAMU1N4AP1dP7WLCNQDTrPb7gHuxHyNQs/6ur73m
         NDytLLeCBJjrbwuIflSI0tdXSG4w2uOuM3FQLRa8jaDxQWHDokmwJfMlgxw+L1X8RtEe
         1QOdGCpUNjNLH4f8d+dS2iQf8PgJ9nj9DIJUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771584179; x=1772188979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzVoneESGXvvOzUPiX+drad6Xn+qjY6oGfG1hwkXseU=;
        b=alkfgjYqKTBq70x5i1AZCD7Sm13ATEa/FwV0l9cPjgI7DCgXIjGk+hf/sPhx6xpVKu
         E8AaNNkYLvCTHmNxf4BwwkwV/uWGQ77FJFqSd4okWlEw5UXqORfw2ITB3gTClP5zBoJd
         /DLbi8Gs2yVEAgbg/31uoR5OJ/gyj2P8kx5e5R2xYt9Lhx/oPKC1PHS/AefHz/E0rZiz
         DHYOXMKfipetl4wahbBE7xO0t3PeXSUmQR0gdOYMap0EMSwWopy9+rwh7hDdKXk1vanw
         5KrPheVlNzxPWaBU8plrvYIWpO7skmA1JYA+CpJFdZodcIE4HkLSStaTM88o/4yn0s14
         Kt4Q==
X-Gm-Message-State: AOJu0YwnY64pnlPjdw+jrnKuMW0vJtL2q2nhb9/3JOyaP7F/WYfgGWAN
	pg29GdAWdvtoxm42mcrInz1TbQGQIC5FxLyG/XjWh0A3V3Q0sfndHRFEM+/yzxVZhJztQbA58ve
	eIhZdibQvn4aN
X-Gm-Gg: AZuq6aJyPWfrW0xgdlmn8O1w61X5ek1O/5xRCf0HComhnyHV2txtOy+7Iej+esBGs+5
	KZyFL68Qj9fGBm8wRV2MEh07/f0gVcMEJhO6hO5JN7rw4gVogUNbBIcA1MOohh+hxkUcG4gAh2s
	ugMt5Ovf1WhG1FZuZYRKQGtn/06Q4776oIMxm5YhBilDIpsnvZAOhjSe3rBqWHWJEEZohb+DI8m
	+kCs/jgl4zSgM6N7sltli2vZrYo+dyObOkTy09Wd9tiYjWzNiMej45l5FijA5PeNEW6TXCI9ugI
	5zSiZTyHGoscYx6VDVgUvNOCAB+MlIEgE/oeafAfRIp70XzBEfDkRQF1eRSRO+2ib/3pXjkqh3a
	BvB56GGElxg4JB2wPQE8C2VJDRRtIFlHRTsSh+jsLKBGuuX6+RtGKbOl0jjXGCvejD6+7um1ANL
	/J8pkHuNNkTIzVgkNtUqeOtvaTKN4ixYvBX1u+hJmbH0XKjgUjQeTuBQhVx1lDEn0eUKMM8bc=
X-Received: by 2002:a05:600c:4744:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-4839e66d920mr89358325e9.34.1771584178584;
        Fri, 20 Feb 2026 02:42:58 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	kevin.lampis@citrix.com
Subject: [PATCH] x86/cpu/intel: Limit the non-architectural constant_tsc model checks
Date: Fri, 20 Feb 2026 10:42:57 +0000
Message-Id: <20260220104257.3405712-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,intel.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A5AD2166F51
X-Rspamd-Action: no action

From: Sohil Mehta <sohil.mehta@intel.com>

X86_FEATURE_CONSTANT_TSC is a Linux-defined, synthesized feature flag.
It is used across several vendors. Intel CPUs will set the feature when
the architectural CPUID.80000007.EDX[1] bit is set. There are also some
Intel CPUs that have the X86_FEATURE_CONSTANT_TSC behavior but don't
enumerate it with the architectural bit.  Those currently have a model
range check.

Today, virtually all of the CPUs that have the CPUID bit *also* match
the "model >= 0x0e" check. This is confusing. Instead of an open-ended
check, pick some models (INTEL_IVYBRIDGE and P4_WILLAMETTE) as the end
of goofy CPUs that should enumerate the bit but don't.  These models are
relatively arbitrary but conservative pick for this.

This makes it obvious that later CPUs (like Family 18+) no longer need
to synthesize X86_FEATURE_CONSTANT_TSC.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://lore.kernel.org/r/20250219184133.816753-14-sohil.mehta@intel.com
Link: https://git.kernel.org/tip/fadb6f569b10bf668677add876ed50586931b8f3
[Port to Xen]
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/cpu/intel.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 584588e406f2..18b3c79dc97f 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -637,14 +637,13 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
-		(c->x86 == 0x6 && c->x86_model >= 0x0e))
-		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 	if (cpu_has(c, X86_FEATURE_ITSC)) {
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
-	}
+	} else if ((c->vfm >= INTEL_P4_PRESCOTT && c->vfm <= INTEL_P4_CEDARMILL) ||
+	           (c->vfm >= INTEL_CORE_YONAH && c->vfm <= INTEL_IVYBRIDGE))
+		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 
 	if ((opt_cpu_info && !(c->apicid & (c->x86_num_siblings - 1))) ||
 	    c == &boot_cpu_data )

base-commit: 52e801093b6d9f72944328925588b227d7114f8e
-- 
2.39.5


