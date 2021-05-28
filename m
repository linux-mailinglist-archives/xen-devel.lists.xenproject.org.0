Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C23393D61
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 08:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133786.249238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWR2-0001M8-RH; Fri, 28 May 2021 06:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133786.249238; Fri, 28 May 2021 06:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWR2-0001Iq-Mf; Fri, 28 May 2021 06:57:32 +0000
Received: by outflank-mailman (input) for mailman id 133786;
 Fri, 28 May 2021 06:57:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmWR1-0001Ig-OV
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 06:57:31 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64b18428-a21e-467c-a817-0dd37c5f0d25;
 Fri, 28 May 2021 06:57:31 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B93B1FD2F;
 Fri, 28 May 2021 06:57:30 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4F6C511A98;
 Fri, 28 May 2021 06:57:30 +0000 (UTC)
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
X-Inumbo-ID: 64b18428-a21e-467c-a817-0dd37c5f0d25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622185050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ak8IN3tVVod3ou9ji6B4NVo7m0cuBbHRqWFoAb1mI0s=;
	b=XkvoW5xFonH7DFz/0V2StfxJJAB8PS2xOP6jcXMSHYH21sEeClWrm1iS2VYrQgtl0Gbavm
	hVddnQ6uvWmwSfiEyEYJkKG6yXGo2WkozkU/JmoX89lrW1CO4r8bJNlKGrPY0L0PQcDpT+
	lRKrtCTOKyD3s2RnGNRZnxK17aJvzdc=
Subject: [PATCH v2 2/2] x86/AMD: drop MSR_K7_HWCR
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
Message-ID: <3d1680ea-1089-3d25-db0d-06b5eab3f7a4@suse.com>
Date: Fri, 28 May 2021 08:57:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We don't support any K7 (32-bit only) hardware anymore, and the MSR is
accessible as MSR_K8_HWCR as well. Using the K7 name was particularly
odd for Hygon as well as in a Fam0F-specific piece of code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
Of course there are more MSR_K7_* left - we'll have to convert them over
time.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -694,9 +694,9 @@ static void init_amd(struct cpuinfo_x86
 	 * Errata 122 for all steppings (F+ have it disabled by default)
 	 */
 	if (c->x86 == 15) {
-		rdmsrl(MSR_K7_HWCR, value);
+		rdmsrl(MSR_K8_HWCR, value);
 		value |= 1 << 6;
-		wrmsrl(MSR_K7_HWCR, value);
+		wrmsrl(MSR_K8_HWCR, value);
 	}
 
 	/*
@@ -928,9 +928,9 @@ static void init_amd(struct cpuinfo_x86
 	}
 
 	if (cpu_has(c, X86_FEATURE_EFRO)) {
-		rdmsr(MSR_K7_HWCR, l, h);
+		rdmsr(MSR_K8_HWCR, l, h);
 		l |= (1 << 27); /* Enable read-only APERF/MPERF bit */
-		wrmsr(MSR_K7_HWCR, l, h);
+		wrmsr(MSR_K8_HWCR, l, h);
 	}
 
 	/* Prevent TSC drift in non single-processor, single-core platforms. */
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -70,9 +70,9 @@ static void init_hygon(struct cpuinfo_x8
 		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
 
 	if (cpu_has(c, X86_FEATURE_EFRO)) {
-		rdmsrl(MSR_K7_HWCR, value);
+		rdmsrl(MSR_K8_HWCR, value);
 		value |= (1 << 27); /* Enable read-only APERF/MPERF bit */
-		wrmsrl(MSR_K7_HWCR, value);
+		wrmsrl(MSR_K8_HWCR, value);
 	}
 
 	amd_log_freq(c);
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -295,7 +295,6 @@
 #define MSR_K7_CLK_CTL			0xc001001b
 #define MSR_K8_TOP_MEM2			0xc001001d
 
-#define MSR_K7_HWCR			0xc0010015
 #define MSR_K8_HWCR			0xc0010015
 #define K8_HWCR_MON_MWAIT_USER_EN	(1ULL << 10)
 #define K8_HWCR_MCi_STATUS_WREN		(1ULL << 18)


